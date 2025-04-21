Imports System.Data
Imports System.Data.SqlClient
Imports M2M_Redesign

Public Class clsChallengeVO

    Private challengeID As String
    Private salutation As String
    Private firstName As String
    Private lastName As String

    Private organization As String
    Private category As String
    Private actionType As String

    Private todaysDate As String
    Private status As String

    Private heardAbout As String

    Private phoneNumber As String
    Private emailAddress As String
    Private gmiRelationship As String

    Private exampleTextarea As String
    Private commitment As String
    Private gmcCode As String

    Private titleQ As String
    Private actionTypeQ As String
    Private partnerQ As String
    Private whereQ As String
    Private styleQ As String
    Private trackPQ As String
    Private trackSQ As String
    Private reductionQ As String
    Private codeCheck As String

    Public Function setcodeCheck(ByVal paraValue As Object)
        codeCheck = resetValue(paraValue)
    End Function

    Public Function getcodeCheck() As String
        Return codeCheck
    End Function


    Public Function settitleQ(ByVal paraValue As Object)
        titleQ = resetValue(paraValue)
    End Function

    Public Function gettitleQ() As String
        Return titleQ
    End Function

    Public Function setactionTypeQ(ByVal paraValue As Object)
        actionTypeQ = resetValue(paraValue)
    End Function

    Public Function getactionTypeQ() As String
        Return actionTypeQ
    End Function

    Public Function setpartnerQ(ByVal paraValue As Object)
        partnerQ = resetValue(paraValue)
    End Function

    Public Function getpartnerQ() As String
        Return partnerQ
    End Function



    Public Function setwhereQ(ByVal paraValue As Object)
        whereQ = resetValue(paraValue)
    End Function

    Public Function getwhereQ() As String
        Return whereQ
    End Function

    Public Function setstyleQ(ByVal paraValue As Object)
        styleQ = resetValue(paraValue)
    End Function

    Public Function getstyleQ() As String
        Return styleQ
    End Function

    Public Function settrackPQ(ByVal paraValue As Object)
        trackPQ = resetValue(paraValue)
    End Function

    Public Function gettrackPQ() As String
        Return trackPQ
    End Function
    Public Function settrackSQ(ByVal paraValue As Object)
        trackSQ = resetValue(paraValue)
    End Function

    Public Function gettrackSQ() As String
        Return trackSQ
    End Function
    Public Function setreductionQ(ByVal paraValue As Object)
        reductionQ = resetValue(paraValue)
    End Function

    Public Function setcommitment(ByVal paraValue As Object)
        exampleTextarea = resetValue(paraValue)
    End Function

    Public Function getreductionQ() As String
        Return reductionQ
    End Function
    Public Function getcommitment() As String
        Return exampleTextarea
    End Function





    Public Function SafeSqlLiteral(ByVal inputSQL As String) As String
        Return inputSQL.Replace("'", "''")
    End Function

    Public Function setchallengeID(ByVal thisValue As String)
        challengeID = thisValue
    End Function

    Public Function getchallengeID() As String
        Return challengeID
    End Function
    Public Function setsalutation(ByVal paraValue As Object)
        salutation = resetValue(paraValue)
    End Function

    Public Function getsalutation() As String
        Return salutation
    End Function

    Public Function setfirstName(ByVal paraValue As Object)
        firstName = resetValue(paraValue)
    End Function

    Public Function getfirstName() As String
        Return firstName
    End Function

    Public Function setlastName(ByVal paraValue As Object)
        lastName = resetValue(paraValue)
    End Function

    Public Function getlastName() As String
        Return lastName
    End Function

    Public Function setheardAbout(ByVal paraValue As Object)
        heardAbout = resetValue(paraValue)
    End Function

    Public Function getheardAbout() As String
        Return heardAbout
    End Function

    Public Function setorganization(ByVal paraValue As Object)
        organization = resetValue(paraValue)
    End Function

    Public Function getorganization() As String
        Return organization
    End Function

    Public Function setactionType(ByVal paraValue As Object)
        actionType = resetValue(paraValue)
    End Function

    Public Function getactionType() As String
        Return actionType
    End Function
    Public Function setactionCategory(ByVal paraValue As Object)
        category = resetValue(paraValue)
    End Function
    Public Function getactionCategory() As String
        Return category
    End Function
    Public Function settodaysDate(ByVal paraValue As Object)
        todaysDate = resetValue(paraValue)
    End Function

    Public Function gettodaysDate() As String
        Return todaysDate
    End Function


    Public Function setStatus(ByVal paraValue As Object)
        status = resetValue(paraValue)
    End Function

    Public Function getStatus() As String
        Return status
    End Function


    Public Function setphoneNumber(ByVal paraValue As Object)
        phoneNumber = resetValue(paraValue)
    End Function

    Public Function getphoneNumber() As String
        Return phoneNumber
    End Function


    Public Function setemailAddress(ByVal paraValue As Object)
        emailAddress = resetValue(paraValue)
    End Function

    Public Function getemailAddress() As String
        Return emailAddress
    End Function



    Public Function setgmiRelationship(ByVal paraValue As Object)
        gmiRelationship = resetValue(paraValue)
    End Function

    Public Function getgmiRelationship() As String
        Return gmiRelationship
    End Function



    Public Function setcommitmentX(ByVal paraValue As Object)
        commitment = resetValue(paraValue)
    End Function

    Public Function getcommitmentX() As String
        Return commitment
    End Function

    Public Function setgmcCode(ByVal paraValue As Object)
        gmcCode = resetValue(paraValue)
    End Function

    Public Function getgmcCode() As String
        Return gmcCode
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

