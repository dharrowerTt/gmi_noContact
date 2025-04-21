Imports System.Data.SqlClient

Public Class case_studies_featured
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            BindCaseStudies()
        End If
    End Sub

    Private Sub BindCaseStudies()
        Dim connString As String = Common.GetConnString()
        Dim query As String = "
            SELECT c.ID, c.csTitle, 
                   CASE WHEN f.csID IS NOT NULL THEN CAST(1 AS BIT) ELSE CAST(0 AS BIT) END AS isFeatured, 
                   f.dateAdded
            FROM csCaseStudyRecords c
            LEFT JOIN csFeatured f ON c.ID = f.csID
        "

        Using conn As New SqlConnection(connString)
            Using cmd As New SqlCommand(query, conn)
                conn.Open()
                Dim reader As SqlDataReader = cmd.ExecuteReader()
                gvCaseStudies.DataSource = reader
                gvCaseStudies.DataBind()
            End Using
        End Using
    End Sub

    Protected Sub gvCaseStudies_PreRender(sender As Object, e As EventArgs) Handles gvCaseStudies.PreRender
        gvCaseStudies.UseAccessibleHeader = True
        gvCaseStudies.HeaderRow.TableSection = TableRowSection.TableHeader
    End Sub

    Protected Sub cbFeatured_CheckedChanged(sender As Object, e As EventArgs)
        Dim cb As CheckBox = CType(sender, CheckBox)
        Dim row As GridViewRow = CType(cb.NamingContainer, GridViewRow)
        Dim csID As Integer = Convert.ToInt32(gvCaseStudies.DataKeys(row.RowIndex).Value)
        Dim isAdding As Boolean = cb.Checked

        If isAdding Then
            AddToFeatured(csID)
        Else
            If CountFeatured() > 3 Then
                RemoveFromFeatured(csID)
            Else
                ShowAlert("At least three featured items are required.")
                cb.Checked = True
            End If
        End If
        BindCaseStudies()
    End Sub

    Private Function CountFeatured() As Integer
        Dim connString As String = Common.GetConnString()
        Dim query As String = "SELECT COUNT(*) FROM csFeatured"
        Using conn As New SqlConnection(connString)
            Using cmd As New SqlCommand(query, conn)
                conn.Open()
                Return Convert.ToInt32(cmd.ExecuteScalar())
            End Using
        End Using
    End Function

    Private Sub AddToFeatured(csID As Integer)
        Dim connString As String = Common.GetConnString()
        Dim query As String = "INSERT INTO csFeatured (csID, dateAdded) VALUES (@csID, GETDATE())"
        Using conn As New SqlConnection(connString)
            Using cmd As New SqlCommand(query, conn)
                cmd.Parameters.AddWithValue("@csID", csID)
                conn.Open()
                cmd.ExecuteNonQuery()
            End Using
        End Using
        ShowAlert("Case study added to featured.")
    End Sub

    Private Sub RemoveFromFeatured(csID As Integer)
        Dim connString As String = Common.GetConnString()
        Dim query As String = "DELETE FROM csFeatured WHERE csID = @csID"
        Using conn As New SqlConnection(connString)
            Using cmd As New SqlCommand(query, conn)
                cmd.Parameters.AddWithValue("@csID", csID)
                conn.Open()
                cmd.ExecuteNonQuery()
            End Using
        End Using
        ShowAlert("Case study removed from featured.")
    End Sub

    Private Sub ShowAlert(message As String)
        ClientScript.RegisterStartupScript(Me.GetType(), "Alert", $"Swal.fire({{title: '{message}', icon: 'info', confirmButtonText: 'OK'}});", True)
    End Sub

End Class
