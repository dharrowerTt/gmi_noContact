Imports System.Data.SqlClient
Imports System.Data
Imports System.Text

Partial Class edit_sectors
    Inherits System.Web.UI.Page

    ' Load Page and Sectors
    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            If Session("pnOrgID") IsNot Nothing Then
                LoadSectors()
                LoadOrgName()
            Else
                ' If the user is not logged in or OrgID is missing, redirect to login
                Response.Redirect("member-login.aspx")
            End If
        End If
    End Sub

    Private Sub LoadSectors()
        Dim orgID As Integer = Convert.ToInt32(Session("pnOrgID"))
        Using conn As New SqlConnection(Common.GetConnString())
            conn.Open()

            ' Load existing sectors for the organization
            Dim selectedSectorsQuery As String = "SELECT pnSectorID FROM pn_sectors_orgs WHERE pnOrgID = @OrgID"
            Dim selectedSectorIDs As New List(Of Integer)

            Using cmd As New SqlCommand(selectedSectorsQuery, conn)
                cmd.Parameters.AddWithValue("@OrgID", orgID)
                Using reader As SqlDataReader = cmd.ExecuteReader()
                    While reader.Read()
                        selectedSectorIDs.Add(Convert.ToInt32(reader("pnSectorID")))
                    End While
                End Using
            End Using

            ' Load all sectors grouped by gmiSector and pnSector
            Dim query As String = "SELECT gmiSector, pnSector, pnSubsector, pnSectorID FROM pn_lu_sectors ORDER BY gmiSector, pnSector, pnSubsectorOrder"
            Dim dt As New DataTable()

            Using cmd As New SqlCommand(query, conn)
                Using adapter As New SqlDataAdapter(cmd)
                    adapter.Fill(dt)
                End Using
            End Using

            ' Build the HTML for the sectors and subsectors
            Dim currentGmiSector As String = String.Empty
            Dim currentPnSector As String = String.Empty
            Dim htmlBuilder As New StringBuilder()

            htmlBuilder.Append("<form id='sectorForm'>")

            For Each row As DataRow In dt.Rows
                Dim gmiSector As String = row("gmiSector").ToString()
                Dim pnSector As String = row("pnSector").ToString()
                Dim pnSubsector As String = row("pnSubsector").ToString()
                Dim pnSectorID As Integer = Convert.ToInt32(row("pnSectorID"))
                htmlBuilder.Append($"<div>")
                ' Check if we need to start a new gmiSector group
                If gmiSector <> currentGmiSector Then
                    If currentGmiSector <> String.Empty Then
                        htmlBuilder.Append("</div>") ' Close the previous sector group
                    End If
                    htmlBuilder.Append($"<hr><h3>{gmiSector}</h3>")
                    currentGmiSector = gmiSector
                End If

                ' Check if we need to start a new pnSector group
                If pnSector <> currentPnSector Then
                    If currentPnSector <> String.Empty Then
                        htmlBuilder.Append("</div>") ' Close the previous subsector group
                    End If
                    htmlBuilder.Append($"<h4>{pnSector}</h4>")
                    htmlBuilder.Append("<div class='subsector-group'>")
                    currentPnSector = pnSector
                End If

                ' Render the checkbox for each pnSubsector
                Dim isChecked As String = If(selectedSectorIDs.Contains(pnSectorID), "checked", "")
                htmlBuilder.Append($"<label><input type='checkbox' name='sector' value='{pnSectorID}' {isChecked}> {pnSubsector}</label>")
            Next

            htmlBuilder.Append("</div></form>")
            litSectors.Text = htmlBuilder.ToString() ' Set the generated HTML to the Literal
        End Using
    End Sub



    ' Load Organization Name for Header
    Private Sub LoadOrgName()
        Using conn As New SqlConnection(Common.GetConnString())
            conn.Open()
            Dim orgID As Integer = Convert.ToInt32(Session("pnOrgID"))

            Dim query As String = "SELECT pnOrgName FROM pn_orgs WHERE pnOrgID = @OrgID"
            Using cmd As New SqlCommand(query, conn)
                cmd.Parameters.AddWithValue("@OrgID", orgID)
                lblOrgName.Text = Convert.ToString(cmd.ExecuteScalar()) & "'s Sector Experience"
            End Using

            ' Also update the header with logged-in user's name and org link to member-home
            lblUserDetails.Text = "<a href='member-home.aspx'><i class='fa fa-home'></i> Member Home</a>"
        End Using
    End Sub

    Protected Sub btnSaveSectors_Click(sender As Object, e As EventArgs) Handles btnSaveSectors.Click
        Dim orgID As Integer = Convert.ToInt32(Session("pnOrgID"))
        Dim selectedSectorIDs As New List(Of Integer)
        Dim allSectorIDs As New List(Of Integer)

        ' Get the selected sectors from the form (checked checkboxes)
        For Each key As String In Request.Form.Keys
            If key.StartsWith("sector") Then ' Ensure we are only processing sector-related keys
                Dim values As String() = Request.Form.GetValues(key)
                If values IsNot Nothing Then
                    For Each value As String In values
                        Dim sectorID As Integer
                        If Integer.TryParse(value, sectorID) Then
                            selectedSectorIDs.Add(sectorID) ' Add valid integer sector IDs
                        End If
                    Next
                End If
            End If
        Next

        ' Get all sector IDs from the database for the organization
        Using conn As New SqlConnection(Common.GetConnString())
            conn.Open()

            ' Load all sector IDs from the sector table
            Dim query As String = "SELECT pnSectorID FROM pn_lu_sectors"
            Using cmd As New SqlCommand(query, conn)
                Using reader As SqlDataReader = cmd.ExecuteReader()
                    While reader.Read()
                        allSectorIDs.Add(Convert.ToInt32(reader("pnSectorID")))
                    End While
                End Using
            End Using

            ' Collect the list of unchecked sectors (those not in the selectedSectorIDs list)
            Dim unselectedSectorIDs = allSectorIDs.Except(selectedSectorIDs).ToList()

            ' Now handle both inserting selected sectors and removing unchecked ones
            If selectedSectorIDs.Any() OrElse unselectedSectorIDs.Any() Then

                ' Delete unselected sectors for the organization
                If unselectedSectorIDs.Any() Then
                    Dim deleteQuery As String = "DELETE FROM pn_sectors_orgs WHERE pnOrgID = @OrgID AND pnSectorID IN (" & String.Join(",", unselectedSectorIDs) & ")"
                    Using deleteCmd As New SqlCommand(deleteQuery, conn)
                        deleteCmd.Parameters.AddWithValue("@OrgID", orgID)
                        deleteCmd.ExecuteNonQuery()
                    End Using
                End If

                ' Insert selected sectors
                Dim insertQuery As String = "INSERT INTO pn_sectors_orgs (pnOrgID, pnSectorID) VALUES (@OrgID, @SectorID)"
                For Each sectorID As Integer In selectedSectorIDs
                    ' Check if the sectorID is already in the pn_sectors_orgs table (avoid duplicates)
                    Dim existsQuery As String = "SELECT COUNT(*) FROM pn_sectors_orgs WHERE pnOrgID = @OrgID AND pnSectorID = @SectorID"
                    Using existsCmd As New SqlCommand(existsQuery, conn)
                        existsCmd.Parameters.AddWithValue("@OrgID", orgID)
                        existsCmd.Parameters.AddWithValue("@SectorID", sectorID)
                        Dim exists As Integer = Convert.ToInt32(existsCmd.ExecuteScalar())

                        If exists = 0 Then
                            Using insertCmd As New SqlCommand(insertQuery, conn)
                                insertCmd.Parameters.AddWithValue("@OrgID", orgID)
                                insertCmd.Parameters.AddWithValue("@SectorID", sectorID)
                                insertCmd.ExecuteNonQuery()
                            End Using
                        End If
                    End Using
                Next

                ' Log the update in the pn_updateLog table
                Dim logQuery As String = "INSERT INTO pn_updateLog (pnContactID, pnOrgID, pnSection, pnUpdateLogTS, summary, owner) VALUES (@pnContactID, @OrgID, 'Sectors', @Timestamp, 'Sector Experience updated', @Owner)"
                Using logCmd As New SqlCommand(logQuery, conn)
                    logCmd.Parameters.AddWithValue("@pnContactID", Convert.ToInt32(Session("pnContactID")))
                    logCmd.Parameters.AddWithValue("@OrgID", orgID)
                    logCmd.Parameters.AddWithValue("@Timestamp", DateTime.Now)
                    logCmd.Parameters.AddWithValue("@Owner", Convert.ToInt32(Session("pnContactID")))
                    logCmd.ExecuteNonQuery()
                End Using

                ' Update the last updated timestamp for the organization
                Dim updateOrgQuery As String = "UPDATE pn_orgs SET LastUpdated = @Timestamp WHERE pnOrgID = @OrgID"
                Using updateOrgCmd As New SqlCommand(updateOrgQuery, conn)
                    updateOrgCmd.Parameters.AddWithValue("@Timestamp", DateTime.Now)
                    updateOrgCmd.Parameters.AddWithValue("@OrgID", orgID)
                    updateOrgCmd.ExecuteNonQuery()
                End Using

                ' Show success message
                lblErrorMessage.Text = "Sectors updated successfully!"
                lblErrorMessage.Visible = True
                lblErrorMessage.CssClass = "alert alert-success"
                Response.AddHeader("REFRESH", "2;URL=member-home.aspx?page=sector")
            End If

            ' After saving the changes, reload the sectors to reflect updated checkbox states
            LoadSectors()
        End Using
    End Sub






End Class

