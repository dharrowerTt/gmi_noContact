Imports System.Web
Imports System.Web.SessionState
Imports System.Diagnostics
Imports System.Globalization

Public Class Global_asax
    Inherits System.Web.HttpApplication

    Public Shared myPath As String   'the directory of my application

    Sub Session_Start(ByVal sender As Object, ByVal e As EventArgs)
        ' Fires when the session is started

        'put myPath into the session for aspx pages to retrieve
        If (myPath = "/") Then
            myPath = ""
        End If

        Session("myPath") = myPath
    End Sub

    Sub Application_BeginRequest(ByVal sender As Object, ByVal e As EventArgs)
        ' Fires at the beginning of each request      

        Dim Path As String
        Path = Request.ApplicationPath

        myPath = Path

        'Response.Write("myPath=" + myPath)


        'HUI code - 2011
        'redirect from  www.globalmethaneinitiative.org to www.globalmethane.org
        Dim reqDomain As String = Request.ServerVariables("Server_Name").ToLower()
        Dim originalPath As String = HttpContext.Current.Request.Path.ToLower()
        Dim newDomain As String = "http://www.globalmethane.org"
        Dim newURL As String

        If reqDomain.StartsWith("www.globalmethaneinitiative.org") Then
            newURL = newDomain & originalPath

            Response.Redirect(newURL)
        End If
    End Sub

    
End Class
