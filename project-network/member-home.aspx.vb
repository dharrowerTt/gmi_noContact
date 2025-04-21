Imports System.Data.SqlClient
Imports System.Text

Partial Class member_home
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs) Handles Me.Load
        ' Check if the user is logged in
        If Session("pnContactID") Is Nothing Then
            ' Redirect to login page if not logged in
            Response.Redirect("member-login.aspx")
        Else
            ' Get logged-in user details from session
            Dim userName As String = Session("pnContactName").ToString()
            Dim sfOrgID As String = Session("sfOrgID").ToString()

            ' Get organization name based on sfOrgID
            Dim orgName As String = GetOrganizationName(sfOrgID)

            ' Display user and organization in the header
            lblUserDetails.Text = "<a href='edit-user.aspx'><i class='fa fas fa-edit'></i>" & userName & "</a> | <a href='edit-org.aspx'><i class='fa fas fa-edit'></i>" & orgName & "</a>"

            ' Display user name in profile header
            'lblUserName.Text = userName

            'Display Org Name
            lblOrgName.Text = orgName

            ' Load general organization data
            LoadOrganizationData(sfOrgID)

            ' Load contacts data for the organization
            LoadContactsData(sfOrgID)

            ' Call method to load sector hierarchy
            LoadSectorsForOrganization()

            ' Load update log for organization
            LoadUpdateLog()

            ' Load country experience data for the logged-in user's organization
            LoadCountryData()

            ' Load country experience data for the logged-in user's organization
            LoadActivityData()
        End If
    End Sub

    ' Function to get organization name
    Private Function GetOrganizationName(sfOrgID As String) As String
        Using conn As New SqlConnection(Common.GetConnString())
            conn.Open()
            Dim query As String = "SELECT pnOrgName FROM pn_orgs WHERE sfOrgID = @sfOrgID"
            Using cmd As New SqlCommand(query, conn)
                cmd.Parameters.AddWithValue("@sfOrgID", sfOrgID)
                Return cmd.ExecuteScalar().ToString()
            End Using
        End Using
    End Function

    ' Function to load general organization data
    Private Sub LoadOrganizationData(sfOrgID As String)
        Using conn As New SqlConnection(Common.GetConnString())
            conn.Open()
            Dim query As String = "SELECT pnOrgType, pnWebsite, pnHeadquarters, pnOrgSummary FROM pn_orgs WHERE sfOrgID = @sfOrgID"
            Using cmd As New SqlCommand(query, conn)
                cmd.Parameters.AddWithValue("@sfOrgID", sfOrgID)
                Dim reader As SqlDataReader = cmd.ExecuteReader()

                If reader.HasRows Then
                    reader.Read()
                    lblType.Text = reader("pnOrgType").ToString()
                    lblWebsite.Text = reader("pnWebsite").ToString()
                    lblHeadquarters.Text = reader("pnHeadquarters").ToString()
                    lblDescription.Text = reader("pnOrgSummary").ToString()
                End If
            End Using
        End Using
    End Sub

    ' Function to load contacts for the user's organization
    Private Sub LoadContactsData(sfOrgID As String)
        Using conn As New SqlConnection(Common.GetConnString())
            conn.Open()
            Dim query As String = "SELECT pnContactSalutation, pnContactFirstName, pnContactLastName, pnContactSuffix, pnContactTitle, pnContactEmail, pnContactPhone, pnContactUpdated FROM pn_contacts WHERE sfOrgID = @sfOrgID AND LEN(pnContactPasswordHash) > 1"

            Using cmd As New SqlCommand(query, conn)
                cmd.Parameters.AddWithValue("@sfOrgID", sfOrgID)

                Dim reader As SqlDataReader = cmd.ExecuteReader()
                Dim contactsTableRows As New StringBuilder()

                While reader.Read()
                    ' Combine the salutation, first name, last name, and suffix to form the full name
                    Dim fullName As String = reader("pnContactSalutation").ToString() & " " & reader("pnContactFirstName").ToString() & " " & reader("pnContactLastName").ToString() & " " & reader("pnContactSuffix").ToString()

                    ' Wrap the email in a mailto link
                    Dim emailLink As String = "<a href='mailto:" & reader("pnContactEmail").ToString() & "'>" & reader("pnContactEmail").ToString() & "</a>"

                    ' Append each row of contact data in the table
                    contactsTableRows.Append("<tr>")
                    contactsTableRows.Append("<td>" & fullName.Trim() & "</td>")
                    contactsTableRows.Append("<td>" & reader("pnContactTitle").ToString() & "</td>")
                    contactsTableRows.Append("<td>" & emailLink & "</td>")
                    contactsTableRows.Append("<td>" & reader("pnContactPhone").ToString() & "</td>")
                    contactsTableRows.Append("<td>" & Convert.ToDateTime(reader("pnContactUpdated")).ToString("MM/dd/yyyy") & "</td>")
                    contactsTableRows.Append("</tr>")
                End While

                ' Inject the built HTML into the contacts table using JavaScript
                Page.ClientScript.RegisterStartupScript(Me.GetType(), "contactsTableScript", "$('#contactsTable tbody').html('" & contactsTableRows.ToString().Replace("'", "\'") & "');", True)
            End Using
        End Using
    End Sub

    Private Sub LoadSectorsForOrganization()
        Dim orgID As Integer = Convert.ToInt32(Session("pnOrgID"))
        Dim sectorList As New StringBuilder()

        Using conn As New SqlConnection(Common.GetConnString())
            conn.Open()

            ' Query to get the sectors for the organization
            Dim query As String = "SELECT s.gmiSector, s.pnSector, s.pnSubsector, s.pnSubsectorOrder " &
                                  "FROM pn_sectors_orgs o " &
                                  "INNER JOIN pn_lu_sectors s ON o.pnSectorID = s.pnSectorID " &
                                  "WHERE o.pnOrgID = @OrgID " &
                                  "ORDER BY s.gmiSector, s.pnSector, s.pnSubsectorOrder"

            Using cmd As New SqlCommand(query, conn)
                cmd.Parameters.AddWithValue("@OrgID", orgID)

                ' Read the results and build the hierarchical list
                Using reader As SqlDataReader = cmd.ExecuteReader()
                    Dim currentGmiSector As String = String.Empty
                    Dim currentPnSector As String = String.Empty

                    sectorList.Append("<ul>") ' Start the outermost list

                    While reader.Read()
                        Dim gmiSector As String = reader("gmiSector").ToString()
                        Dim pnSector As String = reader("pnSector").ToString()
                        Dim pnSubsector As String = reader("pnSubsector").ToString()

                        ' Check if we need to start a new gmiSector group
                        If gmiSector <> currentGmiSector Then
                            ' Close the previous gmiSector group (if it exists)
                            If currentGmiSector <> String.Empty Then
                                If currentPnSector <> String.Empty Then
                                    sectorList.Append("</ul></li>") ' Close the current pnSector group
                                    currentPnSector = String.Empty ' Reset pnSector
                                End If
                                sectorList.Append("</ul></li>") ' Close the current gmiSector group
                            End If

                            ' Start a new gmiSector group
                            sectorList.Append($"<li><strong>{gmiSector}</strong><ul>")
                            currentGmiSector = gmiSector
                        End If

                        ' Check if we need to start a new pnSector group
                        If pnSector <> currentPnSector Then
                            ' Close the previous pnSector group (if it exists)
                            If currentPnSector <> String.Empty Then
                                sectorList.Append("</ul></li>") ' Close the current pnSector group
                            End If

                            ' Start a new pnSector group
                            sectorList.Append($"<li>{pnSector}<ul>")
                            currentPnSector = pnSector
                        End If

                        ' Add the pnSubsector as a list item
                        sectorList.Append($"<li>{pnSubsector}</li>")
                    End While

                    ' Close any remaining open tags
                    If currentPnSector <> String.Empty Then
                        sectorList.Append("</ul></li>") ' Close the last pnSector group
                    End If
                    If currentGmiSector <> String.Empty Then
                        sectorList.Append("</ul></li>") ' Close the last gmiSector group
                    End If

                    sectorList.Append("</ul>") ' Close the outermost list
                End Using
            End Using
        End Using

        ' Render the sector list into the literal or placeholder on the page
        litSectors.Text = sectorList.ToString()
    End Sub

    ' Method to load update log entries
    Private Sub LoadUpdateLog()
        Dim orgID As Integer = Convert.ToInt32(Session("pnOrgID"))
        Dim userID As Integer = Convert.ToInt32(Session("pnContactID"))
        Dim logList As New StringBuilder()

        Using conn As New SqlConnection(Common.GetConnString())
            conn.Open()

            ' Query to get the update log for the organization, ordered by the most recent
            Dim query As String = "SELECT pnUpdateLogTS, summary, owner FROM pn_updateLog " &
                                  "WHERE pnOrgID = @OrgID ORDER BY pnUpdateLogTS DESC"

            Using cmd As New SqlCommand(query, conn)
                cmd.Parameters.AddWithValue("@OrgID", orgID)

                ' Read the results and build the log entries
                Using reader As SqlDataReader = cmd.ExecuteReader()
                    If reader.HasRows Then
                        While reader.Read()
                            Dim logTimestamp As DateTime = Convert.ToDateTime(reader("pnUpdateLogTS"))
                            Dim summary As String = reader("summary").ToString()
                            Dim owner As Integer = Convert.ToInt32(reader("owner"))

                            ' Format the timestamp as a friendly date/time format
                            Dim formattedTimestamp As String = logTimestamp.ToString("MMMM dd, yyyy h:mm tt")

                            ' Start building the log entry
                            logList.Append("<div class='log-entry'>")
                            logList.Append($"<p><strong>{formattedTimestamp}</strong></p>")
                            logList.Append($"<p>{summary}</p>")

                            ' If the logged-in user made the change, add a pill with a star
                            If owner = userID Then
                                logList.Append("<span class='pill'><i class='fas fa-star'></i> You made this change</span>")
                            End If

                            logList.Append("</div><hr>") ' Add a horizontal line between log entries
                        End While
                    Else
                        logList.Append("<p>No updates found for your organization.</p>")
                    End If
                End Using
            End Using
        End Using

        ' Render the log list into the literal or placeholder on the page
        litUpdateLog.Text = logList.ToString()
    End Sub

    ' Method to load the country experience data
    Private Sub LoadCountryData()
        Dim orgID As Integer = Convert.ToInt32(Session("pnOrgID"))
        Dim countryList As New StringBuilder()

        Using conn As New SqlConnection(Common.GetConnString())
            conn.Open()

            ' Query to get the country data
            Dim query As String = "SELECT pnCountryOrgID, country, pnCountryYears, pnCountryHighlight FROM pn_countries_orgs WHERE pnOrgID = @OrgID"
            Using cmd As New SqlCommand(query, conn)
                cmd.Parameters.AddWithValue("@OrgID", orgID)

                ' Build the country experience table
                countryList.Append("<table class='country-table'>")
                countryList.Append("<thead><tr><th>Country</th><th>Years Experience</th><th>Highlights</th><th>Actions</th></tr></thead>")
                countryList.Append("<tbody>")

                Using reader As SqlDataReader = cmd.ExecuteReader()
                    If reader.HasRows Then
                        While reader.Read()
                            Dim country As String = reader("country").ToString()
                            Dim yearsExperience As Integer = Convert.ToInt32(reader("pnCountryYears"))
                            Dim highlights As String = reader("pnCountryHighlight").ToString()
                            Dim pnCountryOrgID As String = reader("pnCountryOrgID").ToString()

                            ' Add row to the table
                            countryList.Append("<tr>")
                            countryList.Append($"<td>{country}</td>")
                            countryList.Append($"<td>{yearsExperience}</td>")
                            countryList.Append($"<td>{highlights}</td>")
                            countryList.Append($"<td><a href='edit-country.aspx?id={pnCountryOrgID}' class='edit-link'>Edit</a></td>")
                            countryList.Append("</tr>")
                        End While
                    Else
                        countryList.Append("<tr><td colspan='4'>No country experience data found.</td></tr>")
                    End If
                End Using

                countryList.Append("</tbody>")
                countryList.Append("</table>")
            End Using
        End Using

        ' Render the country data list into the literal on the page
        litCountriesList.Text = countryList.ToString()
    End Sub

    ' Method to load the activity experience data
    Private Sub LoadActivityData()
        Dim orgID As Integer = Convert.ToInt32(Session("pnOrgID"))
        Dim activityList As New StringBuilder()

        Using conn As New SqlConnection(Common.GetConnString())
            conn.Open()

            ' Query to get the activity data
            Dim query As String = "SELECT  pnActivityOrgID, pnOrgID, pnActivity, pnActivityYears, pnActivityHighlight FROM dbo.pn_activities_orgs WHERE pnOrgID = @OrgID"
            Using cmd As New SqlCommand(query, conn)
                cmd.Parameters.AddWithValue("@OrgID", orgID)

                ' Build the activity experience table
                activityList.Append("<table class='activity-table'>")
                activityList.Append("<thead><tr><th>Activity</th><th>Years Experience</th><th>Highlights</th><th>Actions</th></tr></thead>")
                activityList.Append("<tbody>")

                Using reader As SqlDataReader = cmd.ExecuteReader()
                    If reader.HasRows Then
                        While reader.Read()
                            Dim activity As String = reader("pnActivity").ToString()
                            Dim yearsExperience As Integer = Convert.ToInt32(reader("pnActivityYears"))
                            Dim highlights As String = reader("pnActivityHighlight").ToString()
                            Dim pnActivityOrgID As String = reader("pnActivityOrgID").ToString()

                            ' Add row to the table
                            activityList.Append("<tr>")
                            activityList.Append($"<td>{activity}</td>")
                            activityList.Append($"<td>{yearsExperience}</td>")
                            activityList.Append($"<td>{highlights}</td>")
                            activityList.Append($"<td><a href='edit-activity.aspx?id={pnActivityOrgID}' class='edit-link'>Edit</a></td>")
                            activityList.Append("</tr>")
                        End While
                    Else
                        activityList.Append("<tr><td colspan='4'>No activity experience data found.</td></tr>")
                    End If
                End Using

                activityList.Append("</tbody>")
                activityList.Append("</table>")
            End Using
        End Using

        ' Render the activity data list into the literal on the page
        litActivitiesList.Text = activityList.ToString()
    End Sub

End Class
