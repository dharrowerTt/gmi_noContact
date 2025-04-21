Imports System.Data.SqlClient
Public Class questions

    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim emailAddress As String
        Dim answer As Integer
        emailAddress = Server.HtmlEncode(Request.QueryString("id"))
        answer = Server.HtmlEncode(Request.QueryString("response"))

        Dim OnScreenText As String = ""
        Dim reason As String = ""
        If answer = 1 Then
            OnScreenText = "That's for recommiting to the GMI Steering Committee!"
            reason = "Staying"
        ElseIf answer = 2 Then
            OnScreenText = "We're sorry to see you go!"
            reason = "leaving"
        ElseIf answer = 3 Then
            OnScreenText = "We're sorry to see you go! Please enter the email address of your proposed replacement below."
            reason = "leaving with idea for replacement"
            TextBox1.Visible = True
        End If

        Label1.Text = OnScreenText

        Dim sqlText = "INSERT INTO steeringQuestions (emailAddress,answer) VALUES (@emailAddress, @reason);"
        Using cnConnect = New SqlConnection(Common.GetConnString())
            Using cm = New SqlCommand(sqlText, cnConnect)
                cnConnect.Open()
                cm.Parameters.Add("@emailAddress", SqlDbType.NVarChar).Value = emailAddress
                cm.Parameters.Add("@reason", SqlDbType.NVarChar).Value = reason


                Dim currentID As Integer = cm.ExecuteScalar()

            End Using
        End Using

    End Sub

End Class