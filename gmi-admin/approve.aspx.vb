Imports System.Data.SqlClient

Public Class approve
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
                        ConfirmApproved()
                        SendMail()

                        Page.ClientScript.RegisterStartupScript(Me.GetType(), "window-script", "approved()", True)
                    Else
                        Response.Redirect("index.aspx", True)
                    End If

                End Using
                con.Close()
            End Using
        End Using

    End Sub

    Private Sub ConfirmApproved()
        Dim constr As String = Common.GetConnString()

        Dim registerObj As clsRegisterVO
        registerObj = New clsRegisterVO

        Using con As SqlConnection = New SqlConnection(constr)
            Using cmd As SqlCommand = New SqlCommand("UPDATE _gmiUsers SET approved = 1 where email='" & LookupValueEmail & "' AND password = '" & LookupValuePass & "'")
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

        arrMail(0) = LookupValueEmail   'TO
        arrMail(2) = "secretariat@globalmethane.org"    'BCC
        arrMail(3) = "secretariat@globalmethane.org"    'FROM 'IIf(txtEmail.Text.Length > 0, txtEmail.Text, arrMail(0))     
        arrMail(4) = "You've been approved!"
        arrMail(6) = "HTML"

        Dim eMail As String = LookupValueEmail
        Dim loginURL As String = "https://www.globalmethane.org/gmi-admin/index.aspx"

        'During the federal government shutdown, this website will not be updated, and the email inbox will not be monitored. 
        Dim sBody As String
        sBody = "<html><style type='text/css'>body{font-family:'Trebuchet MS'; font-size:90%}</style><body>"
        sBody += "<p>Great news! You've been approved for the GMI Admin Site.</p>"
        sBody += "<p>You can login by clicking below:</p>"
        sBody += "<p><a href='" & loginURL & "' style='background:#487eb0;color:#f5f6fa;padding:10px;'>Login to GMI Admin Site</a></p>"
        sBody += "<p>If the above link isn't working, try copying and pasting the following link:</p>"
        sBody += "<p><a href='" & loginURL & "'>" & loginURL & "</a>"
        sBody += "</body></html>"

        arrMail(5) = sBody

        clsEmail.SendEventEmail(arrMail)

    End Sub

End Class