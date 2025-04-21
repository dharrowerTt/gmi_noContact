Imports System.Data.SqlClient

Public Class bannerPreview
    Inherits System.Web.UI.Page

    ' Declare the controls so they can be used in code-behind
    Protected WithEvents carouselIndicators As Literal
    Protected WithEvents carouselInner As Literal

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
                    Dim overlayGradient As String = "linear-gradient(to bottom, rgba(0,0,0,0.3), rgba(0,0,0,0.6))," ' Dark transparent overlay

                    If Convert.ToBoolean(reader("isGradient")) Then
                        ' Keep existing gradient-only banners
                        backgroundStyle = $"background-image: linear-gradient(to bottom, {reader("startColorHex")}, {reader("endColorHex")});"
                    Else
                        ' Apply gradient overlay + image background
                        Dim imagePath As String = ResolveUrl(reader("imageUrl").ToString())
                        backgroundStyle = $"background-image: {overlayGradient} url(&quot;{imagePath}&quot;); background-position: bottom right, center center;"
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

                ' Assign values to the Literal controls
                carouselIndicators.Text = String.Join(Environment.NewLine, indicators)
                carouselInner.Text = String.Join(Environment.NewLine, items)
            End Using
        End Using
    End Sub
End Class
