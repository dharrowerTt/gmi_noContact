Imports System.Data.SqlClient
Public Class index6
    Inherits System.Web.UI.Page
    Public Shared CountryData As String = ""
    Public Shared CountryCount As Integer = 0
    Public Shared CountryCountString As String = ""
    Public Shared CountryCount2 As Integer = 0
    Public Shared CountryCountString2 As String = ""
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        CountryData = ""


        Dim queryCountry As String = "SELECT  country, f2, COUNT(email) AS Expr1 FROM dbo.ctaEvent left join dbo.countryLookup on ctaEvent.country = countryLookUp.F1 where not country = 'N/A' GROUP BY country, f2 ORDER BY Expr1 DESC"

        Using con2 As New SqlConnection(Common.GetConnString())
            Using cmd2 As New SqlCommand(queryCountry)
                Using sda2 As New SqlDataAdapter()
                    cmd2.Connection = con2
                    sda2.SelectCommand = cmd2
                    Using ds2 As New DataSet()
                        sda2.Fill(ds2)
                        Dim dc As DataColumn
                        Dim dr As DataRow

                        For Each dr In ds2.Tables(0).Rows

                            CountryData += "{'id': '" & dr(1).ToString & "','name': '" & dr(0).ToString & "','Popvalue': '" & dr(0).ToString & ": " & dr(2).ToString & "','fill': am4core.color('#82589F')},"



                        Next
                        CountryData += "{'id': 'ZZ','name': 'zz','Popvalue': 0,'fill': am4core.color('#5C5CFF')}"

                    End Using
                End Using
            End Using
        End Using
        ''''''''''''''''''''''''''''''''''''''''''''''''''
        Dim queryCount As String = "SELECT  COUNT(email) AS Expr1 FROM dbo.ctaEvent"

        Using con2 As New SqlConnection(Common.GetConnString())
            Using cmd2 As New SqlCommand(queryCount)
                Using sda2 As New SqlDataAdapter()
                    cmd2.Connection = con2
                    sda2.SelectCommand = cmd2
                    Using ds3 As New DataSet()
                        sda2.Fill(ds3)
                        Dim dc2 As DataColumn
                        Dim dr2 As DataRow

                        For Each dr2 In ds3.Tables(0).Rows

                            CountryCount = dr2(0)

                        Next

                    End Using
                End Using
            End Using
        End Using


        If CountryCount = 300 Then
            CountryCountString = "300"
        End If
        If CountryCount > 300 Then
            CountryCountString = "more than 300"
        End If
        If CountryCount > 320 Then
            CountryCountString = "more than 320"
        End If
        If CountryCount > 330 Then
            CountryCountString = "more than 330"
        End If
        If CountryCount > 340 Then
            CountryCountString = "more than 340"
        End If
        If CountryCount = 350 Then
            CountryCountString = "350"
        End If
        If CountryCount > 350 Then
            CountryCountString = "more than 350"
        End If
        If CountryCount > 375 Then
            CountryCountString = "more than 375"
        End If
        If CountryCount = 400 Then
            CountryCountString = "400"
        End If
        If CountryCount > 425 Then
            CountryCountString = "more than 400"
        End If
        If CountryCount = 450 Then
            CountryCountString = "450"
        End If
        If CountryCount > 450 Then
            CountryCountString = "more than 450"
        End If
        If CountryCount > 475 Then
            CountryCountString = "more than 475"
        End If
        If CountryCount = 500 Then
            CountryCountString = "more than 500"
        End If
        If CountryCount > 575 Then
            CountryCountString = "more than 575"
        End If
        If CountryCount = 600 Then
            CountryCountString = "600"
        End If
        If CountryCount > 600 Then
            CountryCountString = "more than 600"
        End If
        If CountryCount > 625 Then
            CountryCountString = "more than 625"
        End If
        If CountryCount = 650 Then
            CountryCountString = "650"
        End If
        If CountryCount > 650 Then
            CountryCountString = "more than 650"
        End If
        If CountryCount > 675 Then
            CountryCountString = "more than 675"
        End If
        If CountryCount = 700 Then
            CountryCountString = "700"
        End If
        If CountryCount > 700 Then
            CountryCountString = "more than 700"
        End If
        If CountryCount = 750 Then
            CountryCountString = "750"
        End If
        If CountryCount > 725 Then
            CountryCountString = "more than 725"
        End If
        If CountryCount = 750 Then
            CountryCountString = "750"
        End If
        If CountryCount > 775 Then
            CountryCountString = "more than 775"
        End If
        If CountryCount = 800 Then
            CountryCountString = "800"
        End If
        If CountryCount > 800 Then
            CountryCountString = "more than 800"
        End If
        If CountryCount > 825 Then
            CountryCountString = "825"
        End If
        If CountryCount = 850 Then
            CountryCountString = "850"
        End If
        If CountryCount > 850 Then
            CountryCountString = "more than 850"
        End If
        If CountryCount = 875 Then
            CountryCountString = "875"
        End If

        ''''''''''''''''''''''''''''''''''
        Dim queryCount2 As String = "SELECT  distinct COUNT(country) AS Expr1 FROM dbo.ctaEvent"

        Using con2 As New SqlConnection(Common.GetConnString())
            Using cmd3 As New SqlCommand(queryCount2)
                Using sda3 As New SqlDataAdapter()
                    cmd3.Connection = con2
                    sda3.SelectCommand = cmd3
                    Using ds4 As New DataSet()
                        sda3.Fill(ds4)
                        Dim dc3 As DataColumn
                        Dim dr3 As DataRow

                        For Each dr3 In ds4.Tables(0).Rows

                            CountryCount2 = dr3(0)

                        Next

                    End Using
                End Using
            End Using
        End Using

        If CountryCount2 > 40 Then
            CountryCountString2 = "40"
        End If

        If CountryCount2 > 50 Then
            CountryCountString2 = "50"
        End If

        If CountryCount2 > 60 Then
            CountryCountString2 = "60"
        End If
    End Sub

    Protected Sub register_Click(sender As Object, e As EventArgs) Handles register.Click
        Dim rowNumber As Integer = 0
        Dim Biogas As Integer = 0
        Dim CoalMines As Integer = 0
        Dim OilGas As Integer = 0
        Dim expertiseLevel As String = ""
        Dim referralText As String = ""

        If referral.SelectedValue = "other" Then
            referralText = referralOther.Text
        Else
            referralText = referral.SelectedValue
        End If

        If jobTitle.Text.Length > 1 Or emailAddress.Text = "Thensample@email.tst" Then

            Dim script As String = "window.onload = function() { closeEarly(); };"
            ClientScript.RegisterStartupScript(Me.GetType(), "closeEarly", script, True)

            '/////


            Dim sqlText2 = "INSERT INTO injection (emailAddress,submissionTime) VALUES (@emailAddress, GETDATE() );"
            Using cnConnect2 = New SqlConnection(Common.GetConnString())
                Using cm2 = New SqlCommand(sqlText2, cnConnect2)
                    cnConnect2.Open()
                    cm2.Parameters.Add("@emailAddress", SqlDbType.NVarChar).Value = emailAddress.Text



                    Dim currentID As Integer = cm2.ExecuteScalar()
                    'Set the ID value to RowNumber for redirection
                    rowNumber = currentID
                End Using
            End Using

            '/////

            Exit Sub

        End If

        For Each item As ListItem In experience.Items
            If item.Selected Then
                expertiseLevel = item.Value
            End If
        Next

        'For Each item As ListItem In sectorsInterest.Items
        ' If item.Selected Then
        'If item.Value = "biogas" Then
        'Biogas = 1
        'End If
        'If item.Value = "coal" Then
        'CoalMines = 1
        'End If
        'If item.Value = "oilgas" Then
        'OilGas = 1
        'End If
        'End If
        'Next

        Dim Register As String = ""
        Dim constr As String = Common.GetConnString()
        Using con As SqlConnection = New SqlConnection(constr)
            Using cmd As SqlCommand = New SqlCommand("SELECT * from ctaEvent WHERE email = '" & emailAddress.Text & "'")
                cmd.CommandType = CommandType.Text
                cmd.Connection = con
                con.Open()
                Using sdr As SqlDataReader = cmd.ExecuteReader()
                    sdr.Read()


                    If sdr.HasRows = True Then
                        'User Exists
                        Register = "exists"
                    Else
                        'User Does Not Exist
                        Register = "new"
                        Dim sqlText = "INSERT INTO ctaEvent (fName,lName,email,organization,jobTitle,country,orgType,expertise,referral) VALUES (@fName, @lName, @email, @organization, @jobtitle,@country,@orgType,@expertise,@referral);"
                        Using cnConnect = New SqlConnection(Common.GetConnString())
                            Using cm = New SqlCommand(sqlText, cnConnect)
                                cnConnect.Open()
                                cm.Parameters.Add("@fName", SqlDbType.NVarChar).Value = fName.Text
                                cm.Parameters.Add("@lName", SqlDbType.NVarChar).Value = lName.Text
                                cm.Parameters.Add("@email", SqlDbType.NVarChar).Value = emailAddress.Text
                                cm.Parameters.Add("@organization", SqlDbType.NVarChar).Value = organization.Text
                                cm.Parameters.Add("@jobtitle", SqlDbType.NVarChar).Value = jobTitle.Text
                                cm.Parameters.Add("@country", SqlDbType.NVarChar).Value = country.SelectedItem.Value
                                cm.Parameters.Add("@orgType", SqlDbType.NVarChar).Value = organizationType.SelectedItem.Value
                                cm.Parameters.Add("@expertise", SqlDbType.NVarChar).Value = expertiseLevel
                                cm.Parameters.Add("@referral", SqlDbType.NVarChar).Value = referralText


                                Dim currentID As Integer = cm.ExecuteScalar()
                                'Set the ID value to RowNumber for redirection
                                rowNumber = currentID
                            End Using
                        End Using

                    End If

                    Dim arrMail(7) As String

                    arrMail(0) = "secretariat@globalmethane.org"     'TO
                    ' arrMail(2) = "secretariat@globalmethane.org"    'BCC
                    arrMail(3) = "secretariat@globalmethane.org"    'FROM 'IIf(txtEmail.Text.Length > 0, txtEmail.Text, arrMail(0))     
                    arrMail(4) = "ALERT: New Registrant"
                    arrMail(6) = "HTML"

                    Dim OrgCopy As String

                    If Len(organization.Text) < 1 Then
                        OrgCopy = "undefined"
                    Else
                        OrgCopy = organization.Text
                    End If

                    Dim sBody As String
                    sBody = "<p>Email: " & emailAddress.Text & "</p>"
                    sBody += "<p>First Name: " & fName.Text & "</p>"
                    sBody += "<p>Last Name: " & lName.Text & "</p>"
                    sBody += "<p>Organization: " & OrgCopy & "</p>"
                    sBody += "<p>Job Title: " & jobTitle.Text & "</p>"
                    sBody += "<p>Country: " & country.SelectedItem.Value & "</p>"
                    sBody += "<p>Org Type: " & organizationType.SelectedItem.Value & "</p>"

                    'sBody += "<p>If you need to revisit your submission at any point, click on the following link:</p>"
                    'sBody += "<p><a href='https://www.globalmethane.org/challenge/submission/step2.aspx?id=" & submissionID & "'>https://www.globalmethane.org/challenge/submission/step2.aspx?id=" & submissionID & "</a></p>"


                    'sBody += "</body></html>"

                    arrMail(5) = sBody

                    clsEmail.SendEventEmail(arrMail)

                    fName.Text = String.Empty
                    lName.Text = String.Empty
                    emailAddress.Text = String.Empty
                    jobTitle.Text = String.Empty
                    organization.Text = String.Empty
                    country.ClearSelection()
                    organizationType.ClearSelection()


                    If Register = "new" Then
                        Dim script As String = "window.onload = function() { confirmSubmission(); };"
                        ClientScript.RegisterStartupScript(Me.GetType(), "confirmSubmission", script, True)
                    Else
                        Dim script As String = "window.onload = function() { confirmSubmissionAgain(); };"
                        ClientScript.RegisterStartupScript(Me.GetType(), "confirmSubmissionAgain", script, True)
                    End If

                End Using
                con.Close()
            End Using
        End Using



    End Sub

    Protected Sub DropDownList_Changed(ByVal sender As Object, ByVal e As EventArgs)
        If referral.SelectedItem.Value = "other" Then
            pnlTextBox.Visible = True
        Else
            pnlTextBox.Visible = False
        End If
    End Sub
End Class