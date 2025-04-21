Imports System.Data
Imports System.Configuration
Imports System.Data.SqlClient
Public Class review
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Me.IsPostBack Then
            Dim constr As String = Common.GetConnString()
            Using con As SqlConnection = New SqlConnection(constr)
                Using cmd As New SqlCommand("SELECT id, countryName FROM _steeringCountry where scFlag = 'yes' order by countryName Asc ")
                    cmd.CommandType = CommandType.Text
                    cmd.Connection = con
                    cmd.Connection = con
                    con.Open()
                    ddlCountry.DataSource = cmd.ExecuteReader()
                    ddlCountry.DataTextField = "countryName"
                    ddlCountry.DataValueField = "id"
                    ddlCountry.DataBind()
                    con.Close()
                End Using
            End Using
            ddlCountry.Items.Insert(0, New ListItem("--Select Country-", "0"))
        End If


        'Populating a DataTable from database.
        Dim dt As DataTable = Me.GetData()

            'Building an HTML string.
            Dim html As New StringBuilder()

            'Table start.
            html.Append("<table id='answers'  class='stripe'  border = '1'>")

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




    End Sub

    Protected Sub OnSelectedIndexChanged(sender As Object, e As EventArgs)
        Dim message As String = "view.aspx?ct=" & ddlCountry.SelectedItem.Value & "&nm=" & ddlCountry.SelectedItem.Value
        urIframe.Attributes.Add("src", message)
    End Sub

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        Dim message As String = "view.aspx?ct=" & ddlCountry.SelectedItem.Value & "&nm=" & ddlCountry.SelectedItem.Value
        urIframe.Attributes.Add("src", message)
    End Sub

    Private Function GetData() As DataTable
        Dim constr As String = Common.GetConnString()
        Using con As New SqlConnection(constr)
            Using cmd As New SqlCommand("SELECT countryName as 'Country', q1 as 'Question 1 (Renew)',q2 as ' Question 2 (Vice Chair)' ,q3 as 'Question 3 (Host Steering)', format(dateUpdated,'yy-MM-dd') as 'Date Updated' from _steeringCountry where scFlag = 'yes' order by countryName Asc ")
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