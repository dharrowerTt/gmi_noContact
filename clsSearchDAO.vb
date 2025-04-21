
Imports System.Data
Imports System.Data.SqlClient

Public Class clsSearchDAO
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


    Public Function SearchTypeListByCategory(ByVal category As String) As DataTable
        Dim strQuery As String = "select distinct category, [type] from tbl_AdvancedSearch where [type] is not null and [type] <> '' "
        If Not IsNothing(category) Then
            strQuery += " and category = '" & category & "'"
        End If
        strQuery += " order by category"
        Dim cmd As New SqlCommand(strQuery)
        'Debug.Print strQuery
        Dim dt As DataTable = GetData(cmd)
        Return dt
    End Function

    Public Function SearchTopicListByCategory() As DataTable
        Dim strQuery As String = "select distinct topic, topicid from lu_topics where topic in (select distinct topic from tbl_advancedSearch)"
        strQuery += " order by topic"
        Dim cmd As New SqlCommand(strQuery)
        'Debug.Print strQuery
        Dim dt As DataTable = GetData(cmd)
        Return dt
    End Function

    Public Function SearchRegionList() As DataTable
        Dim strQuery As String = "select distinct region from tbl_AdvancedSearchCountries where region is not null and region <> '' "
        strQuery += "order by region"
        Dim cmd As New SqlCommand(strQuery)
        'Debug.Print strQuery
        Dim dt As DataTable = GetData(cmd)
        Return dt
    End Function

    Public Function SearchCountryList() As DataTable
        Dim strQuery As String = "SELECT DISTINCT tc.region, c.CountryName as country FROM     tbl_AdvancedSearchCountries tc INNER JOIN lu_country AS r ON tc.region = r.CountryName INNER JOIN lu_country AS c ON r.countryID = c.ParentID and c.countryid in (select distinct countryID from tbl_search_x_country)"
        strQuery += " order by region, c.countryname"
        Dim cmd As New SqlCommand(strQuery)
        'Debug.Print strQuery
        Dim dt As DataTable = GetData(cmd)
        Return dt
    End Function

    Public Function GetCountryFromID(ByVal countryid As String) As DataTable
        Dim strQuery As String = "SELECT DISTINCT tc.region, c.CountryName as country FROM     tbl_AdvancedSearchCountries tc INNER JOIN lu_country AS r ON tc.region = r.CountryName INNER JOIN lu_country AS c ON r.countryID = c.ParentID and c.countryid in (select distinct countryID from tbl_search_x_country)"
        strQuery += " where c.countryid = " & countryid
        Dim cmd As New SqlCommand(strQuery)
        'Debug.Print strQuery
        Dim dt As DataTable = GetData(cmd)
        Return dt
    End Function

    Public Function SearchCountryListbyRegion(ByVal region As String) As DataTable
        Dim strQuery As String = "SELECT DISTINCT tc.region, c.CountryName as country FROM     tbl_AdvancedSearchCountries tc INNER JOIN lu_country AS r ON tc.region = r.CountryName INNER JOIN lu_country AS c ON r.countryID = c.ParentID and c.countryid in (select distinct countryID from tbl_search_x_country)"
        strQuery += " WHERE r.countryname = '" & region & "' order by region, c.countryname"
        Dim cmd As New SqlCommand(strQuery)
        'Debug.Print strQuery
        Dim dt As DataTable = GetData(cmd)
        Return dt
    End Function

    Public Function SearchCountryListbyMultipleRegion(ByVal regionFilterChng As String) As DataTable
        Dim strQuery As String = "SELECT DISTINCT tc.region, replace(c.CountryName,'''','') as country, c.countryid FROM     tbl_AdvancedSearchCountries tc INNER JOIN lu_country AS r ON tc.region = r.CountryName INNER JOIN lu_country AS c ON r.countryID = c.ParentID and c.countryid in (select distinct countryID from tbl_search_x_country)"
        strQuery += regionFilterChng & " order by country "
        Dim cmd As New SqlCommand(strQuery)
        'Debug.Print strQuery
        Dim dt As DataTable = GetData(cmd)
        Return dt
    End Function

    Public Function SearchSectorList() As DataTable
        Dim strQuery As String = "select distinct sector,sectorabbr from lu_sector "
        strQuery += "order by sector"
        Dim cmd As New SqlCommand(strQuery)
        'Debug.Print strQuery
        Dim dt As DataTable = GetData(cmd)
        Return dt
    End Function

    Public Function getSectorFromAbbr(ByVal abbr As String) As DataTable
        Dim strQuery As String = "select distinct sector,sectorabbr from lu_sector "
        strQuery += " where lu_sector.sectorabbr = 's" & abbr & "'"
        Dim cmd As New SqlCommand(strQuery)
        'Debug.Print strQuery
        Dim dt As DataTable = GetData(cmd)
        Return dt
    End Function

    Public Function GetSearchResults(Optional ByVal orderby As String = "", Optional ByVal sectorFilter As String = "", Optional ByVal regionFilter As String = "", Optional ByVal categoryFilter As String = "", Optional ByVal topicFilter As String = "", Optional ByVal countryFilter As String = "", Optional ByVal keywordFilter As String = "", Optional ByVal dateFilter As String = "", Optional ByVal isArchived As String = "", Optional ByVal isFinal As String = "") As DataTable
        Dim strQuery As String = " SELECT search.ID, search.category, search.type, search.Name, search.year, search.language, search.preferred_order, search.Link , search.imgUrl, search.LinkText, countries, region, search.categoryOrder, search.sectors, search.filetype, search.topic FROM     tbl_AdvancedSearch AS search WHERE 1=1"
        If Len(sectorFilter) > 0 Then
            strQuery += " AND search.ID_category in (select distinct ID_category from tbl_search_x_sector WHERE sector in (" & sectorFilter & "))"
        End If
        If Len(regionFilter) > 0 Then
            strQuery += " AND [region] IN (" & regionFilter & ")"
        End If
        If Len(topicFilter) > 0 Then
            strQuery += " AND search.[topicid] IN (" & topicFilter & ")"
        End If
        If Len(categoryFilter) > 0 Then
            strQuery += " AND search.category = " & categoryFilter
        End If
        If Len(countryFilter) > 0 Then
            strQuery += " AND search.ID_category in (select distinct ID_category from tbl_search_x_country  WHERE replace(country,'''','') in (" & countryFilter & "))"
        End If
        If Len(keywordFilter) > 0 Then
            strQuery += keywordFilter
        End If
        If Len(dateFilter) > 0 Then
            strQuery += dateFilter
        End If
        If Len(isArchived) > 0 Then ' 0 for false (not archived); 1 for true (archived)
            strQuery += " AND search.archivedYN = " & isArchived
        End If
        If isFinal = 1 Then 'final only
            strQuery += " AND search.status='final' "
        ElseIf isFinal = 0 Then ' draft and all other status
            strQuery += " AND search.status<>'final' "
        End If
        If Len(orderby) > 0 Then
            strQuery += orderby
        End If
        Dim cmd As New SqlCommand(strQuery)
        'Debug.Print strQuery
        Dim dt As DataTable = GetData(cmd)
        Return dt
    End Function
    Public Function GetTopSearchResults(ByVal count As Integer, Optional ByVal orderby As String = "", Optional ByVal sectorFilter As String = "", Optional ByVal regionFilter As String = "", Optional ByVal categoryFilter As String = "", Optional ByVal topicFilter As String = "", Optional ByVal countryFilter As String = "", Optional ByVal keywordFilter As String = "", Optional ByVal dateFilter As String = "", Optional ByVal isArchived As String = "", Optional ByVal isFinal As String = "") As DataTable
        'only the first parameter is required. Use the count of results that should be returned
        Dim strQuery As String = " SELECT top " & count & "  search.ID, search.category, search.type, search.Name, search.year, search.language, search.preferred_order, search.Link , search.imgUrl, search.LinkText, countries, region, search.categoryOrder, search.sectors, search.filetype, search.topic, search.featured FROM     tbl_AdvancedSearch AS search WHERE 1=1"
        If Len(sectorFilter) > 0 Then
            strQuery += " AND search.ID_category in (select distinct ID_category from tbl_search_x_sector WHERE sector in (" & sectorFilter & "))"
        End If
        If Len(regionFilter) > 0 Then
            strQuery += " AND [region] IN (" & regionFilter & ")"
        End If
        If Len(topicFilter) > 0 Then
            strQuery += " AND search.[topicid] IN (" & topicFilter & ")"
        End If
        If Len(categoryFilter) > 0 Then
            strQuery += " AND search.category = " & categoryFilter
        End If
        If Len(countryFilter) > 0 Then
            strQuery += " AND search.ID_category in (select distinct ID_category from tbl_search_x_country  WHERE replace(country,'''','') in (" & countryFilter & "))"
        End If
        If Len(keywordFilter) > 0 Then
            strQuery += keywordFilter
        End If
        If Len(dateFilter) > 0 Then
            strQuery += dateFilter
        End If
        If Len(isArchived) > 0 Then ' 0 for false (not archived); 1 for true (archived)
            strQuery += " AND search.archivedYN = " & isArchived
        End If
        If isFinal = 1 Then 'final only
            strQuery += " AND search.status='final' "
        ElseIf isFinal = 0 Then ' draft and all other status
            strQuery += " AND search.status<>'final' "
        End If
        strQuery += "AND (search.featured = 1 or search.startdate >= DATEADD(m, -6, convert(date, convert(varchar(6), getdate(),112) + '01')))"
        strQuery += " ORDER BY search.startdate desc"
        Dim cmd As New SqlCommand(strQuery)
        'Debug.Print strQuery
        Dim dt As DataTable = GetData(cmd)
        Return dt
    End Function

    Public Function GetTopicList(Optional ByVal orderby As String = "", Optional ByVal sectorFilter As String = "", Optional ByVal regionFilter As String = "", Optional ByVal categoryFilter As String = "", Optional ByVal topicFilter As String = "", Optional ByVal countryFilter As String = "", Optional ByVal keywordFilter As String = "", Optional ByVal dateFilter As String = "", Optional ByVal isArchived As String = "", Optional ByVal isFinal As String = "") As DataTable
        Dim strQuery As String = " SELECT distinct search.topicid, search.topictype, search.topic FROM     tbl_AdvancedSearch AS search WHERE 1=1"
        If Len(sectorFilter) > 0 Then
            strQuery += " AND search.ID_category in (select distinct ID_category from tbl_search_x_sector WHERE sector in (" & sectorFilter & "))"
        End If
        If Len(regionFilter) > 0 Then
            strQuery += " AND [region] IN (" & regionFilter & ")"
        End If
        If Len(topicFilter) > 0 Then
            strQuery += " AND search.[topicid] IN (" & topicFilter & ")"
        End If
        strQuery += " AND search.[topicid] is not null"
        If Len(categoryFilter) > 0 Then
            strQuery += " AND search.category = " & categoryFilter
        End If
        If Len(countryFilter) > 0 Then
            strQuery += " AND search.ID_category in (select distinct ID_category from tbl_search_x_country  WHERE replace(country,'''','') in (" & countryFilter & "))"
        End If
        If Len(keywordFilter) > 0 Then
            strQuery += keywordFilter
        End If
        If Len(dateFilter) > 0 Then
            strQuery += dateFilter
        End If
        If Len(isArchived) > 0 Then ' 0 for false (not archived); 1 for true (archived)
            strQuery += " AND search.archivedYN = " & isArchived
        End If
        If isFinal = 1 Then 'final only
            strQuery += " AND search.status='final' "
        ElseIf isFinal = 0 Then ' draft and all other status
            strQuery += " AND search.status<>'final' "
        End If
        strQuery += " ORDER BY search.topic"
        Dim cmd As New SqlCommand(strQuery)
        'Debug.Print strQuery
        Dim dt As DataTable = GetData(cmd)
        Return dt
    End Function
    Public Function GetSectorList(Optional ByVal orderby As String = "", Optional ByVal sectorFilter As String = "", Optional ByVal regionFilter As String = "", Optional ByVal categoryFilter As String = "", Optional ByVal topicFilter As String = "", Optional ByVal countryFilter As String = "", Optional ByVal keywordFilter As String = "", Optional ByVal dateFilter As String = "", Optional ByVal isArchived As String = "", Optional ByVal isFinal As String = "") As DataTable
        Dim strQuery As String = " SELECT distinct tbl_search_x_sector.sector, lu_sector.sectorAbbr FROM     tbl_AdvancedSearch AS search  inner join tbl_search_x_sector on search.ID_category = tbl_search_x_sector.ID_category inner join lu_sector on tbl_search_x_sector.sectorid = lu_sector.sectorID WHERE 1=1"
        If Len(sectorFilter) > 0 Then
            strQuery += " AND search.ID_category in (select distinct ID_category from tbl_search_x_sector WHERE sector in (" & sectorFilter & "))"
        End If
        If Len(regionFilter) > 0 Then
            strQuery += " AND [region] IN (" & regionFilter & ")"
        End If
        If Len(topicFilter) > 0 Then
            strQuery += " AND search.[topicid] IN (" & topicFilter & ")"
        End If
        strQuery += " AND search.[topicid] is not null"
        If Len(categoryFilter) > 0 Then
            strQuery += " AND search.category = " & categoryFilter
        End If
        If Len(countryFilter) > 0 Then
            strQuery += " AND search.ID_category in (select distinct ID_category from tbl_search_x_country  WHERE replace(country,'''','') in (" & countryFilter & "))"
        End If
        If Len(keywordFilter) > 0 Then
            strQuery += keywordFilter
        End If
        If Len(dateFilter) > 0 Then
            strQuery += dateFilter
        End If
        If Len(isArchived) > 0 Then ' 0 for false (not archived); 1 for true (archived)
            strQuery += " AND search.archivedYN = " & isArchived
        End If
        If isFinal = 1 Then 'final only
            strQuery += " AND search.status='final' "
        ElseIf isFinal = 0 Then ' draft and all other status
            strQuery += " AND search.status<>'final' "
        End If

        Dim cmd As New SqlCommand(strQuery)
        'Debug.Print strQuery
        Dim dt As DataTable = GetData(cmd)
        Return dt
    End Function

    Public Function getPartnerList()
        Dim strQuery As String = "select distinct name, replace(replace(name,' ',''),'''','') as flagname, year(date_joined) as year_joined from sf_countries where status = 'Member' and name not like '%natural gas%'"
        Dim cmd As New SqlCommand(strQuery)

        Dim dt As DataTable = GetData(cmd)
        Return dt

    End Function

    Public Function GetPartnerInfo(ByVal CTRYlookupName As String) As DataTable


        Dim pagenamelookup As String = ""
        pagenamelookup = getGeoFocus(CTRYlookupName)
        pagenamelookup = Replace(pagenamelookup, "'", "")


        If String.Equals(pagenamelookup, "Dominicanrepublic", StringComparison.OrdinalIgnoreCase) Then
            pagenamelookup = "Dominican Republic"
        End If
        If String.Equals(pagenamelookup, "Turkiye", StringComparison.OrdinalIgnoreCase) Then
            pagenamelookup = "Turkey"
        End If
        If String.Equals(pagenamelookup, "republicofkorea", StringComparison.OrdinalIgnoreCase) Then
            pagenamelookup = "Republic of Korea"
        End If
        If String.Equals(pagenamelookup, "republicofnorthmacedonia", StringComparison.OrdinalIgnoreCase) Then
            pagenamelookup = "Republic of North Macedonia"
        End If
        If String.Equals(pagenamelookup, "unitedkingdom", StringComparison.OrdinalIgnoreCase) Then
            pagenamelookup = "United Kingdom"
        End If
        If String.Equals(pagenamelookup, "saudiarabia", StringComparison.OrdinalIgnoreCase) Then
            pagenamelookup = "Saudi Arabia"
        End If
        If String.Equals(pagenamelookup, "unitedstates", StringComparison.OrdinalIgnoreCase) Then
            pagenamelookup = "United States"
        End If

        Dim strQuery As String = "select distinct name, replace(replace(name,' ',''),'''','') as flagname, year(date_joined) as year_joined from sf_countries where name not like '%natural gas%' and replace([sf_countries].[Name],'''','') = '" & pagenamelookup & "'"
        Dim cmd As New SqlCommand(strQuery)

        Dim dt As DataTable = GetData(cmd)
        Return dt

    End Function

    Public Function GetCountryList(Optional ByVal orderby As String = "", Optional ByVal sectorFilter As String = "", Optional ByVal regionFilter As String = "", Optional ByVal categoryFilter As String = "", Optional ByVal topicFilter As String = "", Optional ByVal countryFilter As String = "", Optional ByVal keywordFilter As String = "", Optional ByVal dateFilter As String = "", Optional ByVal isArchived As String = "", Optional ByVal isFinal As String = "") As DataTable
        Dim strQuery As String = " SELECT distinct tbl_search_x_country.country, tbl_search_x_country.countryid FROM     tbl_AdvancedSearch AS search inner join tbl_search_x_country on search.id_category = tbl_search_x_country.id_category WHERE countryid in (select distinct countryid from lu_country where parentid is not null and type = 'Country')  "
        If Len(sectorFilter) > 0 Then
            strQuery += " AND search.ID_category in (select distinct ID_category from tbl_search_x_sector WHERE sector in (" & sectorFilter & "))"
        End If
        If Len(regionFilter) > 0 Then
            strQuery += " AND [region] IN (" & regionFilter & ")"
        End If
        If Len(topicFilter) > 0 Then
            strQuery += " AND search.[topicid] IN (" & topicFilter & ")"
        End If
        strQuery += " AND search.[topicid] is not null"
        If Len(categoryFilter) > 0 Then
            strQuery += " AND search.category = " & categoryFilter
        End If
        If Len(countryFilter) > 0 Then
            strQuery += " AND search.ID_category in (select distinct ID_category from tbl_search_x_country  WHERE replace(country,'''','') in (" & countryFilter & "))"
        End If
        If Len(keywordFilter) > 0 Then
            strQuery += keywordFilter
        End If
        If Len(dateFilter) > 0 Then
            strQuery += dateFilter
        End If
        If Len(isArchived) > 0 Then ' 0 for false (not archived); 1 for true (archived)
            strQuery += " AND search.archivedYN = " & isArchived
        End If
        If isFinal = 1 Then 'final only
            strQuery += " AND search.status='final' "
        ElseIf isFinal = 0 Then ' draft and all other status
            strQuery += " AND search.status<>'final' "
        End If
        strQuery += "  order by tbl_search_x_country.country"
        Dim cmd As New SqlCommand(strQuery)
        'Debug.Print strQuery
        Dim dt As DataTable = GetData(cmd)
        Return dt
    End Function

    Public Function GetCommitments(Optional ByVal orderby As String = "", Optional ByVal sectorFilter As String = "", Optional ByVal regionFilter As String = "", Optional ByVal categoryFilter As String = "", Optional ByVal topicFilter As String = "", Optional ByVal countryFilter As String = "", Optional ByVal keywordFilter As String = "", Optional ByVal dateFilter As String = "", Optional ByVal isArchived As String = "", Optional ByVal isFinal As String = "") As DataTable
        Dim strQuery As String = " SELECT * FROM     gmcData"
        Dim cmd As New SqlCommand(strQuery)
        'Debug.Print strQuery
        Dim dt As DataTable = GetData(cmd)
        Return dt
    End Function

    Public Function GetDetails(Optional ByVal orderby As String = "", Optional ByVal sectorFilter As String = "", Optional ByVal regionFilter As String = "", Optional ByVal categoryFilter As String = "", Optional ByVal topicFilter As String = "", Optional ByVal countryFilter As String = "", Optional ByVal keywordFilter As String = "", Optional ByVal dateFilter As String = "", Optional ByVal isArchived As String = "", Optional ByVal isFinal As String = "") As DataTable
        Dim strQuery As String = " SELECT * FROM     gmcData"
        Dim cmd As New SqlCommand(strQuery)
        'Debug.Print strQuery
        Dim dt As DataTable = GetData(cmd)
        Return dt
    End Function



    'Public Function SearchResultsByCategory(ByVal category As String) As DataTable
    '    Dim strQuery As String = "SELECT DISTINCT category, type, Name, Year, country_1, language, preferred_order, categoryOrder, Link FROM      tbl_AdvancedSearch "
    '    If Not IsNothing(category) Then
    '        strQuery += " WHERE category = '" & category & "'"
    '    End If
    '    strQuery += "order by categoryOrder, category, preferred_order, name"
    '    Dim cmd As New SqlCommand(strQuery)
    '    Dim dt As DataTable = GetData(cmd)
    '    Return dt
    'End Function

    'Public Function SearchResultsByType(ByVal type As String) As DataTable
    '    Dim strQuery As String = "SELECT DISTINCT category, type, Name, Year, country_1, language, preferred_order, Link FROM      tbl_AdvancedSearch "
    '    If Not IsNothing(type) Then
    '        strQuery += " WHERE [type] = '" & type & "'"
    '    End If
    '    strQuery += "order by category, [type]"
    '    Dim cmd As New SqlCommand(strQuery)
    '    Dim dt As DataTable = GetData(cmd)
    '    Return dt
    ' End Function
    Public Function GetDM(Optional ByVal orderby As String = "", Optional ByVal sectorFilter As String = "", Optional ByVal regionFilter As String = "", Optional ByVal categoryFilter As String = "", Optional ByVal topicFilter As String = "", Optional ByVal countryFilter As String = "", Optional ByVal keywordFilter As String = "", Optional ByVal dateFilter As String = "", Optional ByVal isArchived As String = "", Optional ByVal isFinal As String = "") As DataTable
        Dim strQuery As String = " SELECT *, convert(nvarchar(10), [dateAdded], 102) as 'dateFormatted' FROM dashboardDM order by dateFormatted DESC"
        Dim cmd As New SqlCommand(strQuery)
        'Debug.Print strQuery
        Dim dt As DataTable = GetData(cmd)
        Return dt
    End Function

    '------------------Calendar Lookup
    Public Function GetCalendar(Optional ByVal orderby As String = "", Optional ByVal sectorFilter As String = "", Optional ByVal regionFilter As String = "", Optional ByVal categoryFilter As String = "", Optional ByVal topicFilter As String = "", Optional ByVal countryFilter As String = "", Optional ByVal keywordFilter As String = "", Optional ByVal dateFilter As String = "", Optional ByVal isArchived As String = "", Optional ByVal isFinal As String = "") As DataTable
        Dim strQuery As String = "SELECT TOP 3 [eventId] ,[name] ,cast(day(startDate) as varchar) as StartDateDay, cast(month(startDate) as varchar) as StartDateMonth, cast(day(endDate) as varchar) As EndDateDay, cast(datename(month,endDate) as varchar) as EndDateMonth, LEFT(LTRIM([dbo].udf_StripHTML([details])),90) as contractedDetails FROM [dbo].[events] where [startDate] > GETDATE() and eventstatus = 'final' and Subcommittee = 0  order by startDate Asc"
        Dim cmd As New SqlCommand(strQuery)
        'Debug.Print strQuery
        Dim dt As DataTable = GetData(cmd)
        Return dt
    End Function


    Public Function GetCountryResources(ByVal FRlookupName As String) As DataTable

        Dim strQuery As String = "SELECT TOP 3 [eventId] ,[name] ,[startDate], [countryName] FROM 	[events] left join 	[lu_country] on 	[events].[country] = 	[lu_country].[countryID] where countryName = '" & FRlookupName & "' order by startDate desc"
        Dim cmd As New SqlCommand(strQuery)
        'Debug.Print strQuery
        Dim dt As DataTable = GetData(cmd)
        Return dt
    End Function

    Public Function GetCountryEvents(ByVal FRlookupName As String) As DataTable

        Dim strQuery As String = "SELECT TOP 3 [eventId] ,[name] ,[startDate], [countryName] FROM 	[events] left join 	[lu_country] on 	[events].[country] = 	[lu_country].[countryID] where countryName = '" & FRlookupName & "' order by startDate desc"
        Dim cmd As New SqlCommand(strQuery)
        'Debug.Print strQuery
        Dim dt As DataTable = GetData(cmd)
        Return dt
    End Function

    Public Function GetCountryDelegates(ByVal CTRYlookupName As String) As DataTable

        Dim pagenamelookup As String = ""
        pagenamelookup = getGeoFocus(CTRYlookupName)

        Dim strQuery As String = ""

        If pagenamelookup = "Cote d'Ivoire" Then

            strQuery = "SELECT        COUNT(sf_committee_delegate.Active) AS CountOfDelegates, sf_committee.Name, " &
              " case when sf_committee.name = 'Steering Committee' then 1 else case when sf_committee.name like '%Biogas%' then 2 else case when sf_committee.name = 'Agriculture Technical Group' then 3 else case when sf_committee.name = 'MSW Technical Group' then 4 else case when sf_committee.name = 'Wastewater Technical Group' then 5 else case when sf_committee.name = 'Coal Subcommittee' then 6 else case when sf_committee.name = 'Oil & Gas Subcommittee' then 7 else 0 end end end end end end end as [order] " &
              " From sf_committee_delegate LEFT OUTER Join " &
              " sf_committee ON sf_committee_delegate.Committee = sf_committee.Id LEFT OUTER JOIN " &
              " sf_countries On sf_committee_delegate.Country_Representing = sf_countries.Id " &
                 "  Where [sf_committee_delegate].Active = 1 And [sf_countries].[Name] Like 'Cote d*'" &
                 "  group by [sf_committee].[Name] order by [order]"

        Else



            strQuery = "SELECT        COUNT(sf_committee_delegate.Active) AS CountOfDelegates, sf_committee.Name, " &
                       " case when sf_committee.name = 'Steering Committee' then 1 else case when sf_committee.name like '%Biogas%' then 2 else case when sf_committee.name = 'Agriculture Technical Group' then 3 else case when sf_committee.name = 'MSW Technical Group' then 4 else case when sf_committee.name = 'Wastewater Technical Group' then 5 else case when sf_committee.name = 'Coal Subcommittee' then 6 else case when sf_committee.name = 'Oil & Gas Subcommittee' then 7 else 0 end end end end end end end as [order] " &
                       " From sf_committee_delegate LEFT OUTER Join " &
                       " sf_committee ON sf_committee_delegate.Committee = sf_committee.Id LEFT OUTER JOIN " &
                       " sf_countries On sf_committee_delegate.Country_Representing = sf_countries.Id " &
                          "  Where [sf_committee_delegate].Active = 1 And [sf_countries].[Name] = '" & pagenamelookup & "'" &
                          "  group by [sf_committee].[Name] order by [order]"

        End If

        Dim cmd As New SqlCommand(strQuery)
        'Debug.Print strQuery
        Dim dt As DataTable = GetData(cmd)
        Return dt
    End Function




    Public Function GetNavCalendar(Optional ByVal orderby As String = "", Optional ByVal sectorFilter As String = "", Optional ByVal regionFilter As String = "", Optional ByVal categoryFilter As String = "", Optional ByVal topicFilter As String = "", Optional ByVal countryFilter As String = "", Optional ByVal keywordFilter As String = "", Optional ByVal dateFilter As String = "", Optional ByVal isArchived As String = "", Optional ByVal isFinal As String = "") As DataTable
        Dim strQuery As String = "SELECT TOP 3 [eventId] ,[name] ,cast(day(startDate) as varchar) as StartDateDay, cast(month(startDate) as varchar) as StartDateMonth, cast(day(endDate) as varchar) As EndDateDay, cast(datename(month,endDate) as varchar) as EndDateMonth, LEFT(LTRIM([dbo].udf_StripHTML([details])),90) as contractedDetails FROM [dbo].[events] where [startDate] > GETDATE() and eventstatus = 'final' and Subcommittee = 0  order by startDate Asc"
        Dim cmd As New SqlCommand(strQuery)
        'Debug.Print strQuery
        Dim dt As DataTable = GetData(cmd)
        Return dt
    End Function

    Public Function GetSubCalendar(Optional ByVal orderby As String = "", Optional ByVal sectorFilter As String = "", Optional ByVal regionFilter As String = "", Optional ByVal categoryFilter As String = "", Optional ByVal topicFilter As String = "", Optional ByVal countryFilter As String = "", Optional ByVal keywordFilter As String = "", Optional ByVal dateFilter As String = "", Optional ByVal isArchived As String = "", Optional ByVal isFinal As String = "") As DataTable
        Dim strQuery As String = "SELECT TOP 3 [eventId] ,[name] ,cast(day(startDate) as varchar) as StartDateDay, cast(month(startDate) as varchar) as StartDateMonth, cast(day(endDate) as varchar) As EndDateDay, cast(datename(month,endDate) as varchar) as EndDateMonth, LEFT(LTRIM([dbo].udf_StripHTML([details])),90) as contractedDetails FROM [dbo].[events] where [startDate] > GETDATE() and eventstatus = 'final' and Subcommittee = 1 order by startDate Asc"
        Dim cmd As New SqlCommand(strQuery)
        'Debug.Print strQuery
        Dim dt As DataTable = GetData(cmd)
        Return dt
    End Function

    Public Function GetNavSubCalendar(Optional ByVal orderby As String = "", Optional ByVal sectorFilter As String = "", Optional ByVal regionFilter As String = "", Optional ByVal categoryFilter As String = "", Optional ByVal topicFilter As String = "", Optional ByVal countryFilter As String = "", Optional ByVal keywordFilter As String = "", Optional ByVal dateFilter As String = "", Optional ByVal isArchived As String = "", Optional ByVal isFinal As String = "") As DataTable
        Dim strQuery As String = "SELECT TOP 3 [eventId] ,[name] ,cast(day(startDate) as varchar) as StartDateDay, cast(month(startDate) as varchar) as StartDateMonth, cast(day(endDate) as varchar) As EndDateDay, cast(datename(month,endDate) as varchar) as EndDateMonth, LEFT(LTRIM([dbo].udf_StripHTML([details])),90) as contractedDetails FROM [dbo].[events] where [startDate] > GETDATE() and eventstatus = 'final' and Subcommittee = 1 order by startDate Asc"
        Dim cmd As New SqlCommand(strQuery)
        'Debug.Print strQuery
        Dim dt As DataTable = GetData(cmd)
        Return dt
    End Function
    '------------------End Calendar Lookup

    '------------------Featured Resource Lookup
    Public Function GetFeaturedResource(ByVal FRlookupName As String) As DataTable

        Dim strQuery As String = "Select TOP 11 [resourceName], [resourceImage] From dbo.Resources  Left Join dbo.cross_resource_sector On dbo.Resources.resourceid = [dbo].[cross_resource_sector].resourceid where [featured] = 1 and [sector] = '" & FRlookupName & "' order by Resources.resourceid"
        Dim cmd As New SqlCommand(strQuery)
        'Debug.Print strQuery
        Dim dt As DataTable = GetData(cmd)
        Return dt
    End Function

    '------------------Featured Resource  Country Lookup
    Public Function GetFeaturedResourceByCountry(ByVal strCountryName As String) As DataTable

        Dim strQuery As String = "SELECT resourceName, Right(Resources.resourceName, LEN(Resources.resourceName) - 17) As TrimmedResourceName, Resources.resourceImage, Resources.resourceLink, cross_resource_sector.sector, Resources.featuredText FROM Resources LEFT OUTER JOIN cross_resource_country ON Resources.resourceid = cross_resource_country.ResourceID LEFT OUTER JOIN cross_resource_sector ON Resources.resourceid = cross_resource_sector.ResourceID WHERE (Resources.featured = 1) AND [Country] = '" & strCountryName & "' and resourceName  LIKE 'Challenge Story%'order by Resources.resourceid"
        Dim cmd As New SqlCommand(strQuery)
        'Debug.Print strQuery
        Dim dt As DataTable = GetData(cmd)
        Return dt
    End Function

    Public Function GetFeaturedBResourceByCountry(ByVal strCountryName As String) As DataTable

        If strCountryName = "united states" Then
            strCountryName = "USA"
        ElseIf strCountryName = "uk" Then
            strCountryName = "kingdom"
        End If

        Dim strQuery As String = "SELECT resourceName, Right(Resources.resourceName, LEN(Resources.resourceName) - 17) As TrimmedResourceName, Resources.resourceImage, Resources.resourceLink, cross_resource_sector.sector, Resources.featuredText FROM Resources LEFT OUTER JOIN cross_resource_country ON Resources.resourceid = cross_resource_country.ResourceID LEFT OUTER JOIN cross_resource_sector ON Resources.resourceid = cross_resource_sector.ResourceID WHERE (Resources.featured = 1) AND [sliderTags] LIKE '%" & strCountryName & "%' and resourceName  LIKE 'Challenge Story%' AND cross_resource_sector.sector = 'Biogas' order by Resources.resourceid"
        Dim cmd As New SqlCommand(strQuery)
        'Debug.Print strQuery
        Dim dt As DataTable = GetData(cmd)
        Return dt
    End Function

    Public Function GetFeaturedBResourceByCountryMain(ByVal strCountryName As String) As DataTable



        Dim strQuery As String = "SELECT        TOP (4) Resources.resourceName, RIGHT(Resources.resourceName, LEN(Resources.resourceName) - 17) AS TrimmedResourceName, Resources.resourceImage, Resources.resourceLink, cross_resource_sector.sector, 
                         Resources.featuredText
