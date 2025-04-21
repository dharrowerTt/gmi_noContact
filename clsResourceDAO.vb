Imports System.IO
Imports System.Text
Imports System.Data
Imports System.Data.SqlClient

Public Class clsResourceDAO
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
    Public Shared Function insertResource(ByVal ResourceObj As clsResourceVO) As String
        Dim conn As SqlConnection = Nothing
        Dim cmd As SqlCommand = Nothing
        Dim strSQL As String = String.Empty
        Dim fieldStr As String

        Dim oId As Object
        Dim ResourceId As String = String.Empty

        conn = New SqlConnection(Common.GetConnString())
        conn.Open()

        cmd = New SqlCommand(strSQL, conn)

        'prepare values
        fieldStr = "'" & ResourceObj.getName() & "', "
        fieldStr += "'" & ResourceObj.getResourceLink() & "', "
        fieldStr += "'" & ResourceObj.getResourceFileDate() & "', "
        fieldStr += "'" & ResourceObj.getResourceTopic() & "', "
        fieldStr += "'" & ResourceObj.getSource() & "', "
        fieldStr += "" & ResourceObj.getResourceParent & ", "
        fieldStr += "" & ResourceObj.getFileTypeID() & ", "
        fieldStr += "'" & ResourceObj.getShortName() & "', "
        fieldStr += "'" & ResourceObj.getAuthor() & "', "
        fieldStr += "'" & ResourceObj.getResourceImage() & "', "
        fieldStr += "'" & ResourceObj.getGrouping() & "', "
        If Not IsNothing(ResourceObj.getResourceCategoryID) Then
            fieldStr += "" & ResourceObj.getResourceCategoryID() & ", "
        Else
            fieldStr += "'',"
        End If
        If Not IsNothing(ResourceObj.getResourcePages) Then
            fieldStr += "" & ResourceObj.getResourcePages() & ", "
        Else
            fieldStr += "'',"
        End If
        If Not IsNothing(ResourceObj.getResourceSize) Then
            fieldStr += "'" & ResourceObj.getResourceSize() & "', "
        Else
            fieldStr += "'',"
        End If
        fieldStr += "'" & ResourceObj.getStatus() & "'"


        'fieldStr = Replace(fieldStr, "'", "''")

        strSQL = "insert into Resources (resourcename, resourceLink, resourceFiledate, resourceTopic, resourceSource, resourceparentID, filetypeID, shortname, author, resourceimage, grouping, resourcecategoryID, resourcePages, resourceSize, status) values (" & fieldStr & ")"


        cmd.CommandText = strSQL
        cmd.CommandType = CommandType.Text
        cmd.ExecuteNonQuery()

        'find the new Resource Id
        cmd.CommandText = "SELECT SCOPE_IDENTITY() "
        oId = cmd.ExecuteScalar()

        If oId Is DBNull.Value Then
            Throw New Exception("InsertResource: Could not obtain Resource id.")
        Else
            ResourceId = CType(oId, String)
        End If
        'cmd.Dispose()
        conn.Dispose()
        conn = Nothing
        cmd = Nothing

        Return ResourceId
    End Function



    Public Shared Function insertResourceSector(ByVal ResourceId As String, ByVal sectorId As String, ByVal sector As String) As String
        Dim conn As SqlConnection = Nothing
        Dim cmd As SqlCommand = Nothing
        Dim strSQL As String = String.Empty

        conn = New SqlConnection(Common.GetConnString())
        conn.Open()

        cmd = New SqlCommand(strSQL, conn)

        'generate sql string
        strSQL = "insert into cross_resource_sector (Resourceid, sectorid, sector) values(" & ResourceId & ", " & sectorId & ", '" & sector & "')"

        cmd.CommandText = strSQL
        cmd.CommandType = CommandType.Text
        cmd.ExecuteNonQuery()

        'cmd.Dispose()
        conn.Dispose()
        conn = Nothing
        cmd = Nothing

        Return ResourceId
    End Function


    Public Shared Function insertResourceLanguage(ByVal ResourceId As String, ByVal languageid As String) As String
        Dim conn As SqlConnection = Nothing
        Dim cmd As SqlCommand = Nothing
        Dim strSQL As String = String.Empty

        conn = New SqlConnection(Common.GetConnString())
        conn.Open()

        cmd = New SqlCommand(strSQL, conn)
        'generate sql string
        strSQL = "insert into cross_resource_language (Resourceid, languageid) values(" & ResourceId & ", " & languageid & ")"

        cmd.CommandText = strSQL
        cmd.CommandType = CommandType.Text
        cmd.ExecuteNonQuery()

        'cmd.Dispose()
        conn.Dispose()
        conn = Nothing
        cmd = Nothing

        Return ResourceId
    End Function



    Public Shared Function insertResourceEvent(ByVal ResourceId As String, ByVal eventid As String) As String
        Dim conn As SqlConnection = Nothing
        Dim cmd As SqlCommand = Nothing
        Dim strSQL As String = String.Empty

        conn = New SqlConnection(Common.GetConnString())
        conn.Open()

        cmd = New SqlCommand(strSQL, conn)

        'generate sql string
        strSQL = "insert into cross_resource_event (Resourceid, eventid) values(" & ResourceId & ", " & eventid & ")"

        cmd.CommandText = strSQL
        cmd.CommandType = CommandType.Text
        cmd.ExecuteNonQuery()

        'cmd.Dispose()
        conn.Dispose()
        conn = Nothing
        cmd = Nothing

        Return ResourceId
    End Function

    Public Shared Function insertResourceCountry(ByVal ResourceId As String, ByVal countryid As String, ByVal country As String) As String
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
        strSQL = "insert into cross_resource_country (Resourceid, countryid, country) values (@ResourceID, @CountryID, @Country)"

        cmd.CommandText = strSQL
        cmd.CommandType = CommandType.Text
        cmd.Parameters.AddWithValue("@ResourceID", ResourceId)
        cmd.Parameters.AddWithValue("@CountryID", countryid)
        cmd.Parameters.AddWithValue("@Country", country)
        cmd.ExecuteNonQuery()

        'Dim debugSQL As String = cmd.CommandText
        'For Each Parameter In cmd.Parameters
        '    debugSQL = debugSQL.Replace(Parameter.parametername, Parameter.value.ToString())
        'Next

        'Debug.Print(debugSQL)

        'cmd.Dispose()
        conn.Dispose()
        conn = Nothing
        cmd = Nothing

        Return ResourceId
    End Function

    Public Shared Function insertTopic(ByVal ResourceId As String, ByVal topicid As String, ByVal topic As String) As String
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
        strSQL = "insert into cross_resource_topic (Resourceid, topicid, topic) values(@ResourceId, @topicid, @topic)"

        cmd.CommandText = strSQL
        cmd.CommandType = CommandType.Text
        cmd.Parameters.AddWithValue("@ResourceId", ResourceId)
        cmd.Parameters.AddWithValue("@topicid", topicid)
        cmd.Parameters.AddWithValue("@topic", topic)
        cmd.ExecuteNonQuery()

        'cmd.Dispose()
        conn.Dispose()
        conn = Nothing
        cmd = Nothing

        Return ResourceId
    End Function

    Public Shared Function editResource(ByVal ResourceObj As clsResourceVO) As Boolean
        Dim conn As SqlConnection = Nothing
        Dim cmd As SqlCommand = Nothing
        Dim strSQL As String = String.Empty
        Dim fieldStr As String

        Dim ResourceId As String = String.Empty

        conn = New SqlConnection(Common.GetConnString())
        conn.Open()

        cmd = New SqlCommand(strSQL, conn)

        'prepare values
        fieldStr = "resourceName='" & ResourceObj.getName() & "', "
        fieldStr += " resourceLink='" & ResourceObj.getResourceLink() & "', "
        fieldStr += " resourceImage='" & ResourceObj.getResourceImage() & "',"
        fieldStr += " shortName='" & ResourceObj.getShortName() & "',"
        fieldStr += " grouping='" & ResourceObj.getGrouping() & "',"
        fieldStr += " author='" & ResourceObj.getAuthor() & "',"
        fieldStr += " resourceTopic='" & ResourceObj.getResourceTopic() & "', "
        fieldStr += " resourceFiledate='" & ResourceObj.getResourceFileDate() & "', "
        If Not IsNothing(ResourceObj.getResourcePages) Then
            fieldStr += " resourcePages=" & ResourceObj.getResourcePages() & ", "
        End If
        fieldStr += " resourceSize='" & ResourceObj.getResourceSize() & "', "
        fieldStr += " filetypeID=" & ResourceObj.getFileTypeID() & ", "
        fieldStr += " resourcecategoryID=" & ResourceObj.getResourceCategoryID() & ", "
        fieldStr += " resourceSource='" & ResourceObj.getSource() & "', "
        fieldStr += " status = '" & ResourceObj.getStatus() & "'"


        'hui - must convert it to parameter query
        'generate sql string
        strSQL = "update Resources set " & fieldStr & " where ResourceId=" & ResourceObj.getResourceId

        'strSQL = "update Resources set name='boston' where ResourceId=" & ResourceObj.getResourceId

        cmd.CommandText = strSQL
        cmd.CommandType = CommandType.Text
        cmd.ExecuteNonQuery()

        'cmd.Dispose()
        conn.Dispose()
        conn = Nothing
        cmd = Nothing

        Return True
    End Function


    Public Shared Function deleteResource(ByVal ResourceId As String) As String
        Dim conn As SqlConnection = Nothing
        Dim cmd As SqlCommand = Nothing
        Dim strSQL As String = String.Empty

        'first delete sectors
        deleteResourceSectorsByResourceId(ResourceId)

        conn = New SqlConnection(Common.GetConnString())
        conn.Open()

        cmd = New SqlCommand(strSQL, conn)

        'security risk
        'generate sql string


        strSQL = "delete from cross_resource_sector where Resourceid=@ResourceId"
        cmd.CommandText = strSQL
        cmd.CommandType = CommandType.Text
        cmd.Parameters.AddWithValue("@ResourceId", ResourceId)
        cmd.ExecuteNonQuery()

        strSQL = "delete from cross_resource_language where Resourceid=@ResourceId"
        cmd.CommandText = strSQL
        cmd.CommandType = CommandType.Text
        cmd.ExecuteNonQuery()

        strSQL = "delete from cross_resource_country where Resourceid=@ResourceId"
        cmd.CommandText = strSQL
        cmd.CommandType = CommandType.Text
        cmd.ExecuteNonQuery()

        strSQL = "delete from cross_resource_event where Resourceid=@ResourceId"
        cmd.CommandText = strSQL
        cmd.CommandType = CommandType.Text
        cmd.ExecuteNonQuery()

        strSQL = "delete from Resources where ResourceId=@ResourceId"
        cmd.CommandText = strSQL
        cmd.CommandType = CommandType.Text
        cmd.ExecuteNonQuery()

        'cmd.Dispose()
        conn.Dispose()
        conn = Nothing
        cmd = Nothing

        Return "1"
    End Function


    Public Shared Function deleteFile(ByVal ResourceId As String) As String
        Dim conn As SqlConnection = Nothing
        Dim cmd As SqlCommand = Nothing
        Dim strSQL As String = String.Empty


        conn = New SqlConnection(Common.GetConnString())
        conn.Open()

        cmd = New SqlCommand(strSQL, conn)

        'security risk
        'generate sql string
        Dim da As SqlDataAdapter
        Dim ds As DataSet = Nothing
        Dim dt As DataTable = Nothing
        strSQL = "select resourcelink from resources where resourceid = " & ResourceId
        cmd.CommandText = strSQL
        cmd.CommandType = CommandType.Text
        da = New SqlDataAdapter(cmd)
        ds = New DataSet
        ds.CaseSensitive = False

        da.Fill(ds)
        dt = ds.Tables(0)
        Dim linkID As String = ""
        For Each row In dt.Rows
            linkID = row("resourcelink").ToString
        Next

        strSQL = "select resourceid from resources where resourcelink = '" & linkID & "'"
        cmd.CommandText = strSQL
        cmd.CommandType = CommandType.Text
        da.Fill(ds)
        dt = ds.Tables(0)
        Dim count = 0
        For Each row In dt.Rows
            count = count + 1
        Next

        If count <= 1 Then
            'delete the file
        End If
        strSQL = "update resources set resourcelink = '' where Resourceid=" & ResourceId
        cmd.CommandText = strSQL
        cmd.CommandType = CommandType.Text
        cmd.ExecuteNonQuery()


        strSQL = ""
        'cmd.Dispose()
        conn.Dispose()
        conn = Nothing
        cmd = Nothing

        Return "1"
    End Function

    Public Shared Function getResourcesByDate(ByVal myDateStr As String, Optional ByVal status As String = "") As DataTable
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
        'strSQL = "select * from Resources where startDate<'" & myStartDateStr & "' and endDate>'" & myEndDateStr & "'"

        'strSQL = "select * from Resources"
        If Len(status) > 0 Then
            strSQL = "select * from Resources where resource.status = '" & status & "' and datepart(month, resourceFiledate)>=" & Month(myDateStr) & " and datepart(year, resourcefiledate)=" & Year(myDateStr) & " Order by resourcefiledate "
        Else
            strSQL = "select * from Resources where datepart(month, resourceFiledate)>=" & Month(myDateStr) & " and datepart(year, resourcefiledate)=" & Year(myDateStr) & " Order by resourcefiledate "
        End If

        'strSQL = "select * from Resources where startDate='" & myDateStr & "' and endDate>='" & myDateStr & "'"


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








    Public Shared Function getChildResources(ByVal resourceid As String, Optional ByVal status As String = "")

        Dim conn As SqlConnection = Nothing
        Dim cmd As SqlCommand = Nothing
        Dim strSQL As String = String.Empty
        Dim da As SqlDataAdapter
        Dim ds As DataSet = Nothing
        Dim dt As DataTable = Nothing

        conn = New SqlConnection(Common.GetConnString())
        conn.Open()

        cmd = New SqlCommand(strSQL, conn)

        If Len(status) > 0 Then
            strSQL = "select resourceid, resourcename, resourceLink, resourceyear, fileinfostring, [status] from getResourceList " & _
                    " WHERE status = '" & status & "' and ResourceParentid = " & resourceid & " order by resourceYear DESC "
        Else
            strSQL = "select resourceid, resourcename, resourceLink, resourceyear, fileinfostring, [status] from getResourceList " & _
                " WHERE  ResourceParentid = " & resourceid & " order by resourceYear DESC "

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

    Public Shared Function getParentResources(ByVal resourceid As String, Optional ByVal status As String = "")
        Dim conn As SqlConnection = Nothing
        Dim cmd As SqlCommand = Nothing
        Dim strSQL As String = String.Empty
        Dim da As SqlDataAdapter
        Dim ds As DataSet = Nothing
        Dim dt As DataTable = Nothing

        conn = New SqlConnection(Common.GetConnString())
        conn.Open()

        cmd = New SqlCommand(strSQL, conn)

        If Len(status) > 0 Then
            strSQL = "Select r.*,resourceCategory,filetype, resourcelanguage As language, sectors, countries, region, fileinfostring, topic, [type], replace(replace(resourceLink,'/documents/',''),'.pdf','.jpg') as AltImg from Resources r left join lu_resourcecategory on r.resourcecategoryID = lu_resourcecategory.resourcecategoryID left join (select * from tbl_advancedSearch where category = 'Resource') as list on r.resourceid = list.id left join cross_resource_language on r.resourceid = cross_resource_language.resourceid inner join lu_language on cross_resource_language.languageid = lu_language.languageid where r.resourceid in (select distinct resourceparentID from resources where resourceid = " & resourceid & ")  and r.status = '" & status & "' order by resourcefiledate desc"
        Else
            strSQL = "select r.*,resourceCategory,filetype, resourcelanguage as language, sectors, countries, region, fileinfostring, topic, [type], replace(replace(resourceLink,'/documents/',''),'.pdf','.jpg') as AltImg from Resources r left join lu_resourcecategory on r.resourcecategoryID = lu_resourcecategory.resourcecategoryID left join (select * from tbl_advancedSearch where category = 'Resource') as list on r.resourceid = list.id left join cross_resource_language on r.resourceid = cross_resource_language.resourceid inner join lu_language on cross_resource_language.languageid = lu_language.languageid where r.resourceid in (select distinct resourceparentID from resources where resourceid = " & resourceid & ")   order by resourcefiledate desc"
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

    Public Shared Function getRelatedResources(ByVal countryid As String, ByVal sector As String, ByVal Resourceid As Integer, Optional ByVal status As String = "") As DataTable
        Dim conn As SqlConnection = Nothing
        Dim cmd As SqlCommand = Nothing
        Dim strSQL As String = String.Empty
        Dim da As SqlDataAdapter
        Dim ds As DataSet = Nothing
        Dim dt As DataTable = Nothing

        conn = New SqlConnection(Common.GetConnString())
        conn.Open()

        cmd = New SqlCommand(strSQL, conn)

        strSQL = "select top 5 Resources.Resourceid, resourceName, resourceLink, resourceimage " & _
                " FROM Resources" & _
                " WHERE  Resources.Resourceid in (SELECT ResourceId FROM     cross_resource_country WHERE  country = " & countryid & _
                " UNION " & _
                " SELECT Resourceid from cross_resource_sector where cross_resource_sector.sectorid = '" & sector & "') " & _
                " and  Resources.Resourceid != " & Resourceid
        If Len(status) > 0 Then
            strSQL += " AND resources.status = '" & status & "'"
        End If
        strSQL += " order by resourcefiledate desc "

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

    Public Shared Function GetResources(Optional ByVal status As String = "") As DataTable
        Dim conn As SqlConnection = Nothing
        Dim cmd As SqlCommand = Nothing
        Dim strSQL As String = String.Empty
        Dim da As SqlDataAdapter
        Dim ds As DataSet = Nothing
        Dim dt As DataTable = Nothing

        conn = New SqlConnection(Common.GetConnString())
        conn.Open()

        cmd = New SqlCommand(strSQL, conn)
        'hui question: if there is no ResourceID
        'what we suppose to show
        '7/18/2009


        If Len(status) > 0 Then
            strSQL = "select r.*,resourceCategory,filetype, resourcelanguage as language, sectors, countries, region, fileinfostring, topic, [type], replace(replace(resourceLink,'/documents/',''),'.pdf','.jpg') as AltImg from Resources r inner join lu_resourcecategory on r.resourcecategoryID = lu_resourcecategory.resourcecategoryID inner join (select * from tbl_advancedSearch where category = 'Resource') as list on r.resourceid = list.id inner join cross_resource_language on r.resourceid = cross_resource_language.resourceid inner join lu_language on cross_resource_language.languageid = lu_language.languageid where r.status = '" & status & "' and resourceName Not Like 'Challenge Story%' order by resourcefiledate desc"
        Else
            strSQL = "select r.*,resourceCategory,filetype, resourcelanguage as language, sectors, countries, region, fileinfostring, topic, [type], replace(replace(resourceLink,'/documents/',''),'.pdf','.jpg') as AltImg from Resources r inner join lu_resourcecategory on r.resourcecategoryID = lu_resourcecategory.resourcecategoryID inner join (select * from tbl_advancedSearch where category = 'Resource') as list on r.resourceid = list.id inner join cross_resource_language on r.resourceid = cross_resource_language.resourceid inner join lu_language on cross_resource_language.languageid = lu_language.languageid where resourceName Not Like 'Challenge Story%' order by resourcefiledate desc"
        End If


        cmd.CommandText = strSQL
        cmd.CommandType = CommandType.Text
        da = New SqlDataAdapter(cmd)
        ds = New DataSet
        ds.CaseSensitive = False

        da.Fill(ds)
        dt = ds.Tables(0)

        Return dt


        conn.Dispose()
        conn = Nothing
        cmd = Nothing
        da = Nothing
        ds = Nothing

        Return dt
    End Function

    Public Shared Function GetRecentResources(Optional ByVal status As String = "") As DataTable
        Dim conn As SqlConnection = Nothing
        Dim cmd As SqlCommand = Nothing
        Dim strSQL As String = String.Empty
        Dim da As SqlDataAdapter
        Dim ds As DataSet = Nothing
        Dim dt As DataTable = Nothing

        conn = New SqlConnection(Common.GetConnString())
        conn.Open()

        cmd = New SqlCommand(strSQL, conn)
        'hui question: if there is no ResourceID
        'what we suppose to show
        '7/18/2009


        If Len(status) > 0 Then
            strSQL = "select r.*,resourceCategory,filetype, resourcelanguage as language, sectors, countries, region, fileinfostring, topic, [type], replace(replace(resourceLink,'/documents/',''),'.pdf','.jpg') as AltImg from Resources r inner join lu_resourcecategory on r.resourcecategoryID = lu_resourcecategory.resourcecategoryID inner join (select * from tbl_advancedSearch where category = 'Resource') as list on r.resourceid = list.id inner join cross_resource_language on r.resourceid = cross_resource_language.resourceid inner join lu_language on cross_resource_language.languageid = lu_language.languageid where r.status = '" & status & "' and resourceName Not Like 'Challenge Story%' and resourcefiledate > '" & DateAdd(DateInterval.Month, -3, Today()) & "' order by resourcefiledate desc"
        Else
            strSQL = "select r.*,resourceCategory,filetype, resourcelanguage as language, sectors, countries, region, fileinfostring, topic, [type], replace(replace(resourceLink,'/documents/',''),'.pdf','.jpg') as AltImg from Resources r inner join lu_resourcecategory on r.resourcecategoryID = lu_resourcecategory.resourcecategoryID inner join (select * from tbl_advancedSearch where category = 'Resource') as list on r.resourceid = list.id inner join cross_resource_language on r.resourceid = cross_resource_language.resourceid inner join lu_language on cross_resource_language.languageid = lu_language.languageid where resourceName Not Like 'Challenge Story%' and resourcefiledate > '" & DateAdd(DateInterval.Month, -3, Today()) & "' order by resourcefiledate desc"
        End If


        cmd.CommandText = strSQL
        cmd.CommandType = CommandType.Text
        da = New SqlDataAdapter(cmd)
        ds = New DataSet
        ds.CaseSensitive = False

        da.Fill(ds)
        dt = ds.Tables(0)

        Dim count = dt.Rows.Count


        If count < 5 Then

            ds = Nothing
            dt = Nothing

            If Len(status) > 0 Then
                strSQL = "select top 6 r.*,resourceCategory,filetype, resourcelanguage as language, sectors, countries, region, fileinfostring, topic, [type], replace(replace(resourceLink,'/documents/',''),'.pdf','.jpg') as AltImg from Resources r inner join lu_resourcecategory on r.resourcecategoryID = lu_resourcecategory.resourcecategoryID inner join (select * from tbl_advancedSearch where category = 'Resource') as list on r.resourceid = list.id inner join cross_resource_language on r.resourceid = cross_resource_language.resourceid inner join lu_language on cross_resource_language.languageid = lu_language.languageid where r.status = '" & status & "' and resourceName Not Like 'Challenge Story%' and resourcefiledate > '" & DateAdd(DateInterval.Month, -12, Today()) & "' order by resourcefiledate desc"
            Else
                strSQL = "select top 6 r.*,resourceCategory,filetype, resourcelanguage as language, sectors, countries, region, fileinfostring, topic, [type], replace(replace(resourceLink,'/documents/',''),'.pdf','.jpg') as AltImg from Resources r inner join lu_resourcecategory on r.resourcecategoryID = lu_resourcecategory.resourcecategoryID inner join (select * from tbl_advancedSearch where category = 'Resource') as list on r.resourceid = list.id inner join cross_resource_language on r.resourceid = cross_resource_language.resourceid inner join lu_language on cross_resource_language.languageid = lu_language.languageid where resourceName Not Like 'Challenge Story%' and resourcefiledate > '" & DateAdd(DateInterval.Month, -12, Today()) & "' order by resourcefiledate desc"
            End If


            cmd.CommandText = strSQL
            cmd.CommandType = CommandType.Text
            da = New SqlDataAdapter(cmd)
            ds = New DataSet
            ds.CaseSensitive = False

            da.Fill(ds)
            dt = ds.Tables(0)

        End If

        Return dt


        conn.Dispose()
        conn = Nothing
        cmd = Nothing
        da = Nothing
        ds = Nothing

        Return dt
    End Function


    Public Shared Function GetResourcesbySector(ByVal sectorid As String, Optional ByVal status As String = "") As DataTable
        Dim conn As SqlConnection = Nothing
        Dim cmd As SqlCommand = Nothing
        Dim strSQL As String = String.Empty
        Dim da As SqlDataAdapter
        Dim ds As DataSet = Nothing
        Dim dt As DataTable = Nothing

        conn = New SqlConnection(Common.GetConnString())
        conn.Open()

        cmd = New SqlCommand(strSQL, conn)
        'hui question: if there is no ResourceID
        'what we suppose to show
        '7/18/2009

        If sectorid = "oilgas" Then

            sectorid = "oil"

        End If
        If Len(status) > 0 Then
            strSQL = "select r.*,resourceCategory,lu_filetype.filetype, resourcelanguage as language, sectors, countries, region, fileinfostring, topic, [type], replace(replace(resourceLink,'/documents/',''),'.pdf','.jpg') as AltImg from Resources r inner join lu_resourcecategory on r.resourcecategoryID = lu_resourcecategory.resourcecategoryID inner join (select * from tbl_advancedSearch where category = 'Resource') as list on r.resourceid = list.id inner join cross_resource_language on r.resourceid = cross_resource_language.resourceid inner join lu_filetype on r.filetypeid = lu_filetype.filetypeid  inner join lu_language on cross_resource_language.languageid = lu_language.languageid where r.status = '" & status & "' and resourceName Not Like 'Challenge Story%' and sectors like '%" & sectorid & "%'"
        Else
            strSQL = "select r.*,resourceCategory,lu_filetype.filetype, resourcelanguage as language, sectors, countries, region, fileinfostring, topic, [type], replace(replace(resourceLink,'/documents/',''),'.pdf','.jpg') as AltImg from Resources r inner join lu_resourcecategory on r.resourcecategoryID = lu_resourcecategory.resourcecategoryID inner join (select * from tbl_advancedSearch where category = 'Resource') as list on r.resourceid = list.id inner join cross_resource_language on r.resourceid = cross_resource_language.resourceid inner join lu_filetype on r.filetypeid = lu_filetype.filetypeid  inner join lu_language on cross_resource_language.languageid = lu_language.languageid where r.status = 'final' and resourceName Not Like 'Challenge Story%' and sectors like '%" & sectorid & "%'"
        End If


        cmd.CommandText = strSQL
        cmd.CommandType = CommandType.Text
        da = New SqlDataAdapter(cmd)
        ds = New DataSet
        ds.CaseSensitive = False

        da.Fill(ds)
        dt = ds.Tables(0)

        Return dt


        conn.Dispose()
        conn = Nothing
        cmd = Nothing
        da = Nothing
        ds = Nothing

        Return dt
    End Function

    Public Shared Function GetRecentResourcesbySector(ByVal sectorid As String, Optional ByVal status As String = "") As DataTable
        Dim conn As SqlConnection = Nothing
        Dim cmd As SqlCommand = Nothing
        Dim strSQL As String = String.Empty
        Dim da As SqlDataAdapter
        Dim ds As DataSet = Nothing
        Dim dt As DataTable = Nothing

        conn = New SqlConnection(Common.GetConnString())
        conn.Open()

        cmd = New SqlCommand(strSQL, conn)
        'hui question: if there is no ResourceID
        'what we suppose to show
        '7/18/2009


        If Len(status) > 0 Then
            strSQL = "select r.*,resourceCategory,filetype, replace(replace(resourceLink,'/documents/',''),'.pdf','.jpg') as AltImg from Resources r inner join lu_filetype on r.filetypeid = lu_filetype.filetypeid  inner join lu_resourcecategory on r.resourcecategoryID = lu_resourcecategory.resourcecategoryID inner join cross_resource_sector x on x.resourceid = r.resourceid where r.status = '" & status & "' and x.sector like '%" & sectorid & "%'"
        Else
            strSQL = "select r.*,resourceCategory,filetype,replace(replace(resourceLink,'/documents/',''),'.pdf','.jpg') as AltImg from Resources r inner join lu_filetype on r.filetypeid = lu_filetype.filetypeid  inner  join lu_resourcecategory on r.resourcecategoryID = lu_resourcecategory.resourcecategoryID inner join cross_resource_sector x on x.resourceid = r.resourceid where x.sector like '%" & sectorid & "%'"
        End If


        cmd.CommandText = strSQL
        cmd.CommandType = CommandType.Text
        da = New SqlDataAdapter(cmd)
        ds = New DataSet
        ds.CaseSensitive = False

        da.Fill(ds)
        dt = ds.Tables(0)

        Return dt


        conn.Dispose()
        conn = Nothing
        cmd = Nothing
        da = Nothing
        ds = Nothing

        Return dt
    End Function


    Public Shared Function GetResourceByResourceId(ByVal ResourceId As String, Optional ByVal status As String = "") As clsResourceVO
        Dim conn As SqlConnection = Nothing
        Dim cmd As SqlCommand = Nothing
        Dim strSQL As String = String.Empty
        Dim da As SqlDataAdapter
        Dim ds As DataSet = Nothing
        Dim dt As DataTable = Nothing

        conn = New SqlConnection(Common.GetConnString())
        conn.Open()

        cmd = New SqlCommand(strSQL, conn)
        'hui question: if there is no ResourceID
        'what we suppose to show
        '7/18/2009

        Dim iResourceID = 0
        If (Integer.TryParse(ResourceId, 0)) Then
            iResourceID = CInt(ResourceId)
        Else
            Return Nothing
        End If
        If Len(status) > 0 Then
            strSQL = "select r.*,resourceCategory,filetype, replace(replace(resourceLink,'/documents/',''),'.pdf','.jpg') as AltImg from Resources r inner join lu_filetype on r.filetypeid = lu_filetype.filetypeid  inner join lu_resourcecategory on r.resourcecategoryID = lu_resourcecategory.resourcecategoryID where r.status = '" & status & "' and r.ResourceId=" & iResourceID
        Else
            strSQL = "select r.*,resourceCategory,filetype,replace(replace(resourceLink,'/documents/',''),'.pdf','.jpg') as AltImg from Resources r inner join lu_filetype on r.filetypeid = lu_filetype.filetypeid  inner  join lu_resourcecategory on r.resourcecategoryID = lu_resourcecategory.resourcecategoryID  where r.ResourceId=" & iResourceID
        End If


        cmd.CommandText = strSQL
        cmd.CommandType = CommandType.Text
        da = New SqlDataAdapter(cmd)
        ds = New DataSet
        ds.CaseSensitive = False

        da.Fill(ds)
        dt = ds.Tables(0)

        Dim x As Integer
        Dim ResourceObj As clsResourceVO

        If (dt.Rows.Count > 0) Then
            ResourceObj = New clsResourceVO

            For x = 0 To dt.Rows.Count - 1
                ResourceObj.setResourceId(ResourceId)
                ResourceObj.setName(dt.Rows(x)("resourceName"))
                ResourceObj.setResourceLink(dt.Rows(x)("resourcelink"))
                ResourceObj.setResourcePages(dt.Rows(x)("resourcePages"))
                ResourceObj.setResourceSize(dt.Rows(x)("resourceSize"))
                ResourceObj.setResourceFileDate(dt.Rows(x)("resourceFileDate"))
                ResourceObj.setResourceTopic(dt.Rows(x)("resourceTopic"))
                ResourceObj.setSource(dt.Rows(x)("resourceSource"))
                ResourceObj.setGrouping(dt.Rows(x)("grouping"))
                ResourceObj.setAuthor(dt.Rows(x)("author"))
                ResourceObj.setStatus(dt.Rows(x)("status"))
                ResourceObj.setShortName(dt.Rows(x)("shortName"))
                ResourceObj.setResourceImage(dt.Rows(x)("resourceImage"))
                ResourceObj.setAltImage(dt.Rows(x)("AltImg")) ' if all we have is a file name, check to see if there is an identically named JPEG in the doc_thumbs/JPEG folder
                ResourceObj.setFileTypeID(dt.Rows(x)("filetypeID"))
                ResourceObj.setFileType(dt.Rows(x)("filetype"))
                ResourceObj.setResourceCategoryID(dt.Rows(x)("resourcecategoryID"))
                ResourceObj.setSideBar(dt.Rows(x)("sidebar"))

            Next
        Else
            ResourceObj = Nothing
        End If

        conn.Dispose()
        conn = Nothing
        cmd = Nothing
        da = Nothing
        ds = Nothing

        Return ResourceObj
    End Function


    Public Shared Function getAllResources(ByVal order As String, ByVal field As String, ByVal keyword As String) As DataTable
        Dim conn As SqlConnection = Nothing
        Dim cmd As SqlCommand = Nothing
        Dim strSQL As String = String.Empty
        Dim da As SqlDataAdapter
        Dim ds As DataSet = Nothing
        Dim dt As DataTable = Nothing

        conn = New SqlConnection(Common.GetConnString())
        conn.Open()

        cmd = New SqlCommand(strSQL, conn)

        strSQL = "select * from getResourceList "
        If keyword <> "" Then
            strSQL += " where eventname like '%" & keyword & "%' or resourcename like '%" & keyword & "%'"
        End If
        strSQL += "order by " & field & " " & order

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

    Public Shared Function getAllResources2(Optional ByVal status As String = "") As DataTable
        Dim conn As SqlConnection = Nothing
        Dim cmd As SqlCommand = Nothing
        Dim strSQL As String = String.Empty
        Dim da As SqlDataAdapter
        Dim ds As DataSet = Nothing
        Dim dt As DataTable = Nothing

        conn = New SqlConnection(Common.GetConnString())
        conn.Open()
        status = "Final"
        cmd = New SqlCommand(strSQL, conn)

        strSQL = "Select r.*,resourceCategory, cross_resource_language.Language, sectors, countries, topic, filetype, lu_resourceCategory.resourceCategory as [type], 
