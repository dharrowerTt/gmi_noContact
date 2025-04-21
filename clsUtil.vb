Public Class clsUtil
    Private Const username As String = "webadmin@epa.gov"
    'Private Const password As String = "gmI_y2013sgQ6YIdTR9BCjNAmpze1eEMm"
    Private Const password As String = "sm@rtMoon51jVixDSql7vhylpbERQgHHl0D"

    'official site
    'Private Const username As String = "admin@erg.com"
    'Private Const password As String = "Crm2ergBmx90X6ShTevJa6iorcG18p2Hw"

    'sandbox
    'Private Const username As String = "admin@erg.com.gmisandbox"
    'Private Const password As String = "Crm2ergBqChgQS0tcrz3x7Hwp2GERT1Q"

    'notes for developers
    'sforce explorer
    'tools - option
    'endpoint - official site
    'https://www.salesforce.com/services/Soap/u/15.0

    'endpoint - sandbox
    'https://test.salesforce.com/services/Soap/u/15.0


    Private _sessionId As String
    Private _serverUrl As String

    Public Function getsessionId() As String
        Return _sessionId
    End Function

    'Public Function getBinding() As sforce.SforceService
    '    Return binding
    'End Function

    Public Function getserverUrl() As String
        Return _serverUrl
    End Function

    Public Function login() As sforce.SforceService

        If (Common.GetConfiguration("SforceService") = "Off") Then
            HttpContext.Current.Response.Redirect("~/error.aspx?code=307")
        End If

        Dim binding As sforce.SforceService

        'Response.Write("Creating the binding to the web service...<br />")

        binding = New sforce.SforceService
        'binding = New sforce.Sandbox.SforceService
        binding.Timeout = 60000 'Time out after 2 minutes

        Try
            Dim loginRes As sforce.LoginResult

            loginRes = binding.login(username, password)

            'Response.Write(vbCrLf & "The session id is: "     & loginRes.sessionId & vbCrLf)
            'Response.Write(vbCrLf & "The new server url is: " & loginRes.serverUrl & vbCrLf)

            '//Change the binding to the new endpoint
            binding.Url = loginRes.serverUrl

            '//Create a new session header object and set the session id to that returned by the login
            binding.SessionHeaderValue = New sforce.SessionHeader
            binding.SessionHeaderValue.sessionId = loginRes.sessionId

            _sessionId = loginRes.sessionId
            _serverUrl = loginRes.serverUrl

        Catch e As System.Web.Services.Protocols.SoapException
            HttpContext.Current.Response.Redirect("~/error.aspx?code=307")
            'HttpContext.Current.Response.Redirect("siteDetails.aspx?a=" & var)
        Catch ex As Exception
            HttpContext.Current.Response.Redirect("~/error.aspx?code=307")
        End Try

        Return binding

    End Function

    Public Function login2(ByVal var As String) As sforce.SforceService

        If (Common.GetConfiguration("SforceService") = "Off") Then
            'HttpContext.Current.Response.Redirect("~/error.aspx?code=307")
            HttpContext.Current.Response.Redirect("siteDetails.aspx?a=" & var & "#tab3")
        End If

        Dim binding As sforce.SforceService

        'Response.Write("Creating the binding to the web service...<br />")

        binding = New sforce.SforceService
        'binding = New sforce.Sandbox.SforceService
        binding.Timeout = 60000 'Time out after 2 minutes

        Try
            Dim loginRes As sforce.LoginResult

            loginRes = binding.login(username, password)

            'Response.Write(vbCrLf & "The session id is: "     & loginRes.sessionId & vbCrLf)
            'Response.Write(vbCrLf & "The new server url is: " & loginRes.serverUrl & vbCrLf)

            '//Change the binding to the new endpoint
            binding.Url = loginRes.serverUrl

            '//Create a new session header object and set the session id to that returned by the login
            binding.SessionHeaderValue = New sforce.SessionHeader
            binding.SessionHeaderValue.sessionId = loginRes.sessionId

            _sessionId = loginRes.sessionId
            _serverUrl = loginRes.serverUrl

        Catch e As System.Web.Services.Protocols.SoapException
            'HttpContext.Current.Response.Redirect("~/error.aspx?code=307")
            'HttpContext.Current.Response.Redirect("siteDetails.aspx?a=" & var & "#tab3")
        Catch ex As Exception
            'HttpContext.Current.Response.Redirect("~/error.aspx?code=307")
            'HttpContext.Current.Response.Redirect("siteDetails.aspx?a=" & var & "#tab3")
        End Try

        Return binding

    End Function

End Class
