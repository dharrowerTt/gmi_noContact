Imports System.Data.SqlClient
Partial Class pnmJoinVerify
    Inherits System.Web.UI.Page

#Region " Web Form Designer Generated Code "

    'This call is required by the Web Form Designer.
    <System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()

    End Sub
    Protected WithEvents join_name As System.Web.UI.WebControls.Label
    Protected WithEvents lblMailAddress1 As System.Web.UI.WebControls.Label
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
            'Name.Text = Session("join_name")
            Website.Text = postedValues("website").ToString
            'Website.Text = Session("join_website")
            DateEntered.Text = Session("join_dateEntered") & " (DD/MM/YYYY)"
            FirstName.Text = Session("join_firstname")
            lastName.Text = Session("join_lastname")
            Titlex.Text = Session("join_title")
            If IsNothing(Session("join_mailaddress3")) Then
                MailAddress3.Visible = False
            Else
                MailAddress3.Text = Session("join_mailaddress3")
            End If
            If IsNothing(Session("join_mailaddress4")) Then
                MailAddress4.Visible = False
            Else
                MailAddress4.Text = Session("join_mailaddress4")
            End If
            If IsNothing(Session("join_mailaddress2")) Then
                MailAddress2.Visible = False
            Else
                MailAddress2.Text = Session("join_mailaddress2")
            End If
            MailAddress1.Text = Session("join_mailaddress1")
            City.Text = Session("join_city")
            State.Text = Session("join_state")
            PostalCode.Text = Session("join_postalcode")
            Country.Text = Session("join_country")
            City_c.Text = Session("join_city_c")
            State_c.Text = Session("join_state_c")
            PostalCode_c.Text = Session("join_postal_c")
            Country_c.Text = Session("join_country_c")
            Email.Text = Session("join_email")
            Telephone.Text = Session("join_telephone")
            Cellphone.Text = Session("join_cellphone")
            Fax.Text = Session("join_fax")

            Select Case Session("join_typeOfOrg")
                Case "private"
                    Trace.Write("type of org was private")
                    orgType1.ImageUrl = strCheckedRadioButtonImage
                Case "local"
                    orgType2.ImageUrl = strCheckedRadioButtonImage
                Case "research"
                    orgType3.ImageUrl = strCheckedRadioButtonImage
                Case "other"
                    orgType4.ImageUrl = strCheckedRadioButtonImage
                Case "banks"
                    orgType5.ImageUrl = strCheckedRadioButtonImage
            End Select


        Else
            Trace.Warn("ispostback")
        End If
    End Sub

    Private Sub btnBack_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnBack.Click
        Response.Redirect("join.aspx")
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


        If Len(Session("join_email")) > 0 Then
            SendMail()
            DashCF()
            'saveData()
            Session("join_email") = ""
            Response.Redirect("pnmJoinConfirm.aspx")
        ElseIf Len(Email.Text) > 0 Then
            DashCF()
            SendAltMail()
            Session("join_email") = ""
            Response.Redirect("pnmJoinConfirm.aspx")
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


        dashboardObj.setName(FirstName.Text + " " + lastName.Text)
        dashboardObj.setEmail(Email.Text)
        dashboardObj.setOrg(Name.Text)
        dashboardObj.setComment("Project Network")
        dashboardObj.setMemo(lblMemo.Text)
        dashboardObj.setStatus("New")



        Dim newPNid As String

        newPNid = clsdashboardDAO.insertCFData(dashboardObj)

        Dim tempid As String
        tempid = clsdashboardDAO.cutCFTempData(dashboardObj, "Project Network")



    End Sub

    Protected Sub DashCFerror()
        Dim dashboardObj As clsDashboardVO
        dashboardObj = New clsDashboardVO


        dashboardObj.setName(FirstName.Text + " " + lastName.Text)
        dashboardObj.setEmail(Email.Text)
        dashboardObj.setOrg(Name.Text)
        dashboardObj.setComment("Project Network")
        dashboardObj.setMemo(lblMemo.Text)
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

            Dim orgID As Integer = getOrgID()
            If orgID = -1 Then
                Trace.Write("adding new org in Join Network Verify")
                Call insertOrg(trans)
                trans.Commit()
                trans = conn.BeginTransaction
                orgID = getOrgID()
            End If
            If insertContact(trans, orgID) Then
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

    Private Function getOrgID() As Integer

        Dim sConn As String = GetConnString()
        Dim sName As String = Session("join_name")
        Dim sSql As String = "SELECT * FROM viewOrgDetail WHERE name='" & sName.Replace("'", "''") & "'"
        Dim da As New SqlDataAdapter(sSql, sConn)
        Dim ds As New DataSet
        da.Fill(ds, "orgDetail")
        Dim dt As DataTable = ds.Tables(0)
        If dt.Rows.Count = 0 Then
            getOrgID = -1
        Else
            getOrgID = dt.Rows(0).Item("organizationID")
        End If
        dt.Dispose()

    End Function

    Private Function insertOrg(ByRef trans As SqlTransaction) As Integer

        Dim strMemberType As String
        Dim strTypeOfOrg As String = Session("join_typeoforg")
        Dim strExpertise As String = Session("join_expertise")
        Dim strDateTime As String = Now()

        Trace.Write("in insertOrg-1")
        strMemberType = "1"

        Dim conn As SqlConnection = trans.Connection
        Dim cmd As SqlCommand = conn.CreateCommand
        cmd.Transaction = trans
        cmd.CommandText = "INSERT INTO [dbo].organization ([name], website, memberType, typeOfOrganization, expertise, dateEntered, createdDate, lastModifiedDate, lastModifiedBy) "
        cmd.CommandText &= "values('" & Name.Text.Replace("'", "''") & "','" & Website.Text.Replace("'", "''") & "'," & strMemberType & ",'" & strTypeOfOrg & "','" & strExpertise.Replace("'", "''") & "','" & strDateTime & "','" & strDateTime & "','" & strDateTime & "','Join Network')"
        Trace.Warn(cmd.CommandText)
        cmd.ExecuteNonQuery()
        cmd.Dispose()
        Return True

    End Function

    Private Function insertContact(ByRef trans As SqlTransaction, ByRef orgID As Integer) As Boolean

        Dim cmd As SqlCommand = trans.Connection.CreateCommand
        cmd.Transaction = trans
        cmd.CommandText = "INSERT INTO [dbo].contact (dateentered, firstname,lastname, title, mailAddress1, mailAddress2, city, state, postalcode, country, mailAddress3, mailAddress4, city_c, state_c, postalcode_c, country_c, email"
        cmd.CommandText &= ", telephone, cellphone, fax, aoi_agriculture, aoi_biogas, aoi_coal, aoi_landfill, aoi_wastewater, aoi_oilNgas"
        cmd.CommandText &= ", aoi_other,aoiDesc, postMyInfo, organizationID, contactType, geoPartnership, geoRegion, geoRegionList, geoCountry, geoCountryList, createdDate, lastModifiedDate, lastModifiedBy)"
        cmd.CommandText &= " VALUES ('" & Format(Now(), "d")
        cmd.CommandText &= "','" & FirstName.Text.Replace("'", "''") & "','" & lastName.Text.Replace("'", "''") & "','" & Titlex.Text.Replace("'", "''")
        cmd.CommandText &= "','" & MailAddress1.Text.Replace("'", "''") & "','" & MailAddress2.Text.Replace("'", "''") & "','" & City.Text.Replace("'", "''")
        cmd.CommandText &= "','" & State.Text.Replace("'", "''") & "','" & PostalCode.Text.Replace("'", "''") & "','" & Country.Text.Replace("'", "''")
        cmd.CommandText &= "','" & MailAddress3.Text.Replace("'", "''") & "','" & MailAddress4.Text.Replace("'", "''") & "','" & City_c.Text.Replace("'", "''")
        cmd.CommandText &= "','" & State_c.Text.Replace("'", "''") & "','" & PostalCode_c.Text.Replace("'", "''") & "','" & Country_c.Text.Replace("'", "''")
        cmd.CommandText &= "','" & Email.Text.Replace("'", "''") & "','" & Telephone.Text.Replace("'", "''") & "','" & Cellphone.Text.Replace("'", "''") & "','" & Fax.Text.Replace("'", "''")
        cmd.CommandText &= "'," & IIf(Session("join_aoiagriculture"), "1", "0")
        cmd.CommandText &= "'," & IIf(Session("join_aoibiogas"), "1", "0")
        cmd.CommandText &= "," & IIf(Session("join_aoicoal"), "1", "0")
        cmd.CommandText &= "," & IIf(Session("join_aoilandfill"), "1", "0")
        cmd.CommandText &= "," & IIf(Session("join_wastewater"), "1", "0")
        cmd.CommandText &= "," & IIf(Session("join_aoiOilNGas"), "1", "0")


        cmd.CommandText &= IIf(Session("join_postMyInfo"), "1", "0")
        cmd.CommandText &= "," & CStr(orgID)
        cmd.CommandText &= ",2"         ' contact type

        ' apr08 new code
        cmd.CommandText &= "," & IIf(Session("geoPartnership"), "1", "0")
        cmd.CommandText &= "," & IIf(Session("geoRegion"), "1", "0")

        cmd.CommandText &= "," & IIf(Session("geoCountry"), "1", "0")


        cmd.CommandText &= ",'" & Now() & "','" & Now() & "','Join Network')"
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
            arrMail(1) = Session("join_email")
        Else
            ' arrMail(1) = Email.Text
            arrMail(1) = ""
        End If
        If Session("join_email") = "" Then
            'arrMail(1) = Email.Text 'CC
            arrMail(1) = ""
        Else
            'arrMail(1) = Session("join_email")
            arrMail(1) = ""
        End If

        arrMail(2) = GetConfiguration("SystemEmail")     'BCC
        If Session("join_email") = "" Then
            'arrMail(3) = Email.Text 'CC
            arrMail(3) = "secretariat@globalmethane.org"
        Else
            'arrMail(3) = Session("join_email")
            arrMail(3) = "secretariat@globalmethane.org"
        End If    'FROM 'IIf(txtEmail.Text.Length > 0, txtEmail.Text, arrMail(0))     
        arrMail(4) = "Your GMI Project Network Membership Status is Pending"
        arrMail(6) = "HTML"

        arrMail(5) = ""

        Dim strBody

        strBody = "Thank you for your interest in joining the Global Methane Initiative (GMI) Project Network! Your membership is currently under review. Please allow 3–4 business days for us to evaluate your organization’s information and involvement in methane mitigation. Once the review is complete, we will send you an email confirming your membership status.<br /><br />" & vbCrLf & vbCrLf &
                 "As a Project Network organization, you will bring critical expertise and experience to help GMI Partner Countries reduce methane emissions and have the opportunity to collaborate with Partner Country delegates and other Project Network organizations.<br /><br />" & vbCrLf & vbCrLf &
                 "If approved, your membership will provide opportunities to collaborate with GMI delegates, funding organizations that focus on methane mitigation projects, and other Project Network members around the world. <br /><br /> Warm Regards," & vbCrLf & vbCrLf &
               "Secretariat <br />" & vbCrLf &
                "Global Methane Initiative <br />" & vbCrLf &
                "E-Mail: secretariat@globalmethane.org<br /><br />
                <a href='https://www.globalmethane.org/'><img src='https://www.globalmethane.org/project-network/emailicons/gmiLogo.png'></a><br />
                <table cellspacing='0' cellpadding='0'>
                <tr><td>
                <a href='https://www.linkedin.com/company/global-methane-initiative-gmi-/'><img height='20' width='20' src='https://www.globalmethane.org/project-network/emailicons/emailLI.png'></a>