replace(replace(resourceLink,'/documents/',''),'.pdf','.jpg') as AltImg from Resources r 

left join lu_resourcecategory on r.resourcecategoryID = lu_resourcecategory.resourcecategoryID 

  LEFT JOIN (select resourceid as sl_rid, string_agg(sector,',') as sectors 
    from (
            select cross_resource_sector.resourceid, lu_sector.sector 
            from cross_resource_sector inner join lu_sector 
            on cross_resource_sector.sector = lu_sector.sectorabbr
        ) as cross_resource_sector2 
    group by resourceid) as getsectorlist 
    on r.resourceid = getsectorlist.sl_rid

 

    LEFT JOIN (select resourceid as tl_rid, string_agg(topic,',') as topic
    from cross_resource_topic 
    group by resourceid) as gettopicslist 
    on r.resourceid = gettopicslist.tl_rid

 

    LEFT JOIN (select resourceid as cl_rid, string_agg(country,',') as countries
    from cross_resource_country 
    group by resourceid) as getcountrylist 
    on r.resourceid = getcountrylist.cl_rid


   LEFT JOIN (select resourceid as ll_rid, string_agg(language,',') as languagelist 
    from cross_resource_language 
    group by resourceid) as getlanguagelist 
    on r.resourceid = getlanguagelist.ll_rid

