Imports System.Data.SqlClient
Imports System.Web.UI.HtmlControls

Public Class edit_directory
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            LoadPages()
        End If
    End Sub

    Private Sub LoadPages()
        Dim connString As String = Common.GetConnString()
        Dim query As String = "SELECT id, displayName, lastEditedDate, lastEditedBy FROM EditablePages ORDER BY displayName"
        Dim htmlOutput As New StringBuilder()

        Using conn As New SqlConnection(connString)
            Using cmd As New SqlCommand(query, conn)
                conn.Open()

                Using reader As SqlDataReader = cmd.ExecuteReader()
                    If reader.HasRows Then
                        While reader.Read()
                            Dim id As Integer = reader("id")
                            Dim name As String = reader("displayName").ToString()
                            Dim lastEditedDate As String = If(IsDBNull(reader("lastEditedDate")), "N/A", Convert.ToDateTime(reader("lastEditedDate")).ToString("yyyy-MM-dd HH:mm"))
                            Dim lastEditedBy As String = If(IsDBNull(reader("lastEditedBy")), "N/A", reader("lastEditedBy").ToString())

                            htmlOutput.Append("<tr>")
                            htmlOutput.AppendFormat("<td>{0}</td>", name)
                            htmlOutput.AppendFormat("<td>{0}</td>", lastEditedDate)
                            htmlOutput.AppendFormat("<td>{0}</td>", lastEditedBy)
                            htmlOutput.AppendFormat("<td><a href='edit-page.aspx?id={0}' class='btn btn-primary'>Edit</a></td>", id)
                            htmlOutput.Append("</tr>")
                        End While
                    Else
                        htmlOutput.Append("<tr><td colspan='4' class='text-center'>No pages found.</td></tr>")
                    End If
                End Using
            End Using
        End Using

        ' Inject the generated rows into the table
        Dim tableBody As HtmlGenericControl = CType(FindControlRecursive(Me, "tableBody"), HtmlGenericControl)
        If tableBody IsNot Nothing Then
            tableBody.InnerHtml = htmlOutput.ToString()
        End If
    End Sub

    Private Function FindControlRecursive(root As Control, id As String) As Control
        If root.ID = id Then
            Return root
        End If

        For Each child As Control In root.Controls
            Dim foundControl As Control = FindControlRecursive(child, id)
            If foundControl IsNot Nothing Then
                Return foundControl
            End If
        Next

        Return Nothing
    End Function
End Class
