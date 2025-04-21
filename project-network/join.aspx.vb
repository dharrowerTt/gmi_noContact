Imports System.Data.SqlClient
Public Class project_network_join
    Inherits System.Web.UI.Page
    Protected WithEvents expertise As System.Web.UI.HtmlControls.HtmlTextArea

#Region " Web Form Designer Generated Code "

    'This call is required by the Web Form Designer.
    <System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()

    End Sub
    Protected WithEvents name As System.Web.UI.WebControls.TextBox
    Protected WithEvents website As System.Web.UI.WebControls.TextBox
    Protected WithEvents firstName As System.Web.UI.WebControls.TextBox
    Protected WithEvents titlex As System.Web.UI.WebControls.TextBox
    Protected WithEvents mailAddress1 As System.Web.UI.WebControls.TextBox
    Protected WithEvents mailAddress2 As System.Web.UI.WebControls.TextBox
    Protected WithEvents city As System.Web.UI.WebControls.TextBox
    Protected WithEvents state As System.Web.UI.WebControls.TextBox
    Protected WithEvents postalCode As System.Web.UI.WebControls.TextBox
    Protected WithEvents ddlCountry As System.Web.UI.WebControls.DropDownList
    Protected WithEvents email As System.Web.UI.WebControls.TextBox
    Protected WithEvents telephone As System.Web.UI.WebControls.TextBox
    Protected WithEvents cellphone As System.Web.UI.WebControls.TextBox
    Protected WithEvents fax As System.Web.UI.WebControls.TextBox
    Protected WithEvents aoi_agriculture As System.Web.UI.WebControls.CheckBox
    Protected WithEvents aoi_biogas As System.Web.UI.WebControls.CheckBox
    Protected WithEvents aoi_coal As System.Web.UI.WebControls.CheckBox
    Protected WithEvents aoi_landfill As System.Web.UI.WebControls.CheckBox
    Protected WithEvents aoi_oilngas As System.Web.UI.WebControls.CheckBox
    Protected WithEvents aoi_wastewater As System.Web.UI.WebControls.CheckBox
    Protected WithEvents aoi_other As System.Web.UI.WebControls.CheckBox
    Protected WithEvents aoiDesc As System.Web.UI.WebControls.TextBox

    Protected WithEvents cbxSameAsAbove As System.Web.UI.WebControls.CheckBox
    Protected WithEvents mailAddress3 As System.Web.UI.WebControls.TextBox
    Protected WithEvents mailAddress4 As System.Web.UI.WebControls.TextBox
    Protected WithEvents city_c As System.Web.UI.WebControls.TextBox
    Protected WithEvents state_c As System.Web.UI.WebControls.TextBox
    Protected WithEvents postal_c As System.Web.UI.WebControls.TextBox
    Protected WithEvents ddlCountry_c As System.Web.UI.WebControls.DropDownList

    Protected WithEvents geoPartnership As System.Web.UI.WebControls.CheckBox
    Protected WithEvents geoRegion As System.Web.UI.WebControls.CheckBox
    Protected WithEvents geoCountry As System.Web.UI.WebControls.CheckBox
    Protected WithEvents libPartnerCountries As System.Web.UI.WebControls.ListBox
    Protected WithEvents libRegion As System.Web.UI.WebControls.ListBox


    Protected WithEvents orgType1 As System.Web.UI.WebControls.RadioButton
    Protected WithEvents orgType2 As System.Web.UI.WebControls.RadioButton
    Protected WithEvents orgType3 As System.Web.UI.WebControls.RadioButton
    Protected WithEvents orgType4 As System.Web.UI.WebControls.RadioButton
    Protected WithEvents orgType5 As System.Web.UI.WebControls.RadioButton

    Protected WithEvents cbVC As System.Web.UI.WebControls.CheckBox
    Protected WithEvents Form1 As System.Web.UI.HtmlControls.HtmlForm
    Protected WithEvents lastName As System.Web.UI.WebControls.TextBox
    Protected WithEvents btnReset As System.Web.UI.WebControls.LinkButton
    Protected WithEvents btnSubmit As System.Web.UI.WebControls.LinkButton
    Protected WithEvents DateEntered As System.Web.UI.WebControls.Label
    Protected WithEvents rbO1 As System.Web.UI.WebControls.RadioButton
    Protected WithEvents rbO2 As System.Web.UI.WebControls.RadioButton

    Protected WithEvents lblErrorVC As System.Web.UI.WebControls.Label
    Protected WithEvents lblErrorOrg As System.Web.UI.WebControls.Label
    Protected WithEvents lblErrorFirstName As System.Web.UI.WebControls.Label
    Protected WithEvents lblErrorLastName As System.Web.UI.WebControls.Label
    Protected WithEvents lblErrorTitle As System.Web.UI.WebControls.Label
    Protected WithEvents lblErrorMailAddress1 As System.Web.UI.WebControls.Label
    Protected WithEvents lblErrorCity As System.Web.UI.WebControls.Label
    Protected WithEvents lblErrorPostalCode As System.Web.UI.WebControls.Label
    Protected WithEvents lblErrorCountry As System.Web.UI.WebControls.Label
    Protected WithEvents lblErrorEmail As System.Web.UI.WebControls.Label
    Protected WithEvents lblErrorTelephone As System.Web.UI.WebControls.Label
    Protected WithEvents lblErrorAoi As System.Web.UI.WebControls.Label
    Protected WithEvents lblErrorAoiOther As System.Web.UI.WebControls.Label
    Protected WithEvents lblErrorGeo As System.Web.UI.WebControls.Label
    Protected WithEvents lblErrorExpertise As System.Web.UI.WebControls.Label
    Protected WithEvents lblErrorMailAddress3 As System.Web.UI.WebControls.Label
    Protected WithEvents lblErrorCity_c As System.Web.UI.WebControls.Label
    Protected WithEvents lblErrorpostal_c As System.Web.UI.WebControls.Label
    Protected WithEvents lblErrorCountry_c As System.Web.UI.WebControls.Label
    Protected WithEvents lblErrorTC As System.Web.UI.WebControls.Label
    Protected WithEvents diverror As Global.System.Web.UI.WebControls.Literal
    Protected WithEvents diverror2 As Global.System.Web.UI.WebControls.Literal

    Protected WithEvents lblTopErrorMsg As System.Web.UI.WebControls.Label

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
            Trace.Warn("not ispostback")
            populateControls()


        Else
            Trace.Warn("ispostback")
        End If
    End Sub