left join lu_fileType on r.filetypeID = lu_fileType.filetypeID

left join cross_resource_language on r.resourceid = cross_resource_language.resourceid where r.status = '" & status & "' order by resourceFiledate desc"


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
    'Public Shared Function getRecentResources(ByVal order As String, ByVal field As String, ByVal keyword As String) As DataTable
    '    Dim conn As SqlConnection = Nothing
    '    Dim cmd As SqlCommand = Nothing
    '    Dim strSQL As String = String.Empty
    '    Dim da As SqlDataAdapter
    '    Dim ds As DataSet = Nothing
    '    Dim dt As DataTable = Nothing

    '    conn = New SqlConnection(Common.GetConnString())
    '    conn.Open()

    '    cmd = New SqlCommand(strSQL, conn)

    '    strSQL = "select * from getResourceList where resourcefiledate >  '" & DateAdd(DateInterval.Day, -90, Today()) & "'"
    '    If keyword <> "" Then
    '        strSQL += " and eventname like '%" & keyword & "%' or resourcename like '%" & keyword & "%'"
    '    End If
    '    strSQL += "order by " & field & " " & order

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

    'used for detail view of the Resources
    Public Shared Function getResourceSectorsByResourceId(ByVal ResourceId As String) As DataTable
        Dim conn As SqlConnection = Nothing
        Dim cmd As SqlCommand = Nothing
        Dim strSQL As String = String.Empty
        Dim da As SqlDataAdapter
        Dim ds As DataSet = Nothing
        Dim dt As DataTable = Nothing

        conn = New SqlConnection(Common.GetConnString())
        conn.Open()

        cmd = New SqlCommand(strSQL, conn)

        strSQL = "select es.sectorid, ls.Sector, ls.sectorabbr from cross_resource_sector es, lu_sector ls " & _
