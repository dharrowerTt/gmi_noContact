
Imports System.Data
Imports System.Configuration
Imports System.Data.SqlClient

Public Class map
    Inherits System.Web.UI.Page
    Dim s As String

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not Me.IsPostBack Then
            Dim dt As DataTable = Me.GetData("SELECT TOP 100 [GMI_dev].[dbo].[sf_activities].name, latitude, longitude, [GMI_dev].[dbo].[sf_sites].Id FROM [GMI_dev].[dbo].[sf_activities] left join [GMI_dev].[dbo].[sf_sites] on [GMI_dev].[dbo].[sf_activities].Site = [GMI_dev].[dbo].[sf_Sites].Id where latitude is not null and longitude is not null")
            rptMarkers.DataSource = dt
            rptMarkers.DataBind()
        End If
    End Sub

    Private Function GetData(query As String) As DataTable

        Dim constr As String = Common.GetConnString()
        Dim cmd As New SqlCommand(query)
        Using con As New SqlConnection(constr)
            Using sda As New SqlDataAdapter()
                cmd.Connection = con

                sda.SelectCommand = cmd
                Using dt As New DataTable()
                    sda.Fill(dt)
                    Return dt
                End Using
            End Using
        End Using
    End Function

End Class