Imports AjaxControlToolkit

Public Class event_list
    Inherits System.Web.UI.Page


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        'Page.Header.DataBind()
    End Sub

    Protected Sub EventDetailsView_PageIndexChanging(sender As Object, e As System.Web.UI.WebControls.DetailsViewPageEventArgs) Handles EventDetailsView.PageIndexChanging

    End Sub

    Protected Sub EventGridView_SelectedIndexChanged(sender As Object, e As EventArgs) Handles EventGridView.SelectedIndexChanged

    End Sub
End Class