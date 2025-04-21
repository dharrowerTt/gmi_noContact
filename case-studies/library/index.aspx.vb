Imports System.Data.SqlClient

Public Class index13
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            BindCaseStudies()
            BindFeaturedCaseStudies()
        End If
    End Sub

    Protected Function GradientStyle(index As Integer) As String
        Dim gradients As String() = {
        "background: linear-gradient(to bottom right, rgba(100,149,237,0.7), rgba(25,25,112,0.8));",
        "background: linear-gradient(to top right, rgba(0,128,128,0.6), rgba(72,61,139,0.9));",
        "background: linear-gradient(to bottom, rgba(255,165,0,0.7), rgba(139,69,19,0.9));"
    }
        Return gradients(index Mod gradients.Length)
    End Function


    Private Sub BindFeaturedCaseStudies()
        Dim connString As String = Common.GetConnString()
        Dim featuredQuery As String = "SELECT csID FROM csFeatured"
        Dim caseStudyQuery As String = "SELECT ID, thumbnail, csTitle, url FROM csCaseStudyRecords WHERE ID IN (@caseStudyIDs)"

        Using conn As New SqlConnection(connString)
            Using featuredCmd As New SqlCommand(featuredQuery, conn)
                conn.Open()
                Dim featuredIDs As New List(Of Integer)

                ' Get the list of featured case study IDs
                Using reader As SqlDataReader = featuredCmd.ExecuteReader()
                    While reader.Read()
                        featuredIDs.Add(reader.GetInt32(0))
                    End While
                End Using

                ' If there are featured case studies, fetch their details
                If featuredIDs.Count > 0 Then
                    ' Build the IN clause dynamically based on the number of IDs
                    Dim inClause As String = String.Join(",", featuredIDs.Select(Function(id) id.ToString()))
                    caseStudyQuery = caseStudyQuery.Replace("@caseStudyIDs", inClause)

                    Using caseStudyCmd As New SqlCommand(caseStudyQuery, conn)
                        Using caseStudyReader As SqlDataReader = caseStudyCmd.ExecuteReader()
                            ' Bind data to carousel
                            rptCarousel.DataSource = caseStudyReader
                            rptCarousel.DataBind()
                        End Using
                    End Using
                End If
            End Using
        End Using
    End Sub


    Private Sub BindCaseStudies()
        Dim connString As String = Common.GetConnString()
        Dim query As String = "SELECT ID, thumbnail, csTitle, source, countryApplicability, briefSummary, gmiSectors, topics, startDate, url, csType FROM csCaseStudyRecords"

        Using conn As New SqlConnection(connString)
            Using cmd As New SqlCommand(query, conn)
                conn.Open()
                Dim reader As SqlDataReader = cmd.ExecuteReader()
                gvCaseStudies.DataSource = reader
                gvCaseStudies.DataBind()
            End Using
        End Using
    End Sub

    Protected Function FormatTags(ByVal tagString As String) As String
        Dim tags As String() = tagString.Split(";"c)
        Dim formattedTags As String = String.Join("", tags.Select(Function(tag) $"<span class='tag'>{tag}</span>"))
        Return formattedTags
    End Function

    Protected Sub gvCaseStudies_PreRender(sender As Object, e As EventArgs)
        ' This ensures that the GridView renders with the correct table structure for DataTables
        gvCaseStudies.UseAccessibleHeader = True
        gvCaseStudies.HeaderRow.TableSection = TableRowSection.TableHeader
        gvCaseStudies.FooterRow.TableSection = TableRowSection.TableFooter
    End Sub

    Protected Function FormatCountries(ByVal countries As String) As String
        If String.IsNullOrEmpty(countries) Then
            Return "N/A"
        End If

        Dim countryArray As String() = countries.Split(";"c)
        Dim result As New StringBuilder()

        For Each country As String In countryArray
            If Not String.IsNullOrWhiteSpace(country) Then
                result.AppendFormat("<span class='country-pill'>{0}</span> ", country.Trim())
            End If
        Next

        Return result.ToString().Trim()
    End Function


End Class
