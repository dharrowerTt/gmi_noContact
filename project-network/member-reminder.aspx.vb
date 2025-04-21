Imports System.Data.SqlClient
Imports System.Security.Cryptography
Imports System.Text

Partial Class member_reminder
    Inherits System.Web.UI.Page

    Protected Sub btnReset_Click(sender As Object, e As EventArgs)
        Dim email As String = txtEmail.Text.Trim()

        ' Check if the email exists in the pn_contacts table
        Using conn As New SqlConnection(Common.GetConnString())
            conn.Open()

            Dim query As String = "SELECT pnContactID, pnContactFirstName, pnContactLastName FROM pn_contacts WHERE pnContactEmail = @Email"
            Using cmd As New SqlCommand(query, conn)
                cmd.Parameters.AddWithValue("@Email", email)

                Dim reader As SqlDataReader = cmd.ExecuteReader()
                If reader.HasRows Then
                    reader.Read()

                    ' Email exists, generate reset token and store it in the table
                    Dim contactID As Integer = Convert.ToInt32(reader("pnContactID"))
                    Dim firstName As String = reader("pnContactFirstName").ToString()
                    Dim lastName As String = reader("pnContactLastName").ToString()
                    Dim resetToken As String = GenerateResetToken()

                    ' Update the pn_contacts table with the reset token
                    UpdateResetToken(contactID, resetToken)

                    ' Send the password reset email with the token included
                    SendPasswordResetEmail(email, firstName, lastName, resetToken)

                    lblMessage.Text = "A password reset link has been sent to your email."
                Else
                    lblMessage.Text = "Email not found. Please contact secretariat@globalmethane.org for assistance."
                End If
            End Using
        End Using
    End Sub

    ' Function to generate a random reset token
    Private Function GenerateResetToken() As String
        Using rng As New RNGCryptoServiceProvider()
            Dim tokenData As Byte() = New Byte(9) {} ' 10 bytes = 20-character token in Base64
            rng.GetBytes(tokenData)
            Return Convert.ToBase64String(tokenData).Replace("=", "").Replace("+", "").Replace("/", "") ' Remove non-URL-safe characters
        End Using
    End Function

    ' Function to update the pn_contacts table with the reset token
    Private Sub UpdateResetToken(contactID As Integer, resetToken As String)
        Using conn As New SqlConnection(Common.GetConnString())
            conn.Open()

            Dim query As String = "UPDATE pn_contacts SET reset = @ResetToken WHERE pnContactID = @ContactID"
            Using cmd As New SqlCommand(query, conn)
                cmd.Parameters.AddWithValue("@ResetToken", resetToken)
                cmd.Parameters.AddWithValue("@ContactID", contactID)
                cmd.ExecuteNonQuery()
            End Using
        End Using
    End Sub

    ' Function to send the password reset email
    Private Sub SendPasswordResetEmail(email As String, firstName As String, lastName As String, resetToken As String)
        ' Declare variables to hold the status and test email
        Dim status As String = ""
        Dim testEmail As String = ""

        ' Get environment status for the project-network area
        GetEnvironmentStatus("project-network", status, testEmail)

        If status = "local test" Then
            ' Do not send email during local test
            lblMessage.Text = "Email sending is disabled in local test mode."
            Return
        End If

        ' arrMail : 0 - To, 1 - cc, 2 - bcc, 3 - from, 4 - subject, 5 - body, 6- format, 7 - attachment.
        Dim arrMail(7) As String

        ' In online test mode, override the recipient with the test email
        If status = "online test" Then
            arrMail(0) = testEmail
        Else
            arrMail(0) = email ' TO
        End If

        arrMail(2) = "secretariat@globalmethane.org" ' BCC
        arrMail(3) = "secretariat@globalmethane.org" ' FROM
        arrMail(4) = "Reset your GMI Project Network Password" ' Subject
        arrMail(6) = "HTML" ' Format

        ' Create the email body with the reset token included in the URL
        Dim sBody As String
        sBody = "<html><style type='text/css'>body{font-family:'Trebuchet MS'; font-size:90%; color:#333;}</style><body>"
        sBody += "<h2>Password Reset Request</h2>"
        sBody += "<p>Dear " & firstName & " " & lastName & ",</p>"
        sBody += "<p>You recently requested to reset your password for the Project Network. Please click the link below to reset your password:</p>"
        sBody += "<p><a href='https://globalmethane.org/project-network/reset-password.aspx?email=" & email & "&token=" & resetToken & "'>Reset my password</a></p>"
        sBody += "<p>If you did not request a password reset, please contact the GMI Secretariat immediately.</p>"
        sBody += "<p>Best regards,<br/>GMI Secretariat</p>"
        sBody += "</body></html>"

        arrMail(5) = sBody ' Body content

        ' Send the email
        clsEmail.SendEventEmail(arrMail)
    End Sub

    Private Sub GetEnvironmentStatus(area As String, ByRef status As String, ByRef testEmail As String)
        Using conn As New SqlConnection(Common.GetConnString())
            conn.Open()

            Dim query As String = "SELECT status, email FROM envData WHERE area = @Area"
            Using cmd As New SqlCommand(query, conn)
                cmd.Parameters.AddWithValue("@Area", area)

                Dim reader As SqlDataReader = cmd.ExecuteReader()
                If reader.Read() Then
                    status = reader("status").ToString()
                    testEmail = reader("email").ToString()
                Else
                    ' Default to production if no entry is found
                    status = "online production"
                    testEmail = ""
                End If
            End Using
        End Using
    End Sub
End Class
