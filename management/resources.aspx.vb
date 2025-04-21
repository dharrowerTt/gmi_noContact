Imports System.Data
Imports System.Data.SqlClient

Partial Class resources
    Inherits System.Web.UI.Page

    Protected resourcesData As DataTable

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            LoadResourceData()
        End If
    End Sub

    Private Sub LoadResourceData()
        Dim connString As String = Common.GetConnString()
        Dim query As String = "
    SELECT 
        r.resourceid, 
        r.resourceName, 
        r.resourceLink, 
        r.status, 
        u.email AS lastModifiedByEmail, 
        STRING_AGG(s.sector, ', ') AS sectors
    FROM Resources r
    LEFT JOIN cross_resource_sector s ON r.resourceid = s.resourceid
    LEFT JOIN management_users u ON r.lastModifiedBy = u.user_id
    WHERE r.status <> 'Archived'
    GROUP BY r.resourceid, r.resourceName, r.resourceLink, r.status, u.email
    ORDER BY r.resourceid DESC"


        Using conn As New SqlConnection(connString)
            Using cmd As New SqlCommand(query, conn)
                conn.Open()
                Dim reader As SqlDataReader = cmd.ExecuteReader()
                resourcesData = New DataTable()
                resourcesData.Load(reader)
                reader.Close()
            End Using
        End Using
    End Sub

    Public Function GetFullSectorName(sectorAbbr As String) As String
        Dim sectors As String() = sectorAbbr.Split(","c)
        Dim fullSectors As New List(Of String)

        For Each sector In sectors
            Select Case sector.Trim().ToLower()
                Case "agri"
                    fullSectors.Add("Agriculture")
                Case "biogas"
                    fullSectors.Add("Biogas")
                Case "coal"
                    fullSectors.Add("Coal Mines")
                Case "msw"
                    fullSectors.Add("Municipal Solid Waste")
                Case "oilngas"
                    fullSectors.Add("Oil & Gas")
                Case "ww"
                    fullSectors.Add("Waste Water")
                Case "steer"
                    fullSectors.Add("Steering Committee")
                Case Else
                    fullSectors.Add(sector)
            End Select
        Next

        Return String.Join(", ", fullSectors)
    End Function

    Protected Sub btnAddNewResource_Click(ByVal sender As Object, ByVal e As EventArgs)
        Response.Redirect("resource_management.aspx")
    End Sub
End Class
