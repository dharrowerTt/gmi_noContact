Imports System.Data
Imports System.Configuration
Imports System.Web.Script.Serialization
Imports System.Data.SqlClient
Imports System.IO
Public Class GA_files
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            BindFiles()
        End If
    End Sub

    Private Sub BindFiles()
        Dim uploadFolder As String = Server.MapPath("~/dashboard/AnalyticsUploads/")
        If Directory.Exists(uploadFolder) Then
            Dim files = New DirectoryInfo(uploadFolder).GetFiles().OrderByDescending(Function(f) f.CreationTime).ToList()
            Dim fileList As New List(Of Object)

            For Each file In files
                Dim fileUrl As String = Request.Url.GetLeftPart(UriPartial.Authority) & ResolveUrl("~/dashboard/AnalyticsUploads/" & file.Name)
                fileList.Add(New With {
                    .FileName = file.Name,
                    .FileUrl = fileUrl,
                    .UploadDate = file.CreationTime.ToString("yyyy-MM-dd HH:mm:ss")
                })
            Next

            FilesRepeater.DataSource = fileList
            FilesRepeater.DataBind()
        Else
            ' Handle the case where the directory does not exist
        End If
    End Sub

End Class