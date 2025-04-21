'Imports System.Web.Mail

Partial Class pnmJoinConfirm
    Inherits System.Web.UI.Page

#Region " Web Form Designer Generated Code "

    'This call is required by the Web Form Designer.
    <System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()

    End Sub

    'NOTE: The following placeholder declaration is required by the Web Form Designer.
    'Do not delete or move it.
    Private designerPlaceholderDeclaration As System.Object

    Private Sub Page_Init(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Init
        'CODEGEN: This method call is required by the Web Form Designer
        'Do not modify it using the code editor.
        InitializeComponent()
    End Sub

#End Region

    Private Sub Page_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        Dim errID As String = 0
        errID = Server.HtmlEncode(Request.QueryString("error"))
        If errID = 1 Then
            divsuccess.Visible = False
            diverror.Visible = True
        End If
        If Len(Session("join_email")) > 5 Then
            'SendMail()
            Session("join_email") = ""
        End If

    End Sub

    Private Sub SendMail()

        '' Send mail Confirmation.
        ''arrMail : 0 - To, 1 - cc , 2 - bcc, 3 - from, 4 - subject, 5 - body, 6- format, 7 - attachment.

        Dim arrMail(7) As String


        arrMail(0) = Session("join_email")              'TO
        arrMail(3) = GetConfiguration("SupportEmail")   'FROM

        arrMail(4) = "Welcome to Project Network"
        arrMail(5) = ""

        Dim strBody

        ''''strBody = "Congratulations!" & vbCrLf & vbCrLf & _
        ''''" Your organization is now a member of the Global Methane Initiative Project Network. Periodically, you will receive information about upcoming Global Methane Initiative events and issues. Please check our web site at http://www.methanetomarkets.org often for updates. " & vbCrLf & vbCrLf & _
        ''''"*** This is an automated email. Do not reply to this email." & vbCrLf


        'During the federal government shutdown, this website will not be updated, and the email inbox will not be monitored. 

        strBody = "Welcome!<br /><br />" & vbCrLf & vbCrLf &
                 "Thank you for joining the Global Methane Initiative's (GMI) Project Network. We look forward to collaborating with you to achieve our shared goals of advancing methane abatement and recovery and use of methane as a valuable energy source in three sectors: biogas (including agriculture, municipal solid waste, and wastewater), coal mines, and oil and gas systems.<br /><br />" & vbCrLf & vbCrLf &
                 "As a Project Network organization, you will bring critical expertise and experience to help GMI Partner Countries reduce methane emissions and have the opportunity to collaborate with Partner Country delegates and other Project Network organizations.<br /><br />" & vbCrLf & vbCrLf &
                 "Upon becoming a member of the Project Network, you will automatically be added to the GMI mailing list. This subscription ensures that you stay informed about upcoming news and events, insightful webinars, valuable resources, and industry best practices. Recent communications are available on GMI’s website here: https://www.globalmethane.org/communications/index.aspx. <br /><br />" & vbCrLf & vbCrLf &
                " Please visit www.globalmethane.org to learn more about GMI’s activities. You can connect with other Project Network members on the Project Network webpage at: https://www.globalmethane.org/project-network/index.aspx. Be sure to follow GMI on LinkedIn, X (formerly Twitter), and Facebook for the latest news. <br /><br />" & vbCrLf & vbCrLf &
                "We look forward to collaborating with you to achieve the goals of the GMI. Please contact us at secretariat@globalmethane.org if you have any questions.<br /><br />" & vbCrLf & vbCrLf &
               "Secretariat <br />" & vbCrLf &
                "Global Methane Initiative <br />" & vbCrLf &
                "E-Mail: secretariat@globalmethane.org<br />
                <a href='https://www.globalmethane.org/'><img src='https://www.globalmethane.org/project-network/emailicons/gmiLogo.png'></a><br />
                <table cellspacing='0' cellpadding='0'>
                <tr><td>
                <a href='https://www.linkedin.com/company/global-methane-initiative-gmi-/'><img src='https://www.globalmethane.org/project-network/emailicons/emailLI.png'></a>
</td><td>
                <a href='https://twitter.com/globalmethane?lang=en'><img src='https://www.globalmethane.org/project-network/emailicons/emailX.jpg'></a>
</td><td>
                <a href='https://www.facebook.com/globalmethane/'><img src='https://www.globalmethane.org/project-network/emailicons/emailFB.png'></a>
</td><td>
                <a href='https://www.globalmethane.org/'><img src='https://www.globalmethane.org/project-network/emailicons/emailWeb.png'></a></td></tr></table>
                <br /><br /><br />" & vbCrLf &
                "***This is an automated e-mail. Do not reply to this e-mail."



        arrMail(5) = strBody

        Call clsEmail.SendM2MEmail(arrMail)

    End Sub

End Class
