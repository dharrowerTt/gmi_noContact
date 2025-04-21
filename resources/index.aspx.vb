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
Partial Class resources_index
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

            Dim curFile As String = System.Web.HttpContext.Current.Server.MapPath("\resources\all_resources.html")
            lastupdate = File.GetLastWriteTime(curFile)
            'If lastupdate < DateAdd("d", -3, Now()) Then
            '    getAllResources(sID)

            'End If

            If sID = "" Then
                allresources.Visible = True

            ElseIf sID = "coal" Then
                coalresources.Visible = True
            ElseIf sID = "biogas" Then
                biogasresources.Visible = True
            ElseIf sID = "oil" Then
                oilgasresources.Visible = True
            End If
        End If

    End Sub

    Protected Sub reload_click(sender As Object, e As EventArgs)
        Dim sID As String = ""
        sID = Server.HtmlEncode(Request.QueryString("s"))
        'reload the data on the backend
        getAllResources(sID)
        'Redirect to same page again

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
                    dt = clsResourceDAO.GetResources(status)

                Else
                    dt = clsResourceDAO.GetResourcesbySector(sectorid, status)
                End If

            Dim data As New clsResourceDAO
            Dim phString As String = ""
            phString = data.SaveResourceLIst(dt, sectorid)

            'Dim mylabel As Literal
            '    mylabel = New Literal
            '    mylabel.Text = phString
            '    phResourceList.Controls.Add(mylabel)
            'Catch
            '    Dim mylabel As Literal
            '    mylabel = New Literal
            '    phResourceList.Controls.Add(mylabel)
            'End Try
        Else
            Trace.Warn("ispostback")
        End If

    End Function
























End Class
