Partial Class countryCommittee
    Inherits System.Web.UI.Page

#Region " Web Form Designer Generated Code "

    'This call is required by the Web Form Designer.
    <System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()

    End Sub

    'NOTE: The following placeholder declaration is required by the Web Form Designer.
    'Do not delete or move it.
    Private designerPlaceholderDeclaration As System.Object

    Private Sub Page_Init(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Init
        'CODEGEN: This method call is required by the Web Form Designer
        'Do not modify it using the code editor.
        InitializeComponent()
    End Sub

#End Region

    Private Sub Page_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load

        'KJ 2/2016 - redirect all requests to the main countryCommittee page.
        Dim myCountry As String = IIf(Server.HtmlEncode(Request.QueryString("country")) Is Nothing, String.Empty, Server.HtmlEncode(Request.QueryString("country")))

        Response.Redirect("countryCommittees.aspx?country=" & myCountry)
        linkRedirect.Text = "<a href='countryCommittees.aspx?country=" & myCountry & "'>Click to go to the committee page</a>"
    End Sub


End Class