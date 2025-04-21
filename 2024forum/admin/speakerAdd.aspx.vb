Imports System.Data.SqlClient
Public Class speakerAdd
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        Dim query As String = "SELECT        TOP (200) id, email, created, code
FROM            dbo.__2024Speakers"

        Using con As New SqlConnection(Common.GetConnString())
            Using cmd As New SqlCommand(query)
                Using sda As New SqlDataAdapter()
                    cmd.Connection = con
                    sda.SelectCommand = cmd
                    Using ds As New DataSet()
                        sda.Fill(ds)
                        gvComms.DataSource = ds.Tables(0)

                        gvComms.DataBind()
                        gvComms.HeaderRow.TableSection = TableRowSection.TableHeader
                    End Using
                End Using
            End Using
        End Using

    End Sub

    Protected Sub submit_Click(sender As Object, e As EventArgs) Handles submit.Click
        Dim sqlText = "INSERT INTO __2024Speakers (email) VALUES (@email);"
        Using cnConnect = New SqlConnection(Common.GetConnString())
            Using cm = New SqlCommand(sqlText, cnConnect)
                cnConnect.Open()
                cm.Parameters.Add("@email", SqlDbType.NVarChar).Value = email.Text

                Dim currentID As Integer = cm.ExecuteScalar()
                'Set the ID value to RowNumber for redirection

            End Using
        End Using

        Dim script As String = "window.onload = function() { confirmSubmission(); };"
        ClientScript.RegisterStartupScript(Me.GetType(), "confirmSubmission", script, True)
    End Sub
End Class