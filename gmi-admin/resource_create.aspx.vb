Imports System.Data
Imports System.Data.SqlClient
Imports System.IO
Imports System.Text

Public Class resource_create
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





    Private editResourceId As String
    Private mode As String


#End Region

    Private Sub Page_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load, Me.Load

        If Not IsPostBack Then
            FillFileType()
            FillCategories()
            FillSectors()

            FillCountries()
            FillTopics()
            FillLanguage()


            rblStatus.SelectedValue = "Draft"
            mode = IIf(IsNothing(Server.HtmlEncode(Request.QueryString("mode"))), String.Empty, Server.HtmlEncode(Request.QueryString("mode")))
            'Trace.Warn("not ispostback")
            If mode = "" Then
                mode = "n" 'new

                If Len(Server.HtmlEncode(Request.QueryString("pID"))) > 0 Then
                    mode = "p" 'parent
                End If

            End If
            If (mode.ToLower() = "n") Then
                ph2.Visible = False
                ph1.Visible = True

            Else
                ph2.Visible = True
                ph1.Visible = False

                editResourceId = Server.HtmlEncode(Request.QueryString("resourceId"))

                If (IsNothing(editResourceId) = False) And IsNumeric(editResourceId) Then
                    FillPageForEdit()
                    FillRelatedResources(editResourceId)
                Else
                    If Len(Server.HtmlEncode(Request.QueryString("pID"))) > 0 Then
                        Dim resourceparentid As String = Server.HtmlEncode(Request.QueryString("piD"))
                        pnlParentResource.Visible = True
                        ph2.Visible = False
                        ph1.Visible = True
                        FillPageForParent(resourceparentid)
                    End If

                End If

            End If

        Else
            Trace.Warn("ispostback")
        End If
    End Sub


    Protected Sub FillPageForEdit()


        Dim resourceObj As clsResourceVO
        resourceObj = clsResourceDAO.GetResourceByResourceId(editResourceId)

        If IsNothing(resourceObj) Then
            rblStatus.SelectedValue = "Draft"

            Exit Sub
        Else
            If LCase(resourceObj.getStatus) = "draft" Then
                rblStatus.SelectedValue = "Draft"
            ElseIf LCase(resourceObj.getStatus) = "final" Then
                rblStatus.SelectedValue = "Final"
            ElseIf LCase(resourceObj.getStatus) = "revised" Then
                rblStatus.SelectedValue = "Revised"
            End If
        End If


        Dim resourceFileFrame As HtmlControl = CType(Me.FindControl("resourceFileFrame"), HtmlControl)

        Dim fileUrl As String = ""
        Try
            Dim curFile As String = Server.MapPath(resourceObj.getResourceLink)
            Dim curfileAlt As String = resourceObj.getResourceLink


            If System.IO.File.Exists(curFile) = True Then
                If resourceObj.getFileTypeID = 3 Or resourceObj.getFileTypeID = 4 Or resourceObj.getFileTypeID = 2 Then ' Word, PPT, or Excel
                    resourceFileFrame.Attributes("name") = "FileType: " & resourceObj.getFileTypeID & "; Name: " & resourceObj.getName & "; Info: " & resourceObj.getResourceLink

                    curFile = "https://docs.google.com/viewer?url={" & curfileAlt & "}&embedded=true"
                ElseIf resourceObj.getFileTypeID = 9 Then 'ZIP
                    resourceFileFrame.Attributes("visible") = False
                Else 'All Others
                    resourceFileFrame.Attributes("name") = "FileType: " & resourceObj.getFileTypeID & "; Name: " & resourceObj.getName & "; Info: " & resourceObj.getResourceLink
                    resourceFileFrame.Attributes("src") = curfileAlt
                    resourceFileLink.Attributes("src") = curfileAlt
                    resourceFileLink.Attributes("name") = resourceObj.getName
                    resourceFileLink.Attributes("visible") = True
                End If

            Else
                resourceFileFrame.Attributes("src") = curfileAlt
                resourceFileLink.Attributes("src") = curfileAlt
                resourceFileLink.Attributes("name") = resourceObj.getName
                resourceFileLink.Attributes("visible") = True
            End If

        Catch

            resourceFileFrame.Attributes("visible") = False


        End Try


        'get sector names 
        Dim sectors As DataTable
        sectors = clsResourceDAO.getResourceSectorsByResourceId(editResourceId)

        'set selected values
        For m = 0 To libSectors.Items.Count - 1
            For x = 0 To sectors.Rows.Count - 1
                Dim desc As String
                desc = sectors.Rows(x)("sectorId")
                If (desc = libSectors.Items(m).Value()) Then
                    libSectors.Items(m).Selected = True
                    FillEvents()
                    Exit For
                End If
            Next
        Next

        'get country names 
        Dim countries As DataTable
        countries = clsResourceDAO.getCountriesByResourceId(editResourceId)

        'set selected values
        For m = 0 To libPartnerCountries.Items.Count - 1
            For x = 0 To countries.Rows.Count - 1
                Dim desc As String
                desc = countries.Rows(x)("countryid")
                If (desc = libPartnerCountries.Items(m).Value()) Then
                    libPartnerCountries.Items(m).Selected = True
                    Exit For
                End If
            Next
        Next

        'get topics
        Dim topics As DataTable
        topics = clsResourceDAO.getTopicsByResourceId(editResourceId)

        'set selected values
        For m = 0 To libTopics.Items.Count - 1
            For x = 0 To topics.Rows.Count - 1
                Dim desc As String
                desc = topics.Rows(x)("topicid")
                If (desc = libTopics.Items(m).Value()) Then
                    libTopics.Items(m).Selected = True
                    Exit For
                End If
            Next
        Next

        'get language picklist 
        Dim languages As DataTable
        languages = clsResourceDAO.getLanguagesByResourceId(editResourceId)

        'set selected values
        For m = 0 To libLanguage.Items.Count - 1
            For x = 0 To languages.Rows.Count - 1
                Dim desc As String
                desc = languages.Rows(x)("languageid")
                If (desc = libLanguage.Items(m).Value()) Then
                    libLanguage.Items(m).Selected = True
                    Exit For
                End If
            Next
        Next

        'get event picklist 
        Dim events As DataTable
        events = clsResourceDAO.getEventsByResourceId(editResourceId)

        'set selected values
        For m = 0 To libEvents.Items.Count - 1
            For x = 0 To events.Rows.Count - 1
                Dim desc As String
                desc = events.Rows(x)("eventid")
                If (desc = libEvents.Items(m).Value()) Then
                    libEvents.Items(m).Selected = True
                    Exit For
                End If
            Next
        Next


        'set selected value for category
        For m = 0 To libDocumentType.Items.Count - 1

            Dim desc As String
            desc = resourceObj.getResourceCategoryID
            If (desc = libDocumentType.Items(m).Value()) Then
                libDocumentType.Items(m).Selected = True
                Exit For
            End If

        Next


        'set selected value for filetype
        For m = 0 To libFileType.Items.Count - 1

            Dim desc As String
            desc = resourceObj.getFileTypeID
            If (desc = libFileType.Items(m).Value()) Then
                libFileType.Items(m).Selected = True
                Exit For
            End If

        Next

        'fill other fields
        name.Text = resourceObj.getName
        shortname.Text = resourceObj.getShortName
        author.Text = resourceObj.getAuthor
        grouping.Text = resourceObj.getGrouping
        resourcePages.Text = resourceObj.getResourcePages
        txtResourceSize.Text = resourceObj.getResourceSize
        txtResourceLink.Text = resourceObj.getResourceLink
        txtResourceImage.Text = resourceObj.getResourceImage   '1

        If Len(resourceObj.getResourceLink) > 0 And Len(resourceObj.getResourceImage) > 0 Then
            pnlResourceInfo.Visible = True
            plnResourceUpload.Visible = False
            btnDeleteFile.Visible = True
            btnUpdateInfo.Visible = True
        Else
            plnResourceUpload.Visible = True
            btnDeleteFile.Visible = False
            btnUpdateInfo.Visible = False
        End If
        resourceFiledate.Text = Common.getDateFormatDisplayMMDDYYYY(resourceObj.getResourceFileDate)




        If Len(resourceObj.getResourceTopic) = 0 Then
            txtresourceTopic.Text = resourceObj.getName
        Else
            txtresourceTopic.Text = resourceObj.getResourceTopic
        End If

        'If Len(resourceObj.getResourceLink) > 1 Then

        'Else

        'End If


    End Sub

    Protected Sub FillPageForParent(ByVal pid As String)

        Dim resourceObj As clsResourceVO
        resourceObj = clsResourceDAO.GetResourceByResourceId(pid)

        If IsNothing(resourceObj) Then

            Exit Sub

        Else
            txtresourceParentName.Text = resourceObj.getName
            txtResourceParentID.Value = pid
            txtresourceParentName.Visible = True
            pnlParentResource.Visible = True

        End If


    End Sub


    Protected Sub FillSectors()

        Dim dv As DataView = Nothing

        dv = clsLookup.GetSectorsForEventsByLookupTable

        'Trace.Warn(dv.Count)

        libSectors.DataTextField = "sector"
        libSectors.DataValueField = "sectorid"
        libSectors.DataSource = dv
        libSectors.DataBind()

    End Sub

    Protected Sub FillCategories()

        Dim dv As DataView = Nothing

        dv = clsLookup.GetResourceCategoriesByLookupTable

        'Trace.Warn(dv.Count)

        libDocumentType.DataTextField = "resourcecategory"
        libDocumentType.DataValueField = "resourcecategoryid"
        libDocumentType.DataSource = dv
        libDocumentType.DataBind()

    End Sub

    Protected Sub FillFileType()

        Dim dv As DataView = Nothing

        dv = clsLookup.GetFileTypeByLookupTable

        'Trace.Warn(dv.Count)

        libFileType.DataTextField = "fileType"
        libFileType.DataValueField = "filetypeID"
        libFileType.DataSource = dv
        libFileType.DataBind()

    End Sub

    Protected Sub FillLanguage()

        Dim dv As DataView = Nothing

        dv = clsLookup.GetLanguageByLookupTable

        'Trace.Warn(dv.Count)

        libLanguage.DataTextField = "resourcelanguage"
        libLanguage.DataValueField = "languageID"
        libLanguage.DataSource = dv
        libLanguage.DataBind()

    End Sub


    Protected Sub FillEvents()

        Dim dv As DataView = Nothing
        Dim sectorid As String


        sectorid = libSectors.SelectedItem.Value


        dv = clsLookup.GetEventbySectorForLookupTable(sectorid)

        'Trace.Warn(dv.Count)

        libEvents.DataTextField = "EventName"
        libEvents.DataValueField = "eventID"
        libEvents.DataSource = dv
        libEvents.DataBind()

    End Sub

    Protected Sub FillRelatedResources(ByVal resourceid As String)

        Dim dt As DataTable = Nothing

        dt = clsResourceDAO.getChildResources(resourceid)
        If IsNothing(dt) Then
            gvRelatedResource.Visible = False
            Exit Sub

        Else
            gvRelatedResource.DataSource = dt
            gvRelatedResource.DataBind()
            gvRelatedResource.Visible = True

        End If



    End Sub

    Protected Sub FillCountries()

        Dim dv As DataView = Nothing

        'dv = clsLookup.GetPartnerCountriesWithPcId
        dv = clsLookup.GetCountriesForLookup


        'Trace.Warn(dv.Count)

        libPartnerCountries.DataTextField = "countryname"
        libPartnerCountries.DataValueField = "countryid"
        libPartnerCountries.DataSource = dv
        libPartnerCountries.DataBind()

    End Sub

    Protected Sub FillTopics()

        Dim dv As DataView

        dv = clsLookup.GetTopicsForLookup


        'Trace.Warn(dv.Count)

        libTopics.DataTextField = "topic"
        libTopics.DataValueField = "topicid"
        libTopics.DataSource = dv
        libTopics.DataBind()

    End Sub



