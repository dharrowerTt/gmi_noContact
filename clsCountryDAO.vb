Imports System.IO
Imports System.Text
Imports System.Data
Imports System.Data.SqlClient

Public Class clsCountryDAO

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

    Public Shared Function getCountryERdata(ByVal pagenamelookup As String) As DataTable
        Dim conn As SqlConnection = Nothing
        Dim cmd As SqlCommand = Nothing
        Dim strSQL As String = String.Empty
        Dim da As SqlDataAdapter
        Dim ds As DataSet = Nothing
        Dim dt As DataTable = Nothing

        conn = New SqlConnection(Common.GetConnString())
        conn.Open()

        cmd = New SqlCommand(strSQL, conn)


        strSQL = "select year, sector,  sum(value) as 'combinedValue' from countryData where html_safe_countryname = '" & pagenamelookup & "' group by year, sector order by year asc, sector"


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

    Public Shared Function getCountryCoalERdata(ByVal pagenamelookup As String) As DataTable
        Dim conn As SqlConnection = Nothing
        Dim cmd As SqlCommand = Nothing
        Dim strSQL As String = String.Empty
        Dim da As SqlDataAdapter
        Dim ds As DataSet = Nothing
        Dim dt As DataTable = Nothing

        conn = New SqlConnection(Common.GetConnString())
        conn.Open()

        cmd = New SqlCommand(strSQL, conn)


        strSQL = "select year, category,  sum(value) as 'combinedValue' from countryData where sector = 'coal mines' and html_safe_countryname = '" & pagenamelookup & "' group by year, category order by year asc, category"


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

    Public Shared Function getCountryOilERdata(ByVal pagenamelookup As String) As DataTable
        Dim conn As SqlConnection = Nothing
        Dim cmd As SqlCommand = Nothing
        Dim strSQL As String = String.Empty
        Dim da As SqlDataAdapter
        Dim ds As DataSet = Nothing
        Dim dt As DataTable = Nothing

        conn = New SqlConnection(Common.GetConnString())
        conn.Open()

        cmd = New SqlCommand(strSQL, conn)


        strSQL = "select year, category,  sum(value) as 'combinedValue' from countryData where sector = 'oil & gas' and html_safe_countryname = '" & pagenamelookup & "' group by year, category order by year asc, category"


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
    Public Shared Function getCountryBiogasERdata(ByVal pagenamelookup As String) As DataTable
        Dim conn As SqlConnection = Nothing
        Dim cmd As SqlCommand = Nothing
        Dim strSQL As String = String.Empty
        Dim da As SqlDataAdapter
        Dim ds As DataSet = Nothing
        Dim dt As DataTable = Nothing

        conn = New SqlConnection(Common.GetConnString())
        conn.Open()

        cmd = New SqlCommand(strSQL, conn)


        strSQL = "select year, category,  sum(value) as 'combinedValue' from countryData where sector = 'biogas' and html_safe_countryname = '" & pagenamelookup & "' group by year, category order by year asc, category"


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


    Public Shared Function getOverview(ByVal objid As String) As DataTable
        Dim conn As SqlConnection = Nothing
        Dim cmd As SqlCommand = Nothing
        Dim strSQL As String = String.Empty
        Dim da As SqlDataAdapter
        Dim ds As DataSet = Nothing
        Dim dt As DataTable = Nothing

        conn = New SqlConnection(Common.GetConnString())
        conn.Open()

        cmd = New SqlCommand(strSQL, conn)


        strSQL = "SELECT * FROM " &
    "( " &
    "SELECT [sector] as 'Sector', " &
    "       [Year], " &
    "       round([value],3) as value " &
    " FROM countryData where html_safe_countryname = '" & objid & "'  " &
    " ) AS SourceTable PIVOT(SUM([value]) FOR [year] IN([2020],  [2035], [2050])) AS PivotTable ORDER BY 'Sector' Asc"


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
End Class