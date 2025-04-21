Imports System.IO
Imports System.Text
Imports System.Data
Imports System.Data.SqlClient

Public Class clsEventDAO

    Public Function GetData(ByVal cmd As SqlCommand) As DataTable
        Dim dt As New DataTable
        Dim strConnString As String = ConfigurationManager.AppSettings.Item("GMIdatabase")
        Dim con As New SqlConnection(strConnString)
        Dim sda As New SqlDataAdapter
        cmd.CommandType = CommandType.Text
        cmd.Connection = con
        Try
            con.Open()
            sda.SelectCommand = cmd
            sda.Fill(dt)
            Return dt
        Catch ex As Exception
            'Response.Write(ex.Message)
            Return Nothing
        Finally
            con.Close()
            sda.Dispose()
            con.Dispose()
        End Try
    End Function

    Public Shared Function insertEvent(ByVal eventObj As clsEventVO) As String
        Dim conn As SqlConnection = Nothing
        Dim cmd As SqlCommand = Nothing
        Dim strSQL As String = String.Empty
        Dim fieldStr As String

        Dim oId As Object
        Dim eventId As String = String.Empty

        conn = New SqlConnection(Common.GetConnString())
        conn.Open()

        cmd = New SqlCommand(strSQL, conn)

        'prepare values
        fieldStr = "'" & eventObj.getName() & "', " &
        "'" & eventObj.getCity() & "', " &
        "'" & eventObj.getCountry() & "', " &
        "'" & eventObj.getStartDate() & "', " &
        "'" & eventObj.getEndDate() & "', " &
        "'" & eventObj.getSponsored() & "', " &
        "'" & eventObj.getSubcommittee() & "', " &
        "'" & eventObj.getRelated() & "', " &
        "'" & eventObj.getDetails() & "', " &
        "'" & eventObj.getpoc_name() & "'," &
        "'" & eventObj.getpoc_phone() & "'," &
        "'" & eventObj.getpoc_email() & "'," &
        "'" & eventObj.getorganizer() & "'," &
        "'" & eventObj.getorganizer_url() & "', " &
        "'" & eventObj.getevent_url() & "', " &
        "'" & eventObj.getphoto_url() & "', " &
        "'" & DateTime.Today & "', " &
        "'" & eventObj.getEventStatus() & "', " &
        "'" & eventObj.getEventType() & "'"
        'fieldStr = Replace(fieldStr, "'", "''")

        strSQL = "insert into events (name, city, country, startDate, endDate, sponsored, subcommittee, "
        strSQL += "related, details, poc_name, poc_phone, poc_email, organizer, organizer_url, event_url, photo_url,"
        strSQL += " lastmodifieddate, eventstatus, event_type) values (" & fieldStr & ")"


        cmd.CommandText = strSQL
        cmd.CommandType = CommandType.Text
        cmd.ExecuteNonQuery()

        'find the new event Id
        cmd.CommandText = "SELECT SCOPE_IDENTITY() "
        oId = cmd.ExecuteScalar()

        If oId Is DBNull.Value Then
            Throw New Exception("InsertEvent: Could not obtain event id.")
        Else
            eventId = CType(oId, String)
        End If
        'cmd.Dispose()
        conn.Dispose()
        conn = Nothing
        cmd = Nothing

        Return eventId
    End Function



    Public Shared Function insertEventSector(ByVal eventId As String, ByVal sectorId As String) As String
        Dim conn As SqlConnection = Nothing
        Dim cmd As SqlCommand = Nothing
        Dim strSQL As String = String.Empty

        conn = New SqlConnection(Common.GetConnString())
        conn.Open()

        cmd = New SqlCommand(strSQL, conn)
        'hui huge SQL injection problem here must be taken care of alive
        '7/18/2009
        'need to deal with situation without ID defined from query string

        'generate sql string
        strSQL = "insert into eventSectors (eventid, sectorid) values(" & eventId & ", '" & sectorId & "')"

        cmd.CommandText = strSQL
        cmd.CommandType = CommandType.Text
        cmd.ExecuteNonQuery()

        'cmd.Dispose()
        conn.Dispose()
        conn = Nothing
        cmd = Nothing

        Return eventId
    End Function

    Public Shared Function editEvent(ByVal eventObj As clsEventVO) As Boolean
        Dim conn As SqlConnection = Nothing
        Dim cmd As SqlCommand = Nothing
        Dim strSQL As String = String.Empty
        Dim fieldStr As String

        Dim eventId As String = String.Empty

        conn = New SqlConnection(Common.GetConnString())
        conn.Open()

        cmd = New SqlCommand(strSQL, conn)

        'prepare values
        fieldStr = "name='" & eventObj.getName() & "', " &
        "city='" & eventObj.getCity() & "', " &
        "state='" & eventObj.getState() & "', " &
        "country='" & eventObj.getCountry() & "', " &
        "startDate='" & eventObj.getStartDate() & "', " &
        "endDate='" & eventObj.getEndDate() & "', " &
        "Sponsored='" & eventObj.getSponsored() & "', " &
        "Subcommittee='" & eventObj.getSubcommittee() & "', " &
        "Multiday='" & eventObj.getmultiday() & "', " &
        "Related='" & eventObj.getRelated() & "', " &
        "Details='" & eventObj.getDetails() & "', " &
        "lastmodifiedDate='" & DateTime.Today & "' ," &
        "poc_name= '" & eventObj.getpoc_name() & "'," &
        "poc_phone= '" & eventObj.getpoc_phone() & "'," &
        "poc_email= '" & eventObj.getpoc_email() & "'," &
        "organizer= '" & eventObj.getorganizer() & "'," &
        "organizer_url= '" & eventObj.getorganizer_url() & "', " &
        "event_url= '" & eventObj.getevent_url() & "', " &
        "eventstatus = '" & eventObj.getEventStatus() & "', " &
        "event_type = '" & eventObj.getEventType() & "'"
        'hui - must convert it to parameter query
        'generate sql string
        strSQL = "update events set " & fieldStr & " where eventId=" & eventObj.getEventId

        'strSQL = "update events set name='boston' where eventId=" & eventObj.getEventId

        cmd.CommandText = strSQL
        cmd.CommandType = CommandType.Text
        cmd.ExecuteNonQuery()

        'cmd.Dispose()
        conn.Dispose()
        conn = Nothing
        cmd = Nothing

        Return True
    End Function

    Public Shared Function editEmail(ByVal eventObj As clsEventVO) As Boolean
        Dim conn As SqlConnection = Nothing
        Dim cmd As SqlCommand = Nothing
        Dim strSQL As String = String.Empty
        Dim fieldStr As String

        Dim eventId As String = String.Empty

        conn = New SqlConnection(Common.GetConnString())
        conn.Open()

        cmd = New SqlCommand(strSQL, conn)

        'prepare values
        fieldStr = "name='" & eventObj.getName() & "', " &
        "city='" & eventObj.getCity() & "', " &
        "state='" & eventObj.getState() & "', " &
        "country='" & eventObj.getCountry() & "', " &
        "startDate='" & eventObj.getStartDate() & "', " &
        "endDate='" & eventObj.getEndDate() & "', " &
        "Sponsored='" & eventObj.getSponsored() & "', " &
        "Subcommittee='" & eventObj.getSubcommittee() & "', " &
        "Multiday='" & eventObj.getmultiday() & "', " &
        "Related='" & eventObj.getRelated() & "', " &
        "Details='" & eventObj.getDetails() & "', " &
        "lastmodifiedDate='" & DateTime.Today & "' ," &
        "poc_name= '" & eventObj.getpoc_name() & "'," &
        "poc_phone= '" & eventObj.getpoc_phone() & "'," &
        "poc_email= '" & eventObj.getpoc_email() & "'," &
        "organizer= '" & eventObj.getorganizer() & "'," &
        "organizer_url= '" & eventObj.getorganizer_url() & "', " &
        "event_url= '" & eventObj.getevent_url() & "', " &
        "eventstatus = '" & eventObj.getEventStatus() & "', " &
        "event_type = '" & eventObj.getEventType() & "' "

        'hui - must convert it to parameter query
        'generate sql string
        strSQL = "update events set " & fieldStr & " where eventId=" & eventObj.getEventId

        'strSQL = "update events set name='boston' where eventId=" & eventObj.getEventId

        cmd.CommandText = strSQL
        cmd.CommandType = CommandType.Text
        cmd.ExecuteNonQuery()

        'cmd.Dispose()
        conn.Dispose()
        conn = Nothing
        cmd = Nothing

        Return True
    End Function


    Public Shared Function deleteEvent(ByVal eventId As String) As String
        Dim conn As SqlConnection = Nothing
        Dim cmd As SqlCommand = Nothing
        Dim strSQL As String = String.Empty

        'first delete sectors
        deleteEventSectorsByEventId(eventId)

        conn = New SqlConnection(Common.GetConnString())
        conn.Open()

        cmd = New SqlCommand(strSQL, conn)

        'security risk
        'generate sql string
        strSQL = "delete from events where eventId=" & eventId
        cmd.CommandText = strSQL
        cmd.CommandType = CommandType.Text
        cmd.ExecuteNonQuery()

        strSQL = "delete from eventsectors where eventid=" & eventId
        cmd.CommandText = strSQL
        cmd.CommandType = CommandType.Text
        cmd.ExecuteNonQuery()

        'cmd.Dispose()
        conn.Dispose()
        conn = Nothing
        cmd = Nothing

        Return "1"
    End Function

    Public Shared Function getEventsByStartDate(ByVal myDateStr As String) As DataTable
        Dim conn As SqlConnection = Nothing
        Dim cmd As SqlCommand = Nothing
        Dim strSQL As String = String.Empty
        Dim da As SqlDataAdapter
        Dim ds As DataSet = Nothing
        Dim dt As DataTable = Nothing

        conn = New SqlConnection(Common.GetConnString())
        conn.Open()

        cmd = New SqlCommand(strSQL, conn)

        'generate sql string
        'strSQL = "select * from events where startDate<'" & myStartDateStr & "' and endDate>'" & myEndDateStr & "'"

        'strSQL = "select * from events"
        strSQL = "select * from events where datepart(month, startdate)>=" & Month(myDateStr) & " and datepart(year, startdate)=" & Year(myDateStr) & " and eventstatus = 'final' Order by startDate "
        'strSQL = "select * from events where datepart(month, startdate)>=" & Month(myDateStr) & " and datepart(year, startdate)=" & Year(myDateStr) & " and eventstatus = 'final' Order by startDate "
        'strSQL = "select * from events where startDate='" & myDateStr & "' and endDate>='" & myDateStr & "'"


        cmd.CommandText = strSQL
        cmd.CommandType = CommandType.Text
        da = New SqlDataAdapter(cmd)
        ds = New DataSet
        ds.CaseSensitive = False

        da.Fill(ds)
        dt = ds.Tables(0)

        conn.Dispose()
        conn = Nothing
        cmd = Nothing
        da = Nothing
        ds = Nothing

        Return dt
    End Function

    Public Shared Function getEventsByStartDateByDay(ByVal myDateStr As String) As DataTable
        Dim conn As SqlConnection = Nothing
        Dim cmd As SqlCommand = Nothing
        Dim strSQL As String = String.Empty
        Dim da As SqlDataAdapter
        Dim ds As DataSet = Nothing
        Dim dt As DataTable = Nothing

        conn = New SqlConnection(Common.GetConnString())
        conn.Open()

        cmd = New SqlCommand(strSQL, conn)

        'generate sql string
        'strSQL = "select * from events where startDate<'" & myStartDateStr & "' and endDate>'" & myEndDateStr & "'"

        'strSQL = "select * from events"
        'strSQL = "select * from events where datepart(month, startdate)=" & Month(myDateStr) & " and datepart(year, startdate)=" & Year(myDateStr) & " Order by startDate "
        strSQL = "select * from events where startDate<='" & myDateStr & "' and endDate>='" & myDateStr & "' and eventstatus = 'final'"


        cmd.CommandText = strSQL
        cmd.CommandType = CommandType.Text
        da = New SqlDataAdapter(cmd)
        ds = New DataSet
        ds.CaseSensitive = False

        da.Fill(ds)
        dt = ds.Tables(0)

        conn.Dispose()
        conn = Nothing
        cmd = Nothing
        da = Nothing
        ds = Nothing

        Return dt
    End Function


    Public Shared Function getEventSectorsByStartDate(ByVal myDateStr As String) As DataTable
        Dim conn As SqlConnection = Nothing
        Dim cmd As SqlCommand = Nothing
        Dim strSQL As String = String.Empty
        Dim da As SqlDataAdapter
        Dim ds As DataSet = Nothing
        Dim dt As DataTable = Nothing

        conn = New SqlConnection(Common.GetConnString())
        conn.Open()

        cmd = New SqlCommand(strSQL, conn)

        strSQL = "select es.sectorId, ls.sectordesc from eventsectors es, lu_sector ls  " &
 " where es.eventId in (select eventId from events where startDate='" & myDateStr & "' and eventstatus = 'final') and es.sectorid=ls.sectorabbr " &
 " group by es.sectorId, ls.sectordesc"


        cmd.CommandText = strSQL
        cmd.CommandType = CommandType.Text
        da = New SqlDataAdapter(cmd)
        ds = New DataSet
        ds.CaseSensitive = False

        da.Fill(ds)
        dt = ds.Tables(0)

        conn.Dispose()
        conn = Nothing
        cmd = Nothing
        da = Nothing
        ds = Nothing

        Return dt
    End Function


    Public Shared Function getEventSectorsByStartDateGroupBySector(ByVal myDateStr As String) As DataTable
        Dim conn As SqlConnection = Nothing
        Dim cmd As SqlCommand = Nothing
        Dim strSQL As String = String.Empty
        Dim da As SqlDataAdapter
        Dim ds As DataSet = Nothing
        Dim dt As DataTable = Nothing

        conn = New SqlConnection(Common.GetConnString())
        conn.Open()

        cmd = New SqlCommand(strSQL, conn)

        strSQL = "select ls.sectordesc from eventsectors es, lu_sector ls  " &
 " where es.eventId in (select eventId from events where startDate='" & myDateStr & "' ) and es.sectorid=ls.sectorabbr " &
 " group by ls.sectordesc"


        cmd.CommandText = strSQL
        cmd.CommandType = CommandType.Text
        da = New SqlDataAdapter(cmd)
        ds = New DataSet
        ds.CaseSensitive = False

        da.Fill(ds)
        dt = ds.Tables(0)

        conn.Dispose()
        conn = Nothing
        cmd = Nothing
        da = Nothing
        ds = Nothing

        Return dt
    End Function

    Public Shared Function getEventInfoByStartDateGroupBySector(ByVal myDateStr As String) As DataTable
        Dim conn As SqlConnection = Nothing
        Dim cmd As SqlCommand = Nothing
        Dim strSQL As String = String.Empty
        Dim da As SqlDataAdapter
        Dim ds As DataSet = Nothing
        Dim dt As DataTable = Nothing

        conn = New SqlConnection(Common.GetConnString())
        conn.Open()

        cmd = New SqlCommand(strSQL, conn)

        strSQL = "SELECT e.eventId, e.name, e.photo_url, " &
                  " MIN(es.sectorId) AS firstSector " &
                  " FROM     events AS e INNER JOIN " &
                  " eventSectors AS es ON e.eventId = es.eventId " &
                  " WHERE  e.eventstatus = 'final' and (e.startDate <= '" & myDateStr & "') AND (e.endDate >= '" & myDateStr & "') " &
                  " GROUP BY e.eventId, e.name, e.photo_url"


        cmd.CommandText = strSQL
        cmd.CommandType = CommandType.Text
        da = New SqlDataAdapter(cmd)
        ds = New DataSet
        ds.CaseSensitive = False

        da.Fill(ds)
        dt = ds.Tables(0)

        conn.Dispose()
        conn = Nothing
        cmd = Nothing
        da = Nothing
        ds = Nothing

        Return dt
    End Function

    Public Shared Function getUpcomingEvents(ByVal myMon As String, ByVal myYear As String, Optional ByVal sectorid As String = "") As DataTable
        Dim conn As SqlConnection = Nothing
        Dim cmd As SqlCommand = Nothing
        Dim strSQL As String = String.Empty
        Dim da As SqlDataAdapter
        Dim ds As DataSet = Nothing
        Dim dt As DataTable = Nothing

        conn = New SqlConnection(Common.GetConnString())
        conn.Open()

        cmd = New SqlCommand(strSQL, conn)

        If sectorid = "" Or sectorid = "all" Then
            strSQL = "select  * from events where  dateadd(Day, 1, enddate) >= getDate() and eventstatus = 'final' order by startdate asc"

        ElseIf sectorid = "oilgas" Then
            strSQL = "select * from events inner join eventsectors on events.eventid = eventsectors.eventid where  dateadd(Day, 1, enddate) >= getDate()  and eventstatus = 'final' and sectorid like '%oilngas%' order by startdate asc"
        Else

            strSQL = "select * from events inner join eventsectors on events.eventid = eventsectors.eventid where  dateadd(Day, 1, enddate) >= getDate()  and eventstatus = 'final' and sectorid like '%" & sectorid & "%' order by startdate asc"
        End If





        cmd.CommandText = strSQL
        cmd.CommandType = CommandType.Text
        da = New SqlDataAdapter(cmd)
        ds = New DataSet
        ds.CaseSensitive = False

        da.Fill(ds)
        dt = ds.Tables(0)

        conn.Dispose()
        conn = Nothing
        cmd = Nothing
        da = Nothing
        ds = Nothing

        Return dt
    End Function
    Public Function getRecentEventsByCountry(ByVal countryabbr As String, ByVal days As Integer) As DataTable
        Dim conn As SqlConnection = Nothing
        Dim cmd As SqlCommand = Nothing
        Dim strSQL As String = String.Empty
        Dim da As SqlDataAdapter
        Dim ds As DataSet = Nothing
        Dim dt As DataTable = Nothing

        conn = New SqlConnection(Common.GetConnString())
        conn.Open()

        cmd = New SqlCommand(strSQL, conn)
        Dim countryname As String = ""
        countryname = getGeoFocus(countryabbr)


        strSQL = "select * from events inner join lu_country c on events.country = c.eventcountryID where startdate >= DATEADD(day,-" & days & ",GETDATE())" &
            " and (c.countryname = '" & countryname & "' or c.html_safe_countryname like '%" & countryname & "%')"

        cmd.CommandText = strSQL
        cmd.CommandType = CommandType.Text
        da = New SqlDataAdapter(cmd)
        ds = New DataSet
        ds.CaseSensitive = False

        da.Fill(ds)
        dt = ds.Tables(0)

        conn.Dispose()
        conn = Nothing
        cmd = Nothing
        da = Nothing
        ds = Nothing

        Return dt
    End Function
    Public Shared Function getRecentEvents(Optional ByVal sectorid As String = "") As DataTable
        Dim conn As SqlConnection = Nothing
        Dim cmd As SqlCommand = Nothing
        Dim strSQL As String = String.Empty
        Dim da As SqlDataAdapter
        Dim ds As DataSet = Nothing
        Dim dt As DataTable = Nothing

        conn = New SqlConnection(Common.GetConnString())
        conn.Open()

        cmd = New SqlCommand(strSQL, conn)
        If sectorid = "" Then
            strSQL = "select top 10 * from events 
 LEFT JOIN (select eventId as sector_eventId, string_agg(sectorID,',') as sectors from eventsectors 
    group by eventId) as eventsectors on events.eventid = eventsectors.sector_eventId where dateadd(Day, 1, enddate)  < getDate() and eventstatus = 'final' order by startdate desc "

        ElseIf sectorid = "oilgas" Then
            strSQL = "select top 10 * from events inner join eventsectors on events.eventid = eventsectors.eventid where dateadd(Day, 1, enddate)  < getDate() and eventstatus = 'final' and sectorid like '%oilngas%' order by startdate desc"
        Else

            strSQL = "select top 10 * from events inner join eventsectors on events.eventid = eventsectors.eventid where dateadd(Day, 1, enddate)  < getDate() and eventstatus = 'final' and sectorid like '%" & sectorid & "%' order by startdate desc"
        End If

        cmd.CommandText = strSQL
        cmd.CommandType = CommandType.Text
        da = New SqlDataAdapter(cmd)
        ds = New DataSet
        ds.CaseSensitive = False

        da.Fill(ds)
        dt = ds.Tables(0)

        conn.Dispose()
        conn = Nothing
        cmd = Nothing
        da = Nothing
        ds = Nothing

        Return dt
    End Function


    Public Shared Function getPastEvents() As DataTable
        Dim conn As SqlConnection = Nothing
        Dim cmd As SqlCommand = Nothing
        Dim strSQL As String = String.Empty
        Dim da As SqlDataAdapter
        Dim ds As DataSet = Nothing
        Dim dt As DataTable = Nothing

        conn = New SqlConnection(Common.GetConnString())
        conn.Open()

        cmd = New SqlCommand(strSQL, conn)

        strSQL = "select * from events where dateadd(Day, 1, enddate)  < getDate() and eventstatus = 'final'  order by startdate desc"

        cmd.CommandText = strSQL
        cmd.CommandType = CommandType.Text
        da = New SqlDataAdapter(cmd)
        ds = New DataSet
        ds.CaseSensitive = False

        da.Fill(ds)
        dt = ds.Tables(0)

        conn.Dispose()
        conn = Nothing
        cmd = Nothing
        da = Nothing
        ds = Nothing

        Return dt
    End Function

    Public Shared Function getAllEvents() As DataTable
        Dim conn As SqlConnection = Nothing
        Dim cmd As SqlCommand = Nothing
        Dim strSQL As String = String.Empty
        Dim da As SqlDataAdapter
        Dim ds As DataSet = Nothing
        Dim dt As DataTable = Nothing

        conn = New SqlConnection(Common.GetConnString())
        conn.Open()

        cmd = New SqlCommand(strSQL, conn)

        strSQL = "select * from events where  eventstatus = 'final' order by startdate desc, name asc"

        cmd.CommandText = strSQL
        cmd.CommandType = CommandType.Text
        da = New SqlDataAdapter(cmd)
        ds = New DataSet
        ds.CaseSensitive = False

        da.Fill(ds)
        dt = ds.Tables(0)

        conn.Dispose()
        conn = Nothing
        cmd = Nothing
        da = Nothing
        ds = Nothing

        Return dt
    End Function
    Public Shared Function getDraftEvents() As DataTable
        Dim conn As SqlConnection = Nothing
        Dim cmd As SqlCommand = Nothing
        Dim strSQL As String = String.Empty
        Dim da As SqlDataAdapter
        Dim ds As DataSet = Nothing
        Dim dt As DataTable = Nothing

        conn = New SqlConnection(Common.GetConnString())
        conn.Open()

        cmd = New SqlCommand(strSQL, conn)

        strSQL = "select top 5 * from events where enddate < getDate() and eventstatus = 'draft' order by startdate desc"

        cmd.CommandText = strSQL
        cmd.CommandType = CommandType.Text
        da = New SqlDataAdapter(cmd)
        ds = New DataSet
        ds.CaseSensitive = False

        da.Fill(ds)
        dt = ds.Tables(0)

        conn.Dispose()
        conn = Nothing
        cmd = Nothing
        da = Nothing
        ds = Nothing

        Return dt
    End Function

    Public Shared Function getEventsByMonth(ByVal myMon As String, ByVal myYear As String) As DataTable
        Dim conn As SqlConnection = Nothing
        Dim cmd As SqlCommand = Nothing
        Dim strSQL As String = String.Empty
        Dim da As SqlDataAdapter
        Dim ds As DataSet = Nothing
        Dim dt As DataTable = Nothing

        conn = New SqlConnection(Common.GetConnString())
        conn.Open()

        cmd = New SqlCommand(strSQL, conn)

        strSQL = "select * from events where datepart(month, startdate)=" & myMon & " and datepart(year, startdate)=" & myYear & " and eventstatus = 'final' order by startDate"

        cmd.CommandText = strSQL
        cmd.CommandType = CommandType.Text
        da = New SqlDataAdapter(cmd)
        ds = New DataSet
        ds.CaseSensitive = False

        da.Fill(ds)
        dt = ds.Tables(0)

        conn.Dispose()
        conn = Nothing
        cmd = Nothing
        da = Nothing
        ds = Nothing

        Return dt
    End Function


    Public Shared Function geteventSectorbyeventid(ByVal eventid As String) As DataTable
        Dim conn As SqlConnection = Nothing
        Dim cmd As SqlCommand = Nothing
        Dim strSQL As String = String.Empty
        Dim da As SqlDataAdapter
        Dim ds As DataSet = Nothing
        Dim dt As DataTable = Nothing

        conn = New SqlConnection(Common.GetConnString())
        conn.Open()

        cmd = New SqlCommand(strSQL, conn)

        strSQL = "select sectorid from eventsectors where eventid = " & eventid
        cmd.CommandText = strSQL
        cmd.CommandType = CommandType.Text
        da = New SqlDataAdapter(cmd)
        ds = New DataSet
        ds.CaseSensitive = False

        da.Fill(ds)
        dt = ds.Tables(0)

        conn.Dispose()
        conn = Nothing
        cmd = Nothing
        da = Nothing
        ds = Nothing

        Return dt



    End Function

    Public Shared Function getRelatedEvents(ByVal eventid As Integer, ByVal sectorid As String) As DataTable
        Dim conn As SqlConnection = Nothing
        Dim cmd As SqlCommand = Nothing
        Dim strSQL As String = String.Empty
        Dim da As SqlDataAdapter
        Dim ds As DataSet = Nothing
        Dim dt As DataTable = Nothing

        conn = New SqlConnection(Common.GetConnString())
        conn.Open()

        cmd = New SqlCommand(strSQL, conn)

        strSQL = "Select * from events inner join ( " &
                    " Select eventlist.eventid, sum(eventlist.points) As points from ( " &
                    " Select e.eventid, 20 As points, 'sector' as filter from events e inner join eventsectors es on es.eventid = e.eventid inner join (select e.eventid from events e inner join eventsectors es on es.eventid = e.eventid where startdate >= getdate() and abs(datediff(day,startdate,getdate())) < 700 group by e.eventid having count(sectorID) < 4 ) as singles on e.eventid = singles.eventid where startdate >= getdate()  and sectorid = '" & geteventSector(sectorid) & "' " &
                    " UNION " &
                    " Select e.eventid, 15 As points, 'sector' as filter from events e inner join eventsectors es on es.eventid = e.eventid inner join (select e.eventid from events e inner join eventsectors es on es.eventid = e.eventid where startdate < getdate()  and abs(datediff(day,startdate,getdate())) < 700 group by e.eventid having count(sectorID) < 4 ) as singles on e.eventid = singles.eventid where startdate < getdate()  and sectorid = '" & geteventSector(sectorid) & "' " &
                    " UNION " &
                    " select e.eventid, 10 as points, 'sector' as filter from events e inner join eventsectors es on es.eventid = e.eventid where startdate >= getdate() and abs(datediff(day,startdate,getdate())) < 500 group by e.eventid having count(sectorID) >= 4 " &
                    " UNION " &
                     " select e.eventid, 7 as points, 'sector' as filter from events e inner join eventsectors es on es.eventid = e.eventid where startdate < getdate() and abs(datediff(day,startdate,getdate())) < 500 group by e.eventid having count(sectorID) >= 4 " &
                    " UNION " &
                    " select e.eventid, 5 as points, 'gmi' as filter from events e where (subcommittee = 1 or sponsored = 1) and  abs(datediff(day,startdate,getdate())) < 300" &
                    " UNION " &
                    " select eventid, 1-abs(datediff(day,startdate,getdate()))/50 as points, 'future' as filter from events  where abs(datediff(day,startdate,getdate())) < 300" &
                    "  " &
                    " UNION Select x.eventid, 10 As points, 'country' as filter from events e inner join events x on e.country = x.country and e.eventid <> x.eventid and e.eventid = " & eventid & " and  abs(datediff(day,x.startdate,getdate())) < 700) as eventlist " &
                    " group by eventlist.eventid " &
                            " " &
                    " ) as rankedevents on events.eventid = rankedevents.eventid " &
                    " and eventstatus = 'final' " &
                    " And events.eventid != " & eventid &
                    " order by points desc"


        cmd.CommandText = strSQL
        cmd.CommandType = CommandType.Text
        da = New SqlDataAdapter(cmd)
        ds = New DataSet
        ds.CaseSensitive = False

        da.Fill(ds)
        dt = ds.Tables(0)

        conn.Dispose()
        conn = Nothing
        cmd = Nothing
        da = Nothing
        ds = Nothing

        Return dt
    End Function


    Public Shared Function GetEventByEventId(ByVal eventId As String) As clsEventVO
        Dim conn As SqlConnection = Nothing
        Dim cmd As SqlCommand = Nothing
        Dim strSQL As String = String.Empty
        Dim da As SqlDataAdapter
        Dim ds As DataSet = Nothing
        Dim dt As DataTable = Nothing

        conn = New SqlConnection(Common.GetConnString())
        conn.Open()

        cmd = New SqlCommand(strSQL, conn)
        'hui question: if there is no eventID
        'what we suppose to show
        '7/18/2009

        Dim iEventID = 0
        If (Integer.TryParse(eventId, 0)) Then
            iEventID = CInt(eventId)
        Else
            Return Nothing
        End If

        strSQL = "select * from events where eventId=" & iEventID

        cmd.CommandText = strSQL
        cmd.CommandType = CommandType.Text
        da = New SqlDataAdapter(cmd)
        ds = New DataSet
        ds.CaseSensitive = False

        da.Fill(ds)
        dt = ds.Tables(0)

        Dim x As Integer
        Dim eventObj As clsEventVO

        If (dt.Rows.Count > 0) Then
            eventObj = New clsEventVO

            For x = 0 To dt.Rows.Count - 1
                eventObj.setEventId(eventId)
                eventObj.setName(dt.Rows(x)("name"))
                eventObj.setCity(dt.Rows(x)("city"))
                eventObj.setCountry(dt.Rows(x)("country"))
                eventObj.setStartDate(dt.Rows(x)("StartDate"))
                eventObj.setEndDate(dt.Rows(x)("endDate"))
                eventObj.setSponsored(dt.Rows(x)("Sponsored"))
                eventObj.setSubcommittee(dt.Rows(x)("Subcommittee"))
                eventObj.setRelated(dt.Rows(x)("Related"))
                eventObj.setState(dt.Rows(x)("state"))
                eventObj.setorganizer(dt.Rows(x)("organizer"))
                eventObj.setmultiday(dt.Rows(x)("multiday"))
                eventObj.setpoc_name(dt.Rows(x)("poc_name"))
                eventObj.setpoc_phone(dt.Rows(x)("poc_phone"))
                eventObj.setpoc_email(dt.Rows(x)("poc_email"))
                eventObj.setorganizer_url(dt.Rows(x)("organizer_URL"))
                eventObj.setevent_url(dt.Rows(x)("event_URL"))
                eventObj.setphoto_url(dt.Rows(x)("photo_url"))
                eventObj.setDetails(dt.Rows(x)("Details"))
                eventObj.setEventStatus(dt.Rows(x)("eventstatus"))
                eventObj.setEventType(dt.Rows(x)("event_type"))
            Next
        Else
            eventObj = Nothing
        End If

        conn.Dispose()
        conn = Nothing
        cmd = Nothing
        da = Nothing
        ds = Nothing

        Return eventObj
    End Function

    Public Shared Function GetDraftEventByEventId(ByVal eventId As String) As clsEventVO
        Dim conn As SqlConnection = Nothing
        Dim cmd As SqlCommand = Nothing
        Dim strSQL As String = String.Empty
        Dim da As SqlDataAdapter
        Dim ds As DataSet = Nothing
        Dim dt As DataTable = Nothing

        conn = New SqlConnection(Common.GetConnString())
        conn.Open()

        cmd = New SqlCommand(strSQL, conn)
        'hui question: if there is no eventID
        'what we suppose to show
        '7/18/2009

        Dim iEventID = 0
        If (Integer.TryParse(eventId, 0)) Then
            iEventID = CInt(eventId)
        Else
            Return Nothing
        End If

        strSQL = "select * from events where eventstatus<>'final' and eventId=" & iEventID

        cmd.CommandText = strSQL
        cmd.CommandType = CommandType.Text
        da = New SqlDataAdapter(cmd)
        ds = New DataSet
        ds.CaseSensitive = False

        da.Fill(ds)
        dt = ds.Tables(0)

        Dim x As Integer
        Dim eventObj As clsEventVO

        If (dt.Rows.Count > 0) Then
            eventObj = New clsEventVO

            For x = 0 To dt.Rows.Count - 1
                eventObj.setEventId(eventId)
                eventObj.setName(dt.Rows(x)("name"))
                eventObj.setCity(dt.Rows(x)("city"))
                eventObj.setCountry(dt.Rows(x)("country"))
                eventObj.setStartDate(dt.Rows(x)("StartDate"))
                eventObj.setEndDate(dt.Rows(x)("endDate"))
                eventObj.setSponsored(dt.Rows(x)("Sponsored"))
                eventObj.setSubcommittee(dt.Rows(x)("Subcommittee"))
                eventObj.setRelated(dt.Rows(x)("Related"))
                eventObj.setState(dt.Rows(x)("state"))
                eventObj.setorganizer(dt.Rows(x)("organizer"))
                eventObj.setmultiday(dt.Rows(x)("multiday"))
                eventObj.setpoc_name(dt.Rows(x)("poc_name"))
                eventObj.setpoc_phone(dt.Rows(x)("poc_phone"))
                eventObj.setpoc_email(dt.Rows(x)("poc_email"))
                eventObj.setorganizer_url(dt.Rows(x)("organizer_URL"))
                eventObj.setevent_url(dt.Rows(x)("event_URL"))
                eventObj.setphoto_url(dt.Rows(x)("photo_url"))
                eventObj.setDetails(dt.Rows(x)("Details"))
                eventObj.setEventStatus(dt.Rows(x)("eventStatus"))
                eventObj.setEventType(dt.Rows(x)("event_type"))
            Next
        Else
            eventObj = Nothing
        End If

        conn.Dispose()
        conn = Nothing
        cmd = Nothing
        da = Nothing
        ds = Nothing

        Return eventObj
    End Function


    Public Shared Function getAllEvents(ByVal order As String, ByVal field As String) As DataTable
        Dim conn As SqlConnection = Nothing
        Dim cmd As SqlCommand = Nothing
        Dim strSQL As String = String.Empty
        Dim da As SqlDataAdapter
        Dim ds As DataSet = Nothing
        Dim dt As DataTable = Nothing

        conn = New SqlConnection(Common.GetConnString())
        conn.Open()

        cmd = New SqlCommand(strSQL, conn)

        'strSQL = "select * from events order by " & field & " " & order
        strSQL = "select id as eventid, * from viewAdvancedSearch_v1 where category = 'Event' order by " & field & " " & order
        cmd.CommandText = strSQL
        cmd.CommandType = CommandType.Text
        da = New SqlDataAdapter(cmd)
        ds = New DataSet
        ds.CaseSensitive = False

        da.Fill(ds)
        dt = ds.Tables(0)

        conn.Dispose()
        conn = Nothing
        cmd = Nothing
        da = Nothing
        ds = Nothing

        Return dt
    End Function

    Public Shared Function getAllEventsbyStatus(ByVal order As String, ByVal field As String, ByVal status As String) As DataTable
        Dim conn As SqlConnection = Nothing
        Dim cmd As SqlCommand = Nothing
        Dim strSQL As String = String.Empty
        Dim da As SqlDataAdapter
        Dim ds As DataSet = Nothing
        Dim dt As DataTable = Nothing

        conn = New SqlConnection(Common.GetConnString())
        conn.Open()

        cmd = New SqlCommand(strSQL, conn)

        'strSQL = "select * from events order by " & field & " " & order
        strSQL = "select id as eventid, * from viewAdvancedSearch_v1 where status = '" & status & "' and category = 'Event' order by " & field & " " & order
        cmd.CommandText = strSQL
        cmd.CommandType = CommandType.Text
        da = New SqlDataAdapter(cmd)
        ds = New DataSet
        ds.CaseSensitive = False

        da.Fill(ds)
        dt = ds.Tables(0)

        conn.Dispose()
        conn = Nothing
        cmd = Nothing
        da = Nothing
        ds = Nothing

        Return dt
    End Function


    'used for detail view of the events
    Public Shared Function getEventSectorsByEventId(ByVal eventId As String) As DataTable
        Dim conn As SqlConnection = Nothing
        Dim cmd As SqlCommand = Nothing
        Dim strSQL As String = String.Empty
        Dim da As SqlDataAdapter
        Dim ds As DataSet = Nothing
        Dim dt As DataTable = Nothing

        conn = New SqlConnection(Common.GetConnString())
        conn.Open()

        cmd = New SqlCommand(strSQL, conn)

        strSQL = "select es.sectorid, ls.sector, ls.sectorDesc from eventSectors es, lu_sector ls " &
