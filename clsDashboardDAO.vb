Imports System.IO
Imports System.Text
Imports System.Data
Imports System.Data.SqlClient

Public Class clsdashboardDAO

    Public Function GetEmailId(ByVal emailId As String) As clsDashboardVO

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

    Public Shared Function cutCFTempData(ByVal cfdataObj As clsDashboardVO, ByRef formname As String) As String
        Dim conn As SqlConnection = Nothing
        Dim cmd As SqlCommand = Nothing
        Dim strSQL As String = String.Empty
        Dim fieldStr As String

        Dim oId As Object
        Dim challengeID As String = String.Empty

        conn = New SqlConnection(Common.GetConnString())
        conn.Open()

        cmd = New SqlCommand(strSQL, conn)

        strSQL = "delete from dashboardCF where cfemail = '" & cfdataObj.getEmail() & "' and cfComment = '" & formname & "' and cfStatus = 'Temp' and dateadded = '" & Today() & "'"


        cmd.CommandText = strSQL
        cmd.CommandType = CommandType.Text
        cmd.ExecuteNonQuery()


        'cmd.Dispose()
        conn.Dispose()
        conn = Nothing
        cmd = Nothing

        Return 1



    End Function

    Public Shared Function insertCFData(ByVal cfDataObj As clsDashboardVO) As String
        Dim conn As SqlConnection = Nothing
        Dim cmd As SqlCommand = Nothing
        Dim strSQL As String = String.Empty
        Dim fieldStr As String

        Dim oId As Object
        Dim challengeID As String = String.Empty

        conn = New SqlConnection(Common.GetConnString())
        conn.Open()

        cmd = New SqlCommand(strSQL, conn)

        'prepare values
        fieldStr =
           "'" & cfDataObj.getName() & "', " &
        "'" & cfDataObj.getEmail() & "', " &
        "'" & cfDataObj.getOrg() & "', " &
        "'" & cfDataObj.getComment() & "'," &
        "'" & cfDataObj.getStatus() & "'," &
        "'" & cfDataObj.getMemo() & "'," &
        "'" & DateTime.Today & "'"

        'fieldStr = Replace(fieldStr, "'", "''")

        strSQL = "insert into dashboardCF (cfName, cfEmail, cfOrg, cfComment, cfStatus, cfMemo, dateAdded ) values (" & fieldStr & ")"


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


End Class
