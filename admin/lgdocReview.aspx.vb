Partial Class lgdocReview

    Inherits System.Web.UI.Page

    Private myObjId As String
    Private actID As String
    'Private LgattachmentActDownload As Literal
    'Private LGattachmentAct As Literal

    Private activitiesFileAttachments As String = String.Empty


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim attachmentActStr As String = ""
        Dim attachmentActStrX As String = ""

        Dim data As New DAL()
        Dim attaDT As DataTable = data.GetLgAttachments() 'Attachments
        If attaDT Is Nothing Then

        Else
            For Each doc As DataRow In attaDT.Rows
                Dim fileUrl As String = ""
                Dim fileUrlx As String = ""
                Dim curFile As String = Server.MapPath("/documents/" + doc("Title").ToString)
                Dim curFileMod As String = Server.MapPath("/documents/" + doc("Title_mod").ToString)
                If System.IO.File.Exists(curFile) = True Then
                    fileUrlx = doc("Title").ToString + "    (" + doc("year").ToString + ")"
                ElseIf System.IO.File.Exists(curFileMod) = True Then
                    fileUrlx = doc("Title_mod").ToString + "   (" + doc("year").ToString + ")"
                Else
                    fileUrl = "<a href='docDownload.aspx?myObjId=" + doc("ID").ToString + "' target='blank'>" + doc("Title").ToString + "</a>    (" + doc("year").ToString + ")"
                End If
                If Len(fileUrl) > 0 Then
                    attachmentActStr = attachmentActStr + fileUrl + "<br/>"
                End If
                If Len(fileUrlx) > 0 Then
                    attachmentActStrX = attachmentActStrX + fileUrlx + "<br/>"
                End If
            Next
            LgattachmentActDownload.Text = attachmentActStr
            LGattachmentAct.Text = attachmentActStrX
        End If
    End Sub

End Class