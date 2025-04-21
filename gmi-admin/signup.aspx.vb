Imports System.Text
Imports System.Security.Cryptography
Imports System.Data.SqlClient

Public Class signup
    Inherits System.Web.UI.Page
    Dim fnameValue As String
    Dim lnameValue As String
    Dim emailValue As String
    Dim passwordValue As String

    Dim cleanEmail As String
    Dim securePass As String

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load


        fnameValue = HttpUtility.HtmlEncode(Request.Form("su_fname"))
        lnameValue = HttpUtility.HtmlEncode(Request.Form("su_lname"))
        emailValue = HttpUtility.HtmlEncode(Request.Form("su_email"))
        passwordValue = HttpUtility.HtmlEncode(Request.Form("su_password"))

        securePass = GenerateSHA256String(passwordValue)
        cleanEmail = emailValue.Replace(",", "")

        checkRegisterEmail()

    End Sub

    Protected Sub checkRegisterEmail()
        Dim constr As String = Common.GetConnString()

        Dim registerObj As clsRegisterVO
        registerObj = New clsRegisterVO

        Using con As SqlConnection = New SqlConnection(constr)
            Using cmd As SqlCommand = New SqlCommand("select count(*) As CountofRows FROM _gmiUsers where email = '" & cleanEmail & "'")
                cmd.CommandType = CommandType.Text
                cmd.Connection = con
                con.Open()
                Using sdr As SqlDataReader = cmd.ExecuteReader()
                    sdr.Read()
                    If sdr("CountofRows") > 0 Then
                        Page.ClientScript.RegisterStartupScript(Me.GetType(), "window-script", "signin()", True)
                    Else
                        registerNewUser()
                        SendMail()
                        Response.Redirect("thanks.aspx", True)
                    End If

                End Using
                con.Close()
            End Using
        End Using


    End Sub

    Protected Sub registerNewUser()
        Dim EmailAdd As String
        Dim registerObj As clsRegisterVO
        registerObj = New clsRegisterVO

        registerObj.setfName(fnameValue)
        registerObj.setlName(lnameValue)
        registerObj.setEmail(cleanEmail)
        registerObj.setPassword(securePass)

        EmailAdd = clsRegisterDAO.createUser(registerObj)


    End Sub

    Public Shared Function GenerateSHA256String(ByVal inputString) As String
        Dim sha256 As SHA256 = SHA256Managed.Create()
        Dim bytes As Byte() = Encoding.UTF8.GetBytes(inputString)
        Dim hash As Byte() = sha256.ComputeHash(bytes)
        Dim stringBuilder As New StringBuilder()

        For i As Integer = 0 To hash.Length - 1
            stringBuilder.Append(hash(i).ToString("X2"))
        Next

        Return stringBuilder.ToString()
    End Function

    Public Shared Function GenerateSHA512String(ByVal inputString) As String
        Dim sha512 As SHA512 = SHA512Managed.Create()
        Dim bytes As Byte() = Encoding.UTF8.GetBytes(inputString)
        Dim hash As Byte() = sha512.ComputeHash(bytes)
        Dim stringBuilder As New StringBuilder()

        For i As Integer = 0 To hash.Length - 1
            stringBuilder.Append(hash(i).ToString("X2"))
        Next

        Return stringBuilder.ToString()
    End Function

    Private Sub SendMail()

        'arrMail : 0 - To, 1 - cc , 2 - bcc, 3 - from, 4 - subject, 5 - body, 6- format, 7 - attachment.

        Dim arrMail(7) As String

        arrMail(0) = cleanEmail    'TO
        arrMail(2) = "secretariat@globalmethane.org"    'BCC
        arrMail(3) = "secretariat@globalmethane.org"    'FROM 'IIf(txtEmail.Text.Length > 0, txtEmail.Text, arrMail(0))     
        arrMail(4) = "Confirm Your Registration"
        arrMail(6) = "HTML"

        Dim sName As String = fnameValue & " " & lnameValue
        Dim eMail As String = cleanEmail
        Dim registerURL As String = "https://www.globalmethane.org/gmi-admin/register.aspx?email=" & cleanEmail & "&cd=" & securePass

        'During the federal government shutdown, this website will not be updated, and the email inbox will not be monitored. 
        Dim sBody As String
        sBody = "<html><style type='text/css'>body{font-family:'Trebuchet MS'; font-size:90%}</style><body>"
        sBody += "<p>Dear " & sName & ",</p>"
        sBody += "<p>Your email was just used to register with the Global Methane Initiative. To confirm this was you, please follow the link below:</p>"
        sBody += "<p><a href='" & registerURL & "' style='background:#487eb0;color:#f5f6fa;padding:10px;'>Confirm My Registration</a></p>"
        sBody += "<p>If the above link isn't working, try copying and pasting the following link:</p>"
        sBody += "<p><a href='" & registerURL & "'>" & registerURL & "</a>"
        sBody += "</body></html>"

        arrMail(5) = sBody

        clsEmail.SendEventEmail(arrMail)

    End Sub
End Class