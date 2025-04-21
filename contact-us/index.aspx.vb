Imports System.Data.SqlClient
Public Class contact_us_form
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
    Protected WithEvents organization As System.Web.UI.WebControls.TextBox
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
    Protected WithEvents lblErrororganization As System.Web.UI.WebControls.Label
    Protected WithEvents lblErrorCity As System.Web.UI.WebControls.Label
    Protected WithEvents lblErrorPostalCode As System.Web.UI.WebControls.Label
    Protected WithEvents lblErrorCountry As System.Web.UI.WebControls.Label
    Protected WithEvents lblErrorEmail As System.Web.UI.WebControls.Label
    Protected WithEvents lblErrorTelephone As System.Web.UI.WebControls.Label

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

            If Session("c_name") <> "" Then
                name.Text = Session("c_name")
                organization.Text = Session("c_organization")
                email.Text = Session("c_email")
                telephone.Text = Session("c_telephone")

                aoi_agriculture.Checked = Session("join_aoiAgriculture")
                aoi_biogas.Checked = Session("join_aoiBiogas")
                aoi_coal.Checked = Session("join_aoicoal")
                aoi_landfill.Checked = Session("join_aoilandfill")
                aoi_oilngas.Checked = Session("join_aoioilngas")
                aoi_wastewater.Checked = Session("join_wastewater")
                aoi_other.Checked = Session("join_aoiother")
                aoiDesc.Text = Session("join_aoiDesc")

                expertise.InnerText = Session("c_comment")
            End If
        Else
            Trace.Warn("ispostback")
        End If
    End Sub

#Region "Private Functions"

    Dim bIsEror







    Private Sub populateControls()



        Dim dv As DataView = Nothing











    End Sub



    Private Sub clearFields()
        name.Text = ""
        organization.Text = ""
        expertise.Value = ""

    End Sub

#End Region

    Private Function validateData() As String


        Dim strErrorReturn As String = ""

        If Len(expertise.Value) > 1000 Then
            lblErrorExpertise.Visible = True
            lblErrorExpertise.Text = "* Maximum size is 1000, you entered " & Len(expertise.Value)
            strErrorReturn = "AncExpertise"
        Else
            lblErrorExpertise.Visible = False
        End If




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







        If Len(organization.Text) = 0 Then
            lblErrororganization.Visible = True
            strErrorReturn = "AncContactInfo"
        Else
            lblErrororganization.Visible = False
        End If

        If (Len(name.Text) = 0) Then
            lblErrorOrg.Visible = True
            strErrorReturn = "AncContactInfo"
        Else
            lblErrorOrg.Visible = False
        End If


        Return strErrorReturn

    End Function

#Region "Postbacks"

    Private Sub btnSubmit_Click(ByVal sender As System.Object, ByVal e As EventArgs) Handles btnSubmit.Click

        ' new code june08 to prevent sql injection
        Dim s5 As String = organization.Text

        Dim s10 As String = email.Text
        Dim s11 As String = telephone.Text

        Dim s13 As String = aoiDesc.Text
        Dim s14 As String = name.Text
        Dim s15 As String = expertise.Value


        If InStr(s5, "'") Or InStr(s10, "'") Or InStr(s11, "'") Or InStr(s13, "'") Or InStr(s14, "'") Or InStr(s15, "'") Then
            Trace.Warn("sql injection: single quote")
            Exit Sub
        ElseIf InStr(s5, Chr(34)) Or InStr(s10, Chr(34)) Or InStr(s11, Chr(34)) Or InStr(s13, Chr(34)) Or InStr(s14, Chr(34)) Or InStr(s15, Chr(34)) Then
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

            Dim strBody As String = ""

            strBody = WriteStrBody()
            lblMemo.Text = strBody
            DashCF()
            Server.Transfer("contact_us_confirm.aspx", True)
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
        strbody = "Name: " & name.Text & "   " & vbCrLf &
             "Organization: " & organization.Text & "   " & vbCrLf &
            "Email: " & email.Text & "   " & vbCrLf &
            "Telephone: " & telephone.Text & "   " & vbCrLf


        strbody = strbody & "Area of Interest" & "   " & vbCrLf
        If aoi_agriculture.Checked = True Then
            strbody = strbody & "Agriculture" & "   " & vbCrLf
        End If
        If aoi_biogas.Checked = True Then
            strbody = strbody & "Biogas" & "   " & vbCrLf
        End If
        If aoi_coal.Checked = True Then
            strbody = strbody & "Coal" & "   " & vbCrLf
        End If

        If aoi_landfill.Checked = True Then
            strbody = strbody & "Landfill" & "   " & vbCrLf
        End If
        If aoi_oilngas.Checked = True Then
            strbody = strbody & "Oil and Gas" & "   " & vbCrLf
        End If
        If aoi_wastewater.Checked = True Then
            strbody = strbody & "Waste Waster" & "   " & vbCrLf
        End If

        If aoi_other.Checked = True Then
            strbody = strbody & "Other: " & aoiDesc.Text & "   " & vbCrLf
        End If
        strbody = strbody & "   " & vbCrLf

        strbody = strbody & "Your Comments: " & expertise.InnerText & "   " & vbCrLf & "   " & vbCrLf
        lblMemo.Text = strbody
        Return strbody

    End Function

    Private Sub btnReset_Click(ByVal sender As System.Object, ByVal e As EventArgs) Handles btnReset.Click
        Response.Redirect("index.aspx")
    End Sub

    'Private Sub ddlOrgs_SelectedIndexChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles ddlOrgs.SelectedIndexChanged
    '    name.Text = ""
    '    If ddlOrgs.SelectedIndex <> 0 Then
    '        prePopulateFields()
    '    End If
    'End Sub


#End Region


    Protected Sub DashCF()
        Dim dashboardObj As clsDashboardVO
        dashboardObj = New clsDashboardVO


        dashboardObj.setName(name.Text)
        dashboardObj.setEmail(email.Text)
        dashboardObj.setOrg(organization.Text)
        dashboardObj.setComment("Contact Us")
        dashboardObj.setMemo("Comments:  " & expertise.InnerText & "; Phone: " & telephone.Text)
        dashboardObj.setStatus("Temp")



        Dim newPNid As String

        newPNid = clsdashboardDAO.insertCFData(dashboardObj)



    End Sub

    Private Sub pushDataToSession()

        Session("c_name") = name.Text
        Session("c_organization") = organization.Text
        Session("c_email") = email.Text
        Session("c_telephone") = telephone.Text
        Session("c_title") = titlex.Text
        Session("c_comment") = expertise.InnerText
        Session("c_dateEntered") = Today()

        Session("join_aoiAgriculture") = aoi_agriculture.Checked
        Session("join_aoiBiogas") = aoi_biogas.Checked
        Session("join_aoiCoal") = aoi_coal.Checked
        Session("join_aoilandfill") = aoi_landfill.Checked
        Session("join_aoioilngas") = aoi_oilngas.Checked
        Session("join_wastewater") = aoi_wastewater.Checked
        Session("join_aoiother") = aoi_other.Checked
        Session("join_aoidesc") = aoiDesc.Text

    End Sub
End Class


