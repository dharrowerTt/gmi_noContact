Imports System.Data.SqlClient

Public Class bannerAdmin
    Inherits System.Web.UI.Page

    Private connString As String = Common.GetConnString()

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            LoadBanners()

        End If
    End Sub

    Private Sub LoadBanners()
        Using conn As New SqlConnection(connString)
            conn.Open()

            ' Step 1: Ensure active banners have sequential positions (1 → N)
            Dim reorderQuery As String = "
            WITH CTE AS (
                SELECT id, ROW_NUMBER() OVER (ORDER BY position ASC) AS newPos
                FROM homeBannerAdmin WHERE active = 1
            )
            UPDATE homeBannerAdmin SET position = CTE.newPos
            FROM CTE WHERE homeBannerAdmin.id = CTE.id"
            Using cmd As New SqlCommand(reorderQuery, conn)
                cmd.ExecuteNonQuery()
            End Using

            ' Step 2: Load banners in order (active banners first, sorted by position)
            Dim query As String = "SELECT id, bannerName, setDate, active, position 
                               FROM homeBannerAdmin 
                               ORDER BY active DESC, position ASC"
            Using cmd As New SqlCommand(query, conn)
                Dim reader As SqlDataReader = cmd.ExecuteReader()
                gvBanners.DataSource = reader
                gvBanners.DataBind()
            End Using
        End Using

        ' After loading, refresh position dropdowns
        UpdatePositionDropdowns()
    End Sub

    Private Sub UpdatePositionDropdowns()
        Dim activeBanners As New List(Of Integer)

        ' Fetch latest positions from database to ensure correct order
        Using conn As New SqlConnection(connString)
            conn.Open()
            Using cmd As New SqlCommand("SELECT id, position FROM homeBannerAdmin WHERE active = 1 ORDER BY position ASC", conn)
                Using reader As SqlDataReader = cmd.ExecuteReader()
                    While reader.Read()
                        activeBanners.Add(reader("id")) ' Store IDs in the order of their positions
                    End While
                End Using
            End Using
        End Using

        ' Now set dropdown values
        For Each row As GridViewRow In gvBanners.Rows
            Dim ddlPosition As DropDownList = CType(row.FindControl("ddlPosition"), DropDownList)
            Dim bannerId As Integer = Convert.ToInt32(gvBanners.DataKeys(row.RowIndex).Value)

            If ddlPosition IsNot Nothing Then
                ddlPosition.Items.Clear()
                ' Create dropdown list based on correct positions
                For i As Integer = 1 To activeBanners.Count
                    ddlPosition.Items.Add(New ListItem(i.ToString(), i.ToString()))
                Next
                ' Assign the correct current position based on updated SQL order
                ddlPosition.SelectedValue = (activeBanners.IndexOf(bannerId) + 1).ToString()
            End If
        Next
    End Sub




    Private Sub PopulatePositionDropdowns()
        ' Get the total count of active banners
        Dim activeBanners As New List(Of Integer)
        For Each row As GridViewRow In gvBanners.Rows
            Dim chkActive As CheckBox = CType(row.FindControl("chkActive"), CheckBox)
            If chkActive IsNot Nothing AndAlso chkActive.Checked Then
                activeBanners.Add(Convert.ToInt32(gvBanners.DataKeys(row.RowIndex).Value))
            End If
        Next

        activeBanners.Sort() ' Ensure they're in order

        ' Populate each dropdown with correct positions
        For Each row As GridViewRow In gvBanners.Rows
            Dim ddlPosition As DropDownList = CType(row.FindControl("ddlPosition"), DropDownList)
            Dim bannerId As Integer = Convert.ToInt32(gvBanners.DataKeys(row.RowIndex).Value)
            Dim currentPosition As Integer = GetCurrentPosition(bannerId)

            If ddlPosition IsNot Nothing Then
                ddlPosition.Items.Clear()
                For i As Integer = 1 To activeBanners.Count
                    ddlPosition.Items.Add(New ListItem(i.ToString(), i.ToString()))
                Next

                ' Set the current position as selected value
                If currentPosition > 0 Then
                    ddlPosition.SelectedValue = currentPosition.ToString()
                End If
            End If
        Next
    End Sub


    Private Function GetCurrentPosition(bannerId As Integer) As Integer
        Dim position As Integer = 0
        Using conn As New SqlConnection(connString)
            Dim query As String = "SELECT position FROM homeBannerAdmin WHERE id = @id"
            Using cmd As New SqlCommand(query, conn)
                cmd.Parameters.AddWithValue("@id", bannerId)
                conn.Open()
                Dim result As Object = cmd.ExecuteScalar()
                If result IsNot DBNull.Value Then
                    position = Convert.ToInt32(result)
                End If
            End Using
        End Using
        Return position
    End Function



    Protected Sub chkActive_CheckedChanged(sender As Object, e As EventArgs)
        Dim chk As CheckBox = CType(sender, CheckBox)
        Dim row As GridViewRow = CType(chk.NamingContainer, GridViewRow)
        Dim bannerId As Integer = Convert.ToInt32(gvBanners.DataKeys(row.RowIndex).Value)
        Dim isActive As Boolean = chk.Checked

        Using conn As New SqlConnection(connString)
            conn.Open()
            If isActive Then
                Dim newPosition As Integer = GetNextPosition(conn)
                Dim query As String = "UPDATE homeBannerAdmin SET active = 1, position = @position WHERE id = @id"
                Using cmd As New SqlCommand(query, conn)
                    cmd.Parameters.AddWithValue("@position", newPosition)
                    cmd.Parameters.AddWithValue("@id", bannerId)
                    cmd.ExecuteNonQuery()
                End Using
            Else
                Dim query As String = "UPDATE homeBannerAdmin SET active = 0, position = NULL WHERE id = @id"
                Using cmd As New SqlCommand(query, conn)
                    cmd.Parameters.AddWithValue("@id", bannerId)
                    cmd.ExecuteNonQuery()
                End Using
            End If
        End Using

        ' 🔥 Ensure sequential order and reload table
        LoadBanners()
    End Sub


    Private Function GetNextPosition(conn As SqlConnection) As Integer
        Dim query As String = "SELECT COALESCE(MAX(position), 0) + 1 FROM homeBannerAdmin WHERE active = 1"
        Using cmd As New SqlCommand(query, conn)
            Return Convert.ToInt32(cmd.ExecuteScalar())
        End Using
    End Function

    Protected Sub ddlPosition_SelectedIndexChanged(sender As Object, e As EventArgs)
        Dim ddl As DropDownList = CType(sender, DropDownList)
        Dim row As GridViewRow = CType(ddl.NamingContainer, GridViewRow)
        Dim bannerId As Integer = Convert.ToInt32(gvBanners.DataKeys(row.RowIndex).Value)
        Dim newPosition As Integer = Convert.ToInt32(ddl.SelectedValue)

        Using conn As New SqlConnection(connString)
            conn.Open()

            ' Step 1: Find the current position of the selected banner
            Dim currentPosition As Integer
            Using cmd As New SqlCommand("SELECT position FROM homeBannerAdmin WHERE id = @id", conn)
                cmd.Parameters.AddWithValue("@id", bannerId)
                currentPosition = Convert.ToInt32(cmd.ExecuteScalar())
            End Using

            ' Step 2: Shift affected banners
            If newPosition < currentPosition Then
                ' Moving up: Shift banners between newPosition and currentPosition down by 1
                Using cmd As New SqlCommand("
                UPDATE homeBannerAdmin 
                SET position = position + 1 
                WHERE position >= @newPosition AND position < @currentPosition", conn)
                    cmd.Parameters.AddWithValue("@newPosition", newPosition)
                    cmd.Parameters.AddWithValue("@currentPosition", currentPosition)
                    cmd.ExecuteNonQuery()
                End Using
            ElseIf newPosition > currentPosition Then
                ' Moving down: Shift banners between currentPosition and newPosition up by 1
                Using cmd As New SqlCommand("
                UPDATE homeBannerAdmin 
                SET position = position - 1 
                WHERE position > @currentPosition AND position <= @newPosition", conn)
                    cmd.Parameters.AddWithValue("@newPosition", newPosition)
                    cmd.Parameters.AddWithValue("@currentPosition", currentPosition)
                    cmd.ExecuteNonQuery()
                End Using
            End If

            ' Step 3: Assign the new position to the selected banner
            Using cmd As New SqlCommand("UPDATE homeBannerAdmin SET position = @newPosition WHERE id = @id", conn)
                cmd.Parameters.AddWithValue("@newPosition", newPosition)
                cmd.Parameters.AddWithValue("@id", bannerId)
                cmd.ExecuteNonQuery()
            End Using
        End Using

        ' Step 4: Reload banners and refresh dropdowns
        LoadBanners()
    End Sub




End Class