"where es.eventId=" & eventId & " and es.sectorId= ls.sectorabbr order by ls.parentSectorID, es.sectorid"

        cmd.CommandText = strSQL
        cmd.CommandType = CommandType.Text
        da = New SqlDataAdapter(cmd)
        ds = New DataSet
        ds.CaseSensitive = False

        da.Fill(ds)
        dt = ds.Tables(0)

        conn.Dispose()
        conn = Nothing
        cmd = Nothing
        da = Nothing
        ds = Nothing

        Return dt
    End Function


    Public Shared Function deleteEventSectorsByEventId(ByVal eventId As String) As Boolean
        Dim conn As SqlConnection = Nothing
        Dim cmd As SqlCommand = Nothing
        Dim strSQL As String = String.Empty
        'Dim da As SqlDataAdapter
        'Dim ds As DataSet = Nothing
        'Dim dt As DataTable = Nothing

        conn = New SqlConnection(Common.GetConnString())
        conn.Open()

        cmd = New SqlCommand(strSQL, conn)

        strSQL = "delete from eventSectors where eventId=" & eventId

        cmd.CommandText = strSQL
        cmd.CommandType = CommandType.Text
        cmd.ExecuteNonQuery()


        conn.Dispose()
        conn = Nothing
        cmd = Nothing

        Return True
    End Function



    'for sector landing page
    Public Shared Function getEventDetailsBySector(ByVal sector As String) As DataTable
        Dim conn As SqlConnection = Nothing
        Dim cmd As SqlCommand = Nothing
        Dim strSQL As String = String.Empty
        Dim da As SqlDataAdapter
        Dim ds As DataSet = Nothing
        Dim dt As DataTable = Nothing

        conn = New SqlConnection(Common.GetConnString())
        conn.Open()

        cmd = New SqlCommand(strSQL, conn)

        strSQL = "select e.eventid, c.countryName as country, e.city, e.startDate, e.endDate, e.name, e.details from events e, eventSectors es, l_Country c " &
