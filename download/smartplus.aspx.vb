Imports System.Data.SqlClient
Public Class smartplus
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

        'clsEmail.SendEventEmail(arrMail)




        Dim textChange As String = "Thank you for downloading."

        Dim resourceValue As String = resource.Text

        divCenter.InnerHtml = textChange

        download_form.Visible = False





        'Redirect to step 2 with ID value in codebehind form

        If resourceValue = "SMART Plus Facility Template (v1.0)" Then
            Response.Redirect("https://www.globalmethane.org/download/smartplus_files.aspx?id=1")
        ElseIf resourceValue = "SMART Plus Database Application (v1.0)" Then
            Response.Redirect("https://www.globalmethane.org/download/smartplus_files.aspx?id=2")
        ElseIf resourceValue = "SMART Plus IPCC Tier 1/Tier 2 Reporting Template (v1.0)" Then
            Response.Redirect("https://www.globalmethane.org/download/smartplus_files.aspx?id=3")
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

        'Redirect to step 2 with ID value in codebehind form

        If resourceValue = "SMART Plus Facility Template (v1.0)" Then
            Response.Redirect("https://www.globalmethane.org/download/smartplus_files.aspx?id=1")
        ElseIf resourceValue = "SMART Plus Database Application (v1.0)" Then
            Response.Redirect("https://www.globalmethane.org/download/smartplus_files.aspx?id=2")
        ElseIf resourceValue = "SMART Plus IPCC Tier 1/Tier 2 Reporting Template (v1.0)" Then
            Response.Redirect("https://www.globalmethane.org/download/smartplus_files.aspx?id=3")
        End If



    End Sub

End Class