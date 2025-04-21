Imports System.IO
Imports System.Data.SqlClient

Partial Class photoAdd

    Inherits System.Web.UI.Page

    Protected Sub btnUpload_Click(sender As Object, e As EventArgs)
        If fileUpload.HasFile Then
            Try
                ' Save the file to the assets directory

                Dim filename As String = Path.GetFileName(fileUpload.FileName)
                Dim savePath As String = Server.MapPath("~/assets/images/") & filename
                fileUpload.SaveAs(savePath)

                ' Get the form values
                Dim id As Integer = Convert.ToInt32(txtID.Text)
                Dim type As String = ddlType.SelectedValue
                Dim tableName As String = If(type = "Resource", "dbo.Resources", "dbo.events")

                Dim sqlText As String = ""

                If type = "Resource" Then

                    sqlText = $"UPDATE {tableName} SET resourceImage = @FileName WHERE resourceid = @ID"
                    Using cnConnect = New SqlConnection(Common.GetConnString())
                        Using cm = New SqlCommand(sqlText, cnConnect)
                            cnConnect.Open()
                            cm.Parameters.AddWithValue("@ID", id)
                            cm.Parameters.AddWithValue("@FileName", "../assets/images/" & filename)
                            cm.ExecuteNonQuery()
                            'Set the ID value to RowNumber for redirection

                        End Using
                    End Using

                Else

                    sqlText = $"UPDATE {tableName} SET photo_url = @FileName WHERE eventid = @ID"
                    Using cnConnect = New SqlConnection(Common.GetConnString())
                        Using cm = New SqlCommand(sqlText, cnConnect)
                            cnConnect.Open()
                            cm.Parameters.AddWithValue("@ID", id)
                            cm.Parameters.AddWithValue("@FileName", filename)
                            cm.ExecuteNonQuery()
                            'Set the ID value to RowNumber for redirection

                        End Using
                    End Using


                End If



                lblMessage.ForeColor = System.Drawing.Color.Green
                lblMessage.Text = "File uploaded and database updated successfully!"
            Catch ex As Exception
                lblMessage.Text = "File upload failed: " & ex.Message
            End Try
        Else
            lblMessage.Text = "Please select a file to upload."
        End If
    End Sub
End Class
