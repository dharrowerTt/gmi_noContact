Imports System.Data
Imports System.Data.SqlClient
Imports M2M_Redesign

Public Class clsRegisterVO


    Private emailAddress As String
    Private fName As String
    Private lName As String
    Private jobTitle As String
    Private organization As String
    Private country As String
    Private phone As String

    Private fullName As String
    Private PassportNumber As String
    Private Issuance As String
    Private IssuanceDate As Date
    Private ExpirationDate As Date
    Private BirthDate As Date
    Private Citizenship As String
    Private Embassy As String
    Private Schedule As String
    Private EventID As Int16
    Private ContactID As Int16

    Private delegateType As String
    Private presenting As String

    Private InternationalPhone As String
    Private DietaryRequirements As String
    Private SpecialNeeds As String
    Private SectorGMF As String
    Private Attend23 As String
    Private Attend24 As String
    Private Attend25 As String
    Private Attend26 As String
    Private Attend27 As String
    Private Awareness As String
    Private ccacmember As String

    Private password As String

    Public Function setEventID(ByVal paraValue As Object)
        EventID = resetValue(paraValue)
    End Function

    Public Function getEventID() As Int16
        Return EventID
    End Function

    Public Function setPassword(ByVal paravalue As Object)
        password = resetValue(paravalue)
    End Function

    Public Function getPassword() As String
        Return password
    End Function

    Public Function setContactID(ByVal paraValue As Object)
        ContactID = resetValue(paraValue)
    End Function

    Public Function getContactID() As Int16
        Return ContactID
    End Function

    Public Function setEmail(ByVal paraValue As Object)
        emailAddress = resetValue(paraValue)
    End Function

    Public Function getEmail() As String
        Return emailAddress
    End Function
    Public Function setfName(ByVal paraValue As Object)
        fName = resetValue(paraValue)
    End Function

    Public Function getfName() As String
        Return fName
    End Function
    Public Function setlName(ByVal paraValue As Object)
        lName = resetValue(paraValue)
    End Function

    Public Function getlName() As String
        Return lName
    End Function
    Public Function setjobTitle(ByVal paraValue As Object)
        jobTitle = resetValue(paraValue)
    End Function

    Public Function getjobTitle() As String
        Return jobTitle
    End Function

    Public Function setorganization(ByVal paraValue As Object)
        organization = resetValue(paraValue)
    End Function

    Public Function getorganization() As String
        Return organization
    End Function
    Public Function setcountry(ByVal paraValue As Object)
        country = resetValue(paraValue)
    End Function

    Public Function getcountry() As String
        Return country
    End Function

    Public Function setphone(ByVal paraValue As Object)
        phone = resetValue(paraValue)
    End Function

    Public Function getphone() As String
        Return phone
    End Function

    Public Function setFullName(ByVal paraValue As Object)
        fullName = resetValue(paraValue)
    End Function

    Public Function getfullName() As String
        Return fullName
    End Function


    Public Function setPassportNumber(ByVal paraValue As Object)
        PassportNumber = resetValue(paraValue)
    End Function

    Public Function getPassportNumber() As String
        Return PassportNumber
    End Function

    Public Function setIssuance(ByVal paraValue As Object)
        Issuance = resetValue(paraValue)
    End Function

    Public Function getIssuance() As String
        Return IssuanceDate
    End Function

    Public Function setIssuanceDate(ByVal paraValue As Object)
        IssuanceDate = resetValue(paraValue)
    End Function

    Public Function getIssuanceDate() As Date
        Return IssuanceDate
    End Function
    Public Function setExpirationDate(ByVal paraValue As Object)
        ExpirationDate = resetValue(paraValue)
    End Function

    Public Function getExpirationDate() As Date
        Return ExpirationDate
    End Function

    Public Function setBirthDate(ByVal paraValue As Object)
        BirthDate = resetValue(paraValue)
    End Function

    Public Function getBirthDate() As Date
        Return BirthDate
    End Function

    Public Function setCitizenship(ByVal paraValue As Object)
        Citizenship = resetValue(paraValue)
    End Function

    Public Function getCitizenship() As String
        Return Citizenship
    End Function

    Public Function setEmbassy(ByVal paraValue As Object)
        Embassy = resetValue(paraValue)
    End Function

    Public Function getEmbassy() As String
        Return Embassy
    End Function

    Public Function setSchedule(ByVal paraValue As Object)
        Schedule = resetValue(paraValue)
    End Function

    Public Function getSchedule() As String
        Return Schedule
    End Function

    Public Function setdelegateType(ByVal paraValue As Object)
        delegateType = resetValue(paraValue)
    End Function

    Public Function getdelegateType() As String
        Return delegateType
    End Function

    Public Function setpresenting(ByVal paraValue As Object)
        presenting = resetValue(paraValue)
    End Function

    Public Function getpresenting() As String
        Return presenting
    End Function

    Public Function getInternationalPhone() As String
        Return InternationalPhone
    End Function


    Public Function setInternationalPhone(ByVal paraValue As Object)
        InternationalPhone = resetValue(paraValue)
    End Function

    Public Function getDietaryRequirements() As String
        Return DietaryRequirements
    End Function
    Public Function setDietaryRequirements(ByVal paraValue As Object)
        DietaryRequirements = resetValue(paraValue)
    End Function

    Public Function getSpecialNeeds() As String
        Return SpecialNeeds
    End Function
    Public Function setSpecialNeeds(ByVal paraValue As Object)
        SpecialNeeds = resetValue(paraValue)
    End Function

    Public Function getSectorGMF() As String
        Return SectorGMF
    End Function

    Public Function setSectorGMF(ByVal paraValue As Object)
        SectorGMF = resetValue(paraValue)
    End Function


    Public Function getAttend23() As String
        Return Attend23
    End Function


    Public Function setAttend23(ByVal paraValue As Object)
        Attend23 = resetValue(paraValue)
    End Function


    Public Function getAttend24() As String
        Return Attend24
    End Function


    Public Function setAttend24(ByVal paraValue As Object)
        Attend24 = resetValue(paraValue)
    End Function

    Public Function getAttend25() As String
        Return Attend25
    End Function
    Public Function setAttend25(ByVal paraValue As Object)
        Attend25 = resetValue(paraValue)
    End Function

    Public Function getAttend26() As String
        Return Attend26
    End Function
    Public Function setAttend26(ByVal paraValue As Object)
        Attend26 = resetValue(paraValue)
    End Function


    Public Function getAttend27() As String
        Return Attend27
    End Function
    Public Function setAttend27(ByVal paraValue As Object)
        Attend27 = resetValue(paraValue)
    End Function

    Public Function getAwareness() As String
        Return awareness
    End Function

    Public Function setAwareness(ByVal paraValue As Object)
        awareness = resetValue(paraValue)
    End Function


    Public Function getccacmember() As String
        Return ccacmember
    End Function

    Public Function setccacmember(ByVal paraValue As Object)
        ccacmember = resetValue(paraValue)
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

