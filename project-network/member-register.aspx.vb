Imports System.Data.SqlClient

Partial Class member_register
    Inherits System.Web.UI.Page

    Protected Sub btnRegister_Click(sender As Object, e As EventArgs)
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
                    ' Email exists, send account setup email
                    Dim firstName As String = reader("pnContactFirstName").ToString()
                    Dim lastName As String = reader("pnContactLastName").ToString()
                    SendSetupEmail(email, firstName, lastName)
                    lblMessage.Text = "An email has been sent to set up your account."
                Else
                    lblMessage.Text = "Email not found. Please contact the secretariat for assistance."
                End If
            End Using
        End Using
    End Sub

    Private Sub SendSetupEmail(email As String, firstName As String, lastName As String)
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

        ' arrMail : 0 - To, 1 - cc , 2 - bcc, 3 - from, 4 - subject, 5 - body, 6- format, 7 - attachment.
        Dim arrMail(7) As String

        ' In online test mode, override the recipient with the test email
        If status = "online test" Then
            arrMail(0) = testEmail
        Else
            arrMail(0) = email ' TO
        End If

        arrMail(2) = "secretariat@globalmethane.org" ' BCC
        arrMail(3) = "secretariat@globalmethane.org" ' FROM
        arrMail(4) = "Set up your GMI Project Network account" ' Subject
        arrMail(6) = "HTML" ' Format

        ' Create the email body
        Dim sBody As String
        sBody = "<html><style type='text/css'>body{font-family:'Trebuchet MS'; font-size:90%; color:#333;}</style><body>"
        sBody += "<h2>Account Setup</h2>"
        sBody += "<p>Dear " & firstName & " " & lastName & ",</p>"
        sBody += "<p>We are excited to invite you to set up your Project Network account. Please click the link below to create your login credentials:</p>"
        sBody += "<p><a href='https://globalmethane.org/project-network/setup.aspx?email=" & email & "'>Set up my account</a></p>"
        sBody += "<p>Thank you for joining the Global Methane Initiative!</p>"
        sBody += "<p>Best regards,<br/>GMI Secretariat</p>"
        sBody += "</body></html>"

        arrMail(5) = sBody ' Body content

        ' Send the email only if not in local test mode
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
