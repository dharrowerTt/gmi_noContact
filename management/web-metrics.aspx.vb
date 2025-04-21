Imports System.IO
Imports System.Data.SqlClient

Public Class web_metrics
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            ' Check session validity
            If Session("LoggedInUser") Is Nothing Then
                Response.Redirect("login.aspx")
                Return
            End If

            ' Handle file deletion if requested
            If Request.QueryString("deleteFile") IsNot Nothing AndAlso UserHasTetraTechRole() Then
                DeleteFile(Request.QueryString("deleteFile"))
            End If

            ' Show upload form for TetraTech role
            If UserHasTetraTechRole() Then
                UploadPanel.Visible = True
            End If

            ' Always bind files to ensure the repeater is populated
            BindFiles()
        End If
    End Sub



    Private Sub BindFiles()
        Dim uploadFolder As String = Server.MapPath("~/management/AnalyticsUploads/")
        Dim fileList As New List(Of Object)

        If Directory.Exists(uploadFolder) Then
            Dim files = New DirectoryInfo(uploadFolder).GetFiles("*.pdf").OrderByDescending(Function(f) f.CreationTime).ToList()

            For Each file In files
                Dim fileUrl As String = Request.Url.GetLeftPart(UriPartial.Authority) & ResolveUrl("~/management/AnalyticsUploads/" & file.Name)
                fileList.Add(New With {
                .FileName = file.Name,
                .FileUrl = fileUrl,
                .UploadDate = file.CreationTime.ToString("yyyy-MM-dd HH:mm:ss")
            })
            Next
        End If

        ' Bind data or show empty panel
        If fileList.Count > 0 Then
            FilesRepeater.DataSource = fileList
            FilesRepeater.DataBind()
            NoFilesPanel.Visible = False
        Else
            FilesRepeater.DataSource = Nothing
            FilesRepeater.DataBind()
            NoFilesPanel.Visible = True
        End If
    End Sub



    Protected Sub FilesRepeater_ItemCommand(ByVal source As Object, ByVal e As RepeaterCommandEventArgs) Handles FilesRepeater.ItemCommand
        If e.CommandName = "Delete" Then
            Dim fileName As String = e.CommandArgument.ToString()
            DeleteFile(fileName)
            BindFiles() ' Refresh the list after deletion
        End If
    End Sub




    Protected Sub FilesRepeater_ItemDataBound(ByVal sender As Object, ByVal e As RepeaterItemEventArgs) Handles FilesRepeater.ItemDataBound
        If e.Item.ItemType = ListItemType.Item OrElse e.Item.ItemType = ListItemType.AlternatingItem Then
            ' Find the DeleteButton in the current item
            Dim deleteButton As Button = CType(e.Item.FindControl("DeleteButton"), Button)

            ' Show the delete button only if the user has the TetraTech role
            If deleteButton IsNot Nothing Then
                deleteButton.Visible = UserHasTetraTechRole()
            End If
        End If
    End Sub





    Private Function UserHasTetraTechRole() As Boolean
        If Session("LoggedInUser") Is Nothing Then
            Return False
        End If

        Dim username As String = Session("LoggedInUser").ToString()
        Dim userId As Integer = GetUserIdByUsername(username)
        Dim hasRole As Boolean = False
        Dim connString As String = Common.GetConnString()

        Using conn As New SqlConnection(connString)
            Using cmd As New SqlCommand("SELECT COUNT(1) FROM management_user_roles WHERE user_id = @userId AND role_id = 2", conn)
                cmd.Parameters.AddWithValue("@userId", userId)
                conn.Open()
                hasRole = Convert.ToInt32(cmd.ExecuteScalar()) > 0
            End Using
        End Using

        Return hasRole
    End Function

    Private Function GetUserIdByUsername(username As String) As Integer
        If String.IsNullOrEmpty(username) Then
            Return 0
        End If

        Dim userId As Integer = 0
        Dim connString As String = Common.GetConnString()

        Using conn As New SqlConnection(connString)
            Using cmd As New SqlCommand("SELECT user_id FROM management_users WHERE username = @username", conn)
                cmd.Parameters.AddWithValue("@username", username)
                conn.Open()
                Dim result = cmd.ExecuteScalar()
                If result IsNot Nothing Then
                    userId = Convert.ToInt32(result)
                End If
            End Using
        End Using

        Return userId
    End Function

    Private Sub DeleteFile(fileName As String)
        Dim uploadFolder As String = Server.MapPath("~/management/AnalyticsUploads/")
        Dim filePath As String = Path.Combine(uploadFolder, fileName)

        If File.Exists(filePath) Then
            File.Delete(filePath)
        End If
    End Sub


    Protected Sub UploadButton_Click(ByVal sender As Object, ByVal e As EventArgs)
        If FileUploadControl.HasFile Then
            Try
                Dim uploadFolder As String = Server.MapPath("~/management/AnalyticsUploads/")
                If Not Directory.Exists(uploadFolder) Then
                    Directory.CreateDirectory(uploadFolder)
                End If

                Dim filePath As String = Path.Combine(uploadFolder, FileUploadControl.FileName)
                FileUploadControl.SaveAs(filePath)

                ' Reload the page to show the uploaded file
                Response.Redirect(Request.RawUrl)
            Catch ex As Exception
                ' Handle upload errors (log or display a message as needed)
            End Try
        End If
    End Sub
End Class