#Region "Private Functions"

    Dim bIsEror



    Protected Sub FillRegion()

        Dim dv As DataView = Nothing

        dv = clsLookup.GetRegions

        libRegion.DataTextField = "regionname"
        libRegion.DataValueField = "regioncode"
        libRegion.DataSource = dv
        libRegion.DataBind()

    End Sub

    Private Sub pushDataToSession()


        Session("join_name") = name.Text



        Session("join_website") = website.Text
        Session("join_dateEntered") = DateEntered.Text
        Session("join_firstName") = firstName.Text
        Session("join_lastname") = lastName.Text
        Session("join_title") = titlex.Text
        Session("join_mailAddress1") = mailAddress1.Text
        Session("join_mailAddress2") = mailAddress2.Text
        Session("join_mailAddress3") = mailAddress3.Text
        Session("join_mailAddress4") = mailAddress4.Text
        Session("join_city") = city.Text
        Session("join_state") = state.Text
        Session("join_postalCode") = postalCode.Text
        Session("join_country") = ddlCountry.SelectedValue
        Session("join_city_c") = city_c.Text
        Session("join_state_c") = state_c.Text
        Session("join_postal_c") = postal_c.Text
        Session("join_country_c") = ddlCountry_c.SelectedValue
        Session("join_email") = email.Text
        Session("join_telephone") = telephone.Text
        Session("join_cellphone") = cellphone.Text
        Session("join_fax") = fax.Text




        If orgType1.Checked Then
            Session("join_typeOfOrg") = "private"
        ElseIf orgType2.Checked Then
            Session("join_typeOfOrg") = "local"
        ElseIf orgType3.Checked Then
            Session("join_typeOfOrg") = "research"
        ElseIf orgType4.Checked Then
            Session("join_typeOfOrg") = "other"
        ElseIf orgType5.Checked Then
            Session("join_typeOfOrg") = "banks"
        Else
            Session("join_typeOfOrg") = ""
        End If



        ' added april08
        Dim strComma As String = ""




        If Len(Session("join_email")) > 0 Then

            diverror2.Text = Session("join_email").ToString & "Session variables are saving correctly."



        End If

    End Sub

    Private Sub populateControls()

        website.Text = "https://"

        DateEntered.Text = Format(Now(), "dd/MM/yyyy")

        Dim dv As DataView = Nothing
        'dv = getAllOrgsWithSelectOne(1)    -- Removed organization list - 07/10/2013
        'ddlOrgs.DataSource = dv
        'ddlOrgs.DataTextField = "name"
        'ddlOrgs.DataValueField = "name"
        'ddlOrgs.DataBind()

        dv = clsLookup.getCountriesWithSelectOne
        ddlCountry.DataSource = dv
        ddlCountry.DataTextField = "countryname"
        ddlCountry.DataValueField = "countryname"
        ddlCountry.DataBind()

        ddlCountry_c.DataSource = dv
        ddlCountry_c.DataTextField = "countryname"
        ddlCountry_c.DataValueField = "countryname"
        ddlCountry_c.DataBind()

        If Session("join_name") <> "" Then
            name.Text = Session("join_name")
            website.Text = Session("join_website")
            DateEntered.Text = Session("join_dateEntered") & " (DD-MM-YYYY)"
            firstName.Text = Session("join_firstname")
            lastName.Text = Session("join_lastname")
            titlex.Text = Session("join_title")
            mailAddress1.Text = Session("join_mailaddress1")
            mailAddress2.Text = Session("join_mailaddress2")
            mailAddress3.Text = Session("join_mailaddress3")
            mailAddress4.Text = Session("join_mailaddress4")
            city.Text = Session("join_city")
            state.Text = Session("join_state")
            postalCode.Text = Session("join_postalcode")
            ddlCountry_c.SelectedValue = Session("join_country_c")
            city_c.Text = Session("join_city_c")
            state_c.Text = Session("join_state_c")
            postal_c.Text = Session("join_postal_c")
            ddlCountry_c.SelectedValue = Session("join_country_c")
            email.Text = Session("join_email")
            telephone.Text = Session("join_telephone")
            cellphone.Text = Session("join_cellphone")
            fax.Text = Session("join_fax")

            aoi_agriculture.Checked = Session("join_aoiAgriculture")
            aoi_biogas.Checked = Session("join_aoiBiogas")
            aoi_coal.Checked = Session("join_aoicoal")
            aoi_landfill.Checked = Session("join_aoilandfill")
            aoi_oilngas.Checked = Session("join_aoioilngas")
            aoi_wastewater.Checked = Session("join_wastewater")
            aoi_other.Checked = Session("join_aoiother")
            aoiDesc.Text = Session("join_aoiDesc")

            Select Case Session("join_typeOfOrg")
                Case "private"
                    orgType1.Checked = True
                Case "local"
                    orgType2.Checked = True
                Case "research"
                    orgType3.Checked = True
                Case "other"
                    orgType4.Checked = True
                Case "banks"
                    orgType5.Checked = True
            End Select

            expertise.Value = Session("join_expertise")



        End If

    End Sub

    'Private Sub prePopulateFields()
    '    Dim sConn As String = GetConnString()
    '    Dim sSql As String = "SELECT * FROM viewJoinNetworkPrepopulate WHERE name='" & ddlOrgs.SelectedValue.Replace("'", "''") & "'"
    '    Trace.Warn(sSql)
    '    Dim da As New SqlDataAdapter(sSql, sConn)
    '    Dim ds As New DataSet
    '    da.Fill(ds, "orgDetail")
    '    'Dim bldr As New SqlCommandBuilder(da)
    '    Dim dt As DataTable = ds.Tables(0)
    '    If dt.Rows.Count > 0 Then
    '        website.Text = myNullCheck(dt.Rows(0).Item("website"))
    '        'mailAddress1.Text = myNullCheck(dt.Rows(0).Item("mailaddress1"))
    '        'mailAddress2.Text = myNullCheck(dt.Rows(0).Item("mailaddress2"))
    '        'city.Text = myNullCheck(dt.Rows(0).Item("city"))
    '        'state.Text = myNullCheck(dt.Rows(0).Item("state"))
    '        'postalCode.Text = myNullCheck(dt.Rows(0).Item("postalcode"))
    '        'ddlCountry.SelectedValue = myNullCheck(dt.Rows(0).Item("country"))
    '        'email.Text = myNullCheck(dt.Rows(0).Item("email"))
    '        'telephone.Text = myNullCheck(dt.Rows(0).Item("telephone"))
    '        'fax.Text = myNullCheck(dt.Rows(0).Item("fax"))
    '        expertise.Value = myNullCheck(dt.Rows(0).Item("expertise"))
    '        Select Case myNullCheck(dt.Rows(0).Item("typeOfOrganization"))
    '            Case "private"
    '                orgType1.Checked = True
    '            Case "local"
    '                orgType2.Checked = True
    '            Case "research"
    '                orgType3.Checked = True
    '            Case "other"
    '                orgType4.Checked = True
    '            Case "banks"
    '                orgType5.Checked = True
    '        End Select
    '    End If
    'End Sub

    Private Sub clearFields()
        website.Text = ""
        orgType1.Checked = False
        orgType2.Checked = False
        orgType3.Checked = False
        orgType4.Checked = False
        orgType5.Checked = False
        expertise.Value = ""

    End Sub