FROM            Resources LEFT OUTER JOIN
                         cross_resource_country ON Resources.resourceid = cross_resource_country.ResourceID LEFT OUTER JOIN
                         cross_resource_sector ON Resources.resourceid = cross_resource_sector.ResourceID
WHERE        (Resources.featured = 1) AND (Resources.sliderTags LIKE '%') AND (Resources.resourceName LIKE 'Challenge Story%') AND (cross_resource_sector.sector = 'Biogas')
ORDER BY NEWID()"
        Dim cmd As New SqlCommand(strQuery)
        'Debug.Print strQuery
        Dim dt As DataTable = GetData(cmd)
        Return dt
    End Function

    Public Function GetFeaturedBResourceImageByCountry(ByVal strCountryName As String) As DataTable

        Dim strQuery As String = "SELECT resourceName, Right(Resources.resourceName, LEN(Resources.resourceName) - 17) As TrimmedResourceName, Resources.resourceImage, Resources.resourceLink, cross_resource_sector.sector, Resources.featuredText FROM Resources LEFT OUTER JOIN cross_resource_country ON Resources.resourceid = cross_resource_country.ResourceID LEFT OUTER JOIN cross_resource_sector ON Resources.resourceid = cross_resource_sector.ResourceID WHERE (Resources.featured = 1) AND [sliderTags] LIKE '%" & strCountryName & "%' and resourceName  LIKE 'Challenge Story%' AND cross_resource_sector.sector = 'Biogas' order by Resources.resourceid"
        Dim cmd As New SqlCommand(strQuery)
        'Debug.Print strQuery
        Dim dt As DataTable = GetData(cmd)
        Return dt
    End Function

    Public Function GetFeaturedCResourceByCountry(ByVal strCountryName As String) As DataTable

        If strCountryName = "united states" Then
            strCountryName = "USA"
        ElseIf strCountryName = "uk" Then
            strCountryName = "kingdom"
        End If

        Dim strQuery As String = "SELECT resourceName, Right(Resources.resourceName, LEN(Resources.resourceName) - 17) As TrimmedResourceName, Resources.resourceImage, Resources.resourceLink, cross_resource_sector.sector, Resources.featuredText FROM Resources LEFT OUTER JOIN cross_resource_country ON Resources.resourceid = cross_resource_country.ResourceID LEFT OUTER JOIN cross_resource_sector ON Resources.resourceid = cross_resource_sector.ResourceID WHERE (Resources.featured = 1) AND [sliderTags] LIKE '%" & strCountryName & "%' and resourceName  LIKE 'Challenge Story%' AND cross_resource_sector.sector = 'Coal' order by Resources.resourceid"
        Dim cmd As New SqlCommand(strQuery)
        'Debug.Print strQuery
        Dim dt As DataTable = GetData(cmd)
        Return dt
    End Function

    Public Function GetFeaturedCResourceByCountryMain(ByVal strCountryName As String) As DataTable

        Dim strQuery As String = "SELECT        TOP (4) Resources.resourceName, RIGHT(Resources.resourceName, LEN(Resources.resourceName) - 17) AS TrimmedResourceName, Resources.resourceImage, Resources.resourceLink, cross_resource_sector.sector, 
                         Resources.featuredText
