Imports System.Data.SqlClient
Public Class removeConnection
    Inherits System.Web.UI.Page
    Public Shared objid As String = ""

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        objid = Server.HtmlEncode(Request.QueryString("id"))
        If objid = "" Then
            Response.Redirect("index.aspx")
        End If

        Dim query As String = "DELETE FROM _forumConnectionList WHERE connectionID=@conID"

        Using con As SqlConnection = New SqlConnection(Common.GetConnString())
            Using cmd As SqlCommand = New SqlCommand(query)
                cmd.Parameters.AddWithValue("@conID", objid)
                cmd.Connection = con
                con.Open()
                cmd.ExecuteNonQuery()
                con.Close()
            End Using
        End Using

        Response.Redirect("connections.aspx")


    End Sub

End Class