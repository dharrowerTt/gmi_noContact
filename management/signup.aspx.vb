Imports System.Data.SqlClient
Imports System.Net.Mail
Imports System.Security.Cryptography
Imports System.Text

Partial Public Class signup2
    Inherits System.Web.UI.Page

    Protected Sub btnSignUp_Click(ByVal sender As Object, ByVal e As EventArgs)
        Dim email As String = txtEmail.Text.Trim()
        Dim password As String = txtPassword.Text.Trim()

        If Not ValidatePassword(password) Then
            lblMessage.Text = "Password does not meet the criteria."
            Return
        End If

        If UserExists(email) Then
            lblMessage.Text = "An account with this email already exists."
            Return
        End If

        Dim salt As String = GenerateSalt()
        Dim hashedPassword As String = HashPassword(password, salt)

        If RegisterUser(email, hashedPassword, salt) Then
            lblMessage.Text = "Registration successful. Your account is awaiting approval."
            SendNewUserActivationEmail(email, email)
        Else
            lblMessage.Text = "There was an error registering your account. Please try again later."
        End If
    End Sub

    ' Validate password against criteria
    Private Function ValidatePassword(ByVal password As String) As Boolean
        Return password.Length >= 8 AndAlso
               password.Any(AddressOf Char.IsUpper) AndAlso
               password.Any(AddressOf Char.IsDigit) AndAlso
               password.Any(Function(c) "!@#$%^&*".Contains(c))
    End Function

    ' Check if the email is already registered
    Private Function UserExists(ByVal email As String) As Boolean
        Dim exists As Boolean = False
        Dim connString As String = Common.GetConnString()

        Using conn As New SqlConnection(connString)
            conn.Open()
            Dim query As String = "SELECT COUNT(*) FROM management_users WHERE email = @Email"
            Using cmd As New SqlCommand(query, conn)
                cmd.Parameters.AddWithValue("@Email", email)
                exists = Convert.ToInt32(cmd.ExecuteScalar()) > 0
            End Using
        End Using

        Return exists
    End Function

    ' Register a new user in the database
    Private Function RegisterUser(ByVal email As String, ByVal passwordHash As String, ByVal salt As String) As Boolean
        Dim success As Boolean = False
        Dim connString As String = Common.GetConnString()

        Using conn As New SqlConnection(connString)
            conn.Open()
            Dim query As String = "INSERT INTO management_users (email, username, passwordHash, passwordSalt, is_active) VALUES (@Email, @username, @PasswordHash, @Salt, @IsActive)"
            Using cmd As New SqlCommand(query, conn)
                cmd.Parameters.AddWithValue("@Email", email)
                cmd.Parameters.AddWithValue("@username", email)
                cmd.Parameters.AddWithValue("@PasswordHash", passwordHash)
                cmd.Parameters.AddWithValue("@Salt", salt)
                cmd.Parameters.AddWithValue("@IsActive", False) ' Account must be approved
                success = cmd.ExecuteNonQuery() > 0
            End Using
        End Using

        Return success
    End Function

    ' Generate a random salt for password hashing
    Private Function GenerateSalt() As String
        Dim rng As New RNGCryptoServiceProvider()
        Dim saltBytes(15) As Byte
        rng.GetBytes(saltBytes)
        Return Convert.ToBase64String(saltBytes)
    End Function

    ' Hash the password with salt
    Private Function HashPassword(ByVal password As String, ByVal salt As String) As String
        Dim sha256 As SHA256 = SHA256.Create()
        Dim saltedPassword As String = password & salt
        Dim saltedPasswordBytes As Byte() = Encoding.UTF8.GetBytes(saltedPassword)
        Dim hashBytes As Byte() = sha256.ComputeHash(saltedPasswordBytes)
        Return Convert.ToBase64String(hashBytes)
    End Function

    ' Send an email notification for new registration    
    Private Sub SendNewUserActivationEmail(userName As String, userEmail As String)

        Dim arrMail(7) As String

        ' Configure email details
        arrMail(0) = "dougie.harrower@tetratech.com" ' TO
        arrMail(2) = "" ' BCC
        arrMail(3) = "secretariat@globalmethane.org" ' FROM
        arrMail(4) = "New User Registration - Activation Required" ' Subject
        arrMail(6) = "HTML" ' Format

        ' Build email body
        Dim sBody As String = "<html><body style='font-family:Trebuchet MS; color:#333;'>"
        sBody += "<h2>New User Registration</h2>"
        sBody += "<p>A new user has registered and requires activation:</p>"
        sBody += "<table style='width: 100%; border-collapse: collapse;'>"
        sBody += "<tr><th style='text-align: left;'>User Name</th><td>" & userName & "</td></tr>"
        sBody += "<tr><th style='text-align: left;'>User Email</th><td>" & userEmail & "</td></tr>"
        sBody += "</table>"
        sBody += "</body></html>"

        arrMail(5) = sBody ' Email body content

        ' Send email
        clsEmail.SendEventEmail(arrMail)

    End Sub


End Class
