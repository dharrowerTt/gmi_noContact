Imports System.Data
Imports System.Configuration
Imports System.Data.SqlClient
Public Class delete
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        Dim LookupValue As String = ""

        LookupValue = Request.QueryString("id")

        Dim constr As String = Common.GetConnString()
        Using con As SqlConnection = New SqlConnection(constr)
            Using cmd As SqlCommand = New SqlCommand("DELETE FROM _registercontact WHERE contactID = " & LookupValue)
                cmd.CommandType = CommandType.Text
                cmd.Connection = con
                con.Open()
                Using sdr As SqlDataReader = cmd.ExecuteReader()
                    sdr.Read()
                End Using
                con.Close()
            End Using
        End Using


    End Sub

End Class