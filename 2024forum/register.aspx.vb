Imports System.Data.SqlClient
Public Class register2
    Inherits System.Web.UI.Page
    Private Shared submissionID As Integer
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load



    End Sub

    Protected Sub submit_Click(sender As Object, e As EventArgs) Handles submit.Click
        Dim rowNumber As Integer = 0
        Dim emailLookup As String = email.Text

        Dim constr As String = Common.GetConnString()
        Using con As SqlConnection = New SqlConnection(constr)
            Using cmd As SqlCommand = New SqlCommand("SELECT * from __2024register WHERE email = '" & emailLookup & "'")
                cmd.CommandType = CommandType.Text
                cmd.Connection = con
                con.Open()
                Using sdr As SqlDataReader = cmd.ExecuteReader()
                    sdr.Read()
                    If sdr.HasRows = True Then
                        Response.Redirect("registered.aspx?id=found", True)
                    Else
                    End If
                End Using
                con.Close()
            End Using
        End Using

        Dim IPm1 As Integer = 0
        Dim IPm2 As Integer = 0
        Dim IPm3 As Integer = 0
        Dim IPm4 As Integer = 0
        Dim IPt1 As Integer = 0
        Dim IPw1 As Integer = 0
        Dim IPw2 As Integer = 0
        Dim IPw3 As Integer = 0
        Dim IPth1 As Integer = 0
        Dim IPr1 As Integer = 0
        Dim IPr2 As Integer = 0
        Dim Vm1 As Integer = 0
        Dim Vm2 As Integer = 0
        Dim Vt1 As Integer = 0
        Dim Vw1 As Integer = 0

        Dim Poster As String = ""
        Dim OptOut As Integer = 0


        If IPmondayUNECE.Checked Then
            IPm1 = 1
        End If
        If IPmondayBiogas.Checked Then
            IPm2 = 1
        End If
        If IPmondayGMI.Checked Then
            IPm3 = 1
        End If
        If IPmondayCoal.Checked Then
            IPm4 = 1
        End If
        If IPtuesdayPlenary.Checked Then
            IPt1 = 1
        End If
        If IPwednesdayCoal.Checked Then
            IPw1 = 1
        End If
        If IPwednesdayBiogas.Checked Then
            IPw2 = 1
        End If
        If IPwednesdayOilGas.Checked Then
            IPw3 = 1
        End If
        If IPthursdayUNECE.Checked Then
            IPth1 = 1
        End If
        If IPmondayReception.Checked Then
            IPr1 = 1
        End If
        If IPtuesdayReception.Checked Then
            IPr2 = 1
        End If
        If VmondayBiogas.Checked Then
            Vm1 = 1
        End If
        If VmondaySteering.Checked Then
            Vm2 = 2
        End If
        If VtuesdayPlenary.Checked Then
            Vt1 = 1
        End If
        If VwednesdayBiogas.Checked Then
            Vw1 = 1
        End If

        If posterPicker.SelectedIndex > -1 Then
            Poster = posterPicker.SelectedValue
        End If
        If optOutCheck.Checked Then
            OptOut = 1
        End If

        Dim sqlText = "INSERT INTO __2024register (firstName,lastName,email,jobTitle,country,organization,orgType,created,attendanceType, IPmondayUNECE,IPmondayBiogas,IPmondayCoal,IPmondayGMI,IPtuesdayPlenary,IPwednesdayCoal,IPwednesdayBiogas,IPwednesdayOilGas, IPthursdayUNECE, IPmondayReception,IPtuesdayReception, VmondayBiogas, VmondaySteering, VtuesdayPlenary,VwednesdayBiogas,poster,optOut) VALUES (@firstName, @lastName, @email, @jobTitle, @country,@organization,@orgType,@created,@attendanceType, @IPmondayUNECE,@IPmondayBiogas,@IPmondayCoal,@IPmondayGMI,@IPtuesdayPlenary,@IPwednesdayCoal,@IPwednesdayBiogas,@IPwednesdayOilGas, @IPthursdayUNECE, @IPmondayReception,@IPtuesdayReception,@VmondayBiogas,@VmondaySteering,@VtuesdayPlenary,@VwednesdayBiogas,@poster,@optOut);select id from __2024register where id = @@identity"
        Using cnConnect = New SqlConnection(Common.GetConnString())
            Using cm = New SqlCommand(sqlText, cnConnect)
                cnConnect.Open()
                cm.Parameters.Add("@firstName", SqlDbType.NVarChar).Value = firstName.Text
                cm.Parameters.Add("@lastName", SqlDbType.NVarChar).Value = lastName.Text
                cm.Parameters.Add("@email", SqlDbType.NVarChar).Value = email.Text
                cm.Parameters.Add("@jobTitle", SqlDbType.NVarChar).Value = jobTitle.Text
                cm.Parameters.Add("@country", SqlDbType.NVarChar).Value = country.Text
                cm.Parameters.Add("@organization", SqlDbType.NVarChar).Value = organization.Text
                cm.Parameters.Add("@orgType", SqlDbType.NVarChar).Value = orgType.SelectedItem.Text
                cm.Parameters.Add("@created", SqlDbType.Date).Value = Today()
                cm.Parameters.Add("@attendanceType", SqlDbType.NVarChar).Value = attendanceType.SelectedValue
                cm.Parameters.Add("@IPmondayUNECE", SqlDbType.Int).Value = IPm1
                cm.Parameters.Add("@IPmondayBiogas", SqlDbType.Int).Value = IPm2
                cm.Parameters.Add("@IPmondayCoal", SqlDbType.Int).Value = IPm4
                cm.Parameters.Add("@IPmondayGMI", SqlDbType.Int).Value = IPm3
                cm.Parameters.Add("@IPtuesdayPlenary", SqlDbType.Int).Value = IPt1
                cm.Parameters.Add("@IPwednesdayCoal", SqlDbType.Int).Value = IPw1
                cm.Parameters.Add("@IPwednesdayBiogas", SqlDbType.Int).Value = IPw2
                cm.Parameters.Add("@IPwednesdayOilGas", SqlDbType.Int).Value = IPw3
                cm.Parameters.Add("@IPthursdayUNECE", SqlDbType.Int).Value = IPth1
                cm.Parameters.Add("@IPmondayReception", SqlDbType.Int).Value = IPr1
                cm.Parameters.Add("@IPtuesdayReception", SqlDbType.Int).Value = IPr2
                cm.Parameters.Add("@VmondayBiogas", SqlDbType.Int).Value = Vm1
                cm.Parameters.Add("@VmondaySteering", SqlDbType.Int).Value = Vm2
                cm.Parameters.Add("@VtuesdayPlenary", SqlDbType.Int).Value = Vt1
                cm.Parameters.Add("@VwednesdayBiogas", SqlDbType.Int).Value = Vw1
                cm.Parameters.Add("@poster", SqlDbType.NVarChar).Value = Poster
                cm.Parameters.Add("@optOut", SqlDbType.Int).Value = OptOut


                Dim currentID As Integer = cm.ExecuteScalar()
                'Set the ID value to RowNumber for redirection
                rowNumber = currentID
            End Using
        End Using

        submissionID = rowNumber

        Dim selectedItems As List(Of ListItem) = (From li In areaOfInterest.Items.Cast(Of ListItem)() Where li.Selected = True Select li).ToList
        Dim sqlText2 As String = ""
        For Each item In selectedItems

            If item.Value = "Other" Then

                item.Value = item.Value & " - " & other.Text

            End If

            sqlText = "INSERT INTO __2024formAOE (registerid,area) VALUES (@registerid, @area)"
            Using cnConnect = New SqlConnection(Common.GetConnString())
                Using cm = New SqlCommand(sqlText, cnConnect)
                    cnConnect.Open()
                    cm.Parameters.Add("@registerid", SqlDbType.Int).Value = rowNumber
                    cm.Parameters.Add("@area", SqlDbType.NVarChar).Value = item.Value
                    cm.ExecuteScalar()
                End Using
            End Using
        Next

        Dim selectedProjectItems As List(Of ListItem) = (From li In aoiProjects.Items.Cast(Of ListItem)() Where li.Selected = True Select li).ToList
        Dim sqlText3 As String = ""
        For Each item In selectedProjectItems

            If item.Value = "Other" Then

                item.Value = item.Value & " - " & aoiProjectsOther.Text

            End If

            sqlText = "INSERT INTO __2024formProjects (registerid,area) VALUES (@registerid, @area)"
            Using cnConnect = New SqlConnection(Common.GetConnString())
                Using cm = New SqlCommand(sqlText, cnConnect)
                    cnConnect.Open()
                    cm.Parameters.Add("@registerid", SqlDbType.Int).Value = rowNumber
                    cm.Parameters.Add("@area", SqlDbType.NVarChar).Value = item.Value
                    cm.ExecuteScalar()
                End Using
            End Using
        Next

        Dim arrMail(7) As String

        arrMail(0) = email.Text   'TO
        arrMail(2) = "secretariat@globalmethane.org"    'BCC
        arrMail(3) = "secretariat@globalmethane.org"    'FROM 'IIf(txtEmail.Text.Length > 0, txtEmail.Text, arrMail(0))     
        'arrMail(4) = "Thanks for registering for the 2024 Global Methane Forum!"
        arrMail(6) = "HTML"


        Dim sBody As String = ""

        If attendanceType.SelectedValue = "In person" Then

            arrMail(4) = "Thank you for registering for the 2024 Global Methane Forum"

            sBody = "<html><style type='text/css'>body{font-family:'Calibri'; font-size:90%}</style><body>"
            sBody += "<p>Thank you for registering for the 2024 Global Methane Forum, hosted by the Global Methane Initiative (GMI) and the United Nations Economic Commission for Europe (UNECE), in partnership with the Global Methane Hub and the Climate and Clean Air Coalition. This email confirms your in-person registration.</p>"

            sBody += "<p>If you have not done so already, please be sure to register for the event with UNECE: https://unece.org/sustainable-energy/events/global-methane-forum-2024. Registering with UNECE is required to ensure that you are accounted for in their system and will be able to access the Palais des Nations in Geneva, Switzerland where the Forum will be held.</p>"

            sBody += "<p>More details about the 2024 Forum, including a preliminary agenda, are available on the <a href='https://www.globalmethane.org/2024forum/' target='_blank'>Forum's event page</a>. Additional information will be added as it becomes available, including accommodations and logistical details.</p>"

            sBody += "<p>If you need to update or cancel your registration, please email secretariat@globalmethane.org and we will be happy to assist you.</p><p>Thank you for your interest in the 2024 Forum!</p><p>Regards,</p><p>GMI Secretariat</p></body></html>"

        ElseIf attendanceType.SelectedValue = "Virtually" Then

            arrMail(4) = "Livestreaming of the 2024 Global Methane Forum"

            sBody = "<html><style type='text/css'>body{font-family:'Calibri'; font-size:90%}</style><body>"
            sBody += "<p>Thank you for registering for the 2024 Global Methane Forum, hosted by the Global Methane Initiative (GMI) and the United Nations Economic Commission for Europe (UNECE), in partnership with the Global Methane Hub and the Climate and Clean Air Coalition. This email confirms your virtual registration.</p>"

            sBody += "<p>Please visit the <a href='https://www.globalmethane.org/2024forum/livestreaming.aspx' target='_blank'>Livestreaming tab</a> on the 2024 Forum website to access the livestreamed sessions.</p>"


            sBody += "<p>Thank you for your interest in the 2024 Forum! </p><p>Regards,</p><p>GMI Secretariat</p></body></html>"

        ElseIf attendanceType.SelectedValue = "Both" Then

            arrMail(4) = "Thank you for registering for the 2024 Global Methane Forum "

            sBody = "<html><style type='text/css'>body{font-family:'Calibri'; font-size:90%}</style><body>"
            sBody += "<p>Thank you for registering for the 2024 Global Methane Forum, hosted by the Global Methane Initiative (GMI) and the United Nations Economic Commission for Europe (UNECE), in partnership with the Global Methane Hub and the Climate And Clean Air Coalition. This email confirms your registration.</p>"

            sBody += "<p>If you have not done so already, please be sure to register for the Event With UNECE: https://unece.org/sustainable-energy/events/global-methane-forum-2024. Registering with UNECE is required to ensure that you are accounted for in their system and will be able to access the Palais des Nations in Geneva, Switzerland where the Forum will be held.</p>"

            sBody += "<p>Please visit the Livestreaming tab On the 2024 Forum website for details about how to join the livestreamed sessions. You will be able to click On direct links to the Plenary Sessions and Technical Sessions from this webpage. We will also provide tips For how To connect to livestreaming sessions, how To use closed captions, and will include troubleshooting information if you cannot see or hear the speakers.</p>"

            sBody += "<p>Details about the Forum, including agendas, speaker biographies, and a list of accommodations are available on the <a href='https://www.globalmethane.org/2024forum/' target='_blank'>Forum's event page</a>.

                If you need to update or cancel your registration, please email secretariat@globalmethane.org and we will be happy to assist you."

            sBody += "<p>Thank you for your interest in the 2024 Forum!</p><p>Regards,</p><p>GMI Secretariat</p></body></html>"


        End If


        arrMail(5) = sBody

        clsEmail.SendEventEmail(arrMail)

        If Poster = "yes" Then

            arrMail(4) = "ACTION: Methane Action Showcase at the Global Methane Forum"

            sBody = "<html><style type='text/css'>body{font-family:'Calibri'; font-size:90%}</style><body>"
            sBody += "<p>Dear Global Methane Forum Registrant,</p>"
            sBody += "<p>Thank you for registering for the 2024 Global Methane Forum and indicating interest in participating in the Showcase Opportunity! We are following up to provide more information and gather the necessary information for the Global Methane Initiative (GMI) Secretariat (Secretariat) and Forum Planning Committee (Committee) to create your Showcase poster.</p>"
            sBody += "<p><strong>What is the Methane Action Showcase?</strong> The Methane Action Showcase will be a networking opportunity to showcase innovative and successful methane mitigation projects, policies, technology applications, and other activities aimed at mobilizing replicable actions to reduce global methane emissions. Examples of methane mitigation activities to showcase include, but are not limited to: government policies, programs, or regulations; corporate programs, policies, or approaches; non-government or international initiatives that support methane management; finance programs supporting methane mitigation; and many more. The Secretariat and Committee will select, on a rolling basis, up to 50 Showcase posters to be displayed at the Forum, ensuring diversity by geography, type of activity, and sector. Selected Showcase posters will be displayed in one or all of the following venues and/or formats, space and other constraints permitting: during reception events on Monday (18 March 2024) and Tuesday (19 March 2024) evening, as part of a PowerPoint loop shown during meeting breaks, and/or on GMI’s website. The Showcase posters will be produced in two sizes and orientations and will be light on text, feature interesting visuals, and include a QR code to allow viewers to learn more about your project.</p>"
            sBody += "<p><strong>How to Submit a Showcase Idea?</strong>"
            sBody += "<ul><li>Fill out the <strong>Methane Action Showcase Form</strong> On the <a href='https://globalmethane.org/2024forum/showcase.html'>Methane Action Showcase webpage</a> which will request information On your Showcase activity.</li><li>The Secretariat and Committee will create your Showcase poster based on the information you provide.</li><li>You will have the opportunity to review the Showcase poster before it is produced.</li><li>For more information, visit the <a href='https://globalmethane.org/2024forum/showcase.html'>Methane Action Showcase webpage</a>.</li></ul>"
            sBody += "<strong>Deadline:</strong> Showcase submissions are due 9 February 2024 via email to <a href='mailto:secretariat@globalmethane.org'>secretariat@globalmethane.org</a>. You may submit more than one entry. Submissions before the deadline are encouraged!</p>"
            sBody += "<p>If you have any questions, please reach out to <a href='mailto:secretariat@globalmethane.org'>secretariat@globalmethane.org</a>.</p>"
            sBody += "<p>Thank you again for your interest in the Methane Action Showcase at the 2024 Global Methane Forum and remember to submit your information by 9 February 2024!</p><p>Regards,</p><p>Denise Mulholland<br>Director, Secretariat<br>Global Methane Initiative<br><a href='mailto:secretariat@globalmethane.org'>secretariat@globalmethane.org</a></p></body></html>"

            arrMail(5) = sBody

            clsEmail.SendEventEmail(arrMail)

        End If

        Dim regCount As Integer

        Using con As SqlConnection = New SqlConnection(constr)
            Using cmd As SqlCommand = New SqlCommand("SELECT count(email) as registrantCount FROM [dbo].[__2024register]")
                cmd.CommandType = CommandType.Text
                cmd.Connection = con
                con.Open()
                Using sdr As SqlDataReader = cmd.ExecuteReader()
                    sdr.Read()
                    If sdr.HasRows = True Then
                        regCount = sdr("registrantCount")
                    Else
                    End If
                End Using
                con.Close()
            End Using
        End Using


        If regCount = 1000 Then


            arrMail(0) = "cathy.mcgirl@tetratech.com;chris.bachman@tetratech.com;shannon.ferguson@tetratech.com;emma.eichelman@tetratech.com;victoria.eng@tetratech.com;clare.trinity@tetratech.com"   'TO
            arrMail(2) = "dougieharrower@gmail.com"    'BCC
            arrMail(3) = "secretariat@globalmethane.org"    'FROM 'IIf(txtEmail.Text.Length > 0, txtEmail.Text, arrMail(0))     
            'arrMail(4) = "Thanks for registering for the 2024 Global Methane Forum!"
            arrMail(6) = "HTML"


            sBody = ""

            arrMail(4) = "Hello, Dougie here!"

            sBody = "<html><style type='text/css'>body{font-family:'Calibri'; font-size:90%}</style><body>"
            sBody += "<p>If you're reading this, I have died. More accurately, the 1000th person has just registered for the forum.</p>"

            sBody += "<p>Who are they? Well, thanks to a custom-coded AI algorithm, I can provide an astonishingly accurate amount of information about them. Like '<em>G-day, mate! Watch out for the dingos</em>, our registrant is from " & country.Text & "!</p>"

            sBody += "<p>Are the career driven?! Oh you bet! You don't get to be an industry expert at " & organization.Text & "  without <em>flipping a lot of pancakes.</em></p>"

            sBody += "<p>Kidding! The 1000th registrant is " & firstName.Text & " " & lastName.Text & " - " & email.Text & ". You can check out their info on the dashboard, which is updated to look a wee bit better on mobile devices. </p> <p>Goodbye forever</p></body></html>"

            arrMail(5) = sBody

            clsEmail.SendEventEmail(arrMail)

        End If


        Response.Redirect("registered.aspx", True)




    End Sub





End Class