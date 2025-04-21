
Public Class resource_details
    Inherits System.Web.UI.Page

#Region " Web Form Designer Generated Code "

    'This call is required by the Web Form Designer.
    <System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()

    End Sub
    Protected WithEvents ResourceDetailsForm As System.Web.UI.HtmlControls.HtmlForm
    'Protected WithEvents preMon As System.Web.UI.WebControls.Literal
    'Protected WithEvents curMonth As System.Web.UI.WebControls.Literal
    'Protected WithEvents nextMon As System.Web.UI.WebControls.Literal

    'NOTE: The following placeholder declaration is required by the Web Form Designer.
    'Do not delete or move it.
    Private designerPlaceholderDeclaration As System.Object

    Private Sub Page_Init(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Init
        'CODEGEN: This method call is required by the Web Form Designer
        'Do not modify it using the code editor.
        InitializeComponent()
    End Sub

    Protected WithEvents LitResourceName As Literal
    Protected WithEvents LitResourceFeatureImage As Literal
    Protected WithEvents LitLastBreadcrumb As Literal
    Protected WithEvents ph1 As System.Web.UI.WebControls.PlaceHolder
    Protected WithEvents phResources As System.Web.UI.WebControls.PlaceHolder
    Protected WithEvents phRelatedEvents As System.Web.UI.WebControls.PlaceHolder
    'Protected WithEvents libyear As System.Web.UI.WebControls.ListBox
    'Protected WithEvents libsector As System.Web.UI.WebControls.ListBox
    'Protected WithEvents Libtype As System.Web.UI.WebControls.ListBox

    'Protected WithEvents goButton As System.Web.UI.WebControls.ImageButton

    Private ResourceId As String

    'Protected WithEvents calendarview As System.Web.UI.WebControls.Literal
    'Protected WithEvents monthlistview As System.Web.UI.WebControls.Literal
    'Protected WithEvents yearlistview As System.Web.UI.WebControls.Literal
    'Private year As String
    'Private sector As String
    'Private type As String

    'Private today As String
#End Region

    Private Sub Page_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        'Put user code to initialize the page here
        ResourceId = Server.HtmlEncode(Request.QueryString("r"))

        
        If Not IsNumeric(ResourceId) Then
            Response.Redirect("../resources/index.aspx")
        End If
        'hui filter the query string

        Response.Redirect("../resources/details.aspx?resourceid=" & ResourceId)


    End Sub


End Class
