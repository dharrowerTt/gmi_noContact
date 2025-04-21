Imports System.Data.SqlClient

Partial Class edit_org
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            ' Ensure the sfOrgID is available in the session
            If Session("sfOrgID") IsNot Nothing Then
                Dim userName As String = GetLoggedInUserName()
                Dim orgName As String = GetLoggedInUserOrg()

                ' Update litUserNameOrg with the appropriate links
                litUserNameOrg.Text = GenerateHeaderLinks(userName, orgName, "edit-org")

                ' Load the organization types into the dropdown
                LoadOrgTypes()

                ' Load the organization's data into the form
                LoadOrganizationData(Session("sfOrgID").ToString())
            Else
                ' Redirect to login if sfOrgID is not in session
                Response.Redirect("member-login.aspx")
            End If
        End If
    End Sub

    ' Load organization types into the dropdown
    Private Sub LoadOrgTypes()
        Using conn As New SqlConnection(Common.GetConnString())
            conn.Open()
            Dim query As String = "SELECT pnOrgType FROM pn_lu_orgType ORDER BY pnOrgTypeOrder"
            Using cmd As New SqlCommand(query, conn)
                Using reader As SqlDataReader = cmd.ExecuteReader()
                    ddlOrgType.Items.Clear()
                    While reader.Read()
                        ddlOrgType.Items.Add(New ListItem(reader("pnOrgType").ToString()))
                    End While
                End Using
            End Using
        End Using
    End Sub

    ' Load the organization's data based on sfOrgID
    Private Sub LoadOrganizationData(sfOrgID As String)
        Using conn As New SqlConnection(Common.GetConnString())
            conn.Open()

            ' Check if sfOrgID is present in the database
            Dim query As String = "SELECT pnOrgName, pnOrgType, pnWebsite, pnHeadquarters, pnOrgSummary FROM pn_orgs WHERE sfOrgID = @sfOrgID"
            Using cmd As New SqlCommand(query, conn)
                cmd.Parameters.AddWithValue("@sfOrgID", sfOrgID)

                Dim reader As SqlDataReader = cmd.ExecuteReader()

                If reader.Read() Then
                    ' Populate the form fields with the organization data
                    txtOrgName.Text = reader("pnOrgName").ToString()
                    ddlOrgType.SelectedValue = reader("pnOrgType").ToString() ' Set the selected organization type
                    txtWebsite.Text = reader("pnWebsite").ToString()
                    txtHeadquarters.Text = reader("pnHeadquarters").ToString()
                    txtOrgSummary.Text = reader("pnOrgSummary").ToString()
                Else
                    ' Handle case where no organization is found for the sfOrgID
                    lblErrorMessage.Text = "Organization not found for this user."
                End If
            End Using
        End Using
    End Sub

    Protected Sub btnUpdateOrg_Click(sender As Object, e As EventArgs)
        If Session("sfOrgID") IsNot Nothing Then
            Dim orgID As String = Session("sfOrgID")

            Using conn As New SqlConnection(Common.GetConnString())
                conn.Open()
                Dim query As String = "UPDATE pn_orgs SET pnOrgName = @orgName, pnOrgType = @orgType, pnWebsite = @website, pnHeadquarters = @headquarters, pnOrgSummary = @summary WHERE sfOrgID = @sfOrgID"
                Using cmd As New SqlCommand(query, conn)
                    cmd.Parameters.AddWithValue("@orgName", txtOrgName.Text)
                    cmd.Parameters.AddWithValue("@orgType", ddlOrgType.SelectedValue) ' Get the selected org type from dropdown
                    cmd.Parameters.AddWithValue("@website", txtWebsite.Text)
                    cmd.Parameters.AddWithValue("@headquarters", txtHeadquarters.Text)
                    cmd.Parameters.AddWithValue("@summary", txtOrgSummary.Text)
                    cmd.Parameters.AddWithValue("@sfOrgID", orgID)

                    cmd.ExecuteNonQuery()

                    lblErrorMessage.Text = "Organization updated successfully!"

                    ' Redirect after successful update
                    Response.Redirect("member-home.aspx")
                End Using
            End Using
        Else
            ' Handle case where sfOrgID is not in session
            Response.Redirect("member-login.aspx")
        End If
    End Sub

    ' Helper functions to generate header links and get user/org details
    Private Function GetLoggedInUserName() As String
        If Session("pnContactName") IsNot Nothing Then
            Return Session("pnContactName").ToString()
        Else
            Response.Redirect("member-login.aspx")
            Return String.Empty
        End If
    End Function

    Private Function GetLoggedInUserOrg() As String
        If Session("sfOrgID") IsNot Nothing Then
            Return GetOrganizationNameFromDatabase(Session("sfOrgID").ToString())
        Else
            Response.Redirect("member-login.aspx")
            Return String.Empty
        End If
    End Function

    ' Retrieve organization name based on sfOrgID
    Private Function GetOrganizationNameFromDatabase(sfOrgID As String) As String
        Dim orgName As String = String.Empty
        Using conn As New SqlConnection(Common.GetConnString())
            conn.Open()
            Dim query As String = "SELECT pnOrgName FROM pn_orgs WHERE sfOrgID = @sfOrgID"
            Using cmd As New SqlCommand(query, conn)
                cmd.Parameters.AddWithValue("@sfOrgID", sfOrgID)
                Dim reader As SqlDataReader = cmd.ExecuteReader()
                If reader.Read() Then
                    orgName = reader("pnOrgName").ToString()
                End If
            End Using
        End Using
        Return orgName
    End Function

    ' Generate header links based on the current page
    Private Function GenerateHeaderLinks(userName As String, orgName As String, currentPage As String) As String
        Dim userLink As String = If(currentPage = "edit-user", userName, $"<a href='edit-user.aspx'>{userName}</a>")
        Dim orgLink As String = If(currentPage = "edit-org", orgName, $"<a href='edit-org.aspx'>{orgName}</a>")
        Dim homeLink As String = "<a href='member-home.aspx'><i class='fa fa-home'></i> Member Home</a>"

        Return $"{userLink} | {orgLink} | {homeLink}"
    End Function
End Class
