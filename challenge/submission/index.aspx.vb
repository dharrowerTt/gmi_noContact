Imports System.Data.SqlClient

Public Class gmc_submission_index
    Inherits System.Web.UI.Page
    Private Shared submissionID As Integer

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not Page.IsPostBack Then

            If Request.Form.Count > 0 Then
                submissionID = Request.Form("ID")

            Else
                submissionID = -4
            End If


            Dim constr As String = Common.GetConnString()
            Using con As SqlConnection = New SqlConnection(constr)
                Using cmd As SqlCommand = New SqlCommand("SELECT * from gmcNewSubmission WHERE id = " & submissionID)
                    cmd.CommandType = CommandType.Text
                    cmd.Connection = con
                    con.Open()
                    Using sdr As SqlDataReader = cmd.ExecuteReader()
                        sdr.Read()


                        If sdr.HasRows = True Then
                            organizationName.Text = sdr("orgName").ToString()
                            location.Text = sdr("location").ToString()
                            organizationSite.Text = sdr("orgSite").ToString()
                            pocName.Text = sdr("pocName").ToString()
                            phoneNumber.Text = sdr("phoneNumber").ToString()
                            emailAddress.Text = sdr("emailAddress").ToString()
                            customCheck1.Checked = True
                            nextStep.Enabled = True

                        Else


                        End If

                    End Using
                    con.Close()
                End Using
            End Using

        End If



    End Sub

    Protected Sub nextStep_Click(sender As Object, e As EventArgs) Handles nextStep.Click

        If submissionID < 0 Then



            Dim rowNumber As Integer = 0
            Dim sqlText = "INSERT INTO gmcNewSubmission (orgName,location,orgSite,pocName,phoneNumber,emailAddress) VALUES (@orgName, @location, @orgSite, @pocName, @phoneNumber,@emailAddress);select id from gmcNewSubmission where id = @@identity"
            Using cnConnect = New SqlConnection(Common.GetConnString())
                Using cm = New SqlCommand(sqlText, cnConnect)
                    cnConnect.Open()
                    cm.Parameters.Add("@orgName", SqlDbType.NVarChar).Value = organizationName.Text
                    cm.Parameters.Add("@location", SqlDbType.NVarChar).Value = location.SelectedItem.Text
                    cm.Parameters.Add("@orgSite", SqlDbType.NVarChar).Value = organizationSite.Text
                    cm.Parameters.Add("@pocName", SqlDbType.NVarChar).Value = pocName.Text
                    cm.Parameters.Add("@phoneNumber", SqlDbType.NVarChar).Value = phoneNumber.Text
                    cm.Parameters.Add("@emailAddress", SqlDbType.NVarChar).Value = emailAddress.Text

                    Dim currentID As Integer = cm.ExecuteScalar()
                    'Set the ID value to RowNumber for redirection
                    rowNumber = currentID
                End Using
            End Using

            submissionID = rowNumber

            Dim arrMail(7) As String

            arrMail(0) = emailAddress.Text   'TO
            arrMail(2) = "secretariat@globalmethane.org"    'BCC
            arrMail(3) = "secretariat@globalmethane.org"    'FROM 'IIf(txtEmail.Text.Length > 0, txtEmail.Text, arrMail(0))     
            arrMail(4) = "Thanks for starting your Global Methane Challenge submission!"
            arrMail(6) = "HTML"


            Dim sBody As String
            sBody = "<html><style type='text/css'>body{font-family:'Trebuchet MS'; font-size:90%}</style><body>"
            sBody += "<p>Thanks for starting your Global Methane Challenge submission!</p>"
            sBody += "<p>If you need to revisit your submission at any point, click on the following link:</p>"
            sBody += "<p><a href='https://www.globalmethane.org/challenge/submission/step2.aspx?id=" & submissionID & "'>https://www.globalmethane.org/challenge/submission/step2.aspx?id=" & submissionID & "</a></p>"


            sBody += "</body></html>"

            arrMail(5) = sBody

            clsEmail.SendEventEmail(arrMail)

        Else

            Dim sqlText = "UPDATE gmcNewSubmission SET orgName = @orgName, location = @location, orgSite= @orgSite, pocName = @pocName, phoneNumber = @phoneNumber, emailAddress= @emailAddress where id=@submissionID"
            Using cnConnect = New SqlConnection(Common.GetConnString())
                Using cm = New SqlCommand(sqlText, cnConnect)
                    cnConnect.Open()
                    cm.Parameters.Add("@submissionID", SqlDbType.Int).Value = submissionID
                    cm.Parameters.Add("@orgName", SqlDbType.NVarChar).Value = organizationName.Text
                    cm.Parameters.Add("@location", SqlDbType.NVarChar).Value = location.SelectedItem.Text
                    cm.Parameters.Add("@orgSite", SqlDbType.NVarChar).Value = organizationSite.Text
                    cm.Parameters.Add("@pocName", SqlDbType.NVarChar).Value = pocName.Text
                    cm.Parameters.Add("@phoneNumber", SqlDbType.NVarChar).Value = phoneNumber.Text
                    cm.Parameters.Add("@emailAddress", SqlDbType.NVarChar).Value = emailAddress.Text


                    cm.ExecuteNonQuery()
                End Using
            End Using

        End If


        'Redirect to step 2 with ID value in codebehind form
        Dim collections As New NameValueCollection()
        collections.Add("ID", submissionID)
        Dim remoteUrl As String = "step2.aspx"
        Dim html As String = "<html><head>"
        html += "</head><body onload='document.forms[0].submit()'>"
        html += String.Format("<form name='PostForm' method='POST' action='{0}'>", remoteUrl)
        For Each key As String In collections.Keys
            html += String.Format("<input name='{0}' type='text' value='{1}'>", key, collections(key))
        Next
        html += "</form></body></html>"
        Response.Clear()
        Response.ContentEncoding = Encoding.GetEncoding("ISO-8859-1")
        Response.HeaderEncoding = Encoding.GetEncoding("ISO-8859-1")
        Response.Charset = "ISO-8859-1"
        Response.Write(html)
        Response.End()









    End Sub


End Class