#End Region

    Private Function validateData() As String

        '"<script language='JavaScript'>window.location = " & Chr(34) & "AncVC" & Chr(34) & ";</script>"
        'Me.Page.Response.Write("<script language='JavaScript'>window.location = " & Chr(34) & "AncAoi" & Chr(34) & ";</script>")

        ' validate the page from bottom to top, so that the top-most error is where the user is returned to

        Dim strErrorReturn As String = ""




        If Len(telephone.Text) = 0 Then
            lblErrorTelephone.Visible = True
            strErrorReturn = "AncContactInfo"
        Else
            lblErrorTelephone.Visible = False
        End If

        If Len(email.Text) = 0 Then
            lblErrorEmail.Text = "* Required"
            lblErrorEmail.Visible = True
            strErrorReturn = "AncContactInfo"
        ElseIf InStr(email.Text, "@") = 0 Then
            lblErrorEmail.Text = "* Invalid"
            lblErrorEmail.Visible = True
            strErrorReturn = "AncContactInfo"
        Else
            lblErrorEmail.Visible = False
        End If

        If ddlCountry.SelectedIndex < 1 Then
            lblErrorCountry.Visible = True
            strErrorReturn = "AncContactInfo"
        Else
            lblErrorCountry.Visible = False
        End If

        If ddlCountry_c.SelectedIndex < 1 Then
            lblErrorCountry_c.Visible = True
            strErrorReturn = "AncContactInfo"
        Else
            lblErrorCountry_c.Visible = False
        End If

        If Len(postalCode.Text) = 0 Then
            lblErrorPostalCode.Visible = True
            strErrorReturn = "AncContactInfo"
        Else
            lblErrorPostalCode.Visible = False
        End If

        If Len(postal_c.Text) = 0 Then
            lblErrorpostal_c.Visible = True
            strErrorReturn = "AncContactInfo"
        Else
            lblErrorpostal_c.Visible = False
        End If

        If Len(city.Text) = 0 Then
            lblErrorCity.Visible = True
            strErrorReturn = "AncContactInfo"
        Else
            lblErrorCity.Visible = False
        End If

        If Len(city_c.Text) = 0 Then
            lblErrorCity_c.Visible = True
            strErrorReturn = "AncContactInfo"
        Else
            lblErrorCity_c.Visible = False
        End If

        If Len(mailAddress1.Text) = 0 Then
            lblErrorMailAddress1.Visible = True
            strErrorReturn = "AncContactInfo"
        Else
            lblErrorMailAddress1.Visible = False
        End If

        If Len(mailAddress3.Text) = 0 Then
            lblErrorMailAddress3.Visible = True
            strErrorReturn = "AncContactInfo"
        Else
            lblErrorMailAddress3.Visible = False
        End If

        '''If Len(title.Text) = 0 Then
        '''    lblErrorTitle.Visible = True
        '''    strErrorReturn = "AncContactInfo"
        '''Else
        '''    lblErrorTitle.Visible = False
        '''End If

        If Len(lastName.Text) = 0 Then
            lblErrorLastName.Visible = True
            strErrorReturn = "AncContactInfo"
        Else
            lblErrorLastName.Visible = False
        End If

        If Len(firstName.Text) = 0 Then
            lblErrorFirstName.Visible = True
            strErrorReturn = "AncContactInfo"
        Else
            lblErrorFirstName.Visible = False
        End If

        If (Len(name.Text) = 0) Then
            lblErrorOrg.Visible = True
            strErrorReturn = "AncContactInfo"
        Else
            lblErrorOrg.Visible = False
        End If

        If cbVC.Checked Then
            lblErrorVC.Visible = False
        Else
            lblErrorVC.Visible = True
            lblErrorTC.Visible = True
            strErrorReturn = "AncVC"
        End If
        Return strErrorReturn

    End Function

