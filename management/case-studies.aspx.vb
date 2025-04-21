Imports System.Data.SqlClient

Public Class case_studies
    Inherits System.Web.UI.Page

    Protected caseStudies As New List(Of Dictionary(Of String, String))()
    Protected selectedCaseStudy As Dictionary(Of String, String) = Nothing

    ' Method to load case studies for the table
    Private Sub LoadCaseStudies()
        Dim connString As String = Common.GetConnString()

        Try
            Using conn As New SqlConnection(connString)
                conn.Open()

                Dim sql As String = "SELECT id, submitterOrg, submitterName, stakeholderType, description, DateSubmitted, status, statusChangeDate, statusEditor, subStatus, workingFolder, finalWordFile FROM csstudies ORDER BY DateSubmitted DESC"
                Using cmd As New SqlCommand(sql, conn)
                    Using reader As SqlDataReader = cmd.ExecuteReader()
                        While reader.Read()
                            Dim study As New Dictionary(Of String, String)()
                            study("id") = reader("id").ToString()
                            study("submitterOrg") = reader("submitterOrg").ToString()
                            study("submitterName") = reader("submitterName").ToString()
                            study("stakeholderType") = reader("stakeholderType").ToString()
                            study("description") = reader("description").ToString()
                            study("DateSubmitted") = reader("DateSubmitted").ToString()
                            study("status") = If(IsDBNull(reader("status")), "N/A", reader("status").ToString())
                            study("statusChangeDate") = If(IsDBNull(reader("statusChangeDate")), "N/A", reader("statusChangeDate").ToString())
                            study("statusEditor") = If(IsDBNull(reader("statusEditor")), "N/A", reader("statusEditor").ToString())
                            study("subStatus") = If(IsDBNull(reader("subStatus")), "", reader("subStatus").ToString()) ' Ensure subStatus is retrieved
                            study("workingFolder") = If(IsDBNull(reader("workingFolder")), "", reader("workingFolder").ToString())
                            study("finalWordFile") = If(IsDBNull(reader("finalWordFile")), "", reader("finalWordFile").ToString())
                            caseStudies.Add(study)
                        End While
                    End Using
                End Using
            End Using
        Catch ex As Exception
            Response.Write("<p>Error loading case studies: " & ex.Message & "</p>")
        End Try
    End Sub

    ' Method to load a specific case study
    Private Sub LoadSelectedCaseStudy(ByVal caseStudyId As Integer)
        Dim connString As String = Common.GetConnString()

        Try
            Using conn As New SqlConnection(connString)
                conn.Open()

                Dim sql As String = "SELECT submitterOrg, submitterName, submitterEmail, stakeholderType, leadOrg, partnerOrg, proposedTitle, location, online, whenpublished, url, description, DateSubmitted FROM csstudies WHERE id = @id"
                Using cmd As New SqlCommand(sql, conn)
                    cmd.Parameters.AddWithValue("@id", caseStudyId)

                    Using reader As SqlDataReader = cmd.ExecuteReader()
                        If reader.Read() Then
                            selectedCaseStudy = New Dictionary(Of String, String)()
                            selectedCaseStudy("submitterOrg") = reader("submitterOrg").ToString()
                            selectedCaseStudy("submitterName") = reader("submitterName").ToString()
                            selectedCaseStudy("submitterEmail") = reader("submitterEmail").ToString()
                            selectedCaseStudy("stakeholderType") = reader("stakeholderType").ToString()
                            selectedCaseStudy("leadOrg") = reader("leadOrg").ToString()
                            selectedCaseStudy("partnerOrg") = reader("partnerOrg").ToString()
                            selectedCaseStudy("proposedTitle") = reader("proposedTitle").ToString()
                            selectedCaseStudy("location") = reader("location").ToString()
                            selectedCaseStudy("online") = reader("online").ToString()
                            selectedCaseStudy("whenpublished") = reader("whenpublished").ToString()
                            selectedCaseStudy("url") = reader("url").ToString()
                            selectedCaseStudy("description") = reader("description").ToString()
                            selectedCaseStudy("DateSubmitted") = reader("DateSubmitted").ToString()
                        Else
                            selectedCaseStudy = Nothing ' Case study not found
                        End If
                    End Using
                End Using
            End Using
        Catch ex As Exception
            Response.Write("<p>Error loading selected case study: " & ex.Message & "</p>")
        End Try
    End Sub


    ' Truncate description if it's longer than the specified length
    Protected Function TruncateDescription(ByVal description As String, ByVal maxLength As Integer) As String
        If description.Length > maxLength Then
            Return description.Substring(0, maxLength) & "..."
        Else
            Return description
        End If
    End Function

    ' Format stakeholder type by adding spaces before capital letters
    Protected Function FormatStakeholderType(ByVal stakeholderType As String) As String
        ' Add spaces before capital letters, but skip the first character
        Return System.Text.RegularExpressions.Regex.Replace(stakeholderType, "(?<!^)([A-Z])", " $1")
    End Function

    ' Page Load event
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            ' Load all case studies
            LoadCaseStudies()

            ' Check if a caseStudyId is passed as a query string parameter
            If Not String.IsNullOrEmpty(Request.QueryString("caseStudyId")) Then
                Dim caseStudyId As Integer
                ' Check if the caseStudyId can be parsed to an integer
                If Integer.TryParse(Request.QueryString("caseStudyId"), caseStudyId) Then
                    LoadSelectedCaseStudy(caseStudyId)
                Else
                    Response.Write("<p>Invalid case study ID: " & Request.QueryString("caseStudyId") & "</p>")
                End If
            End If
        End If
    End Sub
End Class
