Imports System.Data
Imports System.Text
Imports System.Configuration
Imports System.Data.SqlClient

Public Class eventAdmin110
    Inherits System.Web.UI.Page
    Dim EventID As Int16 = 110

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not Me.IsPostBack Then
            'Populating a DataTable from database.
            Dim dt As DataTable = Me.GetData()

            'Building an HTML string.
            Dim html As New StringBuilder()

            'Table start.
            html.Append("<table id='table' border = '1'>")

            'Building the Header row.
            html.Append("<thead><tr>")
            For Each column As DataColumn In dt.Columns
                html.Append("<th>")
                html.Append(column.ColumnName)
                html.Append("</th>")
            Next
            html.Append("</tr></thead>")

            'Building the Data rows.
            html.Append("<tbody>")
            For Each row As DataRow In dt.Rows
                html.Append("<tr>")
                For Each column As DataColumn In dt.Columns
                    html.Append("<td>")
                    html.Append(row(column.ColumnName))
                    html.Append("</td>")
                Next
                html.Append("</tr>")
            Next
            html.Append("</tbody>")
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
        Using con As SqlConnection = New SqlConnection(constr)


            Using cmd As New SqlCommand("SELECT fName as 'First Name', lName as 'Last Name', organization as 'Company', email as 'E-Mail Address', CONVERT(varchar, createDate,7), IIF(visaID>0, 'Yes', 'No') as 'Visa Help?' from _registercontact LEFT JOIN _registervisa on _registercontact.contactID = _registervisa.contactID WHERE EventID = " & EventID)
                cmd.CommandType = CommandType.Text
                cmd.Connection = con
                con.Open()
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