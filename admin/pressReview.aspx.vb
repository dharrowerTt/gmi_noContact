Imports System
Imports System.Net
Imports System.Xml
Imports System.Data
Public Class pressReview
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        'GetRSS()
    End Sub

    Private Sub GetRSS()

        'Create a WebRequest
        Dim rssReq As WebRequest = WebRequest.Create("http://news.google.com/rss/search?q=methane&hl=en-US&gl=US&ceid=US:en")

        'Create a Proxy
        Dim px As New WebProxy("http://news.google.com/rss/search?q=methane&hl=en-US&gl=US&ceid=US:en", True)

        'Assign the proxy to the WebRequest
        rssReq.Proxy = px
        'Set the timeout in Seconds for the WebRequest
        rssReq.Timeout = 5000
        Try
            'Get the WebResponse
            Dim rep As WebResponse = rssReq.GetResponse()
            'Read the Response in a XMLTextReader
            Dim xtr As New XmlTextReader(rep.GetResponseStream())
            'Create a new DataSet
            Dim ds As New DataSet()
            'Read the Response into the DataSet
            ds.ReadXml(xtr)
            'Bind the Results to the Repeater
            ''rssRepeater.DataSource = ds.Tables(2)
            ''rssRepeater.DataBind()
        Catch ex As Exception
            Throw ex
        End Try

    End Sub

End Class