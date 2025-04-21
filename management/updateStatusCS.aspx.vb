Imports System.Data.SqlClient
Imports System.Web.Script.Serialization

Partial Class updateStatusCS
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs) Handles Me.Load
        Response.ContentType = "application/json" ' Ensure response is JSON

        Dim responseObj As New Dictionary(Of String, Object)

        Try
            ' Parse request data
            Dim requestBody As String
            Using reader As New IO.StreamReader(Request.InputStream)
                requestBody = reader.ReadToEnd()
            End Using

            Dim serializer As New JavaScriptSerializer()
            Dim data = serializer.Deserialize(Of Dictionary(Of String, String))(requestBody)

            Dim id As Integer = Convert.ToInt32(data("id"))
            Dim status As String = data("status")
            Dim statusEditor As String = Session("LoggedInUser").ToString()
            Dim statusChangeDate As DateTime = DateTime.Now

            ' Update database
            Dim connString As String = Common.GetConnString()
            Using conn As New SqlConnection(connString)
                conn.Open()

                Dim sql As String = "UPDATE csstudies SET status = @status, statusChangeDate = @statusChangeDate, statusEditor = @statusEditor WHERE id = @id"
                Using cmd As New SqlCommand(sql, conn)
                    cmd.Parameters.AddWithValue("@status", status)
                    cmd.Parameters.AddWithValue("@statusChangeDate", statusChangeDate)
                    cmd.Parameters.AddWithValue("@statusEditor", statusEditor)
                    cmd.Parameters.AddWithValue("@id", id)

                    cmd.ExecuteNonQuery()
                End Using
            End Using

            ' Success response
            responseObj("success") = True
        Catch ex As Exception
            ' Error response
            responseObj("success") = False
            responseObj("message") = ex.Message
        End Try

        ' Return JSON response
        Dim jsonResponse As String = New JavaScriptSerializer().Serialize(responseObj)
        Response.Write(jsonResponse)
        Response.End() ' Ensure no extra output is sent
    End Sub
End Class
