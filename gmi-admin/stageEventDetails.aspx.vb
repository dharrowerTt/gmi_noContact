
Partial Class stage_events_details
    Inherits System.Web.UI.Page
    Dim CookieValue As String



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

        If Not Request.Cookies("username") Is Nothing Then
            CookieValue = Request.Cookies("username").Value
        Else
            CookieValue = "user"
        End If



        If Not IsNumeric(eventid) Then
            eventid = 466
        End If


        Dim eventObj As clsEventVO
        eventObj = clsEventDAO.GetEventByEventId(eventid)

        ' disable this line for testing
        'If CookieValue = "user" Then
        '    Response.Redirect("/events/index.aspx")
        'End If

        If IsNothing(eventObj) Then
            Response.Redirect("/events/index.aspx")

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
                    fileUrl = "<img src=""/images/" + eventObj.getphoto_url + """ style='width:100%'  alt='" + firstsector + "' title='Featured Image for " + eventObj.getName + "'/>"

                Else
                    Dim r As New Random()
                    Dim n As Integer = r.Next(2)

                    fileUrl = "<img src=""/assets/images/event_feature_" + getSectorEventURL(firstsector) + n.ToString + ".JPG"" style='width:100%' alt='" + firstsector + "' title='Featured Image for " + eventObj.getName + "'  />"

                End If
            Catch

                fileUrl = "<img src=""" + eventObj.getphoto_url + """ style='width:100%' alt='" + firstsector + "' title='Featured Image for " + eventObj.getName + "' />"

            End Try

            myLabel = New Literal
            myLabel.Text = "<div Class='col-sm-3'>"
            myLabel.Text += fileUrl & "</div>" & Chr(10)
            myLabel.Text += "<div Class='col-sm-9'>"
            myLabel.Text += "<h1>" & eventObj.getName & "</h1>" & Chr(10) & "<a href='/gmi-admin/event_create.aspx?eventid=" & eventid & "' class='btn-primary'>EDIT</a></div>" & Chr(10)
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

            myLabel.Text = dateTitle & datestring & endTitle
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

            If eventURL <> "" Then
                myLabel.Text = "<p>Visit the event website for more information: <a href='" & eventURL & "' title='" & eventObj.getName().ToString & "'/>" & eventURL & "</a>" & endTitle
            End If
            pheventdetails.Controls.Add(myLabel)

            myLabel = New Literal
            'escape the double single quotation marks in the string
            Dim detailsStr As String
            detailsStr = eventObj.getDetails()
            detailsStr = detailsStr.Replace("''", "'")
            'myLabel.Text = detailsTitle & eventObj.getDetails() & endTitle
            myLabel.Text = detailsTitle & detailsStr & endTitle
            pheventdetails.Controls.Add(myLabel)

            myLabel = New Literal
            myLabel.Text = sectorTitle & sectDescStr & endTitle
            pheventsummary.Controls.Add(myLabel)



            myLabel = New Literal
            Dim thisStr As New clsEventDAO()
            myLabel.Text = thisStr.showEventResources(eventid, firstsector, "Yes", "draft")
            pheventdetails.Controls.Add(myLabel)

            'getRelatedEvents(eventObj.getCountry, firstsector, eventId)
        Else
            Trace.Warn("ispostback")
        End If
    End Sub

    'Protected Sub getResourcesbyEventID(ByRef eventid As String, ByRef firstsector As String)


    '    Dim myLabel
    '    Dim data As New clsResourceDAO()
    '    Dim resourcesDT As DataTable = data.getEventResourcesbyEventID(eventid, "1=1")
    '    If resourcesDT Is Nothing Or resourcesDT.Rows.Count < 1 Then
    '        phResources.Visible = False

    '    Else
    '        Debug.WriteLine(resourcesDT.Rows.Count & " row count")
    '        myLabel = New Literal
    '        myLabel.text = "<h3>Event Resources</h3>"
    '        phResources.Controls.Add(myLabel)
    '        For Each row As DataRow In resourcesDT.Rows
    '            Dim fileUrl As String = ""
    '            Dim fileImgPath As String = ""
    '            fileImgPath = getresourceImageName(row("resourceLink").ToString)
    '            Dim curFile As String = Server.MapPath(fileImgPath)

    '            If System.IO.File.Exists(curFile) = True Then
    '                fileUrl = "<img src=""" + fileImgPath + """  />"
    '            Else
    '                Dim r As New Random()
    '                Dim n As Integer = r.Next(2)

    '                fileUrl = "<img src=""/images/resource_feature_" + LCase(Replace(getSectorEventURL(firstsector), " ", "")) + n.ToString + ".JPG"" alt = '" + firstsector + " Thumbnail'  />"
    '            End If
    '            Dim fileinfo As String = ""
    '            If row("filetype").ToString <> "" Then
    '                fileinfo += "(" + row("filetype").ToString
    '            Else
    '                fileinfo += "("
    '            End If
    '            If row("resourcesize").ToString <> "" Then
    '                fileinfo += ", " + row("resourceSize").ToString
    '            End If
    '            If row("resourcepages").ToString <> "" Then
    '                fileinfo += ", " + row("resourcepages").ToString
    '                If row("resourcepages") = 1 Then
    '                    fileinfo += "p"
    '                Else
    '                    fileinfo += "pp"
    '                End If
    '            End If
    '            If fileinfo = "(" Then
    '                fileinfo = ""
    '            Else
    '                fileinfo += ")"
    '            End If


    '            myLabel = New Literal
    '            myLabel.Text = "<dl><dt>" + fileUrl + "</dt><dd>" + "<a href='" + row("resourceLink").ToString + "' target='blank' >" + row("resourceName").ToString + "</a><br />" + fileinfo + "</dd></dl>"
    '            phResources.Controls.Add(myLabel)
    '        Next

    '    End If


    'End Sub


End Class
