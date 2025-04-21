Imports System.Data
Imports System.Text
Imports System.Configuration
Imports System.Web.Services
Imports System.Web.Script.Services
Imports System.Data.SqlClient
Public Class countries
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim data As New clsSearchDAO()
        Dim eventData As New clsEventDAO()
        Dim featureResource As DataTable = Nothing
        Dim featureResourceImage As DataTable = Nothing

        Dim FeatLookup As String = "International"


        Me.BindGrid()

        featureResource = data.GetFeaturedBResourceByCountryMain(FeatLookup)

        If featureResource Is Nothing Or featureResource.Rows.Count < 1 Then

        Else
            resourceBRepeater.DataSource = featureResource
            resourceBRepeater.DataBind()
        End If



        'Coal

        featureResource = data.GetFeaturedCResourceByCountryMain(FeatLookup)

        If featureResource Is Nothing Or featureResource.Rows.Count < 1 Then

        Else
            resourceCRepeater.DataSource = featureResource
            resourceCRepeater.DataBind()
        End If

        featureResourceImage = Data.GetFeaturedCResourceImageByCountry(FeatLookup)


        'If featureResourceImage Is Nothing Or featureResourceImage.Rows.Count < 1 Then

        'Else
        '    resourceImageCRepeater.DataSource = featureResourceImage
        '    resourceImageCRepeater.DataBind()
        'End If


        'Oil

        featureResource = data.GetFeaturedOGResourceByCountryMain(FeatLookup)

        If featureResource Is Nothing Or featureResource.Rows.Count < 1 Then

        Else
            resourceOGRepeater.DataSource = featureResource
            resourceOGRepeater.DataBind()
        End If



        'Multi

        featureResource = data.GetFeaturedMResourceByCountryMain(FeatLookup)

        If featureResource Is Nothing Or featureResource.Rows.Count < 1 Then

        Else
            resourceMRepeater.DataSource = featureResource
            resourceMRepeater.DataBind()
        End If


    End Sub

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
        Dim query As String = "select year, sector,  sum(value) as 'combinedValue' from countryData group by year, sector order by year asc, sector"
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
        'Fetch the Statistical data from database.
        Dim query As String = "select year, category,  sum(value) as 'combinedValue' from countryData where sector = 'coal mines' group by year, category order by year asc, category"
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
        'Fetch the Statistical data from database.
        Dim query As String = "select year, category,  sum(value) as 'combinedValue' from countryData where sector = 'biogas' group by year, category order by year asc, category"
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
        Dim query As String = "select year, category,  sum(value) as 'combinedValue' from countryData where sector = 'oil & gas' group by year, category order by year asc, category"
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

    Sub resourceMDataBound(Sender As Object, e As RepeaterItemEventArgs)
        Dim LitMResource As New Literal
        Dim sectorTag As String = ""
        Dim sectorCSSTag As String = ""

        LitMResource.Text = "<div Class='Mslidediv'><a href='" & e.Item.DataItem("resourceLink") & "'><img src='" & e.Item.DataItem("resourceImage") & "' style='float:right;'></a><a href='" & e.Item.DataItem("resourceLink") & "'><h3>" & e.Item.DataItem("TrimmedResourceName") & "</h3></a><br /><p>" & e.Item.DataItem("featuredText") & "</p><br /><a style = 'float:left;' Class='btn btn-primary' href='" & e.Item.DataItem("resourceLink") & "'>Read More...</a></div>"
        resourceMRepeater.Controls.Add(LitMResource)

    End Sub

    Private Sub BindGrid(Optional ByVal direction As String = "", Optional ByVal sortExpression As String = "")

        Dim countrydataList As New clsSearchDAO()
        Dim countrydataTable As DataTable = Nothing
        countrydataTable = countrydataList.getPartnerList()
        Dim html As New StringBuilder()
        html.Append("<p>")
        Dim countrycount As Integer = 1
        Dim pagenamelookup As String = ""
        Dim countrynameabbr As String = ""
        If countrydataTable Is Nothing Or countrydataTable.Rows.Count < 1 Then
        Else
            For Each CD As DataRow In countrydataTable.Rows
                countrycount = countrycount + 1

                countrynameabbr = getCountryAbbrName(CD("Name").ToString)
                pagenamelookup = getCountryPageName(CD("name").ToString)
                html.Append("<a href='/partners/detail.aspx?c=" & pagenamelookup & "'> ")

                html.Append("<img src='/images/flag_" & countrynameabbr & ".gif'> ")
                html.Append(CD("name").ToString & " (" & CD("year_joined").ToString & ")")
                html.Append(" </a></br>")

                If countrycount = 13 Or countrycount = 24 Or countrycount = 35 Then
                    html.Append("</p></div><div class='col-sm-3'><p>")
                End If

            Next
            html.Append("</p></div>")
            countryList.Controls.Add(New Literal() With {
              .Text = html.ToString()
              })
        End If

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