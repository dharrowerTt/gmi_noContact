Imports System.Security.Cryptography
Imports System.Text
Imports System.Data.SqlClient

Partial Class member_login
    Inherits System.Web.UI.Page

    Protected Sub btnLogin_Click(sender As Object, e As EventArgs)
        Dim email As String = txtEmail.Text.Trim()
        Dim password As String = txtPassword.Text.Trim()

        ' Hash the entered password
        Dim hashedPassword As String = HashPassword(password)

        ' Query the database to check the credentials
        Using conn As New SqlConnection(Common.GetConnString())
            conn.Open()
            Dim query As String = "SELECT pnContactID, pnContactFirstName, pnContactLastName, sfOrgID, pnOrgID FROM pn_contacts WHERE pnContactEmail = @Email AND pnContactPasswordHash = @PasswordHash"
            Using cmd As New SqlCommand(query, conn)
                cmd.Parameters.AddWithValue("@Email", email)
                cmd.Parameters.AddWithValue("@PasswordHash", hashedPassword)

                Dim reader As SqlDataReader = cmd.ExecuteReader()
                If reader.HasRows Then
                    reader.Read()
                    ' Store user details in session variables
                    Session("pnContactID") = reader("pnContactID")
                    Session("pnContactName") = reader("pnContactFirstName").ToString() & " " & reader("pnContactLastName").ToString()
                    Session("sfOrgID") = reader("sfOrgID")
                    Session("pnOrgID") = reader("pnOrgID")



                    ' Redirect to member-home.aspx
                    Response.Redirect("member-home.aspx")
                Else
                    ' Invalid credentials, show error message
                    lblMessage.Text = "Invalid login. Please try again."
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
