Imports System.Data
Imports System.Data.SqlClient
Imports System.Configuration
Imports globalmethane2020.DAL

Partial Class project_network_details
    Inherits System.Web.UI.Page

    Private Sub Page_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        CheckForRegisteredUsers()
        getDetails()

    End Sub

    Private Sub CheckForRegisteredUsers()
        ' Get the sfOrgID parameter from the URL
        Dim sfOrgID As String = Server.HtmlEncode(Request.QueryString("ID"))

        ' Ensure sfOrgID has a value before proceeding
        If String.IsNullOrEmpty(sfOrgID) Then
            Return
        End If

        ' SQL query to check for contacts with a non-null pnContactPasswordHash
        Dim query As String = "SELECT o.sfOrgID, o.pnOrgID, c.pnContactFirstName " &
                          "FROM pn_orgs o " &
                          "INNER JOIN pn_contacts c ON o.pnOrgID = c.pnOrgID " &
                          "WHERE o.sfOrgID = @sfOrgID AND c.pnContactPasswordHash IS NOT NULL"

        ' Connect to the database and execute the query
        Using conn As New SqlConnection(Common.GetConnString())
            conn.Open()

            Using cmd As New SqlCommand(query, conn)
                cmd.Parameters.AddWithValue("@sfOrgID", sfOrgID)

                Using reader As SqlDataReader = cmd.ExecuteReader()
                    ' Check if there are any results indicating a registered user
                    If reader.HasRows Then
                        ' Assuming pnOrgID is required for the link
                        reader.Read()
                        Dim orgID As String = reader("pnOrgID").ToString()

                        ' Script to insert the alert inside the NewAlert div
                        Dim alertScript As String = $"<script type='text/javascript'>
                        window.onload = function() {{
                            var alertDiv = document.getElementById('NewAlert');
                            alertDiv.innerHTML = '<strong>Enhanced Profile Is Available!</strong><br><p>This Project Network member has provided additional details about their expertise in specific sectors and countries and highlights of their experience supporting methane mitigation activities.</p><p>The information provided below is for reference purposes only. This information reflects details requested from members when they originally joined the Project Network and is likely to be out-of-date.</p><a href=""organization.aspx?id={orgID}"">View the latest information for this Project Network member</a>.';
                            alertDiv.style.backgroundColor = '#d4edda';
                            alertDiv.style.color = '#155724';
                            alertDiv.style.padding = '10px';
                            alertDiv.style.textAlign = 'center';
                            alertDiv.style.display = 'block';
                        }};
                        </script>"

                        ' Register the script to run when the page loads
                        ClientScript.RegisterStartupScript(Me.GetType(), "alertScript", alertScript)
                    End If
                End Using
            End Using
        End Using
    End Sub



    Private Function getDetails() As Boolean

        Dim myId As String

        myId = Server.HtmlEncode(Request.QueryString("ID"))
        Dim data As New DAL() ' call DAL class
        Dim dt As DataTable = data.GetPartnerDetailsbyID(myId)
        Dim mySectorInfo As String = ""
        Dim iteration As Integer = 0
        For Each org As DataRow In dt.Rows ' loop through all the records in the result, which should be just one organization

            
            If iteration = 0 Then
                name.Text = org("Name").ToString
                Page.Title = name.Text & " | Project Network Member | Global Methane Initiative"
                If Len(org("name_in_native_language").ToString) > 0 Then
                    name.Text += " (" & org("name_in_native_language").ToString & ")"

                End If
                If org("organization_category").ToString <> "" Then
                    orgType.Text = "<td>" & org("Organization_Category").ToString & "</td>"
                Else
                    orgType.Text = "<td>&nbsp;</td>"
                End If

                If org("Expertise").ToString <> "" Then
                    expertise.Text = "<td><p>" & org("Expertise").ToString + "</p></td>"
                Else
                    expertise.Text = "<td>&nbsp;</td>"
                End If
                If org("Website").ToString <> "" Then
                    website.Text = "<td><a href='" + org("Website").ToString + "'>" + org("Website").ToString + "</a></td>"
                Else
                    website.Text = "<td>&nbsp;</td>"
                End If
                If org("Project_Network_Areas_of_Interest").ToString <> "" Then
                    AOI.Text = "<td>" & org("Project_Network_Areas_of_Interest").ToString & "</td>" 'Populating areas of interest from the organization field
                    AOI.Text = AOI.Text.Replace(";", "; ")
                Else
                    AOI.Text = "<td>&nbsp;</td>"
                End If

                If org("Project_Network_Geographic_Interest").ToString <> "" Then
                    AOGI.Text = "<td>" & org("Project_Network_Geographic_Interest").ToString & "</td>"
                    AOGI.Text = AOGI.Text.Replace(";", "; ")
                Else
                    AOGI.Text = "<td>&nbsp;</td>"
                End If
            End If
            iteration = 1
            Dim myContactInfo As String
            myContactInfo = ""

            For Each contact As DataRow In dt.Rows ' loop through all the records in the result, which should give you all the contacts

                Dim myContactId As String
                myContactId = contact("contactID").ToString
                If contact("LastName").ToString <> "" And contact("FirstName").ToString <> "" Then
                    myContactInfo += contact("LastName").ToString & ", " & contact("FirstName").ToString
                    myContactInfo += "<br />Email: " & contact("Email").ToString
                    myContactInfo += "<br />Phone: " & contact("Phone").ToString & "<br /><br />"
                End If


            Next
            If myContactInfo = "" Then
                myContactInfo = myContactInfo & "This Project Network Member has not published any point of contact information.<br /><br />"
            End If

            lblContacts.Text = myContactInfo
            Exit For
        Next

        Return True
    End Function

End Class
