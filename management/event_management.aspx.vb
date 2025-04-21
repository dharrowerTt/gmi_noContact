Imports System.Data
Imports System.Data.SqlClient
Imports System.IO

Partial Class event_management
    Inherits System.Web.UI.Page

    Private editEventId As Integer?

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            ' Set editEventId from query string and save it in ViewState
            editEventId = GetEditEventIdFromQuery()
            If editEventId.HasValue Then
                ViewState("editEventId") = editEventId ' Save editEventId in ViewState
                LoadEventData(editEventId.Value)
                lblError.Text = $"Editing event with ID: {editEventId.Value}"
            Else
                lblError.Text = "Creating a new event"
            End If

            ' Load dropdowns only once on initial load
            LoadCountries()
            LoadSectors()
        Else
            ' Retrieve editEventId from ViewState on postback
            If ViewState("editEventId") IsNot Nothing Then
                editEventId = Convert.ToInt32(ViewState("editEventId"))
            End If
        End If
    End Sub

    Private Function GetEditEventIdFromQuery() As Integer?
        Dim tempEventId As Integer
        If Integer.TryParse(Request.QueryString("eventId"), tempEventId) Then
            Return tempEventId
        End If
        Return Nothing
    End Function

    ' Load event data for editing and set selected sectors and country
    Private Sub LoadEventData(ByVal eventId As Integer)
        Dim connString As String = Common.GetConnString()
        Using conn As New SqlConnection(connString)
            conn.Open()

            ' Load event details
            Using cmd As New SqlCommand("SELECT * FROM events WHERE eventId = @eventId", conn)
                cmd.Parameters.AddWithValue("@eventId", eventId)
                Using reader As SqlDataReader = cmd.ExecuteReader()
                    If reader.Read() Then
                        txtEventName.Text = reader("name").ToString()
                        txtCity.Text = reader("city").ToString()

                        ' Set the selected country value
                        ddlCountry.SelectedValue = reader("country").ToString()

                        txtStartDate.Text = Convert.ToDateTime(reader("startDate")).ToString("yyyy-MM-dd")
                        txtEndDate.Text = Convert.ToDateTime(reader("endDate")).ToString("yyyy-MM-dd")
                        txtDescription.Text = reader("details").ToString()
                        rblStatus.SelectedValue = reader("eventstatus").ToString()
                        txtPOCName.Text = reader("poc_name").ToString()
                        txtPOCPhone.Text = reader("poc_phone").ToString()
                        txtPOCEmail.Text = reader("poc_email").ToString()
                        txtOrganizerName.Text = reader("organizer").ToString()
                        txtOrganizerURL.Text = reader("organizer_URL").ToString()
                        txtEventURL.Text = reader("event_URL").ToString()
                        txtState.Text = reader("state").ToString()

                        ' Set GMI Role
                        If Convert.ToBoolean(reader("Sponsored")) Then
                            rblGMIRole.SelectedValue = "sponsored"
                        ElseIf Convert.ToBoolean(reader("Subcommittee")) Then
                            rblGMIRole.SelectedValue = "subcommittee"
                        ElseIf Convert.ToBoolean(reader("related")) Then
                            rblGMIRole.SelectedValue = "related"
                        End If

                        ' Display photo if exists
                        If Not IsDBNull(reader("photo_url")) AndAlso reader("photo_url").ToString() <> "" Then
                            imgPhoto.ImageUrl = "~/assets/images/" & reader("photo_url").ToString()
                            imgPhoto.Visible = True
                        End If
                    End If
                End Using
            End Using

            ' Now, load the selected sectors and set them in the list box
            LoadSelectedSectors(eventId)
        End Using
    End Sub

    Private Sub LoadSelectedSectors(ByVal eventId As Integer)
        ' Load selected sectors for the event and set them in the listbox
        Dim connString As String = Common.GetConnString()
        Using conn As New SqlConnection(connString)
            conn.Open()

            ' Retrieve selected sectors for the event
            Using sectorsCmd As New SqlCommand("SELECT sectorId FROM eventSectors WHERE eventId = @eventId", conn)
                sectorsCmd.Parameters.AddWithValue("@eventId", eventId)
                Using sectorsReader As SqlDataReader = sectorsCmd.ExecuteReader()
                    While sectorsReader.Read()
                        Dim sectorId As String = sectorsReader("sectorId").ToString()
                        ' Find the corresponding ListItem and set it as selected
                        Dim item As ListItem = ddlSector.Items.FindByValue(sectorId)
                        If item IsNot Nothing Then
                            item.Selected = True
                        End If
                    End While
                End Using
            End Using
        End Using
    End Sub

    Private Sub LoadCountries()
        ' Populate country dropdown from the database (only once, not on postback)
        Dim connString As String = Common.GetConnString()
        Using conn As New SqlConnection(connString)
            Using cmd As New SqlCommand("SELECT eventCountryID, CountryName FROM lu_country ORDER BY CountryName", conn)
                conn.Open()
                ddlCountry.DataSource = cmd.ExecuteReader()
                ddlCountry.DataTextField = "CountryName"
                ddlCountry.DataValueField = "eventCountryID"
                ddlCountry.DataBind()
            End Using
        End Using
    End Sub

    Private Sub LoadSectors()
        ' Load sectors into the listbox
        Dim dv As DataView = clsLookup.GetSectorsForEventsByLookupTable()
        ddlSector.DataTextField = "sector"
        ddlSector.DataValueField = "sectorAbbr"
        ddlSector.DataSource = dv
        ddlSector.DataBind()

        ' Set the selected sectors if editing an event
        If editEventId.HasValue Then
            LoadSelectedSectors(editEventId.Value)
        End If
    End Sub

    ' Save or update the event
    Protected Sub btnSave_Click(ByVal sender As Object, ByVal e As EventArgs)
        If Page.IsValid Then
            Dim connString As String = Common.GetConnString()
            Dim photoUrl As String = ""
            Dim username As String = Session("LoggedInUser").ToString()
            Dim userId As Integer = GetUserIdByUsername(username)
            Dim action As String = If(editEventId.HasValue, "Edit Event", "Create Event")
            Dim eventId As Integer = 0  ' Declare eventId here to be used in both Insert and Update blocks

            Using conn As New SqlConnection(connString)
                conn.Open()
                Using trans As SqlTransaction = conn.BeginTransaction()
                    Try
                        Dim cmd As SqlCommand
                        If editEventId.HasValue Then
                            ' Update existing event
                            cmd = New SqlCommand("
                            UPDATE events SET 
                                name = @name, 
                                city = @city, 
                                country = @country, 
                                startDate = @startDate, 
                                endDate = @endDate, 
                                Sponsored = @Sponsored, 
                                Subcommittee = @Subcommittee, 
                                related = @related, 
                                details = @details, 
                                lastModifiedDate = @lastModifiedDate, 
                                lastModifiedBy = @lastModifiedBy, 
                                state = @state, 
                                multiday = @multiday, 
                                poc_name = @poc_name, 
                                poc_phone = @poc_phone, 
                                poc_email = @poc_email, 
                                organizer = @organizer, 
                                organizer_URL = @organizer_URL, 
                                event_URL = @event_URL, 
                                eventstatus = @eventstatus 
                            WHERE eventId = @eventId", conn, trans)

                            ' Set parameters for UPDATE
                            cmd.Parameters.AddWithValue("@name", txtEventName.Text)
                            cmd.Parameters.AddWithValue("@city", txtCity.Text)
                            cmd.Parameters.AddWithValue("@country", ddlCountry.SelectedValue)
                            cmd.Parameters.AddWithValue("@startDate", txtStartDate.Text)
                            cmd.Parameters.AddWithValue("@endDate", txtEndDate.Text)
                            cmd.Parameters.AddWithValue("@Sponsored", If(rblGMIRole.SelectedValue = "sponsored", 1, 0))
                            cmd.Parameters.AddWithValue("@Subcommittee", If(rblGMIRole.SelectedValue = "subcommittee", 1, 0))
                            cmd.Parameters.AddWithValue("@related", If(rblGMIRole.SelectedValue = "related", 1, 0))
                            cmd.Parameters.AddWithValue("@details", txtDescription.Text)
                            cmd.Parameters.AddWithValue("@lastModifiedDate", DateTime.Now)
                            cmd.Parameters.AddWithValue("@lastModifiedBy", userId)
                            cmd.Parameters.AddWithValue("@state", txtState.Text)
                            cmd.Parameters.AddWithValue("@multiday", If(Date.Parse(txtEndDate.Text) > Date.Parse(txtStartDate.Text), 1, 0))
                            cmd.Parameters.AddWithValue("@poc_name", If(String.IsNullOrEmpty(txtPOCName.Text), DBNull.Value, txtPOCName.Text))
                            cmd.Parameters.AddWithValue("@poc_phone", If(String.IsNullOrEmpty(txtPOCPhone.Text), DBNull.Value, txtPOCPhone.Text))
                            cmd.Parameters.AddWithValue("@poc_email", If(String.IsNullOrEmpty(txtPOCEmail.Text), DBNull.Value, txtPOCEmail.Text))
                            cmd.Parameters.AddWithValue("@organizer", If(String.IsNullOrEmpty(txtOrganizerName.Text), DBNull.Value, txtOrganizerName.Text))
                            cmd.Parameters.AddWithValue("@organizer_URL", If(String.IsNullOrEmpty(txtOrganizerURL.Text), DBNull.Value, txtOrganizerURL.Text))
                            cmd.Parameters.AddWithValue("@event_URL", If(String.IsNullOrEmpty(txtEventURL.Text), DBNull.Value, txtEventURL.Text))
                            cmd.Parameters.AddWithValue("@eventstatus", rblStatus.SelectedValue)
                            cmd.Parameters.AddWithValue("@eventId", editEventId.Value) ' Update the eventId

                            ' Execute the update query
                            cmd.ExecuteNonQuery()
                            eventId = editEventId.Value ' Set eventId from editEventId for use in other sections
                        Else
                            ' Insert new event
                            cmd = New SqlCommand("
                            INSERT INTO events 
                            (name, city, country, startDate, endDate, Sponsored, Subcommittee, related, details, 
                             lastModifiedDate, lastModifiedBy, state, multiday, poc_name, poc_phone, poc_email, 
                             organizer, organizer_URL, event_URL, eventstatus) 
                            OUTPUT INSERTED.eventId 
                            VALUES (@name, @city, @country, @startDate, @endDate, @Sponsored, @Subcommittee, @related, 
                                    @details, @lastModifiedDate, @lastModifiedBy, @state, @multiday, @poc_name, 
                                    @poc_phone, @poc_email, @organizer, @organizer_URL, @event_URL, @eventstatus)", conn, trans)

                            ' Set parameters for INSERT
                            cmd.Parameters.AddWithValue("@name", txtEventName.Text)
                            cmd.Parameters.AddWithValue("@city", txtCity.Text)
                            cmd.Parameters.AddWithValue("@country", ddlCountry.SelectedValue)
                            cmd.Parameters.AddWithValue("@startDate", txtStartDate.Text)
                            cmd.Parameters.AddWithValue("@endDate", txtEndDate.Text)
                            cmd.Parameters.AddWithValue("@Sponsored", If(rblGMIRole.SelectedValue = "sponsored", 1, 0))
                            cmd.Parameters.AddWithValue("@Subcommittee", If(rblGMIRole.SelectedValue = "subcommittee", 1, 0))
                            cmd.Parameters.AddWithValue("@related", If(rblGMIRole.SelectedValue = "related", 1, 0))
                            cmd.Parameters.AddWithValue("@details", txtDescription.Text)
                            cmd.Parameters.AddWithValue("@lastModifiedDate", DateTime.Now)
                            cmd.Parameters.AddWithValue("@lastModifiedBy", userId)
                            cmd.Parameters.AddWithValue("@state", txtState.Text)
                            cmd.Parameters.AddWithValue("@multiday", If(Date.Parse(txtEndDate.Text) > Date.Parse(txtStartDate.Text), 1, 0))
                            cmd.Parameters.AddWithValue("@poc_name", If(String.IsNullOrEmpty(txtPOCName.Text), DBNull.Value, txtPOCName.Text))
                            cmd.Parameters.AddWithValue("@poc_phone", If(String.IsNullOrEmpty(txtPOCPhone.Text), DBNull.Value, txtPOCPhone.Text))
                            cmd.Parameters.AddWithValue("@poc_email", If(String.IsNullOrEmpty(txtPOCEmail.Text), DBNull.Value, txtPOCEmail.Text))
                            cmd.Parameters.AddWithValue("@organizer", If(String.IsNullOrEmpty(txtOrganizerName.Text), DBNull.Value, txtOrganizerName.Text))
                            cmd.Parameters.AddWithValue("@organizer_URL", If(String.IsNullOrEmpty(txtOrganizerURL.Text), DBNull.Value, txtOrganizerURL.Text))
                            cmd.Parameters.AddWithValue("@event_URL", If(String.IsNullOrEmpty(txtEventURL.Text), DBNull.Value, txtEventURL.Text))
                            cmd.Parameters.AddWithValue("@eventstatus", rblStatus.SelectedValue)

                            ' Execute the insert query and get the inserted event ID
                            eventId = Convert.ToInt32(cmd.ExecuteScalar())
                        End If

                        ' Handle file upload (replace existing photo if a new file is provided)
                        If fileFeaturedPhoto.HasFile Then
                            Dim photoPath As String = Server.MapPath("~/assets/images/" & eventId & Path.GetExtension(fileFeaturedPhoto.FileName))
                            fileFeaturedPhoto.SaveAs(photoPath)
                            photoUrl = eventId & Path.GetExtension(fileFeaturedPhoto.FileName)

                            ' Update event with new photo URL
                            Dim updatePhotoCmd As New SqlCommand("UPDATE events SET photo_url = @photo_url WHERE eventId = @eventId", conn, trans)
                            updatePhotoCmd.Parameters.AddWithValue("@photo_url", photoUrl)
                            updatePhotoCmd.Parameters.AddWithValue("@eventId", eventId)
                            updatePhotoCmd.ExecuteNonQuery()
                        End If

                        ' Update sectors for the event
                        Dim deleteSectorsCmd As New SqlCommand("DELETE FROM eventSectors WHERE eventId = @eventId", conn, trans)
                        deleteSectorsCmd.Parameters.AddWithValue("@eventId", eventId)
                        deleteSectorsCmd.ExecuteNonQuery()

                        For Each item As ListItem In ddlSector.Items
                            If item.Selected Then
                                Dim insertSectorCmd As New SqlCommand("INSERT INTO eventSectors (eventId, sectorId) VALUES (@eventId, @sectorId)", conn, trans)
                                insertSectorCmd.Parameters.AddWithValue("@eventId", eventId)
                                insertSectorCmd.Parameters.AddWithValue("@sectorId", item.Value)
                                insertSectorCmd.ExecuteNonQuery()
                            End If
                        Next

                        ' Log action in audit log
                        Dim logCmd As New SqlCommand("INSERT INTO management_audit_log (user_id, action, action_time, details) VALUES (@user_id, @action, @action_time, @details)", conn, trans)
                        logCmd.Parameters.AddWithValue("@user_id", userId)
                        logCmd.Parameters.AddWithValue("@action", action)
                        logCmd.Parameters.AddWithValue("@action_time", DateTime.Now)
                        logCmd.Parameters.AddWithValue("@details", eventId)
                        logCmd.ExecuteNonQuery()

                        ' Commit transaction
                        trans.Commit()

                        ' Display success alert with a link to view the event
                        lblSuccess.Text = $"Event {(If(editEventId.HasValue, "updated", "created"))} successfully! <a href='https://globalmethane.org/events/details.aspx?eventid={eventId}' target='_blank'>View Event</a>"
                        successAlert.Visible = True
                        lblError.Visible = False
                        ClearInputs()

                    Catch ex As Exception
                        trans.Rollback()
                        lblError.Text = "Error saving event: " & ex.Message
                        lblError.Visible = True
                        successAlert.Visible = False
                    End Try
                End Using
            End Using
        End If
    End Sub

    Private Function GetUserIdByUsername(ByVal username As String) As Integer
        Dim userId As Integer = 0
        Dim connString As String = Common.GetConnString()
        Using conn As New SqlConnection(connString)
            Using cmd As New SqlCommand("SELECT user_id FROM management_users WHERE username = @username", conn)
                cmd.Parameters.AddWithValue("@username", username)
                conn.Open()
                Dim result = cmd.ExecuteScalar()
                If result IsNot Nothing Then
                    userId = Convert.ToInt32(result)
                End If
            End Using
        End Using
        Return userId
    End Function

    Private Sub ClearInputs()
        txtEventName.Text = ""
        txtCity.Text = ""
        ddlCountry.SelectedIndex = -1
        txtStartDate.Text = ""
        txtEndDate.Text = ""
        txtDescription.Text = ""
        rblStatus.ClearSelection()
        txtPOCName.Text = ""
        txtPOCPhone.Text = ""
        txtPOCEmail.Text = ""
        txtOrganizerName.Text = ""
        txtOrganizerURL.Text = ""
        txtEventURL.Text = ""
        txtState.Text = ""
        rblGMIRole.ClearSelection()
        ddlSector.ClearSelection()
        imgPhoto.ImageUrl = ""
        imgPhoto.Visible = False
    End Sub

    Protected Sub btnEventList_Click(ByVal sender As Object, ByVal e As EventArgs)
        ' Redirect to the event management page without the eventId for new event creation
        Response.Redirect("events.aspx")
    End Sub

End Class
