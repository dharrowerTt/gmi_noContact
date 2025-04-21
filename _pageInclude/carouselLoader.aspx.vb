Imports System.Data.SqlClient

Public Class carouselLoader
    Inherits System.Web.UI.Page

    Private connString As String = Common.GetConnString()

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            LoadCarousel()
        End If
    End Sub

    Private Sub LoadCarousel()
        Dim query As String = "SELECT mainText, subText, buttonText, buttonDestination, isGradient, startColorHex, endColorHex, imageUrl, position FROM homeBannerAdmin WHERE active = 1 ORDER BY position ASC"

        Using conn As New SqlConnection(connString)
            Using cmd As New SqlCommand(query, conn)
                conn.Open()
                Dim reader As SqlDataReader = cmd.ExecuteReader()
                Dim indicators As New List(Of String)
                Dim items As New List(Of String)
                Dim index As Integer = 0

                While reader.Read()
                    Dim activeClass As String = If(index = 0, "active", "")
                    indicators.Add($"<li data-target='#headercarouselarea' data-slide-to='{index}' class='{activeClass}' aria-label='Slide {index + 1}'></li>")

                    Dim backgroundStyle As String
                    If Convert.ToBoolean(reader("isGradient")) Then
                        ' Gradient background
                        backgroundStyle = $"background-image: linear-gradient(to bottom, {reader("startColorHex")}, {reader("endColorHex")});"
                    Else
                        ' Image background with gradient overlay for readability
                        Dim imagePath As String = ResolveUrl(reader("imageUrl").ToString())
                        backgroundStyle = $"background-image: linear-gradient(to bottom, rgba(12,89,157,0.3) 0%, rgba(12,89,157,0.6) 70%), url(&quot;{imagePath}&quot;); background-position: bottom right, center center;"
                    End If

                    Dim carouselItem As String = $"
                    <div class='carousel-item {activeClass}' style='{backgroundStyle} height: 300px;'>
                        <div class='carousel-caption d-none d-md-block'>
                            <h2 class='display-5 text-white font-weight-bold' tabindex='-1'>{reader("mainText")}</h2>
                            <p class='lead text-white font-weight-bold'>{reader("subText")}</p>
                            <p><a href='{reader("buttonDestination")}' class='btn btn-primary btn-sm' tabindex='0'>{reader("buttonText")}</a></p>
                        </div>
                    </div>"

                    items.Add(carouselItem)
                    index += 1
                End While

                ' Build the final carousel markup
                Dim carouselHtml As String = $"
                <div id='headercarouselarea' class='carousel slide carousel-fade' data-ride='carousel' data-interval='10000' aria-label='Featured Items Carousel'>
                    <ol class='carousel-indicators'>{String.Join(Environment.NewLine, indicators)}</ol>
                    <div class='carousel-inner' role='region' aria-label='Carousel Content'>{String.Join(Environment.NewLine, items)}</div>
                    <a class='carousel-control-prev' href='#headercarouselarea' role='button' data-slide='prev' aria-label='Previous Slide'>
                        <span class='carousel-control-prev-icon' aria-hidden='true'></span>
                        <span class='sr-only'>Previous</span>
                    </a>
                    <a class='carousel-control-next' href='#headercarouselarea' role='button' data-slide='next' aria-label='Next Slide'>
                        <span class='carousel-control-next-icon' aria-hidden='true'></span>
                        <span class='sr-only'>Next</span>
                    </a>
                </div>"

                litCarousel.Text = carouselHtml
            End Using
        End Using
    End Sub
End Class
