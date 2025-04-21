Imports System.Data.SqlClient

Partial Class edit_activities
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            If Session("pnOrgID") IsNot Nothing Then
                ' Load dropdown with activities
                LoadActivities()
                ' Load organization name
                LoadOrgName()
            Else
                ' Redirect to login if the user is not logged in
                Response.Redirect("member-login.aspx")
            End If
        End If
    End Sub

    ' Load activities from pn_lu_activities table and populate the dropdown
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

            ' Update the user details
            lblUserDetails.Text = $"{Session("pnContactName")} | <a href='member-home.aspx'>Member Home</a>"
        End Using
    End Sub

    ' Handle Save Activity Experience click event
    Protected Sub btnSaveActivities_Click(sender As Object, e As EventArgs) Handles btnSaveActivities.Click
        If Not Page.IsValid Then Exit Sub

        Dim orgID As Integer = Convert.ToInt32(Session("pnOrgID"))
        Dim activity As String = ddlActivity.SelectedValue
        Dim yearsExperience As Integer

        If Not Integer.TryParse(txtYearsExperience.Text, yearsExperience) OrElse yearsExperience <= 0 Then
            lblErrorMessage.Text = "Please enter a valid positive number for years of experience."
            lblErrorMessage.Visible = True
            lblSuccessMessage.Visible = False
            Return
        End If

        Dim highlights As String = txtHighlights.Text

        ' Ensure all fields are filled
        If String.IsNullOrEmpty(activity) OrElse yearsExperience <= 0 Then
            lblErrorMessage.Text = "Years experience is a required field."
            lblErrorMessage.Visible = True
            lblSuccessMessage.Visible = False
            Return
        End If

        ' Insert into the database
        Using conn As New SqlConnection(Common.GetConnString())
            conn.Open()

            Dim query As String = "INSERT INTO pn_activities_orgs (pnOrgID, pnActivity, pnActivityYears, pnActivityHighlight) " &
                                  "VALUES (@OrgID, @Activity, @YearsExperience, @Highlights)"
            Using cmd As New SqlCommand(query, conn)
                cmd.Parameters.AddWithValue("@OrgID", orgID)
                cmd.Parameters.AddWithValue("@Activity", activity)
                cmd.Parameters.AddWithValue("@YearsExperience", yearsExperience)
                cmd.Parameters.AddWithValue("@Highlights", highlights)
                cmd.ExecuteNonQuery()
            End Using

            ' Update pn_updateLog
            Dim logQuery As String = "INSERT INTO pn_updateLog (pnContactID, pnOrgID, pnSection, pnUpdateLogTS, summary, owner) " &
                                     "VALUES (@pnContactID, @OrgID, 'Activities', @Timestamp, 'Activity experience updated', @Owner)"
            Using logCmd As New SqlCommand(logQuery, conn)
                logCmd.Parameters.AddWithValue("@pnContactID", Convert.ToInt32(Session("pnContactID")))
                logCmd.Parameters.AddWithValue("@OrgID", orgID)
                logCmd.Parameters.AddWithValue("@Timestamp", DateTime.Now)
                logCmd.Parameters.AddWithValue("@Owner", Convert.ToInt32(Session("pnContactID")))
                logCmd.ExecuteNonQuery()
            End Using

            ' Update pn_orgs LastUpdated
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
        lblSuccessMessage.Text = "Activity experience saved successfully! Redirecting to member-home in 5 seconds..."
        lblSuccessMessage.Visible = True
        lblErrorMessage.Visible = False
        Response.AddHeader("REFRESH", "2;URL=member-home.aspx?page=activity")
    End Sub
End Class

