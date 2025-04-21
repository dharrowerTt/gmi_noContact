Imports System
Imports System.Data.SqlClient
Imports System.Configuration

Partial Class addPNuser
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            PopulateOrgDropdown()
        End If
    End Sub

    Private Sub PopulateOrgDropdown()
        Dim connString As String = Common.GetConnString()

        Using conn As New SqlConnection(connString)
            Dim query As String = "SELECT pnOrgID, sfOrgID, pnOrgName FROM pn_orgs ORDER BY pnOrgName"
            Using cmd As New SqlCommand(query, conn)
                conn.Open()
                Dim reader As SqlDataReader = cmd.ExecuteReader()
                ddlOrg.Items.Clear()
                ddlOrg.Items.Add(New ListItem("-- Select Organization --", "")) ' Add default empty selection
                While reader.Read()
                    Dim listItem As New ListItem(reader("pnOrgName").ToString(), reader("pnOrgID").ToString() & "|" & reader("sfOrgID").ToString())
                    ddlOrg.Items.Add(listItem)
                End While
            End Using
        End Using
    End Sub

    Protected Sub btnSubmit_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSubmit.Click
        If Page.IsValid Then
            ' Get the selected organization details from dropdown
            Dim selectedOrg As String = ddlOrg.SelectedValue
            Dim orgDetails() As String = selectedOrg.Split("|"c)
            Dim pnOrgID As Integer = Convert.ToInt32(orgDetails(0))
            Dim sfOrgID As String = orgDetails(1)

            ' Get user input from form fields, including new sfContactID
            Dim sfContactID As String = txtSfContactID.Text.Trim()
            Dim pnContactSalutation As String = txtSalutation.Text.Trim()
            Dim pnContactFirstName As String = txtFirstName.Text.Trim()
            Dim pnContactLastName As String = txtLastName.Text.Trim()
            Dim pnContactSuffix As String = txtSuffix.Text.Trim()
            Dim pnContactTitle As String = txtTitle.Text.Trim()
            Dim pnContactEmail As String = txtEmail.Text.Trim()
            Dim pnContactPhone As String = txtPhone.Text.Trim()
            Dim pnContactUpdated As DateTime = DateTime.Now

            ' Insert into pn_contacts table
            Dim connString As String = Common.GetConnString()
            Using conn As New SqlConnection(connString)
                Dim query As String = "INSERT INTO pn_contacts (pnOrgID, sfOrgID, sfContactID, pnContactSalutation, pnContactFirstName, pnContactLastName, pnContactSuffix, pnContactTitle, pnContactEmail, pnContactPhone, pnContactUpdated) " &
                                      "VALUES (@pnOrgID, @sfOrgID, @sfContactID, @pnContactSalutation, @pnContactFirstName, @pnContactLastName, @pnContactSuffix, @pnContactTitle, @pnContactEmail, @pnContactPhone, @pnContactUpdated)"

                Using cmd As New SqlCommand(query, conn)
                    cmd.Parameters.AddWithValue("@pnOrgID", pnOrgID)
                    cmd.Parameters.AddWithValue("@sfOrgID", sfOrgID)
                    cmd.Parameters.AddWithValue("@sfContactID", sfContactID)
                    cmd.Parameters.AddWithValue("@pnContactSalutation", pnContactSalutation)
                    cmd.Parameters.AddWithValue("@pnContactFirstName", pnContactFirstName)
                    cmd.Parameters.AddWithValue("@pnContactLastName", pnContactLastName)
                    cmd.Parameters.AddWithValue("@pnContactSuffix", pnContactSuffix)
                    cmd.Parameters.AddWithValue("@pnContactTitle", pnContactTitle)
                    cmd.Parameters.AddWithValue("@pnContactEmail", pnContactEmail)
                    cmd.Parameters.AddWithValue("@pnContactPhone", pnContactPhone)
                    cmd.Parameters.AddWithValue("@pnContactUpdated", pnContactUpdated)

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
        ddlOrg.SelectedIndex = 0
        txtSfContactID.Text = String.Empty
        txtSalutation.Text = String.Empty
        txtFirstName.Text = String.Empty
        txtLastName.Text = String.Empty
        txtSuffix.Text = String.Empty
        txtTitle.Text = String.Empty
        txtEmail.Text = String.Empty
        txtPhone.Text = String.Empty
    End Sub
End Class
