Partial Class docReview

    Inherits System.Web.UI.Page

    Private myObjId As String
    Private actID As String
    'Private attachmentActDownload As Literal
    'Private attachmentAct As Literal


    Private activitiesFileAttachments As String = String.Empty
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim attachmentActStr As String = ""
        Dim attachmentActStrX As String = ""

        Dim data As New DAL()
        Dim attaDT As DataTable = data.GetAttachments() 'Attachments
        If attaDT Is Nothing Then

        Else
            For Each doc As DataRow In attaDT.Rows
                Dim fileUrl As String = ""
                Dim fileUrlx As String = ""
                Dim curFile As String = Server.MapPath("/documents/" + doc("Name").ToString)
                Dim curFileMod As String = Server.MapPath("/documents/" + doc("Name_mod").ToString)
                If System.IO.File.Exists(curFile) = True Then
                    fileUrlx = doc("Name").ToString '+ "    (" + doc("year").ToString + ")"
                ElseIf System.IO.File.Exists(curFileMod) = True Then
                    fileUrlx = doc("Name_mod").ToString '+ "   (" + doc("year").ToString + ")"
                Else
                    fileUrl = "<a href='attachmentDownload.aspx?myObjId=" + doc("ID").ToString + "' target='blank'>" + doc("Name").ToString + "</a> " '   (" + doc("year").ToString + ")"
                End If
                If Len(fileUrl) > 0 Then
                    attachmentActStr = attachmentActStr + fileUrl + "<br/>"
                End If
                If Len(fileUrlx) > 0 Then
                    attachmentActStrx = attachmentActStrx + fileUrlx + "<br/>"
                End If
            Next
            attachmentActDownload.Text = attachmentActStr
            attachmentAct.Text = attachmentActStrx
        End If
    End Sub

End Class