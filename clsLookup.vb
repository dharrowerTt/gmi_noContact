Imports System.Data
Imports System.Data.SqlClient

Public Class clsLookup

    Friend Shared Function GetOrgType() As DataView

        Dim orgTypeText() As String = {"Private Sector", "Local, regional or other governmental organization", "Researcher organization", "Non-governmental organization", _
                                    "Financial Institution", "Other"}
        Dim orgTypeValues() As String = {"private", "local", "research", "national", "banks", "other"}

        Dim dt As DataTable = Nothing
        Dim row As DataRow

        dt = New DataTable
        dt.Columns.Add("orgtype")
        dt.Columns.Add("orgtypecode")

        For i As Integer = 0 To orgTypeValues.Length - 1

            row = dt.NewRow
            row("orgtype") = orgTypeText(i)
            row("orgtypecode") = orgTypeValues(i)
            dt.Rows.Add(row)

        Next

        dt.AcceptChanges()

        Return dt.DefaultView

    End Function

    Friend Shared Function GetSector() As DataView

        Dim sectorText() As String = {"Agriculture", "Coal Mines", "Landfills", "Oil & Gas Systems", "Other"}
        Dim sectorValues() As String = {"agriculture", "coal", "landfill", "oilngas", "other"}

        Dim dt As DataTable = Nothing
        Dim row As DataRow

        dt = New DataTable
        dt.Columns.Add("sector")
        dt.Columns.Add("sectorcode")

        For i As Integer = 0 To sectorValues.Length - 1

            row = dt.NewRow
            row("sector") = sectorText(i)
            row("sectorcode") = sectorValues(i)
            dt.Rows.Add(row)

        Next

        dt.AcceptChanges()

        Return dt.DefaultView

    End Function

    Friend Shared Function GetCountries() As DataView

        Dim conn As SqlConnection = Nothing
        Dim da As SqlDataAdapter
        Dim cmd As SqlCommand = Nothing

        Dim strSQL As String

        Dim ds As DataSet = Nothing
        Dim dv As DataView = Nothing

        strSQL = "SELECT DISTINCT CountryName,Upper(CountryName) as capcountry FROM [dbo].lu_Country " & _
                " ORDER BY capcountry ASC "

        Try
            conn = New SqlConnection(Common.GetConnString)
            cmd = New SqlCommand(strSQL, conn)
            cmd.CommandType = CommandType.Text

            da = New SqlDataAdapter(cmd)
            ds = New DataSet
            ds.CaseSensitive = False

            da.Fill(ds)
            dv = ds.Tables(0).DefaultView

        Catch ex As Exception
            Common.WrapException(ex)

        Finally

            If Not cmd Is Nothing Then
                cmd.Dispose()
            End If

            If conn.State = ConnectionState.Open Then
                conn.Close()
            End If

            conn.Dispose()
            conn = Nothing

            cmd = Nothing
            da = Nothing
            ds = Nothing

        End Try

        Return dv

    End Function

    Friend Shared Function GetPartnerCountries() As DataView

        Dim conn As SqlConnection = Nothing
        Dim da As SqlDataAdapter
        Dim cmd As SqlCommand = Nothing

        Dim strSQL As String

        Dim ds As DataSet = Nothing
        Dim dv As DataView = Nothing

        strSQL = "SELECT DISTINCT PartnerCountry as countryname,Upper(PartnerCountry) as pcountry FROM [dbo].l_PartnerCountry " & _
                " ORDER BY pcountry ASC "

        Try
            conn = New SqlConnection(Common.GetConnString)
            cmd = New SqlCommand(strSQL, conn)
            cmd.CommandType = CommandType.Text

            da = New SqlDataAdapter(cmd)
            ds = New DataSet
            ds.CaseSensitive = False

            da.Fill(ds)
            dv = ds.Tables(0).DefaultView

        Catch ex As Exception
            Common.WrapException(ex)

        Finally

            If Not cmd Is Nothing Then
                cmd.Dispose()
            End If

            If conn.State = ConnectionState.Open Then
                conn.Close()
            End If

            conn.Dispose()
            conn = Nothing

            cmd = Nothing
            da = Nothing
            ds = Nothing

        End Try

        Return dv

    End Function

    Friend Shared Function GetPartnerCountriesByRegion(ByVal region As String) As DataSet

        Dim conn As SqlConnection = Nothing
        Dim da As SqlDataAdapter
        Dim cmd As SqlCommand = Nothing

        Dim strSQL As String

        Dim ds As DataSet = Nothing

        strSQL = "SELECT DISTINCT PartnerCountry as countryname FROM [dbo].l_PartnerCountry C JOIN [dbo].l_Region R ON C.regionId = R.regionId " & _
                " where R.name = '" + region + "'"

        Try
            conn = New SqlConnection(Common.GetConnString)
            cmd = New SqlCommand(strSQL, conn)
            cmd.CommandType = CommandType.Text

            da = New SqlDataAdapter(cmd)
            ds = New DataSet
            ds.CaseSensitive = False

            da.Fill(ds)

        Catch ex As Exception
            Common.WrapException(ex)

        Finally


            conn.Dispose()
            conn = Nothing

            cmd = Nothing
            da = Nothing

        End Try

        Return ds

    End Function

    Friend Shared Function GetGeoFocus() As DataView

        ' replaced june08 Dim regiontext() As String = {"Africa (AFR)", "Asia (A)", "Europe (E)", "Latin America (LA)", _
        '                            "Middle East And North Africa (MNA)"}
        Dim regiontext() As String = {"Africa", "Asia", "Australia/Oceania", "Europe", "North America", _
                                    "Middle East", "South America"}

        Dim regionvalues() As String = {"AFR", "A", "AUS", "E", "NA", "ME", "SA"}


        Dim dt As DataTable = Nothing
        Dim row As DataRow

        dt = New DataTable
        dt.Columns.Add("geoName")
        dt.Columns.Add("geoCode")

        row = dt.NewRow
        row("geoName") = "Geographic Focus"
        row("geoCode") = ""
        dt.Rows.Add(row)

        row = dt.NewRow
        row("geoName") = ">>> Regions"
        row("geoCode") = ""
        dt.Rows.Add(row)

        For i As Integer = 0 To regionvalues.Length - 1

            row = dt.NewRow
            row("geoName") = regiontext(i)
            row("geoCode") = regionvalues(i)
            dt.Rows.Add(row)

        Next

        row = dt.NewRow
        row("geoName") = ">>> Countries"
        row("geoCode") = ""
        dt.Rows.Add(row)

        Dim conn As SqlConnection = Nothing
        Dim da As SqlDataAdapter
        Dim cmd As SqlCommand = Nothing

        Dim strSQL As String

        Dim ds As DataSet = Nothing
        'Dim dv As DataView = Nothing

        strSQL = "SELECT DISTINCT pcid, PartnerCountry FROM l_PartnerCountry " & _
                " ORDER BY PartnerCountry"

        Try
            conn = New SqlConnection(Common.GetConnString)
            cmd = New SqlCommand(strSQL, conn)
            cmd.CommandType = CommandType.Text

            da = New SqlDataAdapter(cmd)
            ds = New DataSet
            ds.CaseSensitive = False

            da.Fill(ds)
            'dv = ds.Tables(0).DefaultView

            For i As Integer = 0 To ds.Tables(0).Rows.Count - 1
                row = dt.NewRow
                row("geoName") = ds.Tables(0).Rows(i).Item(1)
                row("geoCode") = ds.Tables(0).Rows(i).Item(0)
                dt.Rows.Add(row)
            Next

        Catch ex As Exception
            Common.WrapException(ex)

        Finally

            If Not cmd Is Nothing Then
                cmd.Dispose()
            End If

            If conn.State = ConnectionState.Open Then
                conn.Close()
            End If

            conn.Dispose()
            conn = Nothing

            cmd = Nothing
            da = Nothing
            ds = Nothing

        End Try

        dt.AcceptChanges()

        Return dt.DefaultView


    End Function

    Friend Shared Function GetRegions() As DataView

        ' replaced june08 Dim regiontext() As String = {"Africa (AFR)", "Asia (A)", "Europe (E)", "Latin America (LA)", _
        '                            "Middle East And North Africa (MNA)"}
        Dim regiontext() As String = {"Africa", "Asia", "Australia/Oceania", "Europe", "North America", _
                                    "Middle East", "South America"}

        Dim regionvalues() As String = {"AFR", "A", "AUS", "E", "NA", "ME", "SA"}


        Dim dt As DataTable = Nothing
        Dim row As DataRow

        dt = New DataTable
        dt.Columns.Add("regionname")
        dt.Columns.Add("regioncode")

        For i As Integer = 0 To regionvalues.Length - 1

            row = dt.NewRow
            row("regionname") = regiontext(i)
            row("regioncode") = regionvalues(i)
            dt.Rows.Add(row)

        Next

        dt.AcceptChanges()

        Return dt.DefaultView


    End Function

    Friend Shared Function GetOrganizations(ByVal strPartnerCountry As String) As DataView
        Dim conn As SqlConnection = Nothing
        Dim da As SqlDataAdapter
        Dim cmd As SqlCommand = Nothing

        Dim strSQL As String

        Dim ds As DataSet = Nothing
        Dim dv As DataView = Nothing

        '''strSQL = "SELECT OrganizationId, name, UPPER(name) AS uname  FROM [dbo].organization " & _
        '''        " WHERE UPPER(partnercountry) = '" & strPartnerCountry.ToUpper & "' ORDER BY uname ASC "

        strSQL = "SELECT OrganizationId, name, UPPER(name) AS uname  FROM [dbo].organization " & _
                 " WHERE UPPER(partnercountry) = '" & strPartnerCountry.ToUpper & "' AND MemberType=2 ORDER BY uname ASC "

        Try
            conn = New SqlConnection(Common.GetConnString)
            cmd = New SqlCommand(strSQL, conn)
            cmd.CommandType = CommandType.Text

            da = New SqlDataAdapter(cmd)
            ds = New DataSet
            ds.CaseSensitive = False

            da.Fill(ds)
            dv = ds.Tables(0).DefaultView

        Catch ex As Exception
            Common.WrapException(ex)

        Finally

            If Not cmd Is Nothing Then
                cmd.Dispose()
            End If

            If conn.State = ConnectionState.Open Then
                conn.Close()
            End If

            conn.Dispose()
            conn = Nothing

            cmd = Nothing
            da = Nothing
            ds = Nothing

        End Try

        Return dv

    End Function

    Friend Shared Function GetOrganizationsByCountry(ByVal strPartnerCountry As String) As DataView
        Dim conn As SqlConnection = Nothing
        Dim da As SqlDataAdapter
        Dim cmd As SqlCommand = Nothing

        Dim strSQL As String

        Dim ds As DataSet = Nothing
        Dim dv As DataView = Nothing

        strSQL = "SELECT OrganizationId, name, UPPER(name) AS uname  FROM [dbo].organization " & _
                 " WHERE UPPER(partnercountry) = '" & strPartnerCountry.ToUpper & "' AND MemberType=2 ORDER BY uname ASC "

        Try
            conn = New SqlConnection(Common.GetConnString)
            cmd = New SqlCommand(strSQL, conn)
            cmd.CommandType = CommandType.Text

            da = New SqlDataAdapter(cmd)
            ds = New DataSet
            ds.CaseSensitive = False

            da.Fill(ds)
            dv = ds.Tables(0).DefaultView

        Catch ex As Exception
            Common.WrapException(ex)

        Finally

            If Not cmd Is Nothing Then
                cmd.Dispose()
            End If

            If conn.State = ConnectionState.Open Then
                conn.Close()
            End If

            conn.Dispose()
            conn = Nothing

            cmd = Nothing
            da = Nothing
            ds = Nothing

        End Try

        Return dv

    End Function

    Friend Shared Function GetAllOrganizations(ByRef pMemberType As Integer) As DataView

        Dim conn As SqlConnection = Nothing
        Dim da As SqlDataAdapter
        Dim cmd As SqlCommand = Nothing

        Dim strSQL As String

        Dim ds As DataSet = Nothing
        Dim dv As DataView = Nothing

        '[dbo].organization
        strSQL = "SELECT OrganizationId, name, UPPER(name) AS uname FROM  viewOrgList WHERE memberType=" & pMemberType & _
                " ORDER BY uname ASC "

        Try
            conn = New SqlConnection(Common.GetConnString)
            cmd = New SqlCommand(strSQL, conn)
            cmd.CommandType = CommandType.Text

            da = New SqlDataAdapter(cmd)
            ds = New DataSet
            ds.CaseSensitive = False

            da.Fill(ds)
            dv = ds.Tables(0).DefaultView

        Catch ex As Exception
            Common.WrapException(ex)

        Finally

            If Not cmd Is Nothing Then
                cmd.Dispose()
            End If

            If conn.State = ConnectionState.Open Then
                conn.Close()
            End If

            conn.Dispose()
            conn = Nothing

            cmd = Nothing
            da = Nothing
            ds = Nothing

        End Try

        Return dv

    End Function

    Friend Shared Function GetAllOrganizations() As DataView

        Dim conn As SqlConnection = Nothing
        Dim da As SqlDataAdapter
        Dim cmd As SqlCommand = Nothing

        Dim strSQL As String

        Dim ds As DataSet = Nothing
        Dim dv As DataView = Nothing

        '[dbo].organization
        strSQL = "SELECT OrganizationId, name, UPPER(name) AS uname FROM  viewOrgList " & _
                " ORDER BY uname ASC "

        Try
            conn = New SqlConnection(Common.GetConnString)
            cmd = New SqlCommand(strSQL, conn)
            cmd.CommandType = CommandType.Text

            da = New SqlDataAdapter(cmd)
            ds = New DataSet
            ds.CaseSensitive = False

            da.Fill(ds)
            dv = ds.Tables(0).DefaultView

        Catch ex As Exception
            Common.WrapException(ex)

        Finally

            If Not cmd Is Nothing Then
                cmd.Dispose()
            End If

            If conn.State = ConnectionState.Open Then
                conn.Close()
            End If

            conn.Dispose()
            conn = Nothing

            cmd = Nothing
            da = Nothing
            ds = Nothing

        End Try

        Return dv

    End Function

    Friend Shared Function GetOtherOrganizations() As DataView
        Dim conn As SqlConnection = Nothing
        Dim da As SqlDataAdapter
        Dim cmd As SqlCommand = Nothing

        Dim strSQL As String

        Dim ds As DataSet = Nothing
        Dim dv As DataView = Nothing

        ''''strSQL = "SELECT OrganizationId, name, UPPER(name) AS uname FROM [dbo].organization " & _
        ''''        " WHERE partnercountry IS NULL ORDER BY uname ASC "

        '''strSQL = "SELECT OrganizationId, name, UPPER(name) AS uname FROM [dbo].organization " & _
        '''          " WHERE membertype=3 ORDER BY uname ASC "

        strSQL = "SELECT OrganizationId, name, UPPER(name) AS uname FROM [dbo].organization " & _
                  " WHERE membertype IN (1,3) ORDER BY uname ASC "

        Try
            conn = New SqlConnection(Common.GetConnString)
            cmd = New SqlCommand(strSQL, conn)
            cmd.CommandType = CommandType.Text

            da = New SqlDataAdapter(cmd)
            ds = New DataSet
            ds.CaseSensitive = False

            da.Fill(ds)
            dv = ds.Tables(0).DefaultView

        Catch ex As Exception
            Common.WrapException(ex)

        Finally

            If Not cmd Is Nothing Then
                cmd.Dispose()
            End If

            If conn.State = ConnectionState.Open Then
                conn.Close()
            End If

            conn.Dispose()
            conn = Nothing

            cmd = Nothing
            da = Nothing
            ds = Nothing

        End Try

        Return dv

    End Function

    Friend Shared Function GetContacts(ByVal strOrgid As String, Optional ByRef pg As Page = Nothing) As DataView
        Dim conn As SqlConnection = Nothing
        Dim da As SqlDataAdapter
        Dim cmd As SqlCommand = Nothing

        Dim strSQL As String

        Dim ds As DataSet = Nothing
        Dim dv As DataView = Nothing

        strSQL = "SELECT contactid, lastname + ', ' + firstname as cname,  UPPER(lastname+firstname) AS uname  FROM [dbo].contact " & _
                " WHERE organizationid= " & strOrgid.ToUpper & " ORDER BY uname ASC "

        If Not pg Is Nothing Then
            pg.Trace.Warn(strSQL)
        End If

        Try
            conn = New SqlConnection(Common.GetConnString)
            cmd = New SqlCommand(strSQL, conn)
            cmd.CommandType = CommandType.Text

            da = New SqlDataAdapter(cmd)
            ds = New DataSet
            ds.CaseSensitive = False

            da.Fill(ds)
            dv = ds.Tables(0).DefaultView

        Catch ex As Exception
            Common.WrapException(ex)

        Finally

            If Not cmd Is Nothing Then
                cmd.Dispose()
            End If

            If conn.State = ConnectionState.Open Then
                conn.Close()
            End If

            conn.Dispose()
            conn = Nothing

            cmd = Nothing
            da = Nothing
            ds = Nothing

        End Try

        Return dv

    End Function

    Friend Shared Function GetOrganization(ByVal strOrgid As String, Optional ByRef pg As Page = Nothing) As DataView

        Dim conn As SqlConnection = Nothing
        Dim da As SqlDataAdapter
        Dim cmd As SqlCommand = Nothing

        Dim strSQL As String

        Dim ds As DataSet = Nothing
        Dim dv As DataView = Nothing

        strSQL = "SELECT [OrganizationId],[Name],[DateEntered],[WebSite] ,[TypeofOrganization] ,[Expertise],[MemberType] ," & _
                "[PartnerCountry] ,[OtherCountry],[createddate],[lastmodifieddate],[lastmodifiedby] FROM [dbo].organization " & _
                " WHERE organizationid= " & strOrgid.ToUpper

        If Not pg Is Nothing Then
            pg.Trace.Warn(strSQL)
        End If

        Try
            conn = New SqlConnection(Common.GetConnString)
            cmd = New SqlCommand(strSQL, conn)
            cmd.CommandType = CommandType.Text

            da = New SqlDataAdapter(cmd)
            ds = New DataSet
            ds.CaseSensitive = False

            da.Fill(ds)
            dv = ds.Tables(0).DefaultView

        Catch ex As Exception
            Common.WrapException(ex)

        Finally

            If Not cmd Is Nothing Then
                cmd.Dispose()
            End If

            If conn.State = ConnectionState.Open Then
                conn.Close()
            End If

            conn.Dispose()
            conn = Nothing

            cmd = Nothing
            da = Nothing
            ds = Nothing

        End Try

        Return dv


    End Function

    Friend Shared Function getCountriesWithSelectOne() As DataView
        Dim dv As DataView = Nothing
        dv = clsLookup.GetCountries()

        Dim row As DataRow
        row = dv.Table.NewRow

        'row("CountryName") = "-1"
        row("CountryName") = "Select One"

        dv.Table.Rows.InsertAt(row, 0)
        dv.Table.AcceptChanges()
        Return dv

    End Function

    Friend Shared Function getAllOrgsWithSelectOne() As DataView

        Dim dv As DataView = Nothing
        dv = GetAllOrganizations()
        Dim row As DataRow
        row = dv.Table.NewRow
        row("organizationID") = "-1"
        row("name") = "Select One"
        dv.Table.Rows.InsertAt(row, 0)
        dv.Table.AcceptChanges()
        Return dv

    End Function

    'Sarah added
    Friend Shared Function getProjectsByUserId(ByVal strUserId As String) As DataView
        Dim conn As SqlConnection = Nothing
        Dim da As SqlDataAdapter
        Dim cmd As SqlCommand = Nothing

        Dim strSQL As String

        Dim ds As DataSet = Nothing
        Dim dv As DataView = Nothing

        strSQL = "SELECT projectid, name, status  FROM [dbo].ProjectActivity " & _
                " WHERE userid= 1  ORDER BY Name  ASC "

        Try
            conn = New SqlConnection(Common.GetConnString)
            cmd = New SqlCommand(strSQL, conn)
            cmd.CommandType = CommandType.Text

            da = New SqlDataAdapter(cmd)
            ds = New DataSet
            ds.CaseSensitive = False

            da.Fill(ds)
            dv = ds.Tables(0).DefaultView

        Catch ex As Exception
            Common.WrapException(ex)

        Finally

            If Not cmd Is Nothing Then
                cmd.Dispose()
            End If

            If conn.State = ConnectionState.Open Then
                conn.Close()
            End If

            conn.Dispose()
            conn = Nothing

            cmd = Nothing
            da = Nothing
            ds = Nothing

        End Try

        Return dv

    End Function

    '2009 new methods

    'sarah 2009
    'for country list box
    Friend Shared Function GetPartnerCountriesWithPcId() As DataView

        Dim conn As SqlConnection = Nothing
        Dim da As SqlDataAdapter
        Dim cmd As SqlCommand = Nothing

        Dim strSQL As String

        Dim ds As DataSet = Nothing
        Dim dv As DataView = Nothing

        strSQL = "SELECT DISTINCT PartnerCountry as countryname,Upper(PartnerCountry) as pcountry, pcId FROM [dbo].l_PartnerCountry " & _
                " ORDER BY pcountry ASC "

        Try
            conn = New SqlConnection(Common.GetConnString)
            cmd = New SqlCommand(strSQL, conn)
            cmd.CommandType = CommandType.Text

            da = New SqlDataAdapter(cmd)
            ds = New DataSet
            ds.CaseSensitive = False

            da.Fill(ds)
            dv = ds.Tables(0).DefaultView

        Catch ex As Exception
            Common.WrapException(ex)

        Finally

            If Not cmd Is Nothing Then
                cmd.Dispose()
            End If

            If conn.State = ConnectionState.Open Then
                conn.Close()
            End If

            conn.Dispose()
            conn = Nothing

            cmd = Nothing
            da = Nothing
            ds = Nothing

        End Try

        Return dv

    End Function


    Friend Shared Function GetCountriesWithCId() As DataView

        Dim conn As SqlConnection = Nothing
        Dim da As SqlDataAdapter
        Dim cmd As SqlCommand = Nothing

        Dim strSQL As String

        Dim ds As DataSet = Nothing
        Dim dv As DataView = Nothing

        strSQL = "SELECT DISTINCT countryname,Upper(CountryName) as ucountry, eventcountryid as cid FROM [dbo].lu_Country " & _
                " where eventcountryid is not null ORDER BY ucountry ASC "

        Try
            conn = New SqlConnection(Common.GetConnString)
            cmd = New SqlCommand(strSQL, conn)
            cmd.CommandType = CommandType.Text

            da = New SqlDataAdapter(cmd)
            ds = New DataSet
            ds.CaseSensitive = False

            da.Fill(ds)
            dv = ds.Tables(0).DefaultView

        Catch ex As Exception
            Common.WrapException(ex)

        Finally

            If Not cmd Is Nothing Then
                cmd.Dispose()
            End If

            If conn.State = ConnectionState.Open Then
                conn.Close()
            End If

            conn.Dispose()
            conn = Nothing

            cmd = Nothing
            da = Nothing
            ds = Nothing

        End Try

        Return dv

    End Function

    Friend Shared Function GetCountriesForLookup() As DataView

        Dim conn As SqlConnection = Nothing
        Dim da As SqlDataAdapter
        Dim cmd As SqlCommand = Nothing

        Dim strSQL As String

        Dim ds As DataSet = Nothing
        Dim dv As DataView = Nothing

        strSQL = "SELECT DISTINCT countryname,Upper(CountryName) as ucountry, countryid FROM [dbo].lu_Country " & _
                " ORDER BY ucountry ASC "

        Try
            conn = New SqlConnection(Common.GetConnString)
            cmd = New SqlCommand(strSQL, conn)
            cmd.CommandType = CommandType.Text

            da = New SqlDataAdapter(cmd)
            ds = New DataSet
            ds.CaseSensitive = False

            da.Fill(ds)
            dv = ds.Tables(0).DefaultView

        Catch ex As Exception
            Common.WrapException(ex)

        Finally

            If Not cmd Is Nothing Then
                cmd.Dispose()
            End If

            If conn.State = ConnectionState.Open Then
                conn.Close()
            End If

            conn.Dispose()
            conn = Nothing

            cmd = Nothing
            da = Nothing
            ds = Nothing

        End Try

        Return dv

    End Function

    Friend Shared Function GetTopicsForLookup() As DataView

        Dim conn As SqlConnection = Nothing
        Dim da As SqlDataAdapter
        Dim cmd As SqlCommand = Nothing

        Dim strSQL As String

        Dim ds As DataSet = Nothing
        Dim dv As DataView = Nothing

        strSQL = "SELECT DISTINCT topic,topicid FROM [dbo].lu_topics " & _
                " ORDER BY topic ASC "

        Try
            conn = New SqlConnection(Common.GetConnString)
            cmd = New SqlCommand(strSQL, conn)
            cmd.CommandType = CommandType.Text

            da = New SqlDataAdapter(cmd)
            ds = New DataSet
            ds.CaseSensitive = False

            da.Fill(ds)
            dv = ds.Tables(0).DefaultView

        Catch ex As Exception
            Common.WrapException(ex)

        Finally

            If Not cmd Is Nothing Then
                cmd.Dispose()
            End If

            If conn.State = ConnectionState.Open Then
                conn.Close()
            End If

            conn.Dispose()
            conn = Nothing

            cmd = Nothing
            da = Nothing
            ds = Nothing

        End Try

        Return dv

    End Function

    '2017 Kristen
    Friend Shared Function GetResourceCategoriesByLookupTable() As DataView

        Dim conn As SqlConnection = Nothing
        Dim da As SqlDataAdapter
        Dim cmd As SqlCommand = Nothing

        Dim strSQL As String

        Dim ds As DataSet = Nothing
        Dim dv As DataView = Nothing

        strSQL = "SELECT resourcecategoryid, resourcecategory from lu_resourceCategory" & _
        " ORDER BY resourceCategory ASC "

        Try
            conn = New SqlConnection(Common.GetConnString)
            cmd = New SqlCommand(strSQL, conn)
            cmd.CommandType = CommandType.Text

            da = New SqlDataAdapter(cmd)
            ds = New DataSet
            ds.CaseSensitive = False

            da.Fill(ds)
            dv = ds.Tables(0).DefaultView

        Catch ex As Exception
            Common.WrapException(ex)

        Finally

            If Not cmd Is Nothing Then
                cmd.Dispose()
            End If

            If conn.State = ConnectionState.Open Then
                conn.Close()
            End If

            conn.Dispose()
            conn = Nothing

            cmd = Nothing
            da = Nothing
            ds = Nothing

        End Try

        Return dv

    End Function


    '2017 Kristen
    Friend Shared Function GetFileTypeByLookupTable() As DataView

        Dim conn As SqlConnection = Nothing
        Dim da As SqlDataAdapter
        Dim cmd As SqlCommand = Nothing

        Dim strSQL As String

        Dim ds As DataSet = Nothing
        Dim dv As DataView = Nothing

        strSQL = "SELECT filetypeid, filetype from lu_fileType" & _
        " ORDER BY filetype ASC "

        Try
            conn = New SqlConnection(Common.GetConnString)
            cmd = New SqlCommand(strSQL, conn)
            cmd.CommandType = CommandType.Text

            da = New SqlDataAdapter(cmd)
            ds = New DataSet
            ds.CaseSensitive = False

            da.Fill(ds)
            dv = ds.Tables(0).DefaultView

        Catch ex As Exception
            Common.WrapException(ex)

        Finally

            If Not cmd Is Nothing Then
                cmd.Dispose()
            End If

            If conn.State = ConnectionState.Open Then
                conn.Close()
            End If

            conn.Dispose()
            conn = Nothing

            cmd = Nothing
            da = Nothing
            ds = Nothing

        End Try

        Return dv

    End Function


    '2017 Kristen
    Friend Shared Function GetLanguageByLookupTable() As DataView

        Dim conn As SqlConnection = Nothing
        Dim da As SqlDataAdapter
        Dim cmd As SqlCommand = Nothing

        Dim strSQL As String

        Dim ds As DataSet = Nothing
        Dim dv As DataView = Nothing

        strSQL = "SELECT languageID, resourcelanguage from lu_language" & _
        " ORDER BY resourcelanguage ASC "

        Try
            conn = New SqlConnection(Common.GetConnString)
            cmd = New SqlCommand(strSQL, conn)
            cmd.CommandType = CommandType.Text

            da = New SqlDataAdapter(cmd)
            ds = New DataSet
            ds.CaseSensitive = False

            da.Fill(ds)
            dv = ds.Tables(0).DefaultView

        Catch ex As Exception
            Common.WrapException(ex)

        Finally

            If Not cmd Is Nothing Then
                cmd.Dispose()
            End If

            If conn.State = ConnectionState.Open Then
                conn.Close()
            End If

            conn.Dispose()
            conn = Nothing

            cmd = Nothing
            da = Nothing
            ds = Nothing

        End Try

        Return dv

    End Function


    '2017 Kristen
    Friend Shared Function GetEventbySectorForLookupTable(ByRef myStr As String) As DataView

        Dim conn As SqlConnection = Nothing
        Dim da As SqlDataAdapter
        Dim cmd As SqlCommand = Nothing

        Dim strSQL As String

        Dim ds As DataSet = Nothing
        Dim dv As DataView = Nothing

        strSQL = "SELECT events.eventId, events.name + ' (' + CAST(YEAR(events.startDate) AS varchar) + '-' + CAST(MONTH(events.startDate) AS varchar) + ')' AS eventname" & _
                " FROM     events INNER JOIN eventSectors ON events.eventId = eventSectors.eventId INNER JOIN " & _
                "  lu_sector AS lu ON eventSectors.sectorId = lu.SectorAbbr WHERE(lu.SectorID = " & myStr & ") ORDER BY events.startDate DESC, events.name "


        Try
            conn = New SqlConnection(Common.GetConnString)
            cmd = New SqlCommand(strSQL, conn)
            cmd.CommandType = CommandType.Text

            da = New SqlDataAdapter(cmd)
            ds = New DataSet
            ds.CaseSensitive = False

            da.Fill(ds)
            dv = ds.Tables(0).DefaultView

        Catch ex As Exception
            Common.WrapException(ex)

        Finally

            If Not cmd Is Nothing Then
                cmd.Dispose()
            End If

            If conn.State = ConnectionState.Open Then
                conn.Close()
            End If

            conn.Dispose()
            conn = Nothing

            cmd = Nothing
            da = Nothing
            ds = Nothing

        End Try

        Return dv

    End Function

    'sarah 2009
    Friend Shared Function GetSectorsForEventsByLookupTable() As DataView

        Dim conn As SqlConnection = Nothing
        Dim da As SqlDataAdapter
        Dim cmd As SqlCommand = Nothing

        Dim strSQL As String

        Dim ds As DataSet = Nothing
        Dim dv As DataView = Nothing

        strSQL = "SELECT sectorid, sector,sectorabbr FROM [dbo].lu_sector where isEvent=1 " & _
                " ORDER BY eventOrder ASC "

        Try
            conn = New SqlConnection(Common.GetConnString)
            cmd = New SqlCommand(strSQL, conn)
            cmd.CommandType = CommandType.Text

            da = New SqlDataAdapter(cmd)
            ds = New DataSet
            ds.CaseSensitive = False

            da.Fill(ds)
            dv = ds.Tables(0).DefaultView

        Catch ex As Exception
            Common.WrapException(ex)

        Finally

            If Not cmd Is Nothing Then
                cmd.Dispose()
            End If

            If conn.State = ConnectionState.Open Then
                conn.Close()
            End If

            conn.Dispose()
            conn = Nothing

            cmd = Nothing
            da = Nothing
            ds = Nothing

        End Try

        Return dv

    End Function


    'sarah 2009
    'for sector list box
    Friend Shared Function GetSectorsDTForEventsByLookupTable() As DataTable

        Dim conn As SqlConnection = Nothing
        Dim da As SqlDataAdapter
        Dim cmd As SqlCommand = Nothing

        Dim strSQL As String

        Dim ds As DataSet = Nothing
        Dim dv As DataView = Nothing
        Dim dt As DataTable = Nothing

        strSQL = "SELECT sector, sectordesc, sectorabbr FROM [dbo].lu_sector where isEvent=1 " & _
                " ORDER BY eventOrder ASC "

        Try
            conn = New SqlConnection(Common.GetConnString)
            cmd = New SqlCommand(strSQL, conn)
            cmd.CommandType = CommandType.Text

            da = New SqlDataAdapter(cmd)
            ds = New DataSet
            ds.CaseSensitive = False


            da = New SqlDataAdapter(cmd)
            ds = New DataSet
            ds.CaseSensitive = False

            da.Fill(ds)
            dt = ds.Tables(0)

        Catch ex As Exception
            Common.WrapException(ex)

        Finally

            If Not cmd Is Nothing Then
                cmd.Dispose()
            End If

            If conn.State = ConnectionState.Open Then
                conn.Close()
            End If

            conn.Dispose()
            conn = Nothing

            cmd = Nothing
            da = Nothing
            ds = Nothing

        End Try

        Return dt

    End Function

    'sarah 2009
    Friend Shared Function GetPartnerCountryNameByPcId(ByRef pcId As String) As String

        Dim conn As SqlConnection = Nothing
        Dim da As SqlDataAdapter
        Dim cmd As SqlCommand = Nothing

        Dim strSQL As String

        Dim ds As DataSet = Nothing
        Dim dt As DataTable = Nothing

        Dim retStr As String = ""

        strSQL = "SELECT DISTINCT PartnerCountry as countryname,Upper(PartnerCountry) as pcountry, pcId FROM [dbo].l_PartnerCountry " & _
                " where pcId=" & pcId

        Try
            conn = New SqlConnection(Common.GetConnString)
            cmd = New SqlCommand(strSQL, conn)
            cmd.CommandType = CommandType.Text

            da = New SqlDataAdapter(cmd)
            ds = New DataSet
            ds.CaseSensitive = False

            da.Fill(ds)
            dt = ds.Tables(0)

            Dim x
            For x = 0 To dt.Rows.Count - 1
                retStr = dt.Rows(x)("countryname")
            Next

        Catch ex As Exception
            Common.WrapException(ex)

        Finally

            If Not cmd Is Nothing Then
                cmd.Dispose()
            End If

            If conn.State = ConnectionState.Open Then
                conn.Close()
            End If

            conn.Dispose()
            conn = Nothing

            cmd = Nothing
            da = Nothing
            ds = Nothing

        End Try

        Return retStr

    End Function


    'Friend Shared Function GetProjectNetworkMembersbyID(ID As String) As DataView

    '    Dim conn As SqlConnection
    '    Dim da As SqlDataAdapter
    '    Dim cmd As SqlCommand

    '    Dim strSQL As String

    '    Dim ds As DataSet
    '    Dim dv As DataView

    '    '[dbo].organization
    '    strSQL = "SELECT sf_organizations.Id, sf_organizations.Name, sf_organizations.Organization_Category, sf_organizations.Project_Network_Areas_of_Interest, sf_organizations.Project_Network_Geographic_Interest, " & _
    '                 " sf_organizations.Expertise, sf_organizations.Website, sf_organizations.Id AS orgID, sf_Contacts.LastName, sf_Contacts.FirstName, sf_Contacts.Email, sf_Contacts.Phone, " & _
    '                 " sf_Contacts.Areas_of_interest " & _
    '                 "   FROM     sf_organizations INNER JOIN " & _
    '                 " sf_Contacts ON sf_organizations.Id = sf_Contacts.Organization " & _
    '                 "   ORDER BY sf_organizations.Name" & _
    '                 " where sf_organization.id='" & ID & "'"

    '    Try
    '        conn = New SqlConnection(Common.GetConnString)
    '        cmd = New SqlCommand(strSQL, conn)
    '        cmd.CommandType = CommandType.Text

    '        da = New SqlDataAdapter(cmd)
    '        ds = New DataSet
    '        ds.CaseSensitive = False

    '        da.Fill(ds)
    '        dv = ds.Tables(0).DefaultView

    '    Catch ex As Exception
    '        Common.WrapException(ex)

    '    Finally

    '        If Not cmd Is Nothing Then
    '            cmd.Dispose()
    '        End If

    '        If conn.State = ConnectionState.Open Then
    '            conn.Close()
    '        End If

    '        conn.Dispose()
    '        conn = Nothing

    '        cmd = Nothing
    '        da = Nothing
    '        ds = Nothing

    '    End Try

    '    Return dv

    'End Function


    Friend Shared Function GetCountryNameByCId(ByRef cId As String) As String

        Dim conn As SqlConnection = Nothing
        Dim da As SqlDataAdapter
        Dim cmd As SqlCommand = Nothing

        Dim strSQL As String

        Dim ds As DataSet = Nothing
        Dim dt As DataTable = Nothing

        Dim retStr As String = ""

        strSQL = "SELECT countryname FROM [dbo].lu_Country " & _
                " where eventcountryID =" & cId

        Try
            conn = New SqlConnection(Common.GetConnString)
            cmd = New SqlCommand(strSQL, conn)
            cmd.CommandType = CommandType.Text

            da = New SqlDataAdapter(cmd)
            ds = New DataSet
            ds.CaseSensitive = False

            da.Fill(ds)
            dt = ds.Tables(0)

            Dim x
            For x = 0 To dt.Rows.Count - 1
                retStr = dt.Rows(x)("countryname")
            Next

        Catch ex As Exception
            Common.WrapException(ex)

        Finally

            If Not cmd Is Nothing Then
                cmd.Dispose()
            End If

            If conn.State = ConnectionState.Open Then
                conn.Close()
            End If

            conn.Dispose()
            conn = Nothing

            cmd = Nothing
            da = Nothing
            ds = Nothing

        End Try

        Return retStr

    End Function

    'sarah 2009
    Friend Shared Function GetSectorsForEventsBySectorName(ByRef myStr As String) As DataTable

        Dim conn As SqlConnection = Nothing
        Dim da As SqlDataAdapter
        Dim cmd As SqlCommand = Nothing

        Dim strSQL As String

        Dim ds As DataSet = Nothing
        Dim dt As DataTable = Nothing

        strSQL = "SELECT sector, sectordesc, sectorabbr FROM [dbo].lu_sector where isEvent=1  and sector in (" & myStr & ") " & _
                " ORDER BY eventOrder ASC "

        Try
            conn = New SqlConnection(Common.GetConnString)
            cmd = New SqlCommand(strSQL, conn)
            cmd.CommandType = CommandType.Text

            da = New SqlDataAdapter(cmd)
            ds = New DataSet
            ds.CaseSensitive = False

            da.Fill(ds)
            dt = ds.Tables(0)

        Catch ex As Exception
            Common.WrapException(ex)

        Finally

            If Not cmd Is Nothing Then
                cmd.Dispose()
            End If

            If conn.State = ConnectionState.Open Then
                conn.Close()
            End If

            conn.Dispose()
            conn = Nothing

            cmd = Nothing
            da = Nothing
            ds = Nothing

        End Try

        Return dt

    End Function

    'sarah 2009 not being used
    'we do not have all option any more.
    Friend Shared Function GetSectorsForEventsByAll() As DataTable

        Dim conn As SqlConnection = Nothing
        Dim da As SqlDataAdapter
        Dim cmd As SqlCommand = Nothing

        Dim strSQL As String

        Dim ds As DataSet = Nothing
        Dim dt As DataTable = Nothing

        strSQL = "SELECT sector, sectordesc, sectorabbr FROM [dbo].lu_sector where isEvent=1  and not sector in ('all') " & _
                " ORDER BY eventOrder ASC "

        Try
            conn = New SqlConnection(Common.GetConnString)
            cmd = New SqlCommand(strSQL, conn)
            cmd.CommandType = CommandType.Text

            da = New SqlDataAdapter(cmd)
            ds = New DataSet
            ds.CaseSensitive = False

            da.Fill(ds)
            dt = ds.Tables(0)

        Catch ex As Exception
            Common.WrapException(ex)

        Finally

            If Not cmd Is Nothing Then
                cmd.Dispose()
            End If

            If conn.State = ConnectionState.Open Then
                conn.Close()
            End If

            conn.Dispose()
            conn = Nothing

            cmd = Nothing
            da = Nothing
            ds = Nothing

        End Try

        Return dt

    End Function



    'sarah 2010
    'for event year list box
    Friend Shared Function GetYearsDTForEvents() As DataTable

        Dim conn As SqlConnection = Nothing
        Dim da As SqlDataAdapter
        Dim cmd As SqlCommand = Nothing

        Dim strSQL As String

        Dim ds As DataSet = Nothing
        Dim dv As DataView = Nothing
        Dim dt As DataTable = Nothing

        strSQL = "SELECT year FROM [dbo].l_years order by year desc"

        Try
            conn = New SqlConnection(Common.GetConnString)
            cmd = New SqlCommand(strSQL, conn)
            cmd.CommandType = CommandType.Text

            da = New SqlDataAdapter(cmd)
            ds = New DataSet
            ds.CaseSensitive = False


            da = New SqlDataAdapter(cmd)
            ds = New DataSet
            ds.CaseSensitive = False

            da.Fill(ds)
            dt = ds.Tables(0)

        Catch ex As Exception
            Common.WrapException(ex)

        Finally

            If Not cmd Is Nothing Then
                cmd.Dispose()
            End If

            If conn.State = ConnectionState.Open Then
                conn.Close()
            End If

            conn.Dispose()
            conn = Nothing

            cmd = Nothing
            da = Nothing
            ds = Nothing

        End Try

        Return dt

    End Function

End Class
