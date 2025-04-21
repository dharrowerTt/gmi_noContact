Imports System.Data.SqlClient
Imports System.Web.Services

Public Class role_management
    Inherits System.Web.UI.Page

    Private connString As String = Common.GetConnString()

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            GenerateRoleTable()
        End If
    End Sub

    Private Sub GenerateRoleTable()
        ' Retrieve active users and roles from the database
        Dim users As DataTable = GetUsers()
        Dim roles As DataTable = GetRoles()

        ' Create table dynamically
        Dim tbl As New Table()
        tbl.CssClass = "table"

        ' Table header row
        Dim headerRow As New TableRow()
        Dim headerEmailCell As New TableHeaderCell()
        headerEmailCell.Text = "User Email"
        headerRow.Cells.Add(headerEmailCell)

        Dim headerRoleCell As New TableHeaderCell()
        headerRoleCell.Text = "Assign Role"
        headerRow.Cells.Add(headerRoleCell)

        tbl.Rows.Add(headerRow)

        ' Add a row for each user
        For Each userRow As DataRow In users.Rows
            Dim userRowTbl As New TableRow()
            Dim emailCell As New TableCell()
            emailCell.Text = userRow("email").ToString()
            userRowTbl.Cells.Add(emailCell)

            ' Add a dropdown for role selection
            Dim roleCell As New TableCell()
            Dim ddlRoles As New DropDownList()
            ddlRoles.ID = "ddlRole_" & userRow("user_id").ToString()
            ddlRoles.Attributes("data-user-id") = userRow("user_id").ToString()
            ddlRoles.AutoPostBack = False

            ' Add roles to dropdown
            ddlRoles.Items.Add(New ListItem("Select a role", ""))
            For Each roleRow As DataRow In roles.Rows
                ddlRoles.Items.Add(New ListItem(roleRow("role_name").ToString(), roleRow("role_id").ToString()))
            Next

            ' Set selected role if the user has one
            Dim currentRoleId As Integer = GetUserRole(CInt(userRow("user_id")))
            If currentRoleId > 0 Then
                ddlRoles.SelectedValue = currentRoleId.ToString()
            End If

            ' Add dropdown to cell
            roleCell.Controls.Add(ddlRoles)
            userRowTbl.Cells.Add(roleCell)

            tbl.Rows.Add(userRowTbl)
        Next

        ' Add the table to the placeholder
        phRoleTable.Controls.Add(tbl)
    End Sub

    Private Function GetUsers() As DataTable
        Dim dtUsers As New DataTable()

        Using conn As New SqlConnection(connString)
            Using cmd As New SqlCommand("SELECT user_id, email FROM management_users WHERE is_active = 1", conn)
                Dim adapter As New SqlDataAdapter(cmd)
                adapter.Fill(dtUsers)
            End Using
        End Using

        Return dtUsers
    End Function

    Private Function GetRoles() As DataTable
        Dim dtRoles As New DataTable()

        Using conn As New SqlConnection(connString)
            Using cmd As New SqlCommand("SELECT role_id, role_name FROM management_roles", conn)
                Dim adapter As New SqlDataAdapter(cmd)
                adapter.Fill(dtRoles)
            End Using
        End Using

        Return dtRoles
    End Function

    Private Function GetUserRole(userId As Integer) As Integer
        ' Retrieve the current role ID for the user, if it exists
        Dim roleId As Integer = 0

        Using conn As New SqlConnection(connString)
            Using cmd As New SqlCommand("SELECT role_id FROM management_user_roles WHERE user_id = @userId", conn)
                cmd.Parameters.AddWithValue("@userId", userId)
                conn.Open()
                Dim result = cmd.ExecuteScalar()
                If result IsNot Nothing Then
                    roleId = Convert.ToInt32(result)
                End If
            End Using
        End Using

        Return roleId
    End Function

    <WebMethod>
    Public Shared Function SaveUserRole(userId As Integer, roleId As Integer) As Boolean
        ' Save the selected role for the user in the database
        Using conn As New SqlConnection(Common.GetConnString())
            conn.Open()

            ' Remove any existing roles for this user
            Dim deleteCmd As New SqlCommand("DELETE FROM management_user_roles WHERE user_id = @userId", conn)
            deleteCmd.Parameters.AddWithValue("@userId", userId)
            deleteCmd.ExecuteNonQuery()

            ' Insert the new role if a valid role is selected
            If roleId > 0 Then
                Dim insertCmd As New SqlCommand("INSERT INTO management_user_roles (user_id, role_id) VALUES (@userId, @roleId)", conn)
                insertCmd.Parameters.AddWithValue("@userId", userId)
                insertCmd.Parameters.AddWithValue("@roleId", roleId)
                insertCmd.ExecuteNonQuery()
            End If
        End Using

        Return True
    End Function
End Class
