Imports System.Data.SqlClient
Imports System.Data
Public Class index20
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub
    Public Sub PullData()
        Button1.Visible = False
        GridView1.Visible = False
        txtCopied.Visible = False


        Dim query As String = "SELECT _2024UNECEreg.email as 'UNECEemail', __2024register.email as 'GMIemail', _2024UNECEreg.status as 'UNECEstatus', _2024UNECEreg.visaSupportLetter as 'UNECEparticipation', __2024register.attendanceType as 'GMIparticipation'
FROM _2024UNECEreg
FULL OUTER JOIN __2024register ON _2024UNECEreg.email=__2024register.email  where _2024UNECEreg.visaSupportLetter !='Online' or __2024register.attendanceType !='Virtually'
ORDER BY _2024UNECEreg.status;"

        Using con As New SqlConnection(Common.GetConnString())
            Using cmd As New SqlCommand(query)
                Using sda As New SqlDataAdapter()
                    cmd.Connection = con
                    sda.SelectCommand = cmd
                    Using ds As New DataSet()
                        sda.Fill(ds)
                        gvComms.DataSource = ds.Tables(0)
                        gvComms.DataBind()
                        gvComms.HeaderRow.TableSection = TableRowSection.TableHeader
                    End Using
                End Using
            End Using
        End Using


        Dim query2 As String = "SELECT _2024UNECEreg.email as 'UNECEemail', __2024register.email as 'GMIemail', _2024UNECEreg.status as 'UNECEstatus', _2024UNECEreg.visaSupportLetter as 'UNECEparticipation', __2024register.attendanceType as 'GMIparticipation'
FROM _2024UNECEreg
Left JOIN __2024register ON _2024UNECEreg.email=__2024register.email  where _2024UNECEreg.visaSupportLetter !='Online' or __2024register.attendanceType !='Virtually'
ORDER BY _2024UNECEreg.status;"

        Using con As New SqlConnection(Common.GetConnString())
            Using cmd As New SqlCommand(query2)
                Using sda As New SqlDataAdapter()
                    cmd.Connection = con
                    sda.SelectCommand = cmd
                    Using ds As New DataSet()
                        sda.Fill(ds)
                        gvComms2.DataSource = ds.Tables(0)
                        gvComms2.DataBind()
                        gvComms2.HeaderRow.TableSection = TableRowSection.TableHeader
                    End Using
                End Using
            End Using
        End Using


        Dim query3 As String = "SELECT __2024register.email as 'GMIemail', _2024UNECEreg.email as 'UNECEemail', _2024UNECEreg.status as 'UNECEstatus', _2024UNECEreg.visaSupportLetter as 'UNECEparticipation', __2024register.attendanceType as 'GMIparticipation'
FROM __2024register
Left JOIN _2024UNECEreg ON __2024register.email=_2024UNECEreg.email  where _2024UNECEreg.visaSupportLetter !='Online' or __2024register.attendanceType !='Virtually'
ORDER BY _2024UNECEreg.status;"

        Using con As New SqlConnection(Common.GetConnString())
            Using cmd As New SqlCommand(query3)
                Using sda As New SqlDataAdapter()
                    cmd.Connection = con
                    sda.SelectCommand = cmd
                    Using ds As New DataSet()
                        sda.Fill(ds)
                        gvComms3.DataSource = ds.Tables(0)
                        gvComms3.DataBind()
                        gvComms3.HeaderRow.TableSection = TableRowSection.TableHeader
                    End Using
                End Using
            End Using
        End Using

        gvComms.Visible = True
        gvComms2.Visible = True
        gvComms3.Visible = True
        Label1.Visible = False
        Label2.Visible = True
        Label3.Visible = True
        Button2.Visible = False
    End Sub
    Protected Sub PasteToGridView(sender As Object, e As EventArgs)
        Dim dt As New DataTable()
        dt.Columns.AddRange(New DataColumn(4) {New DataColumn("regDate", GetType(Date)), New DataColumn("email", GetType(String)), New DataColumn("status", GetType(String)), New DataColumn("visaSupportLetter", GetType(String)), New DataColumn("modeOfParticipation", GetType(String))})

        Dim copiedContent As String = Request.Form(txtCopied.UniqueID)
        For Each row As String In copiedContent.Split(ControlChars.Lf)
            If Not String.IsNullOrEmpty(row) Then
                dt.Rows.Add()
                Dim i As Integer = 0
                For Each cell As String In row.Split(ControlChars.Tab)
                    dt.Rows(dt.Rows.Count - 1)(i) = cell
                    i += 1
                Next
            End If
        Next
        GridView1.DataSource = dt
        GridView1.DataBind()
        txtCopied.Text = ""
        Button1.Visible = True
    End Sub

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click


        Dim sqlText = "delete from dbo._2024UNECEreg"
        Using cnConnect = New SqlConnection(Common.GetConnString())
            Using cm = New SqlCommand(sqlText, cnConnect)
                cnConnect.Open()

                Dim currentID As Integer = cm.ExecuteScalar()
                'Set the ID value to RowNumber for redirection

            End Using
        End Using

        Dim dt As New DataTable()
        dt.Columns.AddRange(New DataColumn(4) {New DataColumn("regDate", GetType(Date)), New DataColumn("email", GetType(String)), New DataColumn("status", GetType(String)), New DataColumn("visaSupportLetter", GetType(String)), New DataColumn("modeOfParticipation", GetType(String))})
        For Each row As GridViewRow In GridView1.Rows

            Dim regDate As Date = row.Cells(0).Text
            Dim email As String = row.Cells(1).Text
            Dim status As String = row.Cells(2).Text
            Dim visaSupportLetter As String = row.Cells(3).Text
            Dim modeOfParticipation As String = row.Cells(4).Text.Replace(vbCr, "")
            dt.Rows.Add(regDate, email, status, modeOfParticipation)

        Next
        If dt.Rows.Count > 0 Then
            Using con As New SqlConnection(Common.GetConnString())
                Using sqlBulkCopy As New SqlBulkCopy(con)
                    'Set the database table name
                    sqlBulkCopy.DestinationTableName = "dbo._2024UNECEreg"

                    '[OPTIONAL]: Map the DataTable columns with that of the database table
                    sqlBulkCopy.ColumnMappings.Add("regDate", "regDate")
                    sqlBulkCopy.ColumnMappings.Add("email", "email")
                    sqlBulkCopy.ColumnMappings.Add("status", "status")
                    sqlBulkCopy.ColumnMappings.Add("visaSupportLetter", "visaSupportLetter")
                    sqlBulkCopy.ColumnMappings.Add("modeOfParticipation", "modeOfParticipation")
                    con.Open()
                    sqlBulkCopy.WriteToServer(dt)
                    con.Close()
                End Using
            End Using
        End If

        PullData()

    End Sub

    Protected Sub Button2_Click(sender As Object, e As EventArgs) Handles Button2.Click
        PullData()
    End Sub
End Class