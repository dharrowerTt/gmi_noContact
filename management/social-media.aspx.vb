Imports System.Data.SqlClient
Imports System.Text
Imports System.Globalization

Public Class social_media
    Inherits System.Web.UI.Page

    Public Property TableRows As String
    Public Property ChartData As String

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            LoadTableData()
            LoadChartData()
        End If
    End Sub

    Private Sub LoadTableData()
        Dim query As String = "SELECT platform, FORMAT(posted, 'MMM yyyy') AS month, followers, posts 
                           FROM __socialMediaDash
                           ORDER BY YEAR(posted) ASC, MONTH(posted) ASC"

        Dim connString As String = Common.GetConnString()
        Dim tableBuilder As New StringBuilder()

        Using conn As New SqlConnection(connString)
            conn.Open()
            Using cmd As New SqlCommand(query, conn)
                Using reader As SqlDataReader = cmd.ExecuteReader()
                    While reader.Read()
                        Dim platform As String = If(IsDBNull(reader("platform")), "N/A", CapitalizePlatform(reader("platform").ToString()))
                        Dim month As String = If(IsDBNull(reader("month")), "N/A", reader("month").ToString())
                        Dim followers As String = If(IsDBNull(reader("followers")), "N/A", FormatNumber(CInt(reader("followers")), 0))
                        Dim posts As String = If(IsDBNull(reader("posts")), "N/A", reader("posts").ToString())

                        tableBuilder.AppendLine("<tr>")
                        tableBuilder.AppendLine($"<td>{platform}</td>")
                        tableBuilder.AppendLine($"<td>{month}</td>")
                        tableBuilder.AppendLine($"<td>{followers}</td>")
                        tableBuilder.AppendLine($"<td>{posts}</td>")
                        tableBuilder.AppendLine("</tr>")
                    End While
                End Using
            End Using
        End Using

        TableRows = tableBuilder.ToString()
    End Sub


    Private Sub LoadChartData()
        Dim query As String = "SELECT FORMAT(posted, 'MMM yyyy') AS month, platform, followers 
                               FROM __socialMediaDash
                               ORDER BY YEAR(posted) ASC, MONTH(posted) ASC"

        Dim connString As String = Common.GetConnString()
        Dim dataBuilder As New StringBuilder()

        Dim chartDict As New Dictionary(Of String, List(Of Integer)) From {
            {"linkedin", New List(Of Integer)()},
            {"facebook", New List(Of Integer)()},
            {"x", New List(Of Integer)()}
        }
        Dim months As New List(Of String)()

        Using conn As New SqlConnection(connString)
            conn.Open()
            Using cmd As New SqlCommand(query, conn)
                Using reader As SqlDataReader = cmd.ExecuteReader()
                    While reader.Read()
                        Dim platform = reader("platform").ToString().ToLower()
                        Dim month = reader("month").ToString()
                        Dim followers = If(IsDBNull(reader("followers")), 0, CInt(reader("followers")))

                        If Not months.Contains(month) Then
                            months.Add(month)
                        End If

                        chartDict(platform).Add(followers)
                    End While
                End Using
            End Using
        End Using

        For i As Integer = 0 To months.Count - 1
            Dim row As String = $"'{months(i)}', " &
                                $"{If(chartDict("linkedin").Count > i, chartDict("linkedin")(i), 0)}, " &
                                $"{If(chartDict("facebook").Count > i, chartDict("facebook")(i), 0)}, " &
                                $"{If(chartDict("x").Count > i, chartDict("x")(i), 0)}"
            dataBuilder.AppendLine($"[{row}],")
        Next

        ChartData = dataBuilder.ToString().TrimEnd(","c)
    End Sub

    Private Function CapitalizePlatform(ByVal platform As String) As String
        Select Case platform.ToLower()
            Case "facebook"
                Return "Facebook"
            Case "linkedin"
                Return "LinkedIn"
            Case "x"
                Return "X"
            Case Else
                Return platform
        End Select
    End Function
End Class
