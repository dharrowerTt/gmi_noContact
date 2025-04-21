Imports System.Data.SqlClient
Imports System.Security.Cryptography
Imports System.Text

Public Class login
    Inherits System.Web.UI.Page

    Protected Sub btnLogin_Click(sender As Object, e As EventArgs)
        Try
            Dim username As String = txtUsername.Text
            Dim password As String = txtPassword.Text
            Dim signupCode As String = txtSignupCode.Text

            If signupCode <> "roboticsamigocrunchingangled" Then
                lblMessage.Text = "Invalid signup code."
                Exit Sub
            End If

            Dim storedHash As Byte()
            Dim storedSalt As Byte()

            Using connection As New SqlConnection(Common.GetConnString())
                connection.Open()
                Using command As New SqlCommand("SELECT PasswordHash, PasswordSalt FROM csUsers WHERE Username = @Username", connection)
                    command.Parameters.AddWithValue("@Username", username)
                    Using reader = command.ExecuteReader()
                        If reader.Read() Then
                            storedHash = CType(reader("PasswordHash"), Byte())
                            storedSalt = CType(reader("PasswordSalt"), Byte())
                        Else
                            lblMessage.Text = "Invalid username or password."
                            Exit Sub
                        End If
                    End Using
                End Using
            End Using

            If VerifyPasswordHash(password, storedHash, storedSalt) Then
                Session("loggedIn") = True
                Response.Redirect("admin.aspx")
            Else
                lblMessage.Text = "Invalid username or password."
            End If
        Catch ex As Exception
            lblMessage.Text = "An error occurred during login: " & ex.Message
        End Try
    End Sub

    Private Function VerifyPasswordHash(password As String, storedHash As Byte(), storedSalt As Byte()) As Boolean
        Using pbkdf2 As New Rfc2898DeriveBytes(password, storedSalt, 10000)
            Dim computedHash = pbkdf2.GetBytes(64)
            Return computedHash.SequenceEqual(storedHash)
        End Using
    End Function
End Class
