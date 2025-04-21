Imports System.Web
Imports System.Net.Mail

Public Class clsEmail

    Friend Shared Function SendM2MEmail(ByVal arrMail() As String) As Boolean
        Dim bOk As Boolean
        Dim sUrl As String = HttpContext.Current.Request.ServerVariables("SERVER_NAME").ToString()
        Dim message As New MailMessage

        message.From = New MailAddress(arrMail(0))
        'message.To.Clear()
        message.To.Add(arrMail(0))
        message.Subject = arrMail(4)

        If arrMail(1) Is Nothing OrElse arrMail(1).Trim.Length = 0 Then
            'message.CC.Clear()
        Else
            message.CC.Add(arrMail(1))
        End If

        If arrMail(2) Is Nothing OrElse arrMail(2).Trim.Length = 0 Then
            'message.Bcc.Clear()
        Else
            message.Bcc.Add(arrMail(2))
        End If

        message.Body = arrMail(5)
        If arrMail(6) Is Nothing OrElse arrMail(6).Trim.Length = 0 Then
            message.IsBodyHtml = False
        Else
            message.IsBodyHtml = True
        End If

        Try
            If (HttpContext.Current.Request.Url.Host.ToLower() <> "etss704hcmsmtp1") Then
                Dim smtp As New SmtpClient() '(ConfigurationManager.AppSettings("SMTPServer"))
                smtp.Send(message)
                bOk = True
            Else
                bOk = False
            End If

        Catch ex As Exception

            While Not ex.InnerException Is Nothing
                Trace.TraceWarning(ex.InnerException.Message)
                ex = ex.InnerException
            End While
            Common.WrapException(ex)
            bOk = False
        End Try

        Return bOk

    End Function

    Friend Shared Function SendEventEmail(ByVal arrMail() As String) As Boolean
        Dim bOk As Boolean
        Dim sUrl As String = HttpContext.Current.Request.ServerVariables("SERVER_NAME").ToString()
        Dim message As New MailMessage

        message.From = New MailAddress(arrMail(3))
        'message.To.Clear()
        message.To.Add(arrMail(0))
        message.Subject = arrMail(4)

        If arrMail(1) Is Nothing OrElse arrMail(1).Trim.Length = 0 Then
            'message.CC.Clear()
        Else
            message.CC.Add(arrMail(1))
        End If

        If arrMail(2) Is Nothing OrElse arrMail(2).Trim.Length = 0 Then
            'message.Bcc.Clear()
        Else
            message.Bcc.Add(arrMail(2))
        End If

        message.Body = arrMail(5)
        If arrMail(6) Is Nothing OrElse arrMail(6).Trim.Length = 0 Then
            message.IsBodyHtml = False
        Else
            message.IsBodyHtml = True
        End If

        Try
            If (HttpContext.Current.Request.Url.Host.ToLower() <> "etss704hcmsmtp1") Then
                Dim smtp As New SmtpClient() '(ConfigurationManager.AppSettings("SMTPServer"))
                smtp.Send(message)
                bOk = True
            Else
                bOk = False
            End If

        Catch ex As Exception

            While Not ex.InnerException Is Nothing
                Trace.TraceWarning(ex.InnerException.Message)
                ex = ex.InnerException
            End While
            Common.WrapException(ex)
            bOk = False
        End Try

        Return bOk

    End Function

    Friend Shared Function SendContactEmail(ByVal arrMail() As String) As Boolean
        Dim bOk As Boolean
        Dim sUrl As String = HttpContext.Current.Request.ServerVariables("SERVER_NAME").ToString()
        Dim message As New MailMessage

        message.From = New MailAddress(arrMail(3))
        'message.To.Clear()
        message.To.Add(arrMail(0))
        message.Subject = arrMail(4)

        If arrMail(1) Is Nothing OrElse arrMail(1).Trim.Length = 0 Then
            'message.CC.Clear()
        Else
            message.CC.Add(arrMail(1))
        End If

        If arrMail(2) Is Nothing OrElse arrMail(2).Trim.Length = 0 Then
            'message.Bcc.Clear()
        Else
            message.Bcc.Add(arrMail(2))
        End If

        message.Body = arrMail(5)
        If arrMail(6) Is Nothing OrElse arrMail(6).Trim.Length = 0 Then
            message.IsBodyHtml = False
        Else
            message.IsBodyHtml = True
        End If

        Try
            If (HttpContext.Current.Request.Url.Host.ToLower() <> "etss704hcmsmtp1") Then
                Dim smtp As New SmtpClient() '(ConfigurationManager.AppSettings("SMTPServer"))
                smtp.Send(message)
                bOk = True
            Else
                bOk = False
            End If

        Catch ex As Exception

            While Not ex.InnerException Is Nothing
                Trace.TraceWarning(ex.InnerException.Message)
                ex = ex.InnerException
            End While
            Common.WrapException(ex)
            bOk = False
        End Try

        Return bOk

    End Function


    'Friend Shared Function IsValidEmailAddress(ByVal emailAddr) As Boolean

    '    Dim i, localPart, domain, charCode, subdomain, subdomains, tld

    '    Dim validTlds() = {"aero", "biz", "com", "coop", "edu", "gov", "info", "int", "mil", "museum", "name", "net", "org", "pro", _
    '      "ac", "ad", "ae", "af", "ag", "ai", "al", "am", "an", "ao", "aq", "ar", "as", "at", "au", "aw", "az", _
    '      "ba", "bb", "bd", "be", "bf", "bg", "bh", "bi", "bj", "bm", "bn", "bo", "br", "bs", "bt", "bv", "bw", "by", "bz", _
    '      "ca", "cc", "cd", "cf", "cg", "ch", "ci", "ck", "cl", "cm", "cn", "co", "cr", "cu", "cv", "cx", "cy", "cz", _
    '      "de", "dj", "dk", "dm", "do", "dz", "ec", "ee", "eg", "eh", "er", "es", "et", _
    '      "fi", "fj", "fk", "fm", "fo", "fr", _
    '      "ga", "gd", "ge", "gf", "gg", "gh", "gi", "gl", "gm", "gn", "gp", "gq", "gr", "gs", "gt", "gu", "gw", "gy", _
    '      "hk", "hm", "hn", "hr", "ht", "hu", _
    '      "id", "ie", "il", "im", "in", "io", "iq", "ir", "is", "it", _
    '      "je", "jm", "jo", "jp", _
    '      "ke", "kg", "kh", "ki", "km", "kn", "kp", "kr", "kw", "ky", "kz", _
    '      "la", "lb", "lc", "li", "lk", "lr", "ls", "lt", "lu", "lv", "ly", _
    '      "ma", "mc", "md", "mg", "mh", "mk", "ml", "mm", "mn", "mo", "mp", "mq", "mr", "ms", "mt", "mu", "mv", "mw ", "mx", "my", "mz", _
    '      "na", "nc", "ne", "nf", "ng", "ni", "nl", "no", "np", "nr", "nu", "nz", _
    '      "om", _
    '      "pa", "pe", "pf", "pg", "ph", "pk", "pl", "pm", "pn", "pr", "ps", "pt", "pw", "py", _
    '      "qa", _
    '      "re", "ro", "ru", "rw", _
    '      "sa", "sb", "sc", "sd", "se", "sg", "sh", "si", "sj", "sk", "sl", "sm", "sn", "so", "sr", "st", "sv", "sy", "sz", _
    '      "tc", "td", "tf", "tg", "th", "tj", "tk", "tm", "tn", "to", "tp", "tr", "tt", "tv", "tw", "tz", _
    '      "ua", "ug", "uk", "um", "us", "uy", "uz", _
    '      "va", "vc", "ve", "vg", "vi", "vn", "vu", _
    '      "wf", "ws", _
    '      "ye", "yt", "yu", _
    '      "za", "zm", "zw"}

    '    'Check for valid syntax in an email address.

    '    IsValidEmailAddress = True

    '    'Parse out the local part and the domain.

    '    i = InStrRev(emailAddr, "@")
    '    If i <= 1 Then
    '        IsValidEmailAddress = False
    '        Exit Function
    '    End If
    '    localPart = Left(emailAddr, i - 1)
    '    domain = Mid(emailAddr, i + 1)
    '    If Len(localPart) < 1 Or Len(domain) < 3 Then
    '        IsValidEmailAddress = False
    '        Exit Function
    '    End If

    '    'Check for invalid characters in the local part.

    '    For i = 1 To Len(localPart)
    '        charCode = Asc(Mid(localPart, i, 1))
    '        If charCode < 32 Or charCode >= 127 Then
    '            IsValidEmailAddress = False
    '            Exit Function
    '        End If
    '    Next

    '    'Check for invalid characters in the domain.

    '    domain = LCase(domain)
    '    For i = 1 To Len(domain)
    '        charCode = Asc(Mid(domain, i, 1))
    '        If Not ((charCode >= 97 And charCode <= 122) Or (charCode >= 48 And charCode <= 57) Or charCode = 45 Or charCode = 46) Then
    '            IsValidEmailAddress = False
    '            Exit Function
    '        End If
    '    Next

    '    'Check each subdomain.

    '    subdomains = Split(domain, ".")
    '    For Each subdomain In subdomains
    '        If Len(subdomain) < 1 Then
    '            IsValidEmailAddress = False
    '            Exit Function
    '        End If
    '    Next

    '    'Last subdomain should be a TDL.

    '    tld = subdomains(UBound(subdomains))

    '    For i = LBound(validTlds) To UBound(validTlds)
    '        If tld = validTlds(i) Then
    '            Exit Function
    '        End If
    '    Next

    '    IsValidEmailAddress = False

    'End Function
End Class

