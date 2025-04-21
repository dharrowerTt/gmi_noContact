Imports System.Data.SqlClient
Partial Class admin_index
    Inherits System.Web.UI.Page

#Region " Web Form Designer Generated Code "

    'This call is required by the Web Form Designer.
    <System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()

    End Sub
    Protected WithEvents Form1 As System.Web.UI.HtmlControls.HtmlForm

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
        'Trace.Write("in index.aspx form load")
        'If Len(Response.Cookies("gmiuid").Value) = 0 Then
        '    Response.Redirect("login.aspx")
        'End If
        'Dim cookieval As String
        'cookieval = Response.Cookies("gmiuid").Value
        'If Not cookieval = "gmiweb13" Then
        '    Response.Redirect("login.aspx")
        'End If
    End Sub


End Class
