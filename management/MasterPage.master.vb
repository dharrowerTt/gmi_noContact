Imports System.Data.SqlClient

Public Class MasterPage
    Inherits System.Web.UI.MasterPage

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs) Handles Me.Load
        ' Check if the user is logged in by looking for a session variable
        If Session("LoggedInUser") Is Nothing Then
            ' List of allowed pages for unauthenticated users
            Dim allowedPages As List(Of String) = New List(Of String) From {
                "login.aspx",
                "signup.aspx",
                "forgot-password.aspx",
                "public-resource.aspx"  ' Example page for public resources
            }

            ' Get the current page name
            Dim currentPage As String = System.IO.Path.GetFileName(Request.Path)

            ' Redirect to login page if user is not logged in and page is not allowed
            If Not allowedPages.Contains(currentPage, StringComparer.OrdinalIgnoreCase) Then
                Response.Redirect("login.aspx")
            End If
        Else
            ' If user is logged in, check their admin status and role
            If Not IsPostBack Then
                Dim username As String = Session("LoggedInUser").ToString()
                Dim userId As Integer = GetUserIdByUsername(username)
                If userId > 0 Then
                    CheckUserPermissions(userId)
                End If
            End If
        End If
    End Sub

    Private Function GetUserIdByUsername(username As String) As Integer
        ' Retrieve the user ID from the database using the username
        Dim userId As Integer = 0
        Dim connString As String = Common.GetConnString()

        Using conn As New SqlConnection(connString)
            Using cmd As New SqlCommand("SELECT user_id FROM management_users WHERE username = @username", conn)
                cmd.Parameters.AddWithValue("@username", username)
                conn.Open()
                Dim result = cmd.ExecuteScalar()
                If result IsNot Nothing Then
                    userId = Convert.ToInt32(result)
                End If
            End Using
        End Using

        Return userId
    End Function

    Private Sub CheckUserPermissions(userId As Integer)
        ' Default visibility settings
        phUserManagement.Visible = False
        navEventManagement.Visible = False
        navCommsManagement.Visible = False
        navCaseStudies.Visible = False
        navCaseStudyFeatures.Visible = False
        navEvents.Visible = False
        navDashboard.Visible = False
        navPartnerCountries.Visible = False
        navSocialMedia.Visible = False

        Dim connString As String = Common.GetConnString()

        Using conn As New SqlConnection(connString)
            Using cmd As New SqlCommand("
            SELECT is_active, is_admin, 
                   (SELECT COUNT(1) FROM management_user_roles WHERE user_id = @userId AND role_id = 2) AS hasRole2,
                   (SELECT COUNT(1) FROM management_user_roles WHERE user_id = @userId AND role_id = 3) AS hasRole3,
                   (SELECT COUNT(1) FROM management_user_roles WHERE user_id = @userId AND role_id = 4) AS hasRole4
            FROM management_users WHERE user_id = @userId", conn)

                cmd.Parameters.AddWithValue("@userId", userId)
                conn.Open()

                Using reader As SqlDataReader = cmd.ExecuteReader()
                    If reader.Read() Then
                        Dim isActive As Boolean = Convert.ToBoolean(reader("is_active"))
                        Dim isAdmin As Boolean = Convert.ToBoolean(reader("is_admin"))
                        Dim hasRole2 As Boolean = Convert.ToInt32(reader("hasRole2")) > 0
                        Dim hasRole3 As Boolean = Convert.ToInt32(reader("hasRole3")) > 0
                        Dim hasRole4 As Boolean = Convert.ToInt32(reader("hasRole4")) > 0

                        ' Admins see User Management
                        If isActive AndAlso isAdmin Then
                            phUserManagement.Visible = True
                        End If

                        ' Role-based navigation
                        If isActive AndAlso hasRole2 Then
                            ShowFullNavigation()
                            navCommsManagement.Visible = True ' Role 2 sees Comms Management
                        ElseIf isActive AndAlso hasRole3 Then
                            ShowRole3Navigation()
                        ElseIf isActive AndAlso hasRole4 Then
                            ShowRole4Navigation()
                        End If
                    End If
                End Using
            End Using
        End Using
    End Sub



    Private Sub ShowCaseStudiesOnly()
        ' Show only Home and Case Studies for users with role_id 4
        navHome.Visible = True
        navCaseStudies.Visible = True
        navEvents.Visible = False
        navDashboard.Visible = False
        navEventManagement.Visible = False
        phUserManagement.Visible = False
        navCaseStudyFeatures.Visible = False
        navPartnerCountries.Visible = False
    End Sub

    Private Sub ShowRole4Navigation()
        navHome.Visible = True
        navCaseStudies.Visible = True
        navCaseStudyFeatures.Visible = True

        ' Hide all other links
        navEvents.Visible = False
        navDashboard.Visible = False
        navEventManagement.Visible = False
        navCommsManagement.Visible = False
    End Sub

    Private Sub ShowRole3Navigation()
        navHome.Visible = True
        navEvents.Visible = True
        navDashboard.Visible = True
        navCaseStudies.Visible = True
        navCaseStudyFeatures.Visible = True
        navSocialMedia.Visible = True
        ' Hide other links
        navEventManagement.Visible = False
        navCommsManagement.Visible = False
    End Sub

    Private Sub ShowFullNavigation()
        navHome.Visible = True
        navSocialMedia.Visible = True
        navEvents.Visible = True
        navDashboard.Visible = True
        navCaseStudies.Visible = True
        navCaseStudyFeatures.Visible = True
        navEventManagement.Visible = True
        navCommsManagement.Visible = True
        navPartnerCountries.Visible = True
        navSiteBannerAdmin.Visible = True
        navSectorHomePages.Visible = True
    End Sub

End Class
