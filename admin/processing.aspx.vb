Imports System.IO
Imports System.Data
Imports System.Data.SqlClient
Imports System.Configuration
Public Class processing
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub Upload(sender As Object, e As EventArgs)
        'Upload and save the file.
        Dim csvPath As String = Server.MapPath("~/Files/") + Path.GetFileName(FileUpload1.PostedFile.FileName)
        FileUpload1.SaveAs(csvPath)

        Dim dt As New DataTable()
        dt.Columns.AddRange(New DataColumn(11) {New DataColumn("resourceName", GetType(String)), New DataColumn("resourceLink", GetType(String)), New DataColumn("resourcePages", GetType(Integer)), New DataColumn("resourceSize", GetType(String)), New DataColumn("resourceFiledate", GetType(Date)), New DataColumn("resourceSource", GetType(String)), New DataColumn("filetypeID", GetType(Integer)), New DataColumn("resourcecategoryID", GetType(Integer)), New DataColumn("resourceImage", GetType(String)), New DataColumn("status", GetType(String)), New DataColumn("shortName", GetType(String)), New DataColumn("ResourceTopic", GetType(String))})

        Dim csvData As String = File.ReadAllText(csvPath)
        For Each row As String In csvData.Split(ControlChars.Lf).Skip(1)
            If Not String.IsNullOrEmpty(row) Then
                dt.Rows.Add()
                Dim i As Integer = 0
                For Each cell As String In row.Split(","c)
                    dt.Rows(dt.Rows.Count - 1)(i) = cell
                    i += 1
                Next
            End If
        Next

        Dim TableCount As Integer = dt.Rows.Count

        Dim consString As String = Common.GetConnString()
        Using con As New SqlConnection(consString)
            Using sqlBulkCopy As New SqlBulkCopy(con)
                'Set the database table name.
                sqlBulkCopy.DestinationTableName = "dbo.Resources"
                sqlBulkCopy.ColumnMappings.Add("resourceName", "resourceName")
                sqlBulkCopy.ColumnMappings.Add("resourceLink", "resourceLink")
                sqlBulkCopy.ColumnMappings.Add("resourcePages", "resourcePages")
                sqlBulkCopy.ColumnMappings.Add("resourceSize", "resourceSize")
                sqlBulkCopy.ColumnMappings.Add("resourceFiledate", "resourceFiledate")
                sqlBulkCopy.ColumnMappings.Add("resourceSource", "resourceSource")
                sqlBulkCopy.ColumnMappings.Add("filetypeID", "filetypeID")
                sqlBulkCopy.ColumnMappings.Add("resourcecategoryID", "resourcecategoryID")
                sqlBulkCopy.ColumnMappings.Add("resourceImage", "resourceImage")
                sqlBulkCopy.ColumnMappings.Add("shortName", "shortName")
                sqlBulkCopy.ColumnMappings.Add("ResourceTopic", "ResourceTopic")
                con.Open()
                sqlBulkCopy.WriteToServer(dt)
                con.Close()
            End Using
        End Using

        Using con As New SqlConnection(consString)
            Using cmd As New SqlCommand("SELECT TOP " & TableCount & " resourceid, resourceName FROM dbo.Resources order by resourceid desc", con)
                cmd.CommandType = CommandType.Text
                Using sda As New SqlDataAdapter(cmd)
                    Using dt2 As New DataTable()
                        sda.Fill(dt)
                        GridView1.DataSource = dt2
                        GridView1.DataBind()
                    End Using
                End Using
            End Using
        End Using

    End Sub

End Class