Imports System.Data.SqlClient
Imports System.Linq
Imports System.Web.Script.Serialization

Public Class dashboard
    Inherits System.Web.UI.Page

    ' Variables to hold data for display on the page
    Protected totalContacts As Integer = 0
    Protected registeredContacts As Integer = 0
    Protected totalOrganizations As Integer = 0
    Protected registeredOrganizations As Integer = 0
    Protected orgList As New Dictionary(Of String, String)() ' Dictionary to hold organization names and their IDs

    ' Lists to hold data for the bar chart
    Protected activityNames As New List(Of String)()
    Protected activityOrgCounts As New List(Of Integer)()
    Protected activityTotalYears As New List(Of Integer)()

    ' Dictionary to hold sector names and organization counts
    Protected sectorList As New List(Of Dictionary(Of String, String))() ' List of sectors grouped by gmiSector

    ' List to hold country data with ISO codes for the map
    Protected countryData As New List(Of Dictionary(Of String, String))()

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            LoadDashboardData()
            LoadActivityData()
            LoadSectorData()
            LoadCountryData()

            ' Serialize countryData to JSON and pass it to the front-end
            Dim jsSerializer As New JavaScriptSerializer()
            Dim countryDataJson As String = jsSerializer.Serialize(countryData)
            ClientScript.RegisterStartupScript(Me.GetType(), "CountryData", "var countryData = " & countryDataJson & ";", True)
        End If
    End Sub

    ' Method to load data for the dashboard
    Private Sub LoadDashboardData()
        Dim connString As String = Common.GetConnString()

        ' Open connection to the database
        Using conn As New SqlConnection(connString)
            conn.Open()

            ' Query 1: Get total contacts and registered contacts
            Using cmd As New SqlCommand("SELECT COUNT(*) AS TotalContacts, SUM(CASE WHEN pnContactPasswordHash IS NOT NULL THEN 1 ELSE 0 END) AS RegisteredContacts FROM pn_contacts", conn)
                Using reader As SqlDataReader = cmd.ExecuteReader()
                    If reader.Read() Then
                        totalContacts = Convert.ToInt32(reader("TotalContacts"))
                        registeredContacts = Convert.ToInt32(reader("RegisteredContacts"))
                    End If
                End Using
            End Using

            ' Query 2: Get total organizations and registered organizations
            Using cmd As New SqlCommand("SELECT COUNT(DISTINCT o.pnOrgID) AS TotalOrganizations, COUNT(DISTINCT CASE WHEN c.pnContactPasswordHash IS NOT NULL THEN o.pnOrgID END) AS RegisteredOrganizations FROM pn_orgs o LEFT JOIN pn_contacts c ON o.pnOrgID = c.pnOrgID", conn)
                Using reader As SqlDataReader = cmd.ExecuteReader()
                    If reader.Read() Then
                        totalOrganizations = Convert.ToInt32(reader("TotalOrganizations"))
                        registeredOrganizations = Convert.ToInt32(reader("RegisteredOrganizations"))
                    End If
                End Using
            End Using

            ' Query 3: Get list of organizations with registered users (name and ID)
            Using cmd As New SqlCommand("SELECT DISTINCT o.pnOrgName, o.pnOrgID FROM pn_orgs o INNER JOIN pn_contacts c ON o.pnOrgID = c.pnOrgID WHERE c.pnContactPasswordHash IS NOT NULL ORDER BY o.pnOrgName", conn)
                Using reader As SqlDataReader = cmd.ExecuteReader()
                    While reader.Read()
                        orgList.Add(reader("pnOrgName").ToString(), reader("pnOrgID").ToString())
                    End While
                End Using
            End Using
        End Using
    End Sub

    ' Method to load activity data for the bar chart
    Private Sub LoadActivityData()
        Dim connString As String = Common.GetConnString()

        ' Open connection to the database
        Using conn As New SqlConnection(connString)
            conn.Open()

            ' Query to get activity names, org counts, and total years
            Using cmd As New SqlCommand("SELECT a.pnActivity, COUNT(DISTINCT ao.pnOrgID) AS orgCount, SUM(ao.pnActivityYears) AS totalYears FROM pn_lu_activities a LEFT JOIN pn_activities_orgs ao ON a.pnActivity = ao.pnActivity GROUP BY a.pnActivity, a.pnActivityOrder ORDER BY a.pnActivityOrder", conn)
                Using reader As SqlDataReader = cmd.ExecuteReader()
                    While reader.Read()
                        activityNames.Add(reader("pnActivity").ToString())
                        activityOrgCounts.Add(Convert.ToInt32(reader("orgCount")))
                        activityTotalYears.Add(Convert.ToInt32(If(IsDBNull(reader("totalYears")), 0, reader("totalYears"))))
                    End While
                End Using
            End Using
        End Using
    End Sub

    ' Method to load sector data for the sector list
    Private Sub LoadSectorData()
        Dim connString As String = Common.GetConnString()

        ' Open connection to the database
        Using conn As New SqlConnection(connString)
            conn.Open()

            ' Query to get sector names, counts, and group by gmiSector
            Using cmd As New SqlCommand("SELECT s.gmiSector, s.pnSector, s.pnSubsector, s.pnSubsectorOrder, ISNULL(COUNT(so.pnOrgID), 0) AS orgCount FROM pn_lu_sectors s LEFT JOIN pn_sectors_orgs so ON s.pnSectorID = so.pnSectorID GROUP BY s.gmiSector, s.pnSector, s.pnSubsector, s.pnSubsectorOrder ORDER BY s.gmiSector, s.pnSubsectorOrder", conn)
                Using reader As SqlDataReader = cmd.ExecuteReader()
                    While reader.Read()
                        ' Add to sectorList grouped by gmiSector
                        sectorList.Add(New Dictionary(Of String, String) From {
                            {"gmiSector", reader("gmiSector").ToString()},
                            {"pnSector", reader("pnSector").ToString()},
                            {"pnSubsector", reader("pnSubsector").ToString()},
                            {"orgCount", Convert.ToInt32(reader("orgCount")).ToString()}
                        })
                    End While
                End Using
            End Using
        End Using
    End Sub

    ' Method to load country data for the map
    Private Sub LoadCountryData()
        Dim connString As String = Common.GetConnString()

        ' Open connection to the database
        Using conn As New SqlConnection(connString)
            conn.Open()

            ' Query to get the ISO codes (iso2 or iso3), count of orgs, and total years
            Using cmd As New SqlCommand("SELECT cl.iso2, cl.iso3, cl.FullCountryName, COUNT(DISTINCT pco.pnOrgID) AS orgCount, SUM(pco.pnCountryYears) AS totalYears FROM pn_countries_orgs pco JOIN dbo._countryLookup cl ON pco.country = cl.FullCountryName GROUP BY cl.iso2, cl.iso3, cl.FullCountryName", conn)
                Using reader As SqlDataReader = cmd.ExecuteReader()
                    While reader.Read()
                        ' Add country data (using ISO2 or ISO3) to the list
                        countryData.Add(New Dictionary(Of String, String) From {
                        {"country", reader("FullCountryName").ToString()},
                        {"iso2", reader("iso2").ToString()},
                        {"iso3", reader("iso3").ToString()},
                        {"orgCount", Convert.ToInt32(reader("orgCount")).ToString()},
                        {"totalYears", Convert.ToInt32(If(IsDBNull(reader("totalYears")), 0, reader("totalYears"))).ToString()}
                    })
                    End While
                End Using
            End Using
        End Using
    End Sub
End Class
