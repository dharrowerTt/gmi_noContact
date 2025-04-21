Imports System.Data.SqlClient
Imports System.IO

Public Class homeBannerEdit
    Inherits System.Web.UI.Page

    Private connString As String = Common.GetConnString()

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            If Request.QueryString("id") IsNot Nothing Then
                hfBannerId.Value = Request.QueryString("id")
                LoadBannerDetails(Convert.ToInt32(hfBannerId.Value))
            End If
        End If
    End Sub

    Private Sub LoadBannerDetails(bannerId As Integer)
        Dim query As String = "SELECT * FROM homeBannerAdmin WHERE id = @id"
        Using conn As New SqlConnection(connString)
            Using cmd As New SqlCommand(query, conn)
                cmd.Parameters.AddWithValue("@id", bannerId)
                conn.Open()
                Dim reader As SqlDataReader = cmd.ExecuteReader()
                If reader.Read() Then
                    txtBannerName.Text = reader("bannerName").ToString()
                    txtMainText.Text = reader("mainText").ToString()
                    txtSubText.Text = reader("subText").ToString()
                    txtButtonText.Text = reader("buttonText").ToString()
                    txtButtonDestination.Text = reader("buttonDestination").ToString()
                    ddlBannerStyle.SelectedValue = If(Convert.ToBoolean(reader("isGradient")), "Colors", "Image")
                    txtAltText.Text = reader("altText").ToString()

                    ' Set gradient selection
                    If Convert.ToBoolean(reader("isGradient")) Then
                        rbGradients.SelectedValue = $"linear-gradient(to right, {reader("startColorHex")}, {reader("endColorHex")})"
                    End If

                    ' Show/hide sections
                    imageSection.Visible = (ddlBannerStyle.SelectedValue = "Image")
                    gradientSection.Visible = (ddlBannerStyle.SelectedValue = "Colors")
                End If
            End Using
        End Using
    End Sub

    Protected Sub btnSave_Click(sender As Object, e As EventArgs)
        Dim query As String
        Dim bannerId As Integer = If(String.IsNullOrEmpty(hfBannerId.Value), 0, Convert.ToInt32(hfBannerId.Value))

        Dim isGradient As Boolean = (ddlBannerStyle.SelectedValue = "Colors")
        Dim startColor As String = Nothing
        Dim endColor As String = Nothing
        Dim imageUrl As String = Nothing

        ' Handle image upload
        If fuImage.HasFile AndAlso ddlBannerStyle.SelectedValue = "Image" Then
            Dim fileExt As String = Path.GetExtension(fuImage.FileName)
            Dim uniqueFileName As String = "banner_" & Guid.NewGuid().ToString() & fileExt
            Dim folderPath As String = Server.MapPath("~/uploads/banners/")

            ' ✅ Ensure the directory exists before saving the file
            If Not Directory.Exists(folderPath) Then
                Directory.CreateDirectory(folderPath)
            End If

            Dim savePath As String = Path.Combine(folderPath, uniqueFileName)
            fuImage.SaveAs(savePath)
            imageUrl = "~/uploads/banners/" & uniqueFileName
        End If

        ' Handle gradient selection
        If isGradient Then
            Dim gradientColors As String() = rbGradients.SelectedValue.Replace("linear-gradient(to right, ", "").Replace(")", "").Split(", ")
            startColor = gradientColors(0)
            endColor = gradientColors(1)
        End If

        Using conn As New SqlConnection(connString)
            conn.Open()
            If bannerId = 0 Then
                ' Insert new banner
                query = "INSERT INTO homeBannerAdmin (bannerName, mainText, subText, buttonText, buttonDestination, bannerStyle, isGradient, startColorHex, endColorHex, imageUrl, altText, setDate, editedBy, active, position) " &
          "VALUES (@bannerName, @mainText, @subText, @buttonText, @buttonDestination, @bannerStyle, @isGradient, @startColorHex, @endColorHex, @imageUrl, @altText, GETDATE(), @editedBy, 0, NULL)"

            Else
                ' Update existing banner
                query = "UPDATE homeBannerAdmin SET bannerName = @bannerName, mainText = @mainText, subText = @subText, buttonText = @buttonText, " &
            "buttonDestination = @buttonDestination, bannerStyle = @bannerStyle, isGradient = @isGradient, startColorHex = @startColorHex, endColorHex = @endColorHex, " &
            "imageUrl = @imageUrl, altText = @altText, editedBy = @editedBy WHERE id = @id"

            End If

            Using cmd As New SqlCommand(query, conn)
                cmd.Parameters.AddWithValue("@bannerName", txtBannerName.Text)
                cmd.Parameters.AddWithValue("@mainText", txtMainText.Text)
                cmd.Parameters.AddWithValue("@subText", txtSubText.Text)
                cmd.Parameters.AddWithValue("@buttonText", txtButtonText.Text)
                cmd.Parameters.AddWithValue("@bannerStyle", ddlBannerStyle.SelectedValue)
                cmd.Parameters.AddWithValue("@buttonDestination", txtButtonDestination.Text)
                cmd.Parameters.AddWithValue("@isGradient", isGradient)
                cmd.Parameters.AddWithValue("@startColorHex", If(startColor IsNot Nothing, startColor, DBNull.Value))
                cmd.Parameters.AddWithValue("@endColorHex", If(endColor IsNot Nothing, endColor, DBNull.Value))
                cmd.Parameters.AddWithValue("@imageUrl", If(imageUrl IsNot Nothing, imageUrl, DBNull.Value))
                cmd.Parameters.AddWithValue("@altText", txtAltText.Text)
                cmd.Parameters.AddWithValue("@editedBy", "admin@example.com") ' Replace with actual user email
                If bannerId <> 0 Then cmd.Parameters.AddWithValue("@id", bannerId)
                cmd.ExecuteNonQuery()
            End Using
        End Using

        Response.Redirect("bannerAdmin.aspx")
    End Sub

    Protected Sub ddlBannerStyle_SelectedIndexChanged(sender As Object, e As EventArgs)
        ' Toggle visibility based on selection
        imageSection.Visible = (ddlBannerStyle.SelectedValue = "Image")
        gradientSection.Visible = (ddlBannerStyle.SelectedValue = "Colors")
    End Sub

End Class
