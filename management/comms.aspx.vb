Imports System.Data.SqlClient

Public Class comms
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            LoadCommsData()
        End If
    End Sub

    Private Sub LoadCommsData()
        ' SQL Query to select relevant fields, including snapshotSubs for calculations
        Dim query As String = "SELECT commID, subjectLine, msgURL, areaOfInterest, dateSent, snapshotSubs, openRate, clickRate, newsletter FROM gmiComms ORDER BY dateSent DESC"

        ' Use the existing connection string method from Common
        Dim connString As String = Common.GetConnString()
        Using conn As New SqlConnection(connString)
            Using cmd As New SqlCommand(query, conn)
                conn.Open()
                Dim reader As SqlDataReader = cmd.ExecuteReader()

                ' Create a DataTable to manipulate data
                Dim dataTable As New DataTable()
                dataTable.Load(reader)

                ' Calculate open and click rates based on snapshotSubs
                For Each row As DataRow In dataTable.Rows
                    Dim snapshotSubs As Integer = If(IsDBNull(row("snapshotSubs")), 0, Convert.ToInt32(row("snapshotSubs")))
                    Dim openValue As Integer = If(IsDBNull(row("openRate")), 0, Convert.ToInt32(row("openRate")))
                    Dim clickValue As Integer = If(IsDBNull(row("clickRate")), 0, Convert.ToInt32(row("clickRate")))

                    row("openRate") = If(snapshotSubs > 0, (openValue / snapshotSubs) * 100, 0)
                    row("clickRate") = If(snapshotSubs > 0, (clickValue / snapshotSubs) * 100, 0)
                Next

                repeaterComms.DataSource = dataTable
                repeaterComms.DataBind()
            End Using
        End Using
    End Sub

    ' Method to determine color for open rate
    Protected Function GetColorForOpenRate(openRate As Double) As String
        If openRate > 16 Then
            Return "color: green;"
        ElseIf openRate < 12 Then
            Return "color: red;"
        Else
            Return ""
        End If
    End Function

    ' Method to determine color for click rate
    Protected Function GetColorForClickRate(clickRate As Double) As String
        If clickRate > 3 Then
            Return "color: green;"
        ElseIf clickRate < 1 Then
            Return "color: red;"
        Else
            Return ""
        End If
    End Function
End Class
