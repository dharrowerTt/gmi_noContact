Imports System.Data.SqlClient
Imports System.IO

Public Class manage_comms
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            Dim commID As Integer
            If Integer.TryParse(Request.QueryString("id"), commID) Then
                LoadCommsData(commID)
            End If
        End If
    End Sub

    Private Sub LoadCommsData(ByVal commID As Integer)
        Dim query As String = "SELECT * FROM gmiComms WHERE commID = @commID"
        Using conn As New SqlConnection(Common.GetConnString())
            Using cmd As New SqlCommand(query, conn)
                cmd.Parameters.AddWithValue("@commID", commID)
                conn.Open()
                Dim reader As SqlDataReader = cmd.ExecuteReader()
                If reader.Read() Then
                    txtSubjectLine.Text = If(IsDBNull(reader("subjectLine")), String.Empty, reader("subjectLine").ToString())
                    txtMsgURL.Text = If(IsDBNull(reader("msgURL")), String.Empty, reader("msgURL").ToString())
                    ddlAreaOfInterest.SelectedValue = If(IsDBNull(reader("areaOfInterest")), String.Empty, reader("areaOfInterest").ToString())
                    ddlLanguage.SelectedValue = If(IsDBNull(reader("language")), String.Empty, reader("language").ToString())
                    txtDateSent.Text = If(IsDBNull(reader("dateSent")), DateTime.Now.ToString("yyyy-MM-dd"), Convert.ToDateTime(reader("dateSent")).ToString("yyyy-MM-dd"))
                    txtSnapshotSubs.Text = If(IsDBNull(reader("snapshotSubs")), String.Empty, reader("snapshotSubs").ToString())
                    txtOpenRate.Text = If(IsDBNull(reader("openRate")), String.Empty, reader("openRate").ToString())
                    txtClickRate.Text = If(IsDBNull(reader("clickRate")), String.Empty, reader("clickRate").ToString())
                    txtBounceRate.Text = If(IsDBNull(reader("bounceRate")), String.Empty, reader("bounceRate").ToString())
                    txtUnsubRate.Text = If(IsDBNull(reader("unsubRate")), String.Empty, reader("unsubRate").ToString())
                    chkNewsletter.Checked = If(IsDBNull(reader("newsletter")), False, Convert.ToBoolean(reader("newsletter")))
                End If
            End Using
        End Using
    End Sub

    Protected Sub SaveData(ByVal sender As Object, ByVal e As EventArgs)
        Dim commID As Integer
        Dim isEdit As Boolean = Integer.TryParse(Request.QueryString("id"), commID)
        Dim query As String

        If isEdit Then
            query = "UPDATE gmiComms SET subjectLine=@subjectLine, msgURL=@msgURL, areaOfInterest=@areaOfInterest, language=@language, dateSent=@dateSent, snapshotSubs=@snapshotSubs, openRate=@openRate, clickRate=@clickRate, bounceRate=@bounceRate, unsubRate=@unsubRate, newsletter=@newsletter, thumbnail=@thumbnail WHERE commID=@commID"
        Else
            query = "INSERT INTO gmiComms (subjectLine, msgURL, areaOfInterest, language, dateSent, snapshotSubs, openRate, clickRate, bounceRate, unsubRate, newsletter, thumbnail) VALUES (@subjectLine, @msgURL, @areaOfInterest, @language, @dateSent, @snapshotSubs, @openRate, @clickRate, @bounceRate, @unsubRate, @newsletter, @thumbnail)"
        End If

        Using conn As New SqlConnection(Common.GetConnString())
            Using cmd As New SqlCommand(query, conn)
                cmd.Parameters.AddWithValue("@subjectLine", txtSubjectLine.Text)
                cmd.Parameters.AddWithValue("@msgURL", txtMsgURL.Text)
                cmd.Parameters.AddWithValue("@areaOfInterest", ddlAreaOfInterest.SelectedValue)
                cmd.Parameters.AddWithValue("@language", ddlLanguage.SelectedValue)
                cmd.Parameters.AddWithValue("@dateSent", Convert.ToDateTime(txtDateSent.Text))

                ' Handle optional numeric fields by checking for empty text
                cmd.Parameters.AddWithValue("@snapshotSubs", If(String.IsNullOrEmpty(txtSnapshotSubs.Text), CType(DBNull.Value, Object), Convert.ToInt32(txtSnapshotSubs.Text)))
                cmd.Parameters.AddWithValue("@openRate", If(String.IsNullOrEmpty(txtOpenRate.Text), CType(DBNull.Value, Object), Convert.ToDecimal(txtOpenRate.Text)))
                cmd.Parameters.AddWithValue("@clickRate", If(String.IsNullOrEmpty(txtClickRate.Text), CType(DBNull.Value, Object), Convert.ToDecimal(txtClickRate.Text)))
                cmd.Parameters.AddWithValue("@bounceRate", If(String.IsNullOrEmpty(txtBounceRate.Text), CType(DBNull.Value, Object), Convert.ToDecimal(txtBounceRate.Text)))
                cmd.Parameters.AddWithValue("@unsubRate", If(String.IsNullOrEmpty(txtUnsubRate.Text), CType(DBNull.Value, Object), Convert.ToDecimal(txtUnsubRate.Text)))

                cmd.Parameters.AddWithValue("@newsletter", chkNewsletter.Checked)

                ' Save thumbnail if uploaded
                If fileThumbnail.HasFile Then
                    Dim fileName As String = $"newsletter{DateTime.Now:yyyyMM}.jpg"
                    Dim savePath As String = Server.MapPath($"~/assets/images/{fileName}")
                    fileThumbnail.SaveAs(savePath)
                    cmd.Parameters.AddWithValue("@thumbnail", $"https://www.globalmethane.org/assets/images/{fileName}")
                ElseIf isEdit Then
                    cmd.Parameters.AddWithValue("@thumbnail", SqlDbType.NVarChar).Value = DBNull.Value
                End If

                If isEdit Then
                    cmd.Parameters.AddWithValue("@commID", commID)
                End If

                conn.Open()
                cmd.ExecuteNonQuery()
            End Using
        End Using

        Response.Redirect("comms.aspx")
    End Sub
End Class