"where es.ResourceId=" & ResourceId & " and es.sectorid= ls.sectorid order by ls.sector"

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


    'used for detail view of the Resources
    Public Shared Function getCountriesByResourceId(ByVal ResourceId As String) As DataTable
        Dim conn As SqlConnection = Nothing
        Dim cmd As SqlCommand = Nothing
        Dim strSQL As String = String.Empty
        Dim da As SqlDataAdapter
        Dim ds As DataSet = Nothing
        Dim dt As DataTable = Nothing

        conn = New SqlConnection(Common.GetConnString())
        conn.Open()

        cmd = New SqlCommand(strSQL, conn)

        strSQL = "select es.countryid, ls.countryname from cross_resource_country es, lu_country ls " & _
"where es.ResourceId=" & ResourceId & " and es.countryid= ls.countryid order by ls.countryname"

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

    'used for detail view of the Resources
    Public Shared Function getTopicsByResourceId(ByVal ResourceId As String) As DataTable
        Dim conn As SqlConnection = Nothing
        Dim cmd As SqlCommand = Nothing
        Dim strSQL As String = String.Empty
        Dim da As SqlDataAdapter
        Dim ds As DataSet = Nothing
        Dim dt As DataTable = Nothing

        conn = New SqlConnection(Common.GetConnString())
        conn.Open()

        cmd = New SqlCommand(strSQL, conn)

        strSQL = "select es.topicid, ls.topic from cross_resource_topic es, lu_topics ls " & _
