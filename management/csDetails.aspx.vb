Imports System.Data.SqlClient

Public Class csDetails
    Inherits System.Web.UI.Page

    Protected proposedTitle As String = ""

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            Dim caseStudyId As Integer
            If Integer.TryParse(Request.QueryString("id"), caseStudyId) Then
                LoadCaseStudyDetails(caseStudyId)
            Else
                Response.Redirect("case-studies.aspx")
            End If
        End If
    End Sub

    Private Sub LoadCaseStudyDetails(caseStudyId As Integer)
        Dim connString As String = Common.GetConnString()

        Try
            Using conn As New SqlConnection(connString)
                conn.Open()

                Dim sql As String = "SELECT proposedTitle, workingFolder, finalWordFile, notes FROM csstudies WHERE id = @id"
                Using cmd As New SqlCommand(sql, conn)
                    cmd.Parameters.AddWithValue("@id", caseStudyId)

                    Using reader As SqlDataReader = cmd.ExecuteReader()
                        If reader.Read() Then
                            proposedTitle = reader("proposedTitle").ToString()
                            txtWorkingFolder.Text = If(IsDBNull(reader("workingFolder")), "", reader("workingFolder").ToString())
                            txtFinalWordFile.Text = If(IsDBNull(reader("finalWordFile")), "", reader("finalWordFile").ToString())
                            txtNotes.Text = If(IsDBNull(reader("notes")), "", reader("notes").ToString())
                        Else
                            Response.Redirect("case-studies.aspx") ' Redirect if case study is not found
                        End If
                    End Using
                End Using
            End Using
        Catch ex As Exception
            Response.Write("<p>Error loading case study details: " & ex.Message & "</p>")
        End Try
    End Sub

    Protected Sub btnSave_Click(ByVal sender As Object, ByVal e As EventArgs)
        Dim caseStudyId As Integer
        If Not Integer.TryParse(Request.QueryString("id"), caseStudyId) Then
            Response.Redirect("case-studies.aspx")
        End If

        Dim connString As String = Common.GetConnString()

        Try
            Using conn As New SqlConnection(connString)
                conn.Open()

                Dim sql As String = "UPDATE csstudies SET workingFolder = @workingFolder, finalWordFile = @finalWordFile, notes = @notes WHERE id = @id"
                Using cmd As New SqlCommand(sql, conn)
                    cmd.Parameters.AddWithValue("@workingFolder", txtWorkingFolder.Text)
                    cmd.Parameters.AddWithValue("@finalWordFile", txtFinalWordFile.Text)
                    cmd.Parameters.AddWithValue("@notes", txtNotes.Text)
                    cmd.Parameters.AddWithValue("@id", caseStudyId)

                    cmd.ExecuteNonQuery()
                End Using
            End Using

            ' Redirect to case-studies.aspx after saving
            Response.Redirect("case-studies.aspx")
        Catch ex As Exception
            Response.Write("<p>Error saving case study details: " & ex.Message & "</p>")
        End Try
    End Sub
End Class
