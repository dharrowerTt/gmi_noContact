Imports System.Data
Imports System.Text
Imports System.Configuration
Imports System.Web.Services
Imports System.Web.Script.Services
Imports System.Data.SqlClient

<ScriptService()>
Public Class controlpanel
    Inherits System.Web.UI.Page
    Dim LookupValue As String = ""
    Public EventTitle As String = ""
    Public PlaceHolderCountries As String

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not (Request.QueryString("ID") Is Nothing) Then
            LookupValue = Request.QueryString("ID")
        Else
            LookupValue = 110
        End If

        Select Case LookupValue
            Case 110
                EventTitle = "Global Methane Forum 2020<br><a href='gmfspeakers.aspx'>GMF Speakers</a>"
            Case 101
                EventTitle = "Biogas Subcommittee Meeting - Oct 2019"
            Case 102
                EventTitle = "Coal Subcommittee Meeting - Nov 2019"
            Case 105
                EventTitle = "Steering Committee - Nov 2019"
        End Select

        If Not Me.IsPostBack Then

            Dim dt2 As DataTable = Me.GetCountryData()

            'Building an HTML string.
            Dim html2 As New StringBuilder()


            'Building the Data rows.

            For Each row As DataRow In dt2.Rows
                html2.Append("{'id':'")
                For Each column As DataColumn In dt2.Columns
                    html2.Append(row(column.ColumnName))
                Next
                html2.Append("','showAsSelected':  true},")
            Next


            'Append the HTML string to Placeholder.
            PlaceHolderCountries = html2.ToString


            'Populating a DataTable from database.
            Dim dt As DataTable = Me.GetData()

            If LookupValue = 110 Then
                dt = Me.GetGMFData()
            Else
                dt = Me.GetData()
            End If


            'Building an HTML string.
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
                html.Append("</tr>")
            Next
            html.Append("</tbody>")
            'Table end.
            html.Append("</table>")

            'Append the HTML string to Placeholder.
            PlaceHolder1.Controls.Add(New Literal() With {
          .Text = html.ToString()
        })


            Dim dt3 As DataTable = Me.GetCountryCountData()

            If LookupValue = 110 Then
                dt3 = Me.GetCountryData()
            Else
                dt3 = Me.GetData()
            End If


            'Building an HTML string.
            Dim html3 As New StringBuilder()

            'Table start.
            html3.Append("<table class='hover' border = '1'>")

            'Building the Header row.
            html3.Append("<thead><tr>")
            For Each column As DataColumn In dt3.Columns
                html3.Append("<th>")
                html3.Append(column.ColumnName)
                html3.Append("</th>")
            Next

            html3.Append("</tr></thead>")

            'Building the Data rows.
            html3.Append("<tbody>")
            For Each row As DataRow In dt3.Rows
                html3.Append("<tr id='")
                html3.Append(row(0))
                html3.Append("'>")
                For Each column As DataColumn In dt3.Columns
                    html3.Append("<td>")
                    html3.Append(row(column.ColumnName))
                    html3.Append("</td>")
                Next
                html3.Append("</tr>")
            Next
            html3.Append("</tbody>")
            'Table end.
            html3.Append("</table>")

            'Append the HTML string to Placeholder.
            PlaceHolder3.Controls.Add(New Literal() With {
          .Text = html3.ToString()
        })

        End If
    End Sub

    Private Function GetData() As DataTable
        Dim constr As String = Common.GetConnString()
        Using con As SqlConnection = New SqlConnection(constr)

            Using cmd As New SqlCommand("SELECT _registercontact.contactID, fName as 'First Name', lName as 'Last Name', organization as 'Company', email as 'E-Mail Address', CONVERT(varchar, createDate,7) As 'Register Date', CONVERT(varchar, reminder,7) as 'Reminder Email Sent' from _registercontact LEFT JOIN _registervisa on _registercontact.contactID = _registervisa.contactID WHERE EventID = " & LookupValue)
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

    Private Function GetGMFData() As DataTable
        Dim constr As String = Common.GetConnString()
        Using con As SqlConnection = New SqlConnection(constr)

            Using cmd As New SqlCommand("SELECT _registercontact.contactID, fName as 'First Name', lName as 'Last Name', organization as 'Company', email as 'E-Mail Address', CONVERT(varchar, createDate,7) As 'Register Date', CONVERT(varchar, reminder,7) as 'Reminder Email Sent', fullCountryName as Country, sectorGMF As Sector from _registercontact left join _countryLookUp on _registercontact.country =  _countryLookUp.iso2 WHERE EventID = " & LookupValue)
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

    Private Function GetCountryData() As DataTable
        Dim constr As String = Common.GetConnString()
        Using con As SqlConnection = New SqlConnection(constr)


            Using cmd As New SqlCommand("select distinct country FROM _registercontact where not country in ('null','US') and eventID = 110")
                cmd.CommandType = CommandType.Text
                cmd.Connection = con
                con.Open()
                Using sda As New SqlDataAdapter()
                    cmd.Connection = con
                    sda.SelectCommand = cmd
                    Using dt2 As New DataTable()
                        sda.Fill(dt2)
                        Return dt2
                    End Using
                End Using
                con.Close()
            End Using
        End Using


    End Function

    Private Function GetCountryCountData() As DataTable
        Dim constr As String = Common.GetConnString()
        Using con As SqlConnection = New SqlConnection(constr)


            Using cmd As New SqlCommand("select distinct country as 'Country', count(country) FROM _registercontact where not country in ('null') and eventID = 110 group by Country")
                cmd.CommandType = CommandType.Text
                cmd.Connection = con
                con.Open()
                Using sda3 As New SqlDataAdapter()
                    cmd.Connection = con
                    sda3.SelectCommand = cmd
                    Using dt3 As New DataTable()
                        sda3.Fill(dt3)
                        Return dt3
                    End Using
                End Using
                con.Close()
            End Using
        End Using


    End Function

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        Response.Redirect("controlpanel.aspx?ID=" + eventID.Text, True)
    End Sub

    Public Shared Function AddProductToCart(pID As String, qty As String, lblType As String) As String

        Dim numCode As Int16 = 16

    End Function

End Class