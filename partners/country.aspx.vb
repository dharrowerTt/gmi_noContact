Imports System.Data
Imports System.Data.SqlClient

Imports System
Imports System.Collections.Generic

Public Class country

    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Page.MaintainScrollPositionOnPostBack = True
        Dim objID As String = ""

        objID = Server.HtmlEncode(Request.QueryString("country"))



        If objID = "" Then
            objID = Server.HtmlEncode(Request.QueryString("c"))
        End If
        HttpContext.Current.Response.Redirect("/partners/detail.aspx?c=" & objID)







    End Sub


    Sub HtmlAnchor_Click(sender As Object, e As EventArgs)
        Dim objID As String = ""
        objID = Server.HtmlEncode(Request.QueryString("country"))
        If objID = "" Then
            objID = Server.HtmlEncode(Request.QueryString("c"))
        End If
    End Sub



















































End Class
