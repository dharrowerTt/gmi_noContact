Public Class chicken
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            ' Inject the JavaScript alert to be executed on page load
            ClientScript.RegisterStartupScript(Me.GetType(), "alert", "alert('Hello');", True)
        End If
    End Sub

End Class