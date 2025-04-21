Public Class forgot
    Inherits System.Web.UI.Page
    Public successMessage As String = ""

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        successMessage = ""
    End Sub

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        SendMail()

        TextBox1.Text = ""

        successMessage = "Please check your email for reset instructions."
    End Sub


    Private Sub SendMail()

        'arrMail : 0 - To, 1 - cc , 2 - bcc, 3 - from, 4 - subject, 5 - body, 6- format, 7 - attachment.

        Dim arrMail(7) As String

        arrMail(0) = TextBox1.Text    'TO
        arrMail(2) = "secretariat@globalmethane.org"    'BCC
        arrMail(3) = "secretariat@globalmethane.org"    'FROM 'IIf(txtEmail.Text.Length > 0, txtEmail.Text, arrMail(0))     
        arrMail(4) = "Password Reset for " & TextBox1.Text
        arrMail(6) = "HTML"


        Dim eMail As String = TextBox1.Text
        Dim registerURL As String = "https://www.globalmethane.org/gmi-admin/recover.aspx?email=" & eMail

        'During the federal government shutdown, this website will not be updated, and the email inbox will not be monitored. 
        Dim sBody As String
        sBody = "<html><style type='text/css'>body{font-family:'Trebuchet MS'; font-size:90%}</style><body>"
        sBody += "<img src='https://globalmethane.org/images/gmi.gif' style='text-align:center;'>"
        sBody += "<p>Hi!</p>"
        sBody += "<p>We got a request to reset your password. Click below to complete this process:</p>"
        sBody += "<p><a href='" & registerURL & "' style='background:#487eb0;color:#f5f6fa;padding:10px;'>Reset My Password</a></p>"
        sBody += "<p>If the above link isn't working, try copying and pasting the following link:</p>"
        sBody += "<p><a href='" & registerURL & "'>" & registerURL & "</a></p>"
        sBody += "<p>If you did not request this reset, you don't have to do anything."
        sBody += "<p><br><br>Monica Shimamura<br>Director, Administrative Support Group<br>Global Methane Initiative<br><a href='secretariat@globalmethane.org'>secretariat@globalmethane.org</a>"
        sBody += "</body></html>"

        arrMail(5) = sBody

        clsEmail.SendEventEmail(arrMail)

    End Sub
End Class