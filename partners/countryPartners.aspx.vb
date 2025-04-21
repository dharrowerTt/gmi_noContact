
Public Class countryPartners
    Inherits System.Web.UI.Page

    Private binding As sforce.SforceService

    Protected WithEvents litStuff As Global.System.Web.UI.WebControls.Literal

    Protected WithEvents litSector As Global.System.Web.UI.WebControls.Literal
    Protected WithEvents litCountryBreadcrumb As Global.System.Web.UI.WebControls.Literal
    Protected WithEvents litBreadcrumb As Global.System.Web.UI.WebControls.Literal

    Protected WithEvents litNothing As Global.System.Web.UI.WebControls.Literal
    Protected WithEvents phTable As Global.System.Web.UI.WebControls.PlaceHolder

    Private Sub Page_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        getDetails()
    End Sub

    Private Function getDetails() As Boolean

        Dim myCountry As String
        myCountry = IIf(Server.HtmlEncode(Request.QueryString("country")) Is Nothing, String.Empty, Server.HtmlEncode(Request.QueryString("country")))
        myCountry = Common.StripMetaChars(myCountry)

        If (myCountry.Length <= 0) Then Exit Function

        If (Common.IsQueryStringSafe(myCountry) = False) Then
            Response.Redirect("~/Partners/Index.aspx")
        End If

        Dim myCountryDisplay As String = getGeoFocus(myCountry)

        litBreadcrumb.Text = "Project Network Members in " & myCountryDisplay
        litCountryBreadcrumb.Text = "<a href=country.aspx?c=" + getCountryPageName(myCountry) + ">" + myCountryDisplay + "</a> &raquo;"

        Dim data As New DAL()
        Dim dt As DataTable = data.getOrganizationsByCountry(myCountryDisplay)



        If (IsNothing(dt)) Then
            litNothing.Text = "There are no Project Network Members for " & myCountryDisplay & "."
            phTable.Visible = False
        Else
            litNothing.Text = ""
            phTable.Visible = True

            litSector.Text = "Project Network Members in " & myCountryDisplay

            For Each org As DataRow In dt.Rows
                
                litStuff.Text &= "<tr><td><a href='../project-network/pnmProfile.aspx?ID=" & org("ID") & "'>" & org("Name") & "</a></td><td>" & org("Organization_Category") & "</td></tr>"

            Next
        End If

        Return True
    End Function


End Class
