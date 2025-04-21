Imports System.Data.SqlClient

Partial Class edit_activity
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            If Session("pnOrgID") IsNot Nothing Then
                Dim activityOrgID As Integer = Convert.ToInt32(Request.QueryString("id"))
                If activityOrgID > 0 Then
                    LoadActivities()
                    LoadActivityData(activityOrgID)
                End If
                LoadOrgName()
            Else
                ' Redirect to login if not logged in
                Response.Redirect("member-login.aspx")
            End If
        End If
    End Sub

    ' Load activities into dropdown
    Private Sub LoadActivities()
        Using conn As New SqlConnection(Common.GetConnString())
            conn.Open()

            Dim query As String = "SELECT pnActivity FROM pn_lu_activities ORDER BY pnActivityOrder"
            Using cmd As New SqlCommand(query, conn)
                Using reader As SqlDataReader = cmd.ExecuteReader()
                    ddlActivity.Items.Clear()
                    While reader.Read()
                        ddlActivity.Items.Add(reader("pnActivity").ToString())
                    End While
                End Using
            End Using
        End Using
    End Sub

    ' Load organization name
    Private Sub LoadOrgName()
        Using conn As New SqlConnection(Common.GetConnString())
            conn.Open()

            Dim orgID As Integer = Convert.ToInt32(Session("pnOrgID"))
            Dim query As String = "SELECT pnOrgName FROM pn_orgs WHERE pnOrgID = @OrgID"
            Using cmd As New SqlCommand(query, conn)
                cmd.Parameters.AddWithValue("@OrgID", orgID)
                lblOrgName.Text = Convert.ToString(cmd.ExecuteScalar()) & "'s Activity Experience"
            End Using

            lblUserDetails.Text = $"{Session("pnContactName")} | <a href='member-home.aspx'>Member Home</a>"
        End Using
    End Sub

    ' Load activity experience data for editing
    Private Sub LoadActivityData(activityOrgID As Integer)
        Using conn As New SqlConnection(Common.GetConnString())
            conn.Open()

            Dim query As String = "SELECT pnActivity, pnActivityYears, pnActivityHighlight FROM pn_activities_orgs WHERE pnActivityOrgID = @ActivityOrgID"
            Using cmd As New SqlCommand(query, conn)
                cmd.Parameters.AddWithValue("@ActivityOrgID", activityOrgID)

                Using reader As SqlDataReader = cmd.ExecuteReader()
                    If reader.Read() Then
                        ddlActivity.SelectedValue = reader("pnActivity").ToString()
                        txtYearsExperience.Text = reader("pnActivityYears").ToString()
                        txtHighlights.Text = reader("pnActivityHighlight").ToString()
                    End If
                End Using
            End Using
        End Using
    End Sub

    ' Handle Save Activity Experience click event
    Protected Sub btnSaveActivity_Click(sender As Object, e As EventArgs) Handles btnSaveActivity.Click
        Dim orgID As Integer = Convert.ToInt32(Session("pnOrgID"))
        Dim activityOrgID As Integer = Convert.ToInt32(Request.QueryString("id"))
        Dim activity As String = ddlActivity.SelectedValue
        Dim yearsExperience As Integer
        If Not Integer.TryParse(txtYearsExperience.Text, yearsExperience) OrElse yearsExperience <= 0 Then
            lblErrorMessage.Text = "Please enter a valid positive number for years of experience."
            lblErrorMessage.Visible = True
            lblSuccessMessage.Visible = False
            Return
        End If
        Dim highlights As String = txtHighlights.Text

        Using conn As New SqlConnection(Common.GetConnString())
            conn.Open()

            Dim query As String = "UPDATE pn_activities_orgs SET pnActivity = @Activity, pnActivityYears = @YearsExperience, pnActivityHighlight = @Highlights WHERE pnActivityOrgID = @ActivityOrgID"
            Using cmd As New SqlCommand(query, conn)
                cmd.Parameters.AddWithValue("@Activity", activity)
                cmd.Parameters.AddWithValue("@YearsExperience", yearsExperience)
                cmd.Parameters.AddWithValue("@Highlights", highlights)
                cmd.Parameters.AddWithValue("@ActivityOrgID", activityOrgID)
                cmd.ExecuteNonQuery()
            End Using

            ' Log the update in pn_updateLog
            Dim logQuery As String = "INSERT INTO pn_updateLog (pnContactID, pnOrgID, pnSection, pnUpdateLogTS, summary, owner) " &
                                     "VALUES (@pnContactID, @OrgID, 'Activities', @Timestamp, 'Activity experience updated', @Owner)"
            Using logCmd As New SqlCommand(logQuery, conn)
                logCmd.Parameters.AddWithValue("@pnContactID", Convert.ToInt32(Session("pnContactID")))
                logCmd.Parameters.AddWithValue("@OrgID", orgID)
                logCmd.Parameters.AddWithValue("@Timestamp", DateTime.Now)
                logCmd.Parameters.AddWithValue("@Owner", Convert.ToInt32(Session("pnContactID")))
                logCmd.ExecuteNonQuery()
            End Using

            ' Update LastUpdated timestamp for organization
            Dim updateOrgQuery As String = "UPDATE pn_orgs SET LastUpdated = @Timestamp WHERE pnOrgID = @OrgID"
            Using updateOrgCmd As New SqlCommand(updateOrgQuery, conn)
                updateOrgCmd.Parameters.AddWithValue("@Timestamp", DateTime.Now)
                updateOrgCmd.Parameters.AddWithValue("@OrgID", orgID)
                updateOrgCmd.ExecuteNonQuery()
            End Using
        End Using

        ' Clear the form fields after successful submission
        ddlActivity.SelectedIndex = -1
        txtYearsExperience.Text = String.Empty
        txtHighlights.Text = String.Empty

        ' Show success message and redirect after 5 seconds
        lblSuccessMessage.Text = "Activity experience updated successfully! Redirecting to member-home in 5 seconds..."
        lblSuccessMessage.Visible = True
        lblErrorMessage.Visible = False
        Response.AddHeader("REFRESH", "5;URL=member-home.aspx")
    End Sub

    ' Handle Delete Activity Experience click event
    Protected Sub btnDeleteActivity_Click(sender As Object, e As EventArgs) Handles btnDeleteActivity.Click
        Dim activityOrgID As Integer = Convert.ToInt32(Request.QueryString("id"))

        Using conn As New SqlConnection(Common.GetConnString())
            conn.Open()

            ' Delete the activity experience from the database
            Dim deleteQuery As String = "DELETE FROM pn_activities_orgs WHERE pnActivityOrgID = @ActivityOrgID"
            Using cmd As New SqlCommand(deleteQuery, conn)
                cmd.Parameters.AddWithValue("@ActivityOrgID", activityOrgID)
                cmd.ExecuteNonQuery()
            End Using

            ' Log the deletion in pn_updateLog
            Dim logQuery As String = "INSERT INTO pn_updateLog (pnContactID, pnOrgID, pnSection, pnUpdateLogTS, summary, owner) " &
                                     "VALUES (@pnContactID, @OrgID, 'Activities', @Timestamp, 'Activity experience deleted', @Owner)"
            Using logCmd As New SqlCommand(logQuery, conn)
                logCmd.Parameters.AddWithValue("@pnContactID", Convert.ToInt32(Session("pnContactID")))
                logCmd.Parameters.AddWithValue("@OrgID", Convert.ToInt32(Session("pnOrgID")))
                logCmd.Parameters.AddWithValue("@Timestamp", DateTime.Now)
                logCmd.Parameters.AddWithValue("@Owner", Convert.ToInt32(Session("pnContactID")))
                logCmd.ExecuteNonQuery()
            End Using

            ' Update LastUpdated timestamp for organization
            Dim updateOrgQuery As String = "UPDATE pn_orgs SET LastUpdated = @Timestamp WHERE pnOrgID = @OrgID"
            Using updateOrgCmd As New SqlCommand(updateOrgQuery, conn)
                updateOrgCmd.Parameters.AddWithValue("@Timestamp", DateTime.Now)
                updateOrgCmd.Parameters.AddWithValue("@OrgID", Convert.ToInt32(Session("pnOrgID")))
                updateOrgCmd.ExecuteNonQuery()
            End Using
        End Using

        ' Show success message and redirect after 5 seconds
        lblSuccessMessage.Text = "Activity experience deleted successfully! Redirecting to member-home in 5 seconds..."
        lblSuccessMessage.Visible = True
        lblErrorMessage.Visible = False
        Response.AddHeader("REFRESH", "5;URL=member-home.aspx?page=activity")
    End Sub
End Class
