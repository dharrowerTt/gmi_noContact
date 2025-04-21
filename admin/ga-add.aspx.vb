Imports System.Data
Imports System.Configuration
Imports System.Data.SqlClient
Imports System.IO
Public Class ga_add
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load



    End Sub

    Protected Sub UploadButton_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        If FileUploadControl.HasFile Then
            Try
                Dim filename As String = Path.GetFileName(FileUploadControl.FileName)
                Dim uploadFolder As String = Server.MapPath("~/dashboard/AnalyticsUploads/")

                If Not Directory.Exists(uploadFolder) Then
                    Directory.CreateDirectory(uploadFolder)
                End If

                Dim filePath As String = Path.Combine(uploadFolder, filename)
                FileUploadControl.SaveAs(filePath)

                Dim fileUrl As String = Request.Url.GetLeftPart(UriPartial.Authority) & ResolveUrl("~/Uploads/" & filename)
                StatusLabel.Text = "Upload status: File uploaded! <a href='" & fileUrl & "' target='_blank'>" & fileUrl & "</a>"
            Catch ex As Exception
                StatusLabel.Text = "Upload status: The file could not be uploaded. The following error occurred: " & ex.Message
            End Try
        Else
            StatusLabel.Text = "Upload status: No file selected."
        End If
    End Sub


End Class