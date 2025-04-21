Imports System.Data
Imports System.Data.SqlClient
Imports System.IO
Imports System.Text
Imports AjaxControlToolkit
Imports FreeTextBoxControls.FreeTextBox


Public Class event_create1
    Inherits System.Web.UI.Page
    Dim CookieValue As String
    Protected WithEvents txtDetails As FreeTextBoxControls.FreeTextBox
    Private Sub Page_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load, Me.Load


        'Put user code to initialize the page here

        If Not Request.Cookies("username") Is Nothing Then
            CookieValue = Request.Cookies("username").Value
        Else
            CookieValue = "user"
            'disable this line for testing 
            '    Response.Redirect("/events/index.aspx")
            'Response.Redirect("index.aspx")

        End If




        'Dim strAppRootH, strAppPathH As String
        'Dim strSrvr As String
        'strSrvr = Request.ServerVariables("SERVER_NAME")
        'strAppRootH = Request("PATH_INFO")
        'If StrComp(strSrvr, "www.globalmethane.org", vbTextCompare) = 0 Then
        '   strAppPathH = ""
        'ElseIf StrComp(strSrvr, "globalmethane.org", vbTextCompare) = 0 Then
        '   strAppPathH = ""
        'Else
        '    strAppPathH = Left(strAppRootH, InStr(2, strAppRootH, "/", 1) - 1)
        'End If



        '...............................................................

        'Hold onto this code (calendar extender for textbox)

        'TextBox textbox = new TextBox();
        'textbox.ID = this.ID + "Textbox";
        'textbox.Text = this.EditableField.TextValue;
        'textbox.TextChanged += new EventHandler(HandleTextboxTextChanged);
        'textbox.Width = new Unit(100, UnitType.Pixel);
        'CalendarExtender calExender = new CalendarExtender();
        'calExender.PopupButtonID = "Image1";
        'calExender.TargetControlID = textbox.ID;
        'this.Controls.Add(textbox);
        'this.Controls.Add(calExender);


        '................................................................

        If Not IsPostBack Then
            FillCountries()
            FillSectors()

            'FillResourceCategory()
            Dim mode As String = ""
            mode = IIf(IsNothing(Server.HtmlEncode(Request.QueryString("mode"))), String.Empty, Server.HtmlEncode(Request.QueryString("mode")))
            'Trace.Warn("not ispostback")
            If mode = "" Then
                mode = "n"
            End If
            If (mode.ToLower() = "n") Then
                ph2.Visible = False
                ph1.Visible = True
                rblStatus.SelectedValue = "Draft"
            Else
                ph2.Visible = True
                ph1.Visible = False
                Dim editeventid As Integer
                editeventid = Server.HtmlEncode(Request.QueryString("eventId"))
                If (IsNothing(editeventid) = False) Then
                    FillPageForEdit()

                    Dim myLabel As Literal
                    myLabel = New Literal
                    Dim thisStr As New clsEventDAO()
                    myLabel.Text = thisStr.showEventResources(editeventid, "")
                    If phResources.HasControls Then
                    Else
                        phResources.Controls.Add(myLabel)
                    End If

                End If
            End If

        Else
            Trace.Warn("ispostback")
        End If
    End Sub


    Protected Sub FillPageForEdit()


        Dim eventObj As clsEventVO
        Dim editEventid As Integer
        editEventid = Server.HtmlEncode(Request.QueryString("eventId"))
        eventObj = clsEventDAO.GetEventByEventId(editEventid)

        If IsNothing(eventObj) Then
            rblStatus.SelectedValue = "Draft"

            Exit Sub
        Else
            If LCase(eventObj.getEventStatus) = "draft" Then
                rblStatus.SelectedValue = "Draft"
            ElseIf LCase(eventObj.getEventStatus) = "final" Then
                rblStatus.SelectedValue = "Final"
            ElseIf LCase(eventObj.getEventStatus) = "revised" Then
                rblStatus.SelectedValue = "Revised"
            End If
        End If

        'fill country
        libPartnerCountries.SelectedValue = eventObj.getCountry

        'get sector desc 
        Dim sectors As DataTable
        sectors = clsEventDAO.getEventSectorsByEventId(editEventid)

        'set selected values
        For m = 0 To libSectors.Items.Count - 1
            For x = 0 To sectors.Rows.Count - 1
                Dim desc As String
                desc = sectors.Rows(x)("sectorid")
                If (desc = libSectors.Items(m).Value()) Then
                    libSectors.Items(m).Selected = True
                    Exit For
                End If
            Next
        Next

        'fill other fields
        name.Text = eventObj.getName
        city.Text = eventObj.getCity
        state.Text = eventObj.getState

        poc_name.Text = eventObj.getpoc_name
        poc_phone.Text = eventObj.getpoc_phone
        poc_email.Text = eventObj.getpoc_email

        organizer_name.Text = eventObj.getorganizer
        organizer_url.Text = eventObj.getorganizer_url
        event_URL.Text = eventObj.getevent_url

        startDate.Text = Common.getDateFormatDisplayMMDDYYYY(eventObj.getStartDate)
        endDate.Text = Common.getDateFormatDisplayMMDDYYYY(eventObj.getEndDate)

        If (eventObj.getSponsored = "1") Then
            gmiSponsored.SelectedValue = "rbSponsoredYes"
        ElseIf (eventObj.getSubcommittee = "1") Then
            gmiSponsored.SelectedValue = "rbSubcommitteeYes"
        Else
            gmiSponsored.SelectedValue = "rbRelatedYes"
        End If

        If (eventObj.getEventType = "webinar") Then
            event_type.SelectedValue = "webinar"
        ElseIf (eventObj.getEventType = "in person") Then
            event_type.SelectedValue = "in person"
        Else
            event_type.SelectedValue = "virtual meeting"
        End If


        txtDetails.Text = eventObj.getDetails
        If Len(eventObj.getphoto_url) > 1 Then
            imgPhoto.ImageUrl = eventObj.getphoto_url
            existingPhoto.Visible = True
            newphoto.Visible = False
        Else
            existingPhoto.Visible = False
            newphoto.Visible = True
        End If


    End Sub


    Protected Sub FillSectors()

        Dim dv As DataView

        dv = clsLookup.GetSectorsForEventsByLookupTable

        'Trace.Warn(dv.Count)

        libSectors.DataTextField = "sector"
        libSectors.DataValueField = "sectorAbbr"
        libSectors.DataSource = dv
        libSectors.DataBind()

    End Sub

    Protected Sub FillCountries()

        Dim dv As DataView = Nothing

        'dv = clsLookup.GetPartnerCountriesWithPcId
        dv = clsLookup.GetCountriesWithCId


        'Trace.Warn(dv.Count)

        libPartnerCountries.DataTextField = "countryname"
        libPartnerCountries.DataValueField = "cId"
        libPartnerCountries.DataSource = dv
        libPartnerCountries.DataBind()

    End Sub



