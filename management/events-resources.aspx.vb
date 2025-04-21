Imports System.Data
Imports System.Data.SqlClient

Partial Public Class events_resources
    Inherits System.Web.UI.Page

    Protected eventsData As DataTable
    Protected resourcesData As DataTable

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            InitializeDefaultDates()
            LoadData()
        End If
    End Sub

    Private Sub InitializeDefaultDates()
        ' Set the start date to the first day of the current week and end date to today
        txtStartDate.Text = DateTime.Now.AddDays(-(DateTime.Now.DayOfWeek - DayOfWeek.Sunday)).ToString("yyyy-MM-dd")
        txtEndDate.Text = DateTime.Now.ToString("yyyy-MM-dd")
    End Sub

    Protected Sub btnUpdate_Click(ByVal sender As Object, ByVal e As EventArgs)
        Dim startDate As DateTime
        Dim endDate As DateTime

        ' Parse start and end dates from text fields, with error handling
        If DateTime.TryParse(txtStartDate.Text, startDate) AndAlso DateTime.TryParse(txtEndDate.Text, endDate) Then
            ' Ensure startDate is before or equal to endDate
            If startDate > endDate Then
                lblError.Text = "Start Date cannot be after End Date."
                Return
            Else
                lblError.Text = ""
                LoadData(startDate.Date, endDate.Date.AddDays(1).AddTicks(-1)) ' Set to start and end of the day
            End If
        Else
            lblError.Text = "Invalid date format. Please ensure both dates are filled correctly."
        End If
    End Sub

    Private Sub LoadData(Optional ByVal startDate As DateTime = Nothing, Optional ByVal endDate As DateTime = Nothing)
        Dim connString As String = Common.GetConnString()
        eventsData = New DataTable()
        resourcesData = New DataTable()

        ' Default to parsed startDate and endDate values if passed, or fallback to text input values
        Dim effectiveStartDate As DateTime = If(startDate <> DateTime.MinValue, startDate.Date, DateTime.Parse(txtStartDate.Text).Date)
        Dim effectiveEndDate As DateTime = If(endDate <> DateTime.MinValue, endDate.Date.AddDays(1).AddTicks(-1), DateTime.Parse(txtEndDate.Text).Date.AddDays(1).AddTicks(-1))

        Using conn As New SqlConnection(connString)
            conn.Open()

            ' Events query with validated date range
            Using eventsCmd As New SqlCommand("
    SELECT Name, COUNT(er.lookupID) AS Count, er.lookupID,
           STRING_AGG(es.sectorID, ', ') AS Sectors
    FROM trackEventResource er
    LEFT JOIN eventSectors es ON er.lookupID = es.eventID
    WHERE trackType = 'event' AND logMoment BETWEEN @startDate AND @endDate
    GROUP BY Name, er.lookupID", conn)

                eventsCmd.Parameters.AddWithValue("@startDate", effectiveStartDate)
                eventsCmd.Parameters.AddWithValue("@endDate", effectiveEndDate)
                Using reader As SqlDataReader = eventsCmd.ExecuteReader()
                    eventsData.Load(reader)
                End Using
            End Using

            ' Resources query with validated date range
            Using resourcesCmd As New SqlCommand("SELECT 
    ter.Name, 
    COUNT(ter.lookupID) AS Count, 
    ter.lookupID,
    STRING_AGG(crs.sectorID, ', ') AS sectorIDs
FROM 
    trackEventResource ter
LEFT JOIN 
    cross_resource_sector crs ON ter.lookupID = crs.resourceID
WHERE 
    ter.trackType = 'resource' 
    AND ter.logMoment BETWEEN @startDate AND @endDate
GROUP BY 
    ter.Name, 
    ter.lookupID;", conn)
                resourcesCmd.Parameters.AddWithValue("@startDate", effectiveStartDate)
                resourcesCmd.Parameters.AddWithValue("@endDate", effectiveEndDate)
                Using reader As SqlDataReader = resourcesCmd.ExecuteReader()
                    resourcesData.Load(reader)
                End Using
            End Using
        End Using
    End Sub
End Class
