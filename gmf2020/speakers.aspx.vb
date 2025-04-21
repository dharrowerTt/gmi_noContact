Public Class speakers
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        getSpeakerDetails()


    End Sub


    Private Function getSpeakerDetails() As Boolean

        Dim data As New DAL
        Dim dt As DataTable = data.GetSpeakerList()
        Dim mySize As Integer = 0


        If IsNothing(dt) = False Then
            mySize = dt.Rows.Count
        End If


        If (mySize > 0) Then


            For Each org In dt.Rows

                litStuff.Text &= "<div class='col-sm-4'><div class='speakertile' style='background:#fafafa;border:1px solid #f8f8f8;margin:15px;padding:10px'><img src='speakers/" & org("fName") & org("lName") & "/image/" & org("profilepic") & "' alt='Profile Image' style='float:left; margin-right:10px; margin-bottom:10px; max-width:80px;'><h4>" & org("fname") & " " & org("lname") & "</h4><em>" & org("jobTitle") & "</em><br><strong>" & org("organization") & "</strong><p>" & org("bio") & "</p></div></div>"


            Next

        Else

        End If
        Return True

    End Function

End Class