FROM            Resources LEFT OUTER JOIN
                         cross_resource_country ON Resources.resourceid = cross_resource_country.ResourceID LEFT OUTER JOIN
                         cross_resource_sector ON Resources.resourceid = cross_resource_sector.ResourceID
WHERE        (Resources.featured = 1) AND (Resources.sliderTags LIKE '%') AND (Resources.resourceName LIKE 'Challenge Story%') AND (cross_resource_sector.sector = 'Coal')
ORDER BY NEWID()"
        Dim cmd As New SqlCommand(strQuery)
        'Debug.Print strQuery
        Dim dt As DataTable = GetData(cmd)
        Return dt
    End Function

    Public Function GetFeaturedCResourceImageByCountry(ByVal strCountryName As String) As DataTable



        Dim strQuery As String = "SELECT resourceName, Right(Resources.resourceName, LEN(Resources.resourceName) - 17) As TrimmedResourceName, Resources.resourceImage, Resources.resourceLink, cross_resource_sector.sector, Resources.featuredText FROM Resources LEFT OUTER JOIN cross_resource_country ON Resources.resourceid = cross_resource_country.ResourceID LEFT OUTER JOIN cross_resource_sector ON Resources.resourceid = cross_resource_sector.ResourceID WHERE (Resources.featured = 1) AND [sliderTags] LIKE '%" & strCountryName & "%' and resourceName  LIKE 'Challenge Story%' AND cross_resource_sector.sector = 'Coal' order by Resources.resourceid"
        Dim cmd As New SqlCommand(strQuery)
        'Debug.Print strQuery
        Dim dt As DataTable = GetData(cmd)
        Return dt
    End Function

    Public Function GetFeaturedOGResourceByCountry(ByVal strCountryName As String) As DataTable

        If strCountryName = "united states" Then
            strCountryName = "USA"
        ElseIf strCountryName = "uk" Then
            strCountryName = "kingdom"
        End If

        Dim strQuery As String = "SELECT resourceName, Right(Resources.resourceName, LEN(Resources.resourceName) - 17) As TrimmedResourceName, Resources.resourceImage, Resources.resourceLink, cross_resource_sector.sector, Resources.featuredText FROM Resources LEFT OUTER JOIN cross_resource_country ON Resources.resourceid = cross_resource_country.ResourceID LEFT OUTER JOIN cross_resource_sector ON Resources.resourceid = cross_resource_sector.ResourceID WHERE (Resources.featured = 1) AND [sliderTags] LIKE '%" & strCountryName & "%' and resourceName  LIKE 'Challenge Story%' AND cross_resource_sector.sector = 'Oil & Gas' order by Resources.resourceid"
        Dim cmd As New SqlCommand(strQuery)
        'Debug.Print strQuery
        Dim dt As DataTable = GetData(cmd)
        Return dt
    End Function

    Public Function GetFeaturedOGResourceByCountryMain(ByVal strCountryName As String) As DataTable

        Dim strQuery As String = "SELECT        TOP (4) Resources.resourceName, RIGHT(Resources.resourceName, LEN(Resources.resourceName) - 17) AS TrimmedResourceName, Resources.resourceImage, Resources.resourceLink, cross_resource_sector.sector, 
                         Resources.featuredText
