Imports System.Data.SqlClient
Partial Class contact_us_confirm
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

            If Len(postedValues("aoi_agriculture")) > 0 Then
                aoi_agriculture.ImageUrl = strCheckedCheckboxImage
                txtag.Text = 1
            End If
            If Len(postedValues("aoi_biogas")) > 0 Then
                aoi_biogas.ImageUrl = strCheckedCheckboxImage
                txtbiogas.Text = 1
            End If
            If Len(postedValues("aoi_coal")) > 0 Then
                aoi_coal.ImageUrl = strCheckedCheckboxImage
                txtcoal.Text = 1
            End If
            If Len(postedValues("aoi_landfill")) > 0 Then
                aoi_landfill.ImageUrl = strCheckedCheckboxImage
                txtmsw.Text = 1
            End If
            If Len(postedValues("aoi_oilngas")) > 0 Then
                aoi_oilNgas.ImageUrl = strCheckedCheckboxImage
                txtoil.Text = 1
            End If
            If Len(postedValues("aoi_wastewater")) > 0 Then
                aoi_wastewater.ImageUrl = strCheckedCheckboxImage
                txtww.Text = 1
            End If
            If Len(postedValues("aoi_other")) > 0 Then
                aoi_other.ImageUrl = strCheckedCheckboxImage
                aoiDesc.Text = postedValues("aoiDesc").ToString
                txtoth.Text = 1
            End If







            expertise.Text = postedValues("expertise").ToString
            Else
                Trace.Warn("ispostback")
        End If
    End Sub

    Private Sub btnBack_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnBack.Click
        Response.Redirect("index.aspx")
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
            Response.Redirect("contact_us_complete.aspx")
        ElseIf Len(Email.Text) > 0 Then
            DashCF()
            SendAltMail()
            Response.Redirect("contact_us_complete.aspx")
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
        dashboardObj.setComment("Contact Us")
        dashboardObj.setMemo("Comment:" & expertise.Text & "; Phone: " & Telephone.Text)
        dashboardObj.setStatus("New")



        Dim newPNid As String

        newPNid = clsdashboardDAO.insertCFData(dashboardObj)

        Dim tempid As String
        tempid = clsdashboardDAO.cutCFTempData(dashboardObj, "Contact Us")



    End Sub

    Protected Sub DashCFerror()
        Dim dashboardObj As clsDashboardVO
        dashboardObj = New clsDashboardVO


        dashboardObj.setName(Name.Text)
        dashboardObj.setEmail(Email.Text)
        dashboardObj.setOrg(organization.Text)
        dashboardObj.setComment("Contact Us ERROR")
        dashboardObj.setMemo("Comments" & expertise.Text & "; Phone: " & Telephone.Text)
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
        cmd.CommandText &= ", telephone,  aoi_agriculture, aoi_biogas, aoi_coal, aoi_landfill, aoi_wastewater, aoi_oilNgas"
        cmd.CommandText &= ", aoi_other,aoiDesc, createdDate, lastModifiedDate, lastModifiedBy)"
        cmd.CommandText &= " VALUES ('" & Format(Now(), "d")
        cmd.CommandText &= "','" & Name.Text.Replace("'", "''")
        cmd.CommandText &= "','" & organization.Text.Replace("'", "''") & "','"
        cmd.CommandText &= "','" & Email.Text.Replace("'", "''") & "','" & Telephone.Text.Replace("'", "''")
        cmd.CommandText &= "'," & IIf(txtag.Text, "1", "0")
        cmd.CommandText &= "'," & IIf(txtbiogas.Text, "1", "0")
        cmd.CommandText &= "," & IIf(txtcoal.Text, "1", "0")
        cmd.CommandText &= "," & IIf(txtmsw.Text, "1", "0")
        cmd.CommandText &= "," & IIf(txtww.Text, "1", "0")
        cmd.CommandText &= "," & IIf(txtoil.Text, "1", "0")
        If Session("join_aoiOther") Then
            cmd.CommandText &= ",1,'" & aoiDesc.Text.Replace("'", "''") & "',"
        Else
            cmd.CommandText &= ",0,'',0" ' Setting postMyInfo to 0 by default 07/10/2013
        End If


        cmd.CommandText &= ",'" & Now() & "','" & Now() & "','Contact Us')"
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

        arrMail(1) = Email.Text 'CC


        arrMail(2) = GetConfiguration("SystemEmail")     'BCC

        arrMail(4) = "You Have Submitted a GMI Contact Us Request"
        arrMail(6) = "HTML"

        arrMail(5) = ""

        Dim strBody

        strBody = "Thank You!<br /><br />" & vbCrLf & vbCrLf &
                 "Thank you for submitting the Contact Us form and for your interest in GMI. " &
                " A member of the GMI team will respond to your message as soon as possible." &
               " <br /><br />" & vbCrLf & vbCrLf &
                "Secretariat <br />" & vbCrLf &
                "Global Methane Initiative <br />" & vbCrLf &
                "E-Mail: secretariat@globalmethane.org<br /><br /><br />"

        strBody += "The following information has been received:  <br /><br />" & vbCrLf & vbCrLf
        strBody += "Name: " & Name.Text & "<br />" & vbCrLf
        strBody += "Organization: " & organization.Text & "<br />" & vbCrLf
        strBody += "Email: " & Email.Text & "<br />   " & vbCrLf
        strBody += "Telephone: " & Telephone.Text & "<br />   " & vbCrLf
        strBody += "Area(s) of Interest" & ":   " & vbCrLf

        If txtbiogas.Text = "1" Then
            strBody += "Biogas" & ";  " & vbCrLf
        End If
        If txtag.Text = "1" Then
            strBody += "Agriculture" & ";  " & vbCrLf
        End If
        If txtmsw.Text = "1" Then
            strBody += "MSW" & ";  " & vbCrLf
        End If
        If txtww.Text = "1" Then
            strBody += "Wastewater" & ";   " & vbCrLf
        End If

        If txtcoal.Text = "1" Then
            strBody += "Coal Mines" & ";   " & vbCrLf
        End If


        If txtoil.Text = "1" Then
            strBody += "Oil and Gas Systems" & ";   " & vbCrLf
        End If


        If txtoth.Text = "1" Then
            strBody += "Other: " & aoiDesc.Text & ";   " & vbCrLf
        End If



        strBody += "<br /><br /> Comments: " & expertise.Text & "<br /><br />   " & vbCrLf & "   " & vbCrLf


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
        arrMail(4) = "Contact Us Request"
        arrMail(6) = "HTML"

        arrMail(5) = ""

        Dim strBody

        strBody = "Thank You!<br /><br />" & vbCrLf & vbCrLf &
                "Thank you for submitting the Contact Us form and for your interest in GMI. " &
                " A member of the GMI team will respond to your message as soon as possible." &
               " <br /><br />" & vbCrLf & vbCrLf &
                "Secretariat <br />" & vbCrLf &
                "Global Methane Initiative <br />" & vbCrLf &
                "E-Mail: secretariat@globalmethane.org<br /><br /><br />"

        strBody += "The following information has been received:  <br /><br />" & vbCrLf & vbCrLf
        strBody += "Name: " & Name.Text & "<br />" & vbCrLf &
        "Organization: " & organization.Text & " <br />  " & vbCrLf &
        "Email: " & Email.Text & "   " & vbCrLf &
        "Telephone: " & Telephone.Text & " <br />  " & vbCrLf


        strBody = strBody & "Area(s) of Interest" & ":   " & vbCrLf

        If txtbiogas.Text = "1" Then
            strBody += "Biogas" & ";  " & vbCrLf
        End If
        If txtag.Text = "1" Then
            strBody += "Agriculture" & ";  " & vbCrLf
        End If
        If txtmsw.Text = "1" Then
            strBody += "MSW" & ";  " & vbCrLf
        End If
        If txtww.Text = "1" Then
            strBody += "Wastewater" & ";   " & vbCrLf
        End If

        If txtcoal.Text = "1" Then
            strBody += "Coal Mines" & ";   " & vbCrLf
        End If


        If txtoil.Text = "1" Then
            strBody += "Oil and Gas Systems" & ";   " & vbCrLf
        End If


        If txtoth.Text = "1" Then
            strBody += "Other: " & aoiDesc.Text & ";   " & vbCrLf
        End If



        strBody = strBody & "<br /><br />Comments: " & expertise.Text & "   " & vbCrLf & "<br />   " & vbCrLf

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

        arrMail(4) = "Contact Us Request"
        arrMail(5) = ""

        Dim strBody

        strBody = "Thank You!<br /><br />" & vbCrLf & vbCrLf &
              "Thank you for submitting the Contact Us form and for your interest in GMI. " &
                " A member of the GMI team will respond to your message as soon as possible." &
               " <br /><br />" & vbCrLf & vbCrLf &
                "Secretariat <br />" & vbCrLf &
                "Global Methane Initiative <br />" & vbCrLf &
                "E-Mail: secretariat@globalmethane.org<br /><br /><br />"

        strBody += "The following information has been received:  <br /><br />" & vbCrLf & vbCrLf
        strBody += "Name: " & Name.Text & "<br />" & vbCrLf &
        "Organization: " & organization.Text & " <br>  " & vbCrLf &
        "Email: " & Email.Text & "   " & vbCrLf &
        "Telephone: " & Telephone.Text & "   " & vbCrLf

        strBody = strBody & "Area(s) of Interest" & ":   " & vbCrLf

        If txtbiogas.Text = "1" Then
            strBody += "Biogas" & " ;  " & vbCrLf
        End If
        If txtag.Text = "1" Then
            strBody += "Agriculture" & " ;  " & vbCrLf
        End If
        If txtmsw.Text = "1" Then
            strBody += "MSW" & " ;  " & vbCrLf
        End If
        If txtww.Text = "1" Then
            strBody += "Wastewater" & ";   " & vbCrLf
        End If

        If txtcoal.Text = "1" Then
            strBody += "Coal Mines" & ";   " & vbCrLf
        End If


        If txtoil.Text = "1" Then
            strBody += "Oil and Gas Systems" & ";   " & vbCrLf
        End If


        If txtoth.Text = "1" Then
            strBody += "Other: " & aoiDesc.Text & ";   " & vbCrLf
        End If


        strBody = strBody & "Comments: " & lblMemo.Text & "   " & vbCrLf & "   " & vbCrLf

        arrMail(5) = strBody

        Call clsEmail.SendM2MEmail(arrMail)

    End Sub


    Private Sub SendErrorMail()

        '' Send mail Confirmation.
        ''arrMail : 0 - To, 1 - cc , 2 - bcc, 3 - from, 4 - subject, 5 - body, 6- format, 7 - attachment.

        Dim arrMail(7) As String

        arrMail(0) = GetConfiguration("SystemEmail") 'to   
        'arrMail(0) = "adam.langmaid@erg.com"

        ''' Put cc and from field in web.config file.  
        'arrMail(1) = GetConfiguration("MailCc")  'cc
        arrMail(3) = GetConfiguration("SupportEmail") 'from"

        arrMail(4) = "Error with Contact Us Request"
        arrMail(5) = ""

        Dim strBody
        strBody = "An error has occurred with the following request, and it could not be sent." & "<br><br>   " & vbCrLf &
            vbCrLf & "Name: " & Name.Text & " <br>  " & vbCrLf &
        "Organization: " & organization.Text & " <br>  " & vbCrLf &
        "Email: " & Email.Text & "   " & vbCrLf &
        "Telephone: " & Telephone.Text & "   " & vbCrLf

        strBody = strBody & "Area(s) of Interest" & ":   " & vbCrLf

        If txtbiogas.Text = "1" Then
            strBody += "Biogas" & " ;  " & vbCrLf
        End If
        If txtag.Text = "1" Then
            strBody += "Agriculture" & " ;  " & vbCrLf
        End If
        If txtmsw.Text = "1" Then
            strBody += "MSW" & " ;  " & vbCrLf
        End If
        If txtww.Text = "1" Then
            strBody += "Wastewater" & ";   " & vbCrLf
        End If

        If txtcoal.Text = "1" Then
            strBody += "Coal Mines" & ";   " & vbCrLf
        End If


        If txtoil.Text = "1" Then
            strBody += "Oil and Gas Systems" & ";   " & vbCrLf
        End If


        If txtoth.Text = "1" Then
            strBody += "Other: " & aoiDesc.Text & ";   " & vbCrLf
        End If


        strBody = strBody & "Comments: " & lblMemo.Text & "   " & vbCrLf & "   " & vbCrLf

        arrMail(5) = strBody

        Call clsEmail.SendM2MEmail(arrMail)

    End Sub



End Class
