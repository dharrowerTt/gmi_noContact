Imports System.Data
Imports System.Data.SqlClient

Public Class resource_management
    Inherits System.Web.UI.Page

    Private resourceId As Integer? = Nothing
    Private connString As String = Common.GetConnString()

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs) Handles Me.Load
        ' Check if this is editing an existing resource
        If Not String.IsNullOrEmpty(Request.QueryString("resourceid")) Then
            resourceId = Convert.ToInt32(Request.QueryString("resourceid"))
        End If

        If Not IsPostBack Then
            LoadSectors()
            If resourceId.HasValue Then
                LoadResourceDetails(resourceId.Value)
                PreselectSectors(resourceId.Value)
            End If
        End If
    End Sub

    ' Populate sectors list
    Private Sub LoadSectors()
        Dim sectors As New Dictionary(Of String, String) From {
            {"agri", "Agriculture"},
            {"biogas", "Biogas"},
            {"coal", "Coal Mines"},
            {"msw", "Municipal Solid Waste"},
            {"oilngas", "Oil & Gas"},
            {"steer", "Steering"},
            {"ww", "Wastewater"}
        }

        lstSectors.Items.Clear()
        For Each kvp In sectors
            lstSectors.Items.Add(New ListItem(kvp.Value, kvp.Key))
        Next
    End Sub

    ' Pre-select sectors for editing
    Private Sub PreselectSectors(resourceId As Integer)
        Using conn As New SqlConnection(connString)
            Dim query As String = "SELECT sector FROM cross_resource_sector WHERE resourceid = @resourceid"
            Using cmd As New SqlCommand(query, conn)
                cmd.Parameters.AddWithValue("@resourceid", resourceId)
                conn.Open()
                Dim reader As SqlDataReader = cmd.ExecuteReader()
                While reader.Read()
                    Dim sector = reader("sector").ToString()
                    Dim item = lstSectors.Items.FindByValue(sector)
                    If item IsNot Nothing Then item.Selected = True
                End While
            End Using
        End Using
    End Sub

    ' Load resource details for editing
    Private Sub LoadResourceDetails(resourceId As Integer)
        Using conn As New SqlConnection(connString)
            Dim query As String = "SELECT resourceName, status, resourcePages, author, shortName FROM Resources WHERE resourceid = @resourceid"
            Using cmd As New SqlCommand(query, conn)
                cmd.Parameters.AddWithValue("@resourceid", resourceId)
                conn.Open()
                Dim reader As SqlDataReader = cmd.ExecuteReader()
                If reader.Read() Then
                    txtResourceName.Text = reader("resourceName").ToString()
                    rblStatus.SelectedValue = reader("status").ToString()
                    txtResourcePages.Text = If(IsDBNull(reader("resourcePages")), "", reader("resourcePages").ToString())
                    txtAuthor.Text = reader("author").ToString()
                    txtShortName.Text = reader("shortName").ToString()
                End If
            End Using
        End Using
    End Sub

    ' Save button click
    Protected Sub btnSave_Click(ByVal sender As Object, ByVal e As EventArgs)
        ' Validate required fields
        If String.IsNullOrEmpty(txtResourceName.Text) OrElse String.IsNullOrEmpty(txtAuthor.Text) OrElse String.IsNullOrEmpty(txtShortName.Text) Then
            ' Display an error message (use a Bootstrap alert or similar)
            Return
        End If

        Using conn As New SqlConnection(connString)
            Dim query As String
            If resourceId.HasValue Then
                ' Update existing resource
                query = "UPDATE Resources SET resourceName = @resourceName, status = @status, resourcePages = @resourcePages, author = @author, 
                         shortName = @shortName, lastModifiedDate = GETDATE() WHERE resourceid = @resourceid"
            Else
                ' Insert new resource
                query = "INSERT INTO Resources (resourceName, status, resourcePages, author, shortName, lastModifiedDate) 
                         VALUES (@resourceName, @status, @resourcePages, @author, @shortName, GETDATE())"
            End If

            Using cmd As New SqlCommand(query, conn)
                cmd.Parameters.AddWithValue("@resourceName", txtResourceName.Text)
                cmd.Parameters.AddWithValue("@status", rblStatus.SelectedValue)
                cmd.Parameters.AddWithValue("@resourcePages", If(String.IsNullOrEmpty(txtResourcePages.Text), DBNull.Value, txtResourcePages.Text))
                cmd.Parameters.AddWithValue("@Author", txtAuthor.Text)
                cmd.Parameters.AddWithValue("@ShortName", txtShortName.Text)
                If resourceId.HasValue Then cmd.Parameters.AddWithValue("@resourceid", resourceId)

                conn.Open()
                cmd.ExecuteNonQuery()
            End Using
        End Using

        ' Save sectors
        SaveSectors()

        ' Redirect to resources list
        Response.Redirect("resources.aspx")
    End Sub

    ' Save sectors to cross_resource_sector
    Private Sub SaveSectors()
        If Not resourceId.HasValue Then Return

        Using conn As New SqlConnection(connString)
            conn.Open()

            ' Delete existing sectors for the resource
            Dim deleteQuery As String = "DELETE FROM cross_resource_sector WHERE resourceid = @resourceid"
            Using deleteCmd As New SqlCommand(deleteQuery, conn)
                deleteCmd.Parameters.AddWithValue("@resourceid", resourceId.Value)
                deleteCmd.ExecuteNonQuery()
            End Using

            ' Insert new sectors for the resource
            Dim insertQuery As String = "INSERT INTO cross_resource_sector (resourceid, sector) VALUES (@resourceid, @sector)"
            Using insertCmd As New SqlCommand(insertQuery, conn)
                insertCmd.Parameters.Add("@resourceid", SqlDbType.Int).Value = resourceId.Value
                insertCmd.Parameters.Add("@sector", SqlDbType.VarChar)
                For Each item As ListItem In lstSectors.Items
                    If item.Selected Then
                        insertCmd.Parameters("@sector").Value = item.Value
                        insertCmd.ExecuteNonQuery()
                    End If
                Next
            End Using
        End Using
    End Sub

End Class
