Imports System.Data
Imports System.Text
Imports System.Configuration
Imports System.Web.Services
Imports System.Web.Script.Services
Imports System.IO
Imports System.Data.SqlClient
Public Class gmfspeakers
    Inherits System.Web.UI.Page
    Dim UserID As String = ""
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        Dim dt As DataTable = Me.GetGMFData()

        'Building an HTML string.
        Dim html As New StringBuilder()

        'Table start.
        html.Append("<table id='table_id' class='table' border = '1'>")

        'Building the Header row.
        html.Append("<thead><tr>")
        For Each column As DataColumn In dt.Columns
            html.Append("<th>")
            html.Append(column.ColumnName)
            html.Append("</th>")
        Next
        html.Append("<th>Waiver</th>")
        html.Append("<th>Presentation</th>")
        html.Append("</tr></thead>")

        'Building the Data rows.
        html.Append("<tbody>")
        For Each row As DataRow In dt.Rows
            html.Append("<tr id='")
            html.Append(row(0))
            html.Append("'>")
            For Each column As DataColumn In dt.Columns
                html.Append("<td>")
                html.Append(row(column.ColumnName))
                html.Append("</td>")
            Next
            html.Append("<td>")
            UserID = row(0) & row(1)


            Dim waiverPath As String = Server.MapPath("/gmf2020/speakers/" & UserID & "/waiver/")
            'Check whether Directory (Folder) exists.
            If Directory.Exists(waiverPath) Then

                Dim filePaths() As String = Directory.GetFiles(Server.MapPath("/gmf2020/speakers/" & UserID & "/waiver/"))
                Dim files As List(Of ListItem) = New List(Of ListItem)
                For Each filePath As String In filePaths
                    html.Append(New ListItem(Path.GetFileName(filePath), filePath))
                Next
            End If

            html.Append("</td>")
            html.Append("<td>")

            Dim uploadPath As String = Server.MapPath("/gmf2020/speakers/" & UserID & "/files/")

            'Check whether Directory (Folder) exists.
            If Directory.Exists(uploadPath) Then

                Dim filePaths() As String = Directory.GetFiles(Server.MapPath("/gmf2020/speakers/" & UserID & "/files/"))
                Dim files As List(Of ListItem) = New List(Of ListItem)
                For Each filePath As String In filePaths
                    html.Append(New ListItem(Path.GetFileName(filePath), filePath))
                Next

            End If


            html.Append("</td>")
            html.Append("</tr>")
        Next
        html.Append("</tbody>")
        'Table end.
        html.Append("</table>")

        'Append the HTML string to Placeholder.
        PlaceHolder1.Controls.Add(New Literal() With {
      .Text = html.ToString()
          })
    End Sub


    Private Function GetGMFData() As DataTable
        Dim constr As String = Common.GetConnString()
        Using con As SqlConnection = New SqlConnection(constr)

            Using cmd As New SqlCommand("SELECT fName as 'First Name', lName as 'Last Name', jobTitle as 'Title', organization as 'Organization', phone as 'Phone', email as 'Email', bio as 'Biography', 'https://www.globalmethane.org/gmf2020/speakers/' + fName + lName + '/image/' + profilepic as 'Profile Picture', speakerTopic as 'Sector' FROM _registercontact WHERE EventID = 110 and speakerstatus = 1")
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