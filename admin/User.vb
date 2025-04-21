Public Class User

    Public Function authenticateUser(ByVal pUserID As String, ByVal pUserPwd As String) As Boolean

        'Dim wUser As clsUser

        Select Case LCase(pUserID)
            Case "gmiweb13"
                If LCase(pUserPwd) = "he!lo$z" Then
                    Return True
                Else
                    Return False
                End If
            'Case "m2mconf$925"
            '    If LCase(pUserPwd) = "conf!925" Then
            '        Return True
            '    Else
            '        Return False
            '    End If
            Case Else
                Return False
                Exit Function
        End Select
        '       wUser.setStrUser(pUserID)
        '       Return wUser
        Return True

    End Function

End Class
