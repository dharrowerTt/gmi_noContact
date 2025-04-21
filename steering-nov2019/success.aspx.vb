Imports System.Data
Imports System.Configuration
Imports System.Data.SqlClient

Public Class success105


    Inherits System.Web.UI.Page
    Dim EventID As Int16 = 105

    Public fName As String
    Public lName As String
    Public emailAddress As String
    Public organization As String
    Public signUpDate As String


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        Dim LookupValue As String = ""

        LookupValue = Request.QueryString("ID")


        Dim constr As String = Common.GetConnString()
        Using con As SqlConnection = New SqlConnection(constr)
            Using cmd As SqlCommand = New SqlCommand("SELECT * from _registercontact WHERE email = '" & LookupValue & "' AND EventID = " & EventID)
                cmd.CommandType = CommandType.Text
                cmd.Connection = con
                con.Open()
                Using sdr As SqlDataReader = cmd.ExecuteReader()
                    sdr.Read()
                    fName = sdr("fName").ToString()
                    lName = sdr("lName").ToString()
                    emailAddress = sdr("email").ToString()
                    signUpDate = sdr("createDate")
                End Using
                con.Close()
            End Using
        End Using

    End Sub

End Class