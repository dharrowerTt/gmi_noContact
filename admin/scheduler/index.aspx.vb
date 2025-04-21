Imports System.Data
Imports System.Configuration
Imports System.Data.SqlClient
Imports System.Collections.Generic
Imports DayPilot.Web.Ui.Events.Scheduler

Public Class index16
    Inherits System.Web.UI.Page
    Public Shared dt As DataTable
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not IsPostBack Then
            DayPilotCalendar1.StartDate = DayPilot.Utils.Week.FirstDayOfWeek(New Date(2024, 3, 18))
            DayPilotCalendar1.DataSource = dbGetEvents(DayPilotCalendar1.StartDate, DayPilotCalendar1.Days)
            DataBind()
        End If

    End Sub

    Private Function dbGetEvents(ByVal start As Date, ByVal days As Integer) As DataTable

        Dim constr As String = Common.GetConnString()
        Using con As New SqlConnection(constr)
            Using cmd As New SqlCommand("SELECT itemID as id, startDateTime as eventstart, endDateTime as eventend, titleText as name, backColor as resource, backColor as color, barColor from __scheduler")
                Using sda As New SqlDataAdapter()
                    cmd.Connection = con
                    sda.SelectCommand = cmd
                    Using dt As New DataTable()
                        sda.Fill(dt)
                        Return dt
                    End Using
                End Using
            End Using
        End Using


    End Function



End Class