Imports System.Data
Imports System.Text
Imports System.Configuration
Imports System.Web.Services
Imports System.Web.Script.Services
Imports System.Data.SqlClient
Public Class step5
    Inherits System.Web.UI.Page
    Public Shared submissionID As Integer
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then

            If String.IsNullOrEmpty(Request.QueryString("id")) = False Then
                submissionID = Server.HtmlEncode(Request.QueryString("id"))
            ElseIf Request.Form.Count > 0 Then
                submissionID = Request.Form("submissionID")
            End If

        End If



        Dim constr As String = Common.GetConnString()
        Using con As SqlConnection = New SqlConnection(constr)
            Dim ca As Integer
            Dim cb As String
            Dim cc As String
            Dim cd As String

            ca = submissionID Mod 2
            cb = submissionID.ToString
            cc = cb.Substring(0, Len(cb) / 2)
            cd = cb.Substring((Len(submissionID) / 2) + 1)

            If ca = 0 And Len(cb) > 4 And cc = cd Then

                submissionID = Convert.ToInt32(cd)

            End If

            Using cmd As SqlCommand = New SqlCommand("SELECT * from gmcSubmission WHERE id = " & submissionID)
                cmd.CommandType = CommandType.Text
                cmd.Connection = con
                con.Open()
                Using sdr As SqlDataReader = cmd.ExecuteReader()
                    sdr.Read()

                    organizationname.Text = sdr("orgName").ToString()
                    location.Text = sdr("location").ToString()
                    organizationwebsite.Text = sdr("orgSite").ToString()
                    pocname.Text = sdr("pocName").ToString()
                    phonenumber.Text = sdr("phoneNumber").ToString()
                    emailaddress.Text = sdr("emailAddress").ToString()
                    actiontitle.Text = sdr("activityName").ToString()

                    If sdr("biogasSector") = True Then
                        BioGasCheck.Checked = True
                    End If
                    BioGasCheck.Enabled = False
                    If sdr("coalminesSector") = True Then
                        CoalMinesCheck.Checked = True
                    End If
                    CoalMinesCheck.Enabled = False
                    If sdr("oilgasSector") = True Then
                        OilGasCheck.Checked = True
                    End If
                    OilGasCheck.Enabled = False

                    activitylocation.Text = sdr("partnerCountries").ToString()
                    partners.Text = sdr("partnerOrgs").ToString()

                    If Len(sdr("activityDescription").ToString()) > 1 Then
                        activityinfo.Text = sdr("activityDescription").ToString()
                    End If

                    If Len(sdr("outcomes").ToString()) > 1 Then
                        resultsinfo.Text = sdr("outcomes").ToString()
                    End If

                    If Len(sdr("nextsteps").ToString()) > 1 Then
                        nextsteps.Text = sdr("nextsteps").ToString()
                    End If


                    urlList.Text = sdr("urlList").ToString()
                    videoList.Text = sdr("youtubeList").ToString()

                End Using
                con.Close()
            End Using
        End Using

        Using conn As SqlConnection = New SqlConnection(constr)
            Using sda As SqlDataAdapter = New SqlDataAdapter("SELECT * FROM gmcSubmissionImages where submissionID = " & submissionID, conn)
                Dim dt As DataTable = New DataTable()
                sda.Fill(dt)
                gvImages.DataSource = dt
                gvImages.DataBind()
            End Using
        End Using




    End Sub

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click

        SendMail()

        Response.Redirect("http://globalmethane.org/challenge/submission/thankyou.html", True)
    End Sub

    Private Sub SendMail()

        Dim EMorganizationName As String = ""
        Dim EMlocation As String = ""
        Dim EMOrgWebsite As String = ""
        Dim EMPOCname As String = ""
        Dim EMPhoneNo As String = ""
        Dim EMEmailAddr As String = ""
        Dim EMActionTitle As String = ""
        Dim EMSector As String = ""
        Dim EMactivityLocale As String = ""
        Dim EMpartners As String = ""
        Dim EMactivityInfo As String = ""
        Dim EMresultsInfo As String = ""
        Dim EMnextSteps As String = ""
        Dim EMurlList As String = ""
        Dim EMvideoList As String = ""

        Dim constr As String = Common.GetConnString()
        Using con As SqlConnection = New SqlConnection(constr)
            Using cmd As SqlCommand = New SqlCommand("SELECT * from gmcSubmission WHERE id = " & submissionID)
                cmd.CommandType = CommandType.Text
                cmd.Connection = con
                con.Open()
                Using sdr As SqlDataReader = cmd.ExecuteReader()
                    sdr.Read()

                    EMorganizationName = sdr("orgName").ToString()
                    EMlocation = sdr("location").ToString()
                    EMOrgWebsite = sdr("orgSite").ToString()
                    EMPOCname = sdr("pocName").ToString()
                    EMPhoneNo = sdr("phoneNumber").ToString()
                    EMEmailAddr = sdr("emailAddress").ToString()
                    EMActionTitle = sdr("activityName").ToString()

                    If sdr("biogasSector") = True Then
                        EMSector += "Biogas"
                    End If

                    If sdr("coalminesSector") = True Then
                        If Len(EMSector) > 0 Then
                            EMSector += ", "
                        End If
                        EMSector += "Coal Mines"
                    End If

                    If sdr("oilgasSector") = True Then
                        If Len(EMSector) > 0 Then
                            EMSector += ", "
                        End If
                        EMSector += "Oil & Gas"
                    End If


                    EMactivityLocale = sdr("partnerCountries").ToString()
                    EMpartners = sdr("partnerOrgs").ToString()

                    If Len(sdr("activityDescription").ToString()) > 1 Then
                        EMactivityInfo = sdr("activityDescription").ToString()
                    End If

                    If Len(sdr("outcomes").ToString()) > 1 Then
                        EMresultsInfo = sdr("outcomes").ToString()
                    End If

                    If Len(sdr("nextsteps").ToString()) > 1 Then
                        EMnextSteps = sdr("nextsteps").ToString()
                    End If


                    EMurlList = sdr("urlList").ToString()
                    EMvideoList = sdr("youtubeList").ToString()

                End Using
                con.Close()
            End Using
        End Using

        Dim arrMail(7) As String

        arrMail(0) = "asg@globalmethane.org"    'TO
        arrMail(2) = "sam.tremaine@tetratech.com"    'BCC
        arrMail(3) = "asg@globalmethane.org"    'FROM 'IIf(txtEmail.Text.Length > 0, txtEmail.Text, arrMail(0))     
        arrMail(4) = "New GMC Submission!"
        arrMail(6) = "HTML"


        Dim sBody As String
        sBody = "<html><style type='text/css'>body{font-family:'Trebuchet MS'; font-size:90%}</style><body>"
        sBody += "<p>Great news! There's been a new submission!</p>"
        sBody += "<p>From: " & EMPOCname & " - " & EMEmailAddr & " - " & EMorganizationName & "</p>"
        sBody += "<p>Location:</p>"
        sBody += EMlocation
        sBody += "<p>Website</p>"
        sBody += EMOrgWebsite
        sBody += "<p>Phone Number</p>"
        sBody += EMPhoneNo
        sBody += "<p>Title of Global Methane Challenge action</p>"
        sBody += EMActionTitle
        sBody += "<p>Sector</p>"
        sBody += EMSector
        sBody += "<p>Description of activity</p>"
        sBody += EMactivityInfo
        sBody += "<p>Are you working with other partners on this action? Please describe.</p>"
        sBody += EMpartners
        sBody += "<p>Where are you planning to take the action(s)?</p>"
        sBody += EMactivityLocale
        sBody += "<p>Outcomes and results of your action</p>"
        sBody += EMresultsInfo
        sBody += "<p>Next steps/future actions</p>"
        sBody += EMnextSteps
        sBody += "<p>Where can people go to learn more about your project?</p>"
        sBody += EMurlList
        sBody += "<p>Do you have any videos that will help to tell your story?</p>"
        sBody += EMvideoList


        sBody += "</body></html>"

        arrMail(5) = sBody

        clsEmail.SendEventEmail(arrMail)




        arrMail(0) = EMEmailAddr   'TO
        arrMail(2) = "dougie.harrower@tetratech.com"    'BCC
        arrMail(3) = "asg@globalmethane.org"    'FROM 'IIf(txtEmail.Text.Length > 0, txtEmail.Text, arrMail(0))     
        arrMail(4) = "Global Methane Challenge Submission!"
        arrMail(6) = "HTML"


        sBody = ""
        sBody = "<html><style type='text/css'>body{font-family:'Trebuchet MS'; font-size:90%}</style><body>"
        sBody += "<p>Thank you for submitting your story to the Global Methane Challenge! The information that you submitted is provided below.  </p>"
        sBody += "<p>You can view your submission online at <a href='www.globalmethane.org/challenge/submission/step5.aspx?id=" & submissionID & "'>www.globalmethane.org/challenge/submission/step5.aspx?id=" & submissionID & "</a>.</p>"
        sBody += "<p><b>Point of contact:</b><br> " & EMPOCname & " - " & EMEmailAddr & " - " & EMorganizationName & "</p>"
        sBody += "<p><strong>Location:</strong></p>"
        sBody += EMlocation
        sBody += "<p><strong>Website:</strong></p>"
        sBody += EMOrgWebsite
        sBody += "<p><strong>Phone Number:</strong></p>"
        sBody += EMPhoneNo
        sBody += "<p><strong>Title of Global Methane Challenge action:</strong></p>"
        sBody += EMActionTitle
        sBody += "<p><strong>Sector:</strong></p>"
        sBody += EMSector
        sBody += "<p><strong>Description of activity:</strong></p>"
        sBody += EMactivityInfo
        sBody += "<p><strong>Are you working with other partners on this action?</strong></p>"
        sBody += EMpartners
        sBody += "<p><strong>Where are you planning to take the action(s)?</strong></p>"
        sBody += EMactivityLocale
        sBody += "<p><strong>Outcomes and results of your action:</strong></p>"
        sBody += EMresultsInfo
        sBody += "<p><strong>Next steps/future actions:</strong></p>"
        sBody += EMnextSteps
        sBody += "<p><strong>Where can people go to learn more about your project?</strong></p>"
        sBody += EMurlList
        sBody += "<p><strong>Do you have any videos that will help to tell your story?</strong></p>"
        sBody += EMvideoList


        sBody += "</body></html>"

        arrMail(5) = sBody

        clsEmail.SendEventEmail(arrMail)

    End Sub

End Class