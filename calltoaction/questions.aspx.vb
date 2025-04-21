Imports System.Data.SqlClient
Public Class questions1
    Inherits System.Web.UI.Page
    Public Shared QuestionText As String = ""

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Today > "2021/5/28" Then
            question.Enabled = False
            panelist.Enabled = False
            email.Enabled = False
            questionSubmit.Enabled = False
            QuestionText = "<strong>We are no longer accepting questions for the panelists in the Industry Panel Discussion.</strong>"

        Else
            QuestionText = "We're accepting questions for panelists in the Industry Panel Discussion. <strong>Questions must be submitted by 28 May.</strong>"
        End If
    End Sub


    Protected Sub questionSubmit_Click(sender As Object, e As EventArgs) Handles questionSubmit.Click

        If Len(question.Text) > 3000 Then
            Dim script As String = "window.onload = function() { tryAgain(); };"
            ClientScript.RegisterStartupScript(Me.GetType(), "tryAgain", script, True)
            Exit Sub
        End If
        Dim rowNumber As Integer = 0
        Dim Register As String = ""
        Dim constr As String = Common.GetConnString()
        Using con As SqlConnection = New SqlConnection(constr)
            Using cmd As SqlCommand = New SqlCommand("SELECT * from ctaEvent WHERE email = '" & email.Text & "'")
                cmd.CommandType = CommandType.Text
                cmd.Connection = con
                con.Open()
                Using sdr As SqlDataReader = cmd.ExecuteReader()
                    sdr.Read()


                    If sdr.HasRows = True Then
                        'User Exists
                        Register = "registered"
                    Else
                        'User Does Not Exist
                        Register = "not registered"
                    End If

                    Dim sqlText = "INSERT INTO ctaQuestions (question, email,panelist,status,dateSubmitted) VALUES (@question, @email, @panelist, @status,@dateSubmitted);"
                    Using cnConnect = New SqlConnection(Common.GetConnString())
                        Using cm = New SqlCommand(sqlText, cnConnect)
                            cnConnect.Open()
                            cm.Parameters.Add("@question", SqlDbType.NVarChar).Value = question.Text
                            cm.Parameters.Add("@email", SqlDbType.NVarChar).Value = email.Text
                            cm.Parameters.Add("@panelist", SqlDbType.NVarChar).Value = panelist.Text
                            cm.Parameters.Add("@status", SqlDbType.NVarChar).Value = Register
                            cm.Parameters.Add("@dateSubmitted", SqlDbType.Date).Value = DateTime.Now

                            Dim currentID As Integer = cm.ExecuteScalar()
                            'Set the ID value to RowNumber for redirection
                            rowNumber = currentID
                        End Using
                    End Using


                    Dim arrMail(7) As String
                    arrMail(0) = "secretariat@globalmethane.org"     'TO
                    ' arrMail(2) = "secretariat@globalmethane.org"    'BCC
                    arrMail(3) = "secretariat@globalmethane.org"    'FROM 'IIf(txtEmail.Text.Length > 0, txtEmail.Text, arrMail(0))     
                    arrMail(4) = "Call To Action Event: Question Submitted"
                    arrMail(6) = "HTML"

                    Dim sBody As String
                    sBody = "<p><strong>Email: </strong>" & email.Text & "</p>"
                    sBody += "<p><strong>Question:</strong> " & question.Text & "</p>"
                    sBody += "<p><strong>Panelist</strong>: " & panelist.Text & "</p>"
                    sBody += "<p><strong>Status</strong>: " & Register & "</p>"

                    arrMail(5) = sBody

                    clsEmail.SendEventEmail(arrMail)



                    question.Text = String.Empty
                    email.Text = String.Empty
                    panelist.Text = String.Empty

                    If Register = "registered" Then
                        Dim script As String = "window.onload = function() { confirmSubmission1(); };"
                        ClientScript.RegisterStartupScript(Me.GetType(), "confirmSubmission1", script, True)
                    Else
                        Dim script As String = "window.onload = function() { confirmSubmission2(); };"
                        ClientScript.RegisterStartupScript(Me.GetType(), "confirmSubmission2", script, True)
                    End If

                End Using
                con.Close()
            End Using
        End Using

    End Sub
End Class