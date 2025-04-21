Imports System.Data.SqlClient
Public Class register1
    Inherits System.Web.UI.Page
    Dim LookupValueEmail As String = ""
    Dim LookupValuePass As String = ""
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not (Request.QueryString("cd") Is Nothing) Then
            LookupValueEmail = Request.QueryString("email")
            LookupValuePass = Request.QueryString("cd")
        Else
            Response.Redirect("index.aspx", True)
        End If


        Dim constr As String = Common.GetConnString()

        Dim registerObj As clsRegisterVO
        registerObj = New clsRegisterVO

        Using con As SqlConnection = New SqlConnection(constr)
            Using cmd As SqlCommand = New SqlCommand("select count(*) As CountofRows FROM _gmiUsers where email = '" & LookupValueEmail & "' and password = '" & LookupValuePass & "'")
                cmd.CommandType = CommandType.Text
                cmd.Connection = con
                con.Open()
                Using sdr As SqlDataReader = cmd.ExecuteReader()
                    sdr.Read()
                    If sdr("CountofRows") > 0 Then
                        con.Close()
                        ConfirmRegister()
                        SendMail()

                        Page.ClientScript.RegisterStartupScript(Me.GetType(), "window-script", "registered()", True)
                    Else
                        Response.Redirect("index.aspx", True)
                    End If

                End Using
                con.Close()
            End Using
        End Using


    End Sub

    Private Sub ConfirmRegister()
        Dim constr As String = Common.GetConnString()

        Dim registerObj As clsRegisterVO
        registerObj = New clsRegisterVO

        Using con As SqlConnection = New SqlConnection(constr)
            Using cmd As SqlCommand = New SqlCommand("UPDATE _gmiUsers SET validated = 1 where email='" & LookupValueEmail & "' AND password = '" & LookupValuePass & "'")
                cmd.CommandType = CommandType.Text
                cmd.Connection = con
                con.Open()
                cmd.ExecuteNonQuery()
            End Using
            con.Close()
        End Using

    End Sub

    Private Sub SendMail()

        'arrMail : 0 - To, 1 - cc , 2 - bcc, 3 - from, 4 - subject, 5 - body, 6- format, 7 - attachment.

        Dim arrMail(7) As String

        arrMail(0) = "dougie.harrower@tetratech.com"   'TO
        arrMail(2) = "secretariat@globalmethane.org"    'BCC
        arrMail(3) = "secretariat@globalmethane.org"    'FROM 'IIf(txtEmail.Text.Length > 0, txtEmail.Text, arrMail(0))     
        arrMail(4) = "New User Alert - " & LookupValueEmail
        arrMail(6) = "HTML"

        Dim eMail As String = LookupValueEmail
        Dim approveURL As String = "https://www.globalmethane.org/gmi-admin/approve.aspx?email=" & LookupValueEmail & "&cd=" & LookupValuePass

        'During the federal government shutdown, this website will not be updated, and the email inbox will not be monitored. 
        Dim sBody As String
        sBody = "<html><style type='text/css'>body{font-family:'Trebuchet MS'; font-size:90%}</style><body>"
        sBody += "<p>" & LookupValueEmail & " has asked to register for the GMI Admin Site</p>"
        sBody += "<p>To approve their account, please click the below button.</p>"
        sBody += "<p><a href='" & approveURL & "' style='background:#487eb0;color:#f5f6fa;padding:10px;'>Approve this email address</a></p>"
        sBody += "<p>If the above link isn't working, try copying and pasting the following link:</p>"
        sBody += "<p><a href='" & approveURL & "'>" & approveURL & "</a>"
        sBody += "</body></html>"

        arrMail(5) = sBody

        'clsEmail.SendEventEmail(arrMail)

    End Sub

End Class