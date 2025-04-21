Imports System.Data
Imports System.Configuration
Imports System.Data.SqlClient
Public Class create
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        ListSpeakers(email.Text, e)

    End Sub

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click

        Dim constr As String = Common.GetConnString()


        Using con As SqlConnection = New SqlConnection(constr)
            Using cmd As SqlCommand = New SqlCommand("select count(*) As CountofRows FROM _registercontact where email = '" & email.Text & "' and eventID = 110")
                cmd.CommandType = CommandType.Text
                cmd.Connection = con
                con.Open()
                Using sdr As SqlDataReader = cmd.ExecuteReader()
                    sdr.Read()
                    If sdr("CountofRows") > 0 Then
                        UpdateSpeaker(email.Text, e)
                    Else
                        AddSpeaker(email.Text, e)
                    End If

                    Label1.Text = fName.Text + " " + lName.Text + " has been activated as a speaker."

                    fName.Text = ""
                    lName.Text = ""
                    organization.Text = ""
                    email.Text = ""

                End Using
                con.Close()
            End Using
        End Using

        ListSpeakers(email.Text, e)

    End Sub

    Protected Sub AddSpeaker(sender As Object, e As EventArgs)

        Dim sqlText = "INSERT INTO _registercontact (fName, lName, organization, email, createDate, speakerstatus,eventID) VALUES (@fname, @lname, @organization, @email, @createdate , 1,110);"
        Using cnConnect = New SqlConnection(Common.GetConnString())
            Using cm = New SqlCommand(sqlText, cnConnect)
                cnConnect.Open()
                cm.Parameters.Add("@fname", SqlDbType.NVarChar).Value = fName.Text
                cm.Parameters.Add("@lname", SqlDbType.NVarChar).Value = lName.Text
                cm.Parameters.Add("@email", SqlDbType.NVarChar).Value = email.Text
                cm.Parameters.Add("@organization", SqlDbType.NVarChar).Value = organization.Text
                cm.Parameters.Add("@createdate", SqlDbType.Date).Value = Date.Today

                cm.ExecuteNonQuery()
            End Using
        End Using


    End Sub

    Protected Sub UpdateSpeaker(sender As Object, e As EventArgs)

        Dim sqlText = "UPDATE _registercontact SET speakerstatus = 1, fName = @fname, lName = @lname, organization = @organization WHERE email= @email and eventID = 110"
        Using cnConnect = New SqlConnection(Common.GetConnString())
            Using cm = New SqlCommand(sqlText, cnConnect)
                cnConnect.Open()
                cm.Parameters.Add("@fname", SqlDbType.NVarChar).Value = fName.Text
                cm.Parameters.Add("@lname", SqlDbType.NVarChar).Value = lName.Text
                cm.Parameters.Add("@email", SqlDbType.NVarChar).Value = email.Text
                cm.Parameters.Add("@organization", SqlDbType.NVarChar).Value = organization.Text

                cm.ExecuteNonQuery()
            End Using
        End Using

    End Sub

    Private Function GetData() As DataTable
        Dim constr As String = Common.GetConnString()
        Using con As SqlConnection = New SqlConnection(constr)

            Using cmd As New SqlCommand("SELECT fName as 'First Name', lName as 'Last Name', organization as 'Company', email as 'E-Mail Address' from _registercontact WHERE EventID = 110 AND speakerstatus = 1")
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

    Private Function ListSpeakers(sender As Object, e As EventArgs)

        PlaceHolder1.Controls.Clear()

        Dim CounterNumber As Integer = 0

        Dim dt As DataTable = Me.GetData()
        dt = Me.GetData()
        Dim html As New StringBuilder()

        'Table start.
        html.Append("<table id='table' class='hover' border = '1'>")

        'Building the Header row.
        html.Append("<thead><tr>")
        For Each column As DataColumn In dt.Columns
            html.Append("<th>")
            html.Append(column.ColumnName)
            html.Append("</th>")
        Next
        html.Append("<th>Registration Link</th>")
        html.Append("<th>View Submissions</th>")
        html.Append("</tr></thead>")

        'Building the Data rows.
        html.Append("<tbody>")
        For Each row As DataRow In dt.Rows
            CounterNumber = 0
            html.Append("<tr id='")
            html.Append(row(0))
            html.Append("'>")
            For Each column As DataColumn In dt.Columns
                CounterNumber = CounterNumber + 1
                html.Append("<td>")
                html.Append(row(column.ColumnName))
                html.Append("</td>")
                If CounterNumber = 4 Then
                    html.Append("<td>")
                    html.Append("https://www.globalmethane.org/gmf2020/regform.aspx?id=" & row(3))
                    html.Append("</td>")
                    html.Append("<td>")
                    html.Append("https://www.globalmethane.org/gmf2020/speakers/info.aspx?id=" & row(3))
                    html.Append("</td>")
                End If
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


    End Function


End Class