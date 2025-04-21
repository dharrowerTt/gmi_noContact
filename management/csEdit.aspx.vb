Imports System.Data.SqlClient

Public Class csEdit1
    Inherits System.Web.UI.Page

    Private connString As String = Common.GetConnString()

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            PopulateMultiSelects()

            Dim id As Integer
            If Integer.TryParse(Request.QueryString("id"), id) Then
                LoadCaseStudy(id)
            End If
        End If
    End Sub

    Private Sub PopulateMultiSelects()
        Dim queryTopics As String = "SELECT DISTINCT topics FROM csCaseStudyRecords WHERE topics IS NOT NULL"
        Dim querySectors As String = "SELECT DISTINCT gmiSectors FROM csCaseStudyRecords WHERE gmiSectors IS NOT NULL"
        Dim countryList As String() = {"United States", "Canada", "Germany", "India", "China"} ' Replace with actual country list.

        ' Populate Topics Dropdown
        PopulateDropdown(ddlTopics, queryTopics)

        ' Populate GMI Sectors Dropdown
        PopulateDropdown(ddlGMISectors, querySectors)

        ' Populate Country Applicability Dropdown
        ddlCountryApplicability.DataSource = countryList.OrderBy(Function(c) c).ToList()
        ddlCountryApplicability.DataBind()
    End Sub

    Private Sub PopulateDropdown(dropdown As DropDownList, query As String)
        Using conn As New SqlConnection(connString)
            Using cmd As New SqlCommand(query, conn)
                conn.Open()
                Dim reader As SqlDataReader = cmd.ExecuteReader()
                Dim items As New HashSet(Of String)(StringComparer.OrdinalIgnoreCase)

                While reader.Read()
                    Dim values As String() = reader(0).ToString().Split(";"c).Select(Function(s) s.Trim()).ToArray()
                    items.UnionWith(values)
                End While

                dropdown.DataSource = items.OrderBy(Function(i) i).ToList()
                dropdown.DataBind()
            End Using
        End Using
    End Sub

    Private Sub LoadCaseStudy(ByVal id As Integer)
        Dim query As String = "SELECT * FROM csCaseStudyRecords WHERE id = @id"

        Using conn As New SqlConnection(connString)
            Using cmd As New SqlCommand(query, conn)
                cmd.Parameters.AddWithValue("@id", id)
                conn.Open()

                Using reader As SqlDataReader = cmd.ExecuteReader()
                    If reader.Read() Then
                        txtSubmitterName.Text = reader("submitterName").ToString()
                        txtSubmitterEmail.Text = reader("submitterEmail").ToString()
                        txtSubmitterOrg.Text = reader("submitterOrg").ToString()
                        txtCSTitle.Text = reader("csTitle").ToString()
                        txtCSLocation.Text = reader("csLocation").ToString()
                        txtPartners.Text = reader("partners").ToString()
                        txtCSPubDate.Text = If(reader("csPubDate") IsNot DBNull.Value, Convert.ToDateTime(reader("csPubDate")).ToString("yyyy-MM-dd"), "")
                        txtBriefSummary.Text = reader("briefSummary").ToString()
                        txtURL.Text = reader("url").ToString()
                        txtLearnMoreURL.Text = reader("learnmoreURL").ToString()
                        ddlCSType.SelectedValue = reader("csType").ToString()
                        ' Handle Multi-Select Fields
                        SelectMultiSelectValues(ddlTopics, reader("topics").ToString())
                        SelectMultiSelectValues(ddlGMISectors, reader("gmiSectors").ToString())
                        SelectMultiSelectValues(ddlCountryApplicability, reader("countryApplicability").ToString())
                    End If
                End Using
            End Using
        End Using
    End Sub

    Private Sub SelectMultiSelectValues(dropdown As DropDownList, values As String)
        Dim selectedValues As HashSet(Of String) = New HashSet(Of String)(values.Split(";"c).Select(Function(v) v.Trim()))
        For Each item As ListItem In dropdown.Items
            If selectedValues.Contains(item.Value) Then
                item.Selected = True
            End If
        Next
    End Sub

    Protected Sub btnSubmit_Click(ByVal sender As Object, ByVal e As EventArgs) Handles btnSubmit.Click
        Dim id As Integer
        If Integer.TryParse(Request.QueryString("id"), id) Then
            UpdateCaseStudy(id)
        Else
            InsertCaseStudy()
        End If
    End Sub

    Private Sub UpdateCaseStudy(ByVal id As Integer)
        Dim query As String = "UPDATE csCaseStudyRecords SET 
                                submitterName = @submitterName,
                                submitterEmail = @submitterEmail,
                                submitterOrg = @submitterOrg,
                                csTitle = @csTitle,
                                csLocation = @csLocation,
                                partners = @partners,
                                csPubDate = @csPubDate,
                                briefSummary = @briefSummary,
                                topics = @topics,
                                gmiSectors = @gmiSectors,
                                countryApplicability = @countryApplicability,
                                url = @url,
                                learnmoreURL = @learnmoreURL,
                                csType = @csType
                               WHERE id = @id"

        ExecuteQuery(query, id)
    End Sub

    Private Sub InsertCaseStudy()
        Dim query As String = "INSERT INTO csCaseStudyRecords 
                                (submitterName, submitterEmail, submitterOrg, csTitle, csLocation, partners, csPubDate, briefSummary, topics, gmiSectors, countryApplicability, url, learnmoreURL, csType)
                               VALUES (@submitterName, @submitterEmail, @submitterOrg, @csTitle, @csLocation, @partners, @csPubDate, @briefSummary, @topics, @gmiSectors, @countryApplicability, @url, @learnmoreURL, @csType)"

        ExecuteQuery(query)
    End Sub

    Private Sub ExecuteQuery(ByVal query As String, Optional ByVal id As Integer? = Nothing)
        Using conn As New SqlConnection(connString)
            Using cmd As New SqlCommand(query, conn)
                cmd.Parameters.AddWithValue("@submitterName", txtSubmitterName.Text)
                cmd.Parameters.AddWithValue("@submitterEmail", txtSubmitterEmail.Text)
                cmd.Parameters.AddWithValue("@submitterOrg", txtSubmitterOrg.Text)
                cmd.Parameters.AddWithValue("@csTitle", txtCSTitle.Text)
                cmd.Parameters.AddWithValue("@csLocation", txtCSLocation.Text)
                cmd.Parameters.AddWithValue("@partners", txtPartners.Text)
                cmd.Parameters.AddWithValue("@csPubDate", If(String.IsNullOrEmpty(txtCSPubDate.Text), DBNull.Value, txtCSPubDate.Text))
                cmd.Parameters.AddWithValue("@briefSummary", txtBriefSummary.Text)
                cmd.Parameters.AddWithValue("@topics", String.Join(";", ddlTopics.Items.Cast(Of ListItem).Where(Function(i) i.Selected).Select(Function(i) i.Value)))
                cmd.Parameters.AddWithValue("@gmiSectors", String.Join(";", ddlGMISectors.Items.Cast(Of ListItem).Where(Function(i) i.Selected).Select(Function(i) i.Value)))
                cmd.Parameters.AddWithValue("@countryApplicability", String.Join(";", ddlCountryApplicability.Items.Cast(Of ListItem).Where(Function(i) i.Selected).Select(Function(i) i.Value)))
                cmd.Parameters.AddWithValue("@url", If(chkAvailableOnline.Checked, txtURL.Text, DBNull.Value))
                cmd.Parameters.AddWithValue("@learnmoreURL", txtLearnMoreURL.Text)
                cmd.Parameters.AddWithValue("@csType", ddlCSType.SelectedValue)

                ' Handle thumbnail upload
                If fileThumbnail.HasFile Then
                    Dim savePath As String = Server.MapPath("~/thumbnails/") & fileThumbnail.FileName
                    fileThumbnail.SaveAs(savePath)
                    cmd.Parameters.AddWithValue("@thumbnail", "thumbnails/" & fileThumbnail.FileName)
                Else
                    cmd.Parameters.AddWithValue("@thumbnail", DBNull.Value)
                End If

                If id.HasValue Then
                    cmd.Parameters.AddWithValue("@id", id.Value)
                End If

                conn.Open()
                cmd.ExecuteNonQuery()
            End Using
        End Using

        Response.Redirect("csLibrary.aspx")
    End Sub

End Class
