
Imports System.Data.SqlClient

Partial Class projectsProjectDetail
    Inherits System.Web.UI.Page

    Private projid As String

    Dim statusStr As String
    Dim projName As String


#Region " Web Form Designer Generated Code "

    'This call is required by the Web Form Designer.
    <System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()

    End Sub
    Protected WithEvents lblHdr As System.Web.UI.WebControls.Literal
    Protected WithEvents lblPC_Name As System.Web.UI.WebControls.Literal
    Protected WithEvents lblPC_fullName As System.Web.UI.WebControls.Literal
    Protected WithEvents lblPC_Phone As System.Web.UI.WebControls.Literal
    Protected WithEvents lblPC_fax As System.Web.UI.WebControls.Literal
    Protected WithEvents lblPC_email As System.Web.UI.WebControls.Literal
    Protected WithEvents lblPCC As System.Web.UI.WebControls.Literal
    Protected WithEvents lblAC As System.Web.UI.WebControls.Literal
    Protected WithEvents lastModifiedDate As System.Web.UI.WebControls.Literal
    Protected WithEvents litList As System.Web.UI.WebControls.Literal



    'new 2010


    'NOTE: The following placeholder declaration is required by the Web Form Designer.
    'Do not delete or move it.
    Private designerPlaceholderDeclaration As System.Object

    Private Sub Page_Init(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Init
        'CODEGEN: This method call is required by the Web Form Designer
        'Do not modify it using the code editor.
        InitializeComponent()
    End Sub



#End Region
    Protected WithEvents phUserRightNav As System.Web.UI.WebControls.PlaceHolder

    Dim modName As String

    Private Sub Page_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        'Put user code to initialize the page here

        If Not IsPostBack Then

            If Len(Server.HtmlEncode(Request.QueryString("ID"))) = 0 Then
                HttpContext.Current.Response.Redirect("index.aspx")
            End If

            If Not IsPostBack Then
                litBreadcrumb.Text = Session("country")
            End If

            projid = Server.HtmlEncode(Request.QueryString("Id"))
            Session("projectID") = projid




            If projid = "" Then
                litProjName.Text = "GMI and Methane to Markets Project Archive"
                litErrorInfo.Text = "<p>An error has occurred with the project report you were trying to find. For the most current information about GMI projects, visit the <a href='/advancedsearch.aspx'>Search page</a>. The <a href='/activities/actDetails.aspx'> archive of past GMI and Methane to Markets projects </a> may also be useful.</p>"



            Else
                'Try
                getData()

                'Catch
                'HttpContext.Current.Response.Redirect("/activities/actDetails.aspx")
                'End Try
            End If

            'lblHdr.Text = "Project Summary"
            'lblIntroText.Text = "&nbsp;"

        End If

    End Sub

#Region "Database Functions"

    Private Sub getData()

        Dim x As Integer

        'Dim sConn As String = GetConnString()
        'Dim sSql As String
        'sSql = "SELECT * FROM viewProjectDetail WHERE projectID=" & projid
        'Trace.Warn(sSql)

        Dim conn As New SqlConnection
        conn.ConnectionString() = GetConnString()
        conn.Open()

        Dim cmd As New SqlCommand
        Dim param = New SqlParameter("@_id", SqlDbType.VarChar)
        cmd.CommandText = "SELECT * FROM viewProjectDetail WHERE projectID = @_id"
        param.Value = projid
        cmd.Parameters.Add(param)
        cmd.Connection = conn


        Dim strSaveUserid As String = ""
        Trace.Warn(cmd.CommandText)
        Dim da As New SqlDataAdapter(cmd)
        Dim ds As New DataSet
        da.Fill(ds, "orgs")
        Dim bldr As New SqlCommandBuilder(da)
        Dim dt As DataTable = ds.Tables(0)


        If dt.Rows.Count = 1 Then
            If Len(dt.Rows(0).Item("sf_id")) > 0 Then
                'redirect to Salesforce Site Information
                litProjName.Text = "Updated Project and Activity Database"
                litErrorInfo.Text = "<p>The project report you were trying to find is not the latest. You will be redirected shortly to the latest information.</p>"
                HttpContext.Current.Response.Redirect("/activities/siteDetails.aspx?myObjID=" & dt.Rows(0).Item("sf_id").ToString)
            Else

                strSaveUserid = dt.Rows(0).Item("UserID")   ' added Oct2007

                litStage.Text = myNullCheck(dt.Rows(0).Item("projectStatus"))
                lblSector.Text = myNullCheck(dt.Rows(0).Item("sectorDesc"))
                litProjName.Text = trtChr13ToBr(dt.Rows(0).Item("name"))
                Session("projectName") = litProjName.Text

                'Session("projectStatus") = dt.Rows(0).Item("statusTxt")

                Description.Text = trtChr13ToBr(myNullCheck(dt.Rows(0).Item("description"))) & "&nbsp;"

                ghgasreduction.Text = myNullCheck(dt.Rows(0).Item("ghgasreduction")) & "&nbsp;"

                'new 2010
                ghgYears.Text = myNullCheck(dt.Rows(0).Item("ghgYears")) & "&nbsp;"

                If (myNullCheck(dt.Rows(0).Item("ghgFor")) = "lifetime") Then
                    ghgFor.Text = "(over the project lifetime)"
                End If

                If (myNullCheck(dt.Rows(0).Item("ghgFor")) = "annually") Then
                    ghgFor.Text = "(" & myNullCheck(dt.Rows(0).Item("ghgFor")) & ")"
                End If

                litResults.Text = myNullCheck(dt.Rows(0).Item("objectiveBenefits")) & "&nbsp;"

                If dt.Rows(0).Item("ExpoNo") Then
                    litExpo.Text &= "No"
                Else
                    If dt.Rows(0).Item("ExpoBeijing") Then
                        litExpo.Text &= "<br />Beijing"
                    End If
                    If dt.Rows(0).Item("ExpoNewDelhi") Then
                        litExpo.Text &= "<br />New Delhi"
                    End If
                End If

                Comments.Text = trtChr13ToBr(myNullCheck(dt.Rows(0).Item("Comments"))) & "&nbsp;"

                litLocation.Text = trtChr13ToBr(myNullCheck(dt.Rows(0).Item("locationDetail"))) & "&nbsp;"
                geoFocus.Text = dt.Rows(0).Item("geographicFocus")

                cmd.CommandText = "SELECT FileName, FileTitle FROM  ProjectFiles WHERE projectID = @_ID AND FileStatus=2 ORDER BY UPPER(FileName)"

                Dim da8 As New SqlDataAdapter(cmd)

                Dim ds8 As New DataSet
                Dim sFileSize, sFileType As String

                da8.Fill(ds8, "ac")
                Dim dt8 As DataTable = ds8.Tables(0)

                If dt8.Rows.Count = 0 Then
                    phAttachments.Visible = False
                Else
                    Dim lbl As Label
                    Dim strFileTitle As String
                    For x = 0 To dt8.Rows.Count - 1
                        Select Case LCase(Right(dt8.Rows(x).Item("filename"), 3))
                            Case "doc" : sFileType = "Word"
                            Case "wpd" : sFileType = "Word Perfect"
                            Case "pdf" : sFileType = "PDF"
                            Case "txt" : sFileType = "Text"
                            Case "ppt" : sFileType = "Powerpoint"
                            Case "xls" : sFileType = "Excel"
                            Case Else : sFileType = "Unknown"
                        End Select
                        Dim strFileName As String = "/Data/" & CType(dt8.Rows(x).Item("filename"), String).Trim
                        Trace.Warn("getting file size for " & strFileName)
                        sFileSize = getFileSize(strFileName)
                        If sFileSize = "Error" Then
                            sFileSize = ""
                        Else
                            sFileSize = ", " & sFileSize
                        End If

                        ' new block of code for fileTitle, Aug08
                        If myNullCheck(dt8.Rows(x).Item("fileTitle")) = "" Then
                            strFileTitle = dt8.Rows(x).Item("filename")
                        Else
                            strFileTitle = dt8.Rows(x).Item("fileTitle")
                        End If

                        lbl = New Label

                        'lbl.Text = "<a href=JavaScript:ShowDoc(" & Chr(34) & Common.GetAppPath(Request) & "/Data/" & _
                        '        myNullCheck(dt8.Rows(x)("filename")) & Chr(34) & ")>" & strFileTitle & _
                        '        "</a>&nbsp;(" & sFileType & sFileSize & ")<br/>"

                        'lbl.Text = "<a href=" & Chr(34) & "JavaScript:ShowDoc('" & Common.GetAppPath(Request) & "/Data/" & _
                        '        myNullCheck(dt8.Rows(x)("filename")) & "')" & Chr(34) & ">" & strFileTitle & _
                        '        "</a>&nbsp;(" & sFileType & sFileSize & ")<br/>"



                        'lbl.Text = "<a href=" & Chr(34) & "JavaScript:ShowDoc('/Data/" &   myNullCheck(dt8.Rows(x)("filename")) & "')" & Chr(34) & ">" & strFileTitle &    "</a>&nbsp;(" & sFileType & sFileSize & ")<br/>"
                        lbl.Text = "<a href='/data/" & myNullCheck(dt8.Rows(x)("filename")) & "'>" & strFileTitle & "</a>&nbsp;(" & sFileType & sFileSize & ")<br/>"
                        'document(path)
                        'pathString = "<a href=" & Chr(34) & "JavaScript:ShowDoc1('" & folderName & _
                        '    myNullCheck(dt.Rows(x)("filename")) & "')" & Chr(34) & ">" & dt.Rows(x)("filename") & _
                        '    "</a>"


                        phAttachments.Controls.Add(lbl)


                        Trace.Warn("getapppath: " & Common.GetAppPath(Request))
                        Trace.Warn("strFileName: " & strFileName)

                    Next

                End If
                dt8.Dispose()

                '''' Contact Info.....
                'sSql = "SELECT * FROM  ProjectContactInfo WHERE projectID=" & projid

                cmd.CommandText = "SELECT * FROM  ProjectContactInfo WHERE projectID= @_ID"
                Dim da4 As New SqlDataAdapter(cmd)
                Dim ds4 As New DataSet

                da4.Fill(ds4, "contactInfo")
                Dim dt4 As DataTable = ds4.Tables(0)

                If dt4.Rows.Count = 1 Then
                    instrumentalOrgs.Text = trtChr13ToBr(dt4.Rows(0).Item("instrumentalOrgs"))
                    Dim sComma As String = ""

                    ' do partner countries involved here
                    If dt4.Rows(0).Item("pco1") Then
                        lblPCo.Text = "Argentina"
                        sComma = ", "
                    End If
                    If dt4.Rows(0).Item("pco2") Then
                        lblPCo.Text += sComma & "Australia"
                        sComma = ", "
                    End If
                    If dt4.Rows(0).Item("pco3") Then
                        lblPCo.Text += sComma & "Brazil"
                        sComma = ", "
                    End If
                    If dt4.Rows(0).Item("pco28") Then
                        lblPCo.Text += sComma & "Bulgaria"
                        sComma = ", "
                    End If
                    If dt4.Rows(0).Item("pco4") Then
                        lblPCo.Text += sComma & "Canada"
                        sComma = ", "
                    End If

                    If dt4.Rows(0).Item("pco30") Then
                        lblPCo.Text += sComma & "Chile"
                        sComma = ", "
                    End If
                    If dt4.Rows(0).Item("pco5") Then
                        lblPCo.Text += sComma & "China"
                        sComma = ", "
                    End If
                    If dt4.Rows(0).Item("pco6") Then
                        lblPCo.Text += sComma & "Colombia"
                        sComma = ", "
                    End If
                    If dt4.Rows(0).Item("pco7") Then
                        lblPCo.Text += sComma & "Ecuador"
                        sComma = ", "
                    End If

                    If dt4.Rows(0).Item("pco31") Then
                        lblPCo.Text += sComma & "  Dominican Republic"
                        sComma = ", "
                    End If
                    If dt4.Rows(0).Item("pco32") Then
                        lblPCo.Text += sComma & "Ethiopia"
                        sComma = ", "
                    End If

                    If dt4.Rows(0).Item("pco21") Then
                        lblPCo.Text += sComma & "European Commission"
                        sComma = ", "
                    End If
                    If dt4.Rows(0).Item("pco27") Then
                        lblPCo.Text += sComma & "Finland"
                        sComma = ", "
                    End If

                    If dt4.Rows(0).Item("pco29") Then
                        lblPCo.Text += sComma & "Georgia"
                        sComma = ", "
                    End If

                    If dt4.Rows(0).Item("pco8") Then
                        lblPCo.Text += sComma & "Germany"
                        sComma = ", "
                    End If

                    If dt4.Rows(0).Item("pco33") Then
                        lblPCo.Text += sComma & "Ghana"
                        sComma = ", "
                    End If

                    If dt4.Rows(0).Item("pco9") Then
                        lblPCo.Text += sComma & "India"
                        sComma = ", "
                    End If

                    If dt4.Rows(0).Item("pco35") Then
                        lblPCo.Text += sComma & "Indonesia"
                        sComma = ", "
                    End If

                    If dt4.Rows(0).Item("pco10") Then
                        lblPCo.Text += sComma & "Italy"
                        sComma = ", "
                    End If
                    If dt4.Rows(0).Item("pco11") Then
                        lblPCo.Text += sComma & "Japan"
                        sComma = ", "
                    End If

                    If dt4.Rows(0).Item("pco39") Then
                        lblPCo.Text += sComma & "Jordan"
                        sComma = ", "
                    End If
                    If dt4.Rows(0).Item("pco26") Then
                        lblPCo.Text += sComma & "Kazakhstan"
                        sComma = ", "
                    End If
                    If dt4.Rows(0).Item("pco12") Then
                        lblPCo.Text += sComma & "Mexico"
                        sComma = ", "
                    End If
                    If dt4.Rows(0).Item("pco22") Then
                        lblPCo.Text += sComma & "Mongolia"
                        sComma = ", "
                    End If

                    If dt4.Rows(0).Item("pco37") Then
                        lblPCo.Text += sComma & "Nicaragua"
                        sComma = ", "
                    End If
                    If dt4.Rows(0).Item("pco13") Then
                        lblPCo.Text += sComma & "Nigeria"
                        sComma = ", "
                    End If

                    If dt4.Rows(0).Item("pco23") Then
                        lblPCo.Text += sComma & "Pakistan"
                        sComma = ", "
                    End If

                    If dt4.Rows(0).Item("pco34") Then
                        lblPCo.Text += sComma & "Peru"
                        sComma = ", "
                    End If
                    If dt4.Rows(0).Item("pco24") Then
                        lblPCo.Text += sComma & "Philippines"
                        sComma = ", "
                    End If
                    If dt4.Rows(0).Item("pco19") Then
                        lblPCo.Text += sComma & "Poland"
                        sComma = ", "
                    End If
                    If dt4.Rows(0).Item("pco14") Then
                        lblPCo.Text += sComma & "Republic of Korea"
                        sComma = ", "
                    End If
                    If dt4.Rows(0).Item("pco15") Then
                        lblPCo.Text += sComma & "Russia"
                        sComma = ", "
                    End If

                    If dt4.Rows(0).Item("pco36") Then
                        lblPCo.Text += sComma & "Serbia"
                        sComma = ", "
                    End If

                    If dt4.Rows(0).Item("pco40") Then
                        lblPCo.Text += sComma & "Sri Lanka"
                        sComma = ", "
                    End If

                    If dt4.Rows(0).Item("pco25") Then
                        lblPCo.Text += sComma & "Thailand"
                        sComma = ", "
                    End If

                    If dt4.Rows(0).Item("pco38") Then
                        lblPCo.Text += sComma & "Turkey"
                        sComma = ", "
                    End If
                    If dt4.Rows(0).Item("pco16") Then
                        lblPCo.Text += sComma & "Ukraine"
                        sComma = ", "
                    End If
                    If dt4.Rows(0).Item("pco17") Then
                        lblPCo.Text += sComma & "United Kingdom"
                        sComma = ", "
                    End If
                    If dt4.Rows(0).Item("pco18") Then
                        lblPCo.Text += sComma & "United States"
                        sComma = ", "
                    End If
                    If dt4.Rows(0).Item("pco20") Then
                        lblPCo.Text += sComma & "Vietnam"
                        sComma = ", "
                    End If

                    ' end of involved partner countries

                    If dt4.Rows(0).Item("AreYouPC") Then
                        lblPC.Text = ""
                    Else
                        lblPC.Text = "<p>First Name: " & dt4.Rows(0).Item("pcFirstName") & "</p>"
                        lblPC.Text += "<p>Last Name: " & dt4.Rows(0).Item("pcLastName") & "</p>"
                        lblPC.Text += "<p>Organization Name: " & dt4.Rows(0).Item("pcOrgName") & "</p>"
                        lblPC.Text += "<p>Email: " & dt4.Rows(0).Item("pcEmail") & "</p>"
                    End If
                    lblFIK.Text = "Total Amount provided by all Partner Countries and Organizations instrumental to this project or activity: " & dt4.Rows(0).Item("financialInKindAmount")
                    lblFIK.Text += "</p>&nbsp;<p>Description of In-Kind Support: <br />" & trtChr13ToBr(dt4.Rows(0).Item("financialInKindDesc"))
                End If
                dt4.Dispose()

                '''' Contact Info if submitter was PC.....
                If lblPC.Text = "" Then
                    'sSql = "SELECT firstName, lastName, email FROM  Users WHERE userID=" & strSaveUserid
                    cmd.CommandText = "SELECT firstName, lastName, email FROM  Users WHERE userID= @_ID"
                    cmd.Parameters.Remove(param)        ' remove old one which was the projectID
                    Dim param2 = New SqlParameter("@_ID", SqlDbType.VarChar)
                    param2.Value = strSaveUserid
                    cmd.Parameters.Add(param2)          ' new one is userID

                    Dim da5 As New SqlDataAdapter(cmd)
                    Dim ds5 As New DataSet

                    da5.Fill(ds5, "contactInfoPC")
                    Dim dt5 As DataTable = ds5.Tables(0)
                    If (dt5.Rows.Count > 0) Then
                        lblPC.Text = "<p>First Name: " & dt5.Rows(0).Item("firstName") & "</p>"
                        lblPC.Text += "<p>Last Name: " & dt5.Rows(0).Item("lastName") & "</p>"
                        lblPC.Text += "<p>Email: " & dt5.Rows(0).Item("email") & "</p>"
                    End If

                End If

                conn.Close()
                conn.Dispose()
            End If
        Else
            HttpContext.Current.Response.Redirect("/activities/actDetails.aspx")
        End If
    End Sub

    Private Sub getList()


    End Sub

#End Region

#Region "Private Functions"

    Protected Function zGetAppPath() As String
        Return Common.GetAppPath(Request)
    End Function

#End Region

End Class
