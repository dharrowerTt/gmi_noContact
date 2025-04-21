Imports System.IO
Imports System.Text
Imports System.Data
Imports System.Data.SqlClient

Public Class stageevent_detailsByID
    Inherits System.Web.UI.Page

#Region " Web Form Designer Generated Code "

    'This call is required by the Web Form Designer.
    <System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()

    End Sub
    Protected WithEvents Form1 As System.Web.UI.HtmlControls.HtmlForm
    'Protected WithEvents preMon As System.Web.UI.WebControls.Literal
    'Protected WithEvents curMonth As System.Web.UI.WebControls.Literal
    'Protected WithEvents nextMon As System.Web.UI.WebControls.Literal

    'NOTE: The following placeholder declaration is required by the Web Form Designer.
    'Do not delete or move it.
    Private designerPlaceholderDeclaration As System.Object

    Private Sub Page_Init(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Init
        'CODEGEN: This method call is required by the Web Form Designer
        'Do not modify it using the code editor.
        InitializeComponent()
    End Sub

    Protected WithEvents LitEventName As Literal
    Protected WithEvents LitEventFeatureImage As Literal
    Protected WithEvents Edit As Literal
    Protected WithEvents LitLastBreadcrumb As Literal
    Protected WithEvents ph1 As System.Web.UI.WebControls.PlaceHolder
    Protected WithEvents phResources As System.Web.UI.WebControls.PlaceHolder
    Protected WithEvents phRelatedEvents As System.Web.UI.WebControls.PlaceHolder
    'Protected WithEvents libyear As System.Web.UI.WebControls.ListBox
    'Protected WithEvents libsector As System.Web.UI.WebControls.ListBox
    'Protected WithEvents Libtype As System.Web.UI.WebControls.ListBox

    'Protected WithEvents goButton As System.Web.UI.WebControls.ImageButton

    Private eventId As String

    'Protected WithEvents calendarview As System.Web.UI.WebControls.Literal
    'Protected WithEvents monthlistview As System.Web.UI.WebControls.Literal
    'Protected WithEvents yearlistview As System.Web.UI.WebControls.Literal
    'Private year As String
    'Private sector As String
    'Private type As String

    'Private today As String
#End Region

    Private Sub Page_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        'Put user code to initialize the page here
        eventId = Server.HtmlEncode(Request.QueryString("eventId"))

        If Not IsNumeric(eventId) Then
            eventId = 466
        End If
        'hui filter the query string

        Dim eventObj As clsEventVO
        eventObj = clsEventDAO.GetDraftEventByEventId(eventId)


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
            sectors = clsEventDAO.getEventSectorsByEventId(eventId)
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
            dateTitle = "<p><span class=""sectitle"">Date: </span>"
            nameTitle = "<p><span class=""sectitle"">Name: </span>"
            locationTitle = "<p><span class=""sectitle"">Location: </span>"
            sectorTitle = "<p><span class=""sectitle"">Sector: </span>"
            organizerTitle = "<p><span class=""sectitle"">Organizer: </span>"
            contactTitle = "<p><span class=""sectitle"">Contact: </span>"
            detailsTitle = "<p><span class=""sectitle"">Event Details: </span>"
            endTitle = "</p>"
            'calDayClose = "<br></div>"

            '// feature image
            Dim fileUrl As String = ""
            Try
                Dim curFile As String = Server.MapPath(eventObj.getphoto_url)
                Dim curfileAlt As String = Server.MapPath("/images/" & eventObj.getphoto_url)
                If System.IO.File.Exists(curFile) = True Then
                    fileUrl = "<img src=""" + eventObj.getphoto_url + """ alt='" + firstsector + "' title='Featured Image for " + eventObj.getName + "'  />"

                ElseIf System.IO.File.Exists(curfileAlt) = True Then
                    fileUrl = "<img src=""/images/" + eventObj.getphoto_url + """ style='width:100%' alt='" + firstsector + "' title='Featured Image for " + eventObj.getName + "'/>"

                Else
                    Dim r As New Random()
                    Dim n As Integer = r.Next(2)

                    fileUrl = "<img src=""/images/event_feature_" + getSectorEventURL(firstsector) + n.ToString + ".JPG"" alt='" + firstsector + "' title='Featured Image for " + eventObj.getName + "'  />"

                End If
            Catch

                fileUrl = "<img src=""" + eventObj.getphoto_url + """ style='width:100%;' alt='" + firstsector + "' title='Featured Image for " + eventObj.getName + "' />"

            End Try
            LitEventFeatureImage.Text = fileUrl
            Edit.Text = "<a href='/admin/event_create.aspx?mode=e&eventid=" & eventObj.getEventId & "'><h4>Edit This Event</h4></a>"



            myLabel = New Literal
            Dim datestring As String = ""
            Dim thisstartdate = eventObj.getStartDate()
            Dim thisenddate = eventObj.getEndDate
            datestring = "<h2>" & Day(thisstartdate) 'Common.getDateFormatDisplay(eventObj.getStartDate())
            If Month(thisstartdate).ToString <> Month(thisenddate).ToString Then
                datestring = datestring & " " & Month(thisstartdate).ToString
            End If
            If enddate <> "" Then
                datestring = datestring & "&ndash;" & enddate
            End If
            datestring = datestring & " " & Format(CDate(thisenddate), "MMMM yyyy")
            datestring = datestring & "</h2>"
            myLabel.Text = datestring
            ph1.Controls.Add(myLabel)


            LitEventName.Text = eventObj.getName()
            LitLastBreadcrumb.Text = eventObj.getName()

            myLabel = New Literal
            myLabel.Text = sectorTitle & sectDescStr & endTitle
            ph1.Controls.Add(myLabel)

            myLabel = New Literal
            If (countryName.Equals("N/A")) Then 'Ignore country name if selection equals N/A
                myLabel.Text = locationTitle & eventObj.getCity() & endTitle
            ElseIf Len(eventObj.getState()) = 0 Then
                myLabel.Text = locationTitle & eventObj.getCity() & ", " & countryName & endTitle
            Else
                myLabel.Text = locationTitle & eventObj.getCity() & ", " & eventObj.getState() & ", " & countryName & endTitle
            End If

            ph1.Controls.Add(myLabel)

            Dim eventOrganizer As String = eventObj.getorganizer
            Dim eventURL As String = eventObj.getorganizer_url

            myLabel = New Literal
            If eventOrganizer <> "" Then
                myLabel.Text = organizerTitle & eventOrganizer
                If eventURL <> "" Then
                    myLabel.Text += "</br>" & "Visit the website for more information: <a href='" & eventURL & "' title='" & eventOrganizer & "'/>" & eventURL & "</a>" & endTitle
                Else
                    myLabel.Text += endTitle
                End If
            Else
                If eventURL <> "" Then
                    myLabel.Text = organizerTitle & "Visit the website for more information: <a href='" & eventURL & "' title='" & eventOrganizer & "'/>" & eventURL & "</a>" & endTitle
                End If
            End If

            Dim eventPOC As String = eventObj.getpoc_name
            Dim eventPOCemail As String = eventObj.getpoc_email
            Dim eventPOCphone As String = eventObj.getpoc_phone

            ph1.Controls.Add(myLabel)

            If eventPOC <> "" Then
                myLabel = New Literal

                myLabel.Text = contactTitle & eventPOC & "</br>"
                If eventPOCphone <> "" Then
                    myLabel.Text += "Phone: " & eventPOCphone
                    If eventPOCemail <> "" Then
                        myLabel.Text += "; Email: <a href='mailto:" & eventPOCemail & "?subject=" & eventObj.getName & "'>" & eventPOCemail & "</a>" & endTitle
                    Else
                        myLabel.Text += endTitle
                    End If
                Else
                    If eventPOCemail <> "" Then
                        myLabel.Text += "Email: <a href='mailto:" & eventPOCemail & "?subject=" & eventObj.getName & "'>" & eventPOCemail & "</a>" & endTitle
                    End If

                End If


                ph1.Controls.Add(myLabel)
            End If


            myLabel = New Literal
            'escape the double single quotation marks in the string
            Dim detailsStr As String
            detailsStr = eventObj.getDetails()
            detailsStr = detailsStr.Replace("''", "'")
            'myLabel.Text = detailsTitle & eventObj.getDetails() & endTitle
            myLabel.Text = detailsTitle & detailsStr & endTitle
            ph1.Controls.Add(myLabel)

            myLabel = New Literal
            'myLabel.Text = calDayClose & calDayClose & calDayClose
            ph1.Controls.Add(myLabel)

            getResourcesbyEventID(eventId, firstsector, "draft")
            getRelatedEvents(eventObj.getCountry, firstsector, eventId)
        Else
            Trace.Warn("ispostback")
        End If
    End Sub

    Protected Sub getRelatedEvents(ByRef countryid As String, ByRef firstsector As String, ByRef eventid As Integer)

        Dim relatedEventsDT As DataTable
        relatedEventsDT = clsEventDAO.getRelatedEvents(countryid, firstsector, eventid)
        If relatedEventsDT Is Nothing Or relatedEventsDT.Rows.Count < 1 Then
            phRelatedEvents.Visible = False
        Else

            Dim myLabel
            myLabel = New Literal
            myLabel.text = "<hr /><h2>Related Events</h2>"
            phRelatedEvents.Controls.Add(myLabel)
            For Each row As DataRow In relatedEventsDT.Rows
                '// feature image

                Dim relatedeventsector As String = ""
                Dim eventsectorDT As DataTable
                eventsectorDT = clsEventDAO.getEventSectorsByEventId(row("eventid"))
                If eventsectorDT Is Nothing Or eventsectorDT.Rows.Count < 1 Then
                Else
                    For Each sect As DataRow In eventsectorDT.Rows
                        If relatedeventsector = "" Then
                            relatedeventsector = sect("sectorDesc")
                        End If
                    Next
                End If

                myLabel = New Literal
                myLabel.text = "<dl class='relatedevent'><dt style=""float:left;width:30%;"">"
                phRelatedEvents.Controls.Add(myLabel)
                Dim fileUrl As String = ""

                Try
                    Dim curFile As String = Server.MapPath("/images/" + row("photo_url").ToString)

                    If System.IO.File.Exists(curFile) = True Then
                        fileUrl = "<img src=""/images/" + row("photo_url").ToString + """ style='width:100%;' alt='" + relatedeventsector + "' title='Featured Image for " + row("name").ToString + "' />"
                    Else
                        Dim r As New Random()
                        Dim n As Integer = r.Next(2)
                        fileUrl = "<img src=""/images/event_feature_" + LCase(Replace(getSectorEventURL(relatedeventsector), " ", "")) + n.ToString + ".JPG""  style='width:100%;' alt='" + relatedeventsector + "' title='Featured Image for " + row("name").ToString + "' />"

                    End If
                Catch ex As Exception
                    fileUrl = "<img src=""" + row("photo_url").ToString + """ style='width:100%;' alt='" + relatedeventsector + "' title='Featured Image for " + row("name").ToString + "'/>"
                End Try


                myLabel = New Literal
                myLabel.text = fileUrl & "</dt><dd style=""float:left;width:64%;max-height:250px; overflow:hidden;"">"
                phRelatedEvents.Controls.Add(myLabel)

                myLabel = New Literal
                myLabel.text = "<h3><a href=""/news-events/event_detailsbyID.aspx?eventid=" & row("eventId").ToString & """ alt=""Event details"">" & row("name").ToString & "</a> &mdash; " & row("city").ToString & ", " & clsLookup.GetCountryNameByCId(row("country")) & "</h3>"
                phRelatedEvents.Controls.Add(myLabel)


                myLabel = New Literal
                Dim datestring As String = ""
                Dim thisstartdate = row("startDate")
                Dim thisenddate = row("endDate")

                datestring = "<h5>" & Day(thisstartdate) 'Common.getDateFormatDisplay(eventObj.getStartDate())
                If Month(thisstartdate).ToString <> Month(thisenddate).ToString Then
                    datestring = datestring & " " & Month(thisstartdate).ToString
                End If
                If Day(thisenddate) <> Day(thisstartdate) Then
                    datestring = datestring & "&ndash;" & Day(thisenddate)
                End If
                datestring = datestring & " " & Format(CDate(thisenddate), "MMMM yyyy")
                datestring = datestring & "</h5>"
                myLabel.Text = datestring
                phRelatedEvents.Controls.Add(myLabel)

                myLabel = New Literal
                myLabel.Text = "</dd></dl><div class='clear'></div>"
                phRelatedEvents.Controls.Add(myLabel)



            Next
        End If
    End Sub

    Protected Sub getResourcesbyEventID(ByRef eventid As String, ByRef firstsector As String, Optional ByVal status As String = "")


        Dim myLabel
        Dim data As New clsResourceDAO()
        Dim resourcesDT As DataTable
        If status <> "" Then
            resourcesDT = data.getEventResourcesbyEventID(eventid, "1=1", status)
        Else
            resourcesDT = data.getEventResourcesbyEventID(eventid, "1=1")
        End If

        If resourcesDT Is Nothing Or resourcesDT.Rows.Count < 1 Then
            phResources.Visible = False

        Else
            Debug.WriteLine(resourcesDT.Rows.Count & " row count")
            myLabel = New Literal
            myLabel.text = "<h3>Event Resources</h3>"
            phResources.Controls.Add(myLabel)
            For Each row As DataRow In resourcesDT.Rows
                Dim fileUrl As String = ""
                Dim fileImgPath As String = ""
                fileImgPath = getresourceImageName(row("resourceLink").ToString)
                Dim curFile As String = Server.MapPath(fileImgPath)

                If System.IO.File.Exists(curFile) = True Then
                    fileUrl = "<img src=""" + fileImgPath + """  />"
                Else
                    Dim r As New Random()
                    Dim n As Integer = r.Next(2)

                    fileUrl = "<img src=""/images/resource_feature_" + LCase(Replace(getSectorEventURL(firstsector), " ", "")) + n.ToString + ".JPG"" alt = '" + firstsector + " Thumbnail'  />"
                End If
                Dim fileinfo As String = ""
                If row("filetype").ToString <> "" Then
                    fileinfo += "(" + row("filetype").ToString
                Else
                    fileinfo += "("
                End If
                If row("resourcesize").ToString <> "" Then
                    fileinfo += ", " + row("resourceSize").ToString
                End If
                If row("resourcepages").ToString <> "" Then
                    fileinfo += ", " + row("resourcepages").ToString
                    If row("resourcepages") = 1 Then
                        fileinfo += "p"
                    Else
                        fileinfo += "pp"
                    End If
                End If
                If fileinfo = "(" Then
                    fileinfo = ""
                Else
                    fileinfo += ")"
                End If


                myLabel = New Literal
                myLabel.Text = "<dl><dt>" + fileUrl + "</dt><dd>" + "<a href='" + Trim(row("resourceLink").ToString) + "' target='blank' >" + row("resourceName").ToString + "</a><br />" + fileinfo + "</dd></dl>"
                phResources.Controls.Add(myLabel)
            Next

        End If


    End Sub


    'Friend Function getMonthByValue(ByVal pValue As String) As String
    '    If (pValue = 1) Then
    '        Return "January"
    '    End If
    '    If (pValue = 2) Then
    '        Return "February"
    '    End If
    '    If (pValue = 3) Then
    '        Return "March"
    '    End If
    '    If (pValue = 4) Then
    '        Return "April"
    '    End If
    '    If (pValue = 5) Then
    '        Return "May"
    '    End If
    '    If (pValue = 6) Then
    '        Return "June"
    '    End If

    '    If (pValue = 7) Then
    '        Return "July"
    '    End If
    '    If (pValue = 8) Then
    '        Return "August"
    '    End If
    '    If (pValue = 9) Then
    '        Return "September"
    '    End If
    '    If (pValue = 10) Then
    '        Return "October"
    '    End If
    '    If (pValue = 11) Then
    '        Return "November"
    '    End If
    '    If (pValue = 12) Then
    '        Return "December"
    '    End If

    'End Function


    'Friend Function getLength(ByVal pValue As String) As Int32
    '    Dim myDateObj As DateTime
    '    myDateObj = DateTime.Parse(pValue)
    '    Dim myYear As Int32
    '    myYear = myDateObj.Year

    '    Dim myMonth As Int32
    '    myMonth = myDateObj.Month

    '    If (myMonth = 1 Or myMonth = 3 Or myMonth = 5 Or myMonth = 7 Or myMonth = 8 Or myMonth = 10 Or myMonth = 12) Then
    '        Return 31
    '    End If

    '    If (myMonth = 4 Or myMonth = 6 Or myMonth = 9 Or myMonth = 11) Then
    '        Return 30
    '    End If

    '    If (myMonth = 2) Then
    '        If (myYear Mod 4 = 0) Then
    '            Return 29
    '        Else
    '            Return 28
    '        End If
    '    End If
    'End Function


    'Friend Function getDayOfWeek(ByVal pValue As String) As String
    '    If (pValue = 0) Then
    '        Return "sunday"
    '    End If
    '    If (pValue = 1) Then
    '        Return "monday"
    '    End If
    '    If (pValue = 2) Then
    '        Return "tuesday"
    '    End If
    '    If (pValue = 3) Then
    '        Return "wednesday"
    '    End If
    '    If (pValue = 4) Then
    '        Return "thursday"
    '    End If
    '    If (pValue = 5) Then
    '        Return "friday"
    '    End If
    '    If (pValue = 6) Then
    '        Return "saturday"
    '    End If
    'End Function
    'Protected Sub FillSectors()
    '    Dim dt As DataTable
    '    dt = clsLookup.GetSectorsDTForEventsByLookupTable

    '    Dim lItem As ListItem
    '    lItem = New ListItem("Sector", "")
    '    libsector.Items.Add(lItem)

    '    Dim x
    '    For x = 0 To dt.Rows.Count - 1
    '        If (dt.Rows(x)("sector") = "msw") Then
    '            lItem = New ListItem("MSW (Landfills)", dt.Rows(x)("sector"))
    '        Else
    '            lItem = New ListItem(dt.Rows(x)("sectordesc"), dt.Rows(x)("sector"))
    '        End If

    '        libsector.Items.Add(lItem)
    '    Next

    '    'libsector.DataTextField = "sectordesc"
    '    'libsector.DataValueField = "sector"
    '    'libsector.DataSource = dv
    '    'libsector.DataBind()        
    'End Sub

    'Protected Sub FillYears()
    '    Dim dt As DataTable
    '    dt = clsLookup.GetYearsDTForEvents

    '    Dim lItem As ListItem
    '    lItem = New ListItem("Year", "")
    '    libyear.Items.Add(lItem)

    '    Dim x
    '    For x = 0 To dt.Rows.Count - 1
    '        lItem = New ListItem(dt.Rows(x)("year"), dt.Rows(x)("year"))
    '        libyear.Items.Add(lItem)
    '    Next
    'End Sub

    'Protected Sub FillTypes()
    '    Dim lItem As ListItem

    '    lItem = New ListItem("Event", "")
    '    libtype.Items.Add(lItem)


    '    lItem = New ListItem("subcommittee", "subcommittee")
    '    libtype.Items.Add(lItem)

    '    lItem = New ListItem("sponsored", "sponsored")
    '    libtype.Items.Add(lItem)

    '    lItem = New ListItem("related", "related")
    '    libtype.Items.Add(lItem)

    'End Sub


    'Protected Sub GoEvent(ByVal s As Object, ByVal e As CommandEventArgs) Handles goButton.Command
    '    Dim hrefLink As String

    '    Dim myYear As String
    '    myYear = libyear.SelectedValue
    '    If Len(myYear) > 0 Then Common.StripMetaChars(myYear)

    '    Dim mySector As String
    '    mySector = libsector.SelectedValue
    '    If Len(mySector) > 0 Then Common.StripMetaChars(mySector)

    '    Dim myType As String
    '    myType = libtype.SelectedValue
    '    If Len(myType) > 0 Then Common.StripMetaChars(myType)


    '    hrefLink = "event_yearlistview.aspx?year=" & myYear & "&sector=" & mySector & "&type=" & myType

    '    Response.Redirect(hrefLink, True)
    'End Sub
End Class
