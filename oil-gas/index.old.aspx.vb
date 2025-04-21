Imports System.IO
Imports System.Text
Imports System.Data
Imports System.Data.SqlClient

Public Class sector_oilngas_details
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

    Private currentMon As String
    Private currentYear As String

#End Region

    Private Sub Page_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        'Put user code to initialize the page here


        If Not IsPostBack Then
            Dim dt As DataTable
            dt = clsEventDAO.getEventDetailsBySector("oilngas")


            Dim eventId As String
            Dim startDateValue As String
            Dim endDateValue As String
            Dim nameValue As String
            Dim cityValue As String
            Dim countryValue As String
            Dim sectorValue As String
            Dim detailsValue As String

            Dim myLabel As Literal

            myLabel = New Literal
            myLabel.Text = "<ul id=""sectorevents"">"
            ph1.Controls.Add(myLabel)

            Dim x
            For x = 0 To dt.Rows.Count - 1
                eventId = dt.Rows(x)("eventId")
                nameValue = dt.Rows(x)("name")
                cityValue = dt.Rows(x)("city")
                countryValue = dt.Rows(x)("country")

                startDateValue = Common.getDateFormatDisplay(dt.Rows(x)("startDate"))
                endDateValue = Common.getDateFormatDisplay(dt.Rows(x)("endDate"))

                'detailsValue = dt.Rows(x)("details")

                'get sector desc 
                Dim sectDescStr
                Dim sectors As DataTable
                sectors = clsEventDAO.getEventSectorsByEventId(eventId)
                Dim y
                For y = 0 To sectors.Rows.Count - 1
                    Dim desc As String
                    desc = sectors.Rows(y)("sectorDesc")
                    If y = 0 Then
                        sectDescStr = desc
                    Else
                        sectDescStr = sectDescStr & ", " & desc
                    End If
                Next
                sectorValue = sectDescStr


                myLabel = New Literal
                myLabel.Text = "<li><span class=""date"">" & startDateValue & "</span>"
                ph1.Controls.Add(myLabel)

                myLabel = New Literal
                myLabel.Text = "<br /><a href=""../news-events/event_detailsByEventId.aspx?eventId=" & eventId & """>" & nameValue & "</a>"
                ph1.Controls.Add(myLabel)

                myLabel = New Literal
                If (countryValue.Equals("N/A")) Then 'Ignore country name if selection equals N/A
                    myLabel.Text = "<br />" & "<strong>" & cityValue & "</strong></li>"
                Else
                    myLabel.Text = "<br />" & "<strong>" & cityValue & ", " & countryValue & "</strong></li>"
                End If
                ph1.Controls.Add(myLabel)
            Next

            myLabel = New Literal
            myLabel.Text = "</ul>"
            ph1.Controls.Add(myLabel)

        Else
            Trace.Warn("ispostback")
        End If
    End Sub

End Class
