Imports System.Data.SqlClient
Imports System.Web.Script.Serialization

Partial Class updateSubStatusCS
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs) Handles Me.Load
        Response.ContentType = "application/json"

        Dim responseObj As New Dictionary(Of String, Object)

        Try
            Dim requestBody As String
            Using reader As New IO.StreamReader(Request.InputStream)
                requestBody = reader.ReadToEnd()
            End Using

            Dim serializer As New JavaScriptSerializer()
            Dim data = serializer.Deserialize(Of Dictionary(Of String, String))(requestBody)

            Dim id As Integer = Convert.ToInt32(data("id"))
            Dim subStatus As String = data("subStatus")
            Dim subStatusEditor As String = Session("LoggedInUser").ToString()
            Dim subStatusChangeDate As DateTime = DateTime.Now
            Dim status As String = Nothing
            Dim statusChangeDate As DateTime? = Nothing

            ' Update status if subStatus requires it
            Select Case subStatus
                Case "Waitlisted"
                    status = "On Hold"
                    statusChangeDate = DateTime.Now
                Case "Declined"
                    status = "Declined"
                    statusChangeDate = DateTime.Now
            End Select

            Dim connString As String = Common.GetConnString()
            Using conn As New SqlConnection(connString)
                conn.Open()

                Dim sql As String = "UPDATE csstudies SET subStatus = @subStatus, subStatusChangeDate = @subStatusChangeDate, subStatusEditor = @subStatusEditor, " &
                                    "status = ISNULL(@status, status), statusChangeDate = ISNULL(@statusChangeDate, statusChangeDate) WHERE id = @id"
                Using cmd As New SqlCommand(sql, conn)
                    cmd.Parameters.AddWithValue("@subStatus", subStatus)
                    cmd.Parameters.AddWithValue("@subStatusChangeDate", subStatusChangeDate)
                    cmd.Parameters.AddWithValue("@subStatusEditor", subStatusEditor)
                    cmd.Parameters.AddWithValue("@id", id)

                    If status IsNot Nothing Then
                        cmd.Parameters.AddWithValue("@status", status)
                        cmd.Parameters.AddWithValue("@statusChangeDate", statusChangeDate)
                    Else
                        cmd.Parameters.AddWithValue("@status", DBNull.Value)
                        cmd.Parameters.AddWithValue("@statusChangeDate", DBNull.Value)
                    End If

                    cmd.ExecuteNonQuery()
                End Using
            End Using

            responseObj("success") = True
        Catch ex As Exception
            responseObj("success") = False
            responseObj("message") = ex.Message
        End Try

        Dim jsonResponse As String = New JavaScriptSerializer().Serialize(responseObj)
        Response.Write(jsonResponse)
        Response.End()
    End Sub
End Class
