Imports System.Data.SqlClient
Imports System.Net.Mail

Partial Class csSubmit
    Inherits System.Web.UI.Page

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        Try
            Using conn As New SqlConnection(Common.GetConnString())
                ' SQL insert query
                Dim sql As String = "INSERT INTO csstudies (submitterName, submitterOrg, submitterEmail, stakeholderType, leadOrg, partnerOrg, proposedTitle, location, online, whenpublished, url, description, DateSubmitted, version) " &
                                "VALUES (@SubmitterName, @SubmitterOrg, @SubmitterEmail, @StakeholderType, @LeadOrg, @PartnerOrg, @proposedTitle, @Location, @Online, @WhenPublished, @URL, @Description, @DateSubmitted, @Version)"

                Using cmd As New SqlCommand(sql, conn)
                    ' Collect input data from the form fields
                    cmd.Parameters.AddWithValue("@SubmitterName", txtSubmitterName.Text)
                    cmd.Parameters.AddWithValue("@SubmitterOrg", txtSubmitterOrg.Text)
                    cmd.Parameters.AddWithValue("@SubmitterEmail", txtSubmitterEmail.Text)
                    cmd.Parameters.AddWithValue("@StakeholderType", rblGmiStakeholders.SelectedValue)
                    cmd.Parameters.AddWithValue("@LeadOrg", txtLeadOrg.Text)
                    cmd.Parameters.AddWithValue("@PartnerOrg", txtPartnerOrg.Text)
                    cmd.Parameters.AddWithValue("@proposedTitle", proposedTitle.Text)
                    cmd.Parameters.AddWithValue("@Location", txtLocation.Text)

                    ' Handle the online field as nvarchar(max)
                    Dim caseStudyOnline As String = rblCaseStudyOnline.SelectedValue
                    cmd.Parameters.AddWithValue("@Online", caseStudyOnline)

                    ' Conditionally add the URL and publication date if the case study is online
                    If caseStudyOnline = "Yes" Then
                        cmd.Parameters.AddWithValue("@WhenPublished", txtCsPubDate.Text)
                        cmd.Parameters.AddWithValue("@URL", txtCaseStudyUrl.Text)
                    Else
                        cmd.Parameters.AddWithValue("@WhenPublished", DBNull.Value)
                        cmd.Parameters.AddWithValue("@URL", DBNull.Value)
                    End If

                    ' Add the brief summary
                    cmd.Parameters.AddWithValue("@Description", txtBriefSummary.Text)

                    ' Add submission date and version
                    cmd.Parameters.AddWithValue("@DateSubmitted", DateTime.Now)
                    cmd.Parameters.AddWithValue("@Version", 1)

                    ' Execute the insert query
                    conn.Open()
                    cmd.ExecuteNonQuery()

                    ' Send the email notification
                    SendMail(txtSubmitterName.Text, txtSubmitterOrg.Text, txtSubmitterEmail.Text, rblGmiStakeholders.SelectedValue, txtLeadOrg.Text, txtPartnerOrg.Text, proposedTitle.Text, txtLocation.Text, caseStudyOnline, txtCsPubDate.Text, txtCaseStudyUrl.Text, txtBriefSummary.Text)

                    ' Send confirmation email to the submitter
                    SendConfirmationEmail(txtSubmitterEmail.Text, txtSubmitterName.Text, txtSubmitterOrg.Text, txtLeadOrg.Text, txtPartnerOrg.Text, proposedTitle.Text, txtLocation.Text, txtBriefSummary.Text, caseStudyOnline, txtCsPubDate.Text, txtCaseStudyUrl.Text)
                End Using
            End Using

            ' Show success message and start the countdown for redirect
            successMessageDiv.Visible = True
            lblThankYou.Text = "Thank you for your submission! We appreciate your recommendation." ' Display thank-you message
            lblThankYou.Visible = True
            Page.ClientScript.RegisterStartupScript(Me.GetType(), "RedirectScript", "startCountdown();", True)

            ' Clear all form fields after submission
            ClearFormFields()

        Catch ex As SqlException
            ' Handle SQL errors
            Response.Write("<script>alert('A database error occurred. Please try again later.');</script>")
        Catch ex As Exception
            ' Handle general errors
            Response.Write("<script>alert('An error occurred. Please try again later.');</script>")
        End Try
    End Sub

    ' Method to clear all form fields
    Private Sub ClearFormFields()
        txtSubmitterName.Text = ""
        txtSubmitterOrg.Text = ""
        txtSubmitterEmail.Text = ""
        rblGmiStakeholders.ClearSelection()
        txtLeadOrg.Text = ""
        txtPartnerOrg.Text = ""
        proposedTitle.Text = ""
        txtLocation.Text = ""
        rblCaseStudyOnline.ClearSelection()
        txtCsPubDate.Text = ""
        txtCaseStudyUrl.Text = ""
        txtBriefSummary.Text = ""
    End Sub


    ' Sends the main notification email
    Private Sub SendMail(submitterName As String, submitterOrg As String, submitterEmail As String, stakeholderType As String, leadOrg As String, partnerOrg As String, proposedTitle As String, location As String, online As String, whenPublished As String, caseStudyUrl As String, briefSummary As String)
        ' arrMail : 0 - To, 1 - cc , 2 - bcc, 3 - from, 4 - subject, 5 - body, 6- format, 7 - attachment.
        Dim arrMail(7) As String

        arrMail(0) = "derieux.christine@epa.gov,david.richards@abtglobal.com,sandra.mazonix@abtglobal.com" ' TO
        arrMail(2) = "secretariat@globalmethane.org" ' BCC
        arrMail(3) = "secretariat@globalmethane.org" ' FROM
        arrMail(4) = "New Case Study Submission - " & DateTime.Now.ToString("MMMM dd, yyyy hh:mm tt") ' Subject
        arrMail(6) = "HTML" ' Format

        ' Create the email body
        Dim sBody As String
        sBody = "<html><style type='text/css'>body{font-family:'Trebuchet MS'; font-size:90%; color:#333;} " &
            "table {width: 100%; border-collapse: collapse;} th, td {border: 1px solid #ddd; padding: 8px; text-align: left;} " &
            "th {background-color: #f2f2f2; color: #333;}</style><body>"

        sBody += "<h2>New Case Study Submission</h2>"
        sBody += "<p>A new case study has been submitted. Below are the details:</p>"

        ' Build the table for the case study details
        sBody += "<table>"
        sBody += "<tr><th>Submitter Name</th><td>" & submitterName & "</td></tr>"
        sBody += "<tr><th>Submitter Organization</th><td>" & submitterOrg & "</td></tr>"
        sBody += "<tr><th>Submitter Email</th><td>" & submitterEmail & "</td></tr>"
        sBody += "<tr><th>Stakeholder Type</th><td>" & stakeholderType & "</td></tr>"
        sBody += "<tr><th>Lead Organization</th><td>" & leadOrg & "</td></tr>"
        sBody += "<tr><th>Partner Organizations</th><td>" & partnerOrg & "</td></tr>"
        sBody += "<tr><th>Proposed Title</th><td>" & proposedTitle & "</td></tr>"
        sBody += "<tr><th>Location</th><td>" & location & "</td></tr>"
        sBody += "<tr><th>Is Online?</th><td>" & online & "</td></tr>"

        If online = "Yes" Then
            sBody += "<tr><th>When Published</th><td>" & whenPublished & "</td></tr>"
            sBody += "<tr><th>Case Study URL</th><td><a href='" & caseStudyUrl & "'>" & caseStudyUrl & "</a></td></tr>"
        End If

        sBody += "<tr><th>Brief Summary</th><td>" & briefSummary & "</td></tr>"
        sBody += "</table>"

        sBody += "</body></html>"

        arrMail(5) = sBody ' Body content

        ' Send the email
        clsEmail.SendEventEmail(arrMail)
    End Sub


    ' Sends a confirmation email to the submitter
    Private Sub SendConfirmationEmail(submitterEmail As String, submitterName As String, submitterOrg As String, leadOrg As String, partnerOrg As String, proposedTitle As String, location As String, briefSummary As String, online As String, whenPublished As String, caseStudyUrl As String)
        ' arrMail : 0 - To, 1 - cc , 2 - bcc, 3 - from, 4 - subject, 5 - body, 6- format, 7 - attachment.
        Dim arrMail(7) As String

        arrMail(0) = submitterEmail ' TO
        arrMail(2) = "secretariat@globalmethane.org" ' BCC
        arrMail(3) = "secretariat@globalmethane.org" ' FROM
        arrMail(4) = "Your Case Study Submission - " & DateTime.Now.ToString("MMMM dd, yyyy hh:mm tt") ' Subject
        arrMail(6) = "HTML" ' Format

        ' Create the email body
        Dim sBody As String
        sBody = "<html><style type='text/css'>body{font-family:'Trebuchet MS'; font-size:90%; color:#333;}</style><body>"
        sBody += "<h2>Thank you for your submission!</h2>"
        sBody += "<p>Dear " & submitterName & ",</p>"
        sBody += "<p>Thank you for submitting your case study to the GMI Case Study Library. Below is a copy of your submission:</p>"

        ' Build the table for the case study details
        sBody += "<table>"
        sBody += "<tr><th>Submitter Name</th><td>" & submitterName & "</td></tr>"
        sBody += "<tr><th>Submitter Organization</th><td>" & submitterOrg & "</td></tr>"
        sBody += "<tr><th>Lead Organization</th><td>" & leadOrg & "</td></tr>"
        sBody += "<tr><th>Partner Organizations</th><td>" & partnerOrg & "</td></tr>"
        sBody += "<tr><th>Proposed Title</th><td>" & proposedTitle & "</td></tr>"
        sBody += "<tr><th>Location</th><td>" & location & "</td></tr>"
        sBody += "<tr><th>Is Online?</th><td>" & online & "</td></tr>"

        If online = "Yes" Then
            sBody += "<tr><th>When Published</th><td>" & whenPublished & "</td></tr>"
            sBody += "<tr><th>Case Study URL</th><td><a href='" & caseStudyUrl & "'>" & caseStudyUrl & "</a></td></tr>"
        End If

        sBody += "<tr><th>Brief Summary</th><td>" & briefSummary & "</td></tr>"
        sBody += "</table>"

        sBody += "<p>We will review your submission and may reach out to you for additional details as needed.</p>"
        sBody += "<p>Best regards,<br/>GMI Secretariat</p>"
        sBody += "</body></html>"

        arrMail(5) = sBody ' Body content

        ' Send the email
        clsEmail.SendEventEmail(arrMail)
    End Sub

End Class