#Region "CallBack Functions"



    Protected Sub UploadFile(sender As Object, e As EventArgs) Handles btnUpload.Click
        Dim folderPath As String = Server.MapPath("~/documents/")
        Dim imgFolderPath As String = Server.MapPath("~/images/doc_thumbs/jpeg/")
        Dim msgText As String = ""
        'Check whether Directory (Folder) exists.
        If Not Directory.Exists(folderPath) Then
            'If Directory (Folder) does not exists. Create it.
            Directory.CreateDirectory(folderPath)
        End If
        If Not Directory.Exists(imgFolderPath) Then
            'If Directory (Folder) does not exists. Create it.
            Directory.CreateDirectory(imgFolderPath)
        End If
        Dim fileok As Boolean = False
        If resourceLink.HasFile Then
            Dim ext As String

            ext = Path.GetExtension(resourceLink.FileName).ToLower()
            Dim allowedExtnsions As String() = {".wav", ".mp3", ".xlsx", ".xls", ".jpg", ".jpeg", ".gif", ".png", ".pdf", ".pptx", ".ppt", ".wmv", ".mpeg4", ".html", ".aspx", ".htm", ".cfm", ".docx", ".doc", ".zip"}
            For i As Integer = 0 To allowedExtnsions.Length - 1
                If ext = allowedExtnsions(i) Then
                    fileok = True
                    Exit For
                End If
            Next
            If fileok = True Then

                Dim fileUrl As String = ""
                Try
                    Dim curFile As String = Server.MapPath("/documents/" & resourceLink.FileName)

                    If System.IO.File.Exists(curFile) = True Then
                        msgText += "A file with this name already exists.<br>"
                        plnResourceUpload.Visible = False
                        txtResourceLink.Text = "/documents/" & resourceLink.FileName
                        resourceFiledate.Text = GetFileDate(curFile)
                        txtResourceSize.Text = GetFileSize(curFile)


                        If resourceImage.HasFile Then   '2
                            Dim Imgext As String

                            Imgext = Path.GetExtension(resourceImage.FileName).ToLower()
                            Dim allowedImgExtnsions As String() = {".jpg", ".jpeg", ".gif", ".png"}
                            For i As Integer = 0 To allowedImgExtnsions.Length - 1
                                If Imgext = allowedImgExtnsions(i) Then
                                    fileok = True
                                    Exit For

                                End If
                            Next
                            If fileok = True Then

                                Dim ImgFileUrl As String = ""
                                Try
                                    Dim curImgFile As String = Server.MapPath("/images/doc_thumbs/jpeg/" & resourceImage.FileName)

                                    If System.IO.File.Exists(curImgFile) = True Then
                                        msgText += "An image with this name already exists.<br>"
                                        'plnResourceUpload.Visible = False
                                        txtResourceImage.Text = "/images/doc_thumbs/jpeg/" & resourceImage.FileName  '3

                                        Exit Sub
                                    End If
                                Catch ex As Exception
                                    msgText += "Exception 3. " & ex.Message.ToString()
                                    pnlResourceDetails.Visible = True
                                End Try
                            End If
                        End If
                    Else
                        Try
                            'Save the File to the Directory (Folder).
                            resourceLink.SaveAs(folderPath & Path.GetFileName(resourceLink.FileName))

                            resourceFiledate.Text = GetFileDate(folderPath & Path.GetFileName(resourceLink.FileName))
                            txtResourceSize.Text = GetFileSize(folderPath & Path.GetFileName(resourceLink.FileName))

                            'Display the success message.
                            msgText += Path.GetFileName(resourceLink.FileName) + " has been uploaded.<br>"
                        Catch ex As Exception
                            msgText += "Exception 2. " & ex.Message.ToString()
                            pnlResourceDetails.Visible = True
                        End Try
                    End If

                Catch ex As Exception
                    msgText += "Exception 1. " & ex.Message.ToString()
                    pnlResourceDetails.Visible = True
                End Try






                txtResourceLink.Text = "/documents/" & resourceLink.FileName

                'selected index is based on alphabetical listing of file types, which is not the same as the fileTypeID
                '0 - not selected               0
                '1 - Audio                      14
                '2 - Excel                      2           
                '3 - Image                      13
                '4- PDF                         5
                '5 - PowerPoint                 4
                '6 - Video                      6
                '7 - Website                    12
                '8 - Word                       3
                '9 - Zip                        9
                If ext = ".wav" Or ext = ".mp3" Then
                    libFileType.SelectedIndex = 1
                ElseIf ext = ".xlsx" Or ext = ".xls" Then
                    libFileType.SelectedIndex = 2
                ElseIf ext = ".jpg" Or ext = ".jpeg" Or ext = ".gif" Or ext = ".png" Or ext = ".bmp" Then
                    libFileType.SelectedIndex = 3
                ElseIf ext = ".pdf" Then
                    libFileType.SelectedIndex = 4
                ElseIf ext = ".pptx" Or ext = ".ppt" Then
                    libFileType.SelectedIndex = 5
                ElseIf ext = ".wmv" Or ext = ".mpeg4" Or ext = ".mpg" Then
                    libFileType.SelectedIndex = 6
                ElseIf ext = ".html" Or ext = ".aspx" Or ext = ".htm" Or ext = ".cfm" Then
                    libFileType.SelectedIndex = 7
                ElseIf ext = ".docx" Or ext = ".doc" Then
                    libFileType.SelectedIndex = 8
                ElseIf ext = ".zip" Then
                    libFileType.SelectedIndex = 9

                End If

            Else
                msgText += "Cannot accept files of this type.<br>"

            End If

        Else
            msgText += "Please select a file and try again.<br>"
        End If
        'repeat the same basic steps for the file image
        fileok = False
        If resourceImage.HasFile Then   '2
            Dim ext As String

            ext = Path.GetExtension(resourceImage.FileName).ToLower()
            Dim allowedExtnsions As String() = {".jpg", ".jpeg", ".gif", ".png"}
            For i As Integer = 0 To allowedExtnsions.Length - 1
                If ext = allowedExtnsions(i) Then
                    fileok = True
                    Exit For

                End If
            Next
            If fileok = True Then

                Dim fileUrl As String = ""
                Try
                    Dim curFile As String = Server.MapPath("/images/doc_thumbs/jpeg/" & resourceImage.FileName)

                    If System.IO.File.Exists(curFile) = True Then
                        msgText += "An image with this name already exists.<br>"
                        'plnResourceUpload.Visible = False
                        txtResourceImage.Text = "/images/doc_thumbs/jpeg/" & resourceImage.FileName  '3

                        Exit Sub
                    End If

                Catch ex As Exception
                    msgText += "Exception 3. " & ex.Message.ToString()
                    pnlResourceDetails.Visible = True
                End Try
                Try
                    'Save the File to the Directory (Folder).
                    resourceImage.SaveAs(imgFolderPath & Path.GetFileName(resourceImage.FileName))

                    'Display the success message.
                    msgText += Path.GetFileName(resourceImage.FileName) + " has been uploaded.<br>"
                Catch ex As Exception
                    msgText += "Exception 4. " & ex.Message.ToString()
                    pnlResourceDetails.Visible = True
                End Try





                txtResourceImage.Text = "/images/doc_thumbs/jpeg/" & resourceImage.FileName  '4





            Else
                msgText += "This file type is not allowed. Please upload a valid image file.<br>"

            End If

        Else
            msgText += "Please select an image and try again.<br>"
        End If
        lblMessage.Text = msgText

    End Sub

    Protected Sub UpdateInfo(sender As Object, e As EventArgs) Handles btnUpdateInfo.Click
        Dim folderPath As String = Server.MapPath("~/documents/")

        'Check whether Directory (Folder) exists.
        If Not Directory.Exists(folderPath) Then
            'If Directory (Folder) does not exists. Create it.
            Directory.CreateDirectory(folderPath)
        End If
        pnlResourceDetails.Visible = True
        Dim fileok As Boolean = False
        'If resourceLink.HasFile Then
        Dim ext As String

        'ext = Path.GetExtension(txtresourceLink.Text).ToLower()
        'Dim allowedExtnsions As String() = {".pdf", ".xlsx", ".docx", ".pptx", ".xls", ".doc", ".jpg", ".jpeg", ".gif", ".ppt", ".png"}
        'For i As Integer = 0 To allowedExtnsions.Length - 1
        '    If ext = allowedExtnsions(i) Then
        '        fileok = True
        '        Exit For
        '    End If
        'Next
        'If fileok = True Then

        Dim fileUrl As String = ""
        Try
            Dim curFile As String = Server.MapPath(txtResourceLink.Text)

            If System.IO.File.Exists(curFile) = True Then
                'lblMessage.Text = "A file with this name already exists."
                'plnResourceUpload.Visible = False
                'txtresourceLink.Text = "/documents/" & resourceLink.FileName
                resourceFiledate.Text = GetFileDate(curFile)
                txtResourceSize.Text = GetFileSize(curFile)
                'selected index is based on alphabetical listing of file types, which is not the same as the fileTypeID
                '0 - not selected               0
                '1 - Audio                      14
                '2 - Excel                      2           
                '3 - Image                      13
                '4- PDF                         5
                '5 - PowerPoint                 4
                '6 - Video                      6
                '7 - Website                    12
                '8 - Word                       3
                '9 - Zip                        9
                If ext = ".wav" Or ext = ".mp3" Then
                    libFileType.SelectedIndex = 1
                ElseIf ext = ".xlsx" Or ext = ".xls" Then
                    libFileType.SelectedIndex = 2
                ElseIf ext = ".jpg" Or ext = ".jpeg" Or ext = ".gif" Or ext = ".png" Or ext = ".bmp" Then
                    libFileType.SelectedIndex = 3
                ElseIf ext = ".pdf" Then
                    libFileType.SelectedIndex = 4
                ElseIf ext = ".pptx" Or ext = ".ppt" Then
                    libFileType.SelectedIndex = 5
                ElseIf ext = ".wmv" Or ext = ".mpeg4" Or ext = ".mpg" Then
                    libFileType.SelectedIndex = 6
                ElseIf ext = ".html" Or ext = ".aspx" Or ext = ".htm" Or ext = ".cfm" Then
                    libFileType.SelectedIndex = 7
                ElseIf ext = ".docx" Or ext = ".doc" Then
                    libFileType.SelectedIndex = 8
                ElseIf ext = ".zip" Then
                    libFileType.SelectedIndex = 9

                End If
                Exit Sub
            End If

        Catch ex As Exception
            lblMessage.Text = "Exception 1. " & ex.Message.ToString()
            'pnlResourceDetails.Visible = True
        End Try




    End Sub

    Protected Function GetFileSize(ByVal file As String)

        Dim filesize As Double = New System.IO.FileInfo(file).Length


        Dim kbSize As Double = filesize / 1024
        Dim mbSize As Double = 0
        Dim size As String
        If (kbSize) > 500 Then
            mbSize = filesize / 1048576
            size = Math.Round(mbSize, 1, MidpointRounding.AwayFromZero) & " MB"
        Else
            size = Math.Round(kbSize, 1, MidpointRounding.AwayFromZero) & " KB"
        End If
        Return size

    End Function

    Protected Function GetFileDate(ByVal file As String)
        Dim filedate As String = New System.IO.FileInfo(file).CreationTime

        Return filedate
    End Function

    Protected Sub SaveNewResource(ByVal s As Object, ByVal e As CommandEventArgs)
        Dim resourceObj As clsResourceVO
        resourceObj = New clsResourceVO
        resourceObj.setStatus(rblStatus.SelectedValue)
        resourceObj.setName(name.Text)
        resourceObj.setGrouping(grouping.Text)
        resourceObj.setShortName(shortname.Text)
        resourceObj.setAuthor(author.Text)
        If resourcePages.Text <> "" Then
            resourceObj.setResourcePages(resourcePages.Text)
        End If
        'If libPartnerCountries.SelectedValue <> "" Then
        '    resourceObj.setCountry(libPartnerCountries.SelectedValue)
        'End If
        'If libTopics.SelectedValue <> "" Then
        '    resourceObj.setTopic(libTopics.SelectedValue)
        'End If
        resourceObj.setResourceSize(txtResourceSize.Text)
        resourceObj.setResourceLink(txtResourceLink.Text)
        resourceObj.setResourceImage(txtResourceImage.Text)  '5
        If txtResourceParentID.Value <> "" Then
            resourceObj.setResourceParent(txtResourceParentID.Value)
        End If
        resourceObj.setFileTypeID(libFileType.SelectedValue)
        resourceObj.setResourceCategoryID(libDocumentType.SelectedValue)
        resourceObj.setResourceFileDate(resourceFiledate.Text)


        'save resource 1

        resourceObj.setResourceTopic(txtresourceTopic.Text)

        Dim newresourceID As String

        newresourceID = clsResourceDAO.insertResource(resourceObj)


        'insert into cross_resource_sector table    
        Dim i
        Dim currentSector As String
        Dim sectorname As String
        For i = 0 To libSectors.Items.Count - 1
            If libSectors.Items(i).Selected = True Then
                currentSector = libSectors.Items(i).Value
                sectorname = libSectors.Items(i).Text

                clsResourceDAO.insertResourceSector(newresourceID, currentSector, sectorname)
            End If
        Next

        'insert into cross_resource_events table    
        i = Nothing
        Dim currentEvent As String

        For i = 0 To libEvents.Items.Count - 1
            If libEvents.Items(i).Selected = True Then
                currentEvent = libEvents.Items(i).Value


                clsResourceDAO.insertResourceEvent(newresourceID, currentEvent)
            End If
        Next

        'insert into cross_resource_language table    
        i = Nothing
        Dim currentlanguage As String

        For i = 0 To libLanguage.Items.Count - 1
            If libLanguage.Items(i).Selected = True Then
                currentlanguage = libLanguage.Items(i).Value
                clsResourceDAO.insertResourceLanguage(newresourceID, currentlanguage)
            End If
        Next


        'insert into cross_resource_Country table    
        i = Nothing
        Dim currentcountry As String
        Dim countryname As String
        For i = 0 To libPartnerCountries.Items.Count - 1
            If libPartnerCountries.Items(i).Selected = True Then
                currentcountry = libPartnerCountries.Items(i).Value
                countryname = libPartnerCountries.Items(i).Text
                clsResourceDAO.insertResourceCountry(newresourceID, currentcountry, countryname)
            End If
        Next

        'insert into cross_resource_Topic table    
        i = Nothing
        Dim currenttopic As String
        Dim topic As String
        For i = 0 To libTopics.Items.Count - 1
            If libTopics.Items(i).Selected = True Then
                currenttopic = libTopics.Items(i).Value
                topic = libTopics.Items(i).Text
                clsResourceDAO.insertTopic(newresourceID, currenttopic, topic)
            End If
        Next

    End Sub
    Protected Sub SaveResource1(ByVal s As Object, ByVal e As CommandEventArgs) Handles btnSave1.Command
        'Add a new resource

        SaveNewResource(s, e)

        'Trace.Write("Sarah inserted an event.")
        Response.Redirect("resource_List.aspx", True)
        'Return newresourceID
    End Sub

    Protected Sub SaveResource2(ByVal s As Object, ByVal e As CommandEventArgs) Handles btnSave2.Command
        'Edit an existing resource
        saveExistingResource(s, e)


        'Trace.Write("Sarah edited an event.")
        Response.Redirect("resource_List.aspx", True)

    End Sub

    Protected Sub saveResource3(ByVal s As Object, ByVal e As CommandEventArgs) Handles btnSave3.Command
        saveExistingResource(s, e)
        editResourceId = Server.HtmlEncode(Request.QueryString("resourceID"))
        'add a related resource
        Response.Redirect("resource_create.aspx?pid=" & editResourceId, True)
    End Sub

    Protected Sub SaveResource4(ByVal s As Object, ByVal e As CommandEventArgs) Handles btnSave4.Command
        'Add a new resource and add another

        SaveNewResource(s, e)
        Dim newPID As String = Nothing
        'Trace.Write("Sarah inserted an event.")
        newPID = Server.HtmlEncode(Request.QueryString("pid"))
        If IsNothing(newPID) Then
            Response.Redirect("resource_create.aspx?mode=n")
        Else
            Response.Redirect("resource_create.aspx?pid=" & newPID, True)
        End If

        'Return newresourceID
    End Sub

    Protected Sub SaveResource6(ByVal s As Object, ByVal e As CommandEventArgs) Handles btnSave6.Command
        'Add a existing resource and add another

        saveExistingResource(s, e)
        Dim newPID As String = Nothing
        'Trace.Write("Sarah inserted an event.")
        newPID = Server.HtmlEncode(Request.QueryString("pid"))
        If IsNothing(newPID) Then
            Response.Redirect("resource_create.aspx?mode=n")
        Else
            Response.Redirect("resource_create.aspx?pid=" & newPID, True)
        End If

        'Return newresourceID
    End Sub

    Protected Sub saveExistingResource(ByVal s As Object, ByVal e As CommandEventArgs)
        Dim resourceObj As clsResourceVO
        resourceObj = New clsResourceVO

        editResourceId = Server.HtmlEncode(Request.QueryString("resourceID"))


        resourceObj.setResourceId(editResourceId)
        resourceObj.setStatus(rblStatus.SelectedValue)
        resourceObj.setName(name.Text)
        resourceObj.setShortName(shortname.Text)
        resourceObj.setAuthor(author.Text)
        If resourcePages.Text <> "" Then
            resourceObj.setResourcePages(resourcePages.Text)
        End If
        resourceObj.setResourceSize(txtResourceSize.Text)
        resourceObj.setResourceImage(txtResourceImage.Text)  '6

        resourceObj.setResourceLink(txtResourceLink.Text) ' added 2017 Aug 15
        'If libPartnerCountries.SelectedValue <> "" Then
        '    resourceObj.setCountry(libPartnerCountries.SelectedValue)
        'End If
        resourceObj.setFileTypeID(libFileType.SelectedValue)
        resourceObj.setResourceCategoryID(libDocumentType.SelectedValue)
        resourceObj.setResourceFileDate(resourceFiledate.Text)
        resourceObj.setGrouping(grouping.Text)
        If txtResourceParentID.Value <> "" Then
            resourceObj.setResourceParent(txtResourceParentID.Value)
        End If



        resourceObj.setResourceTopic(txtresourceTopic.Text)

        Trace.Write("editresourceID=" & editResourceId)

        'edit event object in the database
        clsResourceDAO.editResource(resourceObj)

        'delete current sectors
        clsResourceDAO.deleteResourceSectorsByResourceId(editResourceId)
        clsResourceDAO.deleteResourceEventByResourceId(editResourceId)
        clsResourceDAO.deleteResourceLanguageByResourceId(editResourceId)
        clsResourceDAO.deleteResourceCountriesByResourceId(editResourceId)
        clsResourceDAO.deleteResourceTopicsByResourceId(editResourceId)


        'insert into cross_resource_sector table    
        Dim i
        Dim currentSector As String
        Dim sectorname As String
        For i = 0 To libSectors.Items.Count - 1
            If libSectors.Items(i).Selected = True Then
                currentSector = libSectors.Items(i).Value
                sectorname = libSectors.Items(i).Text

                clsResourceDAO.insertResourceSector(editResourceId, currentSector, sectorname)
            End If
        Next

        'insert into cross_resource_events table    
        i = Nothing
        Dim currentEvent As String

        For i = 0 To libEvents.Items.Count - 1
            If libEvents.Items(i).Selected = True Then
                currentEvent = libEvents.Items(i).Value


                clsResourceDAO.insertResourceEvent(editResourceId, currentEvent)
            End If
        Next

        'insert into cross_resource_language table    
        i = Nothing
        Dim currentlanguage As String

        For i = 0 To libLanguage.Items.Count - 1
            If libLanguage.Items(i).Selected = True Then
                currentlanguage = libLanguage.Items(i).Value
                clsResourceDAO.insertResourceLanguage(editResourceId, currentlanguage)
            End If
        Next


        'insert into cross_resource_Country table    
        i = Nothing
        Dim currentcountry As String
        Dim countryname As String
        For i = 0 To libPartnerCountries.Items.Count - 1
            If libPartnerCountries.Items(i).Selected = True Then
                currentcountry = libPartnerCountries.Items(i).Value
                countryname = libPartnerCountries.Items(i).Text
                clsResourceDAO.insertResourceCountry(editResourceId, currentcountry, countryname)
            End If
        Next

        'insert into cross_resource_topic table    
        i = Nothing
        Dim currenttopic As String
        Dim topic As String
        For i = 0 To libTopics.Items.Count - 1
            If libTopics.Items(i).Selected = True Then
                currenttopic = libTopics.Items(i).Value
                topic = libTopics.Items(i).Text
                clsResourceDAO.insertTopic(editResourceId, currenttopic, topic)
            End If
        Next

    End Sub


    Protected Sub CancelResource(ByVal s As Object, ByVal e As CommandEventArgs) Handles btnCancel2.Command, btnCancel1.Command
        Response.Redirect("resource_List.aspx", True)
        'Response.Redirect("resource_List.aspx")
    End Sub


    Protected Sub DeleteResource2(ByVal s As Object, ByVal e As CommandEventArgs) Handles btnDelete2.Command
        editResourceId = Server.HtmlEncode(Request.QueryString("resourceID"))
        clsResourceDAO.deleteResource(editResourceId)



        Response.Redirect("resource_List.aspx", True)
    End Sub






