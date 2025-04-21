Imports System.Data
Imports System.Configuration
Imports System.Data.SqlClient
Public Class registerspeaker
    Inherits System.Web.UI.Page
    Dim EventID As Int16 = 110

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub checkUser(ByVal s As Object, ByVal e As EventArgs)

        Dim registerObj As clsRegisterVO
        registerObj = New clsRegisterVO

        registerObj.setEmail(emailaddress.Text)
        registerObj.setEventID(EventID)


        Dim EmailAdd As String

        EmailAdd = clsRegisterDAO.insertSpeakerEmail(registerObj)

        Dim sqlText = "UPDATE _registercontact SET speakerstatus = 1 WHERE email= @email and eventID = 110"
        Using cnConnect = New SqlConnection(Common.GetConnString())
            Using cm = New SqlCommand(sqlText, cnConnect)
                cnConnect.Open()
                cm.Parameters.Add("@email", SqlDbType.NVarChar).Value = emailaddress.Text


                cm.ExecuteNonQuery()
            End Using
        End Using


    End Sub



    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        Dim constr As String = Common.GetConnString()


        Using con As SqlConnection = New SqlConnection(constr)
            Using cmd As SqlCommand = New SqlCommand("select count(*) As CountofRows FROM _registercontact where email = '" & emailaddress.Text & "' AND editable = 1 and eventID = " & EventID)
                cmd.CommandType = CommandType.Text
                cmd.Connection = con
                con.Open()
                Using sdr As SqlDataReader = cmd.ExecuteReader()
                    sdr.Read()
                    If sdr("CountofRows") > 0 Then

                        Dim sqlText = "UPDATE _registercontact SET speakerstatus = 1 WHERE email= @email and eventID = 110"
                        Using cnConnect = New SqlConnection(Common.GetConnString())
                            Using cm = New SqlCommand(sqlText, cnConnect)
                                cnConnect.Open()
                                cm.Parameters.Add("@email", SqlDbType.NVarChar).Value = emailaddress.Text


                                cm.ExecuteNonQuery()
                            End Using
                        End Using


                        Response.Redirect("success.aspx?ID=" + emailaddress.Text, True)
                    Else
                        checkUser(emailaddress.Text, e)
                        Response.Redirect("regform.aspx?ID=" + emailaddress.Text)
                    End If

                End Using
                con.Close()
            End Using
        End Using




        'recdirect or popup or whatever you feel like doing
        Response.Redirect("regform.aspx", True)
    End Sub

End Class