Imports System.IO
Imports System.Data
Imports System.Configuration
Imports System.Data.SqlClient
Public Class photos
    Inherits System.Web.UI.Page
    Public visitorID As String
    Public Shared visitorName As String = ""
    Public Shared SessionNote As String = ""

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        Dim ErrorURL As String = "https://www.globalmethane.org"

        If Request.Cookies("userid") IsNot Nothing Then
            ' Retrieve the value of the 'userid' cookie
            Dim userId As String = Request.Cookies("userid").Value

            visitorID = userId
        Else
            ' 'userid' cookie does not exist, handle accordingly
            Response.Redirect(ErrorURL)
        End If

        Dim currentPage As String = "photo"

        Dim sqlText = "INSERT INTO linkTreeAnalytics (visitorID,timestamp,page) VALUES (@visitorID, @timeStamp, @page);"
        Using cnConnect = New SqlConnection(Common.GetConnString())
            Using cm = New SqlCommand(sqlText, cnConnect)
                cnConnect.Open()
                cm.Parameters.Add("@visitorID", SqlDbType.Int).Value = visitorID
                cm.Parameters.Add("@timeStamp", SqlDbType.DateTime).Value = Now
                cm.Parameters.Add("@page", SqlDbType.NVarChar).Value = currentPage


                Dim currentID As Integer = cm.ExecuteScalar()
                'Set the ID value to RowNumber for redirection

            End Using
        End Using


    End Sub

    Protected Sub UploadFile(sender As Object, e As EventArgs)
        Dim folderPath As String = Server.MapPath("~/Gallery/")

        If fileUpload.HasFile Or Len(caption.Text) > 3 Then




            'Check whether Directory (Folder) exists.
            If Not Directory.Exists(folderPath) Then
                'If Directory (Folder) does not exists Create it.
                Directory.CreateDirectory(folderPath)
            End If

            Dim FileNameBuilder As String = DateTime.Now.ToString("yyyyMMdd-HHmmss") & Path.GetFileName(fileUpload.FileName)

            'Save the File to the Directory (Folder).
            fileUpload.SaveAs(folderPath & FileNameBuilder)

            'Display the Picture in Image control.
            Image1.ImageUrl = "~/Gallery/" & FileNameBuilder

            Dim sqlText = "INSERT INTO _2024ForumGallery (owner,timestamp,filename,caption,display) VALUES (@owner, @timestamp, @filename, @caption, @display);"
            Using cnConnect = New SqlConnection(Common.GetConnString())
                Using cm = New SqlCommand(sqlText, cnConnect)
                    cnConnect.Open()
                    cm.Parameters.Add("@owner", SqlDbType.NVarChar).Value = visitorID
                    cm.Parameters.Add("@timestamp", SqlDbType.Date).Value = DateTime.Now
                    cm.Parameters.Add("@filename", SqlDbType.NVarChar).Value = FileNameBuilder
                    cm.Parameters.Add("@caption", SqlDbType.NVarChar).Value = caption.Text
                    cm.Parameters.Add("@display", SqlDbType.Bit).Value = 0

                    Dim currentID As Integer = cm.ExecuteScalar()
                    'Set the ID value to RowNumber for redirection

                End Using
            End Using

        Else

            Label1.Text = "Please make sure an image has been selected and a caption has been entered."

        End If


    End Sub

End Class