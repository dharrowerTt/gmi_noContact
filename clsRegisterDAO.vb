Imports System.IO
Imports System.Text
Imports System.Data
Imports System.Data.SqlClient



Public Class clsRegisterDAO

    Public Shared Function GetAccount(ByVal regEmail As String) As clsRegisterVO
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


        strSQL = "select top (1) * from _registerContact where email = '" & regEmail & "'"


        cmd.CommandText = strSQL
        cmd.CommandType = CommandType.Text
        da = New SqlDataAdapter(cmd)
        ds = New DataSet

        dt = ds.Tables(0)

        Dim x As Integer
        Dim eventObj As clsRegisterVO

        If (dt.Rows.Count > 0) Then
            eventObj = New clsRegisterVO

            For x = 0 To dt.Rows.Count - 1
                eventObj.setfName(dt.Rows(x)("fName"))
                eventObj.setlName(dt.Rows(x)("lName"))
                eventObj.setjobTitle(dt.Rows(x)("jobTitle"))
                eventObj.setorganization(dt.Rows(x)("organization"))
                eventObj.setcountry(dt.Rows(x)("country"))
                eventObj.setphone(dt.Rows(x)("phone"))
                eventObj.setEmail(dt.Rows(x)("email"))
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

    Public Shared Function updateDet(ByVal regEmail As String) As clsRegisterVO
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


        strSQL = "select top (1) * from _registerContact where email = '" & regEmail & "'"


        cmd.CommandText = strSQL
        cmd.CommandType = CommandType.Text
        da = New SqlDataAdapter(cmd)
        ds = New DataSet

        dt = ds.Tables(0)

        Dim x As Integer
        Dim eventObj As clsRegisterVO

        If (dt.Rows.Count > 0) Then
            eventObj = New clsRegisterVO

            For x = 0 To dt.Rows.Count - 1
                eventObj.setfName(dt.Rows(x)("fName"))
                eventObj.setlName(dt.Rows(x)("lName"))
                eventObj.setjobTitle(dt.Rows(x)("jobTitle"))
                eventObj.setorganization(dt.Rows(x)("organization"))
                eventObj.setcountry(dt.Rows(x)("country"))
                eventObj.setphone(dt.Rows(x)("phone"))
                eventObj.setEmail(dt.Rows(x)("email"))
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
    Public Shared Function createUser(ByVal registerDataObj As clsRegisterVO) As String
        Dim conn As SqlConnection = Nothing
        Dim cmd As SqlCommand = Nothing
        Dim strSQL As String = String.Empty


        Dim oId As Object
        Dim registerID As String = String.Empty

        conn = New SqlConnection(Common.GetConnString())
        conn.Open()

        cmd = New SqlCommand(strSQL, conn)


        'fieldStr = Replace(fieldStr, "'", "''")

        strSQL = "insert into _gmiUsers (fname,lname,email,password,createdDate"
        strSQL += ") values ('" & registerDataObj.getfName() & "','" & registerDataObj.getlName() & "','" & registerDataObj.getEmail() & "','" & registerDataObj.getPassword() & "','" & Today.Date & "')"


        cmd.CommandText = strSQL
        cmd.CommandType = CommandType.Text
        cmd.ExecuteNonQuery()

        'find the new gmcData Id
        cmd.CommandText = "SELECT SCOPE_IDENTITY() "
        oId = cmd.ExecuteScalar()

        If oId Is DBNull.Value Then
            Throw New Exception("InsertRegData: Could not obtain Registration id.")
        Else
            registerID = CType(oId, String)
        End If
        'cmd.Dispose()
        conn.Dispose()
        conn = Nothing
        cmd = Nothing

        Return registerID
    End Function

    Public Shared Function insertEmail(ByVal registerDataObj As clsRegisterVO) As String
        Dim conn As SqlConnection = Nothing
        Dim cmd As SqlCommand = Nothing
        Dim strSQL As String = String.Empty
        Dim fieldStr As String
        Dim eventID As Int16


        Dim oId As Object
        Dim registerID As String = String.Empty

        conn = New SqlConnection(Common.GetConnString())
        conn.Open()

        cmd = New SqlCommand(strSQL, conn)

        'prepare values
        fieldStr =
           "'" & registerDataObj.getEmail() & "','" & Date.Today & "'"

        eventID = registerDataObj.getEventID()


        'fieldStr = Replace(fieldStr, "'", "''")

        strSQL = "insert into _registerContact (email, createDate, eventID"
        strSQL += ") values (" & fieldStr & "," & eventID & ")"


        cmd.CommandText = strSQL
        cmd.CommandType = CommandType.Text
        cmd.ExecuteNonQuery()

        'find the new gmcData Id
        cmd.CommandText = "SELECT SCOPE_IDENTITY() "
        oId = cmd.ExecuteScalar()

        If oId Is DBNull.Value Then
            Throw New Exception("InsertRegData: Could not obtain Registration id.")
        Else
            registerID = CType(oId, String)
        End If
        'cmd.Dispose()
        conn.Dispose()
        conn = Nothing
        cmd = Nothing

        Return registerID
    End Function

    Public Shared Function insertSpeakerEmail(ByVal registerDataObj As clsRegisterVO) As String
        Dim conn As SqlConnection = Nothing
        Dim cmd As SqlCommand = Nothing
        Dim strSQL As String = String.Empty
        Dim fieldStr As String
        Dim eventID As Int16


        Dim oId As Object
        Dim registerID As String = String.Empty

        conn = New SqlConnection(Common.GetConnString())
        conn.Open()

        cmd = New SqlCommand(strSQL, conn)

        'prepare values
        fieldStr =
           "'" & registerDataObj.getEmail() & "','" & Date.Today & "'"

        eventID = registerDataObj.getEventID()


        'fieldStr = Replace(fieldStr, "'", "''")

        strSQL = "insert into _registerContact (email, createDate, eventID, speakerstatus"
        strSQL += ") values (" & fieldStr & "," & eventID & ",1)"


        cmd.CommandText = strSQL
        cmd.CommandType = CommandType.Text
        cmd.ExecuteNonQuery()

        'find the new gmcData Id
        cmd.CommandText = "SELECT SCOPE_IDENTITY() "
        oId = cmd.ExecuteScalar()

        If oId Is DBNull.Value Then
            Throw New Exception("InsertRegData: Could not obtain Registration id.")
        Else
            registerID = CType(oId, String)
        End If
        'cmd.Dispose()
        conn.Dispose()
        conn = Nothing
        cmd = Nothing

        Return registerID
    End Function
    Public Shared Function insertAllBasic(ByVal registerDataObj As clsRegisterVO) As String
        Dim conn As SqlConnection = Nothing
        Dim cmd As SqlCommand = Nothing
        Dim strSQL As String = String.Empty
        Dim fieldStr As String
        Dim eventID As Int16


        Dim oId As Object
        Dim registerID As String = String.Empty

        conn = New SqlConnection(Common.GetConnString())
        conn.Open()

        cmd = New SqlCommand(strSQL, conn)

        'prepare values
        fieldStr =
           "'" & registerDataObj.getEmail() & "','" & registerDataObj.getfName() & "','" & registerDataObj.getlName() & "','" & Date.Today & "'"

        eventID = registerDataObj.getEventID()


        'fieldStr = Replace(fieldStr, "'", "''")

        strSQL = "insert into _registerContact (email, fName, lName, createDate, eventID"
        strSQL += ") values (" & fieldStr & "," & eventID & ")"


        cmd.CommandText = strSQL
        cmd.CommandType = CommandType.Text
        cmd.ExecuteNonQuery()

        'find the new gmcData Id
        cmd.CommandText = "SELECT SCOPE_IDENTITY() "
        oId = cmd.ExecuteScalar()

        If oId Is DBNull.Value Then
            Throw New Exception("InsertRegData: Could not obtain Registration id.")
        Else
            registerID = CType(oId, String)
        End If
        'cmd.Dispose()
        conn.Dispose()
        conn = Nothing
        cmd = Nothing

        Return registerID
    End Function

    Public Shared Function editRegistration(ByVal registerObj As clsRegisterVO) As Boolean
        Dim conn As SqlConnection = Nothing
        Dim cmd As SqlCommand = Nothing
        Dim strSQL As String = String.Empty
        Dim fieldStr As String

        Dim challengeID As String = String.Empty

        conn = New SqlConnection(Common.GetConnString())
        conn.Open()

        cmd = New SqlCommand(strSQL, conn)

        'prepare values
        fieldStr = "fName='" & registerObj.getfName() & "', " &
            "lName= '" & registerObj.getlName() & "'," &
            "organization='" & registerObj.getorganization() & "', " &
            "jobTitle= '" & registerObj.getjobTitle() & "'," &
            "country= '" & registerObj.getcountry() & "'," &
             "internationalPhone= '" & registerObj.getInternationalPhone() & "'," &
         "dietaryRestrictions= '" & registerObj.getDietaryRequirements() & "'," &
          "specialNeeds= '" & registerObj.getSpecialNeeds() & "'," &
           "sectorGMF= '" & registerObj.getSectorGMF() & "'," &
            "attend23= '" & registerObj.getAttend23() & "'," &
             "attend24= '" & registerObj.getAttend24() & "'," &
             "attend25= '" & registerObj.getAttend25() & "'," &
             "attend26= '" & registerObj.getAttend26() & "'," &
              "attend27= '" & registerObj.getAttend27() & "'," &
               "awareness= '" & registerObj.getAwareness() & "'," &
            "editable= 1"

        If registerObj.getphone IsNot Nothing Then
            fieldStr = fieldStr & ", phone= '" & registerObj.getphone() & "'"
        End If

        If registerObj.getdelegateType IsNot Nothing Then
            fieldStr = fieldStr & ", delegateType= '" & registerObj.getdelegateType() & "'"
        End If
        If registerObj.getpresenting IsNot Nothing Then
            fieldStr = fieldStr & ", presenting= '" & registerObj.getpresenting() & "'"
        End If
        'hui - must convert it to parameter query
        'generate sql string
        strSQL = "update _registerContact set " & fieldStr & " where email='" & registerObj.getEmail() & "' AND eventID = " & registerObj.getEventID

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

    Public Shared Function editVisa(ByVal registerDataObj As clsRegisterVO) As String
        Dim conn As SqlConnection = Nothing
        Dim cmd As SqlCommand = Nothing
        Dim strSQL As String = String.Empty
        Dim fieldStr As String
        Dim eventID As Int16


        Dim oId As Object
        Dim registerID As String = String.Empty

        conn = New SqlConnection(Common.GetConnString())
        conn.Open()

        cmd = New SqlCommand(strSQL, conn)

        'prepare values
        fieldStr =
           "'" & registerDataObj.getfullName() & "','" & registerDataObj.getPassportNumber() & "','" & registerDataObj.getIssuanceDate() & "','" & registerDataObj.getExpirationDate() & "','" & registerDataObj.getBirthDate() & "','" & registerDataObj.getCitizenship() & "','" & registerDataObj.getSchedule() & "'," & registerDataObj.getContactID() & ""

        eventID = registerDataObj.getEventID()


        'fieldStr = Replace(fieldStr, "'", "''")

        strSQL = "insert into _registervisa (fullName, passportNumber, passportIssueDate, passportExpiration, dob, citizenship, monthYear,contactID"
        strSQL += " ) values (" & fieldStr & ")"


        cmd.CommandText = strSQL
        cmd.CommandType = CommandType.Text
        cmd.ExecuteNonQuery()

        'find the new gmcData Id
        cmd.CommandText = "SELECT SCOPE_IDENTITY() "
        oId = cmd.ExecuteScalar()

        If oId Is DBNull.Value Then
            Throw New Exception("InsertRegData: Could not obtain Registration id.")
        Else
            registerID = CType(oId, String)
        End If
        'cmd.Dispose()
        conn.Dispose()
        conn = Nothing
        cmd = Nothing

        Return registerID
    End Function



End Class
