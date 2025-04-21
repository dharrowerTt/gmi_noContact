Imports System.Data
Imports System.Configuration
Imports System.Data.SqlClient

Public Class regform110
    Inherits System.Web.UI.Page
    Private regCode As String
    Dim EventID As Int16 = 110


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Me.IsPostBack Then

            Dim LookupValue As String = ""

            If Not (Request.QueryString("id") Is Nothing) Then
                LookupValue = Request.QueryString("id")
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

                        If Not IsDBNull(sdr("editable")) Then
                            If sdr("editable") = True Then
                                Response.Redirect("success.aspx?id=" & LookupValue)
                            End If
                        End If

                        contactID.Text = sdr("contactID")
                        fName.Text = sdr("fName").ToString()
                        lName.Text = sdr("lName").ToString()
                        emailAddress.Text = sdr("Email").ToString()
                        jobTitle.Text = sdr("jobTitle").ToString()
                        organization.Text = sdr("organization").ToString()

                        phone.Text = sdr("phone").ToString()

                        If sdr("speakerstatus") IsNot DBNull.Value Then



                            If sdr("speakerstatus") = True Then
                                speakerdiv.Attributes.Add("style", "display:block;opacity:1;")
                                speakerreg.Attributes.Add("style", "display:block;opacity:1;")
                            Else
                                regreg.Attributes.Add("style", "display:block;opacity:1;")
                            End If

                        Else
                            regreg.Attributes.Add("style", "display:block;opacity:1;")
                        End If

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
        Dim selectedItems As String
        Dim ccacMemberText As String
        Dim attend23Text As String
        Dim attend24Text As String
        Dim attend25Text As String
        Dim attend26Text As String
        Dim attend27Text As String
        clean = emailAddress.Text.Replace(",", "")
        attend23Text = ""
        attend24Text = ""
        attend25Text = ""
        attend26Text = ""
        attend27Text = ""
        ccacMemberText = ""
        selectedItems = ""



        For Each item In sector.Items

            If item.Selected = True Then

                selectedItems += item.Value & ", "

            End If

        Next


        If attend23.Checked Then
            attend23Text = "Monday, 23 March"
        End If
        If attend24.Checked Then
            attend24Text = "Tuesday, 24 March"
        End If
        If attend25.Checked Then
            attend25Text = "Wednesday, 25 March"
        End If
        If attend26.Checked Then
            attend26Text = "Thursday, 26 March"
        End If
        If attend27.Checked Then
            attend27Text = "Friday, 27 March"
        End If

        registerObj.setEmail(clean)
        registerObj.setfName(fName.Text)
        registerObj.setlName(lName.Text)
        registerObj.setjobTitle(jobTitle.Text)
        registerObj.setorganization(organization.Text)
        registerObj.setcountry(country.SelectedItem.Value)
        registerObj.setphone(phone.Text)

        registerObj.setInternationalPhone(internationalPhone.Text)
        registerObj.setDietaryRequirements(dietaryRequirements.Text)

        registerObj.setSpecialNeeds(specialNeeds.Text)
        registerObj.setSectorGMF(selectedItems)
        registerObj.setAttend23(attend23Text)
        registerObj.setAttend24(attend24Text)
        registerObj.setAttend25(attend25Text)
        registerObj.setAttend26(attend26Text)
        registerObj.setAttend27(attend27Text)
        registerObj.setAwareness(awareness.Text)



        registerObj.setEventID(EventID)


        Dim EmailAdd As String


        EmailAdd = clsRegisterDAO.editRegistration(registerObj)

    End Sub

    Protected Sub updateVisa(ByVal s As Object, ByVal e As EventArgs)



    End Sub

    Protected Sub Button1_Click(ByVal s As Object, ByVal e As EventArgs) Handles Button1.Click
        If fName.Text = "" Or lName.Text = "" Or jobTitle.Text = "" Or organization.Text = "" Or country.SelectedItem.Value = "" Or phone.Text = "" Then

        Else


            updateData(s, e)

            SendMail()

            Response.Redirect("success.aspx?id=" & emailAddress.Text)

        End If


        'recdirect or popup or whatever you feel like doing
        Page.ClientScript.RegisterStartupScript(Me.GetType(), "window-script", "edited()", True)
    End Sub
    Protected Sub Button2_Click(ByVal s As Object, ByVal e As EventArgs) Handles Button2.Click
        If fName.Text = "" Or lName.Text = "" Or jobTitle.Text = "" Or organization.Text = "" Or country.SelectedItem.Value = "" Or phone.Text = "" Then

        Else


            updateData(s, e)

            SendMail()

            Response.Redirect("success.aspx?id=" & emailAddress.Text)

        End If


        'recdirect or popup or whatever you feel like doing
        Page.ClientScript.RegisterStartupScript(Me.GetType(), "window-script", "edited()", True)
    End Sub
    Private Sub SendMail()

        'arrMail : 0 - To, 1 - cc , 2 - bcc, 3 - from, 4 - subject, 5 - body, 6- format, 7 - attachment.

        Dim arrMail(7) As String

        arrMail(0) = emailAddress.Text    'TO
        arrMail(2) = "secretariat@globalmethane.org"    'BCC
        arrMail(3) = "secretariat@globalmethane.org"    'FROM 'IIf(txtEmail.Text.Length > 0, txtEmail.Text, arrMail(0))     
        arrMail(4) = "You have registered to attend the GMF2020"
        arrMail(6) = "HTML"

        Dim sName As String = fName.Text & " " & lName.Text
        Dim eMail As String = emailAddress.Text
        Dim org As String = organization.Text

        'During the federal government shutdown, this website will not be updated, and the email inbox will not be monitored. 
        Dim sBody As String
        sBody = "<html><style type='text/css'>body{font-family:'Trebuchet MS'; font-size:90%}</style><body>"
        sBody += "<p>Dear " & sName & ",</p>"
        sBody += "<p>This confirms your registration for the Global Methane Forum 2020. The meeting will take place on Monday, 23 - Friday, 27 March, 2020 in Geneva, Switzerland.</p>"
        sBody += "<p>GMF 2020 is being hosted by UNECE at the Palais des Nations, Geneva, Switzerland.  All participants must also <a href='https://www.unece.org/index.php?id=52506' target='_blank'>register with UNECE</a> to obtain access to the event.  To register with UNECE:</p>"
        sBody += "<ol><li>Go to <a href='https://www.unece.org/index.php?id=52506' target='_blank'>UNECE’s Global Methane Forum 2020 event page</a>.  Scroll to the bottom of the page where registration information and documentation are presented.</li>"
        sBody += "<li>On the Registration tab, click the 'ONLINE REGISTRATION' link.</li>"
        sBody += "<li>Log into the UNCDB Online Meeting Registration system.  Participants who have previously registered to attend a UNECE event will have an existing user account.  If this is your first time, create a new account to begin.</li></ol>"
        sBody += "<img src='https://www.globalmethane.org/gmf2020/eventimages/email/unece_page1.png'><br>"
        sBody += "<img src='https://www.globalmethane.org/gmf2020/eventimages/email/unece_page2.png'><br>"
        sBody += "<p>If you have any questions, or wish to cancel your registration, send an email to <a href='mailto:secretariat@globalmethane.org?subject=GMF2020'>secretariat@globalmethane.org</a> and we will be happy to assist you.</p>"
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