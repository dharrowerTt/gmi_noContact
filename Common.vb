Imports System.Configuration

Friend Module Common

    Friend Function getGeoFocus(ByVal pGeoFocus As String) As String
        Dim strReturn As String = ""
        Select Case LCase(pGeoFocus)
            Case "usa", "us"
                strReturn = "United States"
            Case "uk"
                strReturn = "United Kingdom"
            Case "ec"
                strReturn = "European Commission"
            Case "korea"
                strReturn = "Republic of Korea"
            Case "dr", "dom_rep"
                strReturn = "Dominican Republic"
            Case "srilanka"
                strReturn = "Sri Lanka"
            Case "saudiarabia"
                strReturn = "Saudi Arabia"
            Case "cotedivoire"
                strReturn = "Cote d'Ivoire"
            Case "macedonia"
                strReturn = "Republic of North Macedonia"
            Case Else
                strReturn = UCase(Left(pGeoFocus, 1)) & Mid(pGeoFocus, 2)
        End Select
        Return strReturn
    End Function

    Friend Function getCountryPageName(ByVal pCountryName As String) As String
        Dim strPageName As String

        Select Case pCountryName
            Case "Dominican Republic"
                strPageName = "dom_rep"
            Case "Saudi Arabia"
                strPageName = "saudiarabia"
            Case "European Commission"
                strPageName = "ec"
            Case "Republic of Korea"
                strPageName = "korea"
            Case "Republic of Serbia"
                strPageName = "serbia"
            Case "Sri Lanka"
                strPageName = "srilanka"
            Case "United Kingdom"
                strPageName = "uk"
            Case "United States"
                strPageName = "us"
            Case "Republic of Côte d'Ivoire"
                strPageName = "cotedivoire"
            Case "Cote d'Ivoire"
                strPageName = "cotedivoire"
            Case "Republic of North Macedonia"
                strPageName = "macedonia"
            Case Else
                strPageName = "" & LCase(pCountryName)
        End Select
        Return strPageName  'getCountryPageName = strPageName
    End Function

    Friend Function getCountryAbbrName(ByVal pCountryName As String) As String
        Dim strPageName As String

        Select Case pCountryName
            Case "Partnership-wide"
                strPageName = "world"
            Case "Dominican Republic"
                strPageName = "dom_rep"
            Case "European Commission"
                strPageName = "ec"
            Case "Republic of Korea"
                strPageName = "korea"
            Case "Republic of Serbia"
                strPageName = "serbia"
            Case "Sri Lanka"
                strPageName = "srilanka"
            Case "Saudi Arabia"
                strPageName = "saudi_arabia"
            Case "United Kingdom"
                strPageName = "uk"
            Case "United States"
                strPageName = "us"
            Case "Republic of Cote d'Ivoire"
                strPageName = "cotedivoire"
            Case "Cote d'Ivoire"
                strPageName = "cotedivoire"
            Case Else
                strPageName = LCase(pCountryName)
        End Select
        Return strPageName  'getCountryPageName = strPageName
    End Function
	
	Friend Function getSectorPageName(ByVal sector As String) As String
        Dim strPageName As String

        Select Case sector
            Case "MSW"
                strPageName = "../sectors/index.aspx?msw"
            Case "oil"
                strPageName = "../sectors/index.aspx?oilngas"
            Case "wastewater"
                strPageName = "../sectors/index.aspx?ww"
            Case "landfill"
                strPageName = "../sectors/index.aspx?msw"
            Case "steer"
                strPageName = "../sectors/index.aspx?steer"
            Case "agri"
                strPageName = "../sectors/index.aspx?agri"
            Case "coal"
                strPageName = "../sectors/index.aspx?coal"
            Case Else
                strPageName = "../sectors/index.aspx?" & LCase(sector)
        End Select
        Return strPageName  'getCountryPageName = strPageName
    End Function


    Friend Function trtProjectSector(ByVal pSector As String) As String
        Dim strReturn As String = "Invalid Sector"
        Select Case LCase(pSector)
            Case "ag" : strReturn = "Agriculture"
            Case "agri" : strReturn = "Agriculture"
            Case "asg" : strReturn = "ASG"
            Case "biogas" : strReturn = "Biogas"
            Case "coal" : strReturn = "Coal Mines"
            Case "landfill" : strReturn = "Municipal Solid Waste"
            Case "gen" : strReturn = "General"
            Case "oilngas" : strReturn = "Oil & Gas"
            Case "oil" : strReturn = "Oil & Gas"
            Case "steer" : strReturn = "Steering"
            Case "cross" : strReturn = "Cross Sector"
            Case "msw" : strReturn = "Municipal Solid Waste"
            Case "ww" : strReturn = "Wastewater"
            Case "wastewater" : strReturn = "Wastewater"
        End Select
        If strReturn = "Invalid Sector" Then
            strReturn = strReturn
        End If
        Return strReturn
    End Function
    Friend Function GetSectorDBName(ByVal pSector As String) As String
        Dim strReturn As String = "Invalid Sector"
        Select Case LCase(pSector)
            Case "ag" : strReturn = "Agriculture"
            Case "agri" : strReturn = "Agriculture"
            Case "biogas" : strReturn = "Biogas"
            Case "bio" : strReturn = "Biogas"
            Case "coal" : strReturn = "Coal"
            Case "landfill" : strReturn = "Landfills"
            Case "oilngas" : strReturn = "Oil & Gas"
            Case "oil" : strReturn = "Oil & Gas"
            Case "cross" : strReturn = "Cross Sector"
            Case "steer" : strReturn = "Steering"
            Case "msw" : strReturn = "MSW"
            Case "ww" : strReturn = "Wastewater"
            Case "wastewater" : strReturn = "Wastewater"
        End Select
        If strReturn = "Invalid Sector" Then
            strReturn = strReturn
        End If
        Return strReturn
    End Function

    Friend Function geteventSector(ByVal sector As String) As String
        Dim strReturn As String = "Invalid Sector"
        Select Case LCase(sector)
            Case "agriculture" : strReturn = "agri"
            Case "biogas" : strReturn = "biogas"
            Case "coal mines" : strReturn = "coal"
            Case "msw" : strReturn = "msw"
            Case "oil & gas" : strReturn = "oilngas"
            Case "steering" : strReturn = "steer"
            Case "wastewater" : strReturn = "ww"
            Case "mini" : strReturn = "mini"
        End Select
        If strReturn = "Invalid Sector" Then
            strReturn = strReturn
        End If
        Return strReturn
    End Function

    Friend Function getSectorEventURL(ByVal pSector As String) As String
        Dim strReturn As String = "Invalid Sector"
        Select Case LCase(pSector)
            Case "agri" : strReturn = "agriculture"
            Case "agriculture" : strReturn = "agriculture"
            Case "biogas" : strReturn = "biogas"
            Case "mini" : strReturn = ""
            Case "coal" : strReturn = "coalmines"
            Case "general" : strReturn = "steer"
            Case "coal mines" : strReturn = "coalmines"
            Case "oilngas" : strReturn = "oilngas"
            Case "oilandgas" : strReturn = "oilngas"
            Case "oil & gas" : strReturn = "oilngas"
            Case "oil and gas" : strReturn = "oilngas"
            Case "steer" : strReturn = "steer"
            Case "steering" : strReturn = "steer"
            Case "msw" : strReturn = "msw"
            Case "municipalsolidwaste" : strReturn = "msw"
            Case "municipal solid waste" : strReturn = "msw"
            Case "ww" : strReturn = "wastewater"
            Case "wastewater" : strReturn = "wastewater"
            Case "" : strReturn = "steer"
            Case "asg" : strReturn = "steer"

        End Select
        If strReturn = "Invalid Sector" Then
            strReturn = strReturn
        End If
        Return strReturn
    End Function

    Friend Function GetTranslatePageNamebyLanguage(ByVal pLang As String) As String
        Dim strReturn As String = UCase(pLang)
        Select Case LCase(pLang)
            Case "russian" : strReturn = "&#1056;&#1077;&#1089;&#1091;&#1088;&#1089;&#1099; &#1053;&#1072; &#1056;&#1091;&#1089;&#1089;&#1082;&#1086;&#1084; &#1071;&#1079;&#1099;&#1082;&#1077;"
            Case "spanish" : strReturn = "Recursos en español"
            Case "portuguese" : strReturn = "Recursos em Português"
            Case "italian" : strReturn = "Risorse in italiano"

                'Case "" : strReturn = ""
                'Case "" : strReturn = ""
                'Case "" : strReturn = ""
                'Case "" : strReturn = ""
        End Select


        Return strReturn
    End Function

    Friend Function GetLanguageName(ByVal pLang As String) As String
        Dim strReturn As String = "Invalid Language"
        If pLang <> "" Then
            strReturn = Replace(pLang, " ", "")
        End If

        Return strReturn
    End Function
    Friend Function trtChr13ToBr(ByRef pString As String) As String


        ' this function translates line breaks, chr(13), to be html <br /> tags.  The chr(13) 
        ' cause line breaks in a textarea control, but not in regular html.

        Dim trtX As Integer
        Dim trtY As Integer
        Dim sWork As String
        Dim sWork2 As String

        If IsDBNull(pString) Then
            trtChr13ToBr = ""
        Else
            trtX = 1
            sWork = pString
            Do
                trtY = InStr(trtX, sWork, Chr(13))
                If trtY = 0 Then Exit Do
                If trtY = 1 Then
                    sWork2 = ""
                Else
                    sWork2 = Left(sWork, trtY - 1)
                End If
                sWork2 = sWork2 & "<br />"
                If trtY < Len(sWork) Then
                    sWork2 = sWork2 & Mid(sWork, trtY + 1)
                End If
                trtX = trtY + 6
                sWork = sWork2
            Loop
            trtChr13ToBr = sWork
        End If
    End Function

    Friend Function getFileSize(ByVal pFileName As String) As String

        Dim sReturn As String
        Try
            Dim lFileSize As Long
            lFileSize = FileLen(pFileName)
            If lFileSize > 1000000 Then
                sReturn = CStr(Int(lFileSize / 1000000 + 0.5)) & " MB"
            Else
                sReturn = CStr(Int(lFileSize / 1000 + 0.5)) & " KB"
            End If
        Catch ex As Exception
            'Common.WrapException(ex)
            sReturn = "Error"
            '        Finally
        End Try
        Return sReturn

    End Function

    Friend Function getresourceImageName(ByVal resourcePath As String, ByVal resourceImage As String) As String
        Dim sReturn As String = ""

        If Len(resourceImage) > 1 Then
            sReturn = resourceImage
        Else
            Try
                Dim tempPath As String
                tempPath = Replace(Replace(Replace(Replace(resourcePath, "/assets/images/", ""), "/expo-docs/", ""), "/attachments/", ""), "/documents/", "")
                tempPath = Replace(Replace(Replace(Replace(tempPath, "http", ""), "https", ""), "://", ""), "www.", "")
                tempPath = Replace(Replace(Replace(Replace(tempPath, ".wmv", ".jpg"), ".docx", ".jpg"), ".doc", ".jpg"), ".pdf", ".jpg")
                tempPath = Replace(Replace(tempPath, "/", ""), " ", "")
                tempPath = "/assets/images/doc_thumbs/jpeg/" + tempPath
                sReturn = tempPath
            Catch

            End Try
        End If

        
        Return sReturn

    End Function

    Friend Function GetConnString() As String

        Return ConfigurationSettings.AppSettings.Item("GMIdatabase")

    End Function

    Friend Function GetConfiguration(Optional ByVal configName As String = "") As String

        Return ConfigurationSettings.AppSettings.Item(configName)

    End Function

    'Friend Function GetAttachmentfiledir() As String

    '    Return System.Configuration.ConfigurationSettings.AppSettings.Item("attachmentfiledir")

    'End Function

    Friend Sub WrapException(ByVal ex As Exception)

        Err.Raise(-10000, ex.Source, ex.Message)

    End Sub


    Friend Function FormatTextAsList(ByVal text As String, ByVal classname As String) As String
        Dim rtn As String
        rtn = "<li class='" & classname & "'>" & text & "</li>"

        Return rtn
    End Function


    Friend Function FormatLinkAsList(ByVal text As String, ByVal link As String, ByVal classname As String, ByVal size As String, ByVal type As String, ByVal pages As String, ByVal category As String) As String
        Dim rtn As String
        rtn = "<li class='" & classname & "'><a href='" & link & "' target='_blank'>" & text & " <b> " & category & "</b> ("

        If type = "PDF" Then
            rtn += "<img src='/assets/images/pdf.png' alt='PDF' style='width:15px;' />"
        ElseIf type = "Word" Then
            rtn += "<img src='/assets/images/word.png' alt='Microsft Word' style='width:15px;' />"
        ElseIf type = "Excel" Then
            rtn += "<img src='/assets/images/excel.png' alt='Microsof Excel' style='width:15px;' />"
        ElseIf type = "Video" Then
            rtn += "<img src='/assets/images/video.png' alt='Video' style='width:15px;' />"
        ElseIf type = "Zip" Then
            rtn += "<img src='/assets/images/zip.png' alt='Zip File' style='width:15px;' />"
        ElseIf type = "" Then

        Else
            rtn += type
        End If
        If size <> "" Then
            rtn += size
        End If
        If pages <> "" Then
            rtn += " , " & pages & "pp)</li>"
        Else
            rtn += ")</li>"
        End If
        rtn = Replace(rtn, "()", "")
        'Else
        'rtn += pages & "p)</li>"
        'End If


        Return rtn
    End Function

    Friend Function GetAppPath(ByVal request As HttpRequest) As String
        Dim strAppRootH, strAppPathH
        Dim strSrvr As String = request.ServerVariables("SERVER_NAME")
        strAppRootH = request("PATH_INFO")
        If StrComp(strSrvr, "www.globalmethane.org", vbTextCompare) = 0 Then
            strAppPathH = ""
        ElseIf StrComp(strSrvr, "globalmethane.org", vbTextCompare) = 0 Then
            strAppPathH = ""
        ElseIf StrComp(strSrvr, "4.36.57.76", vbTextCompare) = 0 Then   'QA site
            strAppPathH = ""
        ElseIf StrComp(strSrvr, "gmi-stage.icfwebservices.com", vbTextCompare) = 0 Then
            strAppPathH = ""
        Else
            strAppPathH = Left(strAppRootH, InStr(2, strAppRootH, "/", 1) - 1)
        End If

        Return strAppPathH

    End Function


    Friend Function GetAppPathUrl(ByVal request As HttpRequest) As String
        Dim strSrvr As String = request.ServerVariables("SERVER_NAME")

        Return strSrvr
    End Function


    Friend Function myNullCheck(ByRef pValue) As String
        If IsDBNull(pValue) Then
            myNullCheck = ""
        Else
            myNullCheck = pValue
        End If
    End Function

    'Friend Function myNullCheckInt(ByVal pValue) As Integer
    '    If IsDBNull(pValue) Then
    '        myNullCheckInt = 0
    '    Else
    '        myNullCheckInt = pValue
    '    End If
    'End Function

    'Friend Function GetAppRoot(ByVal req As HttpRequest) As String

    '    Dim strAppRootH, strAppPathH As String
    '    Dim strSrvr As String = req.ServerVariables("SERVER_NAME")
    '    strAppRootH = req("PATH_INFO")

    '    If StrComp(strSrvr, "www.globalmethane.org", vbTextCompare) = 0 Then
    '        strAppPathH = ""
    '    ElseIf StrComp(strSrvr, "globalmethane.org", vbTextCompare) = 0 Then
    '        strAppPathH = ""
    '    Else
    '        strAppPathH = Left(strAppRootH, InStr(2, strAppRootH, "/", 1) - 1)
    '    End If

    '    Return strAppPathH

    'End Function

    'sarah 2009
    'default data format across the site
    'dd MMMM yyyy
    Friend Function getDateFormatDisplay(ByVal pValue As String) As String
        Dim myDateObj As DateTime
        myDateObj = DateTime.Parse(pValue)
        Return myDateObj.ToString("dd MMMM yyyy")
    End Function

    'MMDDYYYY
    Friend Function getDateFormatDisplayMMDDYYYY(ByVal pValue As String) As String
        Dim myDateObj As DateTime
        myDateObj = DateTime.Parse(pValue)
        Return myDateObj.ToString("d")
    End Function

    Friend Function getDateFormatDisplayDateForBo(ByVal pValue As String) As String

        Dim myDateObj As DateTime
        myDateObj = DateTime.Parse(pValue)

        Dim strWorkDay As String = myDateObj.ToString("dd")
        If Left(strWorkDay, 1) = "0" Then
            strWorkDay = Right(strWorkDay, 1)
        End If

        Dim strWorkMonth As String = myDateObj.ToString("MM")
        If Left(strWorkMonth, 1) = "0" Then
            strWorkMonth = Right(strWorkMonth, 1)
        End If
        Return strWorkMonth & "." & strWorkDay

    End Function

    'MM dd
    Friend Function getDateFormatDisplayMMDD(ByVal pValue As String) As String
        Dim myDateObj As DateTime
        myDateObj = DateTime.Parse(pValue)
        Return myDateObj.ToString("MM dd")
    End Function

    ''set and get the current directory on the server 'Sarah L.
    'Private myDirectory As String
    'Friend Function SetDirectory(ByVal pValue As String) As String
    '    myDirectory = pValue
    'End Function

    'Friend Function getDirectory() As String

    'If (Not myDirectory.Equals(System.DBNull.Value) And Not myDirectory.Equals(String.Empty)) Then
    '    Return myDirectory
    'Else
    '    'Find the current directory on the server
    '    Dim serverPath As String
    '    'serverPath = Server.MapPath("index.aspx")

    '    Dim strAppRootH, strAppPathH
    '    Dim strSrvr

    '    strSrvr = req.ServerVariables("SERVER_NAME")
    '    strAppRootH = req("PATH_INFO")

    '    Dim SPLIT_STR As String
    '    SPLIT_STR = "\"

    '    Dim myArr(10) As String
    '    Dim a
    '    For a = myArr.GetLowerBound(0) To myArr.GetUpperBound(0)
    '        myArr(a) = String.Empty
    '    Next
    '    'myArr = serverPath.Split(SPLIT_STR)
    '    myArr = strAppRootH.Split(SPLIT_STR)

    '    'Dim m
    '    'Dim count
    '    'count = 0
    '    'For m = myArr.GetLowerBound(0) To myArr.GetUpperBound(0)
    '    '    If (Not myArr(m).Equals(System.DBNull.Value) And Not myArr(m).Equals(String.Empty)) Then
    '    '        count = count + 1
    '    '    End If
    '    'Next

    '    'Dim myFolder As String
    '    'myFolder = myArr(count - 2)

    '    myDirectory = strAppRootH

    '    Common.SetDirectory(strAppRootH)
    '    Return myDirectory

    'End If

    'Return myDirectory

    'End Function

    Friend Function removeLeadingCharUnderscore(ByVal myString As String) As String
        Dim strReturn As String = ""
        'If (myString.IndexOf("_") = 0) Then
        '   strReturn = myString.Substring(1)
        'Else
        '   strReturn = myString
        'End If

        strReturn = myString.Trim("*").Trim("_")
        Return strReturn
    End Function

    Friend Function IsQueryStringSafe(ByVal query As String)
        Dim isSafe As Boolean = True
        Dim Values() As String = {"<", "script", "prompt", "onmouse", ">", "object"}

        For Each value As String In Values
            If query.Contains(value) Then
                isSafe = False
                Exit For
            End If
        Next

        Return isSafe
    End Function


    Friend Function StripMetaChars(ByVal s As String) As String

        s = s.Replace("\", "")
        s = s.Replace("/", "")
        s = s.Replace(":", "")
        s = s.Replace(";", "")
        s = s.Replace("*", "")
        s = s.Replace("?", "")
        s = s.Replace("'", "")
        s = s.Replace(Chr(34), "")
        s = s.Replace("<", "")
        s = s.Replace(">", "")
        s = s.Replace("|", "")
        s = s.Replace("--", "")
        s = s.Replace("%", "")

        Return s

    End Function

    Friend Function getMonthFormatDisplay(ByVal pValue As String) As String
        Dim myDateObj As DateTime
        myDateObj = DateTime.Parse(pValue)
        Return myDateObj.ToString("MMMM")
    End Function
    Friend Function getYearFormatDisplay(ByVal pValue As String) As String
        Dim myDateObj As DateTime
        myDateObj = DateTime.Parse(pValue)
        Return myDateObj.ToString("yyyy")
    End Function

    Friend Function SafeSqlLiteral(ByVal strValue As String) As String

        strValue = strValue.Replace("'", "''")
        strValue = strValue.Replace("--", "").Replace("[", "[[]").Replace("%", "[%]").Replace(" OR ", "").Replace(" or ", "")
        strValue = strValue.Replace(" AND ", "").Replace(" and ", "").Replace("\\\r\n", "").Replace("\\\r\n\r\n", "")

        Dim i As Integer = 0
        Dim i2 As Integer = 0

        Dim intLenghtLeft As Integer = 0

        Dim myArray() As String = New String() {"xp_ ", "update ", "insert ", "select ", "drop ", "alter ", "create ", "rename ", "delete ", "replace "}

        For i = 0 To myArray.Length - 1
            Dim strWord As String = myArray(i)

            Dim rx As Regex = New Regex(strWord, RegexOptions.Compiled Or RegexOptions.IgnoreCase)

            Dim matches As MatchCollection = rx.Matches(strValue)
            i2 = 0
            For Each match As Match In matches
                Dim groups As GroupCollection = match.Groups
                intLenghtLeft = groups(0).Index + myArray(i).Length + i2
                strValue = strValue.Substring(0, intLenghtLeft - 1) + "&nbsp;" + strValue.Substring(strValue.Length - (strValue.Length - intLenghtLeft), strValue.Length - intLenghtLeft)
                i2 += 5
            Next

        Next

        Return strValue
    End Function

    'Friend Function TrimToLength(ByVal strVal As String, ByVal length As Integer) As String

    '    If strVal.Length = 0 Then
    '        Return strVal
    '        Exit Function
    '    End If

    '    If length <= 0 Then
    '        '' Invalid option return original string
    '        Return strVal
    '        Exit Function
    '    End If


    '    If strVal.Length > length Then
    '        Return strVal.Substring(0, length)
    '    Else
    '        Return strVal

    '    End If

    'End Function

    Friend Function getImageForCheckbox(ByVal myVal As Boolean) As String
        Dim strReturn As String = "<input type='checkbox' disabled='disabled' />"
        If (myVal = True) Then
            strReturn = "<img src='/assets/images/activity_checkmark.gif' alt='check' />"
        End If

        Return strReturn
    End Function

    Friend Function replaceHTMLTags(ByVal html As String) As String
        Dim strReturn As String
        If Len(html) < 5 Then
            Return html
            Exit Function
        End If
        strReturn = Regex.Replace(html, "<div.*?>", "")
        strReturn = Replace(strReturn, "   ", "&nbsp;")
        strReturn = Replace(strReturn, "  ", "&nbsp;")
        strReturn = Regex.Replace(strReturn, "<span.*?>", "")
        strReturn = Regex.Replace(strReturn, "<font.*?>", "")
        strReturn = Regex.Replace(strReturn, "<p.*?>", "")
        strReturn = Regex.Replace(strReturn, "<li.*?>", "")
        strReturn = Regex.Replace(strReturn, "<ul.*?>", "")
        strReturn = Regex.Replace(strReturn, "<b.*?>", "")
        strReturn = Regex.Replace(strReturn, "<a.*?>", "")
        strReturn = Regex.Replace(strReturn, "</.*?>", "")
        strReturn = Regex.Replace(strReturn, "<sup.*?>", "")
        strReturn = Replace(strReturn, "<div>", "")
        strReturn = Replace(strReturn, "</div>", "")
        strReturn = Replace(strReturn, "</p>", "<br /><br />")
        strReturn = Replace(strReturn, "& vbCrLf &", "")
        strReturn = Replace(strReturn, "<p>", "")
        strReturn = Replace(strReturn, "<table>", "<br />")
        strReturn = Replace(strReturn, "</table>", "<br />")
        strReturn = Replace(strReturn, "<tr>", "<br />")
        strReturn = Replace(strReturn, "</tr>", "")
        strReturn = Replace(strReturn, "<td>", "&nbsp;&nbsp;&nbsp;")
        strReturn = Replace(strReturn, "</td>", "")
        strReturn = Replace(strReturn, "<ul>", "<br />")
        strReturn = Replace(strReturn, "<ol>", "<br />")
        strReturn = Replace(strReturn, "<li>", "<br />&bull;&nbsp;&nbsp;")
        'strReturn = Replace(strReturn, "<li", "<span ")
        'strReturn = Replace(strReturn, "<ul", "<span ")
        'strReturn = Replace(strReturn, "<p", "<span ")
        'strReturn = Replace(strReturn, "<div", "<span ")
        strReturn = Replace(strReturn, "</li>", "<br />")
        ' strReturn = Replace(strReturn, "<a href=""", "")
        'strReturn = Replace(strReturn, "https://", "")
        'strReturn = Replace(strReturn, "http://", "")
        'strReturn = Replace(strReturn, "</a>", "")
        strReturn = Replace(strReturn, "target=.*?blank.*?", "")
        strReturn = Replace(strReturn, "</ul>", "<br />")
        strReturn = Replace(strReturn, "<br /><br />", "<br />")
        strReturn = Replace(strReturn, "<br /><br />", "<br />")
        strReturn = Replace(strReturn, "<br /><br />", "<br />")
        Return strReturn
    End Function
    Friend Function HtmlButton() As String
        Return "<input type=""button"" class=""facet"" name=""button"" value=""@""></input>"
    End Function

    Friend Function CommaDelimitedListToButtonList(ByVal strList As String) As String
        If (strList = Nothing Or strList = "") Then
            Return strList
        End If

        Dim strReturn As String = ""
        Dim arrList() As String = strList.Split(",")

        For i As Integer = 0 To arrList.Length - 1
            strReturn = strReturn & Replace(HtmlButton(), "@", arrList(i))
        Next

        Return strReturn
    End Function

    Friend Sub UpdateTableColumn(ByRef tbl As DataTable, strColName As String)
        Dim strCellValue As String

        For Each row In tbl.Rows
            strCellValue = row(strColName).ToString()
            row(strColName) = CommaDelimitedListToButtonList(strCellValue)
        Next row
    End Sub

    Public Function GetRandom(ByVal Min As Integer, ByVal Max As Integer) As Integer
        ' by making Generator static, we preserve the same instance '
        ' (i.e., do not create new instances with the same seed over and over) '
        ' between calls '
        Static Generator As System.Random = New System.Random()
        Return Generator.Next(Min, Max)
    End Function


End Module