"where (e.sponsored=1 or e.subcommittee=1) and e.eventid=es.eventid and  c.cId= e.country and es.sectorid='" & sector & "' order by e.startDate desc"

        cmd.CommandText = strSQL
        cmd.CommandType = CommandType.Text
        da = New SqlDataAdapter(cmd)
        ds = New DataSet
        ds.CaseSensitive = False

        da.Fill(ds)
        dt = ds.Tables(0)

        conn.Dispose()
        conn = Nothing
        cmd = Nothing
        da = Nothing
        ds = Nothing

        Return dt
    End Function

    'for event year list view
    Public Shared Function GetEventsByYearAndSectorAndType(ByVal myYear As String, ByVal mySector As String, ByVal myType As String) As DataTable
        Dim conn As SqlConnection = Nothing
        Dim cmd As SqlCommand = Nothing
        Dim strSQL As String = String.Empty
        Dim da As SqlDataAdapter
        Dim ds As DataSet = Nothing
        Dim dt As DataTable = Nothing

        conn = New SqlConnection(Common.GetConnString())
        conn.Open()

        cmd = New SqlCommand(strSQL, conn)

        '     strSQL = "select distinct e.eventid, c.partnercountry as country, e.city, e.startDate, e.endDate, e.name, e.details from events e, eventSectors es, l_PartnerCountry c " & _
        '" where e.eventid=es.eventid and  c.pcId= e.country "

        strSQL = "select distinct e.eventid, c.countryname as country, e.city, e.startDate, e.endDate, e.name, e.details from events e, eventSectors es, l_Country c " &
   " where e.eventid=es.eventid and  c.cId= e.country "

        If (mySector.Length > 0) Then
            mySector = Common.StripMetaChars(mySector)
            strSQL = strSQL & " and es.sectorid='" & mySector & "'"
        End If

        If (myYear.Length > 0) Then
            Dim iYear = 0
            If (Integer.TryParse(myYear, 0)) Then iYear = CInt(myYear)

            strSQL = strSQL & " and datepart(year, e.startdate)=" & iYear
        End If

        If (myType.Length > 0) Then
            If (myType = "subcommittee") Then
                strSQL = strSQL & " and e.subcommittee=1"
            End If

            If (myType = "sponsored") Then
                strSQL = strSQL & " and e.sponsored=1"
            End If

            If (myType = "related") Then
                strSQL = strSQL & " and e.related=1"
            End If
        End If

        strSQL = strSQL & " order by e.startDate desc "


        cmd.CommandText = strSQL
        cmd.CommandType = CommandType.Text
        da = New SqlDataAdapter(cmd)
        ds = New DataSet
        ds.CaseSensitive = False

        da.Fill(ds)
        dt = ds.Tables(0)

        conn.Dispose()
        conn = Nothing
        cmd = Nothing
        da = Nothing
        ds = Nothing

        Return dt
    End Function



    Public Shared Function getEventDetailsBySectorAndCountry(ByVal sector As String, ByVal countryId As String) As DataTable
        Dim conn As SqlConnection = Nothing
        Dim cmd As SqlCommand = Nothing
        Dim strSQL As String = String.Empty
        Dim da As SqlDataAdapter
        Dim ds As DataSet = Nothing
        Dim dt As DataTable = Nothing

        conn = New SqlConnection(Common.GetConnString())
        conn.Open()

        cmd = New SqlCommand(strSQL, conn)

        '        strSQL = "select e.eventid, c.partnercountry as country, e.city, e.startDate, e.endDate, e.name, e.details from events e, eventSectors es, l_PartnerCountry c " & _
        '"where e.sponsored=1 and e.subcommittee=1 and e.eventid=es.eventid and  c.pcId= e.country and es.sectorid='" & sector & "' and e.country=" & countryId


        strSQL = "select e.eventid, c.countryName as country, e.city, e.startDate, e.endDate, e.name, e.details from events e, eventSectors es, l_Country c " &
