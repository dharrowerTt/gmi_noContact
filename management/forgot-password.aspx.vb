Imports System.Data.SqlClient
Imports System.Security.Cryptography
Imports System.Text

Partial Public Class forgot_password
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            mvForgotPassword.ActiveViewIndex = 0 ' Show the initial view for requesting code
        End If
    End Sub

    ' Send Reset Code
    Protected Sub btnSendCode_Click(ByVal sender As Object, ByVal e As EventArgs)
        Dim email = txtEmail.Text.Trim()

        If String.IsNullOrEmpty(email) Then
            lblError.Text = "Please enter a valid email address."
            Return
        End If

        ' Generate reset code and expiry
        Dim resetCode As String = GenerateResetCode()
        Dim resetExpiry As DateTime = DateTime.Now.AddHours(1)

        ' Update the user's record with reset code and expiry
        Dim connString As String = Common.GetConnString()
        Using conn As New SqlConnection(connString)
            conn.Open()
            Using cmd As New SqlCommand("UPDATE management_users SET reset_code = @resetCode, reset_code_expiry = @resetExpiry WHERE email = @Email", conn)
                cmd.Parameters.AddWithValue("@resetCode", resetCode)
                cmd.Parameters.AddWithValue("@resetExpiry", resetExpiry)
                cmd.Parameters.AddWithValue("@Email", email)

                Dim rowsAffected = cmd.ExecuteNonQuery()
                If rowsAffected > 0 Then
                    ' Send reset code email
                    SendResetCodeEmail(email, resetCode)

                    ' Switch to Enter Code view, lock email field, and update view
                    lblError.Text = ""
                    mvForgotPassword.ActiveViewIndex = 1
                    txtEmailLocked.Text = email
                Else
                    lblError.Text = "Email address not found."
                End If
            End Using
        End Using
    End Sub

    ' Generate reset code
    Private Function GenerateResetCode() As String
        Using rng As New RNGCryptoServiceProvider()
            Dim data(3) As Byte
            rng.GetBytes(data)
            Return BitConverter.ToInt32(data, 0).ToString("X8")
        End Using
    End Function

    ' Send reset code email
    Private Sub SendResetCodeEmail(email As String, resetCode As String)
        Dim arrMail(7) As String
        arrMail(0) = email
        arrMail(2) = "secretariat@globalmethane.org"
        arrMail(3) = "secretariat@globalmethane.org"
        arrMail(4) = "Password Reset Code"
        arrMail(6) = "HTML"

        Dim sBody As String = "<html><body><p>Your password reset code is: <strong>" & resetCode & "</strong></p>" &
                              "<p>Please enter this code on the reset password page to create a new password.</p></body></html>"

        arrMail(5) = sBody
        clsEmail.SendEventEmail(arrMail)
    End Sub

    ' Reset password
    Protected Sub btnResetPassword_Click(ByVal sender As Object, ByVal e As EventArgs)
        Dim email = txtEmailLocked.Text.Trim()
        Dim resetCode = txtResetCode.Text.Trim()
        Dim newPassword = txtNewPassword.Text.Trim()

        If String.IsNullOrEmpty(resetCode) OrElse String.IsNullOrEmpty(newPassword) Then
            lblError.Text = "Please enter both the reset code and a new password."
            Return
        End If

        ' Check the reset code and expiry
        Dim connString As String = Common.GetConnString()
        Using conn As New SqlConnection(connString)
            conn.Open()
            Using cmd As New SqlCommand("SELECT reset_code, reset_code_expiry FROM management_users WHERE email = @Email", conn)
                cmd.Parameters.AddWithValue("@Email", email)

                Using reader As SqlDataReader = cmd.ExecuteReader()
                    If reader.Read() Then
                        Dim storedCode = reader("reset_code").ToString()
                        Dim expiry = Convert.ToDateTime(reader("reset_code_expiry"))

                        If storedCode <> resetCode OrElse DateTime.Now > expiry Then
                            lblError.Text = "Invalid or expired reset code."
                            Return
                        End If
                    Else
                        lblError.Text = "Email address not found."
                        Return
                    End If
                End Using
            End Using

            ' Hash and update password in the database
            Dim salt As String = GenerateSalt()
            Dim passwordHash As String = HashPassword(newPassword, salt)

            Using cmd As New SqlCommand("UPDATE management_users SET passwordHash = @PasswordHash, passwordSalt = @Salt, reset_code = NULL, reset_code_expiry = NULL WHERE email = @Email", conn)
                cmd.Parameters.AddWithValue("@PasswordHash", passwordHash)
                cmd.Parameters.AddWithValue("@Salt", salt)
                cmd.Parameters.AddWithValue("@Email", email)
                cmd.ExecuteNonQuery()

                lblError.Text = "Password has been successfully reset, you can now <a href='login.aspx'>Log in</a>."
            End Using
        End Using
    End Sub

    ' Generate salt
    Private Function GenerateSalt() As String
        Using rng As New RNGCryptoServiceProvider()
            Dim saltBytes(15) As Byte
            rng.GetBytes(saltBytes)
            Return Convert.ToBase64String(saltBytes)
        End Using
    End Function

    ' Hash password
    Private Function HashPassword(password As String, salt As String) As String
        Using sha256 As SHA256 = SHA256.Create()
            Dim saltedPassword = Encoding.UTF8.GetBytes(password & salt)
            Dim hashBytes = sha256.ComputeHash(saltedPassword)
            Return Convert.ToBase64String(hashBytes)
        End Using
    End Function
End Class
