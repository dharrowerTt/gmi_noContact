Public Class delegates_index
    Inherits System.Web.UI.Page


    Dim CookieValue As String
    Protected WithEvents tbldelegates2 As System.Web.UI.WebControls.PlaceHolder

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Request.Cookies("username") Is Nothing Then
            CookieValue = Request.Cookies("username").Value
        Else
            CookieValue = "user"
        End If

        getDetails()


        If Not Me.IsPostBack Then

            Try
                Dim strSearch As String = ""

            Catch ex As Exception

            End Try


        End If



    End Sub

    Private Function getDetails() As Boolean


        Page.Title = "Delegates | Global Methane Initiative"

        If CookieValue = "user" Then
            getDelegates()
            Page.Title = "Committee Delegates | Global Methane Initiative"
        Else
            getAdminDelegates()
            Page.Title = "Admin Delegates | Global Methane Initiative"
        End If



    End Function

    Private Function getAdminDelegates() As Boolean

        Dim data As New DAL
        Dim dt As DataTable = Nothing
        dt = data.GetAllDelegates()
        'format of table rows
        '<tr>
        '		<td>Monica Shimamura</td>
        '		<td>U.S. Environmental Protection Agency (EPA)</td>
        '		<td>United States</td>
        '		<td>Steering Committee</td>
        '		<td>&nbsp;</td>
        '		<td>Alternate</td>
        '	</tr>


        Dim myText As String = "<thead>	<tr>  <th>Name</th>	<th>Organization</th>	<th>Country</th>  <th>Subcommittee</th>	<th>Chair/<br>Vice Chair</th>  <th>Alternate</th>	</tr>  </thead>  <tbody>"
        Dim thiscountry As String = ""
        Dim myLabel As Label
        If (Not IsNothing(dt)) Then

            For Each CD As DataRow In dt.Rows

                myText += "<tr>"
                myText += "<td>"
                If Len(Trim(CD("Email").ToString)) > 0 Then
                    myText += " <a href=mailto:" & CD("Email").ToString & ">" & CD("Contact_Name").ToString & "</a>"
                End If
                myText += "</td>"

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
                    If (CD("Contact_Name").ToString = "Tomás Carbonell" Or CD("Contact_Name").ToString = "Vinod Kumar Tiwari") Then
                        myText += "<td>Vice Chair</td>"
                    Else
                        myText += "<td>Chair</td>"
                    End If

                Else
                        myText += "<td>&nbsp;</td>"
                End If
                If (CD("Alternate")) Then
                    myText += "<td>Alternate</td>"
                Else
                    myText += "<td>&nbsp;</td>"
                End If


                myText += "</tr>"



            Next
            myText += "</tbody></table>"
            myLabel = New Label
            myLabel.Text = myText
            tbldelegates2.Controls.Add(myLabel)

        Else
            myText = "An error has occurred and the delegate list cannot be displayed at this time. Please check back at a later time."
            myLabel = New Label
            myLabel.Text = myText
            tbldelegates2.Controls.Add(myLabel)
        End If

    End Function



    Private Function getDelegates() As Boolean

        Dim data As New DAL
        Dim dt As DataTable = Nothing
        dt = data.GetAllDelegates()
        Dim myText As String = "<thead>			<tr>     			<th>Name</th>				<th>Organization</th>				<th>Country</th>				<th>Subcommittee</th>				<th>Chair</th>				<th>Alternate</th>			</tr>	</thead>	<tbody>"

        Dim thiscountry As String = ""
        Dim myLabel As Label
        If (Not IsNothing(dt)) Then

            For Each CD As DataRow In dt.Rows

                myText += "<tr>"
                If CD("post_on_GMI_org") = True Then
                    myText += "<td>"
                    If Len(Trim(CD("Email").ToString)) > 0 Then
                        myText += " <a href=mailto:" & CD("Email").ToString & ">" & CD("Contact_Name").ToString & "</a>"
                    End If
                    myText += "</td>"
                Else
                    myText += "<td>"
                    myText += CD("Contact_Name").ToString
                    myText += "</td>"
                End If
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


                myText += "</tr>"



            Next
            myText += "</tbody>"
            myLabel = New Label
            myLabel.Text = myText
            tbldelegates2.Controls.Add(myLabel)
        Else
            myText = "An error has occurred and the delegate list cannot be displayed at this time. Please check back at a later time."
            myLabel = New Label
            myLabel.Text = myText
            tbldelegates2.Controls.Add(myLabel)
        End If

    End Function

End Class