"where (e.sponsored=1 or  e.subcommittee=1) and e.eventid=es.eventid and  c.cId= e.country and es.sectorid='" & sector & "' and e.country=" & countryId & " order by e.startDate desc"


        cmd.CommandText = strSQL
        cmd.CommandType = CommandType.Text
        da = New SqlDataAdapter(cmd)
        ds = New DataSet
        ds.CaseSensitive = False

        da.Fill(ds)
        dt = ds.Tables(0)

        conn.Dispose()
        conn = Nothing
        cmd = Nothing
        da = Nothing
        ds = Nothing

        Return dt
    End Function


    Public Shared Function getEventDetailsByCountry(ByVal countryId As String) As DataTable
        Dim conn As SqlConnection = Nothing
        Dim cmd As SqlCommand = Nothing
        Dim strSQL As String = String.Empty
        Dim da As SqlDataAdapter
        Dim ds As DataSet = Nothing
        Dim dt As DataTable = Nothing

        conn = New SqlConnection(Common.GetConnString())
        conn.Open()

        cmd = New SqlCommand(strSQL, conn)

        '        strSQL = "select e.eventid, c.partnercountry as country, e.city, e.startDate, e.endDate, e.name, e.details from events e, eventSectors es, l_PartnerCountry c " & _
        '"where e.sponsored=1 and e.subcommittee=1 and e.eventid=es.eventid and  c.pcId= e.country and es.sectorid='" & sector & "' and e.country=" & countryId


        strSQL = "select eventid, country, city, startdate, enddate, name, details, startdateday, startdatemonth,enddateday, enddatemonth, contractedDetails, enddateyear from (select top 3 e.eventid, c.countryName as country, e.city, e.startDate, e.endDate, e.name, e.details,cast(day(startDate) as varchar) as StartDateDay, cast(month(startDate) as varchar) as StartDateMonth, cast(day(endDate) as varchar) As EndDateDay, cast(datename(month,endDate) as varchar) as EndDateMonth, LEFT(LTRIM([dbo].udf_StripHTML([details])),115) as contractedDetails, year(enddate) as enddateyear from events e, l_Country c " &
"where (e.sponsored=1 or  e.subcommittee=1) and  c.cId= e.country and c.countryName='" & countryId & "' order by e.startDate desc) as recent UNION select  e.eventid, 'Partnership-wide' as country, e.city, e.startDate, e.endDate, e.name, e.details,cast(day(startDate) as varchar) as StartDateDay, cast(month(startDate) as varchar) as StartDateMonth, cast(day(endDate) as varchar) As EndDateDay, cast(datename(month,endDate) as varchar) as EndDateMonth, LEFT(LTRIM([dbo].udf_StripHTML([details])),115) as contractedDetails, year(enddate) as enddateyear from events e where e.eventid = 539 order by startDate desc"


        cmd.CommandText = strSQL
        cmd.CommandType = CommandType.Text
        da = New SqlDataAdapter(cmd)
        ds = New DataSet
        ds.CaseSensitive = False

        da.Fill(ds)
        dt = ds.Tables(0)

        conn.Dispose()
        conn = Nothing
        cmd = Nothing
        da = Nothing
        ds = Nothing

        Return dt
    End Function
    Public Function getEventsbySector(ByVal sector As String, ByVal filter As String) As DataTable
        Dim strQuery As String = "SELECT e.eventId, e.name, YEAR(e.startDate) AS Year, c.eventCountryID, c.CountryName, lu_sector.Sector, COUNT(getResourceList.resourceID) AS countofResources " &
                                "    FROM     events e INNER JOIN" &
                                "    lu_country c ON e.country = c.eventCountryID INNER JOIN " &
                                "    eventSectors ON e.eventId = eventSectors.eventId INNER JOIN lu_sector on eventSectors.sectorID = lu_sector.SectorAbbr" &
                                "    LEFT OUTER JOIN getResourceList on e.eventID = getResourceList.eventID" &
                                "    GROUP BY e.eventId, e.name, YEAR(e.startDate), c.eventCountryID, c.CountryName, lu_sector.Sector " &
                                "    HAVING (lu_sector.sector like '%" & sector & "%') and " & filter & " order by name"
        Dim cmd As New SqlCommand(strQuery)
        'Debug.WriteLine(strQuery)
        Dim dt As DataTable = GetData(cmd)
        Return dt
    End Function

    Public Function getEventDetailsbyID(ByVal eventID As String) As DataTable
        Dim strQuery As String = "SELECT events.eventId, events.name, YEAR(events.startDate) AS Year, lu_country.CountryName, events.city, events.country, events.startDate, events.endDate, events.Sponsored, " &
                " events.Subcommittee, events.related, events.details, eventSectors.sectorId " &
                " FROM     events INNER JOIN " &
                  " lu_country ON events.country = lu_country.eventCountryID INNER JOIN " &
                  " eventSectors ON events.eventId = eventSectors.eventId " &
                  " where events.eventid =" & eventID
        Dim cmd As New SqlCommand(strQuery)
        'Debug.WriteLine(strQuery)
        Dim dt As DataTable = GetData(cmd)
        Return dt
    End Function

    Public Function updateEventDetailsbyID(ByVal eventID As String, ByVal name As String, ByVal Subcommittee As String, ByVal related As String, ByVal details As String, ByVal startDate As String, ByVal city As String, ByVal countryid As String, ByVal endDate As String, ByVal sponsored As String) As DataTable
        Dim strQuery As String = "UPDATE events set name='" & name & "', startDate='" & startDate & "', city='" & city & "', country=" & countryid & ", endDate='" & endDate & "', Sponsored=" & sponsored & ", " &
                " Subcommittee=" & Subcommittee & ", related=" & related & ", details='" & details & "' " &
                " where events.eventid =" & eventID
        Dim cmd As New SqlCommand(strQuery)

        Dim dt As DataTable = GetData(cmd)
        Return dt
    End Function

    Public Function getEventLocations()
        Dim strQuery As String = "select distinct events.country, countryname from events inner join lu_country on events.country = lu_country.eventCountryID order by countryname"
        Dim cmd As New SqlCommand(strQuery)
        'Debug.WriteLine(strQuery)
        Dim dt As DataTable = GetData(cmd)
        Return dt
    End Function

    Public Function getEvents() As DataTable
        Dim strQuery As String = "select eventID, name, year(startdate) as Year from events order by name"
        Dim cmd As New SqlCommand(strQuery)
        'Debug.Print strQuery
        Dim dt As DataTable = GetData(cmd)
        Return dt
    End Function

    Public Function getEventsbyCountry(ByVal countryname As String) As DataTable
        Dim strQuery As String = "SELECT  events.eventId, events.name, YEAR(events.startDate) AS Year, lu_country.eventCountryID, lu_country.CountryName," &
                 " Sectors = STUFF((select ', ' + sectorid from (select events.eventid, sectorid from events inner join eventsectors on events.eventid = eventsectors.eventid) as sectors where sectors.eventid = events.eventid " &
                                " for XML Path ('')),1,1,'')" &
                                "    FROM     events INNER JOIN" &
                                "    lu_country ON events.country = lu_country.eventCountryID " &
                                "    where countryname = '" & countryname & "' order by year desc, name"
        Dim cmd As New SqlCommand(strQuery)
        'Debug.Print strQuery
        Dim dt As DataTable = GetData(cmd)
        Return dt
    End Function

    Public Function getEventsbyKeyword(ByVal keyword As String, ByVal filter As String) As DataTable
        Dim strQuery As String = "SELECT events.eventId, events.name, YEAR(events.startDate) AS Year, lu_country.eventCountryID, lu_country.CountryName, lu_sector.Sector " &
                                "    FROM     events INNER JOIN" &
                                "    lu_country ON events.country = lu_country.eventCountryID INNER JOIN " &
                                "    eventSectors ON events.eventId = eventSectors.eventId INNER JOIN lu_sector on eventSectors.sectorID = lu_sector.SectorAbbr" &
                                "    where (events.name like '%" & keyword & "%' or lu_country.Countryname like '%" & keyword & "%') and " & filter & " order by year desc, name"
        Dim cmd As New SqlCommand(strQuery)
        'Debug.WriteLine(strQuery)
        Dim dt As DataTable = GetData(cmd)
        Return dt
    End Function

    Public Function showEventResourcesforEditing(ByVal eventid As String)

    End Function

    Public Function showEventResources(ByVal eventid As String, ByRef firstsector As String, Optional ByVal showShortName As String = "No", Optional ByVal status As String = "final")
        Dim strResources As String = ""
        Dim myLabel As String = ""
        Dim data As New clsResourceDAO()
        Try
            Dim resourcesDT As DataTable = data.getEventResourcesbyEventID(eventid, "1=1", status)
            Dim halfresources As Integer
            halfresources = resourcesDT.Rows.Count / 2


            If resourcesDT Is Nothing Or resourcesDT.Rows.Count < 1 Then
                'phResources.Visible = False

            Else
                'Debug.WriteLine(resourcesDT.Rows.Count & " row count")

                strResources += "<h3>Event Resources</h3>"
                Dim grouping As String = ""
                For Each row As DataRow In resourcesDT.Rows
                    Dim rowcount As Integer = 1
                    If Len(row("grouping").ToString) > 0 And row("grouping").ToString <> grouping Then
                        strResources += "<h4>" & row("grouping").ToString & "</h4>"
                        grouping = row("grouping").ToString
                    End If

                    Dim fileUrl As String = ""
                    Dim fileImgPath As String = ""
                    fileImgPath = getresourceImageName(row("resourceLink").ToString, row("resourceImage").ToString)
                    Dim curFile As String = HttpContext.Current.Server.MapPath(fileImgPath)

                    If System.IO.File.Exists(curFile) = True Then
                        fileUrl = "<img src=""" + fileImgPath + """  style='width:100%;' alt=" + row("resourceName").ToString + "/>"
                    Else
                        Dim r As New Random()
                        Dim n As Integer = r.Next(4)

                        fileUrl = "<img src=""/assets/images/resource_feature_" + LCase(Replace(getSectorEventURL(firstsector), " ", "")) + n.ToString + ".JPG"" style='width:100%;' alt = '" + firstsector + " Thumbnail'  />"
                    End If
                    Dim fileinfo As String = ""
                    If row("filetype").ToString <> "" Then
                        fileinfo += "(" + row("filetype").ToString
                    Else
                        fileinfo += "("
                    End If
                    If row("resourcesize").ToString <> "" Then
                        fileinfo += ", " + row("resourceSize").ToString
                    End If
                    If row("resourcepages").ToString <> "" Then
                        fileinfo += ", " + row("resourcepages").ToString
                        If row("resourcepages") = 1 Then
                            fileinfo += "p"
                        Else
                            fileinfo += "pp"
                        End If
                    End If
                    If fileinfo = "(" Then
                        fileinfo = ""
                    Else
                        fileinfo += ")"
                    End If


                    If showShortName = "Yes" Then
                        strResources += "<div class='row py-3'><div class='col-sm-3'>" + fileUrl + "</div><div class='col-sm-6'>" + "<a href='" + row("resourceLink").ToString + "' target='blank' >" + row("resourceName").ToString + "</a><br />" + fileinfo + "</div></div>"
                    Else
                        strResources += "<div class='row  py-3'><div class='col-sm-3'>" + fileUrl + "</div><div class='col-sm-6'>" + "<a href='" + row("resourceLink").ToString + "' target='blank' >" + row("resourceName").ToString + "</a><br />" + fileinfo + "</div></div>"
                    End If

                    'If rowcount = halfresources Then
                    '    strResources += "</div><div Class='col-md-6 mb-3'>"
                    'End If
                    rowcount = rowcount + 1
                Next
                strResources += ""
            End If
        Catch
            Return ""
        End Try
        Return strResources
    End Function


    Public Function showEventResourceList(ByVal eventid As String, ByRef firstsector As String, Optional ByVal showShortName As String = "No", Optional ByVal status As String = "final")
        Dim strResources As String = ""
        Dim myLabel As String = ""
        Dim data As New clsResourceDAO()
        Try
            Dim resourcesDT As DataTable = data.getEventResourcesbyEventID(eventid, "1=1", status)
            'Dim halfresources As Integer
            'halfresources = resourcesDT.Rows.Count / 2


            If resourcesDT Is Nothing Or resourcesDT.Rows.Count < 1 Then
                'phResources.Visible = False

            Else
                'Debug.WriteLine(resourcesDT.Rows.Count & " row count")
                strResources += "<h3>Event Resources</h3>" & Chr(10)
                strResources += "<table id='relatedresources' class='table hover'><thead>" & Chr(10)
                strResources += "<tr><th>Resource Image</th><th>Resource</th><th></th><th>Year</th></tr>" & Chr(10)
                strResources += "</thead>" & Chr(10)

                Dim grouping As String = ""
                For Each row As DataRow In resourcesDT.Rows
                    Dim rowcount As Integer = 1
                    'If Len(row("grouping").ToString) > 0 And row("grouping").ToString <> grouping Then
                    '    strResources += "<h4>" & row("grouping").ToString & "</h4>"
                    '    grouping = row("grouping").ToString
                    'End If

                    Dim fileUrl As String = ""
                    Dim fileImgPath As String = ""

                    fileImgPath = getresourceImageName(row("resourceLink").ToString, row("resourceImage").ToString)
                    Dim curFile As String = HttpContext.Current.Server.MapPath(fileImgPath)

                    If System.IO.File.Exists(curFile) = True Then
                        fileUrl = "<img src=""" + fileImgPath + """  style='width:100px;' alt=" + row("resourceName").ToString + "/>"
                    Else

                        Dim n As Integer = GetRandom(0, 4)


                        fileUrl = "<img src=""/assets/images/resource_feature_" + LCase(Replace(getSectorEventURL(firstsector), " ", "")) + n.ToString + ".JPG"" style='width:100px;' alt = '" + firstsector + " Thumbnail'  />"
                    End If
                    Dim fileinfo As String = ""
                    If row("filetype").ToString <> "" Then
                        fileinfo += "(" + row("filetype").ToString
                    Else
                        fileinfo += "("
                    End If
                    If row("resourcesize").ToString <> "" Then
                        fileinfo += ", " + row("resourceSize").ToString
                    End If
                    If row("resourcepages").ToString <> "" Then
                        fileinfo += ", " + row("resourcepages").ToString
                        If row("resourcepages") = 1 Then
                            fileinfo += "p"
                        Else
                            fileinfo += "pp"
                        End If
                    End If
                    If fileinfo = "(" Then
                        fileinfo = ""
                    Else
                        fileinfo += ")"
                    End If


                    'If showShortName = "Yes" Then
                    'strResources += "<tr><td>" + fileUrl + "</td><td>" + "<a href='" + row("resourceLink").ToString + "' target='blank' >" + row("resourceName").ToString + "</a><br />" + fileinfo + "</td>"
                    'Else
                    strResources += "<tr><td>" + fileUrl + "</td><td>" + "<a href='/resources/details.aspx?resourceid=" + row("resourceid").ToString + "' target='blank' >" + row("resourceName").ToString + "</a><br />" + fileinfo + "</td>"
                    strResources += "<td>" + row("grouping").ToString + "</td>"
                    strResources += "<td>" + row("year").ToString + "</td>"
                    strResources += "</tr>"
                    'End If

                    'If rowcount = halfresources Then
                    '    strResources += "</div><div Class='col-md-6 mb-3'>"
                    'End If
                    rowcount = rowcount + 1
                Next
                strResources += "</table>"
            End If
        Catch
            Return ""
        End Try
        Return strResources
    End Function


    'Public Shared Function getEventsForToolResource() As DataTable
    '    Dim conn As SqlConnection = Nothing
    '    Dim cmd As SqlCommand = Nothing
    '    Dim strSQL As String
    '    Dim da As SqlDataAdapter
    '    Dim ds As DataSet = Nothing
    '    Dim dt As DataTable = Nothing

    '    conn = New SqlConnection(Common.GetConnString())
    '    conn.Open()

    '    cmd = New SqlCommand(strSQL, conn)

    '    strSQL = "select * from events where sponsored=1 and subcommittee=1 order by startDate"

    '    cmd.CommandText = strSQL
    '    cmd.CommandType = CommandType.Text
    '    da = New SqlDataAdapter(cmd)
    '    ds = New DataSet
    '    ds.CaseSensitive = False

    '    da.Fill(ds)
    '    dt = ds.Tables(0)

    '    conn.Dispose()
    '    conn = Nothing
    '    cmd = Nothing
    '    da = Nothing
    '    ds = Nothing

    '    Return dt
    'End Function

    'Public Shared Function getEventsByYear(ByVal myYear As String) As DataTable
    '    Dim conn As SqlConnection = Nothing
    '    Dim cmd As SqlCommand = Nothing
    '    Dim strSQL As String = String.Empty
    '    Dim da As SqlDataAdapter
    '    Dim ds As DataSet = Nothing
    '    Dim dt As DataTable = Nothing

    '    conn = New SqlConnection(Common.GetConnString())
    '    conn.Open()

    '    cmd = New SqlCommand(strSQL, conn)

    '    strSQL = "select * from events where datepart(year, startdate)=" & myYear & " order by startDate desc"

    '    cmd.CommandText = strSQL
    '    cmd.CommandType = CommandType.Text
    '    da = New SqlDataAdapter(cmd)
    '    ds = New DataSet
    '    ds.CaseSensitive = False

    '    da.Fill(ds)
    '    dt = ds.Tables(0)

    '    conn.Dispose()
    '    conn = Nothing
    '    cmd = Nothing
    '    da = Nothing
    '    ds = Nothing

    '    Return dt
    'End Function

    'for event part in the country detail page
    ' Public Shared Function getEventsByCountry(ByVal myCountry As String) As DataTable
    '     Dim conn As SqlConnection
    '     Dim cmd As SqlCommand
    '     Dim strSQL As String
    '     Dim da As SqlDataAdapter
    '     Dim ds As DataSet
    '     Dim dt As DataTable

    '     conn = New SqlConnection(Common.GetConnString())
    '     conn.Open()

    '     cmd = New SqlCommand(strSQL, conn)

    '     '     strSQL = "select e.eventid, c.partnercountry as country, e.city, e.startDate, e.endDate, e.name, e.details from events e, l_PartnerCountry c " & _
    '     '" where c.pcId= e.country and e.country=" & myCountry

    '     strSQL = "select e.eventid, c.countryName as country, e.city, e.startDate, e.endDate, e.name, e.details from events e, l_Country c " & _
    '" where c.cId= e.country and e.country=" & myCountry


    '     cmd.CommandText = strSQL
    '     cmd.CommandType = CommandType.Text
    '     da = New SqlDataAdapter(cmd)
    '     ds = New DataSet
    '     ds.CaseSensitive = False

    '     da.Fill(ds)
    '     dt = ds.Tables(0)

    '     conn.Dispose()
    '     conn = Nothing
    '     cmd = Nothing
    '     da = Nothing
    '     ds = Nothing

    '     Return dt
    ' End Function

    '    Public Shared Function getEventDetailsByCountry(ByVal countryId As String) As DataTable
    '        Dim conn As SqlConnection
    '        Dim cmd As SqlCommand
    '        Dim strSQL As String
    '        Dim da As SqlDataAdapter
    '        Dim ds As DataSet
    '        Dim dt As DataTable

    '        conn = New SqlConnection(Common.GetConnString())
    '        conn.Open()

    '        cmd = New SqlCommand(strSQL, conn)

    '        '        strSQL = "select e.eventid, c.partnercountry as country, e.city, e.startDate, e.endDate, e.name, e.details from events e, eventSectors es, l_PartnerCountry c " & _
    '        '"where e.sponsored=1 and e.subcommittee=1 and e.eventid=es.eventid and  c.pcId= e.country and e.country=" & countryId

    '        strSQL = "select e.eventid, c.countryName as country, e.city, e.startDate, e.endDate, e.name, e.details from events e, eventSectors es, l_Country c " & _
    '"where (e.sponsored=1 or e.subcommittee=1) and e.eventid=es.eventid and  c.cId= e.country and e.country=" & countryId


    '        cmd.CommandText = strSQL
    '        cmd.CommandType = CommandType.Text
    '        da = New SqlDataAdapter(cmd)
    '        ds = New DataSet
    '        ds.CaseSensitive = False

    '        da.Fill(ds)
    '        dt = ds.Tables(0)

    '        conn.Dispose()
    '        conn = Nothing
    '        cmd = Nothing
    '        da = Nothing
    '        ds = Nothing

    '        Return dt
    '    End Function


    'Public Shared Function getSectorDescBySector(ByVal sector As String) As String
    '    Dim conn As SqlConnection
    '    Dim cmd As SqlCommand
    '    Dim strSQL As String
    '    Dim da As SqlDataAdapter
    '    Dim ds As DataSet
    '    Dim dt As DataTable
    '    Dim ret As String

    '    conn = New SqlConnection(Common.GetConnString())
    '    conn.Open()

    '    cmd = New SqlCommand(strSQL, conn)

    '    strSQL = "select sectordesc  from l_sector where sector='" & sector & "'"

    '    cmd.CommandText = strSQL
    '    cmd.CommandType = CommandType.Text
    '    da = New SqlDataAdapter(cmd)
    '    ds = New DataSet
    '    ds.CaseSensitive = False

    '    da.Fill(ds)
    '    dt = ds.Tables(0)

    '    ret = dt.Rows(0)("sectorDesc")

    '    conn.Dispose()
    '    conn = Nothing
    '    cmd = Nothing
    '    da = Nothing
    '    ds = Nothing

    '    Return ret
    'End Function


    Public Shared Function ShowEventList(dt As DataTable, Optional ByVal details As Boolean = False) As String


        Dim eventId As String
        Dim startDateValue As String
        Dim endDateValue As String
        Dim nameValue As String
        Dim phString As String = "<table id='recentevents' class='table hover'><thead>" &
               "<tr><th>&nbsp;</th><th>Name</th><th>Date</th><th>Location</th><th>Sector</th><th>Link</th></tr>" &
"</thead>"

        Dim sectorValue As String
        Dim detailsValue As String

        Dim endTitle As String


        endTitle = "</tr>"

        Dim x

        For x = 0 To dt.Rows.Count - 1

            Dim startdate = dt.Rows(x)("startDate")
            Dim locationString = dt.Rows(x)("city")


            eventId = dt.Rows(x)("eventId")
            nameValue = dt.Rows(x)("name")
            Dim namevaltext As String = ""
            namevaltext = "<a href=""/events/details.aspx?eventid=" & eventId & """ alt=""Event details"">" & nameValue & "</a>"
            If Len(dt.Rows(x)("state").ToString) > 0 Then
                locationString += ", " & dt.Rows(x)("state")
            End If
            If clsLookup.GetCountryNameByCId(dt.Rows(x)("country")) = "N/A" Then

            Else
                locationString += ", " & clsLookup.GetCountryNameByCId(dt.Rows(x)("country")) & "" & Chr(10)
            End If


            startDateValue = Common.getDateFormatDisplay(dt.Rows(x)("startDate"))
            endDateValue = Common.getDateFormatDisplay(dt.Rows(x)("endDate"))
            'detailsValue = "<p>" & replaceHTMLTags(Left(dt.Rows(x)("details"), 200) & "...") & "</p>" & Chr(10)
            detailsValue = "<p class='detailspara'>" & replaceHTMLTags(dt.Rows(x)("details")) & "</p>" & Chr(10)


            'get sector desc 
            Dim sectDescStr As String = ""
            Dim firstsector As String = ""
            Dim sectors As DataTable
            sectors = clsEventDAO.getEventSectorsByEventId(eventId)
            Dim y
            For y = 0 To sectors.Rows.Count - 1
                Dim desc As String
                desc = sectors.Rows(y)("sectorDesc")
                If y = 0 Then
                    sectDescStr = desc
                    firstsector = desc
                Else
                    sectDescStr += ", " & desc
                End If
            Next
            sectorValue = sectDescStr



            '// feature image
            Dim fileUrl As String = ""


            Try
                Dim curFile As String = HttpContext.Current.Server.MapPath(dt.Rows(x)("photo_url").ToString)
                Dim curfileAlt As String = HttpContext.Current.Server.MapPath("/assets/images/" & dt.Rows(x)("photo_url"))
                If System.IO.File.Exists(curFile) = True Then
                    fileUrl += "<a href=""/events/details.aspx?eventid=" & eventId & """ alt=""Event details""><img src=""" + dt.Rows(x)("photo_url") + """  style='width:100px;' alt='" + firstsector + "' title='Featured Image for " + dt.Rows(x)("name").ToString + "'/>" & Chr(10)

                ElseIf System.IO.File.Exists(curfileAlt) = True Then
                    fileUrl += "<a href=""/events/details.aspx?eventid=" & eventId & """ alt=""Event details""><img src=""/assets/images/" + dt.Rows(x)("photo_url") + """  style='width:100px;' alt='" + firstsector + "' title='Featured Image for " + dt.Rows(x)("name").ToString + "'/>" & Chr(10)

                Else
                    Dim n As Integer = GetRandom(0, 4)

                    fileUrl += "<a href=""/events/details.aspx?eventid=" & eventId & """ alt=""Event details""><img src=""/assets/images/event_feature_" + getSectorEventURL(firstsector) + n.ToString + ".JPG""  style='width:100px;' alt='" + firstsector + "' title='Featured Image for " + dt.Rows(x)("name").ToString + "'/>" & Chr(10)

                End If
            Catch ex As System.Net.WebException
                fileUrl += "<a href=""/events/details.aspx?eventid=" & eventId & """ alt=""Event details""><img src=""" + dt.Rows(x)("photo_url") + """  style='width:100px;' alt='" + firstsector + "' title='Featured Image for " + dt.Rows(x)("name").ToString + "'/>" & Chr(10)
            End Try


            phString += "<tr><td>" & Chr(10)
            phString += fileUrl
            phString += "</a><td>" & Chr(10)
            phString += "" & Chr(10)

            If details = True Then
                phString += namevaltext & detailsValue & "</td>" & Chr(10)
            Else

                phString += namevaltext & "</td>" & Chr(10)
            End If





            Dim datestring As String = ""
            Dim thisstartdate = dt.Rows(x)("startDate")
            Dim thisenddate = dt.Rows(x)("endDate")

            datestring = "" & Day(thisstartdate) 'Common.getDateFormatDisplay(eventObj.getStartDate())
            If Month(thisstartdate).ToString <> Month(thisenddate).ToString Then
                datestring += " " & Format(CDate(thisstartdate), "MMMM")
            End If
            If Day(thisenddate) <> Day(thisstartdate) Then
                datestring += "&ndash;" & Day(thisenddate)
            End If
            datestring += " " & Format(CDate(thisenddate), "MMMM yyyy")

            phString += "<td>" & datestring & "</td>" & Chr(10)
            phString += "<td>" & locationString & "</td>" & Chr(10)
            phString += "<td>" & sectDescStr & "</td>" & Chr(10)
            phString += "<td> <a href = '/events/details.aspx?eventid=" & eventId & "' class='btn btn-outline-primary'>View Details</a>" & Chr(10)

            'If Not CookieValue = "user" Then
            '    'user is an administrator
            '    phString += "<a href='/gmi-admin/eventdetails.aspx?eventid=" & eventId & "' class='btn btn-outline-danger'>Edit</a>" & Chr(10)
            'End If
            phString += "</td>" & endTitle & Chr(10)



        Next

        If (dt.Rows.Count > 0) Then
            'CatchMsg += "; no rows"
        End If
        phString += " </table>"

        Return phString

    End Function



    Public Shared Function ShowEventTable(dt As DataTable) As String


        Dim eventId As String
        Dim startDateValue As String
        Dim endDateValue As String
        Dim nameValue As String
        Dim phString As String = ""

        Dim sectorValue As String
        Dim detailsValue As String

        Dim endTitle As String


        endTitle = "</tr>"

        Dim x

        For x = 0 To dt.Rows.Count - 1

            Dim startdate = dt.Rows(x)("startDate")
            Dim locationString = dt.Rows(x)("city")


            eventId = dt.Rows(x)("eventId")
            nameValue = dt.Rows(x)("name")
            Dim namevaltext As String = ""
            namevaltext = "<a href=""/events/details.aspx?eventid=" & eventId & """ alt=""Event details"">" & nameValue & "</a>"
            If Len(dt.Rows(x)("state").ToString) > 0 Then
                locationString += ", " & dt.Rows(x)("state")
            End If
            If clsLookup.GetCountryNameByCId(dt.Rows(x)("country")) = "N/A" Then

            Else
                locationString += ", " & clsLookup.GetCountryNameByCId(dt.Rows(x)("country")) & "" & Chr(10)
            End If


            startDateValue = Common.getDateFormatDisplay(dt.Rows(x)("startDate"))
            endDateValue = Common.getDateFormatDisplay(dt.Rows(x)("endDate"))




            'get sector desc 
            Dim sectDescStr As String = ""
            Dim firstsector As String = ""
            Dim sectors As DataTable
            sectors = clsEventDAO.getEventSectorsByEventId(eventId)
            Dim y
            For y = 0 To sectors.Rows.Count - 1
                Dim desc As String
                desc = sectors.Rows(y)("sectorDesc")
                If y = 0 Then
                    sectDescStr = desc
                    firstsector = desc
                Else
                    sectDescStr += ", " & desc
                End If
            Next
            sectorValue = sectDescStr



            '// feature image
            Dim fileUrl As String = ""


            Try
                Dim curFile As String = HttpContext.Current.Server.MapPath(dt.Rows(x)("photo_url").ToString)
                Dim curfileAlt As String = HttpContext.Current.Server.MapPath("/assets/images/" & dt.Rows(x)("photo_url"))
                If System.IO.File.Exists(curFile) = True Then
                    fileUrl += "<a href=""/events/details.aspx?eventid=" & eventId & """ alt=""Event details""><img src=""" + dt.Rows(x)("photo_url") + """  style='width:100px;' alt='" + firstsector + "' title='Featured Image for " + dt.Rows(x)("name").ToString + "'/>" & Chr(10)

                ElseIf System.IO.File.Exists(curfileAlt) = True Then
                    fileUrl += "<a href=""/events/details.aspx?eventid=" & eventId & """ alt=""Event details""><img src=""/assets/images/" + dt.Rows(x)("photo_url") + """  style='width:100px;' alt='" + firstsector + "' title='Featured Image for " + dt.Rows(x)("name").ToString + "'/>" & Chr(10)

                Else
                    Dim n As Integer = GetRandom(0, 4)

                    fileUrl += "<a href=""/events/details.aspx?eventid=" & eventId & """ alt=""Event details""><img src=""/assets/images/event_feature_" + getSectorEventURL(firstsector) + n.ToString + ".JPG""  style='width:100px;' alt='" + firstsector + "' title='Featured Image for " + dt.Rows(x)("name").ToString + "'/>" & Chr(10)

                End If
            Catch ex As System.Net.WebException
                fileUrl += "<a href=""/events/details.aspx?eventid=" & eventId & """ alt=""Event details""><img src=""" + dt.Rows(x)("photo_url") + """  style='width:100px;' alt='" + firstsector + "' title='Featured Image for " + dt.Rows(x)("name").ToString + "'/>" & Chr(10)
            End Try


            phString += "<tr><td>" & Chr(10)
            phString += fileUrl
            phString += "</a><td>" & Chr(10)
            phString += "" & Chr(10)


            phString += namevaltext & "</td>" & Chr(10)




            Dim datestring As String = ""
            Dim thisstartdate = dt.Rows(x)("startDate")
            Dim thisenddate = dt.Rows(x)("endDate")

            datestring = "" & Day(thisstartdate) 'Common.getDateFormatDisplay(eventObj.getStartDate())
            If Month(thisstartdate).ToString <> Month(thisenddate).ToString Then
                datestring += " " & Format(CDate(thisstartdate), "MMMM")
            End If
            If Day(thisenddate) <> Day(thisstartdate) Then
                datestring += "&ndash;" & Day(thisenddate)
            End If
            datestring += " " & Format(CDate(thisenddate), "MMMM yyyy")

            phString += "<td>" & datestring & "</td>" & Chr(10)
            phString += "<td>" & locationString & "</td>" & Chr(10)
            phString += "<td>" & sectDescStr & "</td>" & Chr(10)


            'If Not CookieValue = "user" Then
            '    'user is an administrator
            '    phString += "<a href='/gmi-admin/eventdetails.aspx?eventid=" & eventId & "' class='btn btn-outline-danger'>Edit</a>" & Chr(10)
            'End If
            phString += "</td>" & endTitle & Chr(10)



        Next

        If (dt.Rows.Count > 0) Then
            'CatchMsg += "; no rows"
        End If


        Return phString

    End Function


    Public Shared Function ShowEvents(dt As DataTable) As String


        Dim eventId As String
        Dim startDateValue As String
        Dim endDateValue As String
        Dim nameValue As String
        Dim phString As String = ""

        Dim sectorValue As String
        Dim detailsValue As String

        Dim endTitle As String


        endTitle = "</div></div>"

        Dim x

        For x = 0 To dt.Rows.Count - 1
            Dim startdate = dt.Rows(x)("startDate")
            Dim locationString = dt.Rows(x)("city")


            eventId = dt.Rows(x)("eventId")
            nameValue = dt.Rows(x)("name")
            Dim namevaltext As String = ""
            namevaltext = "<h3><a href=""/events/details.aspx?eventid=" & eventId & """ alt=""Event details"">" & nameValue & "</a></h3>"
            If Len(dt.Rows(x)("state").ToString) > 0 Then
                locationString += ", " & dt.Rows(x)("state")
            End If
            If clsLookup.GetCountryNameByCId(dt.Rows(x)("country")) = "N/A" Then

            Else
                locationString += ", " & clsLookup.GetCountryNameByCId(dt.Rows(x)("country")) & "</h4>" & Chr(10)
            End If


            startDateValue = Common.getDateFormatDisplay(dt.Rows(x)("startDate"))
            endDateValue = Common.getDateFormatDisplay(dt.Rows(x)("endDate"))
            'detailsValue = "<p>" & replaceHTMLTags(Left(dt.Rows(x)("details"), 400) & "...") & "</p>" & Chr(10)
            'detailsValue = "<p>" & Left(replaceHTMLTags(dt.Rows(x)("details")), 400) & "...</p>" & Chr(10)
            detailsValue = "<div class='detailspara'><p>" & dt.Rows(x)("details") & "<p></div>" & Chr(10)

            'get sector desc 
            Dim sectDescStr As String = ""
            Dim firstsector As String = ""
            Dim sectors As DataTable
            sectors = clsEventDAO.getEventSectorsByEventId(eventId)
            Dim y
            For y = 0 To sectors.Rows.Count - 1
                Dim desc As String
                desc = sectors.Rows(y)("sectorDesc")
                If y = 0 Then
                    sectDescStr = desc
                    firstsector = desc
                Else
                    sectDescStr += ", " & desc
                End If
            Next
            sectorValue = sectDescStr



            '// feature image
            Dim fileUrl As String = ""


            Try
                Dim curFile As String = System.Web.HttpContext.Current.Server.MapPath(dt.Rows(x)("photo_url").ToString)
                Dim curfileAlt As String = System.Web.HttpContext.Current.Server.MapPath("/assets/images/" & dt.Rows(x)("photo_url"))
                If System.IO.File.Exists(curFile) = True Then
                    fileUrl += "<div Class='col-sm-4'><a href=""/events/details.aspx?eventid=" & eventId & """ alt=""Event details""><img src=""" + dt.Rows(x)("photo_url") + """  style='width:100%;' alt='" + firstsector + "' title='Featured Image for " + dt.Rows(x)("name").ToString + "'/>" & Chr(10)

                ElseIf System.IO.File.Exists(curfileAlt) = True Then
                    fileUrl += "<div Class='col-sm-4'><a href=""/events/details.aspx?eventid=" & eventId & """ alt=""Event details""><img src=""/assets/images/" + dt.Rows(x)("photo_url") + """  style='width:100%;' alt='" + firstsector + "' title='Featured Image for " + dt.Rows(x)("name").ToString + "'/>" & Chr(10)

                Else
                    Dim r As New Random()
                    Dim n As Integer = r.Next(2)

                    fileUrl += "<div Class='col-sm-4'><a href=""/events/details.aspx?eventid=" & eventId & """ alt=""Event details""><img src=""/assets/images/event_feature_" + getSectorEventURL(firstsector) + n.ToString + ".JPG""  style='width:100%;' alt='" + firstsector + "' title='Featured Image for " + dt.Rows(x)("name").ToString + "'/>" & Chr(10)

                End If
            Catch ex As System.Net.WebException
                fileUrl += "<div Class='col-sm-4'><a href=""/events/details.aspx?eventid=" & eventId & """ alt=""Event details""><img src=""" + dt.Rows(x)("photo_url") + """  style='width:100%;' alt='" + firstsector + "' title='Featured Image for " + dt.Rows(x)("name").ToString + "'/>" & Chr(10)
            End Try


            phString += "<div class='row py-3'>" & Chr(10)
            phString += fileUrl
            phString += "</a></div>" & Chr(10)
            phString += "<div class='col-sm-8'>" & Chr(10)


            phString += namevaltext




            Dim datestring As String = ""
            Dim thisstartdate = dt.Rows(x)("startDate")
            Dim thisenddate = dt.Rows(x)("endDate")

            datestring = "<h4>" & Day(thisstartdate) 'Common.getDateFormatDisplay(eventObj.getStartDate())
            If Month(thisstartdate).ToString <> Month(thisenddate).ToString Then
                datestring += " " & Format(CDate(thisstartdate), "MMMM")
            End If
            If Day(thisenddate) <> Day(thisstartdate) Then
                datestring += "&ndash;" & Day(thisenddate)
            End If
            datestring += " " & Format(CDate(thisenddate), "MMMM yyyy")
            datestring += ", " & locationString & "</h4>" & Chr(10)
            phString += datestring

            phString += detailsValue & "<p> <a href = '/events/details.aspx?eventid=" & eventId & "' class='btn btn-outline-primary'>View Details</a>" & Chr(10)

            'If Not CookieValue = "user" Then
            '    'user is an administrator
            '    phString += "<a href='/gmi-admin/eventdetails.aspx?eventid=" & eventId & "' class='btn btn-outline-danger'>Edit</a>" & Chr(10)
            'End If
            phString += "</p>" & endTitle & Chr(10)



        Next

        If (dt.Rows.Count > 0) Then
            'CatchMsg += "; no rows"
        End If


        Return phString

    End Function


End Class