FROM            Resources LEFT OUTER JOIN
                         cross_resource_country ON Resources.resourceid = cross_resource_country.ResourceID LEFT OUTER JOIN
                         cross_resource_sector ON Resources.resourceid = cross_resource_sector.ResourceID
WHERE        (Resources.featured = 1) AND (Resources.sliderTags LIKE '%') AND (Resources.resourceName LIKE 'Challenge Story%') AND (cross_resource_sector.sector = 'Oil & Gas')
ORDER BY NEWID()"
        Dim cmd As New SqlCommand(strQuery)
        'Debug.Print strQuery
        Dim dt As DataTable = GetData(cmd)
        Return dt
    End Function

    Public Function GetFeaturedOGResourceImageByCountry(ByVal strCountryName As String) As DataTable

        If strCountryName = "united states" Then
            strCountryName = "USA"
        ElseIf strCountryName = "uk" Then
            strCountryName = "kingdom"
        End If

        Dim strQuery As String = "SELECT resourceName, Right(Resources.resourceName, LEN(Resources.resourceName) - 17) As TrimmedResourceName, Resources.resourceImage, Resources.resourceLink, cross_resource_sector.sector, Resources.featuredText FROM Resources LEFT OUTER JOIN cross_resource_country ON Resources.resourceid = cross_resource_country.ResourceID LEFT OUTER JOIN cross_resource_sector ON Resources.resourceid = cross_resource_sector.ResourceID WHERE (Resources.featured = 1) AND [sliderTags] LIKE '%" & strCountryName & "%' and resourceName  LIKE 'Challenge Story%' AND cross_resource_sector.sector = 'Oil & Gas' order by Resources.resourceid"
        Dim cmd As New SqlCommand(strQuery)
        'Debug.Print strQuery
        Dim dt As DataTable = GetData(cmd)
        Return dt
    End Function

    Public Function GetFeaturedMResourceByCountry(ByVal strCountryName As String) As DataTable

        If strCountryName = "united states" Then
            strCountryName = "USA"
        ElseIf strCountryName = "uk" Then
            strCountryName = "kingdom"
        End If

        Dim strQuery As String = "SELECT resourceName, Right(Resources.resourceName, LEN(Resources.resourceName) - 17) As TrimmedResourceName, Resources.resourceImage, Resources.resourceLink, cross_resource_sector.sector, Resources.featuredText FROM Resources LEFT OUTER JOIN cross_resource_country ON Resources.resourceid = cross_resource_country.ResourceID LEFT OUTER JOIN cross_resource_sector ON Resources.resourceid = cross_resource_sector.ResourceID WHERE (Resources.featured = 1) AND [sliderTags] LIKE '%" & strCountryName & "%' and resourceName  LIKE 'Challenge Story%' AND cross_resource_sector.sector = 'Multiple' order by Resources.resourceid"
        Dim cmd As New SqlCommand(strQuery)
        'Debug.Print strQuery
        Dim dt As DataTable = GetData(cmd)
        Return dt
    End Function

    Public Function GetFeaturedMResourceByCountryMain(ByVal strCountryName As String) As DataTable

        Dim strQuery As String = "SELECT        TOP (4) Resources.resourceName, RIGHT(Resources.resourceName, LEN(Resources.resourceName) - 17) AS TrimmedResourceName, Resources.resourceImage, Resources.resourceLink, cross_resource_sector.sector, 
                         Resources.featuredText
