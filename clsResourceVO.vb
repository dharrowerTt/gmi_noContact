Imports System.Data
Imports System.Data.SqlClient

Public Class clsResourceVO

    Private ResourceId As String

    Private resourcename As String
    Private shortname As String
    Private author As String
    Private resourceLink As String
    Private resourcefiledate As String
    Private resourcePages As String
    Private resourcesize As String
    Private resourceTopic As String
    Private resourceSource As String
    Private resourcecategoryID As Integer
    Private resourcecategory As String
    Private grouping As String
    Private filetype As String
    Private filetypeid As Integer

    Public resourceImage As String
    Public AltImg As String
    Private status As String
    Private resourceparent As Integer

    Private sector As String
    Private eventName As Integer
    Private country As Integer

    Private Sidebar As String

    Private Topic As String


    Public Function SafeSqlLiteral(ByVal inputSQL As String) As String
        Return inputSQL.Replace("'", "&rsquo;")
    End Function

    Public Function setResourceId(ByVal thisValue As String)
        ResourceId = thisValue
    End Function

    Public Function getResourceId() As String
        Return ResourceId
    End Function


    Public Function setName(ByVal paraValue As Object)
        resourcename = resetValue(paraValue)
    End Function

    Public Function getName() As String
        Return resourcename
    End Function

    Public Function setAuthor(ByVal paraValue As Object)
        author = resetValue(paraValue)
    End Function

    Public Function getAuthor() As String
        Return author
    End Function
    Public Function setShortName(ByVal paraValue As Object)
        shortname = resetValue(paraValue)
    End Function

    Public Function getShortName() As String
        Return shortname
    End Function



    Public Function setCountry(ByVal paraValue As Object)
        country = resetValue(paraValue)
    End Function

    Public Function getCountry() As String
        Return country
    End Function

    Public Function setEventName(ByVal paraValue As Object)
        eventName = resetValue(paraValue)
    End Function

    Public Function getEventName() As String
        Return eventName
    End Function

    Public Function setSector(ByVal paraValue As Object)
        sector = resetValue(paraValue)
    End Function

    Public Function getSector() As String
        Return sector
    End Function


    Public Function setResourceFileDate(ByVal paraValue As Object)
        resourcefiledate = resetValue(paraValue)
    End Function

    Public Function getResourceFileDate() As String
        Return resourcefiledate
    End Function

    Public Function getResourceLink() As String
        Return resourceLink
    End Function

    Public Function setResourceLink(ByVal paraValue As Object)
        resourceLink = resetValue(paraValue)
    End Function

    Public Function setResourceImage(ByVal paraValue As Object) As String
        resourceImage = resetValue(paraValue)
    End Function

    Public Function getResourceImage() As String
        Return resourceImage
    End Function

    Public Function setAltImage(ByVal paraValue As Object) As String
        AltImg = resetValue(paraValue)
    End Function

    Public Function getAltImg() As String
        Return AltImg
    End Function

    Public Function setResourceTopic(ByVal paraValue As Object)
        resourceTopic = resetValue(paraValue)
    End Function

    Public Function getResourceTopic() As String
        Return resourceTopic
    End Function

    Public Function setSource(ByVal paraValue As Object)
        resourceSource = resetValue(paraValue)
    End Function

    Public Function getSource() As String
        Return resourceSource
    End Function

    Public Function setFileTypeID(ByVal paraValue As Object)
        filetypeid = resetValue(paraValue)
    End Function

    Public Function getFileTypeID() As String
        Return filetypeid
    End Function


    Public Function setFileType(ByVal paraValue As Object)
        filetype = resetValue(paraValue)
    End Function

    Public Function getFileType() As String
        Return filetype
    End Function

    Public Function setTopic(ByVal paraValue As Object)
        Topic = resetValue(paraValue)
    End Function

    Public Function getTopic() As String
        Return Topic
    End Function
    Public Function setSideBar(ByVal paraValue As Object)
        Sidebar = resetValue(paraValue)
    End Function

    Public Function getSideBar() As String
        Return Sidebar
    End Function
    Public Function setResourceCategoryID(ByVal paraValue As Object)
        resourcecategoryID = resetValue(paraValue)
    End Function

    Public Function getResourceCategoryID() As String
        Return resourcecategoryID
    End Function


    Public Function getResourceCategory() As String
        Return resourcecategory
    End Function
    Public Function setResourceCategory(ByVal paraValue As Object) As String
        resourcecategory = resetValue(paraValue)
    End Function

    Public Function setResourcePages(ByVal paraValue As Object)
        resourcePages = resetValue(paraValue)
    End Function

    Public Function getResourcePages() As String
        Return resourcePages
    End Function

    Public Function setStatus(ByVal paraValue As Object)
        status = resetValue(paraValue)
    End Function

    Public Function getStatus() As String
        Return status
    End Function

    Public Function setResourceSize(ByVal paraValue As Object)
        resourcesize = resetValue(paraValue)
    End Function

    Public Function getResourceSize() As String
        Return resourcesize
    End Function
    Public Function setGrouping(ByVal paraValue As Object)
        grouping = resetValue(paraValue)
    End Function

    Public Function getGrouping() As String
        Return grouping
    End Function
    Public Function setResourceParent(ByVal paraValue As Object)
        resourceparent = resetValue(paraValue)
    End Function

    Public Function getResourceParent() As String
        Return resourceparent
    End Function

    Public Function resetValue(ByVal thisObj As Object) As String
        If (thisObj.Equals(System.DBNull.Value)) Then
            Return String.Empty
        Else
            Return SafeSqlLiteral(thisObj.ToString())
        End If
    End Function

End Class

