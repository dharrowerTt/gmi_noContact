Imports System.IO
Imports System.Text
Imports System.Data
Imports System.Data.SqlClient

Partial Class events_index
    Inherits System.Web.UI.Page
    Dim CookieValue As String





    Private Sub Page_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load

        If Not Request.Cookies("username") Is Nothing Then
            CookieValue = Request.Cookies("username").Value
        Else
            CookieValue = "user"
        End If


        getUpcomingEvents()
        getRecentEvents()

        If CookieValue <> "user" Then
            ' logged in user is an administrator
            draftevents.Visible = True
            getDraftEvents()

        End If



    End Sub

    Friend Function getUpcomingEvents()


        Dim currentMon As String = ""
        Dim currentYear As String = ""



        Dim myToday As DateTime
        myToday = DateTime.Today
        currentMon = myToday.Month
        currentYear = myToday.Year


        If Not IsPostBack Then

            Try
                Dim dt As DataTable = Nothing
                Dim CatchMsg As String = ""
                dt = clsEventDAO.getUpcomingEvents(currentMon, currentYear)

                Dim phString As String = ""
                phString = ShowEvents(dt)

                Dim mylabel As Literal
                mylabel = New Literal
                mylabel.Text = phString
                phUpcomingEvents.Controls.Add(mylabel)
            Catch
                Dim mylabel As Literal
                myLabel = New Literal
                phUpcomingEvents.Controls.Add(myLabel)
            End Try
        Else
            Trace.Warn("ispostback")
        End If

    End Function

    Friend Function getRecentEvents()


        Dim currentMon As String = ""
        Dim currentYear As String = ""



        Dim myToday As DateTime
        myToday = DateTime.Today
        currentMon = myToday.Month
        currentYear = myToday.Year


        If Not IsPostBack Then

            Try
                'Dim dtall As DataTable = Nothing
                Dim dt As DataTable = Nothing
                Dim CatchMsg As String = ""
                dt = clsEventDAO.getRecentEvents()
                ' dt = dtall.AsEnumerable().Take(20).CopyToDataTable()

                Dim phString As String = ""
                phString = clsEventDAO.ShowEventList(dt)
                Dim allCSVLines As New List(Of String)
                allCSVLines.Add(phString)
                Dim htmlfile As String = System.Web.HttpContext.Current.Server.MapPath("\events\recent_events.html")
                File.WriteAllLines(htmlfile, allCSVLines)

                Dim mylabel As Literal
                mylabel = New Literal
                mylabel.Text = phString
                phRecentEvents.Controls.Add(mylabel)
            Catch
                Dim mylabel As Literal
                mylabel = New Literal
                phRecentEvents.Controls.Add(mylabel)
            End Try
        Else
            Trace.Warn("ispostback")
        End If

    End Function

    Friend Function getDraftEvents()


        Dim currentMon As String = ""
        Dim currentYear As String = ""



        Dim myToday As DateTime
        myToday = DateTime.Today
        currentMon = myToday.Month
        currentYear = myToday.Year


        If Not IsPostBack Then

            Try
                Dim dt As DataTable = Nothing
                Dim CatchMsg As String = ""
                dt = clsEventDAO.getDraftEvents()

                Dim phString As String = ""
                phString = clsEventDAO.ShowEventList(dt)
                Dim allCSVLines As New List(Of String)
                allCSVLines.Add(phString)
                Dim htmlfile As String = System.Web.HttpContext.Current.Server.MapPath("\events\draft_events.html")
                File.WriteAllLines(htmlfile, allCSVLines)

                Dim mylabel As Literal
                mylabel = New Literal
                mylabel.Text = phString
                phDraftEvents.Controls.Add(mylabel)
            Catch
                Dim mylabel As Literal
                mylabel = New Literal
                phDraftEvents.Controls.Add(mylabel)
            End Try
        Else
            Trace.Warn("ispostback")
        End If

    End Function

    Friend Function ShowEvents(dt As DataTable) As String


        Dim eventId As String
        Dim startDateValue As String
        Dim endDateValue As String
        Dim nameValue As String
        Dim phString As String = ""

        Dim sectorValue As String
        Dim detailsValue As String

        Dim endTitle As String


        endTitle = "</div></div>"

        Dim x

        For x = 0 To dt.Rows.Count - 1
            Dim startdate = dt.Rows(x)("startDate")
            Dim locationString = dt.Rows(x)("city")


            eventId = dt.Rows(x)("eventId")
            nameValue = dt.Rows(x)("name")
            Dim namevaltext As String = ""
            namevaltext = "<h3><a href=""/events/details.aspx?eventid=" & eventId & """ alt=""Event details"">" & nameValue & "</a></h3>"
            If Len(dt.Rows(x)("state").ToString) > 0 Then
                locationString += ", " & dt.Rows(x)("state")
            End If
            If clsLookup.GetCountryNameByCId(dt.Rows(x)("country")) = "N/A" Then

            Else
                locationString += ", " & clsLookup.GetCountryNameByCId(dt.Rows(x)("country")) & "</h4>" & Chr(10)
            End If


            startDateValue = Common.getDateFormatDisplay(dt.Rows(x)("startDate"))
            endDateValue = Common.getDateFormatDisplay(dt.Rows(x)("endDate"))
            'detailsValue = "<p>" & replaceHTMLTags(Left(dt.Rows(x)("details"), 400) & "...") & "</p>" & Chr(10)
            'detailsValue = "<p>" & Left(replaceHTMLTags(dt.Rows(x)("details")), 400) & "...</p>" & Chr(10)
            detailsValue = "<div class='detailspara'><p>" & dt.Rows(x)("details") & "<p></div>" & Chr(10)

            'get sector desc 
            Dim sectDescStr As String = ""
            Dim firstsector As String = ""
            Dim sectors As DataTable
            sectors = clsEventDAO.getEventSectorsByEventId(eventId)
            Dim y
            For y = 0 To sectors.Rows.Count - 1
                Dim desc As String
                desc = sectors.Rows(y)("sectorDesc")
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
                Dim curFile As String = Server.MapPath(dt.Rows(x)("photo_url").ToString)
                Dim curfileAlt As String = Server.MapPath("/assets/images/" & dt.Rows(x)("photo_url"))
                If System.IO.File.Exists(curFile) = True Then
                    fileUrl += "<div Class='col-sm-4'><a href=""/events/details.aspx?eventid=" & eventId & """ alt=""Event details""><img src=""" + dt.Rows(x)("photo_url") + """  style='width:100%;' alt='" + firstsector + "' title='Featured Image for " + dt.Rows(x)("name").ToString + "'/>" & Chr(10)

                ElseIf System.IO.File.Exists(curfileAlt) = True Then
                    fileUrl += "<div Class='col-sm-4'><a href=""/events/details.aspx?eventid=" & eventId & """ alt=""Event details""><img src=""/assets/images/" + dt.Rows(x)("photo_url") + """  style='width:100%;' alt='" + firstsector + "' title='Featured Image for " + dt.Rows(x)("name").ToString + "'/>" & Chr(10)

                Else
                    Dim r As New Random()
                    Dim n As Integer = r.Next(2)

                    fileUrl += "<div Class='col-sm-4'><a href=""/events/details.aspx?eventid=" & eventId & """ alt=""Event details""><img src=""/assets/images/event_feature_" + getSectorEventURL(firstsector) + n.ToString + ".JPG""  style='width:100%;' alt='" + firstsector + "' title='Featured Image for " + dt.Rows(x)("name").ToString + "'/>" & Chr(10)

                End If
            Catch ex As System.Net.WebException
                fileUrl += "<div Class='col-sm-4'><a href=""/events/details.aspx?eventid=" & eventId & """ alt=""Event details""><img src=""" + dt.Rows(x)("photo_url") + """  style='width:100%;' alt='" + firstsector + "' title='Featured Image for " + dt.Rows(x)("name").ToString + "'/>" & Chr(10)
            End Try


            phString += "<div class='row py-3'>" & Chr(10)
            phString += fileUrl
            phString += "</a></div>" & Chr(10)
            phString += "<div class='col-sm-8'>" & Chr(10)


            phString += namevaltext




            Dim datestring As String = ""
            Dim thisstartdate = dt.Rows(x)("startDate")
            Dim thisenddate = dt.Rows(x)("endDate")

            datestring = "<h4>" & Day(thisstartdate) 'Common.getDateFormatDisplay(eventObj.getStartDate())
            If Month(thisstartdate).ToString <> Month(thisenddate).ToString Then
                datestring += " " & Format(CDate(thisstartdate), "MMMM")
            End If
            If Day(thisenddate) <> Day(thisstartdate) Then
                datestring += "&ndash;" & Day(thisenddate)
            End If
            datestring += " " & Format(CDate(thisenddate), "MMMM yyyy")
            datestring += ", " & locationString & "</h4>" & Chr(10)
            phString += datestring

            phString += detailsValue & "<p> <a href = '/events/details.aspx?eventid=" & eventId & "' class='btn btn-outline-primary'>View Details</a>" & Chr(10)

            'If Not CookieValue = "user" Then
            '    'user is an administrator
            '    phString += "<a href='/gmi-admin/eventdetails.aspx?eventid=" & eventId & "' class='btn btn-outline-danger'>Edit</a>" & Chr(10)
            'End If
            phString += "</p>" & endTitle & Chr(10)



        Next

        If (dt.Rows.Count > 0) Then
            'CatchMsg += "; no rows"
        End If


        Return phString

    End Function

    Protected Sub reload_click(sender As Object, e As EventArgs)
        'Response.Redirect("past_events.aspx")
        'reload the data on the backend


        Dim lastupdate As DateTime
        Dim curFile As String = System.Web.HttpContext.Current.Server.MapPath("\events\all_past_events.html")

        lastupdate = File.GetLastWriteTime(curFile)

        If lastupdate < DateAdd("d", 1, Now()) Then
            getPastEvents()

        End If



    End Sub

    Friend Function getPastEvents()


        Dim currentMon As String = ""
        Dim currentYear As String = ""



        Dim myToday As DateTime
        myToday = DateTime.Today
        currentMon = myToday.Month
        currentYear = myToday.Year


        If Not IsPostBack Then

            Try
                'Dim dtall As DataTable = Nothing
                Dim dt As DataTable = Nothing
                Dim CatchMsg As String = ""
                dt = clsEventDAO.getPastEvents()
                ' dt = dtall.AsEnumerable().Take(20).CopyToDataTable()

                Dim phString As String = ""
                phString = ShowPastEventList(dt)

                Dim mylabel As Literal
                mylabel = New Literal
                mylabel.Text = phString
                'phAllEvents.Controls.Add(mylabel)
            Catch
                Dim mylabel As Literal
                mylabel = New Literal
                'phAllEvents.Controls.Add(mylabel)
            End Try
        Else
            Trace.Warn("ispostback")
        End If

    End Function




    Friend Function ShowPastEventList(dt As DataTable) As String


        Dim eventId As String
        Dim startDateValue As String
        Dim endDateValue As String
        Dim nameValue As String
        Dim phString As String = ""
        phString += "<table id ='pastevents' class='table hover'><thead>"
        phString += "   <tr><th>&nbsp;</th><th>Name</th><th>Date</th><th>Location</th><th>Sector</th></th><th>Link</th></tr>"
        phString += "</thead>"

        Dim sectorValue As String
        Dim detailsValue As String

        Dim endTitle As String


        endTitle = "</tr>"

        Dim x

        For x = 0 To dt.Rows.Count - 1

            Dim startdate = dt.Rows(x)("startDate")
            Dim locationString = dt.Rows(x)("city")


            eventId = dt.Rows(x)("eventId")
            nameValue = dt.Rows(x)("name")
            Dim namevaltext As String = ""
            namevaltext = "<a href=""/events/details.aspx?eventid=" & eventId & """ alt=""Event details"">" & nameValue & "</a>"
            If Len(dt.Rows(x)("state").ToString) > 0 Then
                locationString += ", " & dt.Rows(x)("state")
            End If
            If clsLookup.GetCountryNameByCId(dt.Rows(x)("country")) = "N/A" Then

            Else
                locationString += ", " & clsLookup.GetCountryNameByCId(dt.Rows(x)("country")) & "" & Chr(10)
            End If


            startDateValue = Common.getDateFormatDisplay(dt.Rows(x)("startDate"))
            endDateValue = Common.getDateFormatDisplay(dt.Rows(x)("endDate"))
            'detailsValue = "<p>" & replaceHTMLTags(Left(dt.Rows(x)("details"), 200) & "...") & "</p>" & Chr(10)
            detailsValue = "<p>" & Left(replaceHTMLTags(dt.Rows(x)("details")), 200) & "...</p>" & Chr(10)

            'get sector desc 
            Dim sectDescStr
            Dim firstsector As String = ""
            Dim sectors As DataTable
            sectors = clsEventDAO.getEventSectorsByEventId(eventId)
            Dim y
            For y = 0 To sectors.Rows.Count - 1
                Dim desc As String
                desc = sectors.Rows(y)("sectorDesc")
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
                Dim curFile As String = Server.MapPath(dt.Rows(x)("photo_url").ToString)
                Dim curfileAlt As String = Server.MapPath("/assets/images/" & dt.Rows(x)("photo_url"))
                If System.IO.File.Exists(curFile) = True Then
                    fileUrl += "<a href=""/events/details.aspx?eventid=" & eventId & """ alt=""Event details""><img src=""" + dt.Rows(x)("photo_url") + """  style='width:100px;' alt='" + firstsector + "' title='Featured Image for " + dt.Rows(x)("name").ToString + "'/>" & Chr(10)

                ElseIf System.IO.File.Exists(curfileAlt) = True Then
                    fileUrl += "<a href=""/events/details.aspx?eventid=" & eventId & """ alt=""Event details""><img src=""/assets/images/" + dt.Rows(x)("photo_url") + """  style='width:100px;' alt='" + firstsector + "' title='Featured Image for " + dt.Rows(x)("name").ToString + "'/>" & Chr(10)

                Else
                    Dim r As New Random()
                    Dim n As Integer = r.Next(2)

                    fileUrl += "<a href=""/events/details.aspx?eventid=" & eventId & """ alt=""Event details""><img src=""/assets/images/event_feature_" + getSectorEventURL(firstsector) + n.ToString + ".JPG""  style='width:100px;' alt='" + firstsector + "' title='Featured Image for " + dt.Rows(x)("name").ToString + "'/>" & Chr(10)

                End If
            Catch ex As System.Net.WebException
                fileUrl += "<a href=""/events/details.aspx?eventid=" & eventId & """ alt=""Event details""><img src=""" + dt.Rows(x)("photo_url") + """  style='width:100px;' alt='" + firstsector + "' title='Featured Image for " + dt.Rows(x)("name").ToString + "'/>" & Chr(10)
            End Try




            phString += "<tr><td>" & Chr(10)
            phString += fileUrl
            phString += "</a><td>" & Chr(10)
            phString += "" & Chr(10)


            phString += namevaltext & "</td>" & Chr(10)
            'phString += namevaltext & detailsValue & "</td>" & Chr(10)




            Dim datestring As String = ""
            Dim thisstartdate = dt.Rows(x)("startDate")
            Dim thisenddate = dt.Rows(x)("endDate")

            datestring = "" & Day(thisstartdate) 'Common.getDateFormatDisplay(eventObj.getStartDate())
            If Month(thisstartdate).ToString <> Month(thisenddate).ToString Then
                datestring += " " & Format(CDate(thisstartdate), "MMMM")
            End If
            If Day(thisenddate) <> Day(thisstartdate) Then
                datestring += "&ndash;" & Day(thisenddate)
            End If
            datestring += " " & Format(CDate(thisenddate), "MMMM yyyy")

            phString += "<td>" & datestring & "</td>" & Chr(10)
            phString += "<td>" & locationString & "</td>" & Chr(10)
            phString += "<td>" & sectDescStr & "</td>" & Chr(10)
            phString += "<td> <a href = '/events/details.aspx?eventid=" & eventId & "' class='btn btn-outline-primary'>View Details</a>" & Chr(10)

            'If Not CookieValue = "user" Then
            '    'user is an administrator
            '    phString += "<a href='/gmi-admin/eventdetails.aspx?eventid=" & eventId & "' class='btn btn-outline-danger'>Edit</a>" & Chr(10)
            'End If
            phString += "</td>" & endTitle & Chr(10)



        Next

        If (dt.Rows.Count > 0) Then
            'CatchMsg += "; no rows"
        End If
        phString += "</table>"
        Dim allCSVLines As New List(Of String)
        allCSVLines.Add(phString)

        Dim htmlfile As String = System.Web.HttpContext.Current.Server.MapPath("\events\all_past_events.html")
        File.WriteAllLines(htmlfile, allCSVLines)
        Return phString

    End Function



    Friend Function getMonthByValue(ByVal pValue As String) As String
        If (pValue = 1) Then
            Return "January"
        End If
        If (pValue = 2) Then
            Return "February"
        End If
        If (pValue = 3) Then
            Return "March"
        End If
        If (pValue = 4) Then
            Return "April"
        End If
        If (pValue = 5) Then
            Return "May"
        End If
        If (pValue = 6) Then
            Return "June"
        End If

        If (pValue = 7) Then
            Return "July"
        End If
        If (pValue = 8) Then
            Return "August"
        End If
        If (pValue = 9) Then
            Return "September"
        End If
        If (pValue = 10) Then
            Return "October"
        End If
        If (pValue = 11) Then
            Return "November"
        End If
        If (pValue = 12) Then
            Return "December"
        End If

    End Function

    Friend Function getDayOfWeek(ByVal pValue As String) As String
        If (pValue = 0) Then
            Return "sunday"
        End If
        If (pValue = 1) Then
            Return "monday"
        End If
        If (pValue = 2) Then
            Return "tuesday"
        End If
        If (pValue = 3) Then
            Return "wednesday"
        End If
        If (pValue = 4) Then
            Return "thursday"
        End If
        If (pValue = 5) Then
            Return "friday"
        End If
        If (pValue = 6) Then
            Return "saturday"
        End If
    End Function
End Class
