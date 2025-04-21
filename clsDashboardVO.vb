Imports System.Data
Imports System.Data.SqlClient
Imports M2M_Redesign

Public Class clsDashboardVO

    Public cfID As String
    Public Name As String
    Public Email As String
    Public Org As String
    Public Website As String
    Public Country As String
    Public Comment As String
    Public Status As String
    Public Memo As String

    Public todaysDate As String

    Public Function SafeSqlLiteral(ByVal inputSQL As String) As String
        Return inputSQL.Replace("'", "''")
    End Function

    Public Function setcfID(ByVal thisValue As String)
        cfID = thisValue
    End Function

    Public Function getcfID() As String
        Return cfID
    End Function
    Public Function setName(ByVal paraValue As Object)
        Name = resetValue(paraValue)
    End Function

    Public Function getName() As String
        Return Name
    End Function

    Public Function setEmail(ByVal paraValue As Object)
        Email = resetValue(paraValue)
    End Function

    Public Function getEmail() As String
        Return email
    End Function
    Public Function setOrg(ByVal paraValue As Object)
        Org = resetValue(paraValue)
    End Function

    Public Function getOrg() As String
        Return Org
    End Function

    Public Function setWebsite(ByVal paraValue As Object)
        Website = resetValue(paraValue)
    End Function

    Public Function getWebsite() As String
        Return Website
    End Function



    Public Function setCountry(ByVal paraValue As Object)
        country = resetValue(paraValue)
    End Function

    Public Function getCountry() As String
        Return country
    End Function



    Public Function setComment(ByVal paraValue As Object)
        Comment = resetValue(paraValue)
    End Function

    Public Function getComment() As String
        Return Comment
    End Function
    Public Function setStatus(ByVal paraValue As Object)
        Status = resetValue(paraValue)
    End Function

    Public Function getStatus() As String
        Return Status
    End Function
    Public Function setMemo(ByVal paraValue As Object)
        Memo = resetValue(paraValue)
    End Function

    Public Function getMemo() As String
        Return Memo
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