#End Region


    Protected Sub libSectors_SelectedIndexChanged(sender As Object, e As EventArgs) Handles libSectors.SelectedIndexChanged
        editResourceId = Server.HtmlEncode(Request.QueryString("resourceID"))

        FillEvents()
        If Not IsNothing(editResourceId) Then
            'get event names 
            Dim events As DataTable
            events = clsResourceDAO.getEventsByResourceId(editResourceId)

            'set selected values
            For m = 0 To libSectors.Items.Count - 1
                For x = 0 To events.Rows.Count - 1
                    Dim desc As String
                    desc = events.Rows(x)("eventid")
                    If (desc = libEvents.Items(m).Value()) Then
                        libEvents.Items(m).Selected = True
                        Exit For
                    End If
                Next
            Next
        End If
        FillEvents()
    End Sub

    'Protected Sub btnAddRelatedResource_Click(sender As Object, e As EventArgs) Handles btnAddRelatedResource.Click
    '    editResourceId = Server.HtmlEncode(Request.QueryString("resourceID"))
    '    Response.Redirect("resource_create.aspx?pid=" & editResourceId, True)
    'End Sub

    Protected Sub gvRelatedResource_SelectedIndexChanged(sender As Object, e As EventArgs) Handles gvRelatedResource.SelectedIndexChanged

    End Sub

    Protected Sub DeleteFile(sender As Object, e As EventArgs) Handles btnDeleteFile.Click
        editResourceId = Server.HtmlEncode(Request.QueryString("resourceID"))
        clsResourceDAO.deleteFile(editResourceId)
        Response.Redirect("resource_create.aspx?mode=e&resourceid=" & editResourceId, True)
    End Sub




End Class