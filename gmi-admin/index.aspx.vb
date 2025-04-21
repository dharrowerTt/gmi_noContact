Imports System.Text
Imports System.Security.Cryptography
Imports System.Data.SqlClient
Public Class gmi_admin_index
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub Button1_Click(ByVal s As Object, ByVal e As EventArgs) Handles Button1.Click

        checkEmail(s, e)

    End Sub


    Protected Sub RegisterDetails(ByVal s As Object, ByVal e As EventArgs)

    End Sub


    Protected Sub TryLogin(ByVal s As Object, ByVal e As EventArgs)
        Dim cleanEmail As String
        Dim securePass As String
        Dim constr As String = Common.GetConnString()

        Dim registerObj As clsRegisterVO
        registerObj = New clsRegisterVO

        securePass = GenerateSHA256String(password.Text)
        cleanEmail = email.Text.Replace(",", "")

        Using con As SqlConnection = New SqlConnection(constr)
            Using cmd As SqlCommand = New SqlCommand("select count(*) As CountofRows FROM _gmiUsers where email = '" & cleanEmail & "' and password = '" & securePass & "' and approved = 1")
                cmd.CommandType = CommandType.Text
                cmd.Connection = con
                con.Open()
                Using sdr As SqlDataReader = cmd.ExecuteReader()
                    sdr.Read()
                    If sdr("CountofRows") > 0 Then
                        Page.ClientScript.RegisterStartupScript(Me.GetType(), "window-script", "setCookie('username', '" & cleanEmail & "', 30)", True)
                    Else
                        Page.ClientScript.RegisterStartupScript(Me.GetType(), "window-script", "passwordError()", True)
                    End If

                End Using
                con.Close()
            End Using
        End Using


    End Sub

    Protected Sub checkEmail(ByVal s As Object, ByVal e As EventArgs)
        Dim cleanEmail As String
        Dim securePass As String
        Dim constr As String = Common.GetConnString()

        Dim registerObj As clsRegisterVO
        registerObj = New clsRegisterVO

        securePass = GenerateSHA256String(password.Text)
        cleanEmail = email.Text.Replace(",", "")


        Using con As SqlConnection = New SqlConnection(constr)
            Using cmd As SqlCommand = New SqlCommand("select count(*) As CountofRows FROM _gmiUsers where email = '" & cleanEmail & "'")
                cmd.CommandType = CommandType.Text
                cmd.Connection = con
                con.Open()
                Using sdr As SqlDataReader = cmd.ExecuteReader()
                    sdr.Read()
                    If sdr("CountofRows") > 0 Then
                        TryLogin(s, e)
                    Else
                        Page.ClientScript.RegisterStartupScript(Me.GetType(), "window-script", "exists()", True)
                    End If

                End Using
                con.Close()
            End Using
        End Using

        registerObj.setEmail(cleanEmail)
        registerObj.setPassword(securePass)

    End Sub

    Protected Sub checkNewEmail(ByVal s As Object, ByVal e As EventArgs)
        Dim cleanEmail As String
        Dim securePass As String
        Dim constr As String = Common.GetConnString()

        Dim registerObj As clsRegisterVO
        registerObj = New clsRegisterVO

        securePass = GenerateSHA256String(password.Text)
        cleanEmail = email.Text.Replace(",", "")


        Using con As SqlConnection = New SqlConnection(constr)
            Using cmd As SqlCommand = New SqlCommand("select count(*) As CountofRows FROM _gmiUsers where email = '" & cleanEmail & "'")
                cmd.CommandType = CommandType.Text
                cmd.Connection = con
                con.Open()
                Using sdr As SqlDataReader = cmd.ExecuteReader()
                    sdr.Read()
                    If sdr("CountofRows") > 0 Then
                        Page.ClientScript.RegisterStartupScript(Me.GetType(), "window-script", "exists()", True)

                    Else
                        RegisterDetails(s, e)
                    End If

                End Using
                con.Close()
            End Using
        End Using

        registerObj.setEmail(cleanEmail)
        registerObj.setPassword(securePass)

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

    Public Shared Function GenerateSHA512String(ByVal inputString) As String
        Dim sha512 As SHA512 = SHA512Managed.Create()
        Dim bytes As Byte() = Encoding.UTF8.GetBytes(inputString)
        Dim hash As Byte() = sha512.ComputeHash(bytes)
        Dim stringBuilder As New StringBuilder()

        For i As Integer = 0 To hash.Length - 1
            stringBuilder.Append(hash(i).ToString("X2"))
        Next

        Return stringBuilder.ToString()
    End Function
End Class