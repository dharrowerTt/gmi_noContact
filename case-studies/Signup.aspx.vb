Imports System.Data.SqlClient
Imports System.Security.Cryptography
Imports System.Text

Public Class signup1
    Inherits System.Web.UI.Page

    Protected Sub btnSignUp_Click(sender As Object, e As EventArgs)
        Try
            Dim username As String = txtUsername.Text
            Dim password As String = txtPassword.Text
            Dim signupCode As String = txtSignupCode.Text

            If signupCode <> "roboticsamigocrunchingangled" Then
                lblMessage.Text = "Invalid signup code."
                Exit Sub
            End If

            Dim salt As Byte()
            Dim hash As Byte() = CreatePasswordHash(password, salt)

            Dim userType As String = GetUserType(username)

            Using connection As New SqlConnection(Common.GetConnString())
                connection.Open()
                Using command As New SqlCommand("INSERT INTO csUsers (Username, PasswordHash, PasswordSalt, Type) VALUES (@Username, @PasswordHash, @PasswordSalt, @Type)", connection)
                    command.Parameters.AddWithValue("@Username", username)
                    command.Parameters.AddWithValue("@PasswordHash", hash)
                    command.Parameters.AddWithValue("@PasswordSalt", salt)
                    command.Parameters.AddWithValue("@Type", userType)
                    Try
                        command.ExecuteNonQuery()
                        lblMessage.Text = "Registration successful."
                    Catch ex As SqlException
                        lblMessage.Text = "Registration failed. Username may already be taken."
                    End Try
                End Using
            End Using
        Catch ex As Exception
            lblMessage.Text = "An error occurred during registration: " & ex.Message
        End Try
    End Sub

    Private Function CreatePasswordHash(password As String, ByRef salt As Byte()) As Byte()
        salt = New Byte(15) {}
        Using rng As New RNGCryptoServiceProvider()
            rng.GetBytes(salt)
        End Using

        Using pbkdf2 As New Rfc2898DeriveBytes(password, salt, 10000)
            Return pbkdf2.GetBytes(64)
        End Using
    End Function

    Private Function GetUserType(username As String) As String
        If username.EndsWith("epa.gov", StringComparison.OrdinalIgnoreCase) Then
            Return "EPA"
        ElseIf username.EndsWith("abtglobal.com", StringComparison.OrdinalIgnoreCase) Then
            Return "Abt"
        ElseIf username.EndsWith("tetratech.com", StringComparison.OrdinalIgnoreCase) Then
            Return "TetraTech"
        Else
            Return "Unknown"
        End If
    End Function
End Class
