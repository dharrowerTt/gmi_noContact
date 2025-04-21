Imports System.IO
Imports System.Text
Imports System.Data
Imports System.Data.SqlClient

Public Class clsActivitiesDAO
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

    Public Shared Function GetActivities(Optional ByVal status As String = "") As DataTable
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
            strSQL = "select a.* from tbl_advancedsearch a where a.status = '" & status & "' and category = 'Activity' order by year desc, name asc"
        Else
            strSQL = "select a.* from tbl_advancedsearch a where  category = 'Activity' order by year desc, name asc"
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

    Public Shared Function GetSitesDownload() As DataTable
        Dim conn As SqlConnection = Nothing
        Dim cmd As SqlCommand = Nothing
        Dim strSQL As String = String.Empty
        Dim da As SqlDataAdapter
        Dim ds As DataSet = Nothing
        Dim dt As DataTable = Nothing

        conn = New SqlConnection(Common.GetConnString())
        conn.Open()

        cmd = New SqlCommand(strSQL, conn)


        strSQL = "SELECT distinct * from (select replace(sf_sites.name,'_','') AS site, sf_countries.Name as Country, sf_sites.sector as Sector, case when sf_sites.gmi_site = 1 then 'Yes' else 'No' end  as GMISite, sf_sites.Latitude as lat, sf_sites.longitude as lng, 'https://www.globalmethane.org/sites/siteDetails.aspx?myObjID=' + sf_sites.Id as URL, sf_sites.Id as SiteID, IsNull(sf_sites.city + ', ','')  + sf_countries.Name as CityCountry FROM     sf_sites INNER JOIN  sf_countries ON sf_sites.Country = sf_countries.Id where sf_sites.Latitude is not null and sf_sites.gmi_site = 1 and sf_sites.longitude is not null AND sector <> 'AgStar Domestic') as list"


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


    Public Shared Function GetActivitiesbySector(ByVal sectorid As String, Optional ByVal status As String = "") As DataTable
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
            strSQL = "SELECT        ID, ID_category, Name, year, StartDate, EndDate, Link, LinkText, category, type, language, parentID, preferred_order, Expertise, Project_Network_Member, resourceSource, resourcePages, resourceSize, oldresourceTopic, " &
                         " fileType, SiteName, siteID, categoryOrder, keywords, replace(sectors,',',';') as sectors, replace(countries,',',';') as countries, region, fileInfostring, status, topic, topicType, topicid, archivedYN, imgUrl, featured, resourceTopic  " &
                        " From            tbl_AdvancedSearch where a.status = '" & status & "' and category = 'Activity' and a.sectors like '%" & sectorid & "%'  order by year desc, name asc"
        Else
            strSQL = "SELECT        ID, ID_category, Name, year, StartDate, EndDate, Link, LinkText, category, type, language, parentID, preferred_order, Expertise, Project_Network_Member, resourceSource, resourcePages, resourceSize, oldresourceTopic, " &
                         " fileType, SiteName, siteID, categoryOrder, keywords, replace(sectors,',',';') as sectors, replace(countries,',',';') as countries, region, fileInfostring, status, topic, topicType, topicid, archivedYN, imgUrl, featured, resourceTopic  " &
                        " From            tbl_AdvancedSearch where category = 'Activity' and a.sectors like '%" & sectorid & "%'  order by year desc, name asc"
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

    Friend Function SaveActivityList(dt As DataTable, sectorid As String) As String


        Dim activityID As String
        Dim name As String
        Dim phString As String = ""

        Dim sectorValue As String
        Dim detailsValue As String

        Dim endTitle As String


        endTitle = "</tr>"

        Dim x


        phString += "<table id='table' class='table hover'>" & Chr(10)
        phString += "<thead>" & Chr(10)
        phString += "<tr><th>&nbsp;</th><th>Name</th><th>Year</th><th>activityID</th><th>Link</th><th>Description</th><th>Type</th><th>tags</th></tr>" & Chr(10)
        phString += "</thead>" & Chr(10)
        phString += "<tbody>" & Chr(10)
        For x = 0 To dt.Rows.Count - 1


            Dim locationString = ""


            activityID = dt.Rows(x)("id")
            name = dt.Rows(x)("name")
            Dim namevaltext As String = ""
            namevaltext = "<a href=""/sites/activity_detail.aspx?a=" & activityID & """ alt=""Activity details"">" & name & "</a>"




            If Len(dt.Rows(x)("keywords").ToString) > 1 Then
                detailsValue = dt.Rows(x)("keywords").ToString
            ElseIf Len(dt.Rows(x)("keywords").ToString) > 1 Then
                detailsValue = dt.Rows(x)("keywords").ToString

            End If

            'get sector desc 
            Dim sectDescStr = ""
            Dim firstsector As String = ""

            ' you want to split this input string
            Dim s As String = dt.Rows(x)("sectors").ToString

            ' Split string based on comma
            Dim sectors As String() = s.Split(New Char() {";"c})

            ' Use For Each loop over words and display them

            Dim sector As String
            For Each sector In sectors
                'Console.WriteLine(sector)
                If firstsector = "" Then
                    firstsector = sector
                End If
            Next

            ' you want to split this input string
            s = dt.Rows(x)("countries").ToString
            ' Split string based on comma
            Dim countries As String() = s.Split(New Char() {";"c})

            ' Use For Each loop over words and display them
            Dim firstcountry As String = ""
            Dim country As String
            For Each country In countries
                'Console.WriteLine(sector)
                If firstcountry = "" Then
                    firstcountry = country
                End If
            Next

            '// feature image
            Dim fileUrl As String = ""


            Try



                Dim curFile As String = System.Web.HttpContext.Current.Server.MapPath("/assets/images/svgFlags/" & firstcountry.ToLower & ".svg")

                If System.IO.File.Exists(curFile) = True Then


                    fileUrl += "/assets/images/svgFlags/" & firstcountry.ToLower & ".svg"
                Else
                    Dim n As Integer = GetRandom(1, 4)
                    curFile = System.Web.HttpContext.Current.Server.MapPath("/assets/images/event_feature_" + getSectorEventURL(firstsector) + n.ToString + ".JPG")

                    If System.IO.File.Exists(curFile) = True Then
                        fileUrl += "/assets/images/event_feature_" + getSectorEventURL(firstsector) + n.ToString + ".JPG"
                    End If
                End If


            Catch

                Dim curFile As String = System.Web.HttpContext.Current.Server.MapPath("/assets/images/event_feature_" + getSectorEventURL(firstsector) + "0.JPG")

                If System.IO.File.Exists(curFile) = True Then
                    fileUrl += "/assets/images/event_feature_" + getSectorEventURL(firstsector) + "0.JPG"
                End If
            End Try



            phString += "<tr><td class='gmi-light-resource'>" & Chr(10)
            phString += fileUrl
            phString += "</td>" & Chr(10)
            phString += "<td>" & name & "</td>" & Chr(10)
            Dim rYear As String
            rYear = dt.Rows(x)("year").ToString
            phString += "<td>" & rYear & "</td>" & Chr(10)
            phString += "<td>" & dt.Rows(x)("id").ToString & "</td>" & Chr(10)
            phString += "<td>/sites/activity_details.aspx?a=" & dt.Rows(x)("id").ToString & "</td>" & Chr(10)
            phString += "<td>" & detailsValue & "</td>" & Chr(10)
            phString += "<td>" & dt.Rows(x)("type") & "</td>" & Chr(10)
            Dim tagstring As String = ""
            tagstring += dt.Rows(x)("sectors").ToString & ","
            tagstring += dt.Rows(x)("countries") & ","
            tagstring += dt.Rows(x)("keywords")
            tagstring = Replace(tagstring, ",,", ",")
            phString += "<td>" & tagstring & "</td>" & Chr(10) ' this is used for the main filters
            phString += "<td>" & tagstring & "</td>" & Chr(10) ' this is used for the keyword filters // we really do use them both

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
            HTMLfile = System.Web.HttpContext.Current.Server.MapPath("\sites\all_activities.html")
            File.WriteAllLines(HTMLfile, allCSVLines)

        Else
            HTMLfile = System.Web.HttpContext.Current.Server.MapPath("\sites\" & sectorid & "_activities.html")
            File.WriteAllLines(HTMLfile, allCSVLines)

        End If
        Return phString


    End Function



End Class
