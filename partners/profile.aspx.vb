Imports System.Data
Imports System.Text
Imports System.Configuration
Imports System.Web.Services
Imports System.Web.Script.Services
Imports System.Data.SqlClient
Imports System.Drawing

Partial Class profile
    Inherits System.Web.UI.Page
    Public Shared strCountryName As String = ""
    Public Shared strCountryFlag As String = ""
    Public Shared strBanner As String = ""
    Public Shared objid As String = ""
    Public Shared metaImage As String = ""
    Public Shared metaTitle As String = ""
    Public Shared newTitle As String = ""
    Public Shared pagenamelookup As String = ""

    ' Define a dictionary to map specific country names to banner filenames.
    Private Shared BannerMappings As New Dictionary(Of String, String) From {
        {"ph", "philippines"},  ' "ph" in URL maps to "philippines.png"
        {"fi", "finland"}       ' Additional mappings as needed
    }

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        objid = Server.HtmlEncode(Request.QueryString("c"))
        If objid = "" Then
            HttpContext.Current.Response.Redirect("profile.aspx?c=republicofnorthmacedonia")
            objid = Server.HtmlEncode(Request.QueryString("c"))
        End If
        strCountryName = getGeoFocus(objid)
        strCountryFlag = "flag_" & objid & ".gif"
        strBanner = objid & ".png"

        getDetails(objid)

        Dim dt As DataTable = New DataTable()
        dt.Columns.AddRange(New DataColumn(1) {New DataColumn("Property", GetType(String)), New DataColumn("Content", GetType(String))})
        dt.Rows.Add("og:title", strCountryName + " | Partner Country | Global Methane Initiative ")
        dt.Rows.Add("og:image", "https://www.globalmethane.org/partners/images/flags/" + objid + ".png")
        dt.Rows.Add("og:site_name", "https://www.globalmethane.org/")
        dt.Rows.Add("og:description", "The Global Methane Initiative (GMI) is an international public-private partnership focused on reducing barriers to the recovery and use of methane as a clean energy source.")

        For Each row As DataRow In dt.Rows
            Dim htmlMeta As HtmlMeta = New HtmlMeta()
            htmlMeta.Attributes.Add("property", row("Property").ToString())
            htmlMeta.Content = row("Content").ToString()
            Me.Page.Header.Controls.Add(htmlMeta)
        Next

        If String.Equals(strCountryName, "Dominicanrepublic", StringComparison.OrdinalIgnoreCase) Then
            strCountryName = "Dominican Republic"
        End If
        If String.Equals(strCountryName, "republicofkorea", StringComparison.OrdinalIgnoreCase) Then
            strCountryName = "Republic of Korea"
        End If
        If String.Equals(strCountryName, "republicofnorthmacedonia", StringComparison.OrdinalIgnoreCase) Then
            strCountryName = "Republic of North Macedonia"
        End If
        If String.Equals(strCountryName, "srilanka", StringComparison.OrdinalIgnoreCase) Then
            strCountryName = "Sri Lanka"
        End If
        If String.Equals(strCountryName, "unitedkingdom", StringComparison.OrdinalIgnoreCase) Then
            strCountryName = "United Kingdom"
        End If
        If String.Equals(strCountryName, "saudiarabia", StringComparison.OrdinalIgnoreCase) Then
            strCountryName = "Saudi Arabia"
        End If
        If String.Equals(strCountryName, "unitedstates", StringComparison.OrdinalIgnoreCase) Then
            strCountryName = "The United States"
        End If

        Page.Title = strCountryName + " | Partner Country | Global Methane Initiative "

        ' Use "Finland" as the default value if no country parameter is provided (for testing)
        Dim countryName As String = If(String.IsNullOrEmpty(Request.QueryString("c")), "Finland", Request.QueryString("c"))

        ' Set base path relative to the partner directory
        Dim basePath As String = Server.MapPath("~/partners/include/")

        ' Load each section HTML content into corresponding literals
        litIntroduction.Text = LoadHtmlContent(basePath, "1_Introduction", countryName)
        litMethaneEmissionsSummary.Text = LoadHtmlContent(basePath, "2_MethaneEmissionSummary", countryName)
        litMethaneCommitmentsPlans.Text = LoadHtmlContent(basePath, "3_MethaneCommitmentsandPlans", countryName)
        litMethaneActions.Text = LoadHtmlContent(basePath, "4_MethaneActions", countryName)
        litMinistriesAgencies.Text = LoadHtmlContent(basePath, "5_MinistriesAndAgenciesSupportingMethaneActions", countryName)
        'litGMIDelegates.Text = LoadHtmlContent(basePath, "6_GMIDelegates", countryName)
        updated.Text = LoadHtmlContent(basePath, "7_Updated", countryName)

        ' Determine the banner image filename based on the dictionary
        If BannerMappings.ContainsKey(countryName) Then
            strBanner = BannerMappings(countryName) & ".png"
        Else
            strBanner = countryName & ".png"
        End If

        DisplayCountryDelegates()



    End Sub
    ' Function to load HTML content from specified section and country folder
    Private Function LoadHtmlContent(basePath As String, section As String, country As String) As String
        ' Construct file path according to directory structure within the partner directory
        Dim filePath As String = $"{basePath}{section}/{country}/final.html"

        ' Check if file exists before reading to avoid errors
        If System.IO.File.Exists(filePath) Then
            Return System.IO.File.ReadAllText(filePath)
        End If

        ' Return empty string if file does not exist
        Return String.Empty



    End Function



    Private Sub DisplayCountryDelegates()


        Dim country As String = Request.QueryString("c")
        Dim data As New DAL()
        Dim dt As DataTable = data.GetDelegatesByCountry(country)

        Dim committeeOrder As String() = {"Biogas Subcommittee", "Agriculture Technical Group", "MSW Technical Group", "Wastewater Technical Group",
                                  "Coal Subcommittee", "Oil & Gas Subcommittee", "Steering Committee"}


        Dim countryNameMap As New Dictionary(Of String, String)(StringComparer.OrdinalIgnoreCase) From {
        {"philippines", "The Philippines"},
        {"unitedstates", "The United States"},
        {"southkorea", "South Korea"},
        {"cotedivoire", "Cote d'Ivoire"},
        {"republicofnorthmacedonia", "Republic of North Macedonia"},
        {"unitedkingdom", "United Kingdom"},
        {"dominicanrepublic", "Dominican Republic"},
        {"republicofkorea", "Republic of Korea"}}
        ' Add other mappings as needed

        Dim displayCountry As String
        If countryNameMap.ContainsKey(country) Then
            displayCountry = countryNameMap(country)
        Else
            displayCountry = Char.ToUpper(country(0)) & country.Substring(1)
        End If


        ' Start building the table HTML with Bootstrap classes
        Dim myText As String = "<table class='table table-bordered'><thead><tr><th>Committee/Subcommittee</th><th>Delegate Name</th><th>Affiliation</th></tr></thead><tbody>"

        If dt IsNot Nothing AndAlso dt.Rows.Count > 0 Then
            ' Loop through each delegate and create table rows
            For Each row As DataRow In dt.Rows
                Dim committee As String = row("committeeName").ToString()
                Dim delegateName As String = row("Contact_Name").ToString()
                Dim email As String = row("Email").ToString()
                Dim affiliation As String = row("contact_organization").ToString()

                myText += "<tr>"
                myText += "<td>" & committee & "</td>"
                myText += "<td><a href='mailto:" & email & "'>" & delegateName & "</a></td>"
                myText += "<td>" & affiliation & "</td>"
                myText += "</tr>"
            Next

            myText += "</tbody></table>"
        Else
            ' If no delegates found, display the no-delegates message
            myText = String.Format("{0} does not currently have an active delegate in GMI. If you represent a ministry, national, or municipal agency and are interested in becoming a delegate to one of the technical Subcommittees, please contact the GMI Secretariat at <a href='mailto:secretariat@globalmethane.org'>secretariat@globalmethane.org</a>.", displayCountry)
        End If

        ' Add the table or message to the placeholder control
        Dim myLabel As New Label()
        myLabel.Text = myText
        phDelegatesTable.Controls.Add(myLabel)
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

    Private Function getDetails(ByVal objid As String)
        'get map information



        Dim countrydataList As New clsSearchDAO()
        Dim countrydataTable As DataTable = Nothing
        countrydataTable = countrydataList.GetPartnerInfo(objid)
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

        'Populating a DataTable from database.
        Dim dt As DataTable = Nothing
        dt = clsCountryDAO.getOverview(objid)
        html.Clear()
        'Table start.
        html.Append("<table id='myTable' class='table'>")
        'Building the Header row.
        html.Append("<thead><tr>")
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
                html.Append("<td>")
                If Len(row(column.ColumnName)) > 4 Then
                    html.Append(row(column.ColumnName))
                Else
                    html.Append(row(column.ColumnName))
                End If

                html.Append("</td>")
            Next
            html.Append("</tr>")
        Next
        html.Append("</tbody>")
        'Table end.
        html.Append("</table>")
        'Append the HTML string to Placeholder.
        PlaceHolder1.Controls.Add(New Literal() With {
      .Text = html.ToString()
    })

        Dim data As New clsSearchDAO()
        Dim commitList2 As DataTable = Nothing
        commitList2 = data.GetCountryDelegates(objid)

        If IsNothing(commitList2) Then
            'delInfo.Visible = False
            delMsg.Text = getGeoFocus(objid) & " does not currently have any delegates. To find out more about becoming a delegate, please email <a href='mailto:secretariat@globalmethane.org?subject=becoming a GMI delegate'>secretariat@globalmethane.org</a>."
            delMsg.Visible = True

        Else
            lookupRepeater.DataSource = commitList2
            lookupRepeater.DataBind()
        End If

    End Function

    Friend Function ShowEvents(dt As DataTable) As String
        Dim eventId As String
        Dim startDateValue As String
        Dim endDateValue As String
        Dim nameValue As String
        Dim phString As String = ""
        Dim detailsValue As String
        Dim endTitle As String
        endTitle = ""
        Dim x

        For x = 0 To dt.Rows.Count - 1
            Dim startdate = dt.Rows(x)("startDate")
            Dim locationString = dt.Rows(x)("city")
            eventId = dt.Rows(x)("eventId")
            nameValue = dt.Rows(x)("name")
            nameValue = dt.Rows(x)("name")
            Dim namevaltext As String = ""
            namevaltext = "<h3><a href=""/events/details.aspx?eventid=" & eventId & """ alt=""Event details"">" & nameValue & "</a></h3>"
            startDateValue = Common.getDateFormatDisplay(dt.Rows(x)("startDate"))
            endDateValue = Common.getDateFormatDisplay(dt.Rows(x)("endDate"))
            detailsValue = "" & Left(replaceHTMLTags(dt.Rows(x)("details")), 300) & "..." & Chr(10)
            phString += namevaltext

            Dim datestring As String = ""
            Dim thisstartdate = dt.Rows(x)("startDate")
            Dim thisenddate = dt.Rows(x)("endDate")

            datestring = "<em>" & Day(thisstartdate) 'Common.getDateFormatDisplay(eventObj.getStartDate())
            If Month(thisstartdate).ToString <> Month(thisenddate).ToString Then
                datestring += " " & Format(CDate(thisstartdate), "MMMM")
            End If
            If Day(thisenddate) <> Day(thisstartdate) Then
                datestring += "&ndash;" & Day(thisenddate)
            End If
            datestring += " " & Format(CDate(thisenddate), "MMMM yyyy")
            datestring += ", " & locationString & "</em><br />" & Chr(10)
            phString += datestring

            phString += detailsValue & "<hr /><br />"
        Next

        If (dt.Rows.Count > 0) Then
            'CatchMsg += "; no rows"
        End If

        Return phString
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
        pagenamelookup = getCountryPageName(strCountryName)
        Dim dt As DataTable = Nothing
        dt = clsCountryDAO.getCountryERdata(pagenamelookup)

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
        Dim dt As DataTable = Nothing
        dt = clsCountryDAO.getCountryCoalERdata(pagenamelookup)

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
        Dim dt As DataTable = Nothing
        dt = clsCountryDAO.getCountryBiogasERdata(pagenamelookup)

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
        Dim dt As DataTable = Nothing
        dt = clsCountryDAO.getCountryOilERdata(pagenamelookup)

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

End Class
