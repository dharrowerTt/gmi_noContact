Imports System.data
Imports System.Data.SqlClient
Partial Class partnerProfile

    Inherits System.Web.UI.Page

    Private strID As String

#Region " Web Form Designer Generated Code "

    'This call is required by the Web Form Designer.
    <System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()

    End Sub
    Protected WithEvents lblOngoing As System.Web.UI.WebControls.Literal
    Protected WithEvents lblIdeas As System.Web.UI.WebControls.Literal

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
        If Not IsPostBack Then
            strID = Server.HtmlEncode(Request.QueryString("id"))
            'for testing 
            'strID = "2"

            If strID = "" Then
                getList()
                lblContacts.Visible = False
            Else
                LitList.Text = ""
                getData()
            End If

        End If
    End Sub

#Region "Private Functions"

    Private Sub getData()

        '<a href=mailto:"<%# DataBinder.Eval(Container.DataItem, "email")%>"> <%# DataBinder.Eval(Container.DataItem, "email") %></a>

        'Dim sURL As String = "../../projects/project_detail.aspx?id="

        Dim conn As New SqlConnection
        conn.ConnectionString() = GetConnString()
        conn.Open()

        Dim cmd As New SqlCommand
        Dim param = New SqlParameter("@_id", SqlDbType.VarChar)
        param.Value = strID
        cmd.Parameters.Add(param)
        cmd.Connection = conn

        cmd.CommandText = "SELECT * FROM viewOrgDetail WHERE organizationID = @_ID"
        Dim da As New SqlDataAdapter(cmd)
        Dim ds As New DataSet
        da.Fill(ds, "orgs")
        Dim bldr As New SqlCommandBuilder(da)
        Dim dt As DataTable = ds.Tables(0)

        If dt.Rows.Count = 1 Then
            name.Text = dt.Rows(0).Item("name")
            expertise.Text = trtChr13ToBr(dt.Rows(0).Item("expertise")) '& "<br /><br /><a href=../project-network/pnmMyExpertise.aspx?id=" & strID & " class=bkgdlink>Update Organization Profile</a>"
            tocPublic.Text = dt.Rows(0).Item("tocPublic")
            If Len(dt.Rows(0).Item("website")) > 0 And LCase(dt.Rows(0).Item("website")) <> "http://" And LCase(dt.Rows(0).Item("website")) <> "http:\\" Then
                website.Text = "<a href=" & dt.Rows(0).Item("website") & ">" & dt.Rows(0).Item("website") & "</a><IMG height=12 alt='Exit methanetomarkets.org domain' src=/images/exit.gif border=0>"
            End If
            dt.Dispose()

            Dim arAOI(5) As String
            Dim x As Integer
            Dim strComma As String = ""

            'sSql = "SELECT * FROM viewContactList WHERE organizationID=" & strID & " ORDER BY fullname, contactID"
            cmd.CommandText = "SELECT * FROM viewContactList WHERE organizationID = @_ID ORDER BY fullname, contactID"
            Dim da2 As New SqlDataAdapter(cmd)
            Dim ds2 As New DataSet
            da2.Fill(ds2, "orgs")
            Dim bldr2 As New SqlCommandBuilder(da2)
            Dim dt2 As DataTable = ds2.Tables(0)
            If dt2.Rows.Count = 1 Then
                For x = 0 To dt2.Rows.Count - 1
                    If dt2.Rows(x).Item("aoi_agriculture") Then
                        arAOI(0) = "Agriculture"
                    End If
                    If dt2.Rows(x).Item("aoi_coal") Then
                        arAOI(1) = "Coal Mines"
                    End If
                    If dt2.Rows(x).Item("aoi_landfill") Then
                        arAOI(2) = "Landfills"
                    End If
                    If dt2.Rows(x).Item("aoi_oilngas") Then
                        arAOI(3) = "Oil and Gas"
                    End If
                    If dt2.Rows(x).Item("aoi_other") Then
                        arAOI(4) = "Other"
                    End If
                Next
                AOI.Text = "<p>"
                For x = 0 To 4
                    If Len(arAOI(x)) > 0 Then
                        AOI.Text &= strComma & arAOI(x)
                        strComma = ", "
                    End If
                Next
                AOI.Text &= "</p>"
            End If

            cmd.CommandText = "SELECT * FROM viewContactList WHERE PostMyInfo=1 AND organizationID= @_ID ORDER BY fullname, contactID"
            Dim da5 As New SqlDataAdapter(cmd)
            Dim ds5 As New DataSet
            da5.Fill(ds5, "contacts")
            Dim bldr5 As New SqlCommandBuilder(da5)
            Dim dt5 As DataTable = ds5.Tables(0)

            Dim strLeftOrRight As String = "Left"
            lblContacts.Text = "<table width=100% border=0 cellpadding=0 cellspacing=0>" & Chr(13)
            For x = 0 To dt5.Rows.Count - 1
                If strLeftOrRight = "Left" Then
                    lblContacts.Text &= "<tr align=left>"
                End If
                Dim strGeo As String = ""

                If Not IsDBNull(dt5.Rows(x).Item("geoPartnership")) Then
                    ' I think we only need to check the first cell for dbnull. if one has non-null, then they all should have non-null; jc
                    If dt5.Rows(x).Item("geoPartnership") = 1 Then
                        strGeo &= "<br />Partnership-wide"
                    End If
                    If dt5.Rows(x).Item("geoRegion") = 1 Then
                        strGeo &= "<br />Region(s): " & dt5.Rows(x).Item("geoRegionList")
                    End If
                    If dt5.Rows(x).Item("geoCountry") = 1 Then
                        strGeo &= "<br />Country(s): " & dt5.Rows(x).Item("geoCountryList")
                    End If
                End If

                lblContacts.Text &= "<td width=225 align=left valign=top><span class=td-title2>" & dt5.Rows(x).Item("fullname")
                lblContacts.Text &= "<br />Phone: " & dt5.Rows(x).Item("telephone")
                lblContacts.Text &= "<br />Email: <a href=mailto:" & dt5.Rows(x).Item("email") & ">" & dt5.Rows(x).Item("email") & "</a>"
                lblContacts.Text &= "<br />Fax: " & dt5.Rows(x).Item("fax")
                lblContacts.Text &= "<br />Geographic Area of Interest: " & strGeo
                'lblContacts.Text &= "<br /><br /><a href=../project-network/pnmMyContactInfo.aspx?id=" & dt5.Rows(x).Item("contactID") & " class=bkgdlink>Update Contact Information</a>"
                lblContacts.Text &= "<br /><br />"
                lblContacts.Text &= "</span></td>"
                If strLeftOrRight = "Left" Then
                    If x = dt5.Rows.Count - 1 Then
                        ' you are on your last row
                        lblContacts.Text &= "<td>&nbsp;</td></tr>" & Chr(13)
                    Else
                        strLeftOrRight = "Right"
                    End If
                Else
                    lblContacts.Text &= "</tr>" & Chr(13)
                    strLeftOrRight = "Left"
                End If
            Next
            lblContacts.Text &= "</table>" & Chr(13)
        End If
        dt.Dispose()
    End Sub
    Private Sub getList()
        Dim data As New DAL
        Dim dt As DataTable = Nothing
        dt = data.GetPartnerList()
        Dim mytext As String = ""
        If (Not IsNothing(dt)) Then
            For Each CD As DataRow In dt.Rows
                mytext += FormatLinkAsList(CD("Name").ToString, "partnerProfile.aspx?id=" & CD("organizationID").ToString, "", "", "", "", "")
            Next
        End If
        LitList.Text = mytext
        LitList.Visible = True
    End Sub
#End Region

End Class
