Imports System.Data.SqlClient

Public Class details
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            Dim caseStudyID As Integer

            ' Check if the ID parameter is provided; if not, pick a random number between 1 and 130
            If Integer.TryParse(Request.QueryString("id"), caseStudyID) Then
                LoadCaseStudyDetails(caseStudyID)
                LoadRelatedCaseStudies(caseStudyID)
            Else
                Dim rand As New Random()
                caseStudyID = rand.Next(1, 131) ' Generates a random number between 1 and 130
                LoadCaseStudyDetails(caseStudyID)
                LoadRelatedCaseStudies(caseStudyID)
            End If
        End If
    End Sub

    ' This method loads the details of the specified case study
    Private Sub LoadCaseStudyDetails(ByVal id As Integer)
        Dim connString As String = Common.GetConnString()
        Using conn As New SqlConnection(connString)
            Dim cmd As New SqlCommand("SELECT * FROM csCaseStudyRecords WHERE ID = @ID", conn)
            cmd.Parameters.AddWithValue("@ID", id)
            conn.Open()

            Using reader As SqlDataReader = cmd.ExecuteReader()
                If reader.Read() Then
                    ' Replace placeholders with actual data
                    If Not IsDBNull(reader("thumbnail")) AndAlso Not String.IsNullOrWhiteSpace(reader("thumbnail").ToString()) Then
                        imgThumbnail.Src = "thumbs/" & reader("thumbnail").ToString()
                    End If

                    linkBackToStudies.HRef = "index.aspx"

                    If Not IsDBNull(reader("csTitle")) AndAlso Not String.IsNullOrWhiteSpace(reader("csTitle").ToString()) Then
                        lblTitle.InnerHtml = reader("csTitle").ToString()
                    End If

                    If Not IsDBNull(reader("url")) AndAlso Not String.IsNullOrWhiteSpace(reader("url").ToString()) Then
                        btnViewCaseStudy.NavigateUrl = reader("url").ToString()
                    End If

                    If Not IsDBNull(reader("briefSummary")) AndAlso Not String.IsNullOrWhiteSpace(reader("briefSummary").ToString()) Then
                        litBriefSummary.Text = reader("briefSummary").ToString()
                    End If

                    ' Sidebar Fields
                    If Not IsDBNull(reader("gmiSectors")) AndAlso Not String.IsNullOrWhiteSpace(reader("gmiSectors").ToString()) Then
                        Dim sectors As String() = reader("gmiSectors").ToString().Split(";"c)
                        Dim formattedSectors As String = "<ul>" & String.Join("", sectors.Select(Function(s) $"<li>{s.Trim()}</li>")) & "</ul>"
                        litGmiSectors.Text = $"<p><strong>GMI Sectors:</strong>{formattedSectors}</p>"
                        litGmiSectors.Visible = True
                    End If

                    If Not IsDBNull(reader("topics")) AndAlso Not String.IsNullOrWhiteSpace(reader("topics").ToString()) Then
                        Dim topics As String() = reader("topics").ToString().Split(";"c)
                        Dim formattedTopics As String = "<ul>" & String.Join("", topics.Select(Function(t) $"<li>{t.Trim()}</li>")) & "</ul>"
                        litTopics.Text = $"<p><strong>Topics:</strong>{formattedTopics}</p>"
                        litTopics.Visible = True
                    End If

                    If Not IsDBNull(reader("countryApplicability")) AndAlso Not String.IsNullOrWhiteSpace(reader("countryApplicability").ToString()) Then
                        Dim countries As String() = reader("countryApplicability").ToString().Split(";"c)
                        Dim formattedCountries As String = "<div class='country-list'>" & String.Join(" ", countries.Select(Function(c) $"<span class='country-pill'>{c.Trim()}</span>")) & "</div>"
                        litCountryApplicability.Text = $"<p><strong>Country Applicability:</strong>{formattedCountries}</p>"
                        litCountryApplicability.Visible = True
                    End If

                    If Not IsDBNull(reader("startDate")) AndAlso DateTime.TryParse(reader("startDate").ToString(), Nothing) Then
                        litStartDate.Text = $"<p><strong>Start Date:</strong> {DateTime.Parse(reader("startDate").ToString()).ToString("yyyy")}</p>"
                        litStartDate.Visible = True
                    End If

                    ' Partners Section
                    If Not IsDBNull(reader("partners")) AndAlso Not String.IsNullOrWhiteSpace(reader("partners").ToString()) Then
                        Dim partners As String() = reader("partners").ToString().Split(";"c)
                        Dim formattedPartners As String = "<ul>" & String.Join("", partners.Select(Function(p) $"<li>{p.Trim()}</li>")) & "</ul>"
                        litBriefSummary.Text &= $"<br><br><h3>Partners</h3>{formattedPartners}"
                    End If

                    ' Learn More Button (in the sidebar)
                    If Not IsDBNull(reader("learnmoreURL")) AndAlso Not String.IsNullOrWhiteSpace(reader("learnmoreURL").ToString()) Then
                        Dim learnMoreUrl As String = reader("learnmoreURL").ToString()
                        Dim learnMoreButton As String = $"<a href='{learnMoreUrl}' class='btn btn-secondary mt-3 btn-block'>Learn More</a>"
                        litLearnMoreButton.Text = learnMoreButton
                        litLearnMoreButton.Visible = True
                    End If
                Else
                    Response.Redirect("index.aspx") ' Redirect if ID not found
                End If
            End Using
        End Using
    End Sub



    ' This method loads related case studies based on countryApplicability
    Private Sub LoadRelatedCaseStudies(ByVal id As Integer)
        Dim connString As String = Common.GetConnString()
        Using conn As New SqlConnection(connString)
            ' Get the countries of the current case study
            Dim getCountryCmd As New SqlCommand("SELECT countryApplicability FROM csCaseStudyRecords WHERE ID = @ID", conn)
            getCountryCmd.Parameters.AddWithValue("@ID", id)
            conn.Open()

            Dim currentCountries As String = getCountryCmd.ExecuteScalar()?.ToString()

            If Not String.IsNullOrWhiteSpace(currentCountries) Then
                ' Create a query to find related case studies with overlapping countries
                Dim countryConditions As String = String.Join(" OR ", currentCountries.Split(";"c).Select(Function(c) "countryApplicability LIKE '%" & c.Trim() & "%'"))

                Dim query As String = "SELECT TOP 4 * FROM csCaseStudyRecords WHERE (" & countryConditions & ") AND ID <> @ID ORDER BY NEWID()"

                Dim cmd As New SqlCommand(query, conn)
                cmd.Parameters.AddWithValue("@ID", id)

                Using reader As SqlDataReader = cmd.ExecuteReader()
                    rptRelatedCaseStudies.DataSource = reader
                    rptRelatedCaseStudies.DataBind()
                End Using
            End If
        End Using
    End Sub
End Class
