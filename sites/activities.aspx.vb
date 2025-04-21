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
Partial Class activities
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
                Dim curFile As String = System.Web.HttpContext.Current.Server.MapPath("\sites\all_activities.html")
                lastupdate = File.GetLastWriteTime(curFile)

            Else
                Dim sectorfile As String = System.Web.HttpContext.Current.Server.MapPath("\sites\" & sID & "_activities.html")
                lastupdate = File.GetLastWriteTime(sectorfile)

            End If
            If lastupdate < DateAdd("d", -3, Now()) Then
                getAllActivities(sID)

            End If

            If sID = "" Then
                allactivities.Visible = True

            ElseIf sID = "coal" Then
                coalactivities.Visible = True
            ElseIf sID = "biogas" Then
                biogasactivities.Visible = True
            ElseIf sID = "oil" Then
                oilgasactivities.Visible = True
            End If
        End If

    End Sub

    Protected Sub reload_click(sender As Object, e As EventArgs)
        Dim sID As String = ""
        sID = Server.HtmlEncode(Request.QueryString("s"))
        'reload the data on the backend
        getAllActivities(sID)
        'Redirect to same page again

    End Sub

    Friend Function getAllActivities(Optional ByVal sectorid As String = "")


        If Not IsPostBack Then

            'Try
            Dim dt As DataTable = Nothing
            Dim CatchMsg As String = ""
            Dim status As String = ""
            If CookieValue = "User" Then
                status = "final"
            End If

            If sectorid = "" Then
                dt = clsActivitiesDAO.GetActivities(status)

            Else
                dt = clsActivitiesDAO.GetActivitiesbySector(sectorid, status)
            End If

            Dim data As New clsActivitiesDAO
            Dim phString As String = ""
            phString = data.SaveActivityLIst(dt, sectorid)

        Else
            Trace.Warn("ispostback")
        End If

    End Function
























End Class
