
Imports System.Data
Imports System.Data.SqlClient

Partial Class events_details
    Inherits System.Web.UI.Page
    Dim CookieValue As String
    Public Shared metaImage As String = ""
    Public Shared metaTitle As String = ""
    Public Shared newTitle As String = ""




    'placeholder:  eventhead

    '    <div Class="col-sm-3">
    '					<a href = "https://globalmethane.org/documents/Market%20Opportunities%20for%20AD%20in%20India.pdf" <> img src="/assets/images/doc_thumbs/jpeg/cover.PNG" style="width:100%;" /></a>
    '				</div>
    '				<div Class="col-sm-9">
    '                    <h1>
    '            Market Opportunities For Anaerobic Digestion Of Livestock And Agro-Industrial Wastes In India 
    '                    </h1>
    '					<p> <a role = "button" Class="btn btn-primary" href="https://globalmethane.org/documents/Market%20Opportunities%20for%20AD%20in%20India.pdf">View</a></p>
    '				</div>









    Private Sub Page_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        'Put user code to initialize the page here
        Dim eventid As Integer
        eventid = Server.HtmlEncode(Request.QueryString("eventId"))

        If Len(Server.HtmlEncode(Request.QueryString("stage"))) > 0 Then
            Response.Redirect("/gmi-admin/stageeventdetails.aspx?eventid=" & eventid)
            Response.End()
        End If
        If Not IsNumeric(eventId) Then
            eventId = 466
        End If

        ShowEventDetails(eventid)

        Dim dt As DataTable = New DataTable()
        dt.Columns.AddRange(New DataColumn(1) {New DataColumn("Property", GetType(String)), New DataColumn("Content", GetType(String))})
        dt.Rows.Add("og:title", metaTitle + " | Global Methane Initiative ")
        dt.Rows.Add("og:image", "https://www.globalmethane.org/assets/images/" + metaImage)
        dt.Rows.Add("og:site_name", "https://www.globalmethane.org/")
        dt.Rows.Add("og:description", "The Global Methane Initiative (GMI) is an international public-private partnership focused on reducing barriers to the recovery and use of methane as a clean energy source.")

        For Each row As DataRow In dt.Rows
            Dim htmlMeta As HtmlMeta = New HtmlMeta()
            htmlMeta.Attributes.Add("property", row("Property").ToString())
            htmlMeta.Content = row("Content").ToString()
            Me.Page.Header.Controls.Add(htmlMeta)
        Next

        Page.Title = newTitle

        InsertTrackingData(eventid)

    End Sub



    Private Sub InsertTrackingData(ByVal eventid As Integer)

        Dim decodedResourceName As String = HttpUtility.HtmlDecode(metaTitle)
        Dim connString As String = Common.GetConnString()

        Using conn As New SqlConnection(connString)
            conn.Open()

            ' Prepare SQL Insert Command
            Dim insertSql As String = "INSERT INTO trackEventResource (trackType, lookupID, name, logMoment) VALUES (@trackType, @lookupID, @name, @logMoment)"
            Using cmd As New SqlCommand(insertSql, conn)
                cmd.Parameters.AddWithValue("@trackType", "event")
                cmd.Parameters.AddWithValue("@lookupID", eventid)
                cmd.Parameters.AddWithValue("@name", decodedResourceName)

                ' Set current datetime in Eastern Time Zone
                Dim easternZone As TimeZoneInfo = TimeZoneInfo.FindSystemTimeZoneById("Eastern Standard Time")
                Dim easternTime As DateTime = TimeZoneInfo.ConvertTimeFromUtc(DateTime.UtcNow, easternZone)
                cmd.Parameters.AddWithValue("@logMoment", easternTime)

                ' Execute the insert command
                cmd.ExecuteNonQuery()
            End Using
        End Using
    End Sub

    Protected Sub ShowEventDetails(ByVal eventid As Integer)
        Dim eventObj As clsEventVO
        eventObj = clsEventDAO.GetEventByEventId(eventid)

        If IsNothing(eventObj) Then
            Response.Redirect("/events/index.aspx")

        End If
        Dim eventStatus As String = eventObj.getEventStatus()
        If Not String.IsNullOrEmpty(eventStatus) AndAlso eventStatus.ToLower() = "draft" Then
            Dim draftAlert As New Literal()
            draftAlert.Text = "<div class='alert alert-warning' role='alert'>" &
                          "<strong>Note:</strong> This event is currently in draft status." &
                          "</div>"
            phDraftAlert.Controls.Add(draftAlert)
        End If


        Dim enddate As String = ""
        If eventObj.getStartDate <> eventObj.getEndDate Then
            enddate = Day(eventObj.getEndDate)
        End If

        If Not IsPostBack Then



            Dim myLabel As Literal
            myLabel = New Literal


            'get country desc 
            Dim countryName As String
            'countryName = clsLookup.GetPartnerCountryNameByPcId(eventObj.getCountry)
            countryName = clsLookup.GetCountryNameByCId(eventObj.getCountry)

            'get sector desc 
            Dim sectDescStr As String = ""
            Dim firstsector As String = ""
            Dim sectors As DataTable
            sectors = clsEventDAO.getEventSectorsByEventId(eventid)
            Dim x
            For x = 0 To sectors.Rows.Count - 1
                Dim desc As String
                desc = sectors.Rows(x)("sectorDesc")

                If desc = "MSW" Then
                    desc = "Municipal Solid Waste"
                End If

                If x = 0 Then
                    sectDescStr = desc
                    firstsector = desc
                Else
                    sectDescStr = sectDescStr & ", " & desc
                End If
            Next
            'ShowRelatedEvents(eventid, firstsector)


            'Dim calDayData As String
            'Dim calDayDetail As String
            'Dim calDayClose As String

            Dim dateTitle As String
            Dim nameTitle As String
            Dim locationTitle As String
            Dim sectorTitle As String
            Dim contactTitle As String
            Dim organizerTitle As String
            Dim detailsTitle As String
            Dim endTitle As String



            'calDayData = "<div id=""calBig"" class=""eventdetail""><div class=""calDayData"">"
            'calDayDetail = "<div class=""calDayDetail"">"
            dateTitle = "<th Class='text-right'>Date</th><td>"
            nameTitle = ""
            locationTitle = "<th Class='text-right'>Location: </th><td>"
            sectorTitle = "<th Class='text-right'>Industry Sector: </th><td>"
            organizerTitle = "<th Class='text-right'>Organizer: </th><td>"
            contactTitle = "<th Class='text-right'>Contact: </th><td>"
            detailsTitle = ""
            endTitle = "</td></tr>"


            '// feature image
            Dim fileUrl As String = ""
            Try
                Dim curFile As String = Server.MapPath(eventObj.getphoto_url)
                Dim curfileAlt As String = Server.MapPath("/assets/images/" & eventObj.getphoto_url)
                Dim curfileAlt2 As String = Server.MapPath("/images/" & eventObj.getphoto_url)
                If System.IO.File.Exists(curFile) = True Then
                    fileUrl = "<img src=""" + eventObj.getphoto_url + """ alt='" + firstsector + "' style='width:100%' title='Featured Image for " + eventObj.getName + "'  />"

                ElseIf System.IO.File.Exists(curfileAlt) = True Then
                    fileUrl = "<img src=""/assets/images/" + eventObj.getphoto_url + """ style='width:100%'  alt='" + firstsector + "' title='Featured Image for " + eventObj.getName + "'/>"
                ElseIf System.IO.File.Exists(curfileAlt2) = True Then
                    fileUrl = "<img src=""/assets/images/" + eventObj.getphoto_url + """ style='width:100%'  alt='" + firstsector + "' title='Featured Image for " + eventObj.getName + "'/>"

                Else
                    Dim n As Integer = GetRandom(0, 4)

                    fileUrl = "<img src=""/assets/images/event_feature_" + getSectorEventURL(firstsector) + n.ToString + ".JPG"" style='width:100%' alt='" + firstsector + "' title='Featured Image for " + eventObj.getName + "'  />"

                End If
            Catch

                fileUrl = "<img src=""" + eventObj.getphoto_url + """ style='width:100%' alt='" + firstsector + "' title='Featured Image for " + eventObj.getName + "' />"



            End Try

            myLabel = New Literal
            myLabel.Text = "<div Class='col-sm-5'>"
            myLabel.Text += fileUrl & "</div>" & Chr(10)
            myLabel.Text += "<div Class='col-sm-7'>"
            myLabel.Text += "<h1>" & eventObj.getName & "</h1>" & Chr(10) & "</div>" & Chr(10)
            pheventhead.Controls.Add(myLabel)



            myLabel = New Literal
            Dim datestring As String = ""
            Dim thisstartdate = eventObj.getStartDate()
            Dim thisenddate = eventObj.getEndDate
            datestring = Day(thisstartdate) 'Common.getDateFormatDisplay(eventObj.getStartDate())
            If Month(thisstartdate).ToString <> Month(thisenddate).ToString Then
                datestring += " " & Format(CDate(thisstartdate), "MMMM")
            End If
            If enddate <> "" Then
                datestring += "&ndash;" & enddate
            End If
            datestring += " " & Format(CDate(thisenddate), "MMMM yyyy")

            myLabel.Text = dateTitle & datestring & "</td></tr>"
            pheventsummary.Controls.Add(myLabel)



            'LitLastBreadcrumb.Text = eventObj.getName()



            myLabel = New Literal
            If (countryName.Equals("N/A")) Then 'Ignore country name if selection equals N/A
                myLabel.Text = locationTitle & eventObj.getCity()
                If Len(eventObj.getState().ToString) > 0 Then
                    myLabel.Text = myLabel.Text & ", " & eventObj.getState()
                End If
                myLabel.Text = myLabel.Text & endTitle
            Else
                myLabel.Text = locationTitle & eventObj.getCity()
                If Len(eventObj.getState().ToString) > 0 Then
                    myLabel.Text = myLabel.Text & ", " & eventObj.getState()
                End If
                myLabel.Text = myLabel.Text & ", " & countryName & endTitle
            End If

            pheventsummary.Controls.Add(myLabel)

            Dim eventOrganizer As String = eventObj.getorganizer
            Dim organizerUrl As String = eventObj.getorganizer_url

            myLabel = New Literal
            If eventOrganizer <> "" Then
                myLabel.Text = organizerTitle & eventOrganizer
                If organizerUrl <> "" Then
                    myLabel.Text += "</br>" & "<a href='" & organizerUrl & "' title='" & eventOrganizer & "'/>" & organizerUrl & "</a>" & endTitle
                Else
                    myLabel.Text += endTitle
                End If
            Else
                If organizerUrl <> "" Then
                    myLabel.Text = organizerTitle & "<a href='" & organizerUrl & "' title='" & eventOrganizer & "'/>" & organizerUrl & "</a>" & endTitle
                End If
            End If





            Dim eventPOC As String = eventObj.getpoc_name
            Dim eventPOCemail As String = eventObj.getpoc_email
            Dim eventPOCphone As String = eventObj.getpoc_phone

            pheventsummary.Controls.Add(myLabel)

            If eventPOC <> "" Then
                myLabel = New Literal

                myLabel.Text = contactTitle & eventPOC & "</br>"
                If eventPOCphone <> "" Then
                    myLabel.Text += eventPOCphone
                    If eventPOCemail <> "" Then
                        myLabel.Text += "; <a href='mailto:" & eventPOCemail & "?subject=" & eventObj.getName & "'>" & eventPOCemail & "</a>" & endTitle
                    Else
                        myLabel.Text += endTitle
                    End If
                Else
                    If eventPOCemail <> "" Then
                        myLabel.Text += "<a href='mailto:" & eventPOCemail & "?subject=" & eventObj.getName & "'>" & eventPOCemail & "</a>" & endTitle
                    End If

                End If


                pheventsummary.Controls.Add(myLabel)
            End If
            Dim eventURL As String = eventObj.getevent_url





            myLabel = New Literal
            'escape the double single quotation marks in the string
            Dim detailsStr As String
            detailsStr = eventObj.getDetails()
            detailsStr = detailsStr.Replace("''", "'")
            'myLabel.Text = detailsTitle & eventObj.getDetails() & endTitle
            myLabel.Text = detailsTitle & detailsStr


            Dim Date1 As Date = Date.Parse(eventObj.getEndDate)
            Dim Date2 As Date = Now

            Dim Date3 As Integer = DateDiff(DateInterval.Day, Date1, Date2)

            If Date3 > 730 Then
                myLabel.Text = myLabel.Text.Replace("<a", "</a")
            End If


            pheventdetails.Controls.Add(myLabel)

            myLabel = New Literal
            If eventURL <> "" Then
                If Date3 > 730 Then
                    myLabel.Text = "<p>Visit the event website for more information: " & eventURL & "</p> <div class='alert alert-warning'><strong>Please Note:</strong> External links older than two years are disabled for your security. Always exercise caution following links online.</div>"
                Else
                    myLabel.Text = "<p>Visit the event website for more information: <a target='_blank' href='" & eventURL & "'>" & eventURL & "</a></p>"
                End If
            End If
            pheventdetails.Controls.Add(myLabel)
            myLabel = New Literal
            myLabel.Text = sectorTitle & sectDescStr & endTitle
            pheventsummary.Controls.Add(myLabel)

            metaImage = eventObj.getphoto_url
            metaTitle = eventObj.getName
            Dim TitleEnd As String = ""
            If Len(eventObj.getName) > 40 Then
                TitleEnd = eventObj.getName.Substring(0, 40) + "... | "
            Else
                TitleEnd = eventObj.getName + " | "
            End If
            newTitle = sectDescStr + " - " + TitleEnd + "Global Methane Initiative"

            myLabel = New Literal
            Dim thisStr As New clsEventDAO()
            myLabel.Text = thisStr.showEventResourceList(eventid, firstsector, "Yes", "final")
            phrelatedresources.Controls.Add(myLabel)
            If Len(myLabel.Text) < 50 Then
                resourcerow.Visible = False
            End If

            'getRelatedEvents(eventObj.getCountry, firstsector, eventId)
        Else
            Trace.Warn("ispostback")
        End If



    End Sub

    'Protected Sub ShowRelatedEvents(ByVal eventid As Integer, ByVal sectorid As String)


    '    If Not IsPostBack Then

    '        Try
    '            Dim dt As DataTable = Nothing
    '            Dim CatchMsg As String = ""
    '            Dim relEventObj As DataTable
    '            relEventObj = clsEventDAO.getRelatedEvents(eventid, sectorid)

    '            Dim phString As String = ""

    '            phString = clsEventDAO.ShowEventTable(relEventObj)

    '            Dim myLabel As Literal
    '            myLabel = New Literal
    '            Dim rString As String = ""





    '            rString += "<h3>You may also be interested in these events</h3>" & Chr(10)
    '            rString += "<table id ='relatedevents' class='table hover'><thead>" & Chr(10)
    '            rString += "<tr><th>&nbsp;</th><th>Name</th><th>Date</th><th>Location</th><th>Sector</th></th></tr>" & Chr(10)
    '            rString += "</thead>" & Chr(10)
    '            myLabel.Text = rString
    '            phRelatedEvents.Controls.Add(myLabel)


    '            myLabel = New Literal
    '            myLabel.Text = phString & "</table>" & Chr(10)
    '            phRelatedEvents.Controls.Add(myLabel)
    '        Catch
    '            Dim mylabel As Literal
    '        myLabel = New Literal
    '        phRelatedEvents.Controls.Add(myLabel)
    '        End Try
    '    Else
    '        Trace.Warn("ispostback")
    '    End If

    'End Sub



End Class
