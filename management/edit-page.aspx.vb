Imports System.IO
Imports System.Data.SqlClient

Public Class edit_page
    Inherits System.Web.UI.Page

    Protected PathToEdit As String = String.Empty

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            Dim pageId As String = Request.QueryString("id")

            If String.IsNullOrEmpty(pageId) Then
                Response.Redirect("edit-directory.aspx")
                Return
            End If

            LoadPageDetails(pageId)
        End If
    End Sub

    Private Sub LoadPageDetails(ByVal pageId As String)
        Dim connString As String = Common.GetConnString()
        Dim query As String = "SELECT displayName, path FROM EditablePages WHERE id = @id"

        Using conn As New SqlConnection(connString)
            Using cmd As New SqlCommand(query, conn)
                cmd.Parameters.AddWithValue("@id", pageId)
                conn.Open()

                Using reader As SqlDataReader = cmd.ExecuteReader()
                    If reader.Read() Then
                        Dim displayName As String = reader("displayName").ToString()
                        PathToEdit = reader("path").ToString()

                        ' Set heading and iframe source
                        pageHeading.InnerText = displayName
                        previewFrame.Attributes("src") = $"https://globalmethane.org{PathToEdit}"

                        ' Load file contents into FreeTextBox
                        If File.Exists(Server.MapPath(PathToEdit)) Then
                            ContentEditor.Text = File.ReadAllText(Server.MapPath(PathToEdit))
                        Else
                            ContentEditor.Text = "File not found. Please check the path."
                        End If
                    Else
                        Response.Redirect("edit-directory.aspx")
                    End If
                End Using
            End Using
        End Using
    End Sub

    Protected Sub SubmitChanges_Click(ByVal sender As Object, ByVal e As EventArgs)
        Dim userId As String = Session("UserEmail")?.ToString() ' Ensure session is set up for this
        If String.IsNullOrEmpty(userId) OrElse String.IsNullOrEmpty(PathToEdit) Then
            ' Handle missing session or path errors (redirect or show an error message)
            Return
        End If

        Try
            ' Save content to the file
            File.WriteAllText(Server.MapPath(PathToEdit), ContentEditor.Text)

            ' Update database record
            Dim connString As String = Common.GetConnString()
            Dim updateQuery As String = "UPDATE EditablePages SET lastEditedDate = GETDATE(), lastEditedBy = @user WHERE path = @path"

            Using conn As New SqlConnection(connString)
                Using cmd As New SqlCommand(updateQuery, conn)
                    cmd.Parameters.AddWithValue("@user", userId)
                    cmd.Parameters.AddWithValue("@path", PathToEdit)
                    conn.Open()
                    cmd.ExecuteNonQuery()
                End Using
            End Using

            ' Redirect back to directory with success
            Response.Redirect("edit-directory.aspx")
        Catch ex As Exception
            ' Handle errors (e.g., log error and notify user)
            ContentEditor.Text = $"Error saving file: {ex.Message}"
        End Try
    End Sub
End Class
