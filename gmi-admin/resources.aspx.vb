Public Class gmi_admin_resources
    Inherits System.Web.UI.Page

    Private Sub Page_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load

        Dim _sortField As String = IIf(IsNothing(Server.HtmlEncode(Request.QueryString("SortField"))), "resourceYear", Server.HtmlEncode(Request.QueryString("SortField")))
        Dim _sortOrder As String = IIf(IsNothing(Server.HtmlEncode(Request.QueryString("SortOrder"))), "ASC", Server.HtmlEncode(Request.QueryString("SortOrder")))

        _sortOrder = IIf(_sortOrder = "ASC", "DESC", "DESC")
        LitResourceList.Text = ""


        If Not IsPostBack Then
            'Trace.Warn("not ispostback")

            Dim dt As DataTable = Nothing

            dt = clsResourceDAO.getAllResources(_sortOrder, _sortField, "")

            Dim myLabel As Label

            Dim tempStr As String
            Dim sortStr1 As String
            Dim sortStr2 As String
            Dim sortStr3 As String
            Dim sortStr4 As String
            Dim sortStr5 As String
            Dim sortStr6 As String
            'Dim sortStr7 As String

            sortStr1 = "<th width='25%'>Name</th>"
            sortStr2 = "<th width='10%'>Year</th>"
            sortStr3 = "<th width='12%'>Event</th>"
            sortStr4 = "<th width='12%'>Event ID</th>"
            sortStr5 = "<th width='12%'>Language</th>"
            'sortStr7 = "<th width='12%'>Sector</th>"
            'sortStr6 = "<th width='20%'>Related Resource</th>"
            sortStr6 = "<th width='10%'>Status</th><th width='10%'>Preview</th>"

            tempStr = "<table class='display' id='resourcelist'>" &
            "<thead><tr>" & sortStr1 & sortStr2 & sortStr3 & sortStr4 & sortStr5 & sortStr6 & "</tr></thead><tbody>"
            myLabel = New Label
            LitResourceList.Text += tempStr


            For x = 0 To dt.Rows.Count - 1
                myLabel = New Label

                Dim ResourceId As String
                ResourceId = dt.Rows(x)("ResourceId")

                Dim editLink As String
                editLink = "<a href='Resource_create.aspx?mode=E&ResourceId=" & ResourceId & "'>"

                Dim currentInfo As String

                currentInfo = "<tr><td>" & editLink & dt.Rows(x)("resourcename") & "</a></td>" &
                "<td>" & dt.Rows(x)("resourceYear") &
                "</td><td><a href='/news-events/stageevent_detailsbyId.aspx?&eventid=" & dt.Rows(x)("eventid") & "' >" & dt.Rows(x)("eventName") & "</a>" &
                 "</td><td>" & dt.Rows(x)("eventid") &
                "</td><td>" & dt.Rows(x)("resourceLanguage") &
                "</td><td>" & dt.Rows(x)("status") & "</td><td><a href='/tools-resources/resource_details.aspx?r=" & ResourceId & "' >Preview</a></td></tr>"

                '"</td><td><a href='resource_create.aspx?resourceid=" & dt.Rows(x)("resourceParentID") & "'>" & dt.Rows(x)("parentResourceName") & "</a>" & _
                myLabel.Text = currentInfo

                LitResourceList.Text += currentInfo
            Next

            tempStr = "</tbody></table>"
            myLabel = New Label
            LitResourceList.Text += tempStr



        End If
    End Sub



End Class