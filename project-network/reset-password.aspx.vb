Imports System.Data.SqlClient
Imports System.Security.Cryptography
Imports System.Text

Partial Class reset_password
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            ' Verify if both email and token are present in the URL
            If String.IsNullOrEmpty(Request.QueryString("email")) OrElse String.IsNullOrEmpty(Request.QueryString("token")) Then
                lblMessage.Text = "Invalid reset request. Please try again."
                btnSubmit.Enabled = False
            End If
        End If
    End Sub

    Protected Sub btnSubmit_Click(sender As Object, e As EventArgs)
        Dim email As String = Request.QueryString("email").ToString()
        Dim token As String = Request.QueryString("token").ToString()
        Dim newPassword As String = txtNewPassword.Text.Trim()
        Dim confirmPassword As String = txtConfirmPassword.Text.Trim()

        ' Ensure password fields match
        If newPassword <> confirmPassword Then
            lblMessage.Text = "Passwords do not match."
            Return
        End If

        ' Validate password strength (based on member-setup rules)
        If Not ValidatePassword(newPassword) Then
            lblMessage.Text = "Password does not meet the required criteria."
            Return
        End If

        ' Verify email and token match in the database
        Using conn As New SqlConnection(Common.GetConnString())
            conn.Open()
            Dim query As String = "SELECT pnContactID FROM pn_contacts WHERE pnContactEmail = @Email AND reset = @Token"
            Using cmd As New SqlCommand(query, conn)
                cmd.Parameters.AddWithValue("@Email", email)
                cmd.Parameters.AddWithValue("@Token", token)

                Dim reader As SqlDataReader = cmd.ExecuteReader()

                If reader.HasRows Then
                    reader.Read()
                    Dim contactID As Integer = Convert.ToInt32(reader("pnContactID"))
                    reader.Close()

                    ' Hash the new password and update the database
                    Dim hashedPassword As String = HashPassword(newPassword)
                    Dim updateQuery As String = "UPDATE pn_contacts SET pnContactPasswordHash = @PasswordHash, reset = NULL WHERE pnContactID = @ContactID"
                    Using updateCmd As New SqlCommand(updateQuery, conn)
                        updateCmd.Parameters.AddWithValue("@PasswordHash", hashedPassword)
                        updateCmd.Parameters.AddWithValue("@ContactID", contactID)
                        updateCmd.ExecuteNonQuery()
                    End Using

                    ' Password reset successful, redirect to login page
                    lblMessage.Text = "Password has been reset successfully. Redirecting to login page..."
                    Response.AddHeader("REFRESH", "5;URL=member-login.aspx")
                Else
                    lblMessage.Text = "Invalid or expired token. Please try resetting your password again."
                End If
            End Using
        End Using
    End Sub

    ' Function to validate password strength (same as member-setup rules)
    Private Function ValidatePassword(password As String) As Boolean
        If password.Length < 8 Then
            Return False
        End If
        If Not password.Any(AddressOf Char.IsUpper) Then
            Return False
        End If
        If Not password.Any(AddressOf Char.IsLower) Then
            Return False
        End If
        If Not password.Any(AddressOf Char.IsDigit) Then
            Return False
        End If
        If Not password.Any(Function(c) "!@#$%^&*()_+-=[]{}|;:,.<>?".Contains(c)) Then
            Return False
        End If
        Return True
    End Function

    ' Function to hash the password using SHA-512
    Private Function HashPassword(password As String) As String
        Using sha512 As SHA512 = SHA512.Create()
            Dim bytes As Byte() = sha512.ComputeHash(Encoding.UTF8.GetBytes(password))
            Dim builder As New StringBuilder()
            For Each b As Byte In bytes
                builder.Append(b.ToString("x2")) ' Convert byte to hex
            Next
            Return builder.ToString()
        End Using
    End Function

End Class
