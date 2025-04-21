Imports System.Data.SqlClient
Imports System.Security.Cryptography
Imports System.Text

Public Class reset
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Try
            Dim id As String = Request.QueryString("id")

            If String.IsNullOrEmpty(id) Then
                lblMessage.Text = "Invalid URL. Access denied."
                pnlResetPassword.Visible = False
            Else
                pnlResetPassword.Visible = True
            End If
        Catch ex As Exception
            lblMessage.Text = "An error occurred while loading the page: " & ex.Message
            pnlResetPassword.Visible = False
        End Try
    End Sub

    Protected Sub btnResetPassword_Click(sender As Object, e As EventArgs)
        Try
            Dim username As String = txtResetUsername.Text
            Dim newPassword As String = txtNewPassword.Text

            Dim salt As Byte()
            Dim hash As Byte() = CreatePasswordHash(newPassword, salt)

            Using connection As New SqlConnection(Common.GetConnString())
                connection.Open()
                Using command As New SqlCommand("UPDATE csUsers SET PasswordHash = @PasswordHash, PasswordSalt = @PasswordSalt WHERE Username = @Username", connection)
                    command.Parameters.AddWithValue("@Username", username)
                    command.Parameters.AddWithValue("@PasswordHash", hash)
                    command.Parameters.AddWithValue("@PasswordSalt", salt)
                    Dim rowsAffected = command.ExecuteNonQuery()
                    If rowsAffected > 0 Then
                        lblMessage.Text = "Password reset successful."
                    Else
                        lblMessage.Text = "Password reset failed. Username not found."
                    End If
                End Using
            End Using
        Catch ex As Exception
            lblMessage.Text = "An error occurred during password reset: " & ex.Message
        End Try
    End Sub

    Private Function CreatePasswordHash(password As String, ByRef salt As Byte()) As Byte()
        salt = New Byte(15) {}
        Using rng As New RNGCryptoServiceProvider()
            rng.GetBytes(salt)
        End Using

        Using pbkdf2 As New Rfc2898DeriveBytes(password, salt, 10000)
            Return pbkdf2.GetBytes(64)
        End Using
    End Function
End Class
