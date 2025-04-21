Imports System.Data
Imports System.Configuration
Imports System.Data.SqlClient
Public Class comms_manage
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim commsID As Integer = 0
        commsID = Server.HtmlEncode(Request.QueryString("commsID"))

        Dim query As String = "SELECT        commID, subjectLine, msgURL, areaOfInterest, language,  convert(varchar, dateSent, 111)  as dateofSend FROM dbo.gmiComms where commID = " & commsID

        Using con As New SqlConnection(Common.GetConnString())
            Using cmd As New SqlCommand(query)
                Using sda As New SqlDataAdapter()
                    cmd.Connection = con
                    sda.SelectCommand = cmd
                    Using ds As New DataSet()
                        sda.Fill(ds)
                        subjectLine.Text = ds.Tables(0).Rows(0).ItemArray(1).ToString
                        msgURL.Text = ds.Tables(0).Rows(0).ItemArray(2).ToString
                        areaOfInterest.SelectedItem.Text = ds.Tables(0).Rows(0).ItemArray(3).ToString
                        language.SelectedItem.Text = ds.Tables(0).Rows(0).ItemArray(4).ToString
                        dateSent.Text = ds.Tables(0).Rows(0).ItemArray(5).ToString

                    End Using
                End Using
            End Using
        End Using

    End Sub

    Protected Sub Delete_Click(sender As Object, e As EventArgs) Handles Delete.Click
        Dim commsID As Integer = 0
        commsID = Server.HtmlEncode(Request.QueryString("commsID"))

        Dim query As String = "DELETE FROM dbo.gmiComms WHERE commID=@commID"

        Using con As SqlConnection = New SqlConnection(Common.GetConnString())
            Using cmd As SqlCommand = New SqlCommand(query)
                cmd.Parameters.AddWithValue("@commID", commsID)
                cmd.Connection = con
                con.Open()
                cmd.ExecuteNonQuery()
                con.Close()
            End Using
        End Using

        Response.Redirect("comms_add.aspx")
    End Sub

    Protected Sub Edit_Click(sender As Object, e As EventArgs) Handles Edit.Click
        Dim commsID As Integer = 0
        commsID = Server.HtmlEncode(Request.QueryString("commsID"))

        Dim query As String = "UPDATE dbo.gmiComms SET subjectLine=@subjectLine, msgURL=@msgURL, areaOfInterest=@areaOfInterest, language = @language, dateSent=@dateSent  WHERE commID=@commID"

        Using con As SqlConnection = New SqlConnection(Common.GetConnString())
            Using cmd As SqlCommand = New SqlCommand(query)
                cmd.Parameters.AddWithValue("@commID", commsID)
                cmd.Parameters.AddWithValue("@subjectLine", subjectLine.Text)
                cmd.Parameters.AddWithValue("@msgURL", msgURL.Text)
                cmd.Parameters.AddWithValue("@areaOfInterest", areaOfInterest.SelectedItem.Text)
                cmd.Parameters.AddWithValue("@language", language.SelectedItem.Text)
                cmd.Parameters.AddWithValue("@dateSent", dateSent.Text)
                cmd.Connection = con
                con.Open()
                cmd.ExecuteNonQuery()
                con.Close()
            End Using
        End Using

        Response.Redirect("comms_add.aspx")
    End Sub
End Class