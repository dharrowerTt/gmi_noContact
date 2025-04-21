Public Class admin_delegates
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        getDetails()

    End Sub

    Private Function getDetails() As Boolean

        getDelegates()

    End Function

    Private Function getDelegates() As Boolean

        Dim data As New DAL
        Dim dt As DataTable = Nothing
        dt = data.GetAllDelegates()
        Dim myText As String = "<table id='list'>                    <thead><tr>     <th >Name</th><th>Email</th><th>Phone Number</th><th>Organization</th><th >Country</th><th >Subcommittee</th><th >Chair</th><th >Alternate</th>            </thead><tbody>"

        Dim thiscountry As String = ""
        If (Not IsNothing(dt)) Then
            'Dim count As Integer
            'For Each cd As DataRow In dt.Rows
            '    count += 1
            'Next
            'Dim half As Integer = (count / 2)
            'count = 0
            For Each CD As DataRow In dt.Rows
                'If count >= half Then
                '    'myText = myText & "</div><div Class='halffloat'><div class='onethirdfloat calloutbox'><h3 style='margin:5px;'>Search the <a href='../project-network/pnmList.aspx?sector=" & myID & "'>project network</a> for other points of contact.</h3></div>"
                '    count = 0
                'Else
                '    count += 1
                'End If
                myText += "<tr>"

                myText += "<td>"
                If Len(Trim(CD("Email").ToString)) > 0 Then
                    myText += " <a href=mailto:" & CD("Email").ToString & ">" & CD("Contact_Name").ToString & "</a>"
                End If
                myText += "</td>"
                myText += "<td>" & CD("Email").ToString & "</td>"
                myText += "<td>" & CD("Phone").ToString & "</td>"
                If (Not CD("Contact_Organization").ToString = "") Then
                    myText += "<td>" & CD("contact_organization").ToString
                    Dim orgID As String = CD("Contact_organization").ToString

                    Dim orgdt As DataTable = data.GetOrganizationbyID(orgID)
                    If Not IsNothing(orgdt) Then
                        For Each org As DataRow In orgdt.Rows
                            myText += "<br />" & org("Name").ToString
                        Next
                    End If
                    myText += "</td>"
                End If
                If (Not CD("Country").ToString = "") Then

                    myText += "<td>" & CD("Country").ToString & "</td>"

                Else
                    myText += "<td>&nbsp;</td>"
                End If

                myText += "<td>" & CD("committeeName").ToString & "</td>"
                If (CD("Chair")) Then
                    myText += "<td>Chair</td>"
                Else
                    myText += "<td>&nbsp;</td>"
                End If
                If (CD("Alternate")) Then
                    myText += "<td>Alternate</td>"
                Else
                    myText += "<td>&nbsp;</td>"
                End If




                'If (Not CD("Contact_Title").ToString = "") Then
                '    myText = myText & "<br />" & CD("Contact_Title").ToString
                'End If


                'Dim myAddress As String
                'myAddress = ""

                'If (Not CD("MailingStreet").ToString = "") Then
                '    myAddress = myAddress & CD("MailingStreet").ToString & ", "
                'End If

                'If (Not CD("MailingCity").ToString = "") Then
                '    If Right(CD("mailingcity"), 1) = "," Then
                '        myAddress = myAddress & CD("MailingCity").ToString & " "
                '    Else
                '        myAddress = myAddress & CD("MailingCity").ToString & ", "
                '    End If
                'End If

                'If (Not CD("MailingState").ToString = "") Then
                '    myAddress = myAddress & CD("MailingState").ToString & ", "
                'End If

                'If (Not CD("MailingCountry").ToString = "") Then
                '    myAddress = myAddress & CD("MailingCountry").ToString & ", "
                'End If

                'If (Not CD("MailingPostalCode").ToString = "") Then
                '    myAddress = myAddress & CD("MailingPostalCode").ToString & ", "
                'End If

                'If (Not myAddress = "") Then
                '    myAddress = myAddress.Trim(" ").Trim(",")
                '    myText = myText & "<br />" & myAddress
                'End If
                'If (Not CD("Phone").ToString = "") And (Not CD("Fax").ToString = "") Then
                '    myText = myText & "<br />Tel: " & CD("Phone").ToString & _
                '        "<br />Fax: " & CD("Fax").ToString
                'ElseIf (Not CD("Phone").ToString = "") Then
                '    myText = myText & "<br />Tel: " & CD("Phone").ToString
                'End If
                myText += "</tr>"



            Next
            myText += "</tbody></table>"
            LitCommittee.Text = myText
        Else
            LitCommittee.Text = "An error has occurred and the delegate list cannot be displayed at this time. Please check back at a later time."
        End If

    End Function

End Class