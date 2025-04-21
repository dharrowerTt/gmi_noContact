Imports System.Data.SqlClient
Imports System.Security.Cryptography
Imports System.Text

Partial Public Class login1
    Inherits System.Web.UI.Page

    Protected Sub btnLogin_Click(ByVal sender As Object, ByVal e As EventArgs)
        Dim username As String = txtUsername.Text.Trim()
        Dim password As String = txtPassword.Text.Trim()

        If ValidateLogin(username, password) Then
            Session("LoggedInUser") = username  ' Set session variable for authenticated user
            Response.Redirect("~/management/index.aspx")  ' Redirect to dashboard or landing page
        Else
            lblMessage.Text = "Invalid login credentials or account not yet approved."
        End If
    End Sub

    ' Method to validate username, password, and account status
    Private Function ValidateLogin(ByVal username As String, ByVal password As String) As Boolean
        Dim connString As String = Common.GetConnString()
        Dim isValid As Boolean = False

        Using conn As New SqlConnection(connString)
            conn.Open()

            Dim query As String = "SELECT passwordHash, passwordSalt, is_active FROM management_users WHERE username = @username"
            Using cmd As New SqlCommand(query, conn)
                cmd.Parameters.AddWithValue("@username", username)

                Using reader As SqlDataReader = cmd.ExecuteReader()
                    If reader.Read() Then
                        Dim storedHash As String = reader("passwordHash").ToString()
                        Dim storedSalt As String = reader("passwordSalt").ToString()
                        Dim isActive As Boolean = Convert.ToBoolean(reader("is_active"))

                        ' Check if account is active
                        If isActive Then
                            Dim hashedPassword As String = HashPassword(password, storedSalt)
                            If hashedPassword = storedHash Then
                                isValid = True
                            End If
                        End If
                    End If
                End Using
            End Using
        End Using

        Return isValid
    End Function

    ' Method to hash the password with salt
    Private Function HashPassword(ByVal password As String, ByVal salt As String) As String
        Dim sha256 As SHA256 = SHA256.Create()
        Dim saltedPassword As String = password & salt
        Dim saltedPasswordBytes As Byte() = Encoding.UTF8.GetBytes(saltedPassword)
        Dim hashBytes As Byte() = sha256.ComputeHash(saltedPasswordBytes)
        Return Convert.ToBase64String(hashBytes)
    End Function
End Class
