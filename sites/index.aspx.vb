Imports System
Imports System.IO
Imports System.Text
Imports System.Data
Imports System.Data.OleDb
Imports System.Data.Odbc
Imports System.Data.DataTable
Imports System.Data.SqlClient
Imports System.Configuration
Imports System.Web.UI.WebControls

Partial Class sites_index
    Inherits System.Web.UI.Page
    Dim CookieValue As String

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

    Protected WithEvents ph1 As System.Web.UI.WebControls.PlaceHolder
    Protected WithEvents ExportSites As Global.System.Web.UI.WebControls.GridView
    Protected WithEvents btnExportToExcelnoFloat As Global.System.Web.UI.WebControls.LinkButton
    'Private currentMon As String
    'Private currentYear As String

#End Region

    Private Sub Page_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        'Put user code to initialize the page here       

    End Sub

    Public Overrides Sub VerifyRenderingInServerForm(ByVal control As System.Web.UI.Control)
        'MyBase.VerifyRenderingInServerForm(control)
    End Sub

    Protected Sub ExportToExcel()
        Response.Clear()
        Response.Buffer = True
        Response.ContentType = "application/vnd.ms-excel"
        Response.AddHeader("content-disposition", "attachment;filename=GMI-Site-Map_Data.xls")
        Response.Charset = ""


        EnableViewState = False

        Dim sw As New System.IO.StringWriter()
        Dim htw As New System.Web.UI.HtmlTextWriter(sw)

        ExportSites.RenderControl(htw)
        Response.Write(sw.ToString())
        Response.End()

    End Sub





    Protected Sub btnDownload_Click(sender As Object, e As EventArgs) Handles btnDownload.Click

        Dim dt As DataTable = Nothing
        Dim status As String = ""
        If CookieValue = "User" Then
            status = "final"

        End If

        dt = clsActivitiesDAO.GetSitesDownload()


        ExportSites.DataSource = dt
        ExportSites.DataBind()
        ExportToExcel()
    End Sub
End Class
