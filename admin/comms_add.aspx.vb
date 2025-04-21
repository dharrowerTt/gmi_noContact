Imports System.Data
Imports System.Configuration
Imports System.Data.SqlClient
Public Class comms_add
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        Dim query As String = "SELECT        commID, subjectLine, msgURL, areaOfInterest, language,  convert(varchar, dateSent, 111)  as dateofSend FROM dbo.gmiComms ORDER BY dateSent DESC"

            Using con As New SqlConnection(Common.GetConnString())
                Using cmd As New SqlCommand(query)
                    Using sda As New SqlDataAdapter()
                        cmd.Connection = con
                        sda.SelectCommand = cmd
                        Using ds As New DataSet()
                            sda.Fill(ds)
                            gvComms.DataSource = ds.Tables(0)

                            gvComms.DataBind()
                            gvComms.HeaderRow.TableSection = TableRowSection.TableHeader
                        End Using
                    End Using
                End Using
            End Using

    End Sub

    Protected Sub Add_Click(sender As Object, e As EventArgs) Handles Add.Click
        Dim AOI As String = ""


        If areaOfInterest.SelectedItem.Value = "biogas" Then
            AOI = "Biogas"
        ElseIf areaOfInterest.SelectedItem.Value = "coal" Then
            AOI = "Coal"
        ElseIf areaOfInterest.SelectedItem.Value = "oilgas" Then
            AOI = "Oil & Gas"
        ElseIf areaOfInterest.SelectedItem.Value = "general" Then
            AOI = "General"
        ElseIf areaOfInterest.SelectedItem.Value = "projectnetwork" Then
            AOI = "Project Network"
        End If

        Dim sqlText = "INSERT INTO gmiComms (subjectLine,msgURL,areaOfInterest,language,dateSent,snapshotContacts,snapshotSubs,openRate,clickRate,bounceRate,unsubRate) VALUES (@subjectLine, @msgURL, @areaOfInterest, @language, @dateSent, @contacts, @subscribers, @openrate, @clickrate, @bouncerate, @unsubrate);"
        Using cnConnect = New SqlConnection(Common.GetConnString())
            Using cm = New SqlCommand(sqlText, cnConnect)
                cnConnect.Open()
                cm.Parameters.Add("@subjectLine", SqlDbType.NVarChar).Value = subjectLine.Text
                cm.Parameters.Add("@msgURL", SqlDbType.NVarChar).Value = msgURL.Text
                cm.Parameters.Add("@areaOfInterest", SqlDbType.NVarChar).Value = AOI
                cm.Parameters.Add("@language", SqlDbType.NVarChar).Value = language.SelectedItem.Value
                cm.Parameters.Add("@dateSent", SqlDbType.Date).Value = dateSent.Text
                cm.Parameters.Add("@contacts", SqlDbType.NVarChar).Value = contacts.Text
                cm.Parameters.Add("@subscribers", SqlDbType.NVarChar).Value = subscribers.Text
                cm.Parameters.Add("@openrate", SqlDbType.NVarChar).Value = openRate.Text
                cm.Parameters.Add("@clickrate", SqlDbType.NVarChar).Value = clickRate.Text
                cm.Parameters.Add("@bouncerate", SqlDbType.NVarChar).Value = bounceRate.Text
                cm.Parameters.Add("@unsubrate", SqlDbType.NVarChar).Value = unsubRate.Text




                Dim currentID As Integer = cm.ExecuteScalar()
                'Set the ID value to RowNumber for redirection

            End Using
        End Using


        Dim script As String = "window.onload = function() { confirmSubmission(); };"
        ClientScript.RegisterStartupScript(Me.GetType(), "confirmSubmission", script, True)

    End Sub


End Class