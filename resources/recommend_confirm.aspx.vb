Imports System.Data.SqlClient
Partial Class recommend_confirm
    Inherits System.Web.UI.Page

#Region " Web Form Designer Generated Code "

    'This call is required by the Web Form Designer.
    <System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()

    End Sub
    Protected WithEvents join_name As System.Web.UI.WebControls.Label
    Protected WithEvents lblorganization As System.Web.UI.WebControls.Label
    Protected WithEvents lblMailAddress2 As System.Web.UI.WebControls.Label
    Protected WithEvents lblCity As System.Web.UI.WebControls.Label
    Protected WithEvents lblCountry As System.Web.UI.WebControls.Label
    Protected WithEvents lblEmail As System.Web.UI.WebControls.Label






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

        If Not IsPostBack Then
            Dim strCheckedCheckboxImage As String = "/assets/images/checkedbox_trans.gif"
            Dim strCheckedRadioButtonImage As String = "/assets/images/checkedradio.gif"

            Dim postedValues As NameValueCollection = Request.Form

            Name.Text = postedValues("name").ToString
            Email.Text = postedValues("email").ToString
            Telephone.Text = postedValues("telephone").ToString
            organization.Text = postedValues("organization").ToString
            title.Text = postedValues("Title").ToString
            link.Text = postedValues("LInk").ToString







            recommendation.Text = postedValues("recommendation").ToString
        Else
            Trace.Warn("ispostback")
        End If
    End Sub

    Private Sub btnBack_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnBack.Click
        Response.Redirect("recommend.aspx")
    End Sub

    Private Sub btnSubmit_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnSubmit.Click
        'original code
        'If Len(Session("join_email")) > 0 Then
        '    If saveData() Then
        '        Response.Redirect("pnmJoinConfirm.aspx")
        '    End If
        'End If
        'Dim emailwillbesent As String
        'emailwillbesent = Len(Session("join_email")).ToString & " ; " & Session("join_email") & " ; " & Session("Email")
        'sending email to asg June 2013


        'During the federal government shutdown, this website will not be updated, and the email inbox will not be monitored. 


        If Len(Email.Text) > 0 Then
            SendMail()
            DashCF()
            'saveData()
            Response.Redirect("recommend_complete.aspx")
        ElseIf Len(Email.Text) > 0 Then
            DashCF()
            SendAltMail()
            Response.Redirect("recommend_complete.aspx")
        Else
            diverror.Visible = True
            DashCFerror()
            divverify.Visible = False
            SendErrorMail()
        End If



    End Sub

    Protected Sub DashCF()
        Dim dashboardObj As clsDashboardVO
        dashboardObj = New clsDashboardVO


        dashboardObj.setName(Name.Text)
        dashboardObj.setEmail(Email.Text)
        dashboardObj.setOrg(organization.Text)
        dashboardObj.setComment("Recommendation")
        dashboardObj.setMemo("Phone: " & Telephone.Text & "; Title: " & title.Text & "; Link: " & link.Text & "; Recommendation:  " & recommendation.Text)
        dashboardObj.setStatus("New")



        Dim newPNid As String

        newPNid = clsdashboardDAO.insertCFData(dashboardObj)

        Dim tempid As String
        tempid = clsdashboardDAO.cutCFTempData(dashboardObj, "Recommendation")



    End Sub

    Protected Sub DashCFerror()
        Dim dashboardObj As clsDashboardVO
        dashboardObj = New clsDashboardVO


        dashboardObj.setName(Name.Text)
        dashboardObj.setEmail(Email.Text)
        dashboardObj.setOrg(organization.Text)
        dashboardObj.setComment("Recommendation ERROR")
        dashboardObj.setMemo("Phone:  " & Telephone.Text & "; Title: " & title.Text & "; Link: " & link.Text & "; Recommendation:  " & recommendation.Text)
        dashboardObj.setStatus("Error")


        Dim newPNid As String

        newPNid = clsdashboardDAO.insertCFData(dashboardObj)



    End Sub

    Private Function saveData() As Boolean
        Dim conn As SqlConnection = Nothing
        Dim cmd As SqlCommand = Nothing
        Dim trans As SqlTransaction = Nothing
        Dim bReturn As Boolean = False

        Try
            conn = New SqlConnection(Common.GetConnString())
            conn.Open()
            trans = conn.BeginTransaction


            If insertContact(trans) Then
                trans.Commit()
                conn.Close()
                bReturn = True
            End If

        Catch ex As Exception
            Common.WrapException(ex)
            If Not trans Is Nothing Then
                trans.Rollback()
            End If

        Finally

            If Not trans Is Nothing Then
                trans = Nothing
            End If
            If Not conn Is Nothing Then
                If conn.State <> ConnectionState.Closed Then
                    conn.Close()
                End If
                conn = Nothing
            End If
        End Try
        Return bReturn

    End Function





    Private Function insertContact(ByRef trans As SqlTransaction) As Boolean

        Dim cmd As SqlCommand = trans.Connection.CreateCommand
        cmd.Transaction = trans
        cmd.CommandText = "INSERT INTO [dbo].contact (dateentered, name, organization,  email"
        cmd.CommandText &= ", telephone  "
        cmd.CommandText &= ", createdDate, lastModifiedDate, lastModifiedBy)"
        cmd.CommandText &= " VALUES ('" & Format(Now(), "d")
        cmd.CommandText &= "','" & Name.Text.Replace("'", "''")
        cmd.CommandText &= "','" & organization.Text.Replace("'", "''") & "','"
        cmd.CommandText &= "','" & Email.Text.Replace("'", "''") & "','" & Telephone.Text.Replace("'", "''")
        cmd.CommandText &= ",'" & Now() & "','" & Now() & "','Recommend')"
        Trace.Warn(cmd.CommandText)
        cmd.ExecuteNonQuery()
        cmd.Dispose()
        Return True

    End Function


    'June 2013
    Private Sub SendMail()

        '' Send mail Confirmation.
        ''arrMail : 0 - To, 1 - cc , 2 - bcc, 3 - from, 4 - subject, 5 - body, 6- format, 7 - attachment.

        Dim arrMail(7) As String

        arrMail(0) = "secretariat@globalmethane.org"    'TO
        If Email.Text = "" Then
            arrMail(1) = Session("r_email")
        Else
            arrMail(1) = Email.Text
        End If

        arrMail(2) = GetConfiguration("SystemEmail")     'BCC

        arrMail(4) = "You Have Submitted a Resource Recommendation"
        arrMail(6) = "HTML"

        arrMail(5) = ""

        Dim strBody

        strBody = "Thank You!<br /><br />" & vbCrLf & vbCrLf &
                 "Thank you for submitting your resource recommendation. " &
                " A member of the GMI team will review your recommendation and respond to you with questions as soon as possible." &
               " <br /><br />" & vbCrLf & vbCrLf &
                "Secretariat <br />" & vbCrLf &
                "Global Methane Initiative <br />" & vbCrLf &
                "E-Mail: secretariat@globalmethane.org<br /><br /><br />"

        strBody += "The following information has been received:  <br /><br />" & vbCrLf & vbCrLf
        strBody += "Name: " & Name.Text & "<br />" & vbCrLf
        strBody += "Organization: " & organization.Text & "<br />" & vbCrLf
        strBody += "Email: " & Email.Text & "<br />   " & vbCrLf
        strBody += "Telephone: " & Telephone.Text & "<br />   " & vbCrLf



        strBody += "Recommendation: " & recommendation.Text & "<br>Title:  " & title.Text & "<br>Link:  " & link.Text & "<br /><br />   " & vbCrLf & "   " & vbCrLf


        arrMail(5) = strBody

        clsEmail.SendM2MEmail(arrMail)
        lblMemo.Text = strBody
    End Sub

    Private Sub SendAltMail()
        'emails have been failing because some browsers clear the session upon click of the button. 
        'However the information is already loaded on the page, so information can be pulled from there.

        ''arrMail : 0 - To, 1 - cc , 2 - bcc, 3 - from, 4 - subject, 5 - body, 6- format, 7 - attachment.

        Dim arrMail(7) As String

        arrMail(0) = "secretariat@globalmethane.org"    'TO
        arrMail(1) = Email.Text 'CC
        arrMail(2) = GetConfiguration("SystemEmail")     'BCC
        arrMail(3) = Email.Text 'CC
        arrMail(4) = "Recommended Resource"
        arrMail(6) = "HTML"

        arrMail(5) = ""

        Dim strBody

        strBody = "Thank You!<br /><br />" & vbCrLf & vbCrLf &
                 "Thank you for submitting your resource recommendation. " &
                " A member of the GMI team will review your recommendation and respond to you with questions as soon as possible." &
               " <br /><br />" & vbCrLf & vbCrLf &
                "Secretariat <br />" & vbCrLf &
                "Global Methane Initiative <br />" & vbCrLf &
                "E-Mail: secretariat@globalmethane.org<br /><br /><br />"

        strBody += "The following information has been received:  <br /><br />" & vbCrLf & vbCrLf
        strBody += "Name: " & Name.Text & "<br />" & vbCrLf &
        "Organization: " & organization.Text & " <br />  " & vbCrLf &
        "Email: " & Email.Text & "   " & vbCrLf &
        "Telephone: " & Telephone.Text & " <br />  " & vbCrLf

        strBody += "Recommendation: " & recommendation.Text & "<br>Title:  " & title.Text & "<br>Link:  " & link.Text & "<br /><br />  " & vbCrLf

        arrMail(5) = strBody

        clsEmail.SendM2MEmail(arrMail)

    End Sub

    Private Sub SendConfirmationMail()

        '' Send mail Confirmation.
        ''arrMail : 0 - To, 1 - cc , 2 - bcc, 3 - from, 4 - subject, 5 - body, 6- format, 7 - attachment.

        Dim arrMail(7) As String

        arrMail(0) = Email.Text 'to   
        'arrMail(0) = "adam.langmaid@erg.com"

        ''' Put cc and from field in web.config file.  
        arrMail(1) = GetConfiguration("MailCc")  'cc
        arrMail(3) = GetConfiguration("SupportEmail") 'from"

        arrMail(4) = "Recommended Resource"
        arrMail(5) = ""

        Dim strBody

        strBody = "Thank You!<br /><br />" & vbCrLf & vbCrLf &
                 "Thank you for submitting your resource recommendation. " &
                " A member of the GMI team will review your recommendation and respond to you with questions as soon as possible." &
               " <br /><br />" & vbCrLf & vbCrLf &
                "Secretariat <br />" & vbCrLf &
                "Global Methane Initiative <br />" & vbCrLf &
                "E-Mail: secretariat@globalmethane.org<br /><br /><br />"

        strBody += "The following information has been received:  <br /><br />" & vbCrLf & vbCrLf
        strBody += "Name: " & Name.Text & "<br />" & vbCrLf &
        "Organization: " & organization.Text & " <br>  " & vbCrLf &
        "Email: " & Email.Text & "   " & vbCrLf &
        "Telephone: " & Telephone.Text & "   " & vbCrLf
        strBody += "Recommendation: " & recommendation.Text & "<br>Title:  " & title.Text & "<br>Link:  " & link.Text & "<br /><br />  " & vbCrLf

        arrMail(5) = strBody

        Call clsEmail.SendM2MEmail(arrMail)

    End Sub


    Private Sub SendErrorMail()

        '' Send mail Confirmation.
        ''arrMail : 0 - To, 1 - cc , 2 - bcc, 3 - from, 4 - subject, 5 - body, 6- format, 7 - attachment.

        Dim arrMail(7) As String

        arrMail(0) = GetConfiguration("SystemEmail") 'to   


        ''' Put cc and from field in web.config file.  
        'arrMail(1) = GetConfiguration("MailCc")  'cc
        arrMail(3) = GetConfiguration("SupportEmail") 'from"

        arrMail(4) = "Error with Recommended Resource"
        arrMail(5) = ""

        Dim strBody
        strBody = "An error has occurred with the following request, and it could not be sent" & "<br><br>   " & vbCrLf &
            vbCrLf & "Name: " & Name.Text & " <br>  " & vbCrLf &
        "Organization: " & organization.Text & " <br>  " & vbCrLf &
        "Email: " & Email.Text & "   " & vbCrLf &
        "Telephone: " & Telephone.Text & "   " & vbCrLf



        strBody += "Recommendation: " & recommendation.Text & "<br>Title:  " & title.Text & "<br>Link:  " & link.Text & "<br /><br />  " & vbCrLf

        arrMail(5) = strBody

        Call clsEmail.SendM2MEmail(arrMail)

    End Sub



End Class
