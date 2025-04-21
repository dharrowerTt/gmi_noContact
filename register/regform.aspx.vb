Imports System.Data
Imports System.Configuration
Imports System.Data.SqlClient
Public Class regform
    Inherits System.Web.UI.Page
    Private regCode As String
    Dim EventID As Int16 = 102

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Me.IsPostBack Then

            Dim LookupValue As String = ""

            If Not (Request.QueryString("ID") Is Nothing) Then
                LookupValue = Request.QueryString("ID")
            Else
                Response.Redirect("index.aspx", True)
            End If


            Dim constr As String = Common.GetConnString()
            Using con As SqlConnection = New SqlConnection(constr)
                Using cmd As SqlCommand = New SqlCommand("SELECT * from _registercontact WHERE email = '" & LookupValue & "' AND EventID = " & EventID)
                    cmd.CommandType = CommandType.Text
                    cmd.Connection = con
                    con.Open()
                    Using sdr As SqlDataReader = cmd.ExecuteReader()
                        sdr.Read()
                        contactID.Text = sdr("contactID")
                        fName.Text = sdr("fName").ToString()
                        lName.Text = sdr("lName").ToString()
                        emailAddress.Text = sdr("Email").ToString()
                        jobTitle.Text = sdr("jobTitle").ToString()
                        organization.Text = sdr("organization").ToString()

                        phone.Text = sdr("phone").ToString()
                    End Using
                    con.Close()
                End Using
            End Using
        End If
    End Sub

    Protected Sub updateReg(ByVal s As Object, ByVal e As EventArgs) Handles btnRegister.ServerClick


        updateData(s, e)

        Response.Redirect("form.aspx")


    End Sub


    Protected Sub updateData(ByVal s As Object, ByVal e As EventArgs)

        Dim registerObj As clsRegisterVO
        registerObj = New clsRegisterVO

        Dim clean As String
        clean = emailAddress.Text.Replace(",", "")

        registerObj.setEmail(clean)
        registerObj.setfName(fName.Text)
        registerObj.setlName(lName.Text)
        registerObj.setjobTitle(jobTitle.Text)
        registerObj.setorganization(organization.Text)
        registerObj.setcountry(country.SelectedItem.Value)
        registerObj.setphone(phone.Text)


        Dim EmailAdd As String


        EmailAdd = clsRegisterDAO.editRegistration(registerObj)

    End Sub



End Class