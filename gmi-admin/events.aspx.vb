Public Class gmi_admin_events
    Inherits System.Web.UI.Page

    Private Sub Page_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load

        'If Len(Session("userid")) = 0 Then
        '    Response.Redirect("login.aspx")
        'End If

        'If Not Session("username") = "gmiweb13" Then
        '    Response.Redirect("login.aspx")
        'End If

        Dim _draft As String = IIf(IsNothing(Server.HtmlEncode(Request.QueryString("draft"))), False, Server.HtmlEncode(Request.QueryString("draft")))
        Dim _sortField As String = IIf(IsNothing(Server.HtmlEncode(Request.QueryString("SortField"))), "StartDate", Server.HtmlEncode(Request.QueryString("SortField")))
        Dim _sortOrder As String = IIf(IsNothing(Server.HtmlEncode(Request.QueryString("SortOrder"))), "ASC", Server.HtmlEncode(Request.QueryString("SortOrder")))


        _sortOrder = IIf(_sortOrder = "ASC", "DESC", "ASC")


        If Not IsPostBack Then
            'Trace.Warn("not ispostback")

            Dim dt As DataTable = Nothing
            If _draft = True Then
                dt = clsEventDAO.getAllEventsbyStatus(_sortOrder, _sortField, "draft")
            ElseIf _draft = False Then
                dt = clsEventDAO.getAllEventsbyStatus(_sortOrder, _sortField, "final")
            Else
                dt = clsEventDAO.getAllEvents(_sortOrder, _sortField)
            End If


            Dim myLabel As Label

            Dim tempStr As String
            LitEventList.Text = ""
            Dim sortStr1 As String
            Dim sortStr2 As String
            Dim sortStr3 As String
            Dim sortStr4 As String
            Dim sortStr5 As String

            sortStr1 = "<th width='40%'>Events</th>"
            sortStr2 = "<th width='10%'>Start Month</th><th width='10%'>Year</th>"
            sortStr3 = "<th width='20%'>Sector</th>"
            sortStr4 = "<th width='20%'>Country</th>"
            sortStr5 = "<th width='20%'>Preview</th>"


            tempStr = "<table  class='display' id='resourcelist'>" &
            "<thead><tr>" & sortStr1 & sortStr2 & sortStr3 & sortStr4 & sortStr5 & "</tr></thead><tbody>"
            myLabel = New Label
            LitEventList.Text += tempStr


            For x = 0 To dt.Rows.Count - 1
                myLabel = New Label

                Dim eventId As String
                eventId = dt.Rows(x)("eventId")

                Dim editLink As String
                editLink = "<a href='event_create.aspx?mode=E&eventId=" & eventId & "'>"

                Dim currentInfo As String

                currentInfo = "<tr class='td-entry' valign='Top'><td>" & editLink & dt.Rows(x)("name") & "</a></td>" &
                "<td>" & Common.getMonthFormatDisplay(dt.Rows(x)("startDate")) & "</td>" &
                "<td>" & Common.getYearFormatDisplay(dt.Rows(x)("startDate")) & "</td>" &
                "<td>" & dt.Rows(x)("sectors") & "</td>" &
                "<td>" & dt.Rows(x)("countries") & "</td>"
                If LCase(dt.Rows(x)("Status")) = "final" Then
                    currentInfo += "<td><a target='_blank' href='/news-events/event_detailsByID.aspx?eventid=" & dt.Rows(x)("eventid") & "'>" & UCase(dt.Rows(x)("status")) & "</a></td>"
                Else
                    currentInfo += "<td><a href='/news-events/stageevent_detailsbyID.aspx?eventid=" & dt.Rows(x)("eventid") & "'>" & UCase(dt.Rows(x)("status")) & "</a></td>"
                End If

                currentInfo += "</tr>"
                LitEventList.Text += currentInfo

            Next

            tempStr = "</tbody></table>"
            myLabel = New Label
            myLabel.Text = tempStr
            LitEventList.Text += tempStr


        End If
    End Sub



End Class