"where es.ResourceId=" & ResourceId & " and es.topicid= ls.topicid order by ls.topic"

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

    'used for detail view of the Resources
    Public Shared Function getLanguagesByResourceId(ByVal ResourceId As String) As DataTable
        Dim conn As SqlConnection = Nothing
        Dim cmd As SqlCommand = Nothing
        Dim strSQL As String = String.Empty
        Dim da As SqlDataAdapter
        Dim ds As DataSet = Nothing
        Dim dt As DataTable = Nothing

        conn = New SqlConnection(Common.GetConnString())
        conn.Open()

        cmd = New SqlCommand(strSQL, conn)

        strSQL = "select es.languageID, ls.resourceLanguage from cross_resource_language es, lu_language ls " & _
"where es.ResourceId=" & ResourceId & " and es.languageid= ls.languageid order by ls.resourcelanguage"

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




    'used for detail view of the Resources
    Public Shared Function getEventsByResourceId(ByVal ResourceId As String) As DataTable
        Dim conn As SqlConnection = Nothing
        Dim cmd As SqlCommand = Nothing
        Dim strSQL As String = String.Empty
        Dim da As SqlDataAdapter
        Dim ds As DataSet = Nothing
        Dim dt As DataTable = Nothing

        conn = New SqlConnection(Common.GetConnString())
        conn.Open()

        cmd = New SqlCommand(strSQL, conn)

        strSQL = "select es.eventid, ls.name from cross_resource_event es, events ls " & _
"where es.ResourceId=" & ResourceId & " and es.eventid= ls.eventid order by ls.name"

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


    Public Shared Function deleteResourceSectorsByResourceId(ByVal ResourceId As String) As Boolean
        Dim conn As SqlConnection = Nothing
        Dim cmd As SqlCommand = Nothing
        Dim strSQL As String = String.Empty
        'Dim da As SqlDataAdapter
        'Dim ds As DataSet = Nothing
        'Dim dt As DataTable = Nothing

        conn = New SqlConnection(Common.GetConnString())
        conn.Open()

        cmd = New SqlCommand(strSQL, conn)

        strSQL = "delete from cross_resource_sector where ResourceId=" & ResourceId

        cmd.CommandText = strSQL
        cmd.CommandType = CommandType.Text
        cmd.ExecuteNonQuery()


        conn.Dispose()
        conn = Nothing
        cmd = Nothing

        Return True
    End Function

    Public Shared Function deleteResourceCountriesByResourceId(ByVal ResourceId As String) As Boolean
        Dim conn As SqlConnection = Nothing
        Dim cmd As SqlCommand = Nothing
        Dim strSQL As String = String.Empty
        'Dim da As SqlDataAdapter
        'Dim ds As DataSet = Nothing
        'Dim dt As DataTable = Nothing

        conn = New SqlConnection(Common.GetConnString())
        conn.Open()

        cmd = New SqlCommand(strSQL, conn)

        strSQL = "delete from cross_resource_country where ResourceId=" & ResourceId

        cmd.CommandText = strSQL
        cmd.CommandType = CommandType.Text
        cmd.ExecuteNonQuery()


        conn.Dispose()
        conn = Nothing
        cmd = Nothing

        Return True
    End Function

    Public Shared Function deleteResourceTopicsByResourceId(ByVal ResourceId As String) As Boolean
        Dim conn As SqlConnection = Nothing
        Dim cmd As SqlCommand = Nothing
        Dim strSQL As String = String.Empty
        'Dim da As SqlDataAdapter
        'Dim ds As DataSet = Nothing
        'Dim dt As DataTable = Nothing

        conn = New SqlConnection(Common.GetConnString())
        conn.Open()

        cmd = New SqlCommand(strSQL, conn)

        strSQL = "delete from cross_resource_topic where ResourceId=" & ResourceId

        cmd.CommandText = strSQL
        cmd.CommandType = CommandType.Text
        cmd.ExecuteNonQuery()


        conn.Dispose()
        conn = Nothing
        cmd = Nothing

        Return True
    End Function

    Public Shared Function deleteResourceLanguageByResourceId(ByVal ResourceId As String) As Boolean
        Dim conn As SqlConnection = Nothing
        Dim cmd As SqlCommand = Nothing
        Dim strSQL As String = String.Empty
        'Dim da As SqlDataAdapter
        'Dim ds As DataSet = Nothing
        'Dim dt As DataTable = Nothing

        conn = New SqlConnection(Common.GetConnString())
        conn.Open()

        cmd = New SqlCommand(strSQL, conn)

        strSQL = "delete from cross_resource_language where ResourceId=" & ResourceId

        cmd.CommandText = strSQL
        cmd.CommandType = CommandType.Text
        cmd.ExecuteNonQuery()


        conn.Dispose()
        conn = Nothing
        cmd = Nothing

        Return True
    End Function

    Public Shared Function deleteResourceEventByResourceId(ByVal ResourceId As String) As Boolean
        Dim conn As SqlConnection = Nothing
        Dim cmd As SqlCommand = Nothing
        Dim strSQL As String = String.Empty
        'Dim da As SqlDataAdapter
        'Dim ds As DataSet = Nothing
        'Dim dt As DataTable = Nothing

        conn = New SqlConnection(Common.GetConnString())
        conn.Open()

        cmd = New SqlCommand(strSQL, conn)

        strSQL = "delete from cross_resource_event where ResourceId=" & ResourceId

        cmd.CommandText = strSQL
        cmd.CommandType = CommandType.Text
        cmd.ExecuteNonQuery()
        strSQL = "update resources set resourceparentid = null where resourceparentid = " & ResourceId & " and resourcesource = 'Events'"

        cmd.CommandText = strSQL
        cmd.CommandType = CommandType.Text
        cmd.ExecuteNonQuery()

        conn.Dispose()
        conn = Nothing
        cmd = Nothing

        Return True
    End Function

    'for sector landing page
    Public Shared Function getResourceDetailsBySector(ByVal sector As String) As DataTable
        Dim conn As SqlConnection = Nothing
        Dim cmd As SqlCommand = Nothing
        Dim strSQL As String = String.Empty
        Dim da As SqlDataAdapter
        Dim ds As DataSet = Nothing
        Dim dt As DataTable = Nothing

        conn = New SqlConnection(Common.GetConnString())
        conn.Open()

        cmd = New SqlCommand(strSQL, conn)

        strSQL = "select e.Resourceid, c.countryName as country, e.city, e.startDate, e.endDate, e.name, e.details from Resources e, ResourceSectors es, l_Country c " & _
"where (e.sponsored=1 or e.subcommittee=1) and e.Resourceid=es.Resourceid and  c.cId= e.country and es.sectorid='" & sector & "' order by e.startDate desc"

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

    'for Resource year list view
    Public Shared Function GetResourcesByYearAndSectorAndType(ByVal myYear As String, ByVal mySector As String, ByVal myType As String) As DataTable
        Dim conn As SqlConnection = Nothing
        Dim cmd As SqlCommand = Nothing
        Dim strSQL As String = String.Empty
        Dim da As SqlDataAdapter
        Dim ds As DataSet = Nothing
        Dim dt As DataTable = Nothing

        conn = New SqlConnection(Common.GetConnString())
        conn.Open()

        cmd = New SqlCommand(strSQL, conn)

        '     strSQL = "select distinct e.Resourceid, c.partnercountry as country, e.city, e.startDate, e.endDate, e.name, e.details from Resources e, ResourceSectors es, l_PartnerCountry c " & _
        '" where e.Resourceid=es.Resourceid and  c.pcId= e.country "

        strSQL = "select distinct e.Resourceid, c.countryname as country, e.city, e.startDate, e.endDate, e.name, e.details from Resources e, ResourceSectors es, l_Country c " & _
   " where e.Resourceid=es.Resourceid and  c.cId= e.country "

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



    Public Shared Function getResourceDetailsBySectorAndCountry(ByVal sector As String, ByVal countryId As String) As DataTable
        Dim conn As SqlConnection = Nothing
        Dim cmd As SqlCommand = Nothing
        Dim strSQL As String = String.Empty
        Dim da As SqlDataAdapter
        Dim ds As DataSet = Nothing
        Dim dt As DataTable = Nothing

        conn = New SqlConnection(Common.GetConnString())
        conn.Open()

        cmd = New SqlCommand(strSQL, conn)

        '        strSQL = "select e.Resourceid, c.partnercountry as country, e.city, e.startDate, e.endDate, e.name, e.details from Resources e, ResourceSectors es, l_PartnerCountry c " & _
        '"where e.sponsored=1 and e.subcommittee=1 and e.Resourceid=es.Resourceid and  c.pcId= e.country and es.sectorid='" & sector & "' and e.country=" & countryId


        strSQL = "select e.Resourceid, c.countryName as country, e.city, e.startDate, e.endDate, e.name, e.details from Resources e, ResourceSectors es, l_Country c " & _
