Imports System.Text.RegularExpressions

Public Class clsValidation


    Friend Shared Function ValidateEmail(ByVal email As String, ByVal bEmptyOk As Boolean) As Boolean

        ''' 04/13/2006: Ported from old M2M application......


        Dim bRet As Boolean


        If email.Trim.Length = 0 Then
            If bEmptyOk Then
                Return True
            Else
                Return False
            End If

        Else

            Dim re As Regex
            Dim matches As MatchCollection

            re = New Regex("(\w+\-?){1,}(\.\w+\-?){0,}@\[?(\w+\-?){1,}(\.\w+){1,}\]?")

            ''regex.pattern = "([a-z]+|[A-Z]+)\.*@(([a-z]+|[A-Z]+)\.([a-z]+|[A-Z]+))+"

            '' Simple pattern matching for emails.
            ''regex.pattern = "\w+\.*@\[?\w+\.\w+\]?"
            ''regex.pattern = "\w+\-*\w+\.*@\[?\w+\-*\.\w+\]?"


            ''set matches = regEx.execute("sadasa@as_db.asdc")
            matches = re.Matches(email)

            '' There should be exact one match.
            If matches.Count = 1 Then
                ''Response.Write "Valid Email."
                bRet = True
            Else
                bRet = False
            End If

            matches = Nothing
            re = Nothing

            Return bRet

        End If

    End Function

End Class
