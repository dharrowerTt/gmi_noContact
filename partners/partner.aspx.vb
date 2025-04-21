Imports System.Data
Imports System.Text
Imports System.Configuration
Imports System.Web.Services
Imports System.Web.Script.Services
Imports System.Data.SqlClient
Public Class partner
    Inherits System.Web.UI.Page
    Public Shared strCountryName As String = ""


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load


        Me.BindGrid()

        Dim data As New clsSearchDAO()
        Dim eventData As New clsEventDAO()


        Dim commitList2 As DataTable = Nothing
        Dim commitList3 As DataTable = Nothing
        Dim featureResource As DataTable = Nothing
        Dim featureResourceImage As DataTable = Nothing



        Page.MaintainScrollPositionOnPostBack = True
        Dim objID As String = ""

        objID = Server.HtmlEncode(Request.QueryString("c"))

        Dim rFlag As String
        rFlag = Server.HtmlEncode(Request.QueryString("r"))
        If IsNothing(rFlag) Then
            rFlag = False
        End If

        If objID = "" Then
            HttpContext.Current.Response.Redirect("partner.aspx?c=brazil")
            objID = Server.HtmlEncode(Request.QueryString("c"))
        End If
        strCountryName = getGeoFocus(objID)

        getDetails(objID)

        'Populating a DataTable from database.
        Dim dt As DataTable = Me.GetOverview(objID)
        Dim html As New StringBuilder()
        'Table start.
        html.Append("<table id='myTable' class='datatable no-footer hover'>")
        'Building the Header row.
        html.Append("<thead><tr class='group'>")
        For Each column As DataColumn In dt.Columns
            html.Append("<th>")
            html.Append(column.ColumnName)
            html.Append("</th>")
        Next
        html.Append("</tr></thead>")
        'Building the Data rows.
        html.Append("<tbody>")
        For Each row As DataRow In dt.Rows
            html.Append("<tr id='")
            html.Append(row(0))
            html.Append("'>")
            For Each column As DataColumn In dt.Columns
                html.Append("<td class='sum'>")
                html.Append(row(column.ColumnName))
                html.Append("</td>")
            Next
            html.Append("</tr>")
        Next
        html.Append("</tbody>")
        html.Append("<tfoot><tr><th>Totals:</th><th></th><th></th><th></th></tr></tfoot>")
        'Table end.
        html.Append("</table>")
        'Append the HTML string to Placeholder.
        PlaceHolder1.Controls.Add(New Literal() With {
      .Text = html.ToString()
    })

        commitList2 = data.GetCountryDelegates(objID)

        If IsNothing(commitList2) Then
            delInfo.Visible = False
            delMsg.Text = getGeoFocus(objID) & " does not currently have any delegates. To find out more about becoming a delegate, please email <a href='mailto:asg@globalmethane.org?subject=becoming a GMI delegate'>asg@globalmethane.org</a>."
            delMsg.Visible = True

        Else
            lookupRepeater.DataSource = commitList2
            lookupRepeater.DataBind()
        End If


        commitList3 = eventData.getEventDetailsByCountry(objID)

        If commitList3 Is Nothing Or commitList3.Rows.Count < 1 Then

        Else
            crlookupRepeater.DataSource = commitList3
            crlookupRepeater.DataBind()
        End If


        Dim FeatLookup As String = ""

        If objID = "us" Then
            FeatLookup = "united states"
        Else
            FeatLookup = objID
        End If


        featureResource = data.GetFeaturedBResourceByCountry(FeatLookup)

        If featureResource Is Nothing Or featureResource.Rows.Count < 1 Then

        Else
            resourceBRepeater.DataSource = featureResource
            resourceBRepeater.DataBind()
        End If



        'Coal

        featureResource = data.GetFeaturedCResourceByCountry(FeatLookup)

        If featureResource Is Nothing Or featureResource.Rows.Count < 1 Then

        Else
            resourceCRepeater.DataSource = featureResource
            resourceCRepeater.DataBind()
        End If

        featureResourceImage = data.GetFeaturedCResourceImageByCountry(FeatLookup)


        'If featureResourceImage Is Nothing Or featureResourceImage.Rows.Count < 1 Then

        'Else
        '    resourceImageCRepeater.DataSource = featureResourceImage
        '    resourceImageCRepeater.DataBind()
        'End If


        'Oil

        featureResource = data.GetFeaturedOGResourceByCountry(FeatLookup)

        If featureResource Is Nothing Or featureResource.Rows.Count < 1 Then

        Else
            resourceOGRepeater.DataSource = featureResource
            resourceOGRepeater.DataBind()
        End If



        'Multi

        featureResource = data.GetFeaturedMResourceByCountry(FeatLookup)

        If featureResource Is Nothing Or featureResource.Rows.Count < 1 Then

        Else
            resourceMRepeater.DataSource = featureResource
            resourceMRepeater.DataBind()
        End If



    End Sub

    Private Sub BindGrid(Optional ByVal direction As String = "", Optional ByVal sortExpression As String = "")


        'LitresourcesCount.Text = "(0)"
        Dim data As New clsSearchDAO()

        Dim commitList2 As DataTable = Nothing

        Dim commitList4 As DataTable = Nothing



        commitList2 = data.GetNavCalendar("", "", "", "'Resource'", "", "", "", "", 0, 1)

        If commitList2 Is Nothing Or commitList2.Rows.Count < 1 Then

        Else
            navRepeater.DataSource = commitList2
            navRepeater.DataBind()
        End If


        commitList4 = data.GetNavSubCalendar("", "", "", "'Resource'", "", "", "", "", 0, 1)

        If commitList4 Is Nothing Or commitList4.Rows.Count < 1 Then

        Else
            navSubRepeater.DataSource = commitList4
            navSubRepeater.DataBind()
        End If



    End Sub


    Sub resourceBDataBound(Sender As Object, e As RepeaterItemEventArgs)
        Dim LitResource As New Literal
        Dim sectorTag As String = ""
        Dim sectorCSSTag As String = ""
        If e.Item.DataItem("sector") = "Oil & Gas" Then
            sectorTag = "Oil & Gas"
            sectorCSSTag = "gmcogtag"
        ElseIf e.Item.DataItem("sector") = "Biogas" Then
            sectorTag = "Biogas"
            sectorCSSTag = "gmcbiogastag"
        ElseIf e.Item.DataItem("sector") = "Coal" Then
            sectorTag = "Coal Mines"
            sectorCSSTag = "gmccoaltag"
        Else
            sectorTag = "Multiple"
            sectorCSSTag = "gmcmultipletag"
        End If
        LitResource.Text = "<div Class='Bslidediv'><a href='" & e.Item.DataItem("resourceLink") & "'><img src='" & e.Item.DataItem("resourceImage") & "' style='float:right;'></a><a href='" & e.Item.DataItem("resourceLink") & "'><h3>" & e.Item.DataItem("TrimmedResourceName") & "</h3></a><br /><p>" & e.Item.DataItem("featuredText") & "</p><br /><a style = 'float:left;' Class='btn btn-primary' href='" & e.Item.DataItem("resourceLink") & "'>Read More...</a></div>"
        resourceBRepeater.Controls.Add(LitResource)

    End Sub


    Sub resourceCDataBound(Sender As Object, e As RepeaterItemEventArgs)
        Dim LitResource As New Literal
        Dim sectorTag As String = ""
        Dim sectorCSSTag As String = ""
        If e.Item.DataItem("sector") = "Oil & Gas" Then
            sectorTag = "Oil & Gas"
            sectorCSSTag = "gmcogtag"
        ElseIf e.Item.DataItem("sector") = "Biogas" Then
            sectorTag = "Biogas"
            sectorCSSTag = "gmcbiogastag"
        ElseIf e.Item.DataItem("sector") = "Coal" Then
            sectorTag = "Coal Mines"
            sectorCSSTag = "gmccoaltag"
        Else
            sectorTag = "Multiple"
            sectorCSSTag = "gmcmultipletag"
        End If
        LitResource.Text = "<div Class='Cslidediv'><a href='" & e.Item.DataItem("resourceLink") & "'><img src='" & e.Item.DataItem("resourceImage") & "' style='float:right;'></a><a href='" & e.Item.DataItem("resourceLink") & "'><h3>" & e.Item.DataItem("TrimmedResourceName") & "</h3></a><br /><p>" & e.Item.DataItem("featuredText") & "</p><br /><a style = 'float:left;' Class='btn btn-primary' href='" & e.Item.DataItem("resourceLink") & "'>Read More...</a></div>"
        resourceCRepeater.Controls.Add(LitResource)

    End Sub

    Sub resourceImageOGDataBound(Sender As Object, e As RepeaterItemEventArgs)
        Dim LitImageOGResource As New Literal
        LitImageOGResource.Text = "<div Class='OgIMGslidediv'><img src='" & e.Item.DataItem("resourceImage") & "' /><a href='" & e.Item.DataItem("resourceLink") & "'></a></div>"
        '   resourceImageOGRepeater.Controls.Add(LitImageOGResource)

    End Sub
    Sub resourceOGDataBound(Sender As Object, e As RepeaterItemEventArgs)
        Dim LitOGResource As New Literal
        Dim sectorTag As String = ""
        Dim sectorCSSTag As String = ""
        If e.Item.DataItem("sector") = "Oil & Gas" Then
            sectorTag = "Oil & Gas"
            sectorCSSTag = "gmcogtag"
        ElseIf e.Item.DataItem("sector") = "Biogas" Then
            sectorTag = "Biogas"
            sectorCSSTag = "gmcbiogastag"
        ElseIf e.Item.DataItem("sector") = "Coal" Then
            sectorTag = "Coal Mines"
            sectorCSSTag = "gmccoaltag"
        Else
            sectorTag = "Multiple"
            sectorCSSTag = "gmcmultipletag"
        End If
        LitOGResource.Text = "<div Class='Ogslidediv'><a href='" & e.Item.DataItem("resourceLink") & "'><img src='" & e.Item.DataItem("resourceImage") & "' style='float:right;'></a><a href='" & e.Item.DataItem("resourceLink") & "'><h3>" & e.Item.DataItem("TrimmedResourceName") & "</h3></a><br /><p>" & e.Item.DataItem("featuredText") & "</p><br /><a style = 'float:left;' Class='btn btn-primary' href='" & e.Item.DataItem("resourceLink") & "'>Read More...</a></div>"
        resourceOGRepeater.Controls.Add(LitOGResource)

    End Sub

    Sub resourceImageMDataBound(Sender As Object, e As RepeaterItemEventArgs)
        Dim LitImageMResource As New Literal
        LitImageMResource.Text = "<div Class='MIMGslidediv'><img src='" & e.Item.DataItem("resourceImage") & "' /><a href='" & e.Item.DataItem("resourceLink") & "'></a></div>"
        '     resourceImageMRepeater.Controls.Add(LitImageMResource)

    End Sub
    Sub resourceMDataBound(Sender As Object, e As RepeaterItemEventArgs)
        Dim LitMResource As New Literal
        Dim sectorTag As String = ""
        Dim sectorCSSTag As String = ""
        If e.Item.DataItem("sector") = "Oil & Gas" Then
            sectorTag = "Oil & Gas"
            sectorCSSTag = "gmcogtag"
        ElseIf e.Item.DataItem("sector") = "Biogas" Then
            sectorTag = "Biogas"
            sectorCSSTag = "gmcbiogastag"
        ElseIf e.Item.DataItem("sector") = "Coal" Then
            sectorTag = "Coal Mines"
            sectorCSSTag = "gmccoaltag"
        Else
            sectorTag = "Multiple"
            sectorCSSTag = "gmcmultipletag"
        End If
        LitMResource.Text = "<div Class='Mslidediv'><a href='" & e.Item.DataItem("resourceLink") & "'><img src='" & e.Item.DataItem("resourceImage") & "' style='float:right;'></a><a href='" & e.Item.DataItem("resourceLink") & "'><h3>" & e.Item.DataItem("TrimmedResourceName") & "</h3></a><br /><p>" & e.Item.DataItem("featuredText") & "</p><br /><a style = 'float:left;' Class='btn btn-primary' href='" & e.Item.DataItem("resourceLink") & "'>Read More...</a></div>"
        resourceMRepeater.Controls.Add(LitMResource)

    End Sub


    Private Function getDetails(ByVal objID As String) As Boolean
        If IsNothing(objID) Then
            HttpContext.Current.Response.Redirect("partner.aspx?c=brazil")
        Else
            Dim countryname As String = getGeoFocus(objID)
            If countryname = "" Then
                HttpContext.Current.Response.Redirect("partner.aspx?c=brazil")
            End If
            Dim introfilename As String = ""
            introfilename = "partners-intro/" & objID & "-intro.html"
            Dim path = Server.MapPath("./" + introfilename)
            Dim strIntroContent = System.IO.File.ReadAllText(path)


            Dim resourcesfilename As String = ""
            resourcesfilename = "partners-resources/" & objID & "-resources.html"
            path = Server.MapPath("./" + resourcesfilename)
            Dim strResourcesContent = System.IO.File.ReadAllText(path)
            If Len(strResourcesContent) > 50 Then
                '      '      LitResources.Text = strResourcesContent
            End If

            Dim activitiesfilename As String = ""
            activitiesfilename = "partners-activities/" & objID & "-activities.html"
            path = Server.MapPath("./" + activitiesfilename)
            Dim strActivitiesContent = System.IO.File.ReadAllText(path)
            If Len(strActivitiesContent) > 10 Then
                '       '     LitActivities.Text = strActivitiesContent
            End If
            Dim mapfilename As String = ""
            mapfilename = "map/" & objID & "-map.html"
            path = Server.MapPath("./" + mapfilename)
            Dim strMapContent = System.IO.File.ReadAllText(path)
            If Len(strMapContent) > 10 Then
                LitMap.Text = strMapContent
            End If

            Dim countrydataList As New clsSearchDAO()
            Dim countrydataTable As DataTable = Nothing
            countrydataTable = countrydataList.getPartnerInfo(objID)
            Dim html As New StringBuilder()


            If countrydataTable Is Nothing Or countrydataTable.Rows.Count < 1 Then
            Else
                For Each CD As DataRow In countrydataTable.Rows

                    html.Append("Joined GMI in " & CD("year_joined").ToString)


                    html.Append("")


                Next
            datejoined.Controls.Add(New Literal() With {
              .Text = html.ToString()
              })
        End If

            'Dim data As New DAL()
            'Dim dt As DataTable = data.getOrganizationsByCountry(objID)
            'If dt.Rows.Count > 0 Then
            '    'partnerLink.Text = "<li><a href='countryPartners.aspx?country=" & objID & "'>Project Network Members</a></li> <!--LOAD PROJECT NETWORK MEMBERS FOR THIS COUNTRY  -->"
            'End If

            'dt = data.GetActivitiesByCountry(objID)
            'If dt.Rows.Count > 0 Then
            '    'activitiesSearch.Text = "<li><a href='../activities/search.aspx?country=" & objID & "'>Activities in " & countryname & "</a></li> <!--LOAD SEARCH RESULTS FOR THIS COUNTRY  -->"
            'End If
            '  '   LitCountryName.Text = countryname
            ''  LitPageTitle.Text = countryname

            Dim pageURL As String = ""
            pageURL = "country.aspx?c=" & objID
            'litScripts.Text = "<script type='text/javascript' src='/scripts/maps/" & objID & "_map.js'> </script> <!--REPLACE COUNTRY WITH COUNTRY NAME -->"
        End If

        '' getCommittee(objID)
        'getResources(objID)

    End Function


    Private Function GetData() As DataTable
        Dim constr As String = Common.GetConnString()
        Using con As SqlConnection = New SqlConnection(constr)

            'Dim pagenameLookup As String = ""
            'pagenameLookup = getCountryPageName(strCountryName)

            Using cmd As New SqlCommand("

  SELECT distinct top 5 [eventSectors].eventId, convert(varchar(10), startDate,23) as 'Date', name as 'Event Name', events.eventId as 'View Event'

from [events] left join [eventSectors] on [events].eventId = [eventSectors].eventId left join [L_Country] on [events].country = [L_Country].cID where  [L_Country].CountryName = '" & strCountryName & "'
union

select events.eventid, convert(varchar(10), startDate,23) as 'Date', name as 'Event Name',  events.eventId as 'View Event'
from [events] 
where events.eventid = 539
order by 'Date' DESC")

                cmd.CommandType = CommandType.Text
                cmd.Connection = con
                con.Open()
                Using sda As New SqlDataAdapter()
                    cmd.Connection = con
                    sda.SelectCommand = cmd
                    Using dt As New DataTable()
                        sda.Fill(dt)
                        Return dt
                    End Using
                End Using
            End Using
        End Using


    End Function
    Sub crlookupDataBound(Sender As Object, e As RepeaterItemEventArgs)
        Dim crlitNav As New Literal

        'crlitNav.Text = "<h4><a href='../news-events/event_detailsbyID.aspx?eventid='" & e.Item.DataItem("eventId") & "'>" & e.Item.DataItem("name") & "</a></h4><p>" & e.Item.DataItem("startDate") & "<br>"

        Dim DateText As String


        If (e.Item.DataItem("EndDateDay") = e.Item.DataItem("StartDateDay")) Then
            DateText = e.Item.DataItem("StartDateDay") & " " & e.Item.DataItem("EndDateMonth") & " " & e.Item.DataItem("endDateYear")
        Else
            DateText = e.Item.DataItem("StartDateDay") & " - " & e.Item.DataItem("EndDateDay") & " " & e.Item.DataItem("EndDateMonth") & " " & e.Item.DataItem("endDateYear")
        End If

        crlitNav.Text = "<a href='../news-events/event_detailsbyID.aspx?eventid=" & e.Item.DataItem("eventId") & "' target='_blank'><h5>" & e.Item.DataItem("name") & "</h5></a><em>" & DateText & "</em><br>" & e.Item.DataItem("contractedDetails") & "...<hr>"


        crlookupRepeater.Controls.Add(crlitNav)
    End Sub
    Sub lookupDataBound(Sender As Object, e As RepeaterItemEventArgs)
        Dim litNav As New Literal

        If e.Item.DataItem("name").ToString.Contains("Technical") Then
            litNav.Text = "<tr><td>&nbsp;&nbsp;&nbsp;&nbsp;" & e.Item.DataItem("Name") & "</td><td style='text-align:right;'>" & e.Item.DataItem("CountOfDelegates") & "</td></tr>"
        Else
            litNav.Text = "<tr><td>" & e.Item.DataItem("Name") & "</td><td style='text-align:right;'>" & e.Item.DataItem("CountOfDelegates") & "</td></tr>"
        End If

        lookupRepeater.Controls.Add(litNav)
    End Sub

    Private Function GetOverview(ByVal objID As String) As DataTable
        Dim constr As String = Common.GetConnString()
        Using con As SqlConnection = New SqlConnection(constr)


            Using cmd As New SqlCommand("

SELECT *
FROM
(
    SELECT [sector] as 'Sector',
           [year],
           [value]
    FROM countryData where html_safe_countryname = '" & objID & "'
) AS SourceTable PIVOT(SUM([value]) FOR [year] IN([2020],
                                                         [2035],
                                                         [2050])) AS PivotTable;

")
                cmd.CommandType = CommandType.Text
                cmd.Connection = con
                con.Open()
                Using sda As New SqlDataAdapter()
                    cmd.Connection = con
                    sda.SelectCommand = cmd
                    Using dt As New DataTable()
                        sda.Fill(dt)
                        Return dt
                    End Using
                End Using
            End Using
        End Using


    End Function


    <WebMethod()>
    Public Shared Function GetaChartData() As List(Of Object)
        Dim query As String = "select year, category,  sum(value) as 'combinedValue' "
        query += " from countryData where sector = 'biogas' group by year, category order by year asc"
        Dim constr As String = Common.GetConnString()
        Dim chartData As New List(Of Object)()
        chartData.Add(New Object() {"year", "category", "Combined Value"})
        Using con As New SqlConnection(constr)
            Using cmd As New SqlCommand(query)
                cmd.CommandType = CommandType.Text
                cmd.Connection = con
                con.Open()
                Using sdr As SqlDataReader = cmd.ExecuteReader()
                    While sdr.Read()
                        chartData.Add(New Object() {sdr("year"), sdr("category"), sdr("Combined Value")})
                    End While
                End Using
                con.Close()
                Return chartData
            End Using
        End Using
    End Function


    <WebMethod()>
    Public Shared Function GetChartData() As List(Of Object)
        'Fetch the Statistical data from database.

        Dim pagenamelookup As String = ""
        pagenamelookup = getCountryPageName(strCountryName)
        Dim query As String = "select year, sector,  sum(value) as 'combinedValue' from countryData where html_safe_countryname = '" & pagenamelookup & "' group by year, sector order by year asc, sector"
        Dim dt As DataTable = GetData(query)

        'Get the DISTINCT Countries.
        Dim chartData As List(Of Object) = New List(Of Object)()
        Dim countries As List(Of String) = (From p In dt.AsEnumerable() Select p.Field(Of String)("sector")).Distinct().ToList()

        'Insert Label for Country in First position.
        countries.Insert(0, "sector")

        'Add the Countries Array to the Chart Array.
        chartData.Add(countries.ToArray())

        'Get the DISTINCT Years.
        Dim years As List(Of Integer) = (From p In dt.AsEnumerable() Select p.Field(Of Integer)("year")).Distinct().ToList()

        'Loop through the Years.
        For Each year As Integer In years
            'Get the Total of Orders for each Country for the Year.
            Dim totals As List(Of Object) = (From p In dt.AsEnumerable() Where p.Field(Of Integer)("year") = year
                                             Select p.Field(Of Double)("combinedValue")).Cast(Of Object)().ToList()

            'Insert the Year value as Label in First position.
            totals.Insert(0, year.ToString())

            'Add the Years Array to the Chart Array.
            chartData.Add(totals.ToArray())
        Next
        Return chartData
    End Function

    <WebMethod()>
    Public Shared Function GetCoalChartData() As List(Of Object)

        Dim pagenamelookup As String = ""
        pagenamelookup = getCountryPageName(strCountryName)
        'Fetch the Statistical data from database.
        Dim query As String = "select year, category,  sum(value) as 'combinedValue' from countryData where sector = 'coal mines' and html_safe_countryname = '" & pagenamelookup & "' group by year, category order by year asc, category"
        Dim dt As DataTable = GetData(query)

        'Get the DISTINCT Countries.
        Dim chartData As List(Of Object) = New List(Of Object)()
        Dim countries As List(Of String) = (From p In dt.AsEnumerable() Select p.Field(Of String)("category")).Distinct().ToList()

        'Insert Label for Country in First position.
        countries.Insert(0, "category")

        'Add the Countries Array to the Chart Array.
        chartData.Add(countries.ToArray())

        'Get the DISTINCT Years.
        Dim years As List(Of Integer) = (From p In dt.AsEnumerable() Select p.Field(Of Integer)("year")).Distinct().ToList()

        'Loop through the Years.
        For Each year As Integer In years
            'Get the Total of Orders for each Country for the Year.
            Dim totals As List(Of Object) = (From p In dt.AsEnumerable() Where p.Field(Of Integer)("year") = year
                                             Select p.Field(Of Double)("combinedValue")).Cast(Of Object)().ToList()

            'Insert the Year value as Label in First position.
            totals.Insert(0, year.ToString())

            'Add the Years Array to the Chart Array.
            chartData.Add(totals.ToArray())
        Next
        Return chartData
    End Function


    <WebMethod()>
    Public Shared Function GetBioChartData() As List(Of Object)

        Dim pagenamelookup As String = ""
        pagenamelookup = getCountryPageName(strCountryName)
        'Fetch the Statistical data from database.
        Dim query As String = "select year, category,  sum(value) as 'combinedValue' from countryData where sector = 'biogas' and html_safe_countryname = '" & pagenamelookup & "' group by year, category order by year asc, category"
        Dim dt As DataTable = GetData(query)

        'Get the DISTINCT Countries.
        Dim chartData As List(Of Object) = New List(Of Object)()
        Dim countries As List(Of String) = (From p In dt.AsEnumerable() Select p.Field(Of String)("category")).Distinct().ToList()

        'Insert Label for Country in First position.
        countries.Insert(0, "category")

        'Add the Countries Array to the Chart Array.
        chartData.Add(countries.ToArray())

        'Get the DISTINCT Years.
        Dim years As List(Of Integer) = (From p In dt.AsEnumerable() Select p.Field(Of Integer)("year")).Distinct().ToList()

        'Loop through the Years.
        For Each year As Integer In years
            'Get the Total of Orders for each Country for the Year.
            Dim totals As List(Of Object) = (From p In dt.AsEnumerable() Where p.Field(Of Integer)("year") = year
                                             Select p.Field(Of Double)("combinedValue")).Cast(Of Object)().ToList()

            'Insert the Year value as Label in First position.
            totals.Insert(0, year.ToString())

            'Add the Years Array to the Chart Array.
            chartData.Add(totals.ToArray())
        Next
        Return chartData
    End Function


    <WebMethod()>
    Public Shared Function GetOilChartData() As List(Of Object)
        'Fetch the Statistical data from database.

        Dim pagenamelookup As String = ""
        pagenamelookup = getCountryPageName(strCountryName)
        Dim query As String = "select year, category,  sum(value) as 'combinedValue' from countryData where sector = 'oil & gas' and html_safe_countryname = '" & pagenamelookup & "' group by year, category order by year asc, category"
        Dim dt As DataTable = GetData(query)

        'Get the DISTINCT Countries.
        Dim chartData As List(Of Object) = New List(Of Object)()
        Dim countries As List(Of String) = (From p In dt.AsEnumerable() Select p.Field(Of String)("category")).Distinct().ToList()

        'Insert Label for Country in First position.
        countries.Insert(0, "category")

        'Add the Countries Array to the Chart Array.
        chartData.Add(countries.ToArray())

        'Get the DISTINCT Years.
        Dim years As List(Of Integer) = (From p In dt.AsEnumerable() Select p.Field(Of Integer)("year")).Distinct().ToList()

        'Loop through the Years.
        For Each year As Integer In years
            'Get the Total of Orders for each Country for the Year.
            Dim totals As List(Of Object) = (From p In dt.AsEnumerable() Where p.Field(Of Integer)("year") = year
                                             Select p.Field(Of Double)("combinedValue")).Cast(Of Object)().ToList()

            'Insert the Year value as Label in First position.
            totals.Insert(0, year.ToString())

            'Add the Years Array to the Chart Array.
            chartData.Add(totals.ToArray())
        Next
        Return chartData
    End Function



    Private Shared Function GetData(ByVal query As String) As DataTable
        Dim constr As String = Common.GetConnString()
        Using con As SqlConnection = New SqlConnection(constr)
            Using sda As SqlDataAdapter = New SqlDataAdapter(query, con)
                Dim dt As DataTable = New DataTable()
                sda.Fill(dt)
                Return dt
            End Using
        End Using
    End Function

    Sub CalendarNavDataBound(Sender As Object, e As RepeaterItemEventArgs)
        Dim litNav As New Literal
        Dim DateText As String


        If (e.Item.DataItem("EndDateDay") = e.Item.DataItem("StartDateDay")) Then
            DateText = e.Item.DataItem("StartDateDay") & " " & e.Item.DataItem("EndDateMonth")
        Else
            DateText = e.Item.DataItem("StartDateDay") & " - " & e.Item.DataItem("EndDateDay") & " " & e.Item.DataItem("EndDateMonth")
        End If


        litNav.Text = "<li class='eventhide navevent'><a href='https://www.globalmethane.org/news-events/event_detailsbyID.aspx?eventid=" & e.Item.DataItem("eventId") & "' target='_blank'>" & e.Item.DataItem("name") & "</a><div class='eventDetails'><strong><em>" & DateText & "</em></strong><br>" & e.Item.DataItem("contractedDetails") & "...</div></li>"

        navRepeater.Controls.Add(litNav)
    End Sub

    Sub CalendarNavSubDataBound(Sender As Object, e As RepeaterItemEventArgs)
        Dim litSubNav As New Literal
        Dim DateText As String


        If (e.Item.DataItem("EndDateDay") = e.Item.DataItem("StartDateDay")) Then
            DateText = e.Item.DataItem("StartDateDay") & " " & e.Item.DataItem("EndDateMonth")
        Else
            DateText = e.Item.DataItem("StartDateDay") & " - " & e.Item.DataItem("EndDateDay") & " " & e.Item.DataItem("EndDateMonth")
        End If


        litSubNav.Text = "<li class='subeventhide navevent'><a href='https://www.globalmethane.org/news-events/event_detailsbyID.aspx?eventid=" & e.Item.DataItem("eventId") & "' target='_blank'>" & e.Item.DataItem("name") & "</a><div class='eventDetails'><strong><em>" & DateText & "</em></strong><br>" & e.Item.DataItem("contractedDetails") & "...</div></li>"

        navSubRepeater.Controls.Add(litSubNav)
    End Sub


End Class