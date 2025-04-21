Imports System.Data.SqlClient

Public Class admin
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("loggedIn") Is Nothing OrElse Not CType(Session("loggedIn"), Boolean) Then
            Response.Redirect("login.aspx")
            Exit Sub
        End If

        If Not IsPostBack Then
            BindStudiesGrid()
        End If
    End Sub

    Private Sub BindStudiesGrid()
        Try
            Using connection As New SqlConnection(Common.GetConnString())
                connection.Open()
                Using command As New SqlCommand("SELECT * FROM [cs.studies]", connection)
                    Using reader As SqlDataReader = command.ExecuteReader()
                        Dim dt As New DataTable()
                        dt.Load(reader)
                        gvStudies.DataSource = dt
                        gvStudies.DataBind()
                    End Using
                End Using
            End Using
        Catch ex As Exception
            lblMessage.Text = "An error occurred while loading studies: " & ex.Message
        End Try
    End Sub
End Class
