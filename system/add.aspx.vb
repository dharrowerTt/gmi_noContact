Imports System.Data
Imports System.Configuration
Imports System.Data.SqlClient
Imports System.Collections.Generic
Public Class add

    Inherits System.Web.UI.Page
    Private userID As String
    Private profileID As String
    Private geoID As String
    Private roleType As Integer

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        profileID = Server.HtmlEncode(Request.QueryString("id"))
        ' profileID = "b1540e32-fa61-4123-8207-974cecf8bd3b"
        userID = Server.HtmlEncode(Request.QueryString("usr"))
        '  userID = "b1540e32-fa61-4123-8207-974cecf8bd3b"
        geoID = Server.HtmlEncode(Request.QueryString("geo"))



        If Len(userID) > 5 Then

            If Not IsPostBack Then



                Dim constr As String = Common.GetConnString()
                Using con As SqlConnection = New SqlConnection(constr)
                    Using cmd As SqlCommand = New SqlCommand("SELECT * from _tableDelegateConfirm WHERE personID = '" & userID & "'")
                        cmd.CommandType = CommandType.Text
                        cmd.Connection = con
                        con.Open()
                        Using sdr As SqlDataReader = cmd.ExecuteReader()
                            sdr.Read()

                            If sdr.HasRows = True Then

                                namefield.Text = sdr("personFirstName").ToString() & " " & sdr("personLastName").ToString()

                            End If
                        End Using
                        con.Close()
                    End Using
                End Using

                profilefield.Text = profileID
                useridfield.Text = userID
                geofield.Text = geoID

            End If
        End If

    End Sub

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click

        Dim thanksURL As String = ""
        Dim roleAnswer As String = ""
        Dim ALAnswer As String = ""

        If roleChair.Checked = True Then
            roleAnswer = "Chair"
        ElseIf roleAlternate.Checked = True Then
            roleAnswer = "Alternate"
        ElseIf roleInactivated.Checked = True Then
            roleAnswer = "Inactivated"
        ElseIf roleDelegate.Checked = True Then
            roleAnswer = "Delegate"
        End If

        If alNO.Checked = True Then
            ALAnswer = "No"
        ElseIf alYes.Checked = True Then
            ALAnswer = "Yes"
        End If


        Dim sqlText = "INSERT INTO _tableDelegateConfirm (personFirstName,personLastName,organization,email,position,dateUpdated,updatedBy,countryCode,title,adminFlag) Values( @firstname, @lastname, @organswer, @emailAddress, @role, @updateDate, @updateName, @geo,@title,@ALAnswer)"
        Using cnConnect = New SqlConnection(Common.GetConnString())
            Using cm = New SqlCommand(sqlText, cnConnect)
                cnConnect.Open()
                cm.Parameters.Add("@firstname", SqlDbType.NVarChar).Value = FirstName.Text.Replace(vbCr, "").Replace(vbLf, "")
                cm.Parameters.Add("@lastname", SqlDbType.NVarChar).Value = LastName.Text.Replace(vbCr, "").Replace(vbLf, "")
                cm.Parameters.Add("@organswer", SqlDbType.NVarChar).Value = Org.Text
                cm.Parameters.Add("@emailAddress", SqlDbType.NVarChar).Value = Email.Text
                cm.Parameters.Add("@role", SqlDbType.NVarChar).Value = roleAnswer
                cm.Parameters.Add("@ALAnswer", SqlDbType.NVarChar).Value = ALAnswer
                cm.Parameters.Add("@updateDate", SqlDbType.NVarChar).Value = DateTime.Now()
                cm.Parameters.Add("@updateName", SqlDbType.NVarChar).Value = namefield.Text
                cm.Parameters.Add("@geo", SqlDbType.NVarChar).Value = geofield.Text
                cm.Parameters.Add("@title", SqlDbType.NVarChar).Value = TitleField.Text


                cm.ExecuteNonQuery()
            End Using
        End Using



        thanksURL = "thanks.aspx?ct=" & geofield.Text.Replace(vbCr, "").Replace(vbLf, "") & "&usr=" & useridfield.Text.Replace(vbCr, "").Replace(vbLf, "")

        Response.Redirect(thanksURL)

    End Sub

End Class