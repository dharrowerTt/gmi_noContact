
Imports System.Data
Imports System.Data.SqlClient

Public Class event_List_old

    Inherits System.Web.UI.Page

#Region " Web Form Designer Generated Code "

    'This call is required by the Web Form Designer.
    <System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()

    End Sub

    'NOTE: The following placeholder declaration is required by the Web Form Designer.
    'Do not delete or move it.
    Private designerPlaceholderDeclaration As System.Object

    Private Sub Page_Init(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Init
        'CODEGEN: This method call is required by the Web Form Designer
        'Do not modify it using the code editor.
        InitializeComponent()
    End Sub


    Protected WithEvents ph1 As System.Web.UI.WebControls.PlaceHolder


#End Region

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
            Dim sortStr1 As String
            Dim sortStr2 As String
            Dim sortStr3 As String
            Dim sortStr4 As String
            Dim sortStr5 As String

            sortStr1 = "<th width='40%'>Events</th>"
            sortStr2 = "<th width='20%'>Start Date</th>"
            sortStr3 = "<th width='20%'>Sector</th>"
            sortStr4 = "<th width='20%'>Country</th>"
            sortStr5 = "<th width='20%'>Preview</th>"


            tempStr = "<table  class='display' id='resourcelist'>" & _
            "<thead><tr>" & sortStr1 & sortStr2 & sortStr3 & sortStr4 & sortStr5 & "</tr></thead><tbody>"
            myLabel = New Label
            myLabel.Text = tempStr
            ph1.Controls.Add(myLabel)

            For x = 0 To dt.Rows.Count - 1
                myLabel = New Label

                Dim eventId As String
                eventId = dt.Rows(x)("eventId")

                Dim editLink As String
                editLink = "<a href='event_create.aspx?mode=E&eventId=" & eventId & "'>"

                Dim currentInfo As String

                currentInfo = "<tr class='td-entry' valign='Top'><td>" & editLink & dt.Rows(x)("name") & "</a></td>" & _
                "<td>" & Common.getDateFormatDisplay(dt.Rows(x)("startDate")) & "</td>" & _
                "<td>" & dt.Rows(x)("sectors") & "</td>" & _
                "<td>" & dt.Rows(x)("countries") & "</td>"
                If LCase(dt.Rows(x)("Status")) = "final" Then
                    currentInfo += "<td><a target='_blank' href='/events/details.aspx?eventid=" & dt.Rows(x)("eventid") & "'>" & UCase(dt.Rows(x)("status")) & "</a></td>"
                Else
                    currentInfo += "<td><a href='/events/details.aspx?eventid=" & dt.Rows(x)("eventid") & "'>" & UCase(dt.Rows(x)("status")) & "</a></td>"
                End If

                currentInfo += "</tr>"
                myLabel.Text = currentInfo
                ph1.Controls.Add(myLabel)
            Next

            tempStr = "</tbody></table>"
            myLabel = New Label
            myLabel.Text = tempStr
            ph1.Controls.Add(myLabel)


        End If
    End Sub
End Class
