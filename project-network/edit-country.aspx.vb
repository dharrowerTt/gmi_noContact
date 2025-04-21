Imports System.Data.SqlClient

Partial Class edit_country
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            If Session("pnOrgID") IsNot Nothing Then
                Dim countryOrgID As Integer = Convert.ToInt32(Request.QueryString("id"))
                If countryOrgID > 0 Then
                    LoadCountries()
                    LoadCountryData(countryOrgID)
                End If
                LoadOrgName()
            Else
                ' Redirect to login if not logged in
                Response.Redirect("member-login.aspx")
            End If
        End If
    End Sub

    ' Load countries into dropdown
    Private Sub LoadCountries()
        Using conn As New SqlConnection(Common.GetConnString())
            conn.Open()

            Dim query As String = "SELECT FullCountryName FROM _countryLookup ORDER BY FullCountryName"
            Using cmd As New SqlCommand(query, conn)
                Using reader As SqlDataReader = cmd.ExecuteReader()
                    ddlCountry.Items.Clear()
                    While reader.Read()
                        ddlCountry.Items.Add(reader("FullCountryName").ToString())
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
                lblOrgName.Text = Convert.ToString(cmd.ExecuteScalar()) & "'s Country Experience"
            End Using

            lblUserDetails.Text = "<a href='member-home.aspx'><i class='fa fa-home'></i> Member Home</a>"
        End Using
    End Sub

    ' Load country experience data for editing
    Private Sub LoadCountryData(countryOrgID As Integer)
        Using conn As New SqlConnection(Common.GetConnString())
            conn.Open()

            Dim query As String = "SELECT country, pnCountryYears, pnCountryHighlight FROM pn_countries_orgs WHERE pnCountryOrgID = @CountryOrgID"
            Using cmd As New SqlCommand(query, conn)
                cmd.Parameters.AddWithValue("@CountryOrgID", countryOrgID)

                Using reader As SqlDataReader = cmd.ExecuteReader()
                    If reader.Read() Then
                        ddlCountry.SelectedValue = reader("country").ToString()
                        txtYearsExperience.Text = reader("pnCountryYears").ToString()
                        txtHighlights.Text = reader("pnCountryHighlight").ToString()
                    End If
                End Using
            End Using
        End Using
    End Sub

    ' Handle Save Country Experience click event
    Protected Sub btnSaveCountry_Click(sender As Object, e As EventArgs) Handles btnSaveCountry.Click
        Dim orgID As Integer = Convert.ToInt32(Session("pnOrgID"))
        Dim countryOrgID As Integer = Convert.ToInt32(Request.QueryString("id"))
        Dim country As String = ddlCountry.SelectedValue
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

            Dim query As String = "UPDATE pn_countries_orgs SET country = @Country, pnCountryYears = @YearsExperience, pnCountryHighlight = @Highlights WHERE pnCountryOrgID = @CountryOrgID"
            Using cmd As New SqlCommand(query, conn)
                cmd.Parameters.AddWithValue("@Country", country)
                cmd.Parameters.AddWithValue("@YearsExperience", yearsExperience)
                cmd.Parameters.AddWithValue("@Highlights", highlights)
                cmd.Parameters.AddWithValue("@CountryOrgID", countryOrgID)
                cmd.ExecuteNonQuery()
            End Using

            ' Log the update in pn_updateLog
            Dim logQuery As String = "INSERT INTO pn_updateLog (pnContactID, pnOrgID, pnSection, pnUpdateLogTS, summary, owner) " &
                                                                          "VALUES (@pnContactID, @OrgID, 'Countries', @Timestamp, 'Country experience updated', @Owner)"
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
        ddlCountry.SelectedIndex = -1
        txtYearsExperience.Text = String.Empty
        txtHighlights.Text = String.Empty

        ' Show success message and redirect after 5 seconds
        lblSuccessMessage.Text = "Country experience updated successfully! Redirecting to member-home in 5 seconds..."
        lblSuccessMessage.Visible = True
        lblErrorMessage.Visible = False
        Response.AddHeader("REFRESH", "5;URL=member-home.aspx")
    End Sub

    ' Handle Delete Country Experience click event
    Protected Sub btnDeleteCountry_Click(sender As Object, e As EventArgs) Handles btnDeleteCountry.Click
        Dim countryOrgID As Integer = Convert.ToInt32(Request.QueryString("id"))

        Using conn As New SqlConnection(Common.GetConnString())
            conn.Open()

            ' Delete the country experience from the database
            Dim deleteQuery As String = "DELETE FROM pn_countries_orgs WHERE pnCountryOrgID = @CountryOrgID"
            Using cmd As New SqlCommand(deleteQuery, conn)
                cmd.Parameters.AddWithValue("@CountryOrgID", countryOrgID)
                cmd.ExecuteNonQuery()
            End Using

            ' Log the deletion in pn_updateLog
            Dim logQuery As String = "INSERT INTO pn_updateLog (pnContactID, pnOrgID, pnSection, pnUpdateLogTS, summary, owner) " &
                                     "VALUES (@pnContactID, @OrgID, 'Countries', @Timestamp, 'Country experience deleted', @Owner)"
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
        lblSuccessMessage.Text = "Country experience deleted successfully! Redirecting to member-home in 5 seconds..."
        lblSuccessMessage.Visible = True
        lblErrorMessage.Visible = False
        Response.AddHeader("REFRESH", "5;URL=member-home.aspx?page=country")
    End Sub
End Class

