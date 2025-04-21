Imports System.Data.SqlClient

Partial Class edit_user
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            ' Retrieve logged-in user's name and organization dynamically
            Dim userName As String = GetLoggedInUserName()
            Dim orgName As String = GetLoggedInUserOrg()

            ' Update litUserNameOrg with the appropriate links
            litUserNameOrg.Text = GenerateHeaderLinks(userName, orgName, "edit-user")

            ' Load the user's profile data into the form
            LoadUserProfile()
        End If
    End Sub

    Private Sub LoadUserProfile()
        ' Load user profile data from the database
        Dim userID As Integer = Convert.ToInt32(Session("pnContactID"))

        Using conn As New SqlConnection(Common.GetConnString())
            conn.Open()
            Dim query As String = "SELECT pnContactSalutation, pnContactFirstName, pnContactLastName, pnContactSuffix, pnContactTitle, pnContactEmail, pnContactPhone FROM pn_contacts WHERE pnContactID = @userID"
            Using cmd As New SqlCommand(query, conn)
                cmd.Parameters.AddWithValue("@userID", userID)
                Dim reader As SqlDataReader = cmd.ExecuteReader()

                If reader.Read() Then
                    txtSalutation.Text = reader("pnContactSalutation").ToString()
                    txtFirstName.Text = reader("pnContactFirstName").ToString()
                    txtLastName.Text = reader("pnContactLastName").ToString()
                    txtSuffix.Text = reader("pnContactSuffix").ToString()
                    txtTitle.Text = reader("pnContactTitle").ToString()
                    txtEmail.Text = reader("pnContactEmail").ToString()
                    txtPhone.Text = reader("pnContactPhone").ToString()
                End If
            End Using
        End Using
    End Sub

    Protected Sub btnUpdateProfile_Click(sender As Object, e As EventArgs)
        ' Update user profile based on the form values
        Dim userID As Integer = Convert.ToInt32(Session("pnContactID"))

        Using conn As New SqlConnection(Common.GetConnString())
            conn.Open()
            Dim query As String = "UPDATE pn_contacts SET pnContactSalutation = @salutation, pnContactFirstName = @firstName, pnContactLastName = @lastName, pnContactSuffix = @suffix, pnContactTitle = @title, pnContactEmail = @Email, pnContactPhone = @Phone WHERE pnContactID = @userID"
            Using cmd As New SqlCommand(query, conn)
                cmd.Parameters.AddWithValue("@salutation", txtSalutation.Text)
                cmd.Parameters.AddWithValue("@firstName", txtFirstName.Text)
                cmd.Parameters.AddWithValue("@lastName", txtLastName.Text)
                cmd.Parameters.AddWithValue("@suffix", txtSuffix.Text)
                cmd.Parameters.AddWithValue("@title", txtTitle.Text)
                cmd.Parameters.AddWithValue("@Email", txtEmail.Text)
                cmd.Parameters.AddWithValue("@Phone", txtPhone.Text)
                cmd.Parameters.AddWithValue("@userID", userID)

                cmd.ExecuteNonQuery()
            End Using
        End Using

        lblErrorMessage.Text = "Profile updated successfully!"
        Response.AddHeader("REFRESH", "2;URL=member-home.aspx?page=contact")
    End Sub

    ' Generate header links based on the current page
    Private Function GenerateHeaderLinks(userName As String, orgName As String, currentPage As String) As String
        Dim userLink As String = If(currentPage = "edit-user", userName, $"<a href='edit-user.aspx'>{userName}</a>")
        Dim orgLink As String = If(currentPage = "edit-org", orgName, $"<a href='edit-org.aspx'>{orgName}</a>")
        Dim homeLink As String = "<a href='member-home.aspx'><i class='fa fa-home'></i> Member Home</a>"

        Return $"{userLink} | {orgLink} | {homeLink}"
    End Function

    ' Retrieve the logged-in user's name
    Private Function GetLoggedInUserName() As String
        ' Use pnContactName for the logged-in user's name
        If Session("pnContactName") IsNot Nothing Then
            Return Session("pnContactName").ToString()
        Else
            ' Handle cases where the session is null, redirect to login page
            Response.Redirect("member-login.aspx")
            Return String.Empty
        End If
    End Function

    ' Retrieve the logged-in user's organization name
    Private Function GetLoggedInUserOrg() As String
        ' Assuming sfOrgID is used to retrieve the organization name from the database
        If Session("sfOrgID") IsNot Nothing Then
            Dim orgName As String = GetOrganizationNameFromDatabase(Session("sfOrgID").ToString())
            Return orgName
        Else
            ' Handle cases where the session is null, redirect to login page
            Response.Redirect("member-login.aspx")
            Return String.Empty
        End If
    End Function

    ' Example method to retrieve the organization name based on sfOrgID
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
End Class
