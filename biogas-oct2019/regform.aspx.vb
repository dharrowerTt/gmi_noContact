Imports System.Data
Imports System.Configuration
Imports System.Data.SqlClient

Public Class regform1
    Inherits System.Web.UI.Page
    Private regCode As String
    Dim EventID As Int16 = 101

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Me.IsPostBack Then

            Dim LookupValue As String = ""

            If Not (Request.QueryString("ID") Is Nothing) Then
                LookupValue = Request.QueryString("ID")
            Else
                Response.Redirect("index.aspx", True)
            End If


            Dim constr As String = Common.GetConnString()
            Using con As SqlConnection = New SqlConnection(constr)
                Using cmd As SqlCommand = New SqlCommand("SELECT * from _registercontact WHERE email = '" & LookupValue & "' AND EventID = " & EventID)
                    cmd.CommandType = CommandType.Text
                    cmd.Connection = con
                    con.Open()
                    Using sdr As SqlDataReader = cmd.ExecuteReader()
                        sdr.Read()
                        contactID.Text = sdr("contactID")
                        fName.Text = sdr("fName").ToString()
                        lName.Text = sdr("lName").ToString()
                        emailAddress.Text = sdr("Email").ToString()
                        jobTitle.Text = sdr("jobTitle").ToString()
                        organization.Text = sdr("organization").ToString()

                        phone.Text = sdr("phone").ToString()
                    End Using
                    con.Close()
                End Using
            End Using
        End If
    End Sub

    Protected Sub updateData(ByVal s As Object, ByVal e As EventArgs)

        Dim registerObj As clsRegisterVO
        registerObj = New clsRegisterVO

        Dim clean As String
        clean = emailAddress.Text.Replace(",", "")

        registerObj.setEmail(clean)
        registerObj.setfName(fName.Text)
        registerObj.setlName(lName.Text)
        registerObj.setjobTitle(jobTitle.Text)
        registerObj.setorganization(organization.Text)
        registerObj.setcountry(country.SelectedItem.Value)
        registerObj.setphone(phone.Text)
        registerObj.setEventID(EventID)


        Dim EmailAdd As String


        EmailAdd = clsRegisterDAO.editRegistration(registerObj)

    End Sub

    Protected Sub updateVisa(ByVal s As Object, ByVal e As EventArgs)

        Dim registerObj As clsRegisterVO
        registerObj = New clsRegisterVO

        registerObj.setContactID(contactID.Text)
        registerObj.setFullName(fullName.Text)
        registerObj.setPassportNumber(PassportNumber.Text)
        registerObj.setIssuance(Issuance.Text)
        registerObj.setIssuanceDate(IssuanceDate.Text)
        registerObj.setExpirationDate(ExpirationDate.Text)
        registerObj.setBirthDate(BirthDate.Text)
        registerObj.setCitizenship(citizenship.SelectedItem.Value)
        registerObj.setEmbassy(embassy.Text)
        registerObj.setSchedule(schedule.Text)


        Dim EmailAdd As String


        EmailAdd = clsRegisterDAO.editVisa(registerObj)

    End Sub

    Protected Sub Button1_Click(ByVal s As Object, ByVal e As EventArgs) Handles Button1.Click
        If fName.Text = "" Or lName.Text = "" Or jobTitle.Text = "" Or organization.Text = "" Or country.SelectedItem.Value = "" Or phone.Text = "" Then

        Else


            updateData(s, e)




            If needVisa.Checked Then
                updateVisa(s, e)
            End If
            SendMail()
        End If


        'recdirect or popup or whatever you feel like doing
        Page.ClientScript.RegisterStartupScript(Me.GetType(), "window-script", "edited()", True)
    End Sub

    Private Sub SendMail()

        'arrMail : 0 - To, 1 - cc , 2 - bcc, 3 - from, 4 - subject, 5 - body, 6- format, 7 - attachment.

        Dim arrMail(7) As String

        arrMail(0) = emailAddress.Text    'TO
        arrMail(2) = "asg@globalmethane.org"    'BCC
        arrMail(3) = "asg@globalmethane.org"    'FROM 'IIf(txtEmail.Text.Length > 0, txtEmail.Text, arrMail(0))     
        arrMail(4) = "You have registered to attend the GMI Biogas Subcommittee Meeting"
        arrMail(6) = "HTML"

        Dim sName As String = fName.Text & " " & lName.Text
        Dim eMail As String = emailAddress.Text
        Dim org As String = organization.Text

        'During the federal government shutdown, this website will not be updated, and the email inbox will not be monitored. 
        Dim sBody As String
        sBody = "<html><style type='text/css'>body{font-family:'Trebuchet MS'; font-size:90%}</style><body>"
        sBody += "<p>Dear " & sName & ",</p>"
        sBody += "<p>This confirms your registration for the GMI Biogas Subcommittee Meeting. The meeting will take place on Monday, 28 October at the Madison Marriott West Hotel in Wisconsin, United States. More details about the Subcommittee Meeting can be found <a href='https://www.globalmethane.org/news-events/event_detailsbyID.aspx?eventID=529'>here</a>. This event page will be updated as details for the meeting are finalized.</p>"
        sBody += "<p>This year, the GMI Biogas Subcommittee Meeting will be held in conjunction with <a href='https://globalmethane.org/news-events/event_detailsbyID.aspx?eventid=530'>BioCycle REFOR19: Renewable Energy from Organics Recycling conference</a> which runs from 28 through 31 October. Anyone who wishes to participate in the BioCycle conference, which is separate from the GMI Biogas Subcommittee meeting, must <a href='https://www.cvent.com/events/biocycle-refor19/registration-0837e4e4cfe54009abab009796fa4bd7.aspx?fqp=true'>register separately with BioCycle</a>.</p>"
        sBody += "<p>If you have any questions, or wish to cancel your registration, send an email to <a href='mailto:asg@globalmethane.org'>asg@globalmethane.org</a> and we will be happy to assist you.</p>"
        sBody += "<p>We look forward to seeing you in Wisconsin!</p>"
        sBody += "<hr>"
        sBody += "<p>Your submitted information:</p>"
        sBody += "<p><strong>Name: </strong>" & sName & "</p>"
        sBody += "<p><strong>Email: </strong>" & eMail & "</p>"
        sBody += "<p><strong>Organization: </strong>" & org & "</p>"
        sBody += "<p><strong>Registered Date: </strong>" & Date.Today() & "</p>"

        sBody += "</body></html>"

        arrMail(5) = sBody

        clsEmail.SendEventEmail(arrMail)

    End Sub
End Class