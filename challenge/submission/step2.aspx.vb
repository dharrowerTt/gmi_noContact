Imports System.Data.SqlClient
Public Class step2
    Inherits System.Web.UI.Page
    Private Shared submissionID As Integer

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then

            If String.IsNullOrEmpty(Request.QueryString("id")) = False Then
                submissionID = Server.HtmlEncode(Request.QueryString("id"))
            ElseIf Request.Form.Count > 0 Then
                If Request.Form("ID") IsNot Nothing Then
                    submissionID = Request.Form("ID")

                ElseIf Request.Form("submissionIDBack") IsNot Nothing Then
                    submissionID = Request.Form("submissionIDBack")
                End If

                ID.Text = submissionID

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

                            actiontitle.Text = sdr("activityName").ToString()

                            If Not IsDBNull(sdr("biogasSector")) Then
                                If sdr("biogasSector") = True Then
                                    BioGasCheck.Checked = True
                                End If
                            End If

                            If Not IsDBNull(sdr("coalminesSector")) Then
                                If sdr("coalminesSector") = True Then
                                    CoalMinesCheck.Checked = True
                                End If
                            End If

                            If Not IsDBNull(sdr("oilgasSector")) Then
                                If sdr("oilgasSector") = True Then
                                    OilGasCheck.Checked = True
                                End If
                            End If

                            activitylocation.Text = sdr("partnerCountries").ToString()
                            partners.Text = sdr("partnerOrgs").ToString()

                            If Len(sdr("activityDescription").ToString()) > 1 Then
                                activityinfo.Text = sdr("activityDescription").ToString()
                            End If

                            If Len(sdr("outcomes").ToString()) > 1 Then
                                outcomes.Text = sdr("outcomes").ToString()
                            End If

                            If Len(sdr("nextsteps").ToString()) > 1 Then
                                nextsteps.Text = sdr("nextsteps").ToString()
                            End If

                        End If



                    End Using
                    con.Close()
                End Using
            End Using

        End If
    End Sub

    Protected Sub NextStep_Click(sender As Object, e As EventArgs) Handles NextStep.Click

        Dim biogasBit As Integer = 0
        Dim coalminesBit As Integer = 0
        Dim oilgasBit As Integer = 0

        If BioGasCheck.Checked = True Then
            biogasBit = 1
        End If

        If CoalMinesCheck.Checked = True Then
            coalminesBit = 1
        End If

        If OilGasCheck.Checked = True Then
            oilgasBit = 1
        End If

        Dim activityinfoText As String = ""
        Dim outcomesText As String = ""
        Dim nextstepsText As String = ""

        If Len(activityinfo.Text) > 4000 Then
            activityinfoText = activityinfo.Text.Substring(0, 4000)
        Else
            activityinfoText = activityinfo.Text
        End If

        If Len(outcomes.Text) > 4000 Then
            outcomesText = outcomes.Text.Substring(0, 4000)
        Else
            outcomesText = outcomes.Text
        End If

        If Len(nextsteps.Text) > 4000 Then
            nextstepsText = nextsteps.Text.Substring(0, 4000)
        Else
            nextstepsText = nextsteps.Text
        End If


        Dim sqlText = "UPDATE gmcNewSubmission SET activityName = @actionTitle, biogasSector = @biogasBit, coalminesSector = @coalminesBit, oilgasSector = @oilgasBit, partnerCountries = @activityLocation, partnerOrgs = @partners, activityDescription = @activityInfo, outcomes = @outcomes, nextSteps = @nextsteps where id=@submissionID"
        Using cnConnect = New SqlConnection(Common.GetConnString())
            Using cm = New SqlCommand(sqlText, cnConnect)
                cnConnect.Open()
                cm.Parameters.Add("@submissionID", SqlDbType.Int).Value = submissionID
                cm.Parameters.Add("@actionTitle", SqlDbType.NVarChar).Value = actiontitle.Text
                cm.Parameters.Add("@biogasBit", SqlDbType.Bit).Value = biogasBit
                cm.Parameters.Add("@coalminesBit", SqlDbType.Bit).Value = coalminesBit
                cm.Parameters.Add("@oilgasBit", SqlDbType.Bit).Value = oilgasBit
                cm.Parameters.Add("@activityLocation", SqlDbType.NVarChar).Value = activitylocation.Text
                cm.Parameters.Add("@partners", SqlDbType.NVarChar).Value = partners.Text
                cm.Parameters.Add("@activityInfo", SqlDbType.NVarChar).Value = activityinfoText
                cm.Parameters.Add("@outcomes", SqlDbType.NVarChar).Value = outcomesText
                cm.Parameters.Add("@nextsteps", SqlDbType.NVarChar).Value = nextstepsText


                cm.ExecuteNonQuery()
            End Using
        End Using


        'Redirect to step 3 with ID value in codebehind form
        Dim collections As New NameValueCollection()
        collections.Add("ID", submissionID)
        Dim remoteUrl As String = "step3.aspx"
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

    Protected Sub LastStep_Click(sender As Object, e As EventArgs) Handles LastStep.Click


        Dim biogasBit As Integer = 0
        Dim coalminesBit As Integer = 0
        Dim oilgasBit As Integer = 0

        If BioGasCheck.Checked = True Then
            biogasBit = 1
        End If

        If CoalMinesCheck.Checked = True Then
            coalminesBit = 1
        End If

        If OilGasCheck.Checked = True Then
            oilgasBit = 1
        End If


        Dim activityinfoText As String = ""
        Dim outcomesText As String = ""
        Dim nextstepsText As String = ""

        If Len(activityinfo.Text) > 4000 Then
            activityinfoText = activityinfo.Text.Substring(0, 4000)
        Else
            activityinfoText = activityinfo.Text
        End If

        If Len(outcomes.Text) > 4000 Then
            outcomesText = outcomes.Text.Substring(0, 4000)
        Else
            outcomesText = outcomes.Text
        End If

        If Len(nextsteps.Text) > 4000 Then
            nextstepsText = nextsteps.Text.Substring(0, 4000)
        Else
            nextstepsText = nextsteps.Text
        End If

        Dim sqlText = "UPDATE gmcNewSubmission SET activityName = @actionTitle, biogasSector = @biogasBit, coalminesSector = @coalminesBit, oilgasSector = @oilgasBit, partnerCountries = @activityLocation, partnerOrgs = @partners, activityDescription = @activityInfo, outcomes = @outcomes, nextSteps = @nextsteps where id=@submissionID"
        Using cnConnect = New SqlConnection(Common.GetConnString())
            Using cm = New SqlCommand(sqlText, cnConnect)
                cnConnect.Open()
                cm.Parameters.Add("@submissionID", SqlDbType.Int).Value = submissionID
                cm.Parameters.Add("@actionTitle", SqlDbType.NVarChar).Value = actiontitle.Text
                cm.Parameters.Add("@biogasBit", SqlDbType.Bit).Value = biogasBit
                cm.Parameters.Add("@coalminesBit", SqlDbType.Bit).Value = coalminesBit
                cm.Parameters.Add("@oilgasBit", SqlDbType.Bit).Value = oilgasBit
                cm.Parameters.Add("@activityLocation", SqlDbType.NVarChar).Value = activitylocation.Text
                cm.Parameters.Add("@partners", SqlDbType.NVarChar).Value = partners.Text
                cm.Parameters.Add("@activityInfo", SqlDbType.NVarChar).Value = activityinfoText
                cm.Parameters.Add("@outcomes", SqlDbType.NVarChar).Value = outcomesText
                cm.Parameters.Add("@nextsteps", SqlDbType.NVarChar).Value = nextstepsText


                cm.ExecuteNonQuery()
            End Using
        End Using


        'Redirect to step 1 with ID value in codebehind form
        Dim collections As New NameValueCollection()
        collections.Add("ID", submissionID)
        Dim remoteUrl As String = "index.aspx"
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