Imports System.Data
Imports System.Data.SqlClient

Public Class clsActivitiesVO

    Private ActivityID As String

    Private name As String

    Private activityLink As String
    Private year As String
    Private type As Integer
    Private sectors As String
    Private keywords As String
    Private countries As String
    Private description As Integer




    Public Function SafeSqlLiteral(ByVal inputSQL As String) As String
        Return inputSQL.Replace("'", "&rsquo;")
    End Function

    Public Function setResourceId(ByVal thisValue As String)
        ActivityID = thisValue
    End Function

    Public Function getActivityId() As String
        Return ActivityID
    End Function


    Public Function setName(ByVal paraValue As Object)
        name = resetValue(paraValue)
    End Function

    Public Function getName() As String
        Return name
    End Function




    Public Function setSector(ByVal paraValue As Object)
        sectors = resetValue(paraValue)
    End Function

    Public Function getSector() As String
        Return sectors
    End Function


    Public Function setYear(ByVal paraValue As Object)
        year = resetValue(paraValue)
    End Function

    Public Function getYear() As String
        Return year
    End Function

    Public Function getActivityLink() As String
        Return activityLink
    End Function

    Public Function setActivityLink(ByVal paraValue As Object)
        activityLink = resetValue(paraValue)
    End Function



    Public Function setDescription(ByVal paraValue As Object)
        description = resetValue(paraValue)
    End Function

    Public Function getDescription() As String
        Return description
    End Function


    Public Function setActiityType(ByVal paraValue As Object)
        type = resetValue(paraValue)
    End Function

    Public Function getActivityType() As String
        Return type
    End Function





    Public Function setKeywords(ByVal paraValue As Object)
        keywords = resetValue(paraValue)
    End Function

    Public Function getKeywords() As String
        Return keywords
    End Function


    Public Function resetValue(ByVal thisObj As Object) As String
        If (thisObj.Equals(System.DBNull.Value)) Then
            Return String.Empty
        Else
            Return SafeSqlLiteral(thisObj.ToString())
        End If
    End Function

End Class

