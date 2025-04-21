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




Public Class resources_filtered
    Inherits System.Web.UI.Page


    Protected WithEvents fldTopic As Global.System.Web.UI.WebControls.HiddenField
    Protected WithEvents childRepeater As Global.System.Web.UI.WebControls.Repeater


    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        Page.MaintainScrollPositionOnPostBack = True
        LitBreadcrumb.Text = "Tools and Resources"
        litTitle.Text = "Tools and Resources"
        If Not Me.IsPostBack Then
            Dim objID As String = ""

            'the topic has been selected
            objID = Server.HtmlEncode(Request.QueryString("t"))
            If objID <> "" Then
                chktopicFilter.SelectedValue = objID
                chktopicFilter.DataBind()
                Dim topic As String = ""
                Dim data As New clsSearchDAO()
                Dim topiclist As DataTable = data.GetTopicList("", "", "", "'Resource'", objID, "", "", "", 0, 1)
                Dim topicstr As String = ""
                For Each row In topiclist.Rows

                    topicstr = row("topic").ToString
                Next
                litTitle.Text = topicstr
                LitBreadcrumb.Text = topicstr
                btnClearSearch.Visible = True
            End If

            'the country has been selected
            Dim cID As String = ""
            cID = Server.HtmlEncode(Request.QueryString("c"))
            If cID <> "" Then
                Try
                    countryFilter.SelectedValue = cID
                    countryFilter.DataBind()
                    pnlCountryFilter.Visible = True
                    Dim cdata As New clsSearchDAO()
                    Dim country As DataTable = cdata.GetCountryFromID(cID)
                    Dim countrystr As String = ""
                    For Each row In country.Rows
                        countrystr = row("country").ToString
                    Next
                    litTitle.Text = countrystr
                    LitBreadcrumb.Text = countrystr
                    btnClearSearch.Visible = True
                    
                Catch
                    pnlCountryFilter.Visible = False

                End Try
            End If

            'the sector has been selected
            Dim sID As String = ""
            sID = Server.HtmlEncode(Request.QueryString("s"))
            If sID <> "" Then
                chksectorFilter.SelectedValue = sID
                chksectorFilter.DataBind()
                litTitle.Text = trtProjectSector(sID)
                LitBreadcrumb.Text = trtProjectSector(sID)
                btnClearSearch.Visible = True
            End If





            Me.BindGrid()





        End If
    End Sub
    Public Overrides Sub VerifyRenderingInServerForm(ByVal control As System.Web.UI.Control)
        'MyBase.VerifyRenderingInServerForm(control)
    End Sub


    Private Sub BindGrid(Optional ByVal direction As String = "", Optional ByVal sortExpression As String = "")



        Dim strConnString As String = ConfigurationManager.AppSettings.Item("GMIdatabase")
        

        Dim topicFilter As String = String.Empty
        Dim sectorcondition As String = String.Empty
        Dim countrycondition As String = String.Empty
        Dim criterianotselected As String = "false"
        Dim strSearchFilters As String = String.Empty
        Dim strTopics As String = String.Empty
        'Topic Filter
        Dim objID As String = ""
        objID = Server.HtmlEncode(Request.QueryString("t"))
        'If objID <> "" Then
        '    topicFilter += objID
        '    strTopics += litTitle.Text & ","
        '    strSearchFilters += "<b>Topic:</b> " & litTitle.Text
        'Else
        For Each item As ListItem In chktopicFilter.Items
            topicFilter += If(item.Selected, String.Format("{0},", item.Value), String.Empty)
            strTopics += If(item.Selected, String.Format("{0},", item.Text), String.Empty)
        Next
        If Not String.IsNullOrEmpty(topicFilter) Then
            strSearchFilters += String.Format("<b>Topic:</b> {0}; ", strTopics.Substring(0, strTopics.Length - 1))
            topicFilter = topicFilter.Substring(0, topicFilter.Length - 1)
        End If
        'End If


        'Sector Filter
        Dim strsectorFilter As String = String.Empty
        Dim sID As String = ""
        sID = Server.HtmlEncode(Request.QueryString("s"))
        'If sID <> "" Then
        '    Dim data2 As New clsSearchDAO()
        '    Dim dt2 As DataTable = data2.getSectorFromAbbr(sID)
        '    For Each row In dt2.Rows
        '        strsectorFilter += "'" & row("sector") & "',"
        '    Next
        '    chksectorFilter.SelectedValue = sID
        'Else
        For Each item As ListItem In chksectorFilter.Items


            strsectorFilter += If(item.Selected, String.Format("'{0}',", trtProjectSector(item.Value)), String.Empty)
        Next
        'End If

        If Not String.IsNullOrEmpty(strsectorFilter) Then
            strSearchFilters += String.Format("<b>Sector:</b> {0}; ", strsectorFilter.Substring(0, strsectorFilter.Length - 1))
            strsectorFilter = strsectorFilter.Substring(0, strsectorFilter.Length - 1)
        End If

        'Region Filter
        Dim strregionFilter As String = String.Empty
        For Each item As ListItem In chkregionFilter.Items
            strregionFilter += If(item.Selected, String.Format("'{0}',", item.Value), String.Empty)
        Next
        If Not String.IsNullOrEmpty(strregionFilter) Then
            strSearchFilters += String.Format("<b>Region:</b> {0}; ", strregionFilter.Substring(0, strregionFilter.Length - 1))
            strregionFilter = strregionFilter.Substring(0, strregionFilter.Length - 1)
        End If

        'Country Filter
        Dim strcountryFilter As String = String.Empty
        Dim cID As String = ""
        cID = Server.HtmlEncode(Request.QueryString("c"))
        'If cID <> "" Then
        '    Dim data1 As New clsSearchDAO()
        '    Dim dt1 As DataTable = data1.GetCountryFromID(cID)
        '    For Each row In dt1.Rows
        '        strcountryFilter += "'" & row("country") & "',"
        '    Next

        '    countryFilter.SelectedValue = cID
        'Else
        For Each item As ListItem In countryFilter.Items
            strcountryFilter += If(item.Selected, String.Format("'{0}',", item.Text), String.Empty)
        Next
        'End If


        If Not String.IsNullOrEmpty(strcountryFilter) Then
            strSearchFilters += String.Format("<b>Country:</b> {0}; ", strcountryFilter.Substring(0, strcountryFilter.Length - 1))
            strcountryFilter = strcountryFilter.Substring(0, strcountryFilter.Length - 1)
        End If



        Dim orderby As String = String.Empty

        If Not String.IsNullOrEmpty(strsectorFilter) Or Not String.IsNullOrEmpty(strcountryFilter) Then
            'get the list of topics, and loop through them; create a repeater for each one.
            orderby = " order by year, topic, name"

        ElseIf Not String.IsNullOrEmpty(strTopics) Then
            orderby = " order by year, sectors, name"
        End If



        'LitresourcesCount.Text = "(0)"
        Dim data As New clsSearchDAO()
        Dim dt As DataTable = data.GetTopSearchResults(4, orderby, strsectorFilter, strregionFilter, "'Resource'", topicFilter, strcountryFilter, "", "", 0, 1)
        Dim topiclist As DataTable = data.GetTopicList(orderby, strsectorFilter, strregionFilter, "'Resource'", topicFilter, strcountryFilter, "", "", 0, 1)

        Dim ds As DataSet
        ds = New DataSet()
        dt.TableName = "dt"
        ds.Tables.Add(dt)

        'If dt Is Nothing Or dt.Rows.Count < 1 Then
        'Else

        'Try
        '    Results1.DataSource = dt.AsEnumerable().Take(4).CopyToDataTable()
        '    'Results1.DataSource = dt
        '    Results1.DataBind()
        '    results1head.Text = "<h2>Featured Tools and Resources</h2>"
        'Catch
        '    Results1.Visible = False
        '    results1head.Visible = False

        'End Try


        Try
            Dim featuredResources As DataTable
            featuredResources = dt.AsEnumerable().Take(4).CopyToDataTable()
            Dim myLabel = New Literal
            myLabel.Text = ""
            For x = 0 To featuredResources.Rows.Count - 1


                Dim curImg As String = Server.MapPath(featuredResources.Rows(x)("ImgURL"))
                Dim curImgAlt As String = Server.MapPath("/images/" & featuredResources.Rows(x)("ImgURL").ToString)
                Dim curAltImg As String = ""
                If System.IO.File.Exists(curImg) = True Then
                    
                    myLabel.Text += "<dl><a href ='resource_details.aspx?r=" & featuredResources.Rows(x)("ID").ToString & "'><dt><img src='" & featuredResources.Rows(x)("ImgURL").ToString & "'></dt><dd>" & featuredResources.Rows(x)("LinkText").ToString & "</dd></a></dl>"


                ElseIf System.IO.File.Exists(curImgAlt) = True Then
                    myLabel.Text += "<dl><a href ='resource_details.aspx?r=" & featuredResources.Rows(x)("ID").ToString & "'><dt><img src='/images/" & featuredResources.Rows(x)("ImgURL").ToString & "'></dt><dd>" & featuredResources.Rows(x)("LinkText").ToString & "</dd></a></dl>"
                Else

                    myLabel.Text += " <dl><a href ='resource_details.aspx?r=" & featuredResources.Rows(x)("ID").ToString & "'><dt><img src='/images/" & Left(Replace(Replace(featuredResources.Rows(x)("sectors"), " ", ""), ";", ""), 5).ToString & ".jpg' ></dt><dd>" & featuredResources.Rows(x)("LinkText").ToString & "</dd></a></dl>"

                End If
            Next
            PHfeaturedresources.Controls.Add(myLabel)
            results1head.Text = "<h2>Featured Tools and Resources</h2>"






            'Results1.DataSource = dt
            'Results1.DataBind()

        Catch
            PHfeaturedresources.Visible = False
            results1head.Visible = False


        End Try

        ' If Not String.IsNullOrEmpty(strsectorFilter) Or Not String.IsNullOrEmpty(strcountryFilter) Then
        'get the list of topics, and loop through them; create a repeater for each one.


        'Dim topicList As DataTable = dt.DefaultView.ToTable(True, "topic")
        topiclist.TableName = "topiclist"
        ds.Tables.Add(topiclist)

        Dim relation As DataRelation
        Dim table1Column As DataColumn
        Dim table2Column As DataColumn
        'retrieve column
        table2Column = ds.Tables("dt").Columns("topic")
        table1Column = ds.Tables("topiclist").Columns("topic")
        'relating tables
        relation = New DataRelation("relation", table1Column, table2Column)
        'assign relation to dataset
        ds.Relations.Add(relation)




        'ds.Relations.Add(New DataRelation("topic", ds.Tables("dt").Columns("topic"), ds.Tables("topiclist").Columns("topic")))
        topicLinksRepeater.DataSource = topiclist
        topicLinksRepeater.DataBind()
        parentRepeater.DataSource = topiclist
        parentRepeater.DataBind()


        If Not String.IsNullOrEmpty(strSearchFilters) Then
            strSearchFilters = Replace(strSearchFilters, "'", "")
            If criterianotselected = "false" Then
                LitSearchCriteria.Text = "<script>$(document).ready(function(){$('#filtersbox').show();});</script> " + strSearchFilters
            Else
                LitSearchCriteria.Text = strSearchFilters
            End If
            LitSearchCriteria.Visible = True
            pnlSearchCriteria.Visible = True
            btnClearSearch.Visible = True

        Else
            LitSearchCriteria.Visible = False
            pnlSearchCriteria.Visible = False
            btnClearSearch.Visible = False

        End If

    End Sub

    

    
    Protected Sub parent_itemDataBound(ByVal sender As Object, ByVal e As RepeaterItemEventArgs)
        If e.Item.ItemType = ListItemType.Item Or e.Item.ItemType = ListItemType.AlternatingItem Then


            Dim topicFilter As String = String.Empty
            Dim sectorcondition As String = String.Empty
            Dim countrycondition As String = String.Empty
            Dim criterianotselected As String = "false"
            Dim strSearchFilters As String = String.Empty
            Dim strTopics As String = String.Empty
            'Topic Filter
            If Not IsDBNull(DataBinder.Eval(e.Item.DataItem, "topic")) Then
                topicFilter = DataBinder.Eval(e.Item.DataItem, "topicID")


                'Sector Filter
                Dim strsectorFilter As String = String.Empty
                For Each item As ListItem In chksectorFilter.Items
                    strsectorFilter += If(item.Selected, String.Format("'{0}',", trtProjectSector(item.Value)), String.Empty)
                Next
                If Not String.IsNullOrEmpty(strsectorFilter) Then

                    strsectorFilter = strsectorFilter.Substring(0, strsectorFilter.Length - 1)
                End If

                'Region Filter
                Dim strregionFilter As String = String.Empty
                For Each item As ListItem In chkregionFilter.Items
                    strregionFilter += If(item.Selected, String.Format("'{0}',", item.Value), String.Empty)
                Next
                If Not String.IsNullOrEmpty(strregionFilter) Then

                    strregionFilter = strregionFilter.Substring(0, strregionFilter.Length - 1)
                End If

                'Country Filter

                Dim strcountryFilter As String = String.Empty
                'Dim cID As String = ""
                'cID = Server.HtmlEncode(Request.QueryString("c"))
                'If cID <> "" Then
                '    Dim data1 As New clsSearchDAO()
                '    Dim dt1 As DataTable = data1.GetCountryFromID(cID)
                '    For Each row In dt1.Rows
                '        strcountryFilter += "'" & row("country") & "',"
                '    Next

                '    countryFilter.SelectedValue = cID
                'Else
                For Each item As ListItem In countryFilter.Items
                    strcountryFilter += If(item.Selected, String.Format("'{0}',", item.Text), String.Empty)
                Next
                'End If
                If Not String.IsNullOrEmpty(strcountryFilter) Then

                    strcountryFilter = strcountryFilter.Substring(0, strcountryFilter.Length - 1)
                End If

                Dim orderby As String = String.Empty

                If Not String.IsNullOrEmpty(strsectorFilter) Or Not String.IsNullOrEmpty(strcountryFilter) Then
                    'get the list of topics, and loop through them; create a repeater for each one.
                    orderby = " order by year desc, topic, name"

                ElseIf Not String.IsNullOrEmpty(strTopics) Then
                    orderby = " order by year desc, sectors, name"
                End If



                'LitresourcesCount.Text = "(0)"
                Dim data As New clsSearchDAO()
                Dim dt As DataTable = data.GetSearchResults(orderby, strsectorFilter, strregionFilter, "'Resource'", topicFilter, strcountryFilter, "", "", 0, 1)

                If Not IsNothing(dt) Then
                    Dim childRepeater As Repeater = CType(e.Item.FindControl("childRepeater"), Repeater)
                    childRepeater.DataSource = dt
                    childRepeater.DataBind()

                End If

            End If
        End If
    End Sub

    'Public Class Evaluation

    '    Private mytopic As String

    '    Public Sub New(newTopicID As String, newRating As String)
    '        Me.mytopic = newTopicID

    '    End Sub

    '    Public ReadOnly Property TopicID() As String
    '        Get
    '            Return newTopicID
    '        End Get
    '    End Property


    'End Class








    'Protected Sub OnPageIndexChanging(sender As Object, e As GridViewPageEventArgs)
    '    ListResults.PageIndex = e.NewPageIndex
    '    Me.BindGrid()
    'End Sub



    Protected Sub topic_selected(sender As Object, e As EventArgs) Handles chktopicFilter.SelectedIndexChanged

        Me.BindGrid()
    End Sub




    Protected Sub region_selected(sender As Object, e As EventArgs) Handles chkregionFilter.SelectedIndexChanged
        pnlCountryFilter.Visible = False
        Dim oldSelections = (From item As ListItem In countryFilter.Items Where item.Selected).ToList
        If oldSelections.Any Then
            For Each selectedItem In oldSelections
                Dim item = countryFilter.Items.FindByValue(selectedItem.Value)
                item.Selected = False
            Next
        End If

        Dim strRegionFilter As String = String.Empty
        Dim regioncondition As String = String.Empty
        regioncondition = String.Format(" AND r.countryname in (")
        For Each li As ListItem In chkregionFilter.Items
            If li.Selected Then
                strRegionFilter = li.Value
                pnlCountryFilter.Visible = True
                regioncondition += "'" + strRegionFilter + "',"
            End If
        Next
        regioncondition = String.Format(regioncondition.Substring(0, regioncondition.Length - 1))
        regioncondition += ")"
        dsCountryCheckboxList.SelectParameters("regionFilterChng").DefaultValue = regioncondition
        countryFilter.DataBind()
        If oldSelections.Any Then
            For Each selectedItem In oldSelections
                Dim item = countryFilter.Items.FindByValue(selectedItem.Value)
                If Not item Is Nothing Then
                    item.Selected = True
                End If
            Next
        End If
        litTitle.Text = ""
        LitBreadcrumb.Text = ""
        Me.BindGrid()
    End Sub

    Protected Sub country_selected(sender As Object, e As EventArgs) Handles countryFilter.SelectedIndexChanged
        litTitle.Text = ""
        LitBreadcrumb.Text = ""
        Me.BindGrid()
    End Sub

    Protected Sub sector_selected(sender As Object, e As EventArgs) Handles chksectorFilter.SelectedIndexChanged
        litTitle.Text = ""
        LitBreadcrumb.Text = ""
        Me.BindGrid()
    End Sub

    'Protected Sub SearchResults_PageIndexChanging(sender As Object, e As GridViewPageEventArgs) Handles ListResults.PageIndexChanging
    '    ListResults.PageIndex = e.NewPageIndex
    '    Me.BindGrid()
    'End Sub

    'Protected Sub mainsearchbutton_Click(sender As Object, e As EventArgs) Handles mainsearchbutton.Click
    '    Me.BindGrid()
    'End Sub




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






    Protected Sub btnClearSearch_click(ByVal sender As Object, ByVal e As EventArgs)
        Response.Redirect("resources_filtered.aspx")
    End Sub

    Protected Sub ClearSearch()
        For Each item In countryFilter.Items
            If item.Selected = True Then
                item.Selected = False
            End If
        Next
        For Each item In chkregionFilter.Items
            If item.Selected = True Then
                item.Selected = False
            End If
        Next
        For Each item In chktopicFilter.Items
            If item.selected = True Then
                item.Selected = False
            End If
        Next
        For Each item In chksectorFilter.Items
            If item.selected = True Then
                item.selected = False
            End If
        Next
        litTitle.Text = ""
        LitBreadcrumb.Text = ""
        BindGrid()

    End Sub





End Class