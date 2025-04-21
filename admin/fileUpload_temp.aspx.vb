Imports System
Imports System.IO
Imports System.Text
Imports System.Text.RegularExpressions


Public Class WebForm1
    Inherits System.Web.UI.Page



    Protected WithEvents txtResourceLink As System.Web.UI.WebControls.TextBox
    Protected WithEvents txtResourceType As System.Web.UI.WebControls.TextBox


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub UploadFile(sender As Object, e As EventArgs)
        Dim folderPath As String = Server.MapPath("~/documents/")

        'Check whether Directory (Folder) exists.
        If Not Directory.Exists(folderPath) Then
            'If Directory (Folder) does not exists. Create it.
            Directory.CreateDirectory(folderPath)
        End If

        Dim fileok As Boolean = False
        If resourceLink.HasFile Then
            Dim ext As String

            ext = Path.GetExtension(resourceLink.FileName).ToLower()
            Dim allowedExtnsions As String() = {".jpg", ".jpeg", ".pdf", ".gif", ".doc", ".docx", ".xls", ".xlsx", ".ppt", ".pptx"}
            For i As Integer = 0 To allowedExtnsions.Length - 1
                If ext = allowedExtnsions(i) Then
                    fileok = True
                End If
            Next
            If fileok = True Then
                Try
                    'Save the File to the Directory (Folder).
                    resourceLink.SaveAs(folderPath & Path.GetFileName(resourceLink.FileName))

                    

                    'Display the success message.
                    lblMessage.Text = Path.GetFileName(resourceLink.FileName) + " has been uploaded."
                Catch ex As Exception
                    lblMessage.Text = ex.Message.ToString()
                End Try

                Dim numSize As Double = resourceLink.PostedFile.ContentLength
                Dim kbSize As Double = numSize / 1024
                Dim mbSize As Double = 0

                If (kbSize) > 500 Then
                    mbSize = numSize / 1048576
                    txtResourceSize.Text = Math.Round(mbSize, 1, MidpointRounding.AwayFromZero) & " MB"
                Else
                    txtResourceSize.Text = Math.Round(kbSize, 1, MidpointRounding.AwayFromZero) & " KB"
                End If

                txtResourceLink.Text = "/documents/" & resourceLink.FileName
                txtResourceType.Text = resourceLink.PostedFile.ContentType
                txtFileType.text = ext


            Else
                lblMessage.Text = "Cannot accpt files of this type."

            End If

        Else
            lblMessage.Text = "Please select a file and try again."
        End If

        

    End Sub

    Protected Function isPDF(ByVal myFile As HttpPostedFile) As Boolean
        Dim r As New System.IO.BinaryReader(myFile.InputStream)
        Dim fileclass As String = String.Empty
        Dim buffer As Byte
        Try
            buffer = r.ReadByte()
            fileclass = buffer.ToString
            buffer = r.ReadByte
            fileclass &= buffer.ToString
        Catch ex As Exception
            Throw ex
        Finally
            r.Close()
        End Try
        Return (fileclass = "3780")


        ' 208207  =  .doc
        ' 7173   =   .gif
        ' 255216   =   .jpg
        ' 6677   =   .bmp
        ' 13780   =   .png
    End Function

    Protected Function CountPdfPages(ByVal FName As String) As Integer
        Dim Count As Integer = 0
        'Open the file
        Dim fstream As New IO.FileStream(FName, IO.FileMode.Open, IO.FileAccess.Read)

        Dim stream As New IO.StreamReader(fstream)
        'Read the contents
        Dim strContents As String = "" '= fstream.ReadtoEnd
        'Count the Total page cound
        Dim reg As System.Text.RegularExpressions.Regex = _
         New System.Text.RegularExpressions.Regex("/Type\s*/Page[^s]")

        Dim mat As System.Text.RegularExpressions.MatchCollection = reg.Matches(strContents)
        Count = mat.Count

        Return Count

    End Function


End Class