Imports System.Data
Imports System.Configuration
Imports System.Data.SqlClient
Imports System.Collections.Generic
Public Class view
    Inherits System.Web.UI.Page
    Public countryID As String
    Public userID As String
    Public userName As String
    Public countryName As String = ""
    Public UpdateName As String
    Public updateDate As String

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        countryID = Server.HtmlEncode(Request.QueryString("ct"))
        countryName = Server.HtmlEncode(Request.QueryString("nm"))
        'countryID = "1F9CFCFC-113C-4C63-AC8A-1D66C7FA2F58"
        'userID = Server.HtmlEncode(Request.QueryString("usr"))
        ' userID = "f295930e-b130-415b-b04a-d4cacb1d1e34"





        If Not IsPostBack Then





            namefield.Text = "admin"



            countryfield.Text = countryID

            Dim constr As String = Common.GetConnString()
            Using con As SqlConnection = New SqlConnection(constr)
                    Using cmd As SqlCommand = New SqlCommand("SELECT * from _steeringCountry WHERE id = '" & countryID & "'")
                        cmd.CommandType = CommandType.Text
                        cmd.Connection = con
                        con.Open()
                        Using sdr As SqlDataReader = cmd.ExecuteReader()
                            sdr.Read()

                            If sdr.HasRows = True Then

                                countryName = sdr("countryName").ToString()

                                If Not IsDBNull(sdr("q1")) Then
                                    If sdr("q1") = "1" Then
                                        RadioButton1Yes.Checked = True
                                    Else
                                        RadioButton1No.Checked = True
                                    End If
                                End If

                                If Not IsDBNull(sdr("q2")) Then
                                    If sdr("q2") = "1" Then
                                        RadioButton2Yes.Checked = True
                                    Else
                                        RadioButton2No.Checked = True
                                    End If
                                End If

                                If Not IsDBNull(sdr("q3")) Then
                                    If sdr("q3") = "1" Then
                                        RadioButton3Yes.Checked = True
                                    Else
                                        RadioButton3No.Checked = True
                                    End If
                                End If

                                If Not IsDBNull(sdr("updatedBy")) Then

                                    UpdateName = sdr("updatedBy").ToString()
                                    updateDate = Left(sdr("dateUpdated").ToString(), Len(sdr("dateUpdated").ToString()) - 11)
                                    UpdateLabel.Text = "Last Updated by " & UpdateName & " on " & updateDate

                                Else

                                    UpdateLabel.Text = "This information has not been updated or reviewed yet."

                                End If

                            End If
                        End Using
                        con.Close()
                    End Using
                End Using



            End If

            If Not Me.IsPostBack Then
                'Populating a DataTable from database.
                Dim dt As DataTable = Me.GetData()

                'Building an HTML string.
                Dim html As New StringBuilder()

                'Table start.
                html.Append("<table id='delegates'  class='stripe'  border = '1'>")

                'Building the Header row.

                html.Append("<thead><tr>")
                For Each column As DataColumn In dt.Columns
                    html.Append("<th>")
                    html.Append(column.ColumnName)
                    html.Append("</th>")
                Next
                html.Append("</tr></thead>")

                'Building the Data rows.
                For Each row As DataRow In dt.Rows
                    html.Append("<tr>")
                    For Each column As DataColumn In dt.Columns
                        html.Append("<td>")
                        html.Append(row(column.ColumnName))
                        html.Append("</td>")
                    Next
                    html.Append("</tr>")
                Next

                'Table end.
                html.Append("</table>")

                'Append the HTML string to Placeholder.
                PlaceHolder1.Controls.Add(New Literal() With {
                   .Text = html.ToString()
                 })
            End If


    End Sub

    Private Function GetData() As DataTable
        Dim constr As String = Common.GetConnString()
        Using con As New SqlConnection(constr)
            Using cmd As New SqlCommand("SELECT id as 'Manage', personFirstName as 'Name', personLastName, organization as 'Organization', countryName, email as 'Email Address', position as 'Position', countryCode, adminFlag as 'Administrative Liaison', format(dateUpdated,'yy-MM-dd') as 'Last Updated' FROM _tableDelegateConfirm WHERE countryCode = '" & countryID & "'")
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