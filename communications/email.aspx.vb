
Imports System.Data
Imports System.Configuration
Imports System.Data.SqlClient

Public Class email
    Inherits System.Web.UI.Page
    Public Shared emailURL As String = ""
    Public Shared objid As String = ""

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        objid = Server.HtmlEncode(Request.QueryString("c"))
        If objid = "" Then
            Response.Redirect("index.aspx")
        End If
        emailURL = objid





        Using con As New SqlConnection(Common.GetConnString())
            Using cmd As SqlCommand = New SqlCommand("SELECT subjectLine FROM dbo.gmiComms where msgURL = '" & emailURL & "'")
                cmd.CommandType = CommandType.Text
                cmd.Connection = con
                con.Open()
                Using sdr As SqlDataReader = cmd.ExecuteReader()
                    sdr.Read()
                    Page.Title = sdr("subjectLine").ToString() & " | Global Methane Initiative"

                End Using
                con.Close()
            End Using
        End Using


    End Sub

End Class