#Region "CallBack Functions"

    Protected Sub SaveEvent1(ByVal s As Object, ByVal e As CommandEventArgs) Handles btnSave1.Command

        SaveNewEvent(s, e)

        Response.Redirect("event_List.aspx?draft=true", True)

    End Sub


    Protected Sub SaveNewEvent(ByVal s As Object, ByVal e As CommandEventArgs)
        Dim eventObj As clsEventVO
        eventObj = New clsEventVO

        eventObj.setCity(city.Text)
        eventObj.setState(state.Text)
        eventObj.setCountry(libPartnerCountries.SelectedValue)
        eventObj.setStartDate(startDate.Text)
        eventObj.setEndDate(endDate.Text)
        eventObj.setevent_url(event_URL.Text)
        eventObj.setEventStatus(rblStatus.SelectedValue)
        eventObj.setName(name.Text)
        eventObj.setorganizer(organizer_name.Text)
        eventObj.setorganizer_url(organizer_url.Text)
        eventObj.setpoc_email(poc_email.Text)
        eventObj.setEventType(event_type.SelectedValue)
        eventObj.setpoc_name(poc_name.Text)
        eventObj.setpoc_phone(poc_phone.Text)
        eventObj.setDetails(txtDetails.Text)



        If (eventObj.getStartDate = eventObj.getEndDate) Then
            eventObj.setmultiday("1")
        Else
            eventObj.setmultiday("0")
        End If

        If gmiSponsored.SelectedValue = "rbsponsoredYes" Then
            eventObj.setSponsored("1")
        Else
            eventObj.setSponsored("0")
        End If

        If gmiSponsored.SelectedValue = "rbSubcommitteeYes" Then
            eventObj.setSubcommittee("1")
        Else
            eventObj.setSubcommittee("0")
        End If

        If gmiSponsored.SelectedValue = "rbRelatedYes" Then
            eventObj.setRelated("1")
        Else
            eventObj.setRelated("0")
        End If

        If featured_photo.HasFile Then
            Try
                featured_photo.SaveAs(Server.MapPath("../images/" &
                    featured_photo.FileName))

                feature_photo_response.Text = "File name: " &
                    featured_photo.PostedFile.FileName & "<br>" &
                    "File Size: " &
                    featured_photo.PostedFile.ContentLength & "<br>" &
                    "Content type: " &
                    featured_photo.PostedFile.ContentType & "<br>" &
                    "Location Saved: \images\" &
                    featured_photo.FileName
                txtfeatured_photo.Text = featured_photo.FileName
                eventObj.setphoto_url(featured_photo.FileName)
            Catch ex As Exception
                feature_photo_response.Text = "ERROR: " & ex.Message.ToString()
            End Try
        Else
            feature_photo_response.Text = "You have not specified a file."
        End If

        'eventObj.setDetails(HttpUtility.HtmlEncode(txtDetails.Text))



        Dim newEventId As String

        newEventId = clsEventDAO.insertEvent(eventObj)


        'insert into eventsectors table    
        Dim i
        Dim currentSector As String
        For i = 0 To libSectors.Items.Count - 1
            If libSectors.Items(i).Selected = True Then
                currentSector = libSectors.Items(i).Value
                clsEventDAO.insertEventSector(newEventId, currentSector)
            End If
        Next

        'Trace.Write("Sarah inserted an event.")

    End Sub

    Protected Sub SaveExistingEvent(ByVal s As Object, ByVal e As CommandEventArgs)

        Dim eventObj As clsEventVO
        eventObj = New clsEventVO
        Dim editEventId As Integer
        editEventId = Server.HtmlEncode(Request.QueryString("eventId"))

        eventObj.setEventId(editEventId)
        eventObj.setName(name.Text)
        eventObj.setCity(city.Text)
        eventObj.setState(state.Text)
        eventObj.setCountry(libPartnerCountries.SelectedValue)
        eventObj.setEventStatus(rblStatus.SelectedValue)

        eventObj.setStartDate(startDate.Text)
        eventObj.setEndDate(endDate.Text)

        eventObj.setorganizer(organizer_name.Text)
        eventObj.setorganizer_url(organizer_url.Text)
        eventObj.setevent_url(event_URL.Text)
        eventObj.setEventType(event_type.SelectedValue)
        eventObj.setpoc_name(poc_name.Text)
        eventObj.setpoc_email(poc_email.Text)
        eventObj.setpoc_phone(poc_phone.Text)




        If (eventObj.getStartDate = eventObj.getEndDate) Then
            eventObj.setmultiday("1")
        Else
            eventObj.setmultiday("0")
        End If


        If gmiSponsored.SelectedValue = "rbSponsoredYes" Then
            eventObj.setSponsored("1")
        Else
            eventObj.setSponsored("0")
        End If

        If gmiSponsored.SelectedValue = "rbSubcommitteeYes" Then
            eventObj.setSubcommittee("1")
        Else
            eventObj.setSubcommittee("0")
        End If

        If gmiSponsored.SelectedValue = "rbRelatedYes" Then
            eventObj.setRelated("1")
        Else
            eventObj.setRelated("0")
        End If

        If featured_photo.HasFile Then
            Try

                featured_photo.SaveAs(Server.MapPath("../images/" &
                    featured_photo.FileName))

                feature_photo_response.Text = "File name: " &
                    featured_photo.PostedFile.FileName & "<br>" &
                    "File Size: " &
                    featured_photo.PostedFile.ContentLength & "<br>" &
                    "Content type: " &
                    featured_photo.PostedFile.ContentType & "<br>" &
                    "Location Saved: " & Server.MapPath("../images/" &
                    featured_photo.FileName)

                txtfeatured_photo.Text = featured_photo.FileName
                'save event 2
                eventObj.setphoto_url(featured_photo.FileName)
            Catch ex As Exception
                feature_photo_response.Text = "ERROR: " & ex.Message.ToString()

            End Try
        Else
            feature_photo_response.Text = "You have not specified a file."
        End If

        'eventObj.setDetails(HttpUtility.HtmlEncode(txtDetails.Text))
        eventObj.setDetails(txtDetails.Text)

        Trace.Write("editEventId=" & editEventId)

        'edit event object in the database
        clsEventDAO.editEvent(eventObj)

        'delete current sectors
        clsEventDAO.deleteEventSectorsByEventId(editEventId)

        'insert into eventsectors table    
        Dim i
        Dim currentSector As String
        For i = 0 To libSectors.Items.Count - 1
            If libSectors.Items(i).Selected = True Then
                currentSector = libSectors.Items(i).Value
                clsEventDAO.insertEventSector(editEventId, currentSector)
            End If
        Next

        'Trace.Write("Sarah edited an event.")
    End Sub
    Protected Sub DeletePhoto(ByVal s As Object, ByVal e As CommandEventArgs) Handles btnDeletephoto.Command

        Dim eventObj As clsEventVO
        eventObj = New clsEventVO
        Dim editEventId As Integer
        editEventId = Server.HtmlEncode(Request.QueryString("eventId"))
        Dim conn As SqlConnection = Nothing
        Dim cmd As SqlCommand = Nothing
        Dim strSQL As String = String.Empty
        conn = New SqlConnection(Common.GetConnString())
        conn.Open()

        cmd = New SqlCommand(strSQL, conn)

        'security risk
        'generate sql string
        strSQL = "update events set photo_url = '' where eventId=" & editEventId
        cmd.CommandText = strSQL
        cmd.CommandType = CommandType.Text
        cmd.ExecuteNonQuery()


        feature_photo_response.Text = "Featured event photo has been deleted."
        imgPhoto.ImageUrl = ""
        existingPhoto.Visible = False
        newphoto.Visible = True


    End Sub

    Protected Sub SaveEvent2(ByVal s As Object, ByVal e As CommandEventArgs) Handles btnSave2.Command

        SaveExistingEvent(s, e)
        Response.Redirect("events.aspx?draft=true", True)

    End Sub

    Protected Sub SaveEvent3(ByVal s As Object, ByVal e As CommandEventArgs) Handles btnSave3.Command

        SaveExistingEvent(s, e)
        Dim eventid As String
        eventid = Server.HtmlEncode(Request.QueryString("eventid"))
        Response.Redirect("/news-events/stageevent_detailsByID.aspx?eventid=" & eventid, True)

    End Sub

    'Protected Sub SaveEvent4(ByVal s As Object, ByVal e As CommandEventArgs) Handles btnSave4.Command

    '    SaveNewEvent(s, e)
    '    'need to get the ID
    '    Dim eventid As String

    '    Response.Redirect("stageevent_detailsByID.aspx?eventid=" & eventid, True)

    'End Sub

    Protected Sub CancelEvent(ByVal s As Object, ByVal e As CommandEventArgs) Handles btnCancel2.Command, btnCancel1.Command
        Response.Redirect("events.aspx", True)
        'Response.Redirect("event_List.aspx")
    End Sub


    Protected Sub DeleteEvent2(ByVal s As Object, ByVal e As CommandEventArgs) Handles btnDelete2.Command
        Dim editEventId As Integer
        editEventId = Server.HtmlEncode(Request.QueryString("eventId"))
        clsEventDAO.deleteEvent(editEventId)



        Response.Redirect("events.aspx", True)
    End Sub

    'Protected Sub btnPhotoUpload_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnPhotoUpload.Click

    'End Sub




#End Region






End Class