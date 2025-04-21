Imports System.Data.SqlClient

Public Class index5
    Inherits System.Web.UI.Page
    Dim EventID As Int16 = 101


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub




    Protected Sub checkUser(ByVal s As Object, ByVal e As EventArgs)

        Dim registerObj As clsRegisterVO
        registerObj = New clsRegisterVO

        registerObj.setEmail(emailaddress.Text)
        registerObj.setEventID(EventID)


        Dim EmailAdd As String

        EmailAdd = clsRegisterDAO.insertEmail(registerObj)



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