"where (e.sponsored=1 or  e.subcommittee=1) and e.Resourceid=es.Resourceid and  c.cId= e.country and es.sectorid='" & sector & "' and e.country=" & countryId & " order by e.startDate desc"


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
    Public Function getResourcesListbyCountryID(ByVal countryID As String) As DataTable
        Dim strQuery As String = "SELECT resourceID, resourceName, resourceLink, resourceSource, resourcePages, resourceSize, resourceFiledate, resourceTopic, resourceParentID, CountryName, resourceCategory, fileType, " & _
            " Languages, Sectors " & _
            " FROM     getResourceList AS r" & _
                  " WHERE r.countryID like '%" & countryID & "%' and resourceSource not like 'Methane International'" & _
                    " ORDER BY r.CountryName, resourceSource, resourceCategory, r.ResourceName "
        Dim cmd As New SqlCommand(strQuery)
        ' Debug.Print strQuery
        Dim dt As DataTable = GetData(cmd)
        Return dt
    End Function


    Public Function getResourcesDetailsbyID(ByVal resourceID As String) As DataTable
        Dim strQuery As String = "SELECT r.resourceID, r.resourceName, r.resourceLink, r.resourcePages, r.resourceSize, r.resourceFiledate, r.resourceTopic, r.resourceParentID, r.resourceImage, r.featured, " & _
        " r.shortName, r.author, ft.fileType " & _
        " FROM     Resources AS r INNER JOIN " & _
          "        lu_fileType AS ft ON r.filetypeID = ft.fileTypeID" & _
                  " WHERE r.resourceID = " & resourceID
        Dim cmd As New SqlCommand(strQuery)
        'Debug.Print strQuery
        Dim dt As DataTable = GetData(cmd)
        Return dt
    End Function

    Public Function getEventResourcesListbyCountry(ByVal country As String, ByVal filter As String) As DataTable
        Dim strQuery As String = "SELECT eventid, EventName, resourceLink, resourceName, resourcePages, resourceSize, fileType, e.startDate" & _
            " FROM lu_country inner join events e on lu_country.eventCountryID = e.country left outer join getResourceList on e.name = getresourcelist.eventname " & _
            " where lu_country.countryname like '%" & country & "%' and e.name is not null AND " & filter & _
            " ORDER BY e.startDate DESC, EventName, resourceName "
        Dim cmd As New SqlCommand(strQuery)
        'Debug.Print strQuery
        Dim dt As DataTable = GetData(cmd)
        Return dt
    End Function

    Public Function getEventResourcesbyEventID(ByVal eventID As String, ByVal filter As String, Optional ByVal status As String = "") As DataTable
        Dim strQuery As String = "select x.resourceID, x.EventID, r.resourceName, r.resourceImage, r.resourcefiledate, ft.fileType, year(r.resourcefiledate) as year, r.resourceLink, 