</td><td>
                <a href='https://twitter.com/globalmethane?lang=en'><img height='20' width='20' src='https://www.globalmethane.org/project-network/emailicons/emailX.jpg'></a>
</td><td>
                <a href='https://www.facebook.com/globalmethane/'><img height='20' width='20' src='https://www.globalmethane.org/project-network/emailicons/emailFB.png'></a>
</td><td>
                <a href='https://www.globalmethane.org/'><img height='20' width='20' src='https://www.globalmethane.org/project-network/emailicons/emailWeb.png'></a></td></tr></table>
                <br /><br /><br />" & vbCrLf &
                "***This is an automated e-mail. Do not reply to this e-mail.<br /><br /><br />"

        strBody += "The following information will be publicly available on the Project Network home page (<a href='www.globalmethane.org/project-network'>www.globalmethane.org/project-network</a>) within 10 business days: <br /><br />" & vbCrLf & vbCrLf &
            "<b>Project Network Member Details</b><br />" &
        "Organization: " & Session("join_name") & "<br />" & vbCrLf &
        "Type of Organization: " & Session("join_typeOfOrg") & "<br />   " &
        "Website: " & Session("join_website") & "<br />   " & vbCrLf &
        "Address: " & Session("join_mailaddress1") & ",   " &
         Session("join_mailaddress2") & "<br />   " & vbCrLf &
        "City: " & Session("join_city") & "<br />   " & vbCrLf &
        "State: " & Session("join_state") & "<br />   " & vbCrLf &
        "Postal Code: " & Session("join_postalcode") & "<br />   " & vbCrLf &
        "Country: " & Session("join_country") & "<br />   "

        strBody = strBody & "Area(s) of Interest" & ":   " & vbCrLf
        If Session("join_aoiAgriculture") = True Then
            strBody = strBody & "Agriculture" & " ;  " & vbCrLf
        End If
        If Session("join_aoiBiogas") = True Then
            strBody = strBody & "Biogas" & " ;  " & vbCrLf
        End If
        If Session("join_aoicoal") = True Then
            strBody = strBody & "Coal" & ";   " & vbCrLf
        End If

        If Session("join_aoilandfill") = True Then
            strBody = strBody & "Landfill" & " ;  " & vbCrLf
        End If
        If Session("join_aoioilngas") = True Then
            strBody = strBody & "Oil and Gas" & ";   " & vbCrLf
        End If
        If Session("join_wastewater") = True Then
            strBody = strBody & "Wastewater" & ";   " & vbCrLf
        End If

        If Session("join_aoiother") = True Or Len(Session("join_aoiDesc")) > 0 Then
            strBody = strBody & "Other: " & Session("join_aoiDesc") & ";   " & vbCrLf
        End If

        'new code added april08
        strBody = strBody & "<br />   " & vbCrLf
        strBody = strBody & "Geographic Area(s) of Interest&mdash;" & vbCrLf



        If Session("geoPartnership") = True Then
            strBody = strBody & "Initiative-wide" & " ;<br />  " & vbCrLf
        End If

        If Session("geoRegion") = True Then
            strBody = strBody & "Regions: " & Session("geoRegionList") & " <br />  " & vbCrLf
        End If

        If Session("geoCountry") = True Then
            strBody = strBody & "Countries: " & Session("geoCountryList") & " <br />  " & vbCrLf
        End If

        strBody = strBody & "   " & vbCrLf
        strBody = strBody & "Type of Organization:  " & "   " & vbCrLf
        If orgType1.ImageUrl = "/images/checkedradio.gif" Then
            strBody = strBody & "private   " & vbCrLf
        End If
        If orgType2.ImageUrl = "/images/checkedradio.gif" Then
            strBody = strBody & "local   " & vbCrLf
        End If
        If orgType3.ImageUrl = "/images/checkedradio.gif" Then
            strBody = strBody & "research   " & vbCrLf
        End If
        If orgType4.ImageUrl = "/images/checkedradio.gif" Then
            strBody = strBody & "other   " & vbCrLf
        End If
        If orgType5.ImageUrl = "/images/checkedradio.gif" Then
            strBody = strBody & "banks   " & vbCrLf
        End If
        strBody = strBody & "Expertise: " & Session("join_expertise") & "<br /><br />   " & vbCrLf & "   " & vbCrLf

        strBody = strBody & "<b>Project Network Member Point of Contact</b><br />" &
            "First name: " & Session("join_firstname") & "<br />  " &
        "Last name: " & Session("join_lastname") & "<br />  " &
        "Title: " & Session("join_title") & "<br />  " &
          " Address: " & Session("join_mailaddress3") & ",   " &
         Session("join_mailaddress4") & "<br />   " & vbCrLf &
        "City: " & Session("join_city_c") & "<br />  " & vbCrLf &
        "State: " & Session("join_state_c") & "<br />   " & vbCrLf &
        "Postal Code: " & Session("join_postal_c") & "<br />   " & vbCrLf &
        "Country: " & Session("join_country_c") & "<br />   " & vbCrLf &
        "Email: " & Session("join_email") & "<br />   " & vbCrLf &
        "Telephone: " & Session("join_telephone") & "<br />   " & vbCrLf &
        vbCrLf & " <br />  " & vbCrLf
        arrMail(5) = strBody
        'Dim emailsent As Boolean
        'emailsent = clsEmail.SendM2MEmail(arrMail)
        'If emailsent = True Then
        '    'SendConfirmationMail()
        '    Response.Redirect("pnmJoinConfirm.aspx")
        'Else
        '    SendErrorMail()
        '    Response.Redirect("pnmJoinConfirm.aspx?error=1")
        'End If
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
        arrMail(4) = "Request to Join the Project Network"
        arrMail(6) = "HTML"

        arrMail(5) = ""

        Dim strBody As String = "Organization: " & Session("join_name") & "<br />" & vbCrLf &
        "Type of Organization: " & Session("join_typeOfOrg") & "<br />   " &
        "Website: " & Session("join_website") & "<br />   " & vbCrLf &
        "Address: " & Session("join_mailaddress1") & ",   " &
         Session("join_mailaddress2") & "<br />   " & vbCrLf &
        "City: " & Session("join_city") & "<br />   " & vbCrLf &
        "State: " & Session("join_state") & "<br />   " & vbCrLf &
        "Postal Code: " & Session("join_postalcode") & "<br />   " & vbCrLf &
        "Country: " & Session("join_country") & "<br />   "

        strBody = strBody & "Area(s) of Interest" & ":   " & vbCrLf
        If Session("join_aoiAgriculture") = True Then
            strBody = strBody & "Agriculture" & " ;  " & vbCrLf
        End If
        If Session("join_aoiBiogas") = True Then
            strBody = strBody & "Biogas" & " ;  " & vbCrLf
        End If
        If Session("join_aoicoal") = True Then
            strBody = strBody & "Coal" & ";   " & vbCrLf
        End If

        If Session("join_aoilandfill") = True Then
            strBody = strBody & "Landfill" & " ;  " & vbCrLf
        End If
        If Session("join_aoioilngas") = True Then
            strBody = strBody & "Oil and Gas" & ";   " & vbCrLf
        End If
        If Session("join_wastewater") = True Then
            strBody = strBody & "Wastewater" & ";   " & vbCrLf
        End If

        If Session("join_aoiother") = True Or Len(Session("join_aoiDesc")) > 0 Then
            strBody = strBody & "Other: " & Session("join_aoiDesc") & ";   " & vbCrLf
        End If

        'new code added april08
        strBody = strBody & "<br />   " & vbCrLf
        strBody = strBody & "Geographic Area(s) of Interest&mdash;" & vbCrLf



        If Session("geoPartnership") = True Then
            strBody = strBody & "Initiative-wide" & " ;<br />  " & vbCrLf
        End If

        If Session("geoRegion") = True Then
            strBody = strBody & "Regions: " & Session("geoRegionList") & " <br />  " & vbCrLf
        End If

        If Session("geoCountry") = True Then
            strBody = strBody & "Countries: " & Session("geoCountryList") & " <br />  " & vbCrLf
        End If

        strBody = strBody & "   " & vbCrLf
        strBody = strBody & "Type of Organization:  " & "   " & vbCrLf
        If orgType1.ImageUrl = "/images/checkedradio.gif" Then
            strBody = strBody & "private   " & vbCrLf
        End If
        If orgType2.ImageUrl = "/images/checkedradio.gif" Then
            strBody = strBody & "local   " & vbCrLf
        End If
        If orgType3.ImageUrl = "/images/checkedradio.gif" Then
            strBody = strBody & "research   " & vbCrLf
        End If
        If orgType4.ImageUrl = "/images/checkedradio.gif" Then
            strBody = strBody & "other   " & vbCrLf
        End If
        If orgType5.ImageUrl = "/images/checkedradio.gif" Then
            strBody = strBody & "banks   " & vbCrLf
        End If
        strBody = strBody & "Expertise: " & Session("join_expertise") & "<br /><br />   " & vbCrLf & "   " & vbCrLf

        strBody = strBody & "<b>Project Network Member Point of Contact</b><br />" &
            "First name: " & Session("join_firstname") & "<br />  " &
        "Last name: " & Session("join_lastname") & "<br />  " &
        "Title: " & Session("join_title") & "<br />  " &
          " Address: " & Session("join_mailaddress3") & ",   " &
         Session("join_mailaddress4") & "<br />   " & vbCrLf &
        "City: " & Session("join_city_c") & "<br />  " & vbCrLf &
        "State: " & Session("join_state_c") & "<br />   " & vbCrLf &
        "Postal Code: " & Session("join_postal_c") & "<br />   " & vbCrLf &
        "Country: " & Session("join_country_c") & "<br />   " & vbCrLf &
        "Email: " & Session("join_email") & "<br />   " & vbCrLf &
        "Telephone: " & Session("join_telephone") & "<br />   " & vbCrLf &
        "Cell Phone: " & Session("join_cellphone") & "<br />   " & vbCrLf &
        "Fax: " & Session("join_fax") & "<br />   " & vbCrLf & " <br />  " & vbCrLf

        arrMail(5) = strBody
        'Dim emailsent As Boolean
        'emailsent = clsEmail.SendM2MEmail(arrMail)
        'If emailsent = True Then
        '    'SendConfirmationMail()
        '    Response.Redirect("pnmJoinConfirm.aspx")
        'Else
        '    SendErrorMail()
        '    Response.Redirect("pnmJoinConfirm.aspx?error=1")
        'End If
        clsEmail.SendM2MEmail(arrMail)

    End Sub

    Private Sub SendConfirmationMail()

        '' Send mail Confirmation.
        ''arrMail : 0 - To, 1 - cc , 2 - bcc, 3 - from, 4 - subject, 5 - body, 6- format, 7 - attachment.

        Dim arrMail(7) As String

        arrMail(0) = Session("join_email") 'to   
        'arrMail(0) = "adam.langmaid@erg.com"

        ''' Put cc and from field in web.config file.  
        arrMail(1) = GetConfiguration("MailCc")  'cc
        arrMail(3) = GetConfiguration("SupportEmail") 'from"

        arrMail(4) = "Request to Join the Project Network"
        arrMail(5) = ""

        Dim strBody
        strBody = "Thank you for submitting your request to join the Project Network.  The following information has been received and will be processed within three (3) business days. If you have any questions please email secretariat@globalmethane.org." & "   " & vbCrLf & "   " & vbCrLf & "Organization: " & Session("join_name") & "<br />" & vbCrLf &
        "Type of Organization: " & Session("join_typeOfOrg") & "<br />   " &
        "Website: " & Session("join_website") & "<br />   " & vbCrLf &
        "Address: " & Session("join_mailaddress1") & ",   " &
         Session("join_mailaddress2") & "<br />   " & vbCrLf &
        "City: " & Session("join_city") & "<br />   " & vbCrLf &
        "State: " & Session("join_state") & "<br />   " & vbCrLf &
        "Postal Code: " & Session("join_postalcode") & "<br />   " & vbCrLf &
        "Country: " & Session("join_country") & "<br />   "

        strBody = strBody & "Area(s) of Interest" & ":   " & vbCrLf
        If Session("join_aoiAgriculture") = True Then
            strBody = strBody & "Agriculture" & " ;  " & vbCrLf
        End If
        If Session("join_aoiBiogas") = True Then
            strBody = strBody & "Biogas" & " ;  " & vbCrLf
        End If
        If Session("join_aoicoal") = True Then
            strBody = strBody & "Coal" & ";   " & vbCrLf
        End If

        If Session("join_aoilandfill") = True Then
            strBody = strBody & "Landfill" & " ;  " & vbCrLf
        End If
        If Session("join_aoioilngas") = True Then
            strBody = strBody & "Oil and Gas" & ";   " & vbCrLf
        End If
        If Session("join_wastewater") = True Then
            strBody = strBody & "Wastewater" & ";   " & vbCrLf
        End If

        If Session("join_aoiother") = True Or Len(Session("join_aoiDesc")) > 0 Then
            strBody = strBody & "Other: " & Session("join_aoiDesc") & ";   " & vbCrLf
        End If

        'new code added april08
        strBody = strBody & "<br />   " & vbCrLf
        strBody = strBody & "Geographic Area(s) of Interest&mdash;" & vbCrLf



        If Session("geoPartnership") = True Then
            strBody = strBody & "Initiative-wide" & " ;<br />  " & vbCrLf
        End If

        If Session("geoRegion") = True Then
            strBody = strBody & "Regions: " & Session("geoRegionList") & " <br />  " & vbCrLf
        End If

        If Session("geoCountry") = True Then
            strBody = strBody & "Countries: " & Session("geoCountryList") & " <br />  " & vbCrLf
        End If

        strBody = strBody & "   " & vbCrLf
        strBody = strBody & "Type of Organization:  " & "   " & vbCrLf
        If orgType1.ImageUrl = "/images/checkedradio.gif" Then
            strBody = strBody & "private   " & vbCrLf
        End If
        If orgType2.ImageUrl = "/images/checkedradio.gif" Then
            strBody = strBody & "local   " & vbCrLf
        End If
        If orgType3.ImageUrl = "/images/checkedradio.gif" Then
            strBody = strBody & "research   " & vbCrLf
        End If
        If orgType4.ImageUrl = "/images/checkedradio.gif" Then
            strBody = strBody & "other   " & vbCrLf
        End If
        If orgType5.ImageUrl = "/images/checkedradio.gif" Then
            strBody = strBody & "banks   " & vbCrLf
        End If
        strBody = strBody & "Expertise: " & Session("join_expertise") & "<br /><br />   " & vbCrLf & "   " & vbCrLf

        strBody = strBody & "<b>Project Network Member Point of Contact</b><br />" &
            "First name: " & Session("join_firstname") & "<br />  " &
        "Last name: " & Session("join_lastname") & "<br />  " &
        "Title: " & Session("join_title") & "<br />  " &
          " Address: " & Session("join_mailaddress3") & ",   " &
         Session("join_mailaddress4") & "<br />   " & vbCrLf &
        "City: " & Session("join_city_c") & "<br />  " & vbCrLf &
        "State: " & Session("join_state_c") & "<br />   " & vbCrLf &
        "Postal Code: " & Session("join_postal_c") & "<br />   " & vbCrLf &
        "Country: " & Session("join_country_c") & "<br />   " & vbCrLf &
        "Email: " & Session("join_email") & "<br />   " & vbCrLf &
        "Telephone: " & Session("join_telephone") & "<br />   " & vbCrLf &
        "Cell Phone: " & Session("join_cellphone") & "<br />   " & vbCrLf &
        "Fax: " & Session("join_fax") & "<br />   " & vbCrLf & " <br />  " & vbCrLf
        lblMemo.Text = strBody

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

        arrMail(4) = "Error with request to Join the Project Network"
        arrMail(5) = ""

        Dim strBody
        strBody = "An error has occurred with the following request, and it could not be sent" & "   " & vbCrLf &
            vbCrLf & "Organization: " & Session("join_name") & "<br />" & vbCrLf &
        "Type of Organization: " & Session("join_typeOfOrg") & "<br />   " &
        "Website: " & Session("join_website") & "<br />   " & vbCrLf &
        "Address: " & Session("join_mailaddress1") & ",   " &
         Session("join_mailaddress2") & "<br />   " & vbCrLf &
        "City: " & Session("join_city") & "<br />   " & vbCrLf &
        "State: " & Session("join_state") & "<br />   " & vbCrLf &
        "Postal Code: " & Session("join_postalcode") & "<br />   " & vbCrLf &
        "Country: " & Session("join_country") & "<br />   "

        strBody = strBody & "Area(s) of Interest" & ":   " & vbCrLf
        If Session("join_aoiAgriculture") = True Then
            strBody = strBody & "Agriculture" & " ;  " & vbCrLf
        End If
        If Session("join_aoiBiogas") = True Then
            strBody = strBody & "Biogas" & " ;  " & vbCrLf
        End If
        If Session("join_aoicoal") = True Then
            strBody = strBody & "Coal" & ";   " & vbCrLf
        End If

        If Session("join_aoilandfill") = True Then
            strBody = strBody & "Landfill" & " ;  " & vbCrLf
        End If
        If Session("join_aoioilngas") = True Then
            strBody = strBody & "Oil and Gas" & ";   " & vbCrLf
        End If
        If Session("join_wastewater") = True Then
            strBody = strBody & "Wastewater" & ";   " & vbCrLf
        End If

        If Session("join_aoiother") = True Or Len(Session("join_aoiDesc")) > 0 Then
            strBody = strBody & "Other: " & Session("join_aoiDesc") & ";   " & vbCrLf
        End If

        'new code added april08
        strBody = strBody & "<br />   " & vbCrLf
        strBody = strBody & "Geographic Area(s) of Interest&mdash;" & vbCrLf



        If Session("geoPartnership") = True Then
            strBody = strBody & "Initiative-wide" & " ;<br />  " & vbCrLf
        End If

        If Session("geoRegion") = True Then
            strBody = strBody & "Regions: " & Session("geoRegionList") & " <br />  " & vbCrLf
        End If

        If Session("geoCountry") = True Then
            strBody = strBody & "Countries: " & Session("geoCountryList") & " <br />  " & vbCrLf
        End If

        strBody = strBody & "   " & vbCrLf
        strBody = strBody & "Type of Organization:  " & "   " & vbCrLf
        If orgType1.ImageUrl = "/images/checkedradio.gif" Then
            strBody = strBody & "private   " & vbCrLf
        End If
        If orgType2.ImageUrl = "/images/checkedradio.gif" Then
            strBody = strBody & "local   " & vbCrLf
        End If
        If orgType3.ImageUrl = "/images/checkedradio.gif" Then
            strBody = strBody & "research   " & vbCrLf
        End If
        If orgType4.ImageUrl = "/images/checkedradio.gif" Then
            strBody = strBody & "other   " & vbCrLf
        End If
        If orgType5.ImageUrl = "/images/checkedradio.gif" Then
            strBody = strBody & "banks   " & vbCrLf
        End If
        strBody = strBody & "Expertise: " & Session("join_expertise") & "<br /><br />   " & vbCrLf & "   " & vbCrLf

        strBody = strBody & "<b>Project Network Member Point of Contact</b><br />" &
            "First name: " & Session("join_firstname") & "<br />  " &
        "Last name: " & Session("join_lastname") & "<br />  " &
        "Title: " & Session("join_title") & "<br />  " &
          " Address: " & Session("join_mailaddress3") & ",   " &
         Session("join_mailaddress4") & "<br />   " & vbCrLf &
        "City: " & Session("join_city_c") & "<br />  " & vbCrLf &
        "State: " & Session("join_state_c") & "<br />   " & vbCrLf &
        "Postal Code: " & Session("join_postal_c") & "<br />   " & vbCrLf &
        "Country: " & Session("join_country_c") & "<br />   " & vbCrLf &
        "Email: " & Session("join_email") & "<br />   " & vbCrLf &
        "Telephone: " & Session("join_telephone") & "<br />   " & vbCrLf &
        "Cell Phone: " & Session("join_cellphone") & "<br />   " & vbCrLf &
        "Fax: " & Session("join_fax") & "<br />   " & vbCrLf & " <br />  " & vbCrLf
        lblMemo.Text = strBody
        arrMail(5) = strBody

        Call clsEmail.SendM2MEmail(arrMail)

    End Sub

   

End Class
