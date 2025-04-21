Imports System
Imports System.IO
Imports System.Text
Imports System.Data
Imports System.Data.OleDb
Imports System.Data.Odbc
Imports System.Data.DataTable
Imports System.Data.SqlClient
Imports System.Configuration
Imports System.Data.Linq
Imports System.Web.UI.WebControls
Imports System.Data.DataSetExtensions
Partial Class reloadresources
    Inherits System.Web.UI.Page
    Dim CookieValue As String


    Private Sub Page_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load

        If Not IsPostBack Then


            'the sector has been selected
            Dim sID As String = ""
            sID = Server.HtmlEncode(Request.QueryString("s"))
            If sID <> "" Then

                litTitle.Text = trtProjectSector(sID)

            End If

            Dim lastupdate As DateTime

            If sID = "" Then
                Dim curFile As String = System.Web.HttpContext.Current.Server.MapPath("\resources\all_resources.html")
                lastupdate = File.GetLastWriteTime(curFile)

            Else
                Dim sectorfile As String = System.Web.HttpContext.Current.Server.MapPath("\resources\" & sID & "_resources.html")
                lastupdate = File.GetLastWriteTime(sectorfile)

            End If
            Dim phstring As String = ""
            If lastupdate < DateAdd("s", -1, Now()) Then
                phstring = getAllResources(sID)
                'Redirect to same page again
                Dim mylabel As New Label
                mylabel.Text = phstring
                phResourceList.Controls.Add(mylabel)
                phResourceList.Visible = True
                loading.Visible = False

            Else
                phstring = "The resources list was last reloaded on " & lastupdate
                Dim mylabel As New Label
                mylabel.Text = phstring
                phResourceList.Controls.Add(mylabel)
                phResourceList.Visible = True
                loading.Visible = False
                allresources.Visible = True
            End If


        End If

    End Sub

    Protected Sub reload_click(sender As Object, e As EventArgs)
        Dim sID As String = ""
        sID = Server.HtmlEncode(Request.QueryString("s"))
        'reload the data on the backend
        Dim phstring As String = ""
        phstring = getAllResources(sID)
        'Redirect to same page again
        Dim mylabel As New Label
        mylabel.Text = phstring
        phResourceList.Controls.Add(mylabel)
    End Sub

    Friend Function getAllResources(Optional ByVal sectorid As String = "")


        If Not IsPostBack Then

            'Try
            Dim dt As DataTable = Nothing
            Dim CatchMsg As String = ""
            Dim status As String = ""
            If CookieValue = "User" Then
                status = "final"
            End If

            If sectorid = "" Then
                dt = clsResourceDAO.getAllResources2(status)

            Else
                dt = clsResourceDAO.GetResourcesbySector(sectorid, status)
            End If

            Dim data As New clsResourceDAO
            Dim phString As String = ""
            phString = data.SaveResourceLIst(dt, sectorid)
            Return phString

        Else
            Trace.Warn("ispostback")
            Return "Reload the page to refresh the resources list."
        End If

    End Function
























End Class
