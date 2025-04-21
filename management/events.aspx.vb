Imports System.Data
Imports System.Data.SqlClient

Partial Class events
    Inherits System.Web.UI.Page

    Protected eventsData As DataTable

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            LoadEventData()
        End If
    End Sub

    Private Sub LoadEventData()
        Dim connString As String = Common.GetConnString()
        Dim query As String = "SELECT e.eventId, e.name, e.startDate, e.eventstatus, " &
                              "u.email AS lastModifiedByEmail, " &
                              "STRING_AGG(s.sectorId, ', ') AS sectors " &
                              "FROM events e " &
                              "LEFT JOIN eventSectors s ON e.eventId = s.eventId " &
                              "LEFT JOIN management_users u ON e.lastModifiedBy = u.user_id " &
                              "GROUP BY e.eventId, e.name, e.startDate, e.eventstatus, u.email " &
                              "ORDER BY e.eventId DESC"

        Using conn As New SqlConnection(connString)
            Using cmd As New SqlCommand(query, conn)
                conn.Open()
                Dim reader As SqlDataReader = cmd.ExecuteReader()
                eventsData = New DataTable()
                eventsData.Load(reader)
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

    Protected Sub btnAddNewEvent_Click(ByVal sender As Object, ByVal e As EventArgs)
        Response.Redirect("event_management.aspx")
    End Sub
End Class
