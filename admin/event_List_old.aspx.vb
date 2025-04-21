
Imports System.Data
Imports System.Data.SqlClient

Public Class event_List

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

        If Len(Session("userid")) = 0 Then
           Response.Redirect("login.aspx")
        End If


        Dim _sortField As String = IIf(IsNothing(Server.HtmlEncode(Request.QueryString("SortField"))), "StartDate", Server.HtmlEncode(Request.QueryString("SortField")))
        Dim _sortOrder As String = IIf(IsNothing(Server.HtmlEncode(Request.QueryString("SortOrder"))), "ASC", Server.HtmlEncode(Request.QueryString("SortOrder")))

         _sortOrder = IIf(_sortOrder = "ASC", "DESC", "ASC")


        If Not IsPostBack Then
            'Trace.Warn("not ispostback")

            Dim dt As DataTable

            dt = clsEventDAO.getAllEvents(_sortOrder, _sortField)

            Dim myLabel As Label

            Dim tempStr As String
            Dim sortStr1 As String
            Dim sortStr2 As String


            sortStr1 = "<th width='381'><a href='event_List.aspx?SortField=" & "Name" & "&SortOrder=" & _sortOrder & "'>Events</a></th>"
            sortStr2 = "<th width='161'><a href='event_List.aspx?SortField=" & "StartDate" & "&SortOrder=" & _sortOrder & "'>Start Date</a></th>"


            tempStr = "<table cellspacing='0' cellpadding='3' rules='all' bordercolor='#dae4ed' border='1' id='dgContacts' bgcolor='White' width='500'>" & _
            "<tr class='td-title' valign='Top' bgcolor='#f6f9fc'>" & sortStr1 & sortStr2 & "</tr>"
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
                "<td>" & Common.getDateFormatDisplay(dt.Rows(x)("startDate")) & "</td></tr>"
                myLabel.Text = currentInfo
                ph1.Controls.Add(myLabel)
            Next

            tempStr = "</table>"
            myLabel = New Label
            myLabel.Text = tempStr
            ph1.Controls.Add(myLabel)

 
        End If
    End Sub
End Class
