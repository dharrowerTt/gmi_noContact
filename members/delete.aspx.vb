Imports System.Data
Imports System.Configuration
Imports System.Data.SqlClient
Public Class delete1
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        Dim thanksURL As String = "thanks.aspx"

        Dim userId As String = Server.HtmlEncode(Request.QueryString("id"))
        Dim query As String = "DELETE FROM _mbrDelegateLookUp WHERE userID=@userID"
        'Dim constr As String = ConfigurationManager.ConnectionStrings("constr").ConnectionString
        Using con As SqlConnection = New SqlConnection(Common.GetConnString())
            Using cmd As SqlCommand = New SqlCommand(query)
                cmd.Parameters.AddWithValue("@userID", userId)
                cmd.Connection = con
                con.Open()
                cmd.ExecuteNonQuery()
                con.Close()
            End Using
        End Using

        Response.Redirect(thanksURL)

    End Sub

End Class