#Region "Postbacks"

    Private Sub btnSubmit_Click(ByVal sender As System.Object, ByVal e As EventArgs) Handles btnSubmit.Click

        ' new code june08 to prevent sql injection

        Dim s1 As String = website.Text
        Dim s2 As String = firstName.Text
        Dim s3 As String = lastName.Text
        Dim s4 As String = titlex.Text
        Dim s5 As String = mailAddress1.Text
        Dim s6 As String = mailAddress2.Text
        Dim s7 As String = city.Text
        Dim s8 As String = state.Text
        Dim s9 As String = postalCode.Text
        Dim s10 As String = email.Text
        Dim s11 As String = telephone.Text
        Dim s12 As String = fax.Text
        Dim s14 As String = name.Text
        Dim s16 As String = mailAddress3.Text
        Dim s17 As String = mailAddress4.Text
        Dim s18 As String = city_c.Text
        Dim s19 As String = state_c.Text
        Dim s20 As String = postal_c.Text

        If InStr(s1, "'") Or InStr(s2, "'") Or InStr(s3, "'") Or InStr(s4, "'") Or InStr(s5, "'") Or InStr(s6, "'") Or InStr(s7, "'") Or InStr(s8, "'") Or InStr(s9, "'") Or InStr(s10, "'") Or InStr(s11, "'") Or InStr(s12, "'") Or InStr(s14, "'") Or InStr(s16, "'") Or InStr(s17, "'") Or InStr(s18, "'") Or InStr(s19, "'") Or InStr(s20, "'") Then
            Trace.Warn("sql injection: single quote")
            Exit Sub
        ElseIf InStr(s1, Chr(34)) Or InStr(s2, Chr(34)) Or InStr(s3, Chr(34)) Or InStr(s4, Chr(34)) Or InStr(s5, Chr(34)) Or InStr(s6, Chr(34)) Or InStr(s7, Chr(34)) Or InStr(s8, Chr(34)) Or InStr(s9, Chr(34)) Or InStr(s10, Chr(34)) Or InStr(s11, Chr(34)) Or InStr(s12, Chr(34)) Or InStr(s14, Chr(34)) Or InStr(s16, Chr(34)) Or InStr(s17, Chr(34)) Or InStr(s18, Chr(34)) Or InStr(s19, Chr(34)) Or InStr(s20, Chr(34)) Then
            Trace.Warn("sql injection: double quote")
            Exit Sub
            ' allow spaces, you have to for address, city, expertise, aoi other, etc.
            'ElseIf InStr(s1, " ") Or InStr(s2, " ") Or InStr(s3, " ") Or InStr(s4, " ") Or InStr(s5, " ") Or InStr(s6, " ") Or InStr(s7, " ") Or InStr(s8, " ") Or InStr(s9, " ") Or InStr(s10, " ") Or InStr(s11, " ") Or InStr(s12, " ") Or InStr(s13, " ") Or InStr(s14, " ") Then
            'Trace.Warn("sql injection: space")
            'Exit Sub
        End If
        ' validateData either returns null (everything ok) or the code necessary to reposition to the location on the page with the error
        Dim strErrorReturn As String = validateData()
        If strErrorReturn = "" Then
            pushDataToSession()
            Dim strBody As String = ""

            strBody = WriteStrBody()
            lblMemo.Text = strBody
            DashCF()
            Server.Transfer("pnmJoinVerify.aspx", True)
            'Response.Redirect("pnmJoinVerify.aspx")
        Else
            '<!DOCTYPE html PUBLIC '-//W3C//DTD XHTML 1.0 Transitional//EN' 'http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd'>
            'Me.Page.Response.Write("<script language='JavaScript'>window.location = " & Chr(34) & "#" & strErrorReturn & Chr(34) & ";</script>")

            '"<script language='JavaScript'>window.location = " & Chr(34) & "AncVC" & Chr(34) & ";</script>"
            'Me.Page.Response.Write("<script language='JavaScript'>window.location = " & Chr(34) & "AncAoi" & Chr(34) & ";</script>")
            lblTopErrorMsg.Visible = True
            DashCF()
        End If


    End Sub

    Private Function WriteStrBody()
        Dim strbody As String = ""
        strbody = "Organization: " & Session("join_name") & "   " & vbCrLf &
            "Website: " & Session("join_website") & "   " & vbCrLf &
            "Date Entered: " & Session("join_dateEntered") & " (DD-MM-YYYY)" & "   " & vbCrLf &
            "First Name: " & Session("join_firstname") & "   " & vbCrLf &
            "Last Name: " & Session("join_lastname") & "   " & vbCrLf &
            "Title: " & Session("join_title") & "   " & vbCrLf &
            "Organization Address: " & Session("join_mailaddress1") & "   " & vbCrLf &
             Session("join_mailaddress2") & "   " & vbCrLf &
            "City: " & Session("join_city") & "   " & vbCrLf &
            "State: " & Session("join_state") & "   " & vbCrLf &
            "Postal Code: " & Session("join_postalcode") & "   " & vbCrLf &
            "Country: " & Session("join_country") & "   " & vbCrLf &
            "Contact Address: " & Session("join_mailaddress3") & "   " & vbCrLf &
             Session("join_mailaddress4") & "   " & vbCrLf &
            "City: " & Session("join_city_c") & "   " & vbCrLf &
            "State: " & Session("join_state_c") & "   " & vbCrLf &
            "Postal Code: " & Session("join_postal_c") & "   " & vbCrLf &
            "Country: " & Session("join_country_c") & "   " & vbCrLf &
            "Email: " & Session("join_email") & "   " & vbCrLf &
            "Telephone: " & Session("join_telephone") & "   " & vbCrLf &
            "Cell Phone: " & Session("join_cellphone") & "   " & vbCrLf &
            "Fax: " & Session("join_fax") & "   " & vbCrLf & "   " & vbCrLf

        strbody = strbody & "Area of Interest" & "   " & vbCrLf
        If Session("join_aoiBiogas") = True Then
            strbody = strbody & "Biogas" & "   " & vbCrLf
        End If
        If Session("join_aoiAgriculture") = True Then
            strbody = strbody & "Agriculture" & "   " & vbCrLf
        End If
        If Session("join_aoilandfill") = True Then
            strbody = strbody & "MSW" & "   " & vbCrLf
        End If
        If Session("join_wastewater") = True Then
            strbody = strbody & "Wastewater" & "   " & vbCrLf
        End If

        If Session("join_aoicoal") = True Then
            strbody = strbody & "Coal" & "   " & vbCrLf
        End If


        If Session("join_aoioilngas") = True Then
            strbody = strbody & "Oil and Gas" & "   " & vbCrLf
        End If


        If Session("join_aoiother") = True Or Len(Session("join_aoiDesc")) > 0 Then
            strbody = strbody & "Other: " & Session("join_aoiDesc") & "   " & vbCrLf
        End If

        'new code added april08
        strbody = strbody & "   " & vbCrLf
        strbody = strbody & "Geographic Area(s) of Interest" & "   " & vbCrLf



        If Session("geoPartnership") = True Then
            strbody = strbody & "Initiative-wide" & "   " & vbCrLf
        End If

        If Session("geoRegion") = True Then
            strbody = strbody & "Region List: " & Session("geoRegionList") & "   " & vbCrLf
        End If

        If Session("geoCountry") = True Then
            strbody = strbody & "geo Country List: " & Session("geoCountryList") & "   " & vbCrLf
        End If

        strbody = strbody & "   " & vbCrLf
        strbody = strbody & "Type Of Organization: " & Session("join_typeOfOrg") & "   " & vbCrLf & "   " & vbCrLf

        strbody = strbody & "Expertise: " & Session("join_expertise") & "   " & vbCrLf & "   " & vbCrLf
        lblMemo.Text = strbody
        Return strbody

    End Function

    Private Sub btnReset_Click(ByVal sender As System.Object, ByVal e As EventArgs) Handles btnReset.Click
        Response.Redirect("pnmJoin.aspx")
    End Sub

    'Private Sub ddlOrgs_SelectedIndexChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles ddlOrgs.SelectedIndexChanged
    '    name.Text = ""
    '    If ddlOrgs.SelectedIndex <> 0 Then
    '        prePopulateFields()
    '    End If
    'End Sub


