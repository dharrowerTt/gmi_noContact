Imports System.IO
Imports System.Data
Imports System.Configuration
Imports System.Data.SqlClient
Public Class imageUpload
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub


    Protected Sub UploadFile(sender As Object, e As EventArgs)
        Dim folderPath As String = Server.MapPath("~/Gallery/")

        'Check whether Directory (Folder) exists.
        If Not Directory.Exists(folderPath) Then
            'If Directory (Folder) does not exists Create it.
            Directory.CreateDirectory(folderPath)
        End If

        Dim FileNameBuilder As String = DateTime.Now.ToString("yyyyMMdd-HHmmss") & Path.GetFileName(FileUpload1.FileName)

        'Save the File to the Directory (Folder).
        FileUpload1.SaveAs(folderPath & FileNameBuilder)

        'Display the Picture in Image control.
        Image1.ImageUrl = "~/Gallery/" & FileNameBuilder

        Dim sqlText = "INSERT INTO _2024ForumGallery (owner,timestamp,filename,caption,display) VALUES (@owner, @timestamp, @filename, @caption, @display);"
        Using cnConnect = New SqlConnection(Common.GetConnString())
            Using cm = New SqlCommand(sqlText, cnConnect)
                cnConnect.Open()
                cm.Parameters.Add("@owner", SqlDbType.NVarChar).Value = "Chris"
                cm.Parameters.Add("@timestamp", SqlDbType.Date).Value = DateTime.Now
                cm.Parameters.Add("@filename", SqlDbType.NVarChar).Value = FileNameBuilder
                cm.Parameters.Add("@caption", SqlDbType.NVarChar).Value = caption.Text
                cm.Parameters.Add("@display", SqlDbType.Bit).Value = 0

                Dim currentID As Integer = cm.ExecuteScalar()
                'Set the ID value to RowNumber for redirection

            End Using
        End Using

    End Sub


End Class