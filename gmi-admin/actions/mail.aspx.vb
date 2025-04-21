Imports System.Data
Imports System.Configuration
Imports System.Data.SqlClient
Public Class mail
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim EventName As String = ""
        Dim EventURL As String = ""
        Dim Email As String = ""


        Dim LookupValue As String = ""

        LookupValue = Request.QueryString("id")


        Dim constr As String = Common.GetConnString()
        Using con As SqlConnection = New SqlConnection(constr)
            Using cmd As SqlCommand = New SqlCommand("select contactID, eventName, url, email from _registercontact left join _registerevent on _registercontact.eventID = _registerevent.eventCode where contactID =" & LookupValue)
                cmd.CommandType = CommandType.Text
                cmd.Connection = con
                con.Open()
                Using sdr As SqlDataReader = cmd.ExecuteReader()
                    sdr.Read()
                    EventName = sdr("eventName")
                    EventURL = sdr("url")
                    Email = sdr("email")

                End Using
                con.Close()
            End Using
        End Using


        'arrMail : 0 - To, 1 - cc , 2 - bcc, 3 - from, 4 - subject, 5 - body, 6- format, 7 - attachment.

        Dim arrMail(7) As String

        arrMail(0) = Email   'TO
        arrMail(2) = "secretariat@globalmethane.org"    'BCC
        arrMail(3) = "secretariat@globalmethane.org"    'FROM 'IIf(txtEmail.Text.Length > 0, txtEmail.Text, arrMail(0))     
        arrMail(4) = "Reminder to finish registration for the" & EventName
        arrMail(6) = "HTML"

        'During the federal government shutdown, this website will not be updated, and the email inbox will not be monitored. 
        Dim sBody As String
        sBody = "<html><style type='text/css'>body{font-family:'Trebuchet MS'; font-size:90%}</style><body>"
        sBody += "<p>Hi! It looks like you started registering for the" & EventName & ", but we need a little bit more information.</p>"
        sBody += "<p>To finish registering, please click the link below:</p>"
        sBody += "<p><a href='" & EventURL & "'>" & EventURL & "</a>"
        sBody += "</body></html>"

        arrMail(5) = sBody

        clsEmail.SendEventEmail(arrMail)


        Dim registerObj As clsRegisterVO
        registerObj = New clsRegisterVO

        Using con As SqlConnection = New SqlConnection(constr)
            Using cmd As SqlCommand = New SqlCommand("UPDATE _registercontact SET reminder = '" & Date.Today & "'where contactID=" & LookupValue)
                cmd.CommandType = CommandType.Text
                cmd.Connection = con
                con.Open()
                cmd.ExecuteNonQuery()
            End Using
            con.Close()
        End Using

    End Sub

End Class