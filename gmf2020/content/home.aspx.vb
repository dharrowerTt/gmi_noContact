Imports System.Data
Imports System.Configuration
Imports System.Data.SqlClient

Public Class home
    Inherits System.Web.UI.Page
    Private regCode As String
    Dim EventID As Int16 = 110
    Public PlaceHolder1 As String


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not Me.IsPostBack Then
            'Populating a DataTable from database.
            Dim dt As DataTable = Me.GetData()

            'Building an HTML string.
            Dim html As New StringBuilder()


            'Building the Data rows.

            For Each row As DataRow In dt.Rows
                html.Append("{'id':'")
                For Each column As DataColumn In dt.Columns
                    html.Append(row(column.ColumnName))
                Next
                html.Append("','showAsSelected':  true},")
            Next


            'Append the HTML string to Placeholder.
            PlaceHolder1 = html.ToString

        End If


    End Sub


    Private Function GetData() As DataTable
        Dim constr As String = Common.GetConnString()
        Using con As SqlConnection = New SqlConnection(constr)


            Using cmd As New SqlCommand("select distinct country FROM _registercontact where not country in ('null','US') and eventID = " & EventID)
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