Imports System.IO
Imports System.Text.RegularExpressions
Public Class nav_banner_edit
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            LoadBannerPreview()
        End If
    End Sub

    Protected Sub btnSave_Click(sender As Object, e As EventArgs) Handles btnSave.Click
        ' Capture values from the form
        Dim bgColor As String = Request.Form("bgColor")
        Dim bannerText As String = Request.Form("bannerText")
        Dim buttonText As String = Request.Form("buttonText")
        Dim buttonLink As String = Request.Form("buttonLink")
        Dim expireTime As String = Request.Form("expireTime")

        ' Ensure required fields are present
        If String.IsNullOrWhiteSpace(bgColor) OrElse String.IsNullOrWhiteSpace(bannerText) Then
            Exit Sub ' Do not proceed if required fields are missing
        End If

        ' Determine appropriate text color for visibility
        Dim textColor As String = If(IsDarkColor(bgColor), "white", "black")

        ' Generate a subtle horizontal gradient
        Dim lighterBg As String = AdjustBrightness(bgColor, 15) ' Slightly lighter shade
        Dim darkerBg As String = AdjustBrightness(bgColor, -15) ' Slightly darker shade
        Dim gradientStyle As String = $"background: linear-gradient(to right, {lighterBg}, {darkerBg});"

        ' Generate the expiration script (only if expireTime is set)
        Dim script As String = ""
        If Not String.IsNullOrWhiteSpace(expireTime) Then
            script = $"
            <script>
                document.addEventListener('DOMContentLoaded', function() {{
                    var expiration = new Date('{expireTime}').getTime();
                    var now = new Date().getTime();
                    if (now >= expiration) {{
                        document.getElementById('navbarBanner').style.display = 'none';
                    }}
                }});
            </script>"
        End If

        ' Generate the button HTML
        Dim buttonHTML As String = ""
        If Not String.IsNullOrWhiteSpace(buttonText) AndAlso Not String.IsNullOrWhiteSpace(buttonLink) Then
            buttonHTML = $"<a href='{buttonLink}' class='btn btn-primary'>{buttonText}</a>"
        End If

        ' Generate the banner HTML
        Dim bannerHTML As String = $"
        <div id='navbarBanner' style='{gradientStyle} color:{textColor}; padding:10px; text-align:center;'>
            <p>{bannerText}</p>
            {buttonHTML}
        </div>
        {script}"

        ' Write the content to the correct file
        Dim filePath As String = Server.MapPath("/includes/banner.html")
        System.IO.File.WriteAllText(filePath, bannerHTML)

        ' Trigger SweetAlert for success
        ClientScript.RegisterStartupScript(Me.GetType(), "BannerSaved", "Swal.fire('Success', 'Banner has been created!', 'success');", True)

        ' Reload the page
        Response.Redirect("nav-banner-edit.aspx")
    End Sub

    Protected Sub btnClearBanner_Click(sender As Object, e As EventArgs) Handles btnClearBanner.Click
        ' Define file path
        Dim filePath As String = Server.MapPath("/includes/banner.html")

        ' Clear the file contents
        System.IO.File.WriteAllText(filePath, String.Empty)

        ' Trigger SweetAlert for confirmation
        ClientScript.RegisterStartupScript(Me.GetType(), "BannerCleared", "Swal.fire('Banner Cleared', 'The existing banner has been removed.', 'warning');", True)

        ' Reload the page
        Response.Redirect("nav-banner-edit.aspx")
    End Sub

    Protected Sub LoadBannerPreview()
        ' Define the file path
        Dim filePath As String = Server.MapPath("/includes/banner.html")

        ' Check if the file exists
        If File.Exists(filePath) Then
            ' Read the file content
            Dim bannerContent As String = File.ReadAllText(filePath)

            ' Extract the expiration time from the script (if it exists)
            Dim expireTimePattern As String = "var expiration = new Date\('(.+?)'\)"
            Dim match As Match = Regex.Match(bannerContent, expireTimePattern)

            Dim isExpired As Boolean = False
            If match.Success Then
                Dim expirationDate As DateTime
                If DateTime.TryParse(match.Groups(1).Value, expirationDate) Then
                    isExpired = expirationDate <= DateTime.Now
                End If
            End If

            ' If expired, append a Bootstrap alert
            If isExpired Then
                bannerContent = $"<div class='alert alert-warning'>This banner has expired and is no longer visible on the site.</div>{bannerContent}"
            End If

            ' Assign content to the preview area
            BannerPreviewDiv.InnerHtml = bannerContent
        Else
            ' If no banner exists, show a message
            BannerPreviewDiv.InnerHtml = "<div class='alert alert-info'>No banner currently exists.</div>"
        End If
    End Sub

    ' Function to determine if a color is dark
    Private Function IsDarkColor(hexColor As String) As Boolean
        Try
            Dim r As Integer = Convert.ToInt32(hexColor.Substring(1, 2), 16)
            Dim g As Integer = Convert.ToInt32(hexColor.Substring(3, 2), 16)
            Dim b As Integer = Convert.ToInt32(hexColor.Substring(5, 2), 16)
            Dim brightness As Double = (r * 0.299 + g * 0.587 + b * 0.114) / 255
            Return brightness < 0.5
        Catch ex As Exception
            Return False ' Default to black text if an error occurs
        End Try
    End Function

    ' Function to adjust brightness of a color (lighten/darken)
    Private Function AdjustBrightness(hexColor As String, percent As Integer) As String
        Try
            Dim r As Integer = Convert.ToInt32(hexColor.Substring(1, 2), 16)
            Dim g As Integer = Convert.ToInt32(hexColor.Substring(3, 2), 16)
            Dim b As Integer = Convert.ToInt32(hexColor.Substring(5, 2), 16)

            ' Adjust brightness
            r = Math.Min(255, Math.Max(0, r + (r * percent \ 100)))
            g = Math.Min(255, Math.Max(0, g + (g * percent \ 100)))
            b = Math.Min(255, Math.Max(0, b + (b * percent \ 100)))

            ' Return new hex color
            Return $"#{r:X2}{g:X2}{b:X2}"
        Catch ex As Exception
            Return hexColor ' If error, return original color
        End Try
    End Function
End Class
