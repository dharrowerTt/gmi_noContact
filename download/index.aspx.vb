Imports System.Data.SqlClient
Public Class index14
    Inherits System.Web.UI.Page

    Protected PostBackStr As String
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        PostBackStr = Page.ClientScript.GetPostBackEventReference(Me, "MyCustomArgument")

        If Page.IsPostBack Then
            Dim eventArg As String = Request("__EVENTARGUMENT")
            If eventArg = "MyCustomArgument" Then
                Response.Write("You got it !")
            End If
        End If

    End Sub

    Protected Sub formEnter(sender As Object, e As EventArgs) Handles btnSubmit.Click

        If country.SelectedItem.Value = "" Then
            label2.Text = "Please select a country before submitting the form."
            Exit Sub

        End If

        Page.Title = "Download " & resource.Text

        Label1.Visible = True

        ScriptManager.RegisterClientScriptBlock(Me.Page, GetType(String), "MyJSFunction", "MyJSFunction();", True)


        Dim sqlText = "INSERT INTO _downloadData (firstName,lastName,email,organization,country,intendedUse,resource,submitDate) VALUES (@firstName, @lastName, @email, @organization, @country,@intendedUse,@resource,@submitDate)"
        Using cnConnect = New SqlConnection(Common.GetConnString())
            Using cm = New SqlCommand(sqlText, cnConnect)
                cnConnect.Open()
                cm.Parameters.Add("@firstName", SqlDbType.NVarChar).Value = firstName.Text
                cm.Parameters.Add("@lastName", SqlDbType.NVarChar).Value = lastName.Text
                cm.Parameters.Add("@email", SqlDbType.NVarChar).Value = email.Text
                cm.Parameters.Add("@organization", SqlDbType.NVarChar).Value = organization.Text
                cm.Parameters.Add("@country", SqlDbType.NVarChar).Value = country.SelectedItem.Text
                cm.Parameters.Add("@intendedUse", SqlDbType.NVarChar).Value = intendedUse.Text
                cm.Parameters.Add("@resource", SqlDbType.NVarChar).Value = resource.Text
                cm.Parameters.Add("@submitDate", SqlDbType.NVarChar).Value = Today

                cm.ExecuteScalar()
            End Using
        End Using

        Dim arrMail(7) As String

        arrMail(0) = "secretariat@globalmethane.org"   'TO
        arrMail(1) = "BiogasTools@abtassoc.com"
        arrMail(2) = "biogastoolkit@epa.gov"    'BCC
        arrMail(3) = "secretariat@globalmethane.org"    'FROM 'IIf(txtEmail.Text.Length > 0, txtEmail.Text, arrMail(0))     
        arrMail(4) = "Someone Wanted " & resource.Text
        arrMail(6) = "HTML"


        Dim sBody As String
        sBody = "<html><style type='text/css'>body{font-family:'Trebuchet MS'; font-size:90%}</style><body>"
        sBody += "<p>Someone has left their details in exchange for " & resource.Text & "</p>"
        sBody += "<p>Details:</p>"
        sBody += "<ul><li>" & firstName.Text & " " & lastName.Text & "</li>"
        sBody += "<li>" & email.Text & "</li>"
        sBody += "<li>" & organization.Text & "</li>"
        sBody += "<li>" & country.Text & "</li>"
        sBody += "<li>" & intendedUse.Text & "</li>"
        sBody += "<li>" & Today & "</li></ul>"


        sBody += "</body></html>"

        arrMail(5) = sBody

        clsEmail.SendEventEmail(arrMail)




        Dim textChange As String = "Thank you for downloading."

        Dim resourceValue As String = resource.Text

        divCenter.InnerHtml = textChange

        download_form.Visible = False





        'Redirect to step 2 with ID value in codebehind form

        If resourceValue = "Solid Waste Emissions Estimation Tool(SWEET) Version 4.0.6" Then
            Response.Redirect("https://www.globalmethane.org/mrv/sweet/SWEET_Version_4.0.6_EN.xlsm")
        ElseIf resourceValue = "SWEET_FR" Then
            Response.Redirect("https://www.globalmethane.org/mrv/sweet/SWEET_Version_4.0.5_FR.xlsm")
        ElseIf resourceValue = "SWEET_BP" Then
            Response.Redirect("https://www.globalmethane.org/mrv/sweet/SWEET_Version_4.0.5_BP.xlsm")
        ElseIf resourceValue = "Solid Waste Emissions Estimation Tool(SWEET) Version 4.0.4 [Spanish]" Then
            Response.Redirect("https://www.globalmethane.org/mrv/sweet/SWEET_Version_4.0.4_ES.xlsm")
        ElseIf resourceValue = "Landfill Gas Screening Tool (LFG-ST)" Then
            Response.Redirect("https://www.globalmethane.org/documents/LFG-ScreeningTool_2021.xlsx")
        ElseIf resourceValue = "OrganEcs – Cost Estimating Tool for Anaerobic Digestion" Then
            Response.Redirect("https://www.globalmethane.org/documents/3-OrganEcs-Version3-AD-Cold-Storage-India-5-25-2022.xlsm")
        ElseIf resourceValue = "Anaerobic Digestion Screening Tool" Then
            Response.Redirect("https://www.globalmethane.org/documents/AD-ScreeningTool_v2.5.xlsm")
        ElseIf resourceValue = "Ferramenta ADST v2.4 Beta Version (Brazilian Portuguese, Excel)" Then
            Response.Redirect("https://www.globalmethane.org/documents/AD-ScreeningTool_v2.4_PTBR_12.12.2024.xlsm")
        ElseIf resourceValue = "OrganEcs - Compost Version" Then
            Response.Redirect("https://www.globalmethane.org/mrv/organecs/OrganEcs-Compost-v3.1.xlsm")
        ElseIf resourceValue = "OrganEcs - Anaerobic Digestion Version" Then
            Response.Redirect("https://www.globalmethane.org/mrv/organecs/OrganEcs-AD-v3.1.xlsm")
        ElseIf resourceValue = "Model za pracenje deponijskih gasova (LFG-ST) (Serbian, Excel)" Then
            Response.Redirect("https://www.globalmethane.org/documents/LFG-ScreeningTool_2021_SRB.xlsx")
        ElseIf resourceValue = "Model za procenu emisija iz sektora upravljanja cvrstim otpadom (SWEET) v 4.0.4 (Serbian, Excel)" Then
            Response.Redirect("https://www.globalmethane.org/documents/SWEET_Version_4.0.5_SRB.xlsm")
        ElseIf resourceValue = "Waste Characterization Handbook" Then
            Response.Redirect("https://www.globalmethane.org/documents/WasteCharacterizationHandbook.pdf")
        ElseIf resourceValue = "Waste Characterization Tool" Then
            Response.Redirect("https://www.globalmethane.org/documents/WasteCharacterizationTool.xlsx")
        End If



    End Sub

    Protected Sub btnSkip_Click(sender As Object, e As EventArgs) Handles btnSkip.Click

        Page.Title = "Download " & resource.Text

        Label1.Visible = True

        Dim textChange As String = "Thank you for downloading!"

        Dim sqlText = "INSERT INTO _downloadData (firstName,resource,submitDate) VALUES (@firstName, @resource,@submitDate)"
        Using cnConnect = New SqlConnection(Common.GetConnString())
            Using cm = New SqlCommand(sqlText, cnConnect)
                cnConnect.Open()
                cm.Parameters.Add("@firstName", SqlDbType.NVarChar).Value = "Skipped"
                cm.Parameters.Add("@resource", SqlDbType.NVarChar).Value = resource.Text
                cm.Parameters.Add("@submitDate", SqlDbType.NVarChar).Value = Today

                cm.ExecuteScalar()
            End Using
        End Using

        Dim resourceValue As String = resource.Text

        divCenter.Visible = False

        download_form.Visible = False

        If resourceValue = "Solid Waste Emissions Estimation Tool(SWEET) Version 4.0.6" Then
            Response.Redirect("https://www.globalmethane.org/mrv/sweet/SWEET_Version_4.0.6_EN.xlsm")
        ElseIf resourceValue = "SWEET_FR" Then
            Response.Redirect("https://www.globalmethane.org/mrv/sweet/SWEET_Version_4.0.5_FR.xlsm")
        ElseIf resourceValue = "SWEET_BP" Then
            Response.Redirect("https://www.globalmethane.org/mrv/sweet/SWEET_Version_4.0.5_BP.xlsm")
        ElseIf resourceValue = "Solid Waste Emissions Estimation Tool(SWEET) Version 4.0.4 [Spanish]" Then
            Response.Redirect("https://www.globalmethane.org/mrv/sweet/SWEET_Version_4.0.4_ES.xlsm")
        ElseIf resourceValue = "Landfill Gas Screening Tool (LFG-ST)" Then
            Response.Redirect("https://www.globalmethane.org/documents/LFG-ScreeningTool_2021.xlsx")
        ElseIf resourceValue = "OrganEcs – Cost Estimating Tool for Anaerobic Digestion" Then
            Response.Redirect("https://www.globalmethane.org/documents/3-OrganEcs-Version3-AD-Cold-Storage-India-5-25-2022.xlsm")
        ElseIf resourceValue = "Anaerobic Digestion Screening Tool" Then
            Response.Redirect("https://www.globalmethane.org/documents/AD-ScreeningTool_v2.5.xlsm")
        ElseIf resourceValue = "Ferramenta ADST v2.4 Beta Version (Brazilian Portuguese, Excel)" Then
            Response.Redirect("https://www.globalmethane.org/documents/AD-ScreeningTool_v2.4_PTBR_12.12.2024.xlsm")
        ElseIf resourceValue = "OrganEcs - Compost Version" Then
            Response.Redirect("https://www.globalmethane.org/mrv/organecs/OrganEcs-Compost-v3.1.xlsm")
        ElseIf resourceValue = "OrganEcs - Anaerobic Digestion Version" Then
            Response.Redirect("https://www.globalmethane.org/mrv/organecs/OrganEcs-AD-v3.1.xlsm")
        ElseIf resourceValue = "Model za pracenje deponijskih gasova (LFG-ST) (Serbian, Excel)" Then
            Response.Redirect("https://www.globalmethane.org/documents/LFG-ScreeningTool_2021_SRB.xlsx")
        ElseIf resourceValue = "Model za procenu emisija iz sektora upravljanja cvrstim otpadom (SWEET) v 4.0.5 (Serbian, Excel)" Then
            Response.Redirect("https://www.globalmethane.org/documents/SWEET_Version_4.0.5_SRB.xlsm")
        ElseIf resourceValue = "Waste Characterization Handbook" Then
            Response.Redirect("https://www.globalmethane.org/documents/WasteCharacterizationHandbook.pdf")
        ElseIf resourceValue = "Waste Characterization Tool" Then
            Response.Redirect("https://www.globalmethane.org/documents/WasteCharacterizationTool.xlsx")
        End If



    End Sub




End Class