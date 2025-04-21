Imports System.IO
Imports System.Data
Imports System.Configuration
Imports System.Data.SqlClient
Public Class seedocs
    Inherits System.Web.UI.Page
    Private regCode As String
    Dim EventID As Int16 = 110
    Dim UserID As String = ""
    Dim LookupValue As String = ""
    Dim profilePic As String = ""

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not (Request.QueryString("ID") Is Nothing) Then
            LookupValue = Request.QueryString("ID")
        Else
            Response.Redirect("../index.aspx", True)
        End If


        Dim uploadPath As String = Server.MapPath("/gmf2020/speakers/" & LookupValue & "/files/")

        'Check whether Directory (Folder) exists.
        If Directory.Exists(uploadPath) Then

            Dim filePaths() As String = Directory.GetFiles(Server.MapPath("/gmf2020/speakers/" & UserID & "/files/"))
            Dim files As List(Of ListItem) = New List(Of ListItem)
            For Each filePath As String In filePaths
                files.Add(New ListItem(Path.GetFileName(filePath), filePath))
            Next
            GridView1.DataSource = files
            GridView1.DataBind()


        End If


    End Sub

End Class