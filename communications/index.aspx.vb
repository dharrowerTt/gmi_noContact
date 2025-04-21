
Imports System.Data
Imports System.Configuration
Imports System.Data.SqlClient
Partial Class communications_index
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        Dim query As String = "SELECT        commID, subjectLine, msgURL, areaOfInterest, language,  convert(varchar, dateSent, 111)  as dateofSend FROM dbo.gmiComms ORDER BY dateSent DESC"

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


End Class
