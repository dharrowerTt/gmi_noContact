Imports System.IO
Imports System.Text
Imports System.Data
Imports System.Data.SqlClient



Public Class clsChallengeDAO

    Public Shared Function GetEventByEventId(ByVal gmcCode As String) As clsChallengeVO
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
        If (Integer.TryParse(gmcCode, 0)) Then
            iEventID = CInt(gmcCode)
        Else
            Return Nothing
        End If

        If (gmcCode > 2) Then
            strSQL = "select top (1) * from gmcData where gmcCode = " & gmcCode
        Else
            strSQL = "select top (1) * from gmcData order by datestamp desc"
        End If

        cmd.CommandText = strSQL
        cmd.CommandType = CommandType.Text
        da = New SqlDataAdapter(cmd)
        ds = New DataSet
        ds.CaseSensitive = False

        da.Fill(ds)
        dt = ds.Tables(0)

        Dim x As Integer
        Dim eventObj As clsChallengeVO

        If (dt.Rows.Count > 0) Then
            eventObj = New clsChallengeVO

            For x = 0 To dt.Rows.Count - 1
                eventObj.setgmcCode(dt.Rows(x)("gmcCode"))
                eventObj.setsalutation(dt.Rows(x)("salutation"))
                eventObj.setfirstName(dt.Rows(x)("firstName"))
                eventObj.setlastName(dt.Rows(x)("lastName"))
                eventObj.setemailAddress(dt.Rows(x)("emailAddress"))
                eventObj.setorganization(dt.Rows(x)("organization"))
                eventObj.setphoneNumber(dt.Rows(x)("phoneNumber"))
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

    Public Shared Function insertgmcData(ByVal gmcDataObj As clsChallengeVO) As String
        Dim conn As SqlConnection = Nothing
        Dim cmd As SqlCommand = Nothing
        Dim strSQL As String = String.Empty
        Dim fieldStr As String

        Dim oId As Object
        Dim challengeID As String = String.Empty
        Dim random As New Random()
        Dim gmcCode As Int16


        gmcCode = random.Next(1000, 9999)
        conn = New SqlConnection(Common.GetConnString())
        conn.Open()

        cmd = New SqlCommand(strSQL, conn)

        'prepare values
        fieldStr =
           "'" & gmcDataObj.getsalutation() & "', " &
        "'" & gmcDataObj.getfirstName() & "', " &
        "'" & gmcDataObj.getlastName() & "', " &
        "'" & gmcDataObj.getemailAddress() & "'," &
        "'" & gmcDataObj.getorganization() & "'," &
        "'" & gmcDataObj.getheardAbout() & "'," &
        "'" & DateTime.Now & "', " &
        "'" & gmcCode & "', " &
        "'" & gmcDataObj.getStatus() & "'"

        'fieldStr = Replace(fieldStr, "'", "''")

        strSQL = "insert into gmcData (salutation, firstName, lastName, emailAddress, organization, heardAbout, "
        strSQL += "datestamp, gmcCode, status"
        strSQL += " ) values (" & fieldStr & ")"


        cmd.CommandText = strSQL
        cmd.CommandType = CommandType.Text
        cmd.ExecuteNonQuery()

        'find the new gmcData Id
        cmd.CommandText = "SELECT SCOPE_IDENTITY() "
        oId = cmd.ExecuteScalar()

        If oId Is DBNull.Value Then
            Throw New Exception("InsertgmcData: Could not obtain gmcData id.")
        Else
            challengeID = CType(oId, String)
        End If
        'cmd.Dispose()
        conn.Dispose()
        conn = Nothing
        cmd = Nothing

        Return challengeID
    End Function

    Public Shared Function addNewGmcData(ByVal gmcDataObj As clsChallengeVO) As Boolean
        Dim conn As SqlConnection = Nothing
        Dim cmd As SqlCommand = Nothing
        Dim strSQL As String = String.Empty
        Dim fieldStr As String


        Dim challengeID As String = String.Empty

        conn = New SqlConnection(Common.GetConnString())
        conn.Open()

        cmd = New SqlCommand(strSQL, conn)

        'prepare values
        fieldStr = "type='" & gmcDataObj.gettitleQ() & "', " &
            "actionType= '" & Left(gmcDataObj.getactionTypeQ(), 100) & "'," &
            "partnerInfo='" & gmcDataObj.getpartnerQ() & "', " &
            "whereInfo= '" & gmcDataObj.getwhereQ() & "'," &
            "actionInfo= '" & gmcDataObj.getstyleQ() & "'," &
            "progressInfo= '" & gmcDataObj.gettrackPQ() & "'," &
            "successInfo= '" & gmcDataObj.gettrackSQ() & "'," &
            "reductionInfo = '" & gmcDataObj.getreductionQ() & "' "

        'hui - must convert it to parameter query
        'generate sql string
        strSQL = "update gmcData set " & fieldStr & " where gmcCode=" & gmcDataObj.getcodeCheck()

        'strSQL = "update gmcDatas set name='boston' where challengeID=" & gmcDataObj.getchallengeID

        cmd.CommandText = strSQL
        cmd.CommandType = CommandType.Text
        cmd.ExecuteNonQuery()

        'cmd.Dispose()
        conn.Dispose()
        conn = Nothing
        cmd = Nothing

        Return True



    End Function

    Public Shared Function editgmcData(ByVal gmcDataObj As clsChallengeVO) As Boolean
        Dim conn As SqlConnection = Nothing
        Dim cmd As SqlCommand = Nothing
        Dim strSQL As String = String.Empty
        Dim fieldStr As String

        Dim challengeID As String = String.Empty

        conn = New SqlConnection(Common.GetConnString())
        conn.Open()

        cmd = New SqlCommand(strSQL, conn)

        'prepare values
        fieldStr = "salutation='" & gmcDataObj.getsalutation() & "', " &
            "firstName= '" & gmcDataObj.getfirstName() & "'," &
            "lastName='" & gmcDataObj.getlastName() & "', " &
            "phoneNumber= '" & gmcDataObj.getphoneNumber() & "'," &
            "emailAddress= '" & gmcDataObj.getemailAddress() & "'," &
            "organization= '" & gmcDataObj.getorganization() & "'," &
            "actionType= '" & gmcDataObj.getactionType() & "'," &
             "gmiRelationship= '" & gmcDataObj.getgmiRelationship() & "'," &
             "commitment='" & gmcDataObj.getcommitment() & "', " &
            "todaysDate='" & gmcDataObj.gettodaysDate() & "', " &
            "datetime='" & DateTime.Today & "' ," &
            "Status = '" & gmcDataObj.getStatus() & "' "

        'hui - must convert it to parameter query
        'generate sql string
        strSQL = "update gmcData set " & fieldStr & " where challengeID=" & gmcDataObj.getchallengeID

        'strSQL = "update gmcDatas set name='boston' where challengeID=" & gmcDataObj.getchallengeID

        cmd.CommandText = strSQL
        cmd.CommandType = CommandType.Text
        cmd.ExecuteNonQuery()

        'cmd.Dispose()
        conn.Dispose()
        conn = Nothing
        cmd = Nothing

        Return True
    End Function


    Public Shared Function deletegmcData(ByVal challengeID As String) As String
        Dim conn As SqlConnection = Nothing
        Dim cmd As SqlCommand = Nothing
        Dim strSQL As String = String.Empty

        conn = New SqlConnection(Common.GetConnString())
        conn.Open()

        cmd = New SqlCommand(strSQL, conn)

        'security risk
        'generate sql string
        strSQL = "delete from gmcData where challengeID=" & challengeID
        cmd.CommandText = strSQL
        cmd.CommandType = CommandType.Text
        cmd.ExecuteNonQuery()

        'cmd.Dispose()
        conn.Dispose()
        conn = Nothing
        cmd = Nothing

        Return "1"
    End Function



    Public Shared Function GetgmcDataBychallengeID(ByVal challengeID As String) As clsChallengeVO
        Dim conn As SqlConnection = Nothing
        Dim cmd As SqlCommand = Nothing
        Dim strSQL As String = String.Empty
        Dim da As SqlDataAdapter
        Dim ds As DataSet = Nothing
        Dim dt As DataTable = Nothing

        conn = New SqlConnection(Common.GetConnString())
        conn.Open()

        cmd = New SqlCommand(strSQL, conn)
        'hui question: if there is no challengeID
        'what we suppose to show
        '7/18/2009

        Dim ichallengeID = 0
        If (Integer.TryParse(challengeID, 0)) Then
            ichallengeID = CInt(challengeID)
        Else
            Return Nothing
        End If

        strSQL = "select * from gmcData where challengeID=" & ichallengeID

        cmd.CommandText = strSQL
        cmd.CommandType = CommandType.Text
        da = New SqlDataAdapter(cmd)
        ds = New DataSet
        ds.CaseSensitive = False

        da.Fill(ds)
        dt = ds.Tables(0)

        Dim x As Integer
        Dim gmcDataObj As clsChallengeVO

        If (dt.Rows.Count > 0) Then
            gmcDataObj = New clsChallengeVO

            For x = 0 To dt.Rows.Count - 1
                gmcDataObj.setchallengeID(challengeID)
                gmcDataObj.setfirstName(dt.Rows(x)("firstName"))
                gmcDataObj.setlastName(dt.Rows(x)("lastName"))
                gmcDataObj.setsalutation(dt.Rows(x)("salutation"))
                gmcDataObj.settodaysDate(dt.Rows(x)("todaysDate"))
                gmcDataObj.setorganization(dt.Rows(x)("organization"))
                gmcDataObj.setphoneNumber(dt.Rows(x)("phoneNumber"))
                gmcDataObj.setemailAddress(dt.Rows(x)("emailAddress"))
                gmcDataObj.setactionType(dt.Rows(x)("actionType"))
                gmcDataObj.setgmiRelationship(dt.Rows(x)("gmiRelationship"))
                gmcDataObj.setcommitment(dt.Rows(x)("commitment"))
                gmcDataObj.setStatus(dt.Rows(x)("Status"))
            Next
        Else
            gmcDataObj = Nothing
        End If

        conn.Dispose()
        conn = Nothing
        cmd = Nothing
        da = Nothing
        ds = Nothing

        Return gmcDataObj
    End Function





    Public Function getgmcData() As DataTable
        Dim strQuery As String = "select challengeID, organization, year(todaysDate) as Year from gmcData order by organization"
        Dim cmd As New SqlCommand(strQuery)
        'Debug.Print strQuery
        Dim dt As DataTable = GetData(cmd)
        Return dt
    End Function




End Class
