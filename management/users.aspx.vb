Imports System.Data
Imports System.Data.SqlClient

Partial Public Class users
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            LoadUsersData()
        End If
    End Sub

    Private Sub LoadUsersData()
        Dim connString As String = Common.GetConnString()
        Dim usersData As New DataTable()

        Using conn As New SqlConnection(connString)
            conn.Open()
            Using cmd As New SqlCommand("SELECT user_id, email, created_at, is_active, is_admin FROM management_users", conn)
                Using reader As SqlDataReader = cmd.ExecuteReader()
                    usersData.Load(reader)
                End Using
            End Using
        End Using

        usersTable.DataSource = usersData
        usersTable.DataBind()
    End Sub

    Protected Sub usersTable_RowDataBound(ByVal sender As Object, ByVal e As GridViewRowEventArgs) Handles usersTable.RowDataBound
        If e.Row.RowType = DataControlRowType.DataRow Then
            Dim isAdmin As Boolean = Convert.ToBoolean(DataBinder.Eval(e.Row.DataItem, "is_admin"))
            Dim isActive As Boolean = Convert.ToBoolean(DataBinder.Eval(e.Row.DataItem, "is_active"))

            If isAdmin Then
                e.Row.CssClass = "adminRow"
            ElseIf isActive Then
                e.Row.CssClass = "activeRow"
            End If
        End If
    End Sub

    Protected Sub ToggleActivation(ByVal sender As Object, ByVal e As EventArgs)
        Dim userId As Integer = Convert.ToInt32(CType(sender, Button).CommandArgument)
        Dim connString As String = Common.GetConnString()

        Using conn As New SqlConnection(connString)
            conn.Open()
            Using cmd As New SqlCommand("UPDATE management_users SET is_active = ~is_active WHERE user_id = @userId", conn)
                cmd.Parameters.AddWithValue("@userId", userId)
                cmd.ExecuteNonQuery()
            End Using
        End Using

        LoadUsersData()
    End Sub

    Protected Sub ToggleAdmin(ByVal sender As Object, ByVal e As EventArgs)
        Dim userId As Integer = Convert.ToInt32(CType(sender, Button).CommandArgument)
        Dim connString As String = Common.GetConnString()

        Using conn As New SqlConnection(connString)
            conn.Open()
            Using cmd As New SqlCommand("UPDATE management_users SET is_admin = ~is_admin WHERE user_id = @userId", conn)
                cmd.Parameters.AddWithValue("@userId", userId)
                cmd.ExecuteNonQuery()
            End Using
        End Using

        LoadUsersData()
    End Sub

    Protected Sub ViewActivity(ByVal sender As Object, ByVal e As EventArgs)
        Dim userId As Integer = Convert.ToInt32(CType(sender, Button).CommandArgument)
        Response.Redirect($"userActivity.aspx?user_id={userId}")
    End Sub
End Class