#End Region

    Protected Sub cbxSameAsAbove_CheckedChanged(sender As Object, e As EventArgs) Handles cbxSameAsAbove.CheckedChanged
        If cbxSameAsAbove.Checked = True Then
            mailAddress3.Text = mailAddress1.Text
            mailAddress4.Text = mailAddress2.Text
            city_c.Text = city.Text
            state_c.Text = state.Text
            postal_c.Text = postalCode.Text
            ddlCountry_c.SelectedIndex = ddlCountry.SelectedIndex
        Else
            mailAddress3.Text = ""
            mailAddress4.Text = ""
            city_c.Text = ""
            state_c.Text = ""
            postal_c.Text = ""
            ddlCountry_c.SelectedIndex = 0
            SetFocus(mailAddress3)
        End If

    End Sub

    Protected Sub DashCF()
        Dim dashboardObj As clsDashboardVO
        dashboardObj = New clsDashboardVO


        dashboardObj.setName(firstName.Text + " " + lastName.Text)
        dashboardObj.setEmail(email.Text)
        dashboardObj.setOrg(name.Text)
        dashboardObj.setComment("Project Network")
        dashboardObj.setMemo(lblMemo.Text)
        dashboardObj.setStatus("Temp")



        Dim newPNid As String

        newPNid = clsdashboardDAO.insertCFData(dashboardObj)



    End Sub
End Class


