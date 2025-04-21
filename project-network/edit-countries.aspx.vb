Imports System.Data.SqlClient

Partial Class edit_countries
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            If Session("pnOrgID") IsNot Nothing Then
                ' Load dropdown with countries
                LoadCountries()
                ' Load organization name
                LoadOrgName()
            Else
                ' Redirect to login if the user is not logged in
                Response.Redirect("member-login.aspx")
            End If
        End If
    End Sub

    ' Load countries from _countryLookup table and populate the dropdown
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

            ' Update the user details
            lblUserDetails.Text = "<a href='member-home.aspx'><i class='fa fa-home'></i> Member Home</a>"
        End Using
    End Sub

    ' Handle Save Country Experience click event
    Protected Sub btnSaveCountries_Click(sender As Object, e As EventArgs) Handles btnSaveCountries.Click
        If Not Page.IsValid Then Exit Sub

        Dim orgID As Integer = Convert.ToInt32(Session("pnOrgID"))
        Dim country As String = ddlCountry.SelectedValue
        Dim yearsExperience As Integer

        If Not Integer.TryParse(txtYearsExperience.Text, yearsExperience) OrElse yearsExperience <= 0 Then
            lblErrorMessage.Text = "Please enter a valid positive number for years of experience."
            lblErrorMessage.Visible = True
            lblSuccessMessage.Visible = False
            Return
        End If

        Dim highlights As String = txtHighlights.Text

        ' Ensure all fields are filled
        If String.IsNullOrEmpty(country) OrElse yearsExperience <= 0 Then
            lblErrorMessage.Text = "Years experience is a required field."
            lblErrorMessage.Visible = True
            lblSuccessMessage.Visible = False
            Return
        End If

        ' Insert into the database
        Using conn As New SqlConnection(Common.GetConnString())
            conn.Open()

            Dim query As String = "INSERT INTO pn_countries_orgs (pnOrgID, country, pnCountryYears, pnCountryHighlight) " &
                                  "VALUES (@OrgID, @Country, @YearsExperience, @Highlights)"
            Using cmd As New SqlCommand(query, conn)
                cmd.Parameters.AddWithValue("@OrgID", orgID)
                cmd.Parameters.AddWithValue("@Country", country)
                cmd.Parameters.AddWithValue("@YearsExperience", yearsExperience)
                cmd.Parameters.AddWithValue("@Highlights", highlights)
                cmd.ExecuteNonQuery()
            End Using

            ' Update pn_updateLog
            Dim logQuery As String = "INSERT INTO pn_updateLog (pnContactID, pnOrgID, pnSection, pnUpdateLogTS, summary, owner) " &
                                     "VALUES (@pnContactID, @OrgID, 'Countries', @Timestamp, 'Country experience updated', @Owner)"
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
        ddlCountry.SelectedIndex = -1
        txtYearsExperience.Text = String.Empty
        txtHighlights.Text = String.Empty

        ' Show success message
        lblSuccessMessage.Text = "Country experience saved successfully!"
        lblSuccessMessage.Visible = True
        lblErrorMessage.Visible = False
        Response.AddHeader("REFRESH", "2;URL=member-home.aspx?page=country")
    End Sub
End Class
