Imports System
Imports System.IO

Public Class attachmentDownload
    Inherits System.Web.UI.Page

    Private binding As sforce.SforceService
    Private myObjId As String

    Private fileName As String
    Private filelength As Integer


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        myObjId = Request("myObjId")
        'myObjId = "00PG0000002zwwRMAQ"

        getBinding()
        getFile()

        Response.ContentType = "application/force-download"
        Dim myStr As String
        'myStr = "inline; filename=" + fileName
        myStr = "attachment; filename=" + fileName
        Response.AddHeader("Content-Disposition", myStr)
        Response.AddHeader("Content-Length", filelength)
        Dim myPathForDownload As String
        myPathForDownload = Session("myPath") + "/documents/" + fileName

        Response.TransmitFile(myPathForDownload)
        Response.End()
    End Sub


    Private Function getFile() As Boolean

        'attachment
        Dim qr2 As sforce.QueryResult
        Dim strQuery2 As String = ""
        Dim attachmentSiteStr As String = ""

        strQuery2 = "select id, name, parentid, body, bodylength from attachment " & _
                    " WHERE id ='" & myObjId & "'"

        'Response.Write(strQuery2)
        qr2 = binding.query(strQuery2)

        If qr2.records Is Nothing Then
        Else
            For i As Integer = 0 To qr2.records.GetUpperBound(0)
                Dim myObj2 As sforce.Attachment = CType(qr2.records(i), sforce.Attachment)
                attachmentSiteStr = attachmentSiteStr + myObj2.Name + "<br/>"

                fileName = myObj2.Name
                filelength = myObj2.BodyLength

                '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
                'Decoding
                '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
                'base 64 bytes to base 64 string
                Dim encodedText As String
                encodedText = Convert.ToBase64String(myObj2.Body)

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


                mypath1 = Server.MapPath("~/documents/") + fileName


                fs1 = New System.IO.FileStream(mypath1, System.IO.FileMode.Create)

                filelength = decodedBytes.Length

                fs1.Write(decodedBytes, 0, decodedBytes.Length)
                fs1.Close()


                'Response.Write("Please click <a href='" + mypath2 + "'>" + fileName + "</a>.")

                'Dim fs As System.IO.FileStream
                'fs = New System.IO.FileStream(mypath1, System.IO.FileMode.Open)
                'fs.Read(decodedBytes, 0, decodedBytes.Length)
                'fs.Close()

            Next
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