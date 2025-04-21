Imports System.IO
Imports System.Data
Imports System.Configuration
Imports System.Data.SqlClient

Public Class approve1
    Inherits System.Web.UI.Page
    Private regCode As String
    Dim EventID As Int16 = 110
    Dim UserID As String = ""
    Dim LookupValue As String = ""
    Dim profilePic As String = ""


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not (Request.QueryString("ID") Is Nothing) Then
            LookupValue = Request.QueryString("ID")
        Else
            Response.Redirect("../index.aspx", True)
        End If


        Dim constr As String = Common.GetConnString()
        Using con As SqlConnection = New SqlConnection(constr)
            Using cmd As SqlCommand = New SqlCommand("SELECT * from _registercontact WHERE email = '" & LookupValue & "' AND EventID = " & EventID & " AND speakerStatus = 1")
                cmd.CommandType = CommandType.Text
                cmd.Connection = con
                con.Open()
                Using sdr As SqlDataReader = cmd.ExecuteReader()
                    sdr.Read()

                    fName.Text = sdr("fName").ToString()
                    lName.Text = sdr("lName").ToString()
                    profilePic = sdr("profilepic").ToString()

                    If Len(sdr("bio").ToString()) > 1 Then
                        speakerBioHolder.Text = sdr("bio").ToString()
                    End If


                    UserID = sdr("fName").ToString() & sdr("lName").ToString()

                End Using
                con.Close()
            End Using
        End Using


        Image1.ImageUrl = "/gmf2020/speakers/" & UserID & "/image/" & profilePic

    End Sub

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        Dim sqlText = "UPDATE _registercontact SET approved = 1 WHERE email= @email"
        Using cnConnect = New SqlConnection(Common.GetConnString())
            Using cm = New SqlCommand(sqlText, cnConnect)
                cnConnect.Open()

                cm.Parameters.Add("@email", SqlDbType.NVarChar).Value = LookupValue

                lblMessage.Text = "Profile has been approved."
                cm.ExecuteNonQuery()
            End Using
        End Using

    End Sub

End Class