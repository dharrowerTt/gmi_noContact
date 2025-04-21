Imports System.Data.SqlClient

Partial Class ProjectsIndex
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
    Protected WithEvents ddlExpo As System.Web.UI.WebControls.DropDownList
    'Protected WithEvents link1 As System.Web.UI.WebControls.LinkButton

    Private Sub Page_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        'Put user code to initialize the page here




        Dim x As Integer

        If Not IsPostBack Then
            ' major difference between User and Index: Index might have querystring variables, User never will
            Dim dv As DataView = Nothing

            dv = clsLookup.GetGeoFocus
            ddlGeoFocus.DataTextField = "geoname"
            ddlGeoFocus.DataValueField = "geoCode"
            ddlGeoFocus.DataSource = dv
            ddlGeoFocus.DataBind()

            If Len(Server.HtmlEncode(Request.QueryString("sector"))) > 0 Then
                Dim strSector = LCase(Server.HtmlEncode(Request.QueryString("sector")))
                For x = 0 To ddlSector.Items.Count - 1
                    If LCase(ddlSector.Items(x).Value) = strSector Then
                        ddlSector.SelectedIndex = x
                        Exit For
                    End If
                Next
            End If

            'Trace.Warn("geoFocus argument: " & LCase(Request.QueryString("geoFocus")))
            If Len(Server.HtmlEncode(Request.QueryString("geoFocus"))) > 0 Then

                Dim strGeoFocus As String

                'Select Case LCase(Request.QueryString("geoFocus"))
                'Case "uk"
                'strGeoFocus = "United Kingdom"
                '    Case "usa"
                'strGeoFocus = "United States"
                '    Case "korea"
                'strGeoFocus = "Republic of Korea"
                '    Case "ec", "eu"
                'strGeoFocus = "European Commission"
                '    Case Else
                'strGeoFocus = Request.QueryString("geoFocus")
                'End Select
                strGeoFocus = getGeoFocus(Request.QueryString("geoFocus"))

                If Len(strGeoFocus) > 0 Then
                    For x = 0 To ddlGeoFocus.Items.Count - 1
                        Trace.Warn("ddlGeoFocus.Item: " & LCase(ddlGeoFocus.Items(x).Text) & ", strGeoFocus: " & strGeoFocus)
                        If LCase(ddlGeoFocus.Items(x).Text) = LCase(strGeoFocus) Then
                            Trace.Warn("MATCHED")
                            ddlGeoFocus.SelectedIndex = x
                            Exit For
                        End If
                    Next
                End If
            End If
            If Len(Server.HtmlEncode(Request.QueryString("stage"))) > 0 Then
                For x = 0 To ddlStage.Items.Count - 1
                    If LCase(ddlStage.Items(x).Value) = LCase(Server.HtmlEncode(Request.QueryString("stage"))) Then
                        ddlStage.SelectedIndex = x
                        Exit For
                    End If
                Next
            End If
            'If Len(Request.QueryString("expo")) > 0 Then
            '    Dim strExpo = LCase(Request.QueryString("expo"))
            '    For x = 0 To ddlExpo.Items.Count - 1
            '        If LCase(ddlExpo.Items(x).Value) = strExpo Then
            '            ddlExpo.SelectedIndex = x
            '            Exit For
            '        End If
            '    Next
            'End If
        End If

        litProjects.Text = getProjects()

    End Sub

    Private Function getProjects() As String

        Dim sSector As String = ddlSector.SelectedValue
        Dim sGeoFocus As String = ddlGeoFocus.SelectedValue
        Dim sStage As String = ddlStage.SelectedValue
        'Dim sExpo As String = ddlExpo.SelectedValue

        Dim strWhere As String = ""
        Dim strAnd As String = " AND "    'adding isVisibleToUser in strWhere later, so alway have AND
        Dim strSQL As String = "SELECT * FROM viewProjects"

        If Len(sSector) > 0 Then
            sSector = Common.StripMetaChars(sSector)
            strWhere = strAnd & " sector='" & sSector & "'"
            'strAnd = " AND "
        End If

        If Len(sGeoFocus) > 0 Then
            sGeoFocus = Common.StripMetaChars(sGeoFocus)
            strWhere &= strAnd & " geographicFocus like ('%" & sGeoFocus & "%')"
            'strAnd = " AND "
        End If

        If Len(sStage) > 0 Then
            sStage = Common.StripMetaChars(sStage)
            strWhere &= strAnd & " ProjectStatus='" & sStage & "'"
            'strAnd = " AND "
        End If

        'If Len(sExpo) > 0 Then
        '    Select Case sExpo
        '        Case "newdelhi"
        '            strWhere &= strAnd & " expoNewDelhi=1"
        '            'strAnd = " AND "
        '        Case "beijing"
        '            strWhere &= strAnd & " expobeijing=1"
        '            'strAnd = " AND "
        '    End Select
        'End If

        'If Len(strWhere) > 0 Then
        strSQL &= " WHERE isVisibleToUser=1 and status='A' " & strWhere
        'End If

        'litProjects.Text &= "<tr>"
        'litProjects.Text &= "<td>12 June 2008</td>"
        'litProjects.Text &= "<td><a href=#>Coal Mine Project from code behind</a></td>"
        'litProjects.Text &= "<td>Coal Mines</td>"
        'litProjects.Text &= "<td>Ohio</td>"
        'litProjects.Text &= "<td>Unknown</td>"
        'litProjects.Text &= "</tr>"

        Dim conn As New SqlConnection
        conn.ConnectionString() = GetConnString()
        conn.Open()

        Dim cmd As New SqlCommand
        Dim x As Integer
        'Dim param1 = New SqlParameter("@_country", SqlDbType.VarChar)
        Dim strReturn As String = ""

        'param1.Value = "%" & pCountry & "%"
        'cmd.Parameters.Add(param1)
        cmd.Connection = conn
        cmd.CommandText = strSQL

        Dim da As New SqlDataAdapter(cmd)
        Dim ds As New DataSet
        da.Fill(ds, "Projects")
        Dim bldr As New SqlCommandBuilder(da)
        Dim dt As DataTable = ds.Tables(0)
        'Trace.Warn("rows returned: " & dt.Rows.Count)
        If dt.Rows.Count = 0 Then
            strReturn &= "<tr><td colspan=5><p>There are no projects available for the filters you selected.</p></td></tr>"
        Else
            For x = 0 To dt.Rows.Count - 1
                strReturn &= "<tr>"
                'Format(dt.Rows(0).Item("DateEntered"), "dd/MM/yyyy")
                'strReturn &= "<td>" & dt.Rows(x).Item("lastModifiedDate") & "</td>"
                strReturn &= "<td>" & Format(dt.Rows(x).Item("lastModifiedDate"), "dd/MM/yyyy") & "</td>"
                strReturn &= "<td><a href=" & Chr(34) & "projectDetail.aspx?ID=" & dt.Rows(x).Item("ProjectID") & Chr(34) & ">" & dt.Rows(x).Item("name") & "</a></td>"
                If Not IsDBNull(dt.Rows(x).Item("sector")) Then
                    strReturn &= "<td>" & trtProjectSector(dt.Rows(x).Item("sector")) & "</td>"
                Else
                    strReturn &= "<td></td>"
                End If
                strReturn &= "<td>" & dt.Rows(x).Item("geographicFocus") & "</td>"
                strReturn &= "<td>" & dt.Rows(x).Item("projectStatus") & "</td>"
                strReturn &= "</tr>"
            Next
        End If
        conn.Close()
        conn.Dispose()
        getProjects = strReturn

    End Function
    '<asp:LinkButton ID="link1" Runat="server" oncommand="dolink1">2007 Beijing Expo Projects</asp:LinkButton>
    Protected Sub goButton_click(ByVal sender As System.Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles goButton.Click

        'Session("goButton") = "clicked"
        litProjects.Text = getProjects()

    End Sub
End Class
