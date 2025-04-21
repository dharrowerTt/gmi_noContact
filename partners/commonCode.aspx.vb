Public Class partnersCommoncode
    Inherits System.Web.UI.Page

#Region " Web Form Designer Generated Code "

    'This call is required by the Web Form Designer.
    <System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()

    End Sub


    Protected WithEvents ph1 As System.Web.UI.WebControls.PlaceHolder
    Protected WithEvents ph2 As System.Web.UI.WebControls.PlaceHolder
    Protected WithEvents ph3 As System.Web.UI.WebControls.PlaceHolder
    Protected WithEvents ph4 As System.Web.UI.WebControls.PlaceHolder
    Protected WithEvents ph5 As System.Web.UI.WebControls.PlaceHolder
    Protected WithEvents ph6 As System.Web.UI.WebControls.PlaceHolder   'Municipal Wastewater  ww

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




#End Region

    Private countryId As String = ""

    Private Sub Page_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        'Put user code to initialize the page here      

        If Not IsPostBack Then

            ' ideally which is built dynamically using l_partnerCountry from the database - jc
            'Session("jcDebug") = countryName.Text
            Select Case LCase(countryName.Text)
                Case "argentina"
                    countryId = "9"
                Case "australia"
                    countryId = "11"
                Case "brazil"
                    countryId = "27"
                Case "canada"
                    countryId = "35"
                Case "china"
                    countryId = "41"
                Case "colombia"
                    countryId = "42"
                Case "ecuador"
                    countryId = "55"
                Case "germany"
                    countryId = "71"
                Case "india"
                    countryId = "89"
                Case "italy"
                    countryId = "95"
                Case "japan"
                    countryId = "97"
                Case "mexico"
                    countryId = "124"
                Case "nigeria"
                    countryId = "138"
                Case "republic of korea"
                    countryId = "152"
                Case "russia", "russian federation"
                    countryId = "155"
                Case "ukraine"
                    countryId = "182"
                Case "united kingdom"
                    countryId = "184"
                Case "united states"
                    countryId = "185"
                Case "poland"
                    countryId = "148"
                Case "vietnam"
                    countryId = "189"
                Case "european commission"
                    countryId = "198"
                Case "mongolia"
                    countryId = "127"
                Case "pakistan"
                    countryId = "142"
                Case "philippines"
                    countryId = "147"
                Case "thailand"
                    countryId = "175"
                Case "finland"
                    countryId = "65"
                Case "kazakhstan"
                    countryId = "99"
                Case "bulgaria"
                    countryId = "29"
                Case "georgia"
                    countryId = "70"
                Case "chile"
                    countryId = "40"
                Case "dominican republic"
                    countryId = "53"
                Case "ethiopia"      'newly added partners ethiopia, ghana, peru
                    countryId = "62"
                Case "ghana"
                    countryId = "72"
                Case "peru"
                    countryId = "146"
                Case "nicaragua"
                    countryId = "136"
                Case "turkey"
                    countryId = "179"
                Case "indonesia"
                    countryId = "90"
                Case "republic of serbia"
                    countryId = "197"
                Case "jordan"
                    countryId = "98"
                Case "norway"
                    countryId = "140"
                Case "sri lanka"
                    countryId = "166"
                Case "albania"
                    countryId = "2"
                Case "saudi arabia"
                    countryId = "156"



                    'Case "argentina"
                    '    countryId = "1"
                    'Case "australia"
                    '    countryId = "2"
                    'Case "brazil"
                    '    countryId = "3"
                    'Case "canada"
                    '    countryId = "4"
                    'Case "china"
                    '    countryId = "5"
                    'Case "colombia"
                    '    countryId = "6"
                    'Case "ecuador"
                    '    countryId = "7"
                    'Case "germany"
                    '    countryId = "8"
                    'Case "india"
                    '    countryId = "9"
                    'Case "italy"
                    '    countryId = "10"
                    'Case "japan"
                    '    countryId = "11"
                    'Case "mexico"
                    '    countryId = "12"
                    'Case "nigeria"
                    '    countryId = "13"
                    'Case "republic of korea"
                    '    countryId = "14"
                    'Case "russia", "russian federation"
                    '    countryId = "15"
                    'Case "ukraine"
                    '    countryId = "16"
                    'Case "united kingdom"
                    '    countryId = "17"
                    'Case "united states"
                    '    countryId = "18"
                    'Case "poland"
                    '    countryId = "19"
                    'Case "vietnam"
                    '    countryId = "20"
                    'Case "european commission"
                    '    countryId = "21"
                    'Case "mongolia"
                    '    countryId = "22"
                    'Case "pakistan"
                    '    countryId = "23"
                    'Case "philippines"
                    '    countryId = "24"
                    'Case "thailand"
                    '    countryId = "25"
                    'Case "finland"
                    '    countryId = "27"
                    'Case "kazakhstan"
                    '    countryId = "26"
                    'Case "bulgaria"
                    '    countryId = "28"
                    'Case "georgia"
                    '    countryId = "29"
                    'Case "chile"
                    '    countryId = "30"
                    'Case "dominican republic"
                    '    countryId = "31"
                    'Case "ethiopia"      'newly added partners ethiopia, ghana, peru
                    '    countryId = "32"
                    'Case "ghana"
                    '    countryId = "33"
                    'Case "peru"
                    '    countryId = "34"
            End Select

            'Response.Write(countryName.Text)

            If countryId = "" Then
                Response.Redirect("index.aspx")
            End If

            Dim dt As New DataTable
            ' we get agriculture on page load because that slider is open by default
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


            dt = clsEventDAO.getEventDetailsBySectorAndCountry("coal", countryId)
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

            dt = clsEventDAO.getEventDetailsBySectorAndCountry("msw", countryId)
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


            dt = clsEventDAO.getEventDetailsBySectorAndCountry("oilngas", countryId)
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

            dt = clsEventDAO.getEventDetailsBySectorAndCountry("steer", countryId)
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


            dt = clsEventDAO.getEventDetailsBySectorAndCountry("ww", countryId)
            For x = 0 To dt.Rows.Count - 1
                eventId = dt.Rows(x)("eventId")
                nameValue = dt.Rows(x)("name")
                cityValue = dt.Rows(x)("city")
                countryValue = dt.Rows(x)("country")
                startDateValue = Common.getDateFormatDisplay(dt.Rows(x)("startDate"))

                Dim myLabel As Literal

                myLabel = New Literal
                myLabel.Text = "<li>" & startDateValue
                ph6.Controls.Add(myLabel)

                myLabel = New Literal
                myLabel.Text = " <a href=""../news-events/event_detailsByEventId.aspx?eventId=" & eventId & """>" & nameValue & "</a>, "
                ph6.Controls.Add(myLabel)

                myLabel = New Literal
                myLabel.Text = cityValue & ", " & countryValue & "</li>"
                ph6.Controls.Add(myLabel)
            Next

        Else
            Trace.Warn("ispostback")
        End If
    End Sub
End Class
