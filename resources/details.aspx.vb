Imports System.IO
Imports System.Text
Imports System.Web
Imports System.Data
Imports System.Data.SqlClient
Partial Class resources_details
    Inherits System.Web.UI.Page
    Public Shared metaImage As String = ""
    Public Shared metaTitle As String = ""
    Public Shared newTitle As String = ""
    Public Shared sectDescStr As String = ""

    Protected WithEvents ResourceDetailsForm As System.Web.UI.HtmlControls.HtmlForm
    Private designerPlaceholderDeclaration As System.Object
    Protected WithEvents LitResourceName As Literal
    Protected WithEvents LitResourceFeatureImage As Literal
    Protected WithEvents LitLastBreadcrumb As Literal
    Protected WithEvents ph1 As System.Web.UI.WebControls.PlaceHolder
    'Protected WithEvents phResources As System.Web.UI.WebControls.PlaceHolder
    'Protected WithEvents phRelatedEvents As System.Web.UI.WebControls.PlaceHolder
    Private ResourceId As String
    Private Sub Page_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load

        ResourceId = Server.HtmlEncode(Request.QueryString("resourceid"))


        If Not IsNumeric(ResourceId) Then
            ResourceId = 957
            ResourceId = Server.HtmlEncode(Request.QueryString("r"))
            If Not IsNumeric(ResourceId) Then
                ResourceId = 957
            End If
        End If
        'hui filter the query string

        Dim resourceObj As clsResourceVO

        resourceObj = clsResourceDAO.GetResourceByResourceId(ResourceId)

        If IsNothing(resourceObj) Then
            Response.Redirect("/resources/index.aspx")
        End If
        Dim enddate As String = ""


        If Not IsPostBack Then


            Dim sidebar As Literal

            Dim myLabel As Literal
            myLabel = New Literal


            'get country desc 
            Dim countryName As String
            'countryName = clsLookup.GetPartnerCountryNameByPcId(ResourceObj.getCountry)
            countryName = clsLookup.GetCountryNameByCId(resourceObj.getCountry)

            Dim yearstr As String = ""
            yearstr = Year(resourceObj.getResourceFileDate).ToString

            'get sector desc 
            '  Dim sectDescStr As String = ""
            Dim firstsector As String = ""
            Dim firstsectorid As Integer = 0
            Dim sectors As DataTable
            sectors = clsResourceDAO.getResourceSectorsByResourceId(ResourceId)
            Dim x
            For x = 0 To sectors.Rows.Count - 1
                Dim desc As String
                desc = sectors.Rows(x)("Sector")

                If desc = "MSW" Then
                    desc = "Municipal Solid Waste"
                End If

                If x = 0 Then
                    sectDescStr = desc
                    firstsector = desc
                    firstsectorid = sectors.Rows(x)("Sectorid")
                Else
                    sectDescStr = sectDescStr & ", " & desc
                End If
            Next
            myLabel = New Literal
            myLabel.Text = "<tr> <th Class='text-right'>Sector:</th><td>" & sectDescStr & "</td></tr>"
            phresourceDetails.Controls.Add(myLabel)



            myLabel = New Literal
            myLabel.Text = "<tr> <th Class='text-right'>Year:</th><td>" & yearstr & "</td></tr>" & Chr(10)
            phresourceDetails.Controls.Add(myLabel)

            Dim language As DataTable
            Dim data = New clsResourceDAO()
            language = data.getResourcesLanguageByResourceID(ResourceId)
            Dim langstr As String = ""
            If Not language Is Nothing Then
                For x = 0 To language.Rows.Count - 1
                    langstr += language.Rows(x)("language") & ", "
                Next

                langstr = Left(langstr, Len(langstr) - 2)
            End If
            myLabel = New Literal
            myLabel.Text = "<tr> <th Class='text-right'>Language:</th><td>" & langstr & "</td></tr>" & Chr(10)
            phresourceDetails.Controls.Add(myLabel)


            sidebar = New Literal
            sidebar.Text = resourceObj.getSideBar


            rightSidebar.Controls.Add(sidebar)


            '// feature image
            Dim thisThumb As New Literal
            thisThumb.Text = "<a href='" & resourceObj.getResourceLink & "'><img src='" & resourceObj.resourceImage & "' style='width:100%;' /></a>"


            '// document preview
            Dim resourceFileFrame As HtmlControl = CType(Me.FindControl("resourceFileFrame"), HtmlControl)
            Dim MsgText As String = ""
            Dim fileUrl As String = ""
            getImagebyResourceID(ResourceId, resourceObj.resourceImage, resourceObj.AltImg)
            litResourceOptionNumber.Text += "feature resource line 116"
            Try
                Dim curFile As String = Server.MapPath(resourceObj.getResourceLink)
                Dim curfileAlt As String = resourceObj.getResourceLink



                If System.IO.File.Exists(curFile) = True Then
                    'File is present on the server
                    'File is an image
                    If Right(curFile, 3) = "gif" Or Right(curFile, 3) = "jpg" Then
                        litResourceOptionNumber.Text += "<p class='small gray'>Document notes:  Image</p>"
                        resourceFileFrame.Attributes("src") = curfileAlt
                        LitResourceFeatureImage.Visible = True
                        litResourceOptionNumber.Text += "<p class='small gray'>line 130</p>"
                        LitResourceLink.Text = "<p><a title='View or download the image' class ='btn btn-dark btn-sm' href='" & resourceObj.getResourceLink & "'>View</a>" & "</p>"


                        'File is a PDF
                    ElseIf Right(curFile, 3) = "pdf" Then
                        litResourceOptionNumber.Text += "<p class='small gray'>Document notes:  PDF</p>"
                        LitResourceLink.Text = "<p><a title='View or download the resource' class ='btn btn-dark btn-sm' href='" & resourceObj.getResourceLink & "'>View</a>" & "</p>"

                        'File is a Microsoft document
                    ElseIf Right(curFile, 4) = "xlsx" Or Right(curFile, 4) = ".xls" Or
                        Right(curFile, 4) = "docx" Or Right(curFile, 4) = ".doc" Or
                        Right(curFile, 4) = "pptx" Or Right(curFile, 4) = ".ppt" Then
                        litResourceOptionNumber.Text += "<p class='small gray'>Document notes:  Microsoft</p>"
                        LitResourceLink.Text = "<p><a title='View or download the resource' target='blank' class ='btn btn-dark btn-sm' href='" & resourceObj.getResourceLink & "'>View</a>" & "</p>"
                    ElseIf Right(curfileAlt, 3) = "wmv" Then

                        litResourceOptionNumber.Text += "<p class='small gray'>Document notes:  WMV</p>"
                        LitResourceLink.Text = "<p><a title='View or download the video' target='blank' class ='btn btn-dark btn-sm' href='" & resourceObj.getResourceLink & "'>Download</a>" & "</p>"
                        myLabel = New Literal
                        myLabel.Text = "<p>This file type (.wmv) is not supported in this browser. Click above to download the file.</p>"
                        phresourceDescription.Controls.Add(myLabel)
                        'File is something else
                    ElseIf Right(curfileAlt, 3) = "mp4" Then
                        'File is MP4 video
                        litResourceOptionNumber.Text += "<p class='small gray'>Document notes: MP4</p>"
                        myLabel = New Literal
                        myLabel.Text = " <video width='100%' controls>"
                        myLabel.Text += "  <source src='" & resourceObj.getResourceLink & "' type='video/mp4'>"
                        myLabel.Text += "  <source src='" & resourceObj.getResourceLink & "' type='video/ogg'>"
                        myLabel.Text += "  <source src='" & resourceObj.getResourceLink & "' type='video/wmv'>"
                        myLabel.Text += "  Your browser does not support the video player. Please click the link below to download the recording."
                        myLabel.Text += "  </video>"
                        videoPlaceholder.Controls.Add(myLabel)
                        videoPlaceholder.Visible = True
                        videoWrp.Attributes("class") = "videoWrapper"
                        LitResourceLink.Text = "<p><a title='Visit the link' class ='btn btn-dark btn-sm' href='" & resourceObj.getResourceLink & "'>View Full Size</a>" & "</p>"
                        LitResourceFeatureImage.Visible = False

                    ElseIf Right(curfileAlt, 3) = "MOV" Then
                        'File is MOV video
                        litResourceOptionNumber.Text += "<p class='small gray'>Document notes: MP4</p>"
                        myLabel = New Literal
                        myLabel.Text = " <video width='100%' controls>"
                        myLabel.Text += "  <source src='" & resourceObj.getResourceLink & "'  type='video/mov'>"
                        myLabel.Text += "  <source src='" & resourceObj.getResourceLink & "' type='video/ogg'>"
                        myLabel.Text += "  <source src='" & resourceObj.getResourceLink & "' type='video/wmv'>"
                        myLabel.Text += "  Your browser does not support the video player. Please click the link below to download the recording."
                        myLabel.Text += "  </video>"
                        videoPlaceholder.Controls.Add(myLabel)
                        videoPlaceholder.Visible = True
                        videoWrp.Attributes("class") = "videoWrapper"
                        LitResourceLink.Text = "<p><a title='Visit the link' class ='btn btn-dark btn-sm' href='" & resourceObj.getResourceLink & "'>View Full Size</a>" & "</p>"
                        LitResourceFeatureImage.Visible = False
                    ElseIf Right(curfileAlt, 4) = "aspx" Or Right(curfileAlt, 4) = "html" Or Right(curfileAlt, 4) = "HTML" Then
                        litResourceOptionNumber.Text += "<p class='small gray'>Document notes:  Other</p>"
                        LitResourceLink.Text = "<p><a title='View or download the resource' class ='btn btn-dark btn-sm' target='blank' href='" & resourceObj.getResourceLink & "'>View</a>" & "</p>"

                    Else
                        litResourceOptionNumber.Text += "<p class='small gray'>Document notes:  Other</p>"
                        LitResourceLink.Text = "<p><a title='View or download the resource' class ='btn btn-dark btn-sm' href='" & resourceObj.getResourceLink & "'>Download</a>" & "</p>"

                    End If
                ElseIf System.IO.File.Exists(curFileAlt) = True Then
                    'check if the file link is a full file path
                    If Right(curfileAlt, 3) = "gif" Or Right(curFile, 3) = "jpg" Then
                        litResourceOptionNumber.Text += "<p class='small gray'>Document notes:  Image</p>"
                        resourceFileFrame.Attributes("src") = curfileAlt
                        LitResourceFeatureImage.Visible = True
                        litResourceOptionNumber.Text += "<p class='small gray'>line 199</p>"
                        LitResourceLink.Text = "<p><a title='View or download the image' class ='btn btn-dark btn-sm' href='" & resourceObj.getResourceLink & "'>View</a>" & "</p>"


                        'File is a PDF
                    ElseIf Right(curfileAlt, 3) = "pdf" Then
                        litResourceOptionNumber.Text += "<p class='small gray'>Document notes:  PDF</p>"

                        LitResourceLink.Text = "<p><a title='View or download the resource' class ='btn btn-dark btn-sm' href='" & resourceObj.getResourceLink & "'>View</a>" & "</p>"


                        'File is a Microsoft document
                    ElseIf Right(curfileAlt, 4) = "xlsx" Or Right(curfileAlt, 4) = ".xls" Or
                        Right(curfileAlt, 4) = "docx" Or Right(curfileAlt, 4) = ".doc" Or
                        Right(curfileAlt, 4) = "pptx" Or Right(curfileAlt, 4) = ".ppt" Then
                        litResourceOptionNumber.Text += "<p class='small gray'>Document notes:  Microsoft</p>"

                        LitResourceLink.Text = "<p><a title='View or download the resource' target='blank' class ='btn btn-dark btn-sm' href='" & resourceObj.getResourceLink & "'>View</a>" & "</p>"

                    ElseIf Right(curfileAlt, 3) = "wmv" Then

                        litResourceOptionNumber.Text += "<p class='small gray'>Document notes:  WMV</p>"
                        LitResourceLink.Text = "<p><a title='View or download the video' target='blank' class ='btn btn-dark btn-sm' href='" & resourceObj.getResourceLink & "'>Download</a>" & "</p>"
                        myLabel = New Literal
                        myLabel.Text = "<p>This file type (.wmv) is not supported in this browser. Click above to download the file.</p>"
                        phresourceDescription.Controls.Add(myLabel)
                        'File is something else
                    ElseIf Right(curfileAlt, 3) = "mp4" Then
                        'File is youtube or vimeo
                        litResourceOptionNumber.Text += "<p class='small gray'>Document notes: MP4</p>"
                        myLabel = New Literal
                        myLabel.Text = " <video width='100%' controls>"
                        myLabel.Text += "  <source src='" & resourceObj.getResourceLink & "' type='video/mp4'>"
                        myLabel.Text += "  <source src='" & resourceObj.getResourceLink & "' type='video/ogg'>"
                        myLabel.Text += "  <source src='" & resourceObj.getResourceLink & "' type='video/wmv'>"
                        myLabel.Text += "  Your browser does not support the video player. Please click the link below to download the recording."
                        myLabel.Text += "  </video>"
                        videoPlaceholder.Controls.Add(myLabel)
                        videoPlaceholder.Visible = True
                        videoWrp.Attributes("class") = "videoWrapper"
                        LitResourceLink.Text = "<p><a title='Visit the link' class ='btn btn-dark btn-sm' href='" & resourceObj.getResourceLink & "'>View Full Size</a>" & "</p>"
                        LitResourceFeatureImage.Visible = False

                    ElseIf Right(curfileAlt, 3) = "MOV" Then
                        'File is youtube or vimeo
                        litResourceOptionNumber.Text += "<p class='small gray'>Document notes: MP4</p>"
                        myLabel = New Literal
                        myLabel.Text = " <video width='100%' controls>"
                        myLabel.Text += "  <source src='" & resourceObj.getResourceLink & "'  type='video/mov'>"
                        myLabel.Text += "  <source src='" & resourceObj.getResourceLink & "' type='video/ogg'>"
                        myLabel.Text += "  <source src='" & resourceObj.getResourceLink & "' type='video/wmv'>"
                        myLabel.Text += "  Your browser does not support the video player. Please click the link below to download the recording."
                        myLabel.Text += "  </video>"
                        videoPlaceholder.Controls.Add(myLabel)
                        videoPlaceholder.Visible = True
                        videoWrp.Attributes("class") = "videoWrapper"
                        LitResourceLink.Text = "<p><a title='Visit the link' class ='btn btn-dark btn-sm' href='" & resourceObj.getResourceLink & "'>View Full Size</a>" & "</p>"
                        LitResourceFeatureImage.Visible = False

                    Else
                        litResourceOptionNumber.Text += "<p class='small gray'>Document notes:  Other</p>"
                        LitResourceLink.Text = "<p><a title='View or download the resource' class ='btn btn-dark btn-sm' href='" & resourceObj.getResourceLink & "'>Download</a>" & "</p>"

                    End If
                Else
                    'file is not present on the server
                    If resourceObj.getResourceLink.Contains("youtube") Or resourceObj.getResourceLink.Contains("vimeo") Then

                        'File is youtube or vimeo
                        litResourceOptionNumber.Text += "<p class='small gray'>Document notes:  Vimeo/YouTube</p>"
                        myLabel = New Literal
                        myLabel.Text = " <video width='100%' controls>"
                        myLabel.Text += "  <source src='" & resourceObj.getResourceLink & "' type='video/mp4'>"
                        myLabel.Text += "  <source src='" & resourceObj.getResourceLink & "' type='video/ogg'>"
                        myLabel.Text += "  <source src='" & resourceObj.getResourceLink & "' type='video/wmv'>"
                        myLabel.Text += "  Your browser does not support the video player. Please click the link below to download the recording."
                        myLabel.Text += "  </video>"
                        videoPlaceholder.Controls.Add(myLabel)
                        videoWrp.Attributes("class") = "videoWrapper"
                        LitResourceLink.Text = "<p><a title='Visit the link' class ='btn btn-dark btn-sm' href='" & resourceObj.getResourceLink & "'>View Full Size</a>" & "</p>"
                        LitResourceFeatureImage.Visible = False
                        videoPlaceholder.Visible = True
                    ElseIf Right(curfileAlt, 4) = "xlsx" Or Right(curfileAlt, 4) = ".gif" Or Right(curfileAlt, 4) = ".jpg" Or Right(curfileAlt, 4) = ".pdf" Or Right(curfileAlt, 4) = ".xls" Or
                        Right(curfileAlt, 4) = "docx" Or Right(curfileAlt, 4) = ".doc" Or
                        Right(curfileAlt, 4) = "pptx" Or Right(curfileAlt, 4) = ".ppt" Then
                        litResourceOptionNumber.Text += "<p class='small gray'>Page notes: source file is missing.</p>"
                        myLabel = New Literal
                        myLabel.Text = "<p>This file is not presently available for downloading. Please email <a href='mailto:secretariat@globalmethane.org?subject=Resource " & resourceObj.getResourceLink & "'>secretariat@globalmethane.org</a> for further assistance.</p>"
                        phresourceDescription.Controls.Add(myLabel)
                        LitResourceLink.Visible = False

                        'File is something else
                    Else

                        If ResourceId = "5170" Or ResourceId = "5215" Or ResourceId = "5225" Or ResourceId = "5176" Or ResourceId = "5175" Then


                            litResourceOptionNumber.Text += "<p class='small gray'>Document notes:  Other Website</p>"
                            LitResourceLink.Text = "<p style='display:none;'><a title='View the link' class ='btn btn-dark btn-sm' href='" & resourceObj.getResourceLink & "'>Visit</a>" & "</p>"

                        Else
                            litResourceOptionNumber.Text += "<p class='small gray'>Document notes:  Other Website</p>"
                            LitResourceLink.Text = "<p><a title='View the link' class ='btn btn-dark btn-sm' href='" & resourceObj.getResourceLink & "'>Visit</a>" & "</p>"


                        End If

                End If
                End If


            Catch

                If resourceObj.getResourceLink.Contains("youtube") Or resourceObj.getResourceLink.Contains("vimeo") Then

                    'File is youtube or vimeo
                    litResourceOptionNumber.Text += "<p class='small gray'>Document notes:  Vimeo/YouTube</p>"
                    myLabel = New Literal
                    myLabel.Text = " <video width='100%' controls>"
                    myLabel.Text += "  <source src='" & resourceObj.getResourceLink & "' type='video/mp4'>"
                    myLabel.Text += "  <source src='" & resourceObj.getResourceLink & "' type='video/ogg'>"
                    myLabel.Text += "  <source src='" & resourceObj.getResourceLink & "' type='video/wmv'>"
                    myLabel.Text += "  Your browser does not support the video player. Please click the link below to download the recording."
                    myLabel.Text += "  </video>"
                    videoPlaceholder.Controls.Add(myLabel)
                    videoPlaceholder.Visible = True
                    videoWrp.Attributes("class") = "videoWrapper"
                    LitResourceLink.Text = "<p><a title='Visit the link' class ='btn btn-dark btn-sm' href='" & resourceObj.getResourceLink & "'>View Full Size</a>" & "</p>"
                    LitResourceFeatureImage.Visible = False
                ElseIf Right(resourceObj.getResourceLink, 4) = "xlsx" Or Right(resourceObj.getResourceLink, 4) = ".gif" Or Right(resourceObj.getResourceLink, 4) = ".jpg" Or Right(resourceObj.getResourceLink, 4) = ".pdf" Or Right(resourceObj.getResourceLink, 4) = ".xls" Or
                        Right(resourceObj.getResourceLink, 4) = "docx" Or Right(resourceObj.getResourceLink, 4) = ".doc" Or
                        Right(resourceObj.getResourceLink, 4) = "pptx" Or Right(resourceObj.getResourceLink, 4) = ".ppt" Then
                    litResourceOptionNumber.Text += "<p class='small gray'>Page notes: source file is missing.</p>"
                    myLabel = New Literal
                    myLabel.Text = "<p>This file is not presently available for downloading. Please email <a href='mailto:secretariat@globalmethane.org?subject=Resource " & resourceObj.getResourceLink & "'>secretariat@globalmethane.org</a> for further assistance.</p>"
                    phresourceDescription.Controls.Add(myLabel)
                    LitResourceLink.Visible = False

                    'File is something else
                Else
                    '
                    litResourceOptionNumber.Text += "<p class='small gray'>Document notes:  Other Website</p>"


                    If ResourceId = "5170" Or ResourceId = "5215" Or ResourceId = "5225" Or ResourceId = "5176" Or ResourceId = "5175" Then


                        litResourceOptionNumber.Text += "<p class='small gray'>Document notes:  Other Website</p>"
                        LitResourceLink.Text = "<p style='display:none;'><a title='View the link' class ='btn btn-dark btn-sm' href='" & resourceObj.getResourceLink & "'>Visit</a>" & "</p>"

                    Else
                        litResourceOptionNumber.Text += "<p class='small gray'>Document notes:  Other Website</p>"
                        LitResourceLink.Text = "<p><a title='View the link' class ='btn btn-dark btn-sm' href='" & resourceObj.getResourceLink & "'>Visit</a>" & "</p>"


                    End If


                End If
                'MsgText += "<li>Error resulted in catch</li>"


                Try
                    If LitResourceFeatureImage.Visible = False Then
                        litResourceOptionNumber.Text += "<p class='small gray'>[Error code: 9]</p>"
                        myLabel = New Literal
                        myLabel.Text = "<iframe  width = '225' height='350' src='" & resourceObj.getResourceLink & "' frameborder='0' scrolling='no' allow='accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture' allowfullscreen></iframe>"
                        videoPlaceholder.Controls.Add(myLabel)
                        videoPlaceholder.Visible = True
                        LitResourceLink.Text = "<p><a title='View the resource' target='blank' class ='btn btn-dark btn-sm' href='" & resourceObj.getResourceLink & "'>View Full Screen</a>" & "</p>"
                        'getImagebyResourceID(ResourceId, resourceObj.resourceImage, resourceObj.AltImg)
                    End If
                Catch ex As Exception
                    litResourceOptionNumber.Text += "<p class='small gray'>[Error code: 10]</p>"
                    LitResourceFeatureImage.Visible = False
                    videoPlaceholder.Visible = False
                    LitResourceLink.Text = "<p><a title='View the resource' target='blank' class ='btn btn-dark btn-sm' href='" & resourceObj.getResourceLink & "'>View</a>" & "</p>"

                End Try

                MsgText += fileUrl


            End Try



            myLabel = New Literal
            'myLabel.Text = MsgText
            phresourceDescription.Controls.Add(myLabel)

            'LitResourceFeatureImage.Text = MsgText
            LitResourceName.Text = resourceObj.getName()
            'LitLastBreadcrumb.Text = resourceObj.getName()




            myLabel = New Literal
            'escape the double single quotation marks in the string
            Dim detailsStr As String = ""
            If Len(resourceObj.getResourceTopic.ToString) > 0 Then
                detailsStr += "<p>" & resourceObj.getResourceTopic & "</p>"
            End If
            myLabel = New Literal
            myLabel.Text = detailsStr
            phresourceDescription.Controls.Add(myLabel)

            myLabel = New Literal
            If Len(resourceObj.getResourcePages.ToString) > 0 Then
                myLabel.Text = "<tr><th class='text-right'>Pages:</th><td>" & resourceObj.getResourcePages & "</td></tr>" & Chr(10)
            End If
            phresourceDetails.Controls.Add(myLabel)

            myLabel = New Literal
            If Len(resourceObj.getResourceSize.ToString) > 0 Then
                myLabel.Text = "<tr><th class='text-right'>Size:</th><td>" & resourceObj.getResourceSize & "</td></tr>" & Chr(10)
            End If
            phresourceDetails.Controls.Add(myLabel)


            Try
                If Len(resourceObj.getResourceCategory.ToString) > 0 Then
                    myLabel = New Literal
                    myLabel.Text = "<tr><th class='text-right'>Type:</th><td>" & resourceObj.getResourceCategory.ToString & "</td></tr>" & Chr(10)
                    phresourceDetails.Controls.Add(myLabel)
                End If

            Catch

            End Try

            If ResourceId = "5170" Or ResourceId = "5215" Or ResourceId = "5225" Or ResourceId = "5176" Or ResourceId = "5175" Then

                If Len(resourceObj.getFileType.ToString) > 0 Then
                    myLabel = New Literal
                    myLabel.Text = "<tr style='display:none;'><th class='text-right'>Format:</th><td>" & resourceObj.getFileType & "</td></tr>" & Chr(10)
                    phresourceDetails.Controls.Add(myLabel)
                End If

            Else

                If Len(resourceObj.getFileType.ToString) > 0 Then
                    myLabel = New Literal
                    myLabel.Text = "<tr><th class='text-right'>Format:</th><td>" & resourceObj.getFileType & "</td></tr>" & Chr(10)
                    phresourceDetails.Controls.Add(myLabel)
                End If


            End If



            'myLabel = New Literal
            ''detailsStr = detailsStr.Replace("''", "'")
            ''myLabel.Text = detailsTitle & ResourceObj.getDetails() & endTitle
            'myLabel.Text = detailsStr
            '    phresourceDescription.Controls.Add(myLabel)





            getEventsbyResourceID(ResourceId, firstsector)

            getRelatedResources(ResourceId, "final")
            'getRelatedResources(resourceObj.getCountry, firstsectorid, ResourceId)
        Else
            Trace.Warn("ispostback")
        End If

        metaImage = resourceObj.resourceImage
        metaTitle = resourceObj.getName
        Dim TitleEnd As String = ""
        If Len(resourceObj.getName) > 40 Then
            TitleEnd = resourceObj.getName.Substring(0, 40) + "... | "
        Else
            TitleEnd = resourceObj.getName + " | "
        End If
        newTitle = sectDescStr + " - " + TitleEnd + "Global Methane Initiative"

        Dim dt As DataTable = New DataTable()
        dt.Columns.AddRange(New DataColumn(1) {New DataColumn("Property", GetType(String)), New DataColumn("Content", GetType(String))})
        dt.Rows.Add("og:title", metaTitle + " | Global Methane Initiative ")
        dt.Rows.Add("og:image", "https://www.globalmethane.org/assets/images/" + metaImage)
        dt.Rows.Add("og:site_name", "https://www.globalmethane.org/")
        dt.Rows.Add("og:description", "The Global Methane Initiative (GMI) is an international public-private partnership focused on reducing barriers to the recovery and use of methane as a clean energy source.")

        For Each row As DataRow In dt.Rows
            Dim htmlMeta As HtmlMeta = New HtmlMeta()
            htmlMeta.Attributes.Add("property", row("Property").ToString())
            htmlMeta.Content = row("Content").ToString()
            Me.Page.Header.Controls.Add(htmlMeta)
        Next

        Page.Title = newTitle

        If Not ResourceId = 957 Then

            InsertTrackingData(ResourceId, resourceObj.getName())

        End If

    End Sub

    Private Sub InsertTrackingData(ByVal resourceId As String, ByVal resourceName As String)
        ' Decode HTML entities in resource name
        Dim decodedResourceName As String = HttpUtility.HtmlDecode(resourceName)

        Dim connString As String = Common.GetConnString()
        Using conn As New SqlConnection(connString)
            conn.Open()

            ' Prepare SQL Insert Command
            Dim insertSql As String = "INSERT INTO trackEventResource (trackType, lookupID, name, logMoment) VALUES (@trackType, @lookupID, @name, @logMoment)"
            Using cmd As New SqlCommand(insertSql, conn)
                cmd.Parameters.AddWithValue("@trackType", "resource")
                cmd.Parameters.AddWithValue("@lookupID", resourceId)
                cmd.Parameters.AddWithValue("@name", decodedResourceName)

                ' Set current datetime in Eastern Time Zone
                Dim easternZone As TimeZoneInfo = TimeZoneInfo.FindSystemTimeZoneById("Eastern Standard Time")
                Dim easternTime As DateTime = TimeZoneInfo.ConvertTimeFromUtc(DateTime.UtcNow, easternZone)
                cmd.Parameters.AddWithValue("@logMoment", easternTime)

                ' Execute the insert command
                cmd.ExecuteNonQuery()
            End Using
        End Using
    End Sub

    Protected Sub getImagebyResourceID(ByRef resourceid As String, ByRef resourceImage As String, ByRef AltImg As String)


        Dim curImg As String = Server.MapPath(resourceImage)
        Dim curImgAlt As String = Server.MapPath("/assets/images/" & resourceImage)
        Dim curAltImg As String = ""
        Dim thumbURL As String = ""

        Dim resourceObj As clsResourceVO
        resourceObj = clsResourceDAO.GetResourceByResourceId(resourceid)

        'get sector desc 

        Dim firstsector As String = ""
        Dim firstsectorid As Integer = 0
        Dim sectors As DataTable
        sectors = clsResourceDAO.getResourceSectorsByResourceId(resourceid)
        Dim x
        For x = 0 To sectors.Rows.Count - 1
            Dim desc As String
            desc = sectors.Rows(x)("Sector")

            If desc = "MSW" Then
                desc = "Municipal Solid Waste"
            End If

            If x = 0 Then

                firstsector = desc
                firstsectorid = sectors.Rows(x)("Sectorid")
                Exit For
            End If

        Next



        Try
            curAltImg = Server.MapPath("/assets/images/doc_thumbs/jpeg/" & AltImg)
        Catch
            curAltImg = Server.MapPath("/assets/images/doc_thumbs/jpeg/test.png")
        End Try
        If System.IO.File.Exists(curImg) = True Then
            thumbURL = "<a href='" & resourceObj.getResourceLink().ToString & "'><img src=""" + resourceImage + """ style='max-width:255px' alt='" + firstsector + "' title='Featured Image for " + resourceObj.getName + "'  /></a>"
            videoPlaceholder.Visible = False
        ElseIf System.IO.File.Exists(curImgAlt) = True Then
            thumbURL = "<a href='" & resourceObj.getResourceLink().ToString & "'><img src=""/assets/images/" + resourceImage + """ style='max-width:255px' alt='" + firstsector + "' title='Featured Image for " + resourceObj.getName + "'/></a>"
            videoPlaceholder.Visible = False
        ElseIf System.IO.File.Exists(curAltImg) = True Then
            thumbURL = "<a href='" & resourceObj.getResourceLink().ToString & "'><img src=""/assets/images/doc_thumbs/jpeg/" + AltImg + """ style='max-width:255px'  alt='" + firstsector + "' title='Featured Image for " + resourceObj.getName + "'/></a>"
            videoPlaceholder.Visible = False
        Else
            Dim r As New Random()
            Dim n As Integer = r.Next(2)

            thumbURL = "<a href='" & resourceObj.getResourceLink().ToString & "'><img src=""/assets/images/Resource_feature_" + getSectorEventURL(firstsector) + n.ToString + ".JPG"" style='max-width:255px' alt='" + firstsector + "' title='Featured Image for " + resourceObj.getName + "'  /></a>"
            videoPlaceholder.Visible = False
        End If

        If Len(thumbURL) > 5 Then
            litResourceOptionNumber.Text = "<p class='small gray'>Page option 11</p>"

            LitResourceFeatureImage.Visible = True
            litResourceOptionNumber.Text += "<p class='small gray'>line 494</p>"
            LitResourceLink.Visible = True
            LitResourceLink.Text = "<a title='View or download the resource' class ='btn btn-dark btn-sm' href='" & resourceObj.getResourceLink().ToString & "'>View</a>"
            LitResourceFeatureImage.Text = thumbURL

        Else
            LitResourceFeatureImage.Visible = False
        End If

    End Sub

    Protected Sub getEventsbyResourceID(ByRef Resourceid As String, ByRef firstsector As String)


        Dim myLabel
        Dim data As New clsResourceDAO()
        Dim eventsDT As DataTable = data.getEventDataByResourceId(Resourceid)
        If eventsDT Is Nothing Or eventsDT.Rows.Count < 1 Then
            phEventList.Visible = False

        Else
            Debug.WriteLine(eventsDT.Rows.Count & " row count")
            myLabel = New Literal
            myLabel.text = "<h3>Related Events</h3>"
            myLabel.text += "<p>Read more about events where this resource was presented or discussed.</p>"
            phEventList.Controls.Add(myLabel)

            Dim phEventString As String = ""
            phEventString = ShowEventListforResource(eventsDT)
            Dim hasEvent = False
            Dim eventId As String
            Dim startDateValue As String
            Dim endDateValue As String
            Dim nameValue As String

            myLabel = New Literal
            myLabel.Text = phEventString
            phEventList.Controls.Add(myLabel)



        End If


    End Sub


    Protected Sub getRelatedResources(ByRef Resourceid As String, ByRef status As String)


        Dim myLabel
        Dim data As New clsResourceDAO()
        Dim resourceDT As DataTable = data.getParentResources(Resourceid, status)
        If resourceDT Is Nothing Or resourceDT.Rows.Count < 1 Then
            phRelatedResources.Visible = False

        Else
            Debug.WriteLine(resourceDT.Rows.Count & " row count")
            myLabel = New Literal
            myLabel.text = "<h3>Related Resources</h3>"
            phRelatedResources.Controls.Add(myLabel)

            Dim phResString As String = ""
            phResString = ShowResourceListforResource(resourceDT)


            myLabel = New Literal
            myLabel.Text = phResString
            phRelatedResources.Controls.Add(myLabel)



        End If


    End Sub
    Friend Function ShowEventListforResource(dt As DataTable) As String


        Dim eventId As String
        Dim startDateValue As String
        Dim endDateValue As String
        Dim nameValue As String
        Dim phString As String = ""
        phString += "<table id ='recentevents' class='table hover'><thead>"
        phString += "   <tr><th>&nbsp;</th><th>Event</th><th>Date</th><th>Sector</th></tr>"
        phString += "</thead>"

        Dim sectorValue As String
        Dim detailsValue As String

        Dim endTitle As String


        endTitle = "</tr>"

        Dim x

        For x = 0 To dt.Rows.Count - 1

            Dim startdate = dt.Rows(x)("startDate")
            Dim locationString = dt.Rows(x)("city")


            eventId = dt.Rows(x)("eventId")
            nameValue = dt.Rows(x)("name")
            Dim namevaltext As String = ""
            namevaltext = "<a href=""/events/details.aspx?eventid=" & eventId & """ alt=""Event details"">" & nameValue & "</a>"
            If Len(dt.Rows(x)("state").ToString) > 0 Then
                locationString += ", " & dt.Rows(x)("state")
            End If
            If clsLookup.GetCountryNameByCId(dt.Rows(x)("country")) = "N/A" Then

            Else
                locationString += ", " & clsLookup.GetCountryNameByCId(dt.Rows(x)("country")) & "" & Chr(10)
            End If


            startDateValue = Common.getDateFormatDisplay(dt.Rows(x)("startDate"))
            endDateValue = Common.getDateFormatDisplay(dt.Rows(x)("endDate"))
            'detailsValue = "<p>" & replaceHTMLTags(Left(dt.Rows(x)("details"), 200) & "...") & "</p>" & Chr(10)
            detailsValue = "<p>" & Left(replaceHTMLTags(dt.Rows(x)("details")), 200) & "...</p>" & Chr(10)

            'get sector desc 
            Dim sectDescStr
            Dim firstsector As String = ""
            Dim sectors As DataTable
            sectors = clsEventDAO.getEventSectorsByEventId(eventId)
            Dim y
            For y = 0 To sectors.Rows.Count - 1
                Dim desc As String
                desc = sectors.Rows(y)("sectorDesc")
                If y = 0 Then
                    sectDescStr = desc
                    firstsector = desc
                Else
                    sectDescStr += ", " & desc
                End If
            Next
            sectorValue = sectDescStr



            '// feature image
            Dim fileUrl As String = ""


            Try
                Dim curFile As String = Server.MapPath(dt.Rows(x)("photo_url").ToString)
                Dim curfileAlt As String = Server.MapPath("/assets/images/" & dt.Rows(x)("photo_url"))
                If System.IO.File.Exists(curFile) = True Then
                    fileUrl += "<a href=""/events/details.aspx?eventid=" & eventId & """ alt=""Event details""><img src=""" + dt.Rows(x)("photo_url") + """  style='width:100px;' alt='" + firstsector + "' title='Featured Image for " + dt.Rows(x)("name").ToString + "'/>" & Chr(10)

                ElseIf System.IO.File.Exists(curfileAlt) = True Then
                    fileUrl += "<a href=""/events/details.aspx?eventid=" & eventId & """ alt=""Event details""><img src=""/assets/images/" + dt.Rows(x)("photo_url") + """  style='width:100px;' alt='" + firstsector + "' title='Featured Image for " + dt.Rows(x)("name").ToString + "'/>" & Chr(10)

                Else
                    Dim r As New Random()
                    Dim n As Integer = r.Next(2)

                    fileUrl += "<a href=""/events/details.aspx?eventid=" & eventId & """ alt=""Event details""><img src=""/assets/images/event_feature_" + getSectorEventURL(firstsector) + n.ToString + ".JPG""  style='width:100px;' alt='" + firstsector + "' title='Featured Image for " + dt.Rows(x)("name").ToString + "'/>" & Chr(10)

                End If
            Catch ex As System.Net.WebException
                fileUrl += "<a href=""/events/details.aspx?eventid=" & eventId & """ alt=""Event details""><img src=""" + dt.Rows(x)("photo_url") + """  style='width:100px;' alt='" + firstsector + "' title='Featured Image for " + dt.Rows(x)("name").ToString + "'/>" & Chr(10)
            End Try




            phString += "<tr><td>" & Chr(10)
            phString += fileUrl
            phString += "</a><td>" & Chr(10)
            phString += "" & Chr(10)


            phString += namevaltext & "</td>" & Chr(10)
            'phString += namevaltext & detailsValue & "</td>" & Chr(10)




            Dim datestring As String = ""
            Dim thisstartdate = dt.Rows(x)("startDate")
            Dim thisenddate = dt.Rows(x)("endDate")

            datestring = "" & Day(thisstartdate) 'Common.getDateFormatDisplay(eventObj.getStartDate())
            If Month(thisstartdate).ToString <> Month(thisenddate).ToString Then
                datestring += " " & Format(CDate(thisstartdate), "MMMM")
            End If
            If Day(thisenddate) <> Day(thisstartdate) Then
                datestring += "&ndash;" & Day(thisenddate)
            End If
            datestring += " " & Format(CDate(thisenddate), "MMMM yyyy")
            phString += "<td>" & datestring & "</td>" & Chr(10)
            phString += "<td>" & sectDescStr & "</td>" & Chr(10)
            phString += "</td>" & endTitle & Chr(10)



        Next

        If (dt.Rows.Count > 0) Then
            'CatchMsg += "; no rows"
        End If
        phString += "</table>"

        Return phString

    End Function


    Friend Function ShowResourceListforResource(dt As DataTable) As String



        Dim nameValue As String
        Dim phString As String = ""
        phString += "<table id ='relatedresources' class='table hover'><thead>"
        phString += "   <tr><th>&nbsp;</th><th>Name</th><th>Format</th><th>Tags</th></tr>"
        phString += "</thead>"

        Dim sectorValue As String


        Dim endTitle As String


        endTitle = "</tr>"

        Dim x

        For x = 0 To dt.Rows.Count - 1




            ResourceId = dt.Rows(x)("resourceid")
            nameValue = dt.Rows(x)("resourcename")
            Dim namevaltext As String = ""
            namevaltext = "<a href=""/resources/details.aspx?resourceid=" & ResourceId & """ alt=""Resource details"">" & nameValue & "</a>"


            '// feature image
            Dim fileUrl As String = ""

            'get sector desc 
            Dim sectDescStr As String = ""
            Dim firstsector As String = ""
            Dim firstsectorid As Integer = 0
            Dim sectors As DataTable
            sectors = clsResourceDAO.getResourceSectorsByResourceId(ResourceId)
            For i = 0 To sectors.Rows.Count - 1
                Dim desc As String
                desc = sectors.Rows(x)("Sector")

                If desc = "MSW" Then
                    desc = "Municipal Solid Waste"
                End If

                If i = 0 Then
                    sectDescStr = desc
                    firstsector = desc
                    firstsectorid = sectors.Rows(i)("Sectorid")
                Else
                    sectDescStr = sectDescStr & ", " & desc
                End If
            Next


            Try
                Dim curFile As String = Server.MapPath(dt.Rows(x)("resourceimage").ToString)
                Dim curfileAlt As String = Server.MapPath("/assets/images/" & dt.Rows(x)("resourceimage"))
                If System.IO.File.Exists(curFile) = True Then
                    fileUrl += "<a href=""/resources/details.aspx?resourceid=" & ResourceId & """ alt=""Resource details""><img src=""" + dt.Rows(x)("resourceimage") + """  style='width:100px;' alt='" + firstsector + "' title='Featured Image for " + dt.Rows(x)("resourcename").ToString + "'/>" & Chr(10)

                ElseIf System.IO.File.Exists(curfileAlt) = True Then
                    fileUrl += "<a href=""/resources/details.aspx?resourceid=" & ResourceId & """ alt=""Resource details""><img src=""/assets/images/" + dt.Rows(x)("resourceimage") + """  style='width:100px;' alt='" + firstsector + "' title='Featured Image for " + dt.Rows(x)("resourcename").ToString + "'/>" & Chr(10)

                Else
                    Dim r As New Random()
                    Dim n As Integer = r.Next(2)

                    fileUrl += "<a href=""/resources/details.aspx?resourceid=" & ResourceId & """ alt=""Resource details""><img src=""/assets/images/event_feature_" + getSectorEventURL(firstsector) + n.ToString + ".JPG""  style='width:100px;' alt='" + firstsector + "' title='Featured Image for " + dt.Rows(x)("resourcename").ToString + "'/>" & Chr(10)

                End If
            Catch ex As System.Net.WebException
                fileUrl += "<a href=""/resources/details.aspx?resourceid=" & ResourceId & """ alt=""Resource details""><img src=""" + dt.Rows(x)("resourceimage") + """  style='width:100px;' alt='" + firstsector + "' title='Featured Image for " + dt.Rows(x)("resourcename").ToString + "'/>" & Chr(10)
            End Try




            phString += "<tr><td>" & Chr(10)
            phString += fileUrl
            phString += "</a><td>" & Chr(10)
            phString += "" & Chr(10)


            phString += namevaltext & "</td>" & Chr(10)


            phString += "<td>" & dt.Rows(x)("filetype").ToString & "</td>" & Chr(10)
            phString += "<td>" & dt.Rows(x)("topic").ToString & "</td>" & Chr(10)
            phString += endTitle & Chr(10)



        Next

        If (dt.Rows.Count > 0) Then
            'CatchMsg += "; no rows"
        End If
        phString += "</table>"

        Return phString

    End Function
End Class
