Imports System.Text
Imports System.Security.Cryptography
Imports System.Data.SqlClient
Public Class recover
    Inherits System.Web.UI.Page
    Dim LookupValueEmail As String = ""
    Dim securePass As String = ""
    Public successMessage As String = ""

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        LookupValueEmail = Request.QueryString("email")
        successMessage = ""
    End Sub

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click

        securePass = GenerateSHA256String(TextBox1.Text)

        Dim constr As String = Common.GetConnString()

        Dim registerObj As clsRegisterVO
        registerObj = New clsRegisterVO

        Using con As SqlConnection = New SqlConnection(constr)
            Using cmd As SqlCommand = New SqlCommand("UPDATE _gmiUsers SET password = '" & securePass & "' where email='" & LookupValueEmail & "'")
                cmd.CommandType = CommandType.Text
                cmd.Connection = con
                con.Open()
                cmd.ExecuteNonQuery()
            End Using
            con.Close()
        End Using


        TextBox1.Text = ""

        successMessage = "Password Reset! Go <a href='index.aspx'>Login</a>"



    End Sub

    Public Shared Function GenerateSHA256String(ByVal inputString) As String
        Dim sha256 As SHA256 = SHA256Managed.Create()
        Dim bytes As Byte() = Encoding.UTF8.GetBytes(inputString)
        Dim hash As Byte() = sha256.ComputeHash(bytes)
        Dim stringBuilder As New StringBuilder()

        For i As Integer = 0 To hash.Length - 1
            stringBuilder.Append(hash(i).ToString("X2"))
        Next

        Return stringBuilder.ToString()
    End Function
End Class