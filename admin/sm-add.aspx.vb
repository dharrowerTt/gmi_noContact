Imports System.Data
Imports System.Configuration
Imports System.Data.SqlClient
Public Class sm_add
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load



    End Sub

    Protected Sub Add_Click(sender As Object, e As EventArgs) Handles Add.Click

        'LinkedIn
        Dim sqlText = "INSERT INTO __socialMediaDash (platform,posted,followers,posts,engagementRate) VALUES (@platform, @posted, @followers, @posts, @engagementRate);"
        Using cnConnect = New SqlConnection(Common.GetConnString())
            Using cm = New SqlCommand(sqlText, cnConnect)
                cnConnect.Open()
                cm.Parameters.Add("@platform", SqlDbType.NVarChar).Value = "linkedin"
                cm.Parameters.Add("@posted", SqlDbType.Date).Value = DateTime.Now
                cm.Parameters.Add("@followers", SqlDbType.NVarChar).Value = LIFollowers.Text
                cm.Parameters.Add("@posts", SqlDbType.NVarChar).Value = LIPC.Text
                cm.Parameters.Add("@engagementRate", SqlDbType.NVarChar).Value = LIE.Text
                Dim currentID As Integer = cm.ExecuteScalar()
                'Set the ID value to RowNumber for redirection
            End Using
        End Using

        'FB
        sqlText = "INSERT INTO __socialMediaDash (platform,posted,followers,posts,engagementRate) VALUES (@platform, @posted, @followers, @posts, @engagementRate);"
        Using cnConnect = New SqlConnection(Common.GetConnString())
            Using cm = New SqlCommand(sqlText, cnConnect)
                cnConnect.Open()
                cm.Parameters.Add("@platform", SqlDbType.NVarChar).Value = "facebook"
                cm.Parameters.Add("@posted", SqlDbType.NVarChar).Value = DateTime.Today
                cm.Parameters.Add("@followers", SqlDbType.NVarChar).Value = FBFollowers.Text
                cm.Parameters.Add("@posts", SqlDbType.NVarChar).Value = FBPC.Text
                cm.Parameters.Add("@engagementRate", SqlDbType.NVarChar).Value = FBE.Text
                Dim currentID As Integer = cm.ExecuteScalar()
                'Set the ID value to RowNumber for redirection
            End Using
        End Using

        'X
        sqlText = "INSERT INTO __socialMediaDash (platform,posted,followers,posts,engagementRate) VALUES (@platform, @posted, @followers, @posts, @engagementRate);"
        Using cnConnect = New SqlConnection(Common.GetConnString())
            Using cm = New SqlCommand(sqlText, cnConnect)
                cnConnect.Open()
                cm.Parameters.Add("@platform", SqlDbType.NVarChar).Value = "x"
                cm.Parameters.Add("@posted", SqlDbType.NVarChar).Value = DateTime.Today
                cm.Parameters.Add("@followers", SqlDbType.NVarChar).Value = XFollowers.Text
                cm.Parameters.Add("@posts", SqlDbType.NVarChar).Value = XPC.Text
                cm.Parameters.Add("@engagementRate", SqlDbType.NVarChar).Value = XE.Text
                Dim currentID As Integer = cm.ExecuteScalar()
                'Set the ID value to RowNumber for redirection
            End Using
        End Using
        Response.Redirect("https://globalmethane.org/dashboard/socialMedia.aspx")

    End Sub


End Class