Imports System.Data.SqlClient
Public Class addConnection
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub addConnection_Action(sender As Object, e As EventArgs) Handles addConnection.Click
        Dim currentPage As String = "homepage"

        Dim sqlText = "INSERT INTO _forumConnectionList (userid,connection,note) VALUES (@userid, @connection, @note);"
        Using cnConnect = New SqlConnection(Common.GetConnString())
            Using cm = New SqlCommand(sqlText, cnConnect)
                cnConnect.Open()
                cm.Parameters.Add("@userid", SqlDbType.Int).Value = user.Text
                cm.Parameters.Add("@connection", SqlDbType.Int).Value = connection.Text
                cm.Parameters.Add("@note", SqlDbType.NVarChar).Value = noteArea.Text


                Dim currentID As Integer = cm.ExecuteScalar()
                'Set the ID value to RowNumber for redirection

            End Using
        End Using

        Response.Redirect("connections.aspx")
    End Sub

    Protected Sub LinkButton1_Action(sender As Object, e As EventArgs) Handles LinkButton1.Click
        Response.Redirect("connections.aspx")
    End Sub

End Class