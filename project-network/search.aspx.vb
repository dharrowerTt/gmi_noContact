Imports System.Data.SqlClient
Imports Newtonsoft.Json

Imports System.Text

Partial Class search
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            LoadOrganizations()
        End If
    End Sub
    Protected Sub LoadOrganizations()
        Using conn As New SqlConnection(Common.GetConnString())
            conn.Open()

            ' SQL query with | as separator and pnOrgID included
            Dim query As String = "
SELECT p.pnOrgID, p.sfOrgID, p.pnOrgName, p.pnOrgType, p.pnWebsite, 
       p.pnHeadquarters, p.pnOrgSummary, u.lastUpdateDate, 
       a.activities, c.countries, s.sectors, subs.subsectors
FROM pn_orgs p 
LEFT JOIN (
    SELECT MAX(pnUpdateLogTS) AS lastUpdateDate, pnOrgID 
    FROM pn_updatelog 
    GROUP BY pnOrgID
) AS u ON p.pnOrgID = u.pnOrgID
LEFT JOIN (
    SELECT STRING_AGG(pnActivity, '; ') AS activities, pnOrgID 
    FROM pn_activities_orgs 
    GROUP BY pnOrgID
) AS a ON p.pnOrgID = a.pnOrgID
LEFT JOIN (
    SELECT STRING_AGG(TRIM(country), '; ') AS countries, pnOrgID 
    FROM pn_countries_orgs 
    GROUP BY pnOrgID
) AS c ON p.pnOrgID = c.pnOrgID
LEFT JOIN (
    SELECT STRING_AGG(sub1.pnSector, '; ') AS sectors, sub1.pnOrgID 
    FROM (
        SELECT DISTINCT pn_sectors_orgs.pnOrgID, pn_lu_sectors.pnSector 
        FROM pn_sectors_orgs 
        INNER JOIN pn_lu_sectors 
        ON pn_sectors_orgs.pnSectorID = pn_lu_sectors.pnSectorID
    ) AS sub1
    GROUP BY sub1.pnOrgID
) AS s ON p.pnOrgID = s.pnOrgID
LEFT JOIN (
    SELECT STRING_AGG(sub2.pnSubsector, '; ') AS subsectors, sub2.pnOrgID 
    FROM (
        SELECT DISTINCT pn_sectors_orgs.pnOrgID, pn_lu_sectors.pnSubsector 
        FROM pn_sectors_orgs 
        INNER JOIN pn_lu_sectors 
        ON pn_sectors_orgs.pnSectorID = pn_lu_sectors.pnSectorID
    ) AS sub2
    GROUP BY sub2.pnOrgID
) AS subs ON p.pnOrgID = subs.pnOrgID
ORDER BY u.lastUpdateDate DESC, p.pnOrgName ASC
"



            ' Define sets to store unique filter values
            Dim uniqueTypes As New HashSet(Of String)()
            Dim uniqueActivities As New HashSet(Of String)()
            Dim uniqueCountries As New HashSet(Of String)()
            Dim uniqueSectors As New HashSet(Of String)()

            Using cmd As New SqlCommand(query, conn)
                Dim reader As SqlDataReader = cmd.ExecuteReader()

                ' Build HTML for the table with expandable rows for summary
                Dim organizationTable As New StringBuilder()
                organizationTable.Append("<table id='orgTable' class='display' style='width:100%'><thead>")
                organizationTable.Append("<tr>")
                organizationTable.Append("<th style='width: 30px;'></th>") ' Empty header cell for the expand icon column
                organizationTable.Append("<th>Organization Name</th>")
                organizationTable.Append("<th>Type</th>")
                organizationTable.Append("<th>Headquarters</th>")
                organizationTable.Append("<th style='display:none'>Activities</th>")
                organizationTable.Append("<th style='display:none'>Countries</th>")
                organizationTable.Append("<th style='display:none'>Sectors</th>")
                organizationTable.Append("<th style='display:none'>Summary</th>")
                organizationTable.Append("<th>Updated</th>")
                organizationTable.Append("<th>Details</th>")
                organizationTable.Append("</tr></thead><tbody>")


                While reader.Read()
                    uniqueTypes.Add(reader("pnOrgType").ToString())

                    ' Split on | and add unique items to each set
                    For Each activity As String In reader("activities").ToString().Split(";"c)
                        uniqueActivities.Add(activity.Trim())
                    Next
                    For Each country As String In reader("countries").ToString().Split(";"c)
                        uniqueCountries.Add(country.Trim())
                    Next
                    For Each sector As String In reader("sectors").ToString().Split(";"c)
                        uniqueSectors.Add(sector.Trim())
                    Next

                    ' Generate table rows
                    Dim orgId As String = reader("pnOrgID").ToString()
                    Dim updatedColumn As String = If(IsDBNull(reader("lastUpdateDate")),
                                     "",
                                     "<i class='bi bi-star-fill' style='color:gold;'></i>")
                    Dim detailsUrl As String = If(IsDBNull(reader("lastUpdateDate")),
                                  $"details.aspx?id={reader("sfOrgID")}",
                                  $"organization.aspx?id={reader("pnOrgID")}")

                    organizationTable.Append("<tr>")
                    organizationTable.Append("<td class='details-control'><i class='bi bi-chevron-down'></i></td>")
                    Dim websiteLink As String = If(IsDBNull(reader("pnWebsite")) OrElse String.IsNullOrWhiteSpace(reader("pnWebsite").ToString()), "", $" (<a href='{reader("pnWebsite")}' target='_blank'>Website</a>)")
                    organizationTable.Append($"<td>{reader("pnOrgName")}{websiteLink}</td>")
                    organizationTable.Append($"<td>{reader("pnOrgType")}</td>")
                    organizationTable.Append($"<td>{If(IsDBNull(reader("pnHeadquarters")), "N/A", reader("pnHeadquarters"))}</td>")
                    organizationTable.Append($"<td style='display:none'>{reader("activities")}</td>")
                    organizationTable.Append($"<td style='display:none'>{reader("countries")}</td>")
                    organizationTable.Append($"<td style='display:none'>{reader("sectors")}</td>")
                    organizationTable.Append($"<td style='display:none'>{If(IsDBNull(reader("pnOrgSummary")), "No summary available.", reader("pnOrgSummary"))}</td>")
                    organizationTable.Append($"<td>{updatedColumn}</td>")
                    organizationTable.Append($"<td><a href='{detailsUrl}' class='btn btn-primary'>View Details</a></td>")
                    organizationTable.Append("</tr>")
                End While


                organizationTable.Append("</tbody></table>")

                ' Add JavaScript arrays for unique filter values
                organizationTable.Append("<script>")
                organizationTable.Append("var types = " & JsonConvert.SerializeObject(uniqueTypes.ToList()) & ";")
                organizationTable.Append("var activities = " & JsonConvert.SerializeObject(uniqueActivities.ToList()) & ";")
                organizationTable.Append("var countries = " & JsonConvert.SerializeObject(uniqueCountries.ToList()) & ";")
                organizationTable.Append("var sectors = " & JsonConvert.SerializeObject(uniqueSectors.ToList()) & ";")
                organizationTable.Append("</script>")

                ' Set the generated HTML and JavaScript in the Literal control
                litOrganizationTable.Text = organizationTable.ToString()
            End Using
        End Using
    End Sub





End Class
