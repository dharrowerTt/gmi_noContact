Imports System.Data
Imports System.Data.SqlClient
Imports M2M_Redesign

Public Class clsPhoneVO

    Private LogID As String
    Private phoneNumber As String
    Private callerName As String
    Private messageSummary As String
    Private callDate As String
    Private action As String
    Private actionDate As String


    Public Function setLogID(ByVal paraValue As Object)
        setLogID = resetValue(paraValue)
    End Function

    Public Function getLogID() As String
        Return LogID
    End Function

    Public Function setPhoneNumber(ByVal paraValue As Object)
        phoneNumber = resetValue(paraValue)
    End Function

    Public Function getPhoneNumber() As String
        Return phoneNumber
    End Function

    Public Function setCallerName(ByVal paraValue As Object)
        callerName = resetValue(paraValue)
    End Function

    Public Function getCallerName() As String
        Return callerName
    End Function

    Public Function setMessageSummary(ByVal paraValue As Object) As String
        messageSummary = resetValue(paraValue)
    End Function

    Public Function getmessageSummary() As String
        Return messageSummary
    End Function

    Public Function setcallDate(ByVal paraValue As Object)
        callDate = resetValue(paraValue)
    End Function

    Public Function getcallDate() As String
        Return callDate
    End Function

    Public Function setAction(ByVal paraValue As Object)
        action = resetValue(paraValue)
    End Function

    Public Function getAction() As String
        Return action
    End Function
    Public Function setActionDate(ByVal paraValue As Object)
        actionDate = resetValue(paraValue)
    End Function

    Public Function getActionDate() As String
        Return actionDate
    End Function



    Public Function resetValue(ByVal thisObj As Object) As String
        If (thisObj.Equals(System.DBNull.Value)) Then
            Return String.Empty
        Else
            Return SafeSqlLiteral(thisObj.ToString())
        End If
    End Function

    ' Public Shared Widening Operator CType(v As clsChallengeVO) As clsChallengeVO
    'Throw New NotImplementedException()
    'End Operator
End Class

