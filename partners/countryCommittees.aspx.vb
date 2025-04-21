Partial Class countryCommittees
    Inherits System.Web.UI.Page

    'Private binding As sforce.SforceService



    Private Sub Page_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load

        'getBinding()
        'Dim strSectorFieldName As String = ""
        'Dim strBreadCrumbCommName As String = ""
        'Dim strCommitteename As String = ""


        Dim myCountry As String = IIf(Server.HtmlEncode(Request.QueryString("country")) Is Nothing, String.Empty, Server.HtmlEncode(Request.QueryString("country")))
        Dim mySector As String = IIf(Server.HtmlEncode(Request.QueryString("sector")) Is Nothing, String.Empty, Server.HtmlEncode(Request.QueryString("sector")))

        If (Common.IsQueryStringSafe(myCountry) = False) Then
            Response.Redirect("~/Partners/Index.aspx")
        End If
        If (Common.IsQueryStringSafe(mySector) = False) Then
            Response.Redirect("~/Partners/Index.aspx")
        End If
        If mySector = "" And myCountry = "" Then
            myCountry = "Albania"
        End If

        Dim PageType As String = ""
        If Len(myCountry) = 0 And Len(mySector) = 0 Then
            litCountryBreadcrumb.Text = ""
            litBreadcrumb.Text = ""
            litPageTitle.Text = "Subcommittee Members"
            PageType = ""
        ElseIf Len(myCountry) = 0 Then
            Dim strSector As String = trtProjectSector(mySector)
            litCountryBreadcrumb.Text = "<a href=" + getSectorPageName(mySector) + ">" + strSector + "</a> &raquo;"
            litBreadcrumb.Text = strSector & " Subcommittee Members"
            litPageTitle.Text = strSector & " Subcommittee Members"
            PageType = "Sector"
            getDetails(PageType, mySector)
        ElseIf Len(mySector) = 0 Then
            Dim strCountry As String = getGeoFocus(myCountry)
            litCountryBreadcrumb.Text = "<a href=" + getCountryPageName(strCountry) + ">" + strCountry + "</a> &raquo;"

            litBreadcrumb.Text = "Subcommittee Members from " & strCountry
            litPageTitle.Text = "Subcommittee Members from " & StrConv(strCountry, VbStrConv.ProperCase)
            PageType = "Country"
            getDetails(PageType, strCountry)
        End If



    End Sub

    Private Function getDetails(ByVal pageType As String, ByVal myID As String) As Boolean

        'Dim myId As String
        'myId = IIf(Server.HtmlEncode(Request.QueryString("country")) Is Nothing, Server.HtmlEncode(Request.QueryString("sector")), Server.HtmlEncode(Request.QueryString("country")))
        'myId = Common.StripMetaChars(myId)

        Dim data As New DAL
        Dim dt As DataTable = Nothing
        If pageType = "Country" Then
            dt = data.GetCommitteeByCountryID(myID)
        ElseIf pageType = "Sector" Then
            dt = data.GetCommitteeBySector(myID, 3)
        End If

        If (myId.Length > 0) Then

            Dim myText As String = ""
            Dim myCommittee As String = ""

            Dim myIdDisp As String
            myIdDisp = myId.Substring(0, 1).ToUpper & myId.Substring(1)

            'myText = myText & "<h2>" & myIdDisp & " </h2>"

            If (Not IsNothing(dt)) Then
                For Each CD As DataRow In dt.Rows

                    If (myCommittee = CD("CommitteeName").ToString) Then
                        myText = myText & "<br />"
                    Else

                        If (CD("CommitteeName").ToString = "MSW Subcommittee") Then
                            myText = myText & "<br /><h2>" & "Municipal Solid Waste Subcommittee" & "</h2>"
                        Else
                            myText = myText & "<br /><h2>" & CD("CommitteeName").ToString & "</h2>"
                        End If

                    End If

                    myCommittee = CD("CommitteeName").ToString

                    myText = myText & "<p>" & CD("Contact_Name").ToString

                    If (Not CD("Contact_Title").ToString = "") Then
                        myText = myText & "<br />" & CD("Contact_Title").ToString
                    End If

                    If pageType = "Sector" And (Not CD("country").ToString = "") Then
                        myText = myText & "<br />Country:  <b>" & CD("country").ToString & "</b>"
                    End If

                    If (Not CD("Contact_Organization").ToString = "") Then
                        myText = myText & "<br />" & CD("contact_organization").ToString
                        Dim orgID As String = CD("Contact_organization").ToString

                        Dim orgdt As DataTable = data.GetOrganizationbyID(orgID)
                        If Not IsNothing(orgdt) Then
                            For Each org As DataRow In orgdt.Rows
                                myText = myText & "<br />" & org("Name").ToString
                            Next
                        End If
                    End If
                    Dim myAddress As String
                    myAddress = ""

                    If (Not CD("MailingStreet").ToString = "") Then
                        myAddress = myAddress & CD("MailingStreet").ToString & ", "
                    End If

                    If (Not CD("MailingCity").ToString = "") Then
                        myAddress = myAddress & CD("MailingCity").ToString & ", "
                    End If

                    If (Not CD("MailingState").ToString = "") Then
                        myAddress = myAddress & CD("MailingState").ToString & ", "
                    End If

                    If (Not CD("MailingCountry").ToString = "") Then
                        myAddress = myAddress & CD("MailingCountry").ToString & ", "
                    End If

                    If (Not CD("MailingPostalCode").ToString = "") Then
                        myAddress = myAddress & CD("MailingPostalCode").ToString & ", "
                    End If

                    If (Not myAddress = "") Then
                        myAddress = myAddress.Trim(" ").Trim(",")
                        myText = myText & "<br />" & myAddress
                    End If
                    If (Not CD("Phone").ToString = "") And (Not CD("Fax").ToString = "") Then
                        myText = myText & "<br />Tel: " & CD("Phone").ToString & _
                            "<br />Fax: " & CD("Fax").ToString
                    ElseIf (Not CD("Phone").ToString = "") Then
                        myText = myText & "<br />Tel: " & CD("Phone").ToString
                    End If
                    If Len(Trim(CD("Email").ToString)) > 0 Then
                        myText = myText & "<br />Email: <a href=mailto:" & CD("Email").ToString & ">" & CD("Email").ToString & "</a>"
                    End If

                    If (CD("Chair")) Then
                        myText = myText & "<br /><b>Chair</b>"
                    End If
                    If (CD("Alternate")) Then
                        myText = myText & "<br /><b>Alternate</b>"
                    End If
                    myText = myText & "</p>"
                Next
                litStuff.Text = myText
            Else
                litStuff.Text = "This country has no committee delegates."
            End If
        End If


        'If (Not mySector = "") Then
        '    Dim myCountry As String
        '    myCountry = ""


        '    Dim mySectorDisp As String
        '    mySectorDisp = mySector.Substring(0, 1).ToUpper & mySector.Substring(1)

        '    If (mySector = "oil & gas") Then
        '        mySectorDisp = "Oil & Gas"
        '    End If

        '    myText = myText & "<h2>" & mySectorDisp & " </h2>"

        '    If (Not IsNothing(qr.records)) Then
        '        For i As Integer = 0 To qr.records.GetUpperBound(0)
        '            Dim myObj As sforce.Committee_Delegate = CType(qr.records(i), sforce.Committee_Delegate)

        '            If (myCountry = myObj.Country_Representing.Name) Then
        '                myText = myText & "<br />"
        '            Else
        '                myText = myText & "<br /><b>" & myObj.Country_Representing.Name & "</b>"
        '            End If

        '            myCountry = myObj.Country_Representing.Name

        '            myText = myText & "<p>" & myObj.Contact.Name

        '            If (Not myObj.Contact.Title = "") Then
        '                myText = myText & "<br />" & myObj.Contact.Title
        '            End If

        '            If (Not myObj.Contact.Organization = "") Then
        '                Dim queryTxt2 As String
        '                queryTxt2 = "Select id,name, Organization_Category from Organization " & _
        '                    "where id='" & myObj.Contact.Organization & "'"
        '                qr2 = binding.query(queryTxt2)

        '                Dim myObjOrg As sforce.Organization = CType(qr2.records(0), sforce.Organization)

        '                myText = myText & "<br />" & myObjOrg.Name
        '            End If

        '            'myText = myText & "<br />" & myObj.Contact.MailingStreet & ", " & myObj.Contact.MailingCity & ", " & myObj.Contact.MailingState & ", " & myObj.Contact.MailingCountry & ", " & myObj.Contact.MailingPostalCode & _

        '            Dim myAddress As String
        '            myAddress = ""

        '            If (Not myObj.Contact.MailingStreet = "") Then
        '                myAddress = myAddress & myObj.Contact.MailingStreet & ", "
        '            End If

        '            If (Not myObj.Contact.MailingCity = "") Then
        '                myAddress = myAddress & myObj.Contact.MailingCity & ", "
        '            End If

        '            If (Not myObj.Contact.MailingState = "") Then
        '                myAddress = myAddress & myObj.Contact.MailingState & ", "
        '            End If

        '            If (Not myObj.Contact.MailingCountry = "") Then
        '                myAddress = myAddress & myObj.Contact.MailingCountry & ", "
        '            End If

        '            If (Not myObj.Contact.MailingPostalCode = "") Then
        '                myAddress = myAddress & myObj.Contact.MailingPostalCode & ", "
        '            End If

        '            If (Not myAddress = "") Then
        '                myAddress = myAddress.Trim(" ").Trim(",")
        '                myText = myText & "<br />" & myAddress
        '            End If

        '            myText = myText & "<br />Tel: " & myObj.Contact.Phone & _
        '                "<br />Fax: " & myObj.Contact.Fax & _
        '                "<br />Email: " & myObj.Contact.Email & "</p>"
        '            litStuff.Text = myText
        '        Next
        '    Else
        '        litStuff.Text = "This sector has no committee delegates."
        '    End If
        'End If

        Return True
    End Function

End Class
