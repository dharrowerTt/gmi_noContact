Imports System.Data
Imports System.Data.SqlClient

Public Class clsEventVO

    Private eventId As String

    Private name As String
    Private city As String
    Private state As String
    Private country As String

    Private sector As String

    Private startDate As String
    Private endDate As String

    Private Sponsored As String
    Private Subcommittee As String
    Private Related As String



    Private multiday As String
    Private poc_name As String
    Private poc_phone As String
    Private poc_email As String
    Private organizer As String
    Private organizer_url As String
    Private event_url As String
    Private photo_url As String
    Private eventstatus As String
    Private event_type As String

    Private details As String
    Public Function SafeSqlLiteral(ByVal inputSQL As String) As String
        Return inputSQL.Replace("'", "''")
    End Function

    Public Function setEventId(ByVal thisValue As String)
        eventId = thisValue
    End Function

    Public Function getEventId() As String
        Return eventId
    End Function


    Public Function setName(ByVal paraValue As Object)
        name = resetValue(paraValue)
    End Function

    Public Function getName() As String
        Return name
    End Function

    Public Function setCity(ByVal paraValue As Object)
        city = resetValue(paraValue)
    End Function

    Public Function getCity() As String
        Return city
    End Function


    Public Function setCountry(ByVal paraValue As Object)
        country = resetValue(paraValue)
    End Function

    Public Function getCountry() As String
        Return country
    End Function

    Public Function setSector(ByVal paraValue As Object)
        sector = resetValue(paraValue)
    End Function

    Public Function getSector() As String
        Return sector
    End Function


    Public Function setStartDate(ByVal paraValue As Object)
        startDate = resetValue(paraValue)
    End Function

    Public Function getStartDate() As String
        Return startDate
    End Function

    Public Function setEndDate(ByVal paraValue As Object)
        endDate = resetValue(paraValue)
    End Function

    Public Function getEndDate() As String
        Return endDate
    End Function


    Public Function setSponsored(ByVal paraValue As Object)
        Sponsored = resetValue(paraValue)
    End Function

    Public Function getSponsored() As String
        Return Sponsored
    End Function

    Public Function setEventStatus(ByVal paraValue As Object)
        eventstatus = resetValue(paraValue)
    End Function

    Public Function getEventStatus() As String
        Return eventstatus
    End Function

    Public Function setEventType(ByVal paraValue As Object)
        event_type = resetValue(paraValue)
    End Function

    Public Function getEventType() As String
        Return event_type
    End Function

    Public Function setSubcommittee(ByVal paraValue As Object)
        Subcommittee = resetValue(paraValue)
    End Function

    Public Function getSubcommittee() As String
        Return Subcommittee
    End Function

    Public Function setRelated(ByVal paraValue As Object)
        Related = resetValue(paraValue)
    End Function

    Public Function getRelated() As String
        Return Related
    End Function

    Public Function setState(ByVal paraValue As Object)
        state = resetValue(paraValue)
    End Function

    Public Function getState() As String
        Return state
    End Function

    Public Function setmultiday(ByVal paraValue As Object)
        multiday = resetValue(paraValue)
    End Function

    Public Function getmultiday() As String
        Return multiday
    End Function

    Public Function setpoc_name(ByVal paraValue As Object)
        poc_name = resetValue(paraValue)
    End Function

    Public Function getpoc_name() As String
        Return poc_name
    End Function

    Public Function setpoc_phone(ByVal paraValue As Object)
        poc_phone = resetValue(paraValue)
    End Function

    Public Function getpoc_phone() As String
        Return poc_phone
    End Function


    Public Function setpoc_email(ByVal paraValue As Object)
        poc_email = resetValue(paraValue)
    End Function

    Public Function getpoc_email() As String
        Return poc_email
    End Function

    Public Function setorganizer(ByVal paraValue As Object)
        organizer = resetValue(paraValue)
    End Function

    Public Function getorganizer() As String
        Return organizer
    End Function

    Public Function setorganizer_url(ByVal paraValue As Object)
        organizer_url = resetValue(paraValue)
    End Function

    Public Function getorganizer_url() As String
        Return organizer_url
    End Function

    Public Function setevent_url(ByVal paraValue As Object)
        event_url = resetValue(paraValue)
    End Function

    Public Function getevent_url() As String
        Return event_url
    End Function

    Public Function setphoto_url(ByVal paraValue As Object)
        photo_url = resetValue(paraValue)
    End Function

    Public Function getphoto_url() As String
        Return photo_url
    End Function

    Public Function setDetails(ByVal paraValue As Object)
        details = resetValue(paraValue)
    End Function

    Public Function getDetails() As String
        Return details
    End Function


    Public Function resetValue(ByVal thisObj As Object) As String
        If (thisObj.Equals(System.DBNull.Value)) Then
            Return String.Empty
        Else
            Return SafeSqlLiteral(thisObj.ToString())
        End If
    End Function

End Class

