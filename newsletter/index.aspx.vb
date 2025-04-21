Imports System.Data
Imports System.Configuration
Imports System.Data.SqlClient

Public Class index15
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            LoadNewsletters()
        End If
    End Sub

    Private Sub LoadNewsletters()
        Dim query As String = "SELECT subjectLine, msgURL, thumbnail, summary, CONVERT(varchar, dateSent, 111) AS dateofSend FROM dbo.gmiComms WHERE newsletter = 1 ORDER BY dateSent DESC"

        Using con As New SqlConnection(Common.GetConnString())
            Using cmd As New SqlCommand(query)
                Using sda As New SqlDataAdapter()
                    cmd.Connection = con
                    sda.SelectCommand = cmd
                    Using ds As New DataSet()
                        sda.Fill(ds)
                        rptNewsletters.DataSource = ds.Tables(0)
                        rptNewsletters.DataBind()
                    End Using
                End Using
            End Using
        End Using
    End Sub

End Class
