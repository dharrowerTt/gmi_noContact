Imports System
Imports System.Data.SqlClient
Imports System.Configuration

Partial Class Management_addPNorg
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            PopulateOrgTypeDropdown()
        End If
    End Sub

    Private Sub PopulateOrgTypeDropdown()
        Dim connString As String = Common.GetConnString()

        ' Open connection to the database
        Using conn As New SqlConnection(connString)
            Dim query As String = "SELECT pnOrgType FROM pn_lu_OrgType"
            Using cmd As New SqlCommand(query, conn)
                conn.Open()
                Dim reader As SqlDataReader = cmd.ExecuteReader()
                ddlOrgType.Items.Clear()
                While reader.Read()
                    ddlOrgType.Items.Add(reader("pnOrgType").ToString())
                End While
            End Using
        End Using
    End Sub

    Protected Sub btnSubmit_Click(sender As Object, e As EventArgs) Handles btnSubmit.Click
        If Page.IsValid Then
            Dim sfOrgID As String = txtSfOrgID.Text.Trim()
            Dim pnOrgName As String = txtOrgName.Text.Trim()
            Dim pnOrgType As String = ddlOrgType.SelectedValue
            Dim pnWebsite As String = txtWebsite.Text.Trim()
            Dim pnHeadquarters As String = txtHeadquarters.Text.Trim()
            Dim pnOrgSummary As String = txtOrgSummary.Text.Trim()
            Dim lastUpdated As DateTime = DateTime.Now

            Dim connString As String = Common.GetConnString()

            ' Open connection to the database
            Using conn As New SqlConnection(connString)
                Dim query As String = "INSERT INTO pn_orgs (sfOrgID, pnOrgName, pnOrgType, pnWebsite, pnHeadquarters, pnOrgSummary, LastUpdated) " &
                                      "VALUES (@sfOrgID, @pnOrgName, @pnOrgType, @pnWebsite, @pnHeadquarters, @pnOrgSummary, @LastUpdated)"

                Using cmd As New SqlCommand(query, conn)
                    cmd.Parameters.AddWithValue("@sfOrgID", sfOrgID)
                    cmd.Parameters.AddWithValue("@pnOrgName", pnOrgName)
                    cmd.Parameters.AddWithValue("@pnOrgType", pnOrgType)
                    cmd.Parameters.AddWithValue("@pnWebsite", If(String.IsNullOrEmpty(pnWebsite), DBNull.Value, pnWebsite))
                    cmd.Parameters.AddWithValue("@pnHeadquarters", If(String.IsNullOrEmpty(pnHeadquarters), DBNull.Value, pnHeadquarters))
                    cmd.Parameters.AddWithValue("@pnOrgSummary", If(String.IsNullOrEmpty(pnOrgSummary), DBNull.Value, pnOrgSummary))
                    cmd.Parameters.AddWithValue("@LastUpdated", lastUpdated)

                    conn.Open()
                    cmd.ExecuteNonQuery()
                End Using
            End Using

            ' Display success message and clear fields
            SuccessPanel.Visible = True
            ClearFormFields()
        End If
    End Sub

    Private Sub ClearFormFields()
        txtSfOrgID.Text = String.Empty
        txtOrgName.Text = String.Empty
        ddlOrgType.SelectedIndex = -1
        txtWebsite.Text = String.Empty
        txtHeadquarters.Text = String.Empty
        txtOrgSummary.Text = String.Empty
    End Sub
End Class