r.resourcePages, r.resourceSize, r.shortName, r.grouping, r.author from cross_resource_event AS [x] INNER JOIN 
 Resources AS [r] on x.resourceID = r.resourceID inner join lu_fileType AS [ft] on
 r.filetypeID = ft.fileTypeID
 where eventid =" & eventID
        If status = "final" Then
            strQuery += " And r.status = '" & status & "' "
        End If
        strQuery += " AND " & filter
        strQuery += " order by r.grouping, r.resourceName "
        Dim cmd As New SqlCommand(strQuery)
        'Debug.Print(strQuery)
        Dim dt As DataTable = GetData(cmd)
        Return dt
    End Function

    Public Function getSearchResources(ByVal filter As String, ByVal returnCount As String, Optional ByVal orderby As String = "", Optional ByVal status As String = "") As DataTable
        Dim strQuery As String = "SELECT top " & returnCount & " * from (select search.ID, search.category, search.type, search.Name, search.year, " & _
            "search.language, search.preferred_order, search.Link , replace(replace(search.Link,'/documents/',''),'.pdf','.jpg') as imgLink, " & _
            "search.LinkText, countries, region, search.categoryOrder, search.sectors, search.filetype FROM     tbl_AdvancedSearch AS search ) "

        If Len(status) > 0 Then
            strQuery += " WHERE r.status = '" & status & "'"
        Else
            strQuery += "WHERE 1=1 "
        End If
        strQuery += filter
        If Len(orderby) > 0 Then
            strQuery += " order by r.resourceName "
        Else
            strQuery += " order by  " & orderby
        End If

        Dim cmd As New SqlCommand(strQuery)
        'Debug.Print(strQuery)
        Dim dt As DataTable = GetData(cmd)
        Return dt
    End Function
    Public Function getResourcesListbyCountry(ByVal country As String, ByVal months As Integer) As DataTable
        Dim strQuery As String = "select top 5 * from (SELECT  distinct resourceid, resourceName, resourceLink, resourceSource, resourcePages, resourceSize, year(resourceFiledate) as date, resourceFiledate, resourceTopic, resourceParentID, CountryName, resourceCategory, fileType, " &
            " resourcelanguage,resourceImage, fileinfostring, replace(replace(resourcelink,'pdf','jpg'),'/documents/','') as altImg " &
            " FROM     getResourceList AS r" &
                  " WHERE CountryName like '%" & country & "%' and resourceSource not like 'Methane International'" &
                  " and resourcefiledate >= DATEADD(month,-" & months & ",GETDATE()) ) as list" &
                    " ORDER BY resourcefiledate, list.CountryName, list.resourceName "
        Dim cmd As New SqlCommand(strQuery)
        'Debug.Print strQuery
        Dim dt As DataTable = GetData(cmd)
        Return dt
    End Function


    Public Function getResourcesListbyKeyword(ByVal keyword As String, ByVal filter As String) As DataTable
        Dim strQuery As String = "SELECT resourceID, resourceName, resourceLink, resourceSource, resourcePages, resourceSize, year(resourceFiledate) as date, resourceTopic, resourceParentID, CountryName, resourceCategory, fileType, " &
            " Languages, Sectors " &
            " FROM     getResourceList AS r" &
                  " WHERE (resourceName like '%" & keyword & "%' or resourcetopic like '%" & keyword & "%' or languages like '%" & keyword & "%' or sectors like '%" & keyword & "%' or countryname like '%" & keyword & "%') and resourceSource not like 'Methane International' and " & filter &
                    " ORDER BY resourceSource, resourceCategory, resourceName "
        Dim cmd As New SqlCommand(strQuery)
        'Debug.Print strQuery
        Dim dt As DataTable = GetData(cmd)
        Return dt
    End Function

    Public Function getResourcesLanguageByResourceID(ByVal resourceid As String) As DataTable
        Dim strQuery As String = "SELECT resourceid, x.languageid, l.resourceLanguage as language from cross_resource_language x inner join lu_language l on l.languageid = x.languageid where x.resourceid =" & resourceid
        Dim cmd As New SqlCommand(strQuery)
        'Debug.Print strQuery
        Dim dt As DataTable = GetData(cmd)
        Return dt
    End Function


    Public Function getEventDataByResourceId(ByVal resourceid As String) As DataTable
        Dim strQuery As String = "				select * from events where eventid in " &
             "(select distinct eventid from cross_resource_event  " &
             "where resourceid = " & resourceid & ") ORDER BY startDate DESC"

        Dim cmd As New SqlCommand(strQuery)
        'Debug.Print strQuery
        Dim dt As DataTable = GetData(cmd)
        Return dt

    End Function


    Public Function getSectorProceedingsBySector(ByVal sectorid As String) As DataTable
        Dim strQuery As String = "SELECT top 10 events.eventId, events.name, events.city, events.state, " &
            "sectorid, COUNT(cross_resource_event.resourceid) AS countOfResources" &
            "FROM     cross_resource_event INNER JOIN" &
            "                  events ON cross_resource_event.EventID = events.eventId INNER JOIN " &
            "                  eventSectors ON events.eventId = eventSectors.eventId " &
            "GROUP BY events.eventId, events.name, events.city, events.state, sectorid " &
        "HAVING(COUNT(cross_resource_event.resourceid) > 4) " &
            "and eventsectors.sectorid like '%" & sectorid & "%' " &
            "ORDER BY events.eventId DESC"

        Dim cmd As New SqlCommand(strQuery)
        'Debug.Print strQuery
        Dim dt As DataTable = GetData(cmd)
        Return dt

    End Function

    Public Shared Function updateEmail(ByVal RecordId As String, setStatus As String, setComment As String) As String
        Dim conn As SqlConnection = Nothing
        Dim cmd As SqlCommand = Nothing
        Dim strSQL As String = String.Empty


        conn = New SqlConnection(Common.GetConnString())
        conn.Open()

        cmd = New SqlCommand(strSQL, conn)


        strSQL = "update dashboardDM set status = '" & setStatus & "', comments = '" & setComment & "' where id=" & RecordId
        cmd.CommandText = strSQL
        cmd.CommandType = CommandType.Text
        cmd.ExecuteNonQuery()


        strSQL = ""
        'cmd.Dispose()
        conn.Dispose()
        conn = Nothing
        cmd = Nothing

        Return "1"
    End Function

    Friend Function ShowResourceList(dt As DataTable, sectorid As String) As String


        Dim resourceid As String
        Dim nameValue As String
        Dim phString As String = ""

        Dim sectorValue As String
        Dim detailsValue As String

        Dim endTitle As String


        endTitle = "</tr>"

        Dim x
        If sectorid = "recent" Then
            phString += "<table id='table' class='table hover card'>" & Chr(10)
        Else
            phString += "<table id='table' class='table hover'>" & Chr(10)
        End If


        phString += "<thead>" & Chr(10)
        phString += "<tr><th>resourceImage</th><th>resourceName</th><th>Year</th><th>resourceid</th><th>resourceLink</th><th>Description</th><th>resourceCategory</th><th>resourceLanguage</th><th>tags</th></tr>" & Chr(10)
        phString += "</thead>" & Chr(10)
        phString += "<tbody>" & Chr(10)
        For x = 0 To dt.Rows.Count - 1


            Dim locationString = ""


            resourceid = dt.Rows(x)("resourceid")
            nameValue = dt.Rows(x)("resourcename")
            Dim namevaltext As String = ""
            namevaltext = "<a href=""/resources/details.aspx?resourceid=" & resourceid & """ alt=""Resource details"">" & nameValue & "</a>"




            If Len(dt.Rows(x)("featuredText").ToString) > 1 Then
                detailsValue = Left(replaceHTMLTags(dt.Rows(x)("featuredText")), 200) & "..." & Chr(10)
                'detailsValue = "<p>" & replaceHTMLTags(Left(dt.Rows(x)("featuredText"), 200) & "...") & "</p>" & Chr(10)
            ElseIf Len(dt.Rows(x)("resourceTopic").ToString) > 1 Then
                detailsValue = Left(replaceHTMLTags(dt.Rows(x)("resourceTopic")), 200) & "..." & Chr(10)
                'detailsValue = "<p>" & replaceHTMLTags(Left(dt.Rows(x)("resourceTopic"), 200) & "...") & "</p>" & Chr(10)
            Else
                detailsValue = dt.Rows(x)("grouping") & " " & dt.Rows(x)("shortname") & Chr(10)
            End If

            'get sector desc 
            Dim sectDescStr = ""
            Dim firstsector As String = ""
            Dim sectors As DataTable
            sectors = clsResourceDAO.getResourceSectorsByResourceId(resourceid)
            Dim y
            For y = 0 To sectors.Rows.Count - 1
                Dim desc As String
                desc = sectors.Rows(y)("Sector")
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

                Dim curFile As String = System.Web.HttpContext.Current.Server.MapPath(dt.Rows(x)("resourceImage").ToString)
                Dim curfileAlt As String = System.Web.HttpContext.Current.Server.MapPath("/assets/images/" & dt.Rows(x)("resourceImage"))
                Dim str1 As String = ""
                str1 = replaceHTMLTags(StripMetaChars(dt.Rows(x)("altImg").ToString))

                Dim curfileAlt2 As String = System.Web.HttpContext.Current.Server.MapPath("/assets/images/" & str1)
                If System.IO.File.Exists(curFile) = True Then
                    fileUrl += dt.Rows(x)("resourceImage")

                ElseIf System.IO.File.Exists(curfileAlt) = True Then
                    fileUrl += "/assets/images/" + dt.Rows(x)("resourceImage")

                ElseIf System.IO.File.Exists(curfileAlt2) = True Then
                    fileUrl += "/assets/images/" + dt.Rows(x)("AltImg")

                Else

                    Dim n As Integer = GetRandom(0, 4)

                    fileUrl += "/assets/images/event_feature_" + getSectorEventURL(firstsector) + n.ToString + ".JPG"

                End If
            Catch ex As System.Net.WebException
                fileUrl += dt.Rows(x)("resourceImage")
            End Try



            phString += "<tr><td class='gmi-light-resource'>" & Chr(10)
            phString += fileUrl
            phString += "</td>" & Chr(10)
            phString += "<td>" & nameValue & "</td>" & Chr(10)
            Dim rYear As String
            If IsDate(dt.Rows(x)("resourcefiledate")) Then
                rYear = Year(dt.Rows(x)("resourcefiledate")).ToString
            Else
                rYear = ""
            End If
            phString += "<td>" & rYear & "</td>" & Chr(10)
            phString += "<td>" & resourceid & "</td>" & Chr(10)
            phString += "<td>/resources/details.aspx?resourceid=" & resourceid & "</td>" & Chr(10)
            phString += "<td>" & detailsValue & "</td>" & Chr(10)
            phString += "<td>" & dt.Rows(x)("filetype") & "</td>" & Chr(10)
            phString += "<td>[language]</td>" & Chr(10)
            Dim tagstring As String = ""
            tagstring += "[sector],"
            tagstring += "[country],"
            tagstring += dt.Rows(x)("resourcecategory") & ","
            tagstring += dt.Rows(x)("grouping") & ","
            tagstring = Replace(tagstring, ",,", ",")
            phString += "<td>" & tagstring & "</td>" & Chr(10)

            'phString += "<td><a href=""/resources/details.aspx?resourceid=" & resourceid & """ alt=""resource details"">" & namevaltext & "</a><br />" & detailsValue & "</td>" & Chr(10)









            'phString += "<td>" & dt.Rows(x)("filetype") & "</td>" & Chr(10)
            'phString += "<td>" & dt.Rows(x)("resourceCategory") & "</td>" & Chr(10)
            'phString += "<td>" & dt.Rows(x)("resourcefiledate") & "</td>" & Chr(10)

            'phString += "<td> <a href = '/resources/details.aspx?resourceid=" & resourceid & "' class='btn btn-outline-primary'>View Details</a></td>" & Chr(10)
            'phString += "<td>" & sectorValue & "</td>" & Chr(10)

            'If Not CookieValue = "user" Then
            '    'user is an administrator
            '    phString += "<a href='/gmi-admin/resourcedetails.aspx?resourceid=" & resourceid & "' class='btn btn-outline-danger'>Edit</a>" & Chr(10)
            'End If
            phString += endTitle & Chr(10)



        Next

        If (dt.Rows.Count > 0) Then
            'CatchMsg += "; no rows"
        End If
        phString += "</tbody></table>" & Chr(10)

        Return phString


    End Function
    Friend Function SaveResourceLIst(dt As DataTable, sectorid As String) As String


        Dim resourceid As String
        Dim nameValue As String
        Dim phString As String = ""

        Dim sectorValue As String = ""
        Dim detailsValue As String = ""

        Dim endTitle As String


        endTitle = "</tr>"

        Dim x

        If sectorid = "recent" Then
            phString += "<table id='table' class='table hover card'>" & Chr(10)
        Else
            phString += "<table id='table' class='table hover'>" & Chr(10)
        End If

        phString += "<thead>" & Chr(10)
        phString += "<tr><th>resourceImage</th><th>resourceName</th><th>Year</th><th>resourceid</th><th>resourceLink</th><th>Description</th><th>Category</th><th>Language</th><th>sectors</th><th>topics</th><th>countries</th><th>types</th><th>tags</th><th>tags Copy</th></tr>" & Chr(10)
        phString += "</thead>" & Chr(10)
        phString += "<tbody>" & Chr(10)
        For x = 0 To dt.Rows.Count - 1


            Dim locationString = ""


            resourceid = dt.Rows(x)("resourceid")
            nameValue = dt.Rows(x)("resourcename")
            Dim namevaltext As String = ""
            namevaltext = "<a href=""/resources/details.aspx?resourceid=" & resourceid & """ alt=""Resource details"">" & nameValue & "</a>"




            If Len(dt.Rows(x)("featuredText").ToString) > 1 Then
                detailsValue = dt.Rows(x)("featuredText").ToString
                'detailsValue = Left(replaceHTMLTags(dt.Rows(x)("featuredText")), 200) & "..." & Chr(10)
                'detailsValue = "<p>" & replaceHTMLTags(Left(dt.Rows(x)("featuredText"), 200) & "...") & "</p>" & Chr(10)
            ElseIf Len(dt.Rows(x)("resourceTopic").ToString) > 1 Then
                detailsValue = dt.Rows(x)("resourceTopic").ToString
                'detailsValue = Left(replaceHTMLTags(dt.Rows(x)("resourceTopic")), 200) & "..." & Chr(10)
                'detailsValue = "<p>" & replaceHTMLTags(Left(dt.Rows(x)("resourceTopic"), 200) & "...") & "</p>" & Chr(10)
            Else
                detailsValue = dt.Rows(x)("grouping") & " " & dt.Rows(x)("shortname") & Chr(10)
            End If

            'get sector desc 
            Dim sectDescStr = ""
            Dim firstsector As String = ""
            Dim sectors As DataTable
            sectors = clsResourceDAO.getResourceSectorsByResourceId(resourceid)
            Dim y
            For y = 0 To sectors.Rows.Count - 1
                Dim desc As String
                desc = sectors.Rows(y)("Sector")
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

                Dim curFile As String = System.Web.HttpContext.Current.Server.MapPath(dt.Rows(x)("resourceImage").ToString)
                Dim curfileAlt As String = System.Web.HttpContext.Current.Server.MapPath("/assets/images/" & dt.Rows(x)("resourceImage"))
                Dim str1 As String = ""
                str1 = replaceHTMLTags(StripMetaChars(dt.Rows(x)("altImg").ToString))

                Dim curfileAlt2 As String = System.Web.HttpContext.Current.Server.MapPath("/assets/images/" & str1)
                If System.IO.File.Exists(curFile) = True Then
                    fileUrl += dt.Rows(x)("resourceImage")

                ElseIf System.IO.File.Exists(curfileAlt) = True Then
                    fileUrl += "/assets/images/" + dt.Rows(x)("resourceImage")

                ElseIf System.IO.File.Exists(curfileAlt2) = True Then
                    fileUrl += "/assets/images/" + dt.Rows(x)("AltImg")

                Else

                    Dim n As Integer = GetRandom(0, 4)

                    fileUrl += "/assets/images/event_feature_" + getSectorEventURL(firstsector) + n.ToString + ".JPG"

                End If
            Catch ex As System.Net.WebException
                fileUrl += dt.Rows(x)("resourceImage")
            End Try


            'Column 1
            phString += "<tr><td class='gmi-light-resource'>" & Chr(10)
            phString += fileUrl
            phString += "</td>" & Chr(10)
            'Column 2
            phString += "<td>" & nameValue & "</td>" & Chr(10)
            Dim rYear As String
            If IsDate(dt.Rows(x)("resourcefiledate")) Then
                rYear = Year(dt.Rows(x)("resourcefiledate")).ToString
            Else
                rYear = ""
            End If
            'Column 3
            phString += "<td>" & rYear & "</td>" & Chr(10)
            'Column 4
            phString += "<td>" & resourceid & "</td>" & Chr(10)
            'Column 5
            phString += "<td>/resources/details.aspx?resourceid=" & resourceid & "</td>" & Chr(10)
            'Column 6
            phString += "<td>" & detailsValue & "</td>" & Chr(10)
            'Column 7
            phString += "<td>" & dt.Rows(x)("filetype") & "</td>" & Chr(10)
            'Column 8
            phString += "<td>" & dt.Rows(x)("language") & "</td>" & Chr(10)
            '3/1/21 Additions
            phString += "<td>" & dt.Rows(x)("sectors") & "</td>" & Chr(10)
            phString += "<td>" & dt.Rows(x)("topic") & "</td>" & Chr(10)
            phString += "<td>" & dt.Rows(x)("countries") & "</td>" & Chr(10)
            phString += "<td>" & dt.Rows(x)("type") & "</td>" & Chr(10)

            'End 3/1/21 Additions
            Dim tagstring As String = ""
            tagstring += sectorValue & ","
            tagstring += dt.Rows(x)("countries") & ","
            tagstring += dt.Rows(x)("topic") & ","
            tagstring += dt.Rows(x)("resourcecategory") & ","
            tagstring += dt.Rows(x)("type") & ","
            tagstring += dt.Rows(x)("grouping") & ","
            tagstring = Replace(tagstring, ",,", ",")
            'Column 9
            phString += "<td>" & tagstring & "</td>" & Chr(10) ' this is used for the main filters
            'Column 10 - this is a copy of Column 9
            phString += "<td>" & tagstring & "</td>" & Chr(10) ' this is used for the keyword filters // we really do use them both


            'phString += "<td><a href=""/resources/details.aspx?resourceid=" & resourceid & """ alt=""resource details"">" & namevaltext & "</a><br />" & detailsValue & "</td>" & Chr(10)









            'phString += "<td>" & dt.Rows(x)("filetype") & "</td>" & Chr(10)
            'phString += "<td>" & dt.Rows(x)("resourceCategory") & "</td>" & Chr(10)
            'phString += "<td>" & dt.Rows(x)("resourcefiledate") & "</td>" & Chr(10)

            'phString += "<td> <a href = '/resources/details.aspx?resourceid=" & resourceid & "' class='btn btn-outline-primary'>View Details</a></td>" & Chr(10)
            'phString += "<td>" & sectorValue & "</td>" & Chr(10)

            'If Not CookieValue = "user" Then
            '    'user is an administrator
            '    phString += "<a href='/gmi-admin/resourcedetails.aspx?resourceid=" & resourceid & "' class='btn btn-outline-danger'>Edit</a>" & Chr(10)
            'End If
            phString += endTitle & Chr(10)



        Next

        If (dt.Rows.Count > 0) Then
            'CatchMsg += "; no rows"
        End If
        phString += "</tbody></table>" & Chr(10)
        Dim allCSVLines As New List(Of String)
        allCSVLines.Add(phString)
        Dim HTMLfile As String = ""
        If sectorid = "" Then
            HTMLfile = System.Web.HttpContext.Current.Server.MapPath("\resources\all_resources.html")
            File.WriteAllLines(HTMLfile, allCSVLines)

        Else
            HTMLfile = System.Web.HttpContext.Current.Server.MapPath("\resources\" & sectorid & "_resources.html")
            File.WriteAllLines(HTMLfile, allCSVLines)

        End If
        Return phString


    End Function
    Friend Function ShowResourceHighlights(dt As DataTable) As String


        Dim resourceid As String
        Dim nameValue As String
        Dim phString As String = ""

        Dim sectorValue As String
        Dim detailsValue As String

        Dim endTitle As String


        endTitle = "</div></div>"

        Dim x


        If dt Is Nothing Or dt.Rows.Count < 1 Then
        Else

            For x = 0 To dt.Rows.Count - 1
                phString += "<div class='row py-2'><div class='col-sm-4'>" & Chr(10)




                resourceid = dt.Rows(x)("resourceid")
                nameValue = dt.Rows(x)("resourcename")
                Dim namevaltext As String = ""
                namevaltext = "<a href=""/resources/details.aspx?resourceid=" & resourceid & """ alt=""Resource details"">" & nameValue & "</a>"




                'If Len(dt.Rows(x)("featuredText").ToString) > 1 Then
                '    detailsValue = "<p>" & replaceHTMLTags(Left(dt.Rows(x)("featuredText"), 200) & "...") & "</p>" & Chr(10)
                'Else
                If Len(dt.Rows(x)("resourceTopic").ToString) > 1 Then
                    detailsValue = "<p>" & Left(replaceHTMLTags(dt.Rows(x)("resourceTopic")), 200) & "...</p>" & Chr(10)
                Else
                    detailsValue = "<p>" & dt.Rows(x)("grouping") & " " & dt.Rows(x)("shortname") & "</p>" & Chr(10)
                End If

                'get sector desc 
                Dim sectDescStr = ""
                Dim firstsector As String = ""
                Dim sectors As DataTable
                sectors = clsResourceDAO.getResourceSectorsByResourceId(resourceid)
                Dim y
                For y = 0 To sectors.Rows.Count - 1
                    Dim desc As String
                    desc = sectors.Rows(y)("Sector")
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
                    Dim curFile As String = System.Web.HttpContext.Current.Server.MapPath(dt.Rows(x)("resourceImage").ToString)
                    Dim curfileAlt As String = System.Web.HttpContext.Current.Server.MapPath("/assets/images/" & dt.Rows(x)("resourceImage"))
                    Dim str1 As String = ""
                    str1 = Replace(Replace(Replace(dt.Rows(x)("altImg").ToString, "/", ""), "http:", ""), "https:", "")

                    Dim curfileAlt2 As String = System.Web.HttpContext.Current.Server.MapPath("/assets/images/" & str1)
                    If System.IO.File.Exists(curFile) = True Then
                        fileUrl += " < a href=""/resources/details.aspx?resourceid=" & resourceid & """ alt=""Resource details""><img src=""" + dt.Rows(x)("resourceImage") + """  style='width:100%;'  alt='" + firstsector + "' title='Featured Image for " + dt.Rows(x)("ResourceName").ToString + "'/>" & Chr(10)

                    ElseIf System.IO.File.Exists(curfileAlt) = True Then
                        fileUrl += "<a href=""/resources/details.aspx?resourceid=" & resourceid & """ alt=""Resource details""><img src=""/assets/images/" + dt.Rows(x)("resourceImage") + """ style='width:100%;'  alt='" + firstsector + "' title='Featured Image for " + dt.Rows(x)("ResourceName").ToString + "'/>" & Chr(10)

                    ElseIf System.IO.File.Exists(curfileAlt2) = True Then
                        fileUrl += "<a href=""/resources/details.aspx?resourceid=" & resourceid & """ alt=""Resource details""><img src=""/assets/images/" + dt.Rows(x)("AltImg") + """  style='width:100%;'  alt='" + firstsector + "' title='Featured Image for " + dt.Rows(x)("ResourceName").ToString + "'/>" & Chr(10)

                    Else

                        Dim n As Integer = GetRandom(0, 2)

                        fileUrl += "<a href=""/resources/details.aspx?resourceid=" & resourceid & """ alt=""Event details""><img src=""/assets/images/resource_feature_" + getSectorEventURL(firstsector) + n.ToString + ".JPG""  style='width:100%;' alt='" + firstsector + "' title='Featured Image for " + dt.Rows(x)("ResourceName").ToString + "'/>" & Chr(10)

                    End If
                Catch ex As System.Net.WebException
                    fileUrl += "<a href=""/resources/details.aspx?resourceid=" & resourceid & """ alt=""Event details""><img src=""" + dt.Rows(x)("resourceImage") + """  style='width:100%;'  alt='" + firstsector + "' title='Featured Image for " + dt.Rows(x)("ResourceName").ToString + "'/>" & Chr(10)
                End Try
                fileUrl += "</a>"




                phString += fileUrl
                phString += "</div> <div class='col-sm-8'>" & Chr(10)
                phString += "<h4>"
                phString += namevaltext & "</h4>"

                phString += dt.Rows(x)("date") & ", "

                phString += Replace(Replace(dt.Rows(x)("fileinfoString"), ")", ""), "(", "")
                If Len(dt.Rows(x)("resourcelanguage").ToString) > 2 Then
                    phString += ", " & dt.Rows(x)("resourcelanguage")
                End If
                phString += "<br />"




                phString += "<p>" & detailsValue & "</p>" & Chr(10)



                phString += "" & endTitle & Chr(10)



            Next
        End If
        If (dt.Rows.Count > 0) Then
            'CatchMsg += "; no rows"
        End If
        phString += "" & Chr(10)

        Return phString

    End Function


End Class
