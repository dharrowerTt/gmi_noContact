Imports System.Data.SqlClient

Partial Class organization
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            Dim orgID As Integer
            If Integer.TryParse(Request.QueryString("id"), orgID) Then
                LoadOrganizationData(orgID)
                LoadContactData(orgID)
                LoadSectors(orgID)
                LoadActivities(orgID)
                LoadCountries(orgID)
            Else
                Response.Redirect("find-an-expert.aspx")
            End If
        End If
    End Sub

    Protected Sub LoadOrganizationData(orgID As Integer)
        Using conn As New SqlConnection(Common.GetConnString())
            conn.Open()
            Dim query As String = "SELECT pnOrgName, pnOrgType, pnWebsite, pnHeadquarters, pnOrgSummary, LastUpdated FROM pn_orgs WHERE pnOrgID = @OrgID"
            Using cmd As New SqlCommand(query, conn)
                cmd.Parameters.AddWithValue("@OrgID", orgID)
                Dim reader As SqlDataReader = cmd.ExecuteReader()

                If reader.Read() Then
                    lblOrgName.Text = reader("pnOrgName").ToString()
                    lblOrgNameBreadcrumb.Text = reader("pnOrgName").ToString()
                    lblHeadquarters.Text = If(IsDBNull(reader("pnHeadquarters")), "N/A", reader("pnHeadquarters").ToString())
                    If IsDBNull(reader("pnWebsite")) OrElse String.IsNullOrWhiteSpace(reader("pnWebsite").ToString()) Then
                        lnkWebsite.Visible = False
                    Else
                        lnkWebsite.Text = reader("pnWebsite").ToString()
                        lnkWebsite.NavigateUrl = reader("pnWebsite").ToString()
                        lnkWebsite.Visible = True
                    End If

                    lblLastUpdated.Text = If(IsDBNull(reader("LastUpdated")), "N/A", Convert.ToDateTime(reader("LastUpdated")).ToString("MMMM dd, yyyy"))
                    lblDescription.Text = If(IsDBNull(reader("pnOrgSummary")), "No description available.", reader("pnOrgSummary").ToString())
                Else
                    Response.Redirect("find-an-expert.aspx")
                End If
            End Using
        End Using
    End Sub

    Private Sub LoadSectors(ByVal orgID As Integer)
        Using conn As New SqlConnection(Common.GetConnString())
            conn.Open()
            Dim query As String = "SELECT gmiSector, pnSector, pnSubsector FROM pn_lu_sectors
                                   INNER JOIN pn_sectors_orgs ON pn_lu_sectors.pnSectorID = pn_sectors_orgs.pnSectorID
                                   WHERE pnOrgID = @OrgID ORDER BY gmiSector, pnSector, pnSubsectorOrder"
            Using cmd As New SqlCommand(query, conn)
                cmd.Parameters.AddWithValue("@OrgID", orgID)
                Dim reader As SqlDataReader = cmd.ExecuteReader()

                If reader.HasRows Then
                    Dim sectorsList As New StringBuilder()
                    sectorsList.Append("<p>This Project Network member has experience supporting the sectors and subsectors listed below.</p>")
                    Dim currentGmiSector As String = String.Empty
                    Dim currentPnSector As String = String.Empty

                    While reader.Read()
                        Dim gmiSector As String = reader("gmiSector").ToString()
                        Dim pnSector As String = reader("pnSector").ToString()
                        Dim pnSubsector As String = reader("pnSubsector").ToString()

                        If gmiSector <> currentGmiSector Then
                            If Not String.IsNullOrEmpty(currentGmiSector) Then
                                sectorsList.Append("</ul>")
                            End If
                            sectorsList.Append($"<h4>{gmiSector}</h4><ul>")
                            currentGmiSector = gmiSector
                        End If

                        If pnSector <> currentPnSector Then
                            sectorsList.Append($"<li><b>{pnSector}</b></li>")
                            currentPnSector = pnSector
                        End If

                        sectorsList.Append($"<li style='list-style-type: none;'>- {pnSubsector}</li>")
                    End While

                    sectorsList.Append("</ul>")
                    litSectors.Text = sectorsList.ToString()
                Else
                    pnlSectors.Visible = False
                    sectorLink.Visible = False
                End If
            End Using
        End Using
    End Sub

    Private Sub LoadActivities(ByVal orgID As Integer)
        Using conn As New SqlConnection(Common.GetConnString())
            conn.Open()
            Dim query As String = "SELECT pnActivity, pnActivityYears, pnActivityHighlight FROM pn_activities_orgs WHERE pnOrgID = @OrgID ORDER BY pnActivity"
            Using cmd As New SqlCommand(query, conn)
                cmd.Parameters.AddWithValue("@OrgID", orgID)
                Dim reader As SqlDataReader = cmd.ExecuteReader()

                If reader.HasRows Then
                    Dim activitiesTable As New StringBuilder()
                    activitiesTable.Append("<p>The following table provides the years of relevant experience and highlights of support for various types of methane mitigation activities. The member’s information reflects a set of activity types that were pre-determined by GMI to provide relevant information to GMI stakeholders.</p>")
                    activitiesTable.Append("<table class='table-content'><thead><tr><th>Activity</th><th>Years</th><th>Highlights</th></tr></thead><tbody>")

                    While reader.Read()
                        activitiesTable.Append("<tr>")
                        activitiesTable.Append($"<td>{reader("pnActivity")}</td>")
                        activitiesTable.Append($"<td>{reader("pnActivityYears")}</td>")
                        activitiesTable.Append($"<td>{reader("pnActivityHighlight")}</td>")
                        activitiesTable.Append("</tr>")
                    End While

                    activitiesTable.Append("</tbody></table>")
                    litActivities.Text = activitiesTable.ToString()
                Else
                    pnlActivities.Visible = False
                    activityLink.Visible = False
                End If
            End Using
        End Using
    End Sub

    Private Sub LoadCountries(ByVal orgID As Integer)
        Using conn As New SqlConnection(Common.GetConnString())
            conn.Open()
            Dim query As String = "SELECT FullCountryName, pnCountryYears, pnCountryHighlight FROM pn_countries_orgs
                                   INNER JOIN _countryLookup ON pn_countries_orgs.country = _countryLookup.FullCountryName
                                   WHERE pnOrgID = @OrgID ORDER BY FullCountryName"
            Using cmd As New SqlCommand(query, conn)
                cmd.Parameters.AddWithValue("@OrgID", orgID)
                Dim reader As SqlDataReader = cmd.ExecuteReader()

                If reader.HasRows Then
                    Dim countriesTable As New StringBuilder()
                    countriesTable.Append("<p>The following table provides the years of relevant experience and highlights of methane mitigation support provided in specific countries.</p>")
                    countriesTable.Append("<table class='table-content'><thead><tr><th>Country</th><th>Years</th><th>Highlights</th></tr></thead><tbody>")

                    While reader.Read()
                        countriesTable.Append("<tr>")
                        countriesTable.Append($"<td>{reader("FullCountryName")}</td>")
                        countriesTable.Append($"<td>{reader("pnCountryYears")}</td>")
                        countriesTable.Append($"<td>{reader("pnCountryHighlight")}</td>")
                        countriesTable.Append("</tr>")
                    End While

                    countriesTable.Append("</tbody></table>")
                    litCountries.Text = countriesTable.ToString()
                Else
                    pnlCountries.Visible = False
                    countryLink.Visible = False
                End If
            End Using
        End Using
    End Sub

    Protected Sub LoadContactData(orgID As Integer)
        Using conn As New SqlConnection(Common.GetConnString())
            conn.Open()
            Dim query As String = "SELECT pnContactEmail, " &
                                  "ISNULL(pnContactSalutation + ' ', '') + ISNULL(pnContactFirstName + ' ', '') + ISNULL(pnContactLastName + ' ', '') + ISNULL(pnContactSuffix, '') AS FullName, " &
                                  "pnContactTitle " &
                                  "FROM pn_contacts " &
                                  "WHERE pnOrgID = @OrgID AND LEN(pnContactPasswordHash) > 1 ORDER BY FullName"
            Using cmd As New SqlCommand(query, conn)
                cmd.Parameters.AddWithValue("@OrgID", orgID)
                Dim reader As SqlDataReader = cmd.ExecuteReader()

                Dim contactCount As Integer = 0
                Dim contactList As New StringBuilder()
                Dim contactTable As New StringBuilder()

                While reader.Read()
                    contactCount += 1
                    Dim name As String = reader("FullName").ToString()
                    Dim title As String = reader("pnContactTitle").ToString()
                    Dim email As String = reader("pnContactEmail").ToString()

                    If Len(title) > 3 Then
                        title = " - " & title
                    Else
                        title = ""
                    End If

                    If contactCount < 6 Then
                        If email.Length > 3 Then
                            contactList.Append($"<div><a href='mailto:{email}'>{name}</a> {title}</div>")
                        Else
                            contactList.Append($"<div>{name} {title}</div>")
                        End If
                    Else
                        contactTable.Append("<tr>")
                        If email.Length > 3 Then
                            contactTable.Append($"<td><a href='mailto:{email}'>{name}</a></td>")
                        Else
                            contactTable.Append($"<td>{name}</td>")
                        End If
                        contactTable.Append($"<td>{title}</td>")
                        contactTable.Append("</tr>")
                    End If
                End While

                If contactCount < 6 Then
                    contactListContainer.Controls.Add(New LiteralControl(contactList.ToString()))
                    contactListContainer.Visible = True
                    pnlContactsTable.Visible = False
                Else
                    litContactsTable.Text = contactTable.ToString()
                    pnlContactsTable.Visible = True
                    contactListContainer.Visible = False
                End If

                If contactCount = 0 Then
                    pnlContacts.Visible = False
                    contactLink.Visible = False
                Else
                    lblNoContacts.Visible = False
                End If
            End Using
        End Using
    End Sub
End Class
