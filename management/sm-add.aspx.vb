Imports System.Data.SqlClient

Public Class sm_add1
    Inherits System.Web.UI.Page

    ' Ensure dateInput is correctly declared as a TextBox
    Protected dateInput As TextBox
    Protected linkedinFollowers As TextBox
    Protected linkedinPosts As TextBox
    Protected linkedinEngagement As TextBox
    Protected facebookFollowers As TextBox
    Protected facebookPosts As TextBox
    Protected xFollowers As TextBox
    Protected xPosts As TextBox
    Protected xEngagement As TextBox

    Protected Sub SubmitData_Click(ByVal sender As Object, ByVal e As EventArgs)
        Dim connString As String = Common.GetConnString()
        Dim selectedDate As Date = Date.Parse(dateInput.Text & "-01") ' Append day to month-year
        Dim firstDayOfMonth As Date = New Date(selectedDate.Year, selectedDate.Month, 1)

        Using conn As New SqlConnection(connString)
            conn.Open()

            ' Insert LinkedIn data
            InsertSocialMediaData(conn, "linkedin", firstDayOfMonth, linkedinFollowers.Text, linkedinPosts.Text)

            ' Insert Facebook data
            InsertSocialMediaData(conn, "facebook", firstDayOfMonth, facebookFollowers.Text, facebookPosts.Text)

            ' Insert X data
            InsertSocialMediaData(conn, "x", firstDayOfMonth, xFollowers.Text, xPosts.Text)

        End Using

        ' Trigger the success message and redirect
        ClientScript.RegisterStartupScript(Me.GetType(), "success", "showSuccess();", True)
    End Sub


    Private Sub InsertSocialMediaData(ByVal conn As SqlConnection, ByVal platform As String, ByVal posted As Date, ByVal followers As String, ByVal posts As String)
        Dim query As String = "INSERT INTO __socialMediaDash (platform, posted, followers, posts) 
                           VALUES (@platform, @posted, @followers, @posts)"

        Using cmd As New SqlCommand(query, conn)
            cmd.Parameters.AddWithValue("@platform", platform)
            cmd.Parameters.AddWithValue("@posted", posted)
            cmd.Parameters.AddWithValue("@followers", Integer.Parse(followers))
            cmd.Parameters.AddWithValue("@posts", Integer.Parse(posts))
            cmd.ExecuteNonQuery()
        End Using
    End Sub

End Class
