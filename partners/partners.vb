Imports System.IO
Imports System.Text
Imports System.Data
Imports System.Data.SqlClient

Public Class zpartnersCommonCode

    Inherits System.Web.UI.Page

#Region " Web Form Designer Generated Code "

    'This call is required by the Web Form Designer.
    <System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()

    End Sub
    Protected WithEvents ph2 As System.Web.UI.WebControls.PlaceHolder
    Protected WithEvents ph3 As System.Web.UI.WebControls.PlaceHolder
    Protected WithEvents ph4 As System.Web.UI.WebControls.PlaceHolder
    Protected WithEvents ph5 As System.Web.UI.WebControls.PlaceHolder

    Protected WithEvents countryName As System.Web.UI.WebControls.Literal
    'Protected WithEvents jcTest As System.Web.UI.WebControls.Literal

    'NOTE: The following placeholder declaration is required by the Web Form Designer.
    'Do not delete or move it.
    Private designerPlaceholderDeclaration As System.Object

    Private Sub Page_Init(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Init
        'CODEGEN: This method call is required by the Web Form Designer
        'Do not modify it using the code editor.
        InitializeComponent()
    End Sub

    Protected WithEvents ph1 As System.Web.UI.WebControls.PlaceHolder

    Private countryId As String
#End Region

    Private Sub Page_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        'Put user code to initialize the page here      

        If Not IsPostBack Then
            countryId = "3"     'example Brazil countryId=3 agri sector

            ' test code by johnc / needs to be Select Case, ideally which is built dynamically using
            ' l_partnerCountry from the database - jc
            If countryName.Text = "Brazil" Then
                countryId = "3"
            Else
                countryId = "5"
            End If
            'jcTest.Text = countryName.Text

            Dim dt As New DataTable
            dt = clsEventDAO.getEventDetailsBySectorAndCountry("agri", countryId)

            Dim x

            Dim eventId As String
            Dim startDateValue As String
            Dim endDateValue As String
            Dim nameValue As String
            Dim cityValue As String
            Dim countryValue As String
            Dim sectorValue As String
            Dim detailsValue As String

            For x = 0 To dt.Rows.Count - 1
                eventId = dt.Rows(x)("eventId")
                nameValue = dt.Rows(x)("name")
                cityValue = dt.Rows(x)("city")
                countryValue = dt.Rows(x)("country")
                startDateValue = Common.getDateFormatDisplay(dt.Rows(x)("startDate"))

                Dim myLabel As Literal

                myLabel = New Literal
                myLabel.Text = "<li>" & startDateValue
                ph1.Controls.Add(myLabel)

                myLabel = New Literal
                myLabel.Text = " <a href=""../news-events/event_detailsByEventId.aspx?eventId=" & eventId & """>" & nameValue & "</a>, "
                ph1.Controls.Add(myLabel)

                myLabel = New Literal
                myLabel.Text = cityValue & ", " & countryValue & "</li>"
                ph1.Controls.Add(myLabel)
            Next

            For x = 0 To dt.Rows.Count - 1
                eventId = dt.Rows(x)("eventId")
                nameValue = dt.Rows(x)("name")
                cityValue = dt.Rows(x)("city")
                countryValue = dt.Rows(x)("country")
                startDateValue = Common.getDateFormatDisplay(dt.Rows(x)("startDate"))

                Dim myLabel As Literal

                myLabel = New Literal
                myLabel.Text = "<li>" & startDateValue
                ph2.Controls.Add(myLabel)

                myLabel = New Literal
                myLabel.Text = " <a href=""../news-events/event_detailsByEventId.aspx?eventId=" & eventId & """>" & nameValue & "</a>, "
                ph2.Controls.Add(myLabel)

                myLabel = New Literal
                myLabel.Text = cityValue & ", " & countryValue & "</li>"
                ph2.Controls.Add(myLabel)
            Next

            For x = 0 To dt.Rows.Count - 1
                eventId = dt.Rows(x)("eventId")
                nameValue = dt.Rows(x)("name")
                cityValue = dt.Rows(x)("city")
                countryValue = dt.Rows(x)("country")
                startDateValue = Common.getDateFormatDisplay(dt.Rows(x)("startDate"))

                Dim myLabel As Literal

                myLabel = New Literal
                myLabel.Text = "<li>" & startDateValue
                ph3.Controls.Add(myLabel)

                myLabel = New Literal
                myLabel.Text = " <a href=""../news-events/event_detailsByEventId.aspx?eventId=" & eventId & """>" & nameValue & "</a>, "
                ph3.Controls.Add(myLabel)

                myLabel = New Literal
                myLabel.Text = cityValue & ", " & countryValue & "</li>"
                ph3.Controls.Add(myLabel)
            Next

            For x = 0 To dt.Rows.Count - 1
                eventId = dt.Rows(x)("eventId")
                nameValue = dt.Rows(x)("name")
                cityValue = dt.Rows(x)("city")
                countryValue = dt.Rows(x)("country")
                startDateValue = Common.getDateFormatDisplay(dt.Rows(x)("startDate"))

                Dim myLabel As Literal

                myLabel = New Literal
                myLabel.Text = "<li>" & startDateValue
                ph4.Controls.Add(myLabel)

                myLabel = New Literal
                myLabel.Text = " <a href=""../news-events/event_detailsByEventId.aspx?eventId=" & eventId & """>" & nameValue & "</a>, "
                ph4.Controls.Add(myLabel)

                myLabel = New Literal
                myLabel.Text = cityValue & ", " & countryValue & "</li>"
                ph4.Controls.Add(myLabel)
            Next

            For x = 0 To dt.Rows.Count - 1
                eventId = dt.Rows(x)("eventId")
                nameValue = dt.Rows(x)("name")
                cityValue = dt.Rows(x)("city")
                countryValue = dt.Rows(x)("country")
                startDateValue = Common.getDateFormatDisplay(dt.Rows(x)("startDate"))

                Dim myLabel As Literal

                myLabel = New Literal
                myLabel.Text = "<li>" & startDateValue
                ph5.Controls.Add(myLabel)

                myLabel = New Literal
                myLabel.Text = " <a href=""../news-events/event_detailsByEventId.aspx?eventId=" & eventId & """>" & nameValue & "</a>, "
                ph5.Controls.Add(myLabel)

                myLabel = New Literal
                myLabel.Text = cityValue & ", " & countryValue & "</li>"
                ph5.Controls.Add(myLabel)
            Next
        Else
            Trace.Warn("ispostback")
        End If
    End Sub
End Class
