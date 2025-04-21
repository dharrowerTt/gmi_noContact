Imports System.Data
Imports System.Configuration
Imports System.Data.SqlClient
Imports System.Collections.Generic
Public Class report
    Inherits System.Web.UI.Page
    Public check As String
    Public userID As String
    Public userName As String
    Public countryName As String
    Public UpdateName As String
    Public updateDate As String

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        check = Server.HtmlEncode(Request.QueryString("id"))
        ' check = "7049a3ab-84ba-46ab-9f89-c6e34988f228"

        If check = "7049a3ab-84ba-46ab-9f89-c6e34988f228" Then

            If Not Me.IsPostBack Then
                'Populating a DataTable from database.
                Dim dt As DataTable = Me.GetData()
                'Building an HTML string.
                Dim html As New StringBuilder()
                'Table start.
                html.Append("<table id='downloads'  class='stripe'  border = '1'>")
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

        End If



    End Sub

    Private Function GetData() As DataTable
        Dim constr As String = Common.GetConnString()
        Using con As New SqlConnection(constr)
            Using cmd As New SqlCommand("SELECT resource as 'Resource', firstName as 'First Name', lastName as 'Last Name', email as 'Email Address', organization as 'Organization', country as 'Country', intendedUse as 'Intended Use',  format(submitDate,'yy-MM-dd') as 'Date Downloaded' FROM _downloadData order by submitDate Asc")
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