Imports System.Security.Cryptography
Imports System.Text
Imports System.Data.SqlClient

Partial Class member_setup
    Inherits System.Web.UI.Page

    Protected Sub btnSubmit_Click(sender As Object, e As EventArgs)
        Dim email As String = txtEmail.Text.Trim()
        Dim password As String = txtPassword.Text.Trim()

        ' Verify the email exists and check if a password already exists in the pn_contacts table
        Using conn As New SqlConnection(Common.GetConnString())
            conn.Open()
            Dim query As String = "SELECT pnContactID, pnContactPasswordHash FROM pn_contacts WHERE pnContactEmail = @Email"
            Using cmd As New SqlCommand(query, conn)
                cmd.Parameters.AddWithValue("@Email", email)

                Dim reader As SqlDataReader = cmd.ExecuteReader()
                If reader.HasRows Then
                    reader.Read()
                    Dim contactID As Integer = Convert.ToInt32(reader("pnContactID"))
                    Dim passwordHash As String = reader("pnContactPasswordHash").ToString()
                    reader.Close()

                    ' Check if a password already exists for the user
                    If Not String.IsNullOrEmpty(passwordHash) Then
                        ' Password already exists, prompt user to log in or reset password
                        lblMessage.Text = "A password is already set for this account. Please <a href='member-login.aspx'>log in</a> or <a href='member-reminder.aspx'>reset your password</a> if you've forgotten it."
                        Return
                    End If

                    ' Hash the password
                    Dim hashedPassword As String = HashPassword(password)

                    ' Update the password in the database
                    Dim updateQuery As String = "UPDATE pn_contacts SET pnContactPasswordHash = @PasswordHash WHERE pnContactID = @ContactID"
                    Using updateCmd As New SqlCommand(updateQuery, conn)
                        updateCmd.Parameters.AddWithValue("@PasswordHash", hashedPassword)
                        updateCmd.Parameters.AddWithValue("@ContactID", contactID)
                        updateCmd.ExecuteNonQuery()

                        lblMessage.Text = "Password created successfully! You can now <a href='member-login.aspx'>log in</a>."
                        lblSuccess.Text = "Password created successfully! You can now <a href='member-login.aspx'>log in</a>."
                    End Using
                Else
                    lblMessage.Text = "Email not found. Please ensure you entered the correct email."
                End If
            End Using
        End Using
    End Sub

    ' Function to securely hash the password using SHA2 (512-bit)
    Private Function HashPassword(password As String) As String
        Using sha512 As SHA512 = SHA512.Create()
            Dim bytes As Byte() = sha512.ComputeHash(Encoding.UTF8.GetBytes(password))
            Dim builder As New StringBuilder()
            For Each b As Byte In bytes
                builder.Append(b.ToString("x2")) ' Convert to hexadecimal
            Next
            Return builder.ToString()
        End Using
    End Function

End Class
