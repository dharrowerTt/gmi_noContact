Imports System
Imports System.IO

Public Class docDownload
    Inherits System.Web.UI.Page

    Private binding As sforce.SforceService
    Private myObjId As String

    Private fileName As String
    Private filelength As Integer


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        myObjId = Request("myObjId")

        getBinding()
        getFile()

        Response.ContentType = "application/force-download"
        Dim myStr As String
        'myStr = "inline; filename=" + fileName
        myStr = "attachment; filename=" + fileName
        Response.AddHeader("Content-Disposition", myStr)
        Response.AddHeader("Content-Length", filelength)
        Dim myPathForDownload As String
        myPathForDownload = Session("myPath") + "/attachments/" + fileName

       
        Response.TransmitFile(myPathForDownload)
        Response.End()
    End Sub


    Private Function getFile() As Boolean

        'attachment
        Dim qr2 As sforce.QueryResult
        Dim strQuery2 As String = ""
        Dim attachmentSiteStr As String
        attachmentSiteStr = ""

        'strQuery2 = "Select c.VersionData, c.Site__c, c.Activity__c From ContentVersion c"
        'strQuery2 = "Select c.Id, c.FileType, c.CreatedDate, c.Activity__r.Name, c.Activity__c, c.VersionData From ContentVersion c"
        'strQuery2 = "Select c.Id, c.FileType, c.CreatedDate, c.Activity__r.Name, c.Activity__c From ContentVersion c"
        'strQuery2 = "Select c.Id, c.Title, c.FileType, c.CreatedDate, c.Activity__r.Name, c.Activity__c, c.VersionData  From ContentVersion c WHERE c.Title = 'M2M Partnership in China Summary Report.pdf'"

        'strQuery2 = "Select c.Id, c.FileType, c.CreatedDate, c.Activity__r.Name, c.Activity__c, c.VersionData, c.Title  From ContentVersion c"

        strQuery2 = "Select c.Id, c.FileType, c.CreatedDate, c.Activity__r.Name, c.Activity__c, c.VersionData, c.Title  From ContentVersion c where c.Id='" & myObjId & "'"


        'Response.Write(strQuery2)
        qr2 = binding.query(strQuery2)

        If qr2.records Is Nothing Then
            'Response.Write("I am here Records is Nothing.")
        Else
            For i As Integer = 0 To qr2.records.GetUpperBound(0)
                '    'If i = 0 Then  'getting the first file
                Dim myObj2 As sforce.ContentVersion = CType(qr2.records(i), sforce.ContentVersion)
                'Response.Write("my activity name is " & i & "=   " & myObj2.Activity__r.Name)
                'Response.Write("<br />")

                fileName = myObj2.Title

                'fileName = "mytest.pdf"





                '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
                'Decoding
                '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
                'base 64 bytes to base 64 string
                Dim encodedText As String
                encodedText = Convert.ToBase64String(myObj2.VersionData)

                'base 64 string to decoded bytes
                Dim decodedBytes As Byte()
                decodedBytes = Convert.FromBase64String(encodedText)

                'decoded bytes to decodedText
                'decodedText = Encoding.UTF8.GetString(decodedBytes)              

                '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
                'creating the file on the server
                '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
                Dim mypath1 As String
                Dim fs1 As System.IO.FileStream

                fileName = fileName.Replace(" ", "_")


                mypath1 = Server.MapPath("~/attachments/") + fileName


                fs1 = New System.IO.FileStream(mypath1, System.IO.FileMode.Create)

                filelength = decodedBytes.Length

                fs1.Write(decodedBytes, 0, decodedBytes.Length)
                fs1.Close()
            Next

            'Response.Write("I am here.")
            'Response.Write(qr2.records.GetUpperBound(0))
        End If

        Return True
    End Function

        'get existing session or create a new one
    Private Function getBinding() As Boolean

        Dim sessionId As String = IIf(Session("_sessionid") Is Nothing, "", Session("_sessionid"))
        If (sessionId = "" Or sessionId = Nothing) Then
            Dim myUtilObj As clsUtil = New clsUtil()
            binding = myUtilObj.login()
            Dim mySessionId As String = myUtilObj.getsessionId()
            Session("_sessionid") = mySessionId
            Dim myServerUrl As String = myUtilObj.getserverUrl()
            Session("_serverUrl") = myServerUrl
        Else
            binding = New sforce.SforceService()
            binding.Url = Session("_serverUrl")
            binding.SessionHeaderValue = New sforce.SessionHeader
            binding.SessionHeaderValue.sessionId = sessionId
        End If
        Return True
    End Function

End Class