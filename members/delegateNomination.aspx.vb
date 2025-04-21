Imports System.Data
Imports System.Configuration
Imports System.Data.SqlClient
Imports System.Collections.Generic
Public Class delegateNomination
    Inherits System.Web.UI.Page
    Public countryID As String
    Public userID As String
    Public countryName As String
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        countryID = Server.HtmlEncode(Request.QueryString("ct"))
        'countryID = "DE44189E-3D39-4FF7-8A30-1087E93CD76C"
        'userID = Server.HtmlEncode(Request.QueryString("usr"))
        'userID = "f295930e-b130-415b-b04a-d4cacb1d1e34"
        Dim ErrorURL As String = "https://www.globalmethane.org"

        If Len(countryID) < 5 Then

            Response.Redirect(ErrorURL)

        End If

        If countryID = "3c620e47-aad5-4910-a1ad-25252dac2b00" Then
            countryName = "Madagascar"
        Else
            countryName = "Republic of North Macedonia"
        End If

        '   If Not Me.IsPostBack Then
        'Populating a DataTable from database.
        Dim dt As DataTable = Me.GetData()

            'Building an HTML string.
            Dim html As New StringBuilder()

            'Table start.
            html.Append("<table id='nominees'  class='stripe'  border = '1'>")

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
        '  End If

    End Sub

    Private Function GetData() As DataTable
        Dim constr As String = Common.GetConnString()
        Using con As New SqlConnection(constr)
            Using cmd As New SqlCommand("SELECT userid as 'Manage', firstName as 'Name', lastName, organization as 'Organization', nomination as 'Nomination', emailAddress as 'Email Address' FROM _mbrCountryLookup LEFT JOIN _mbrDelegateLookUp ON _mbrCountryLookup.countryName = _mbrDelegateLookUp.country where _mbrCountryLookup.cID = '2B93BC96-219C-4A8F-8189-A2B485691270'")
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

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click


        Dim NomAnswer As String = nominate.SelectedValue

        Dim thanksURL As String = "thanks.aspx"
        Dim roleAnswer As String = ""
        Dim ALAnswer As String = ""


        Dim sqlText = "INSERT INTO _mbrDelegateLookUp(firstName,lastName,organization,emailAddress,phoneNumber,title,created,country,nomination) Values( @firstname, @lastname, @organswer, @emailAddress,@telephone, @role, @created, @country, @nomination)"
        Using cnConnect = New SqlConnection(Common.GetConnString())
            Using cm = New SqlCommand(sqlText, cnConnect)
                cnConnect.Open()
                cm.Parameters.Add("@firstname", SqlDbType.NVarChar).Value = firstName.Text.Replace(vbCr, "").Replace(vbLf, "")
                cm.Parameters.Add("@lastname", SqlDbType.NVarChar).Value = lastName.Text.Replace(vbCr, "").Replace(vbLf, "")
                cm.Parameters.Add("@organswer", SqlDbType.NVarChar).Value = organization.Text
                cm.Parameters.Add("@emailAddress", SqlDbType.NVarChar).Value = email.Text
                cm.Parameters.Add("@role", SqlDbType.NVarChar).Value = title.Text
                cm.Parameters.Add("@telephone", SqlDbType.NVarChar).Value = telephone.Text
                cm.Parameters.Add("@created", SqlDbType.NVarChar).Value = DateTime.Now()
                cm.Parameters.Add("@country", SqlDbType.NVarChar).Value = "North Macedonia"
                cm.Parameters.Add("@nomination", SqlDbType.NVarChar).Value = NomAnswer



                cm.ExecuteNonQuery()
            End Using
        End Using

        Response.Redirect(thanksURL)
    End Sub
End Class