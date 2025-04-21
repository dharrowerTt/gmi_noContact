Imports System.Data.SqlClient

Public Class index105
    Inherits System.Web.UI.Page
    Dim EventID As Int16 = 105


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub




    Protected Sub checkUser(ByVal s As Object, ByVal e As EventArgs)

        Dim registerObj As clsRegisterVO
        registerObj = New clsRegisterVO

        registerObj.setEmail(emailaddress.Text)
        registerObj.setEventID(EventID)
        registerObj.setfName(fName.Text)
        registerObj.setlName(lName.Text)




        Dim EmailAdd As String

        EmailAdd = clsRegisterDAO.insertAllBasic(registerObj)



    End Sub



    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        Dim constr As String = Common.GetConnString()


        Using con As SqlConnection = New SqlConnection(constr)
            Using cmd As SqlCommand = New SqlCommand("select count(*) As CountofRows FROM _registercontact where email = '" & emailaddress.Text & "' AND editable = 1 and eventID = " & EventID)
                cmd.CommandType = CommandType.Text
                cmd.Connection = con
                con.Open()
                Using sdr As SqlDataReader = cmd.ExecuteReader()
                    sdr.Read()
                    If sdr("CountofRows") > 0 Then
                        Response.Redirect("success.aspx?ID=" + emailaddress.Text, True)
                    Else
                        checkUser(emailaddress.Text, e)
                        SendMail()
                        Response.Redirect("success.aspx?ID=" + emailaddress.Text)
                    End If

                End Using
                con.Close()
            End Using
        End Using




        'recdirect or popup or whatever you feel like doing
        Response.Redirect("success.aspx?ID=" + emailaddress.Text, True)
    End Sub

    Private Sub SendMail()

        'arrMail : 0 - To, 1 - cc , 2 - bcc, 3 - from, 4 - subject, 5 - body, 6- format, 7 - attachment.

        Dim arrMail(7) As String

        arrMail(0) = emailaddress.Text    'TO
        arrMail(2) = "secretariat@globalmethane.org"    'BCC
        arrMail(3) = "secretariat@globalmethane.org"    'FROM 'IIf(txtEmail.Text.Length > 0, txtEmail.Text, arrMail(0))     
        arrMail(4) = "You have registered to attend the GMI Steering Committee Meeting"
        arrMail(6) = "HTML"

        Dim sName As String = fName.Text & " " & lName.Text
        Dim eMail As String = emailaddress.Text



        'During the federal government shutdown, this website will not be updated, and the email inbox will not be monitored. 
        Dim sBody As String
        sBody = "<html><style type='text/css'>body{font-family:'Trebuchet MS'; font-size:90%}</style><body>"
        sBody += "<p>Dear " & sName & ",</p>"
        sBody += "<p>This confirms your registration for the GMI Steering Committee Meeting. The meeting will take place on Monday, 18 November and Tuesday, 19 November in Paris, France at the United Nations Environment Programme, UNESCO headquarters annex, hosted by the Climate and Clean Air Coalition (CCAC) secretariat.</p>"
        sBody += "<p>More details about the Steering Committee Meeting can be found <a href='http://www.globalmethane.org/steering-nov19'>here</a>. This event page will be updated as details for the meeting are finalized.</p>"
        sBody += "<p>If you have any questions, or wish to cancel your registration, send an email to <a href='mailto:secretariat@globalmethane.org'>secretariat@globalmethane.org</a> and we will be happy to assist you.</p>"
        sBody += "<p>We look forward to seeing you soon!</p>"
        sBody += "<hr>"
        sBody += "<p>Your submitted information:</p>"
        sBody += "<p><strong>Name: </strong>" & sName & "</p>"
        sBody += "<p><strong>Email: </strong>" & eMail & "</p>"
        sBody += "<p><strong>Registered Date: </strong>" & Date.Today() & "</p>"

        sBody += "</body></html>"

        arrMail(5) = sBody

        clsEmail.SendEventEmail(arrMail)

    End Sub
End Class