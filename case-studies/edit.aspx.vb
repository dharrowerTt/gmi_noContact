Imports System.Data.SqlClient

Partial Class csEdit
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            LoadCaseStudyData()
            SetVersionNavigationButtons()
        End If
    End Sub

    Private Sub LoadCaseStudyData()
        ' Get the ID and version of the case study from the query string
        Dim id As Integer = Convert.ToInt32(Request.QueryString("id"))
        Dim version As Integer = If(String.IsNullOrEmpty(Request.QueryString("version")), GetLatestVersion(id), Convert.ToInt32(Request.QueryString("version")))

        Using conn As New SqlConnection(Common.GetConnString())
            Dim sql As String = "SELECT * FROM csstudies WHERE ID = @ID AND version = @version"
            Using cmd As New SqlCommand(sql, conn)
                cmd.Parameters.AddWithValue("@ID", id)
                cmd.Parameters.AddWithValue("@version", version)
                conn.Open()
                Dim reader As SqlDataReader = cmd.ExecuteReader()
                If reader.Read() Then
                    txtSubmitterName.Text = reader("submitterName").ToString()
                    txtSubmitterEmail.Text = reader("submitterEmail").ToString()
                    txtSubmitterOrg.Text = reader("submitterOrg").ToString()
                    txtPartners.Text = reader("partners").ToString()
                    txtCaseStudyTitle.Text = reader("csTitle").ToString()
                    txtCaseStudyLocation.Text = reader("csLocation").ToString()
                    txtBriefSummary.Text = reader("briefSummary").ToString()
                    txtKeywords.Text = reader("keywords").ToString()
                    txtGmiSectors.Text = reader("gmiSectors").ToString()
                    txtOtherSectors.Text = reader("otherSectors").ToString()
                    txtRegionalApplicability.Text = reader("regionalApplicability").ToString()
                    txtCountryApplicability.Text = reader("countryApplicability").ToString()
                    txtSource.Text = reader("source").ToString()
                    txtTopics.Text = reader("topics").ToString()

                    If Convert.ToBoolean(reader("availableOnline")) Then
                        rblCaseStudyOnline.SelectedValue = "Yes"
                        txtCaseStudyUrl.Text = reader("url").ToString()
                        txtCsPubDate.Text = If(reader("csPubDate") IsNot DBNull.Value, Convert.ToDateTime(reader("csPubDate")).ToString("yyyy-MM-dd"), String.Empty)
                    Else
                        rblCaseStudyOnline.SelectedValue = "No"
                    End If

                    ddlStatus.SelectedValue = reader("status").ToString()
                    lblVersionNumber.Text = version.ToString()
                End If
            End Using
        End Using
    End Sub

    Private Function GetLatestVersion(id As Integer) As Integer
        Using conn As New SqlConnection(Common.GetConnString())
            Dim sql As String = "SELECT MAX(version) FROM csstudies WHERE ID = @ID"
            Using cmd As New SqlCommand(sql, conn)
                cmd.Parameters.AddWithValue("@ID", id)
                conn.Open()
                Return Convert.ToInt32(cmd.ExecuteScalar())
            End Using
        End Using
    End Function

    Private Sub SetVersionNavigationButtons()
        Dim currentVersion As Integer = Convert.ToInt32(lblVersionNumber.Text)
        Dim latestVersion As Integer = GetLatestVersion(Convert.ToInt32(Request.QueryString("id")))

        btnPreviousVersion.Enabled = currentVersion > 1
        btnNextVersion.Enabled = currentVersion < latestVersion
    End Sub

    Protected Sub btnPreviousVersion_Click(sender As Object, e As EventArgs)
        Dim currentVersion As Integer = Convert.ToInt32(lblVersionNumber.Text)
        Dim targetVersion As Integer = currentVersion - 1
        Response.Redirect($"edit.aspx?id={Request.QueryString("id")}&version={targetVersion}")
    End Sub

    Protected Sub btnNextVersion_Click(sender As Object, e As EventArgs)
        Dim currentVersion As Integer = Convert.ToInt32(lblVersionNumber.Text)
        Dim targetVersion As Integer = currentVersion + 1
        Response.Redirect($"edit.aspx?id={Request.QueryString("id")}&version={targetVersion}")
    End Sub

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        ' Increment version number and insert a new row
        Dim id As Integer = Convert.ToInt32(Request.QueryString("id"))
        Dim newVersion As Integer

        Using conn As New SqlConnection(Common.GetConnString())
            conn.Open()

            ' Get the highest version number for this parent ID
            Dim getVersionSql As String = "SELECT MAX(version) FROM csstudies WHERE parent = @parent"
            Using getVersionCmd As New SqlCommand(getVersionSql, conn)
                getVersionCmd.Parameters.AddWithValue("@parent", id)
                newVersion = Convert.ToInt32(getVersionCmd.ExecuteScalar()) + 1
            End Using

            ' Insert a new row with the incremented version number
            Dim sql As String = "INSERT INTO csstudies (submitterName, submitterEmail, submitterOrg, partners, csTitle, csLocation, topics, startDate, endDate, gmiSectors, otherSectors, regionalApplicability, countryApplicability, briefSummary, keywords, availableOnline, url, poc, source, csPubDate, status, version, parent) " &
                                "VALUES (@SubmitterName, @SubmitterEmail, @SubmitterOrg, @Partners, @CaseStudyTitle, @CaseStudyLocation, @Topics, @StartDate, @EndDate, @GMISectors, @OtherSectors, @RegionalApplicability, @CountryApplicability, @BriefSummary, @Keywords, @AvailableOnline, @URL, @PocInfo, @Source, @CsPubDate, @Status, @Version, @parent)"

            Using cmd As New SqlCommand(sql, conn)
                cmd.Parameters.AddWithValue("@SubmitterName", txtSubmitterName.Text)
                cmd.Parameters.AddWithValue("@SubmitterEmail", txtSubmitterEmail.Text)
                cmd.Parameters.AddWithValue("@SubmitterOrg", txtSubmitterOrg.Text)
                cmd.Parameters.AddWithValue("@Partners", txtPartners.Text)
                cmd.Parameters.AddWithValue("@CaseStudyTitle", txtCaseStudyTitle.Text)
                cmd.Parameters.AddWithValue("@CaseStudyLocation", txtCaseStudyLocation.Text)
                cmd.Parameters.AddWithValue("@Topics", txtTopics.Text)
                cmd.Parameters.AddWithValue("@StartDate", txtStartDate.Text)
                cmd.Parameters.AddWithValue("@EndDate", If(String.IsNullOrEmpty(txtEndDate.Text), CType(DBNull.Value, Object), txtEndDate.Text))
                cmd.Parameters.AddWithValue("@GMISectors", txtGmiSectors.Text)
                cmd.Parameters.AddWithValue("@OtherSectors", txtOtherSectors.Text)
                cmd.Parameters.AddWithValue("@RegionalApplicability", txtRegionalApplicability.Text)
                cmd.Parameters.AddWithValue("@CountryApplicability", txtCountryApplicability.Text)
                cmd.Parameters.AddWithValue("@BriefSummary", txtBriefSummary.Text)
                cmd.Parameters.AddWithValue("@Keywords", txtKeywords.Text)
                cmd.Parameters.AddWithValue("@AvailableOnline", rblCaseStudyOnline.SelectedValue = "Yes")
                cmd.Parameters.AddWithValue("@URL", txtCaseStudyUrl.Text)
                cmd.Parameters.AddWithValue("@PocInfo", txtPocInfo.Text)
                cmd.Parameters.AddWithValue("@Source", txtSource.Text)
                cmd.Parameters.AddWithValue("@CsPubDate", If(String.IsNullOrEmpty(txtCsPubDate.Text), CType(DBNull.Value, Object), txtCsPubDate.Text))
                cmd.Parameters.AddWithValue("@Status", ddlStatus.SelectedValue)
                cmd.Parameters.AddWithValue("@Version", newVersion)
                cmd.Parameters.AddWithValue("@parent", id)

                cmd.ExecuteNonQuery()
            End Using
        End Using

        lblErrorMessage.Text = "Case Study updated successfully!"
        lblErrorMessage.CssClass = "text-success"
        lblErrorMessage.Visible = True

        ' Redirect back to the details page
        Response.Redirect("toolbox.aspx")
    End Sub
End Class
