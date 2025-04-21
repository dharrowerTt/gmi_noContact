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


Public Class country_v2
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        Page.MaintainScrollPositionOnPostBack = True
        If Not Me.IsPostBack Then
            btnExportToExcel.Visible = False
            Try
                Dim strSearch As String = ""
            Catch ex As Exception

            End Try

            pnlCategory.Visible = False
            SearchResults.Visible = False
            Me.BindGrid()




        End If
    End Sub
    Public Overrides Sub VerifyRenderingInServerForm(ByVal control As System.Web.UI.Control)
        'MyBase.VerifyRenderingInServerForm(control)
    End Sub


    Private Sub BindGrid(Optional ByVal direction As String = "", Optional ByVal sortExpression As String = "")



        Dim strConnString As String = ConfigurationManager.AppSettings.Item("GMIdatabase")
        Dim condition As String = String.Empty
        Dim countrycondition As String = String.Empty
        Dim strSearchFilters As String = String.Empty


      

        'Keyword filter (use the country name)
        Dim strKeywordFilter As String = String.Empty
        strKeywordFilter = "xxxxx"


        'Category Filter
        Dim strcategoryFilter As String = String.Empty
        For Each item As ListItem In categoryFilter.Items
            strcategoryFilter += If(item.Selected, String.Format("'{0}',", item.Value), String.Empty)
        Next

        Dim strCountCondition As String = String.Empty

        'use country name
        'countrycondition = String.Format(" WHERE [country] in ({0})", strcountryFilter.Substring(0, strcountryFilter.Length - 1))

        '  SET THE QUERY UP THIS WAY:
        'where(category = "x" And (country = "y" Or keyword = "y"))

        'If Not String.IsNullOrEmpty(condition) Then

        '    If Not String.IsNullOrEmpty(strcategoryFilter) Then
        '        condition += String.Format(" AND [search].[category] IN ({0})", strcategoryFilter.Substring(0, strcategoryFilter.Length - 1))
        '    End If
        '    If Not String.IsNullOrEmpty(strKeywordFilter) Then
        '        condition += String.Format(" AND [keywords] like '%{0}%'", strKeywordFilter.Substring(0, strKeywordFilter.Length))
        '        strCountCondition += String.Format(" AND [keywords] like '%{0}%'", strKeywordFilter.Substring(0, strKeywordFilter.Length))
        '    End If

        'ElseIf Not String.IsNullOrEmpty(strcountryFilter) Then
        '    condition = "WHERE 1=1 "
        '    strCountCondition = "WHERE 1=1 "
        '    If Not String.IsNullOrEmpty(strcategoryFilter) Then
        '        condition += String.Format(" AND [search].[category] IN ({0})", strcategoryFilter.Substring(0, strcategoryFilter.Length - 1))
        '    End If
        '    If Not String.IsNullOrEmpty(strKeywordFilter) Then
        '        condition += String.Format(" AND [keywords] like '%{0}%'", strKeywordFilter.Substring(0, strKeywordFilter.Length))
        '        strCountCondition += String.Format(" AND [keywords] like '%{0}%'", strKeywordFilter.Substring(0, strKeywordFilter.Length))
        '    End If
        'End If



        Dim orderby As String = String.Empty
        If Not String.IsNullOrEmpty(sortExpression) Then
            orderby = " order by " + sortExpression + direction
        Else
            orderby = " order by categoryOrder, category, preferred_order, name"
        End If

        LitactivityCount.Text = "(0)"
        LitpartnerCount.Text = "(0)"
        LiteventCount.Text = "(0)"
        LitresourcesCount.Text = "(0)"


        Dim strQuery As String = " SELECT search.ID, search.category, search.type, search.Name, search.year, search.language, search.preferred_order, search.Link, search.LinkText, countries, region, search.categoryOrder, search.sectors FROM     tbl_AdvancedSearch AS search "
        strQuery += condition
        If Not String.IsNullOrEmpty(countrycondition) Then
            strQuery += " AND search.ID_category in (select distinct ID_category from tbl_search_x_country  " + countrycondition + ")"
        End If
        strQuery += orderby


        Dim strExportQuery As String = " SELECT search.category, search.type, search.Name, search.year, search.language, 'https://www.globalmethane.org' + search.Link, countries, region, search.Expertise, search.Project_Network_Member, search.resourceTopic, search.Filetype, search.SiteName, search.sectors FROM     tbl_AdvancedSearch AS search "
        strExportQuery += condition
        If Not String.IsNullOrEmpty(countrycondition) Then
            strExportQuery += " AND search.ID_category in (select distinct ID_category from tbl_search_x_country  " + countrycondition + ")"
        End If

        'Dim strCountQuery As String = "select category, count(name) as totalCount from (SELECT search.category, name FROM tbl_AdvancedSearch search left outer join tbl_advancedSearchCountries as c ON search.category = c.category AND search.ID = c.ID "

        Dim strCountQuery As String = " SELECT category, count(id) as totalcount from (SELECT search.category, ID FROM tbl_AdvancedSearch search  "
        strCountQuery += strCountCondition
        If Not String.IsNullOrEmpty(countrycondition) Then
            strCountQuery += " AND search.ID_category in (select distinct ID_category from tbl_search_x_country  " + countrycondition + ")"
        End If

        Using con As New SqlConnection(strConnString)
            Using cmd As New SqlCommand(strQuery)
                Using sda As New SqlDataAdapter(cmd)
                    cmd.Connection = con
                    Using dt As New DataTable()
                        sda.Fill(dt)
                        SearchResults.DataSource = dt
                        SearchResults.DataBind()
                    End Using
                End Using
            End Using

            LitExportSQL.Text = strExportQuery


            Using cmd2 As New SqlCommand(strCountQuery & ") as list group by category")
                Using sda As New SqlDataAdapter(cmd2)
                    cmd2.Connection = con
                    Using dt As New DataTable()
                        sda.Fill(dt)
                        For Each row In dt.Rows
                            If row("category").ToString = "Activity" Then
                                LitactivityCount.Text = "(" & row("totalcount").ToString & ")"
                            End If
                            If row("category").ToString = "Partner" Then
                                LitpartnerCount.Text = "(" & row("totalcount").ToString & ")"
                            End If
                            If row("category").ToString = "Event" Then
                                LiteventCount.Text = "(" & row("totalcount").ToString & ")"
                            End If
                            If row("category").ToString = "Resource" Then
                                LitresourcesCount.Text = "(" & row("totalcount").ToString & ")"
                            End If
                        Next
                    End Using
                End Using
            End Using
        End Using

       
    End Sub

    Protected Sub ActivitiesLink_Click(sender As Object, e As EventArgs) Handles ActivitiesLink.Click
        SearchResults.Visible = True
        For Each li As ListItem In categoryFilter.Items
            If li.Value = "Activity" Then
                'Ok, this is the CheckBox we care about to determine if the TextBox should be enabled... is the CheckBox checked?
                If Not li.Selected Then
                    'Yes, it is! Enable TextBox
                    li.Selected = True
                End If
            Else
                li.Selected = False
            End If
        Next
        
        SearchResults.Columns(4).Visible = False
        SearchResults.Columns(1).Visible = True

        btnExportToExcel.Visible = True


        tab3.CssClass = "tablink"
        tab2.CssClass = "tablink"
        tab1.CssClass = "activetab"
        tab5.CssClass = "tablink"
        tab7.CssClass = "tablink"
        tab8.CssClass = "tablink"
        Me.BindGrid()
    End Sub

    Protected Sub ToolsResourcesLink_Click(sender As Object, e As EventArgs) Handles ToolsResourcesLink.Click
        SearchResults.Visible = True
        For Each li As ListItem In categoryFilter.Items
            If li.Value = "Resource" Then
                'Ok, this is the CheckBox we care about to determine if the TextBox should be enabled... is the CheckBox checked?
                If Not li.Selected Then
                    'Yes, it is! Enable TextBox
                    li.Selected = True
                End If
            Else
                li.Selected = False
            End If
        Next
        SearchResults.Columns(4).Visible = True
        SearchResults.Columns(1).Visible = True
        btnExportToExcel.Visible = True
        tab1.CssClass = "tablink"
        tab2.CssClass = "activetab"
        tab3.CssClass = "tablink"
        tab5.CssClass = "tablink"
        tab7.CssClass = "tablink"
        tab8.CssClass = "tablink"
        Me.BindGrid()

    End Sub
    Protected Sub EventLink_Click(sender As Object, e As EventArgs) Handles EventLink.Click
        SearchResults.Visible = True
        For Each li As ListItem In categoryFilter.Items
            If li.Value = "Event" Then
                'Ok, this is the CheckBox we care about to determine if the TextBox should be enabled... is the CheckBox checked?
                If Not li.Selected Then
                    'Yes, it is! Enable TextBox
                    li.Selected = True
                End If
            Else
                li.Selected = False
            End If
        Next

        SearchResults.Columns(4).Visible = False
        SearchResults.Columns(1).Visible = True

        btnExportToExcel.Visible = True
        tab1.CssClass = "tablink"
        tab2.CssClass = "tablink"
        tab3.CssClass = "activetab"
        tab5.CssClass = "tablink"
        tab7.CssClass = "tablink"
        Me.BindGrid()
    End Sub

    Protected Sub MembersLink_Click(sender As Object, e As EventArgs) Handles MembersLink.Click
        SearchResults.Visible = True
        For Each li As ListItem In categoryFilter.Items
            If li.Value = "Partner" Then
                If Not li.Selected Then
                    li.Selected = True
                End If
            Else
                li.Selected = False
            End If
        Next
        SearchResults.Columns(4).Visible = False
        SearchResults.Columns(1).Visible = False
        btnExportToExcel.Visible = True
        tab1.CssClass = "tablink"
        tab2.CssClass = "tablink"
        tab3.CssClass = "tablink"
        tab5.CssClass = "activetab"
        tab7.CssClass = "tablink"
        tab8.CssClass = "tablink"
        Me.BindGrid()
    End Sub


    Protected Sub ActionPlansLink_Click(sender As Object, e As EventArgs) Handles ActionPlansLink.Click
        SearchResults.Visible = False
        For Each li As ListItem In categoryFilter.Items
            li.Selected = False
        Next
        btnExportToExcel.Visible = False
        tab1.CssClass = "tablink"
        tab2.CssClass = "tablink"
        tab3.CssClass = "tablink"
        tab7.CssClass = "activetab"
        tab5.CssClass = "tablink"
        tab8.CssClass = "tablink"
        Me.BindGrid()
    End Sub
    Protected Sub SubcommitteeLinkLink_Click(sender As Object, e As EventArgs) Handles SubcommitteeLink.Click
        SearchResults.Visible = False
        For Each li As ListItem In categoryFilter.Items
            li.Selected = False
        Next
        btnExportToExcel.Visible = False
        tab1.CssClass = "tablink"
        tab2.CssClass = "tablink"
        tab3.CssClass = "tablink"
        tab8.CssClass = "activetab"
        tab5.CssClass = "tablink"
        tab7.CssClass = "tablink"
        Me.BindGrid()
    End Sub


    Protected Sub OnPageIndexChanging(sender As Object, e As GridViewPageEventArgs)
        SearchResults.PageIndex = e.NewPageIndex
        Me.BindGrid()
    End Sub

    Protected Sub category_selected(sender As Object, e As EventArgs) Handles categoryFilter.SelectedIndexChanged
        Me.BindGrid()
    End Sub

    Protected Sub SearchResults_PageIndexChanging(sender As Object, e As GridViewPageEventArgs) Handles SearchResults.PageIndexChanging
        SearchResults.PageIndex = e.NewPageIndex
        Me.BindGrid()
    End Sub






    Protected Sub SortRecords(ByVal sender As Object, ByVal e As GridViewSortEventArgs)
        Dim sortExpression As String = e.SortExpression
        Dim direction As String = String.Empty
        If SortDirection = SortDirection.Ascending Then
            SortDirection = SortDirection.Descending
            direction = " DESC"
        Else
            SortDirection = SortDirection.Ascending
            direction = " ASC"
        End If
        Me.BindGrid(direction, sortExpression)

    End Sub

    Public Property SortDirection() As SortDirection
        Get
            If ViewState("SortDirection") Is Nothing Then
                ViewState("SortDirection") = SortDirection.Ascending
            End If
            Return DirectCast(ViewState("SortDirection"), SortDirection)
        End Get
        Set(ByVal value As SortDirection)
            ViewState("SortDirection") = value
        End Set
    End Property


    Protected Sub btnExportToExcel_click(ByVal sender As Object, ByVal e As EventArgs)
        Dim strConnString As String = ConfigurationManager.AppSettings.Item("GMIdatabase")
        Using con As New SqlConnection(strConnString)
            Using cmd3 As New SqlCommand(LitExportSQL.Text)
                Using sda As New SqlDataAdapter(cmd3)
                    cmd3.Connection = con
                    Using dt As New DataTable()
                        sda.Fill(dt)
                        searchExport.DataSource = dt
                        searchExport.DataBind()
                    End Using
                End Using
            End Using
        End Using

        ExportToExcel()
    End Sub

   


    Protected Sub ExportToExcel()
        Response.Clear()
        Response.Buffer = True
        Response.ContentType = "application/vnd.ms-excel"
        Response.AddHeader("content-disposition", "attachment;filename=SearchExport.xls")
        Response.Charset = ""


        EnableViewState = False

        Dim sw As New System.IO.StringWriter()
        Dim htw As New System.Web.UI.HtmlTextWriter(sw)

        searchExport.RenderControl(htw)
        Response.Write(sw.ToString())
        Response.End()

    End Sub



End Class