FROM            Resources LEFT OUTER JOIN
                         cross_resource_country ON Resources.resourceid = cross_resource_country.ResourceID LEFT OUTER JOIN
                         cross_resource_sector ON Resources.resourceid = cross_resource_sector.ResourceID
WHERE        (Resources.featured = 1) AND (Resources.sliderTags LIKE '%Cross%') AND (Resources.resourceName LIKE 'Challenge Story%')
ORDER BY NEWID()"
        Dim cmd As New SqlCommand(strQuery)
        'Debug.Print strQuery
        Dim dt As DataTable = GetData(cmd)
        Return dt
    End Function

    Public Function GetFeaturedMResourceImageByCountry(ByVal strCountryName As String) As DataTable

        Dim strQuery As String = "SELECT resourceName, Right(Resources.resourceName, LEN(Resources.resourceName) - 17) As TrimmedResourceName, Resources.resourceImage, Resources.resourceLink, cross_resource_sector.sector, Resources.featuredText FROM Resources LEFT OUTER JOIN cross_resource_country ON Resources.resourceid = cross_resource_country.ResourceID LEFT OUTER JOIN cross_resource_sector ON Resources.resourceid = cross_resource_sector.ResourceID WHERE (Resources.featured = 1) AND [sliderTags] = '" & strCountryName & "' and resourceName  LIKE 'Challenge Story%' AND cross_resource_sector.sector = 'Multiple' order by Resources.resourceid"
        Dim cmd As New SqlCommand(strQuery)
        'Debug.Print strQuery
        Dim dt As DataTable = GetData(cmd)
        Return dt
    End Function


    Public Function GetFeaturedResourceInfo(ByVal FRlookupName As String) As DataTable

        Dim strQuery As String = "Select TOP 11 [resourceName], fileType, dbo.Resources.resourceid,[featuredText], [resourceTopic], YEAR([resourceFiledate]) As resourceYear, [resourcePages],[resourceSize], [resourceImage] From dbo.Resources  Left Join dbo.cross_resource_sector On dbo.Resources.resourceid = [dbo].[cross_resource_sector].resourceid  left join dbo.lu_fileType on dbo.Resources.filetypeID = dbo.lu_fileType.fileTypeID where [featured] = 1 and [sector] = '" & FRlookupName & "' order by Resources.resourceid"
        Dim cmd As New SqlCommand(strQuery)
        'Debug.Print strQuery
        Dim dt As DataTable = GetData(cmd)
        Return dt
    End Function
    '------------------Featured Resource Lookup

    Public Function GetCF(Optional ByVal orderby As String = "", Optional ByVal sectorFilter As String = "", Optional ByVal regionFilter As String = "", Optional ByVal categoryFilter As String = "", Optional ByVal topicFilter As String = "", Optional ByVal countryFilter As String = "", Optional ByVal keywordFilter As String = "", Optional ByVal dateFilter As String = "", Optional ByVal isArchived As String = "", Optional ByVal isFinal As String = "") As DataTable
        Dim strQuery As String = " SELECT *, convert(nvarchar(10), [dateAdded], 102) as 'dateFormatted' FROM dashboardCF order by dateFormatted DESC"
        Dim cmd As New SqlCommand(strQuery)
        'Debug.Print strQuery
        Dim dt As DataTable = GetData(cmd)
        Return dt
    End Function

    Public Function GetEmailDetails(ByVal emailID As String, ByVal tableName As String) As DataTable
        Dim strQuery As String = " SELECT * FROM " & tableName & " where id = " & emailID
        Dim cmd As New SqlCommand(strQuery)
        'Debug.Print strQuery
        Dim dt As DataTable = GetData(cmd)
        Return dt
    End Function

    Public Function UpdateDMEmailDetails(ByVal emailID As String, ByVal tableName As String, ByVal itemStatus As String, ByVal itemComment As String) As DataTable
        Dim strQuery As String = "Update " & tableName & "set status='" & itemStatus & "',comment='" & itemComment & "' where id =" & emailID
        Dim cmd As New SqlCommand(strQuery)
        'Debug.Print strQuery
        Dim dt As DataTable = GetData(cmd)
        Return dt
    End Function

    Public Function UpdateCFEmailDetails(ByVal emailID As String, ByVal tableName As String, ByVal itemStatus As String, ByVal itemComment As String) As DataTable
        Dim strQuery As String = "Update " & tableName & "set cfStatus='" & itemStatus & "' where id =" & emailID
        Dim cmd As New SqlCommand(strQuery)
        'Debug.Print strQuery
        Dim dt As DataTable = GetData(cmd)
        Return dt
    End Function

    Public Function GetPhoneDetails() As DataTable
        Dim strQuery As String = " SELECT * from gmiPhone order by callDate DESC"
        Dim cmd As New SqlCommand(strQuery)
        'Debug.Print strQuery
        Dim dt As DataTable = GetData(cmd)
        Return dt
    End Function

End Class

