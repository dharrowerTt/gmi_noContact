Imports System.Data.SqlClient
Imports System.Web.Services

Partial Class Toolbox
    Inherits System.Web.UI.Page

    ' Explicitly declare the Repeater control as Protected
    Protected WithEvents rptSubmissions As Global.System.Web.UI.WebControls.Repeater

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            BindSubmissionsRepeater()
        End If
    End Sub

    Private Sub BindSubmissionsRepeater()
        Using conn As New SqlConnection(Common.GetConnString())
            Dim sql As String = "SELECT ID, csTitle, SubmitterName, DateSubmitted, Status FROM csstudies where parent is NULL"
            Using cmd As New SqlCommand(sql, conn)
                conn.Open()
                Dim reader As SqlDataReader = cmd.ExecuteReader()
                rptSubmissions.DataSource = reader
                rptSubmissions.DataBind()
            End Using
        End Using
    End Sub

    <WebMethod()>
    Public Shared Function UpdateStatus(id As Integer, status As String) As Boolean
        Using conn As New SqlConnection(Common.GetConnString())
            Dim sql As String = "UPDATE csstudies SET Status = @Status WHERE ID = @ID"
            Using cmd As New SqlCommand(sql, conn)
                cmd.Parameters.AddWithValue("@ID", id)
                cmd.Parameters.AddWithValue("@Status", status)
                conn.Open()
                cmd.ExecuteNonQuery()
                Return True
            End Using
        End Using
    End Function
End Class
