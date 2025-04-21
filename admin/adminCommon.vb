'Imports System.Security.Cryptography
Imports System.Data.SqlClient
Friend Module AdminCommon

    

    Friend Function getPartnerCountriesWithSelectOne() As DataView
        Dim dv As DataView = Nothing
        dv = clsLookup.GetPartnerCountries()

        Dim row As DataRow
        row = dv.Table.NewRow

        'row("CountryName") = "-1"
        row("CountryName") = "Select One"

        dv.Table.Rows.InsertAt(row, 0)
        dv.Table.AcceptChanges()
        Return dv

    End Function

    Friend Function getAllOrgsWithSelectOne(ByRef pMemberType As Integer) As DataView

        Dim dv As DataView = Nothing
        dv = clsLookup.GetAllOrganizations(pMemberType)
        Dim row As DataRow
        row = dv.Table.NewRow
        row("organizationID") = "-1"
        row("name") = "Select One"
        dv.Table.Rows.InsertAt(row, 0)
        dv.Table.AcceptChanges()
        Return dv

    End Function

    Friend Function getOrgsWithSelectOne(ByRef pCountry As String) As DataView

        Dim dv As DataView = Nothing
        dv = clsLookup.GetOrganizations(pCountry)
        Dim row As DataRow
        row = dv.Table.NewRow
        row("organizationID") = "-1"
        row("name") = "Select One"
        dv.Table.Rows.InsertAt(row, 0)
        dv.Table.AcceptChanges()
        Return dv

    End Function

    Friend Function convertDate(ByVal pDate As String) As String
        ' this function converts a date the user enters in dd/mm/yyyy format to an interal
        ' format compatable with 'american' date format of the db, mm/dd/yyyy

        ' return either a valid date OR an error message. The caller needs to verify the returned
        ' value is a date before using it as a date. If it's not a valid date, then it's an error message.

        Dim i As Integer
        Dim j As Integer
        Dim strMonth As String
        Dim strDay As String
        Dim strYear As String

        i = InStr(pDate, "/")
        If i < 2 Then
            ' if missing slashes or if a slash is first character
            convertDate = "Invalid date format"
            Exit Function
        End If
        strDay = Left(pDate, i - 1)
        j = InStr(i + 1, pDate, "/")
        If j = 0 Or j < i + 1 Or j = Len(pDate) Then
            ' if missing 2nd slash, if two slashes entered together, or 2nd slash is last character
            convertDate = "Invalid date format"
            Exit Function
        End If
        strMonth = Mid(pDate, i + 1, j - i - 1)
        strYear = Mid(pDate, j + 1)
        convertDate = strMonth & "/" & strDay & "/" & strYear

    End Function

    Friend Function missingRequiredData(ByVal pValue As String, ByVal pFieldName As String, ByVal pLabel As Label) As Boolean
        If Len(pValue) = 0 Then
            pLabel.Text = "Please enter a " & pFieldName & ". This is a required field."
            pLabel.Visible = True
            Return True
        Else
            Return False
        End If
    End Function

    Friend Function missingRequiredData(ByVal pValue As String, ByVal pFieldName As String, ByVal pLabel As Label, ByVal pLabel2 As Label) As Boolean
        If Len(pValue) = 0 Then
            pLabel.Text = "Please enter a " & pFieldName & ". This is a required field."
            pLabel.Visible = True
            pLabel2.Text = pLabel.Text
            pLabel2.Visible = True
            Return True
        Else
            Return False
        End If
    End Function

    Friend Function saveCommittee(ByVal pR1 As RadioButton, ByVal pR2 As RadioButton, ByVal pR3 As RadioButton, ByVal pR4 As RadioButton) As Integer
        Select Case True
            Case pR1.Checked
                Return 1
            Case pR2.Checked
                Return 2
            Case pR3.Checked
                Return 3
            Case Else
                Return 4
        End Select
    End Function

    Friend Sub checkCommittee(ByVal pR1 As RadioButton, ByVal pR2 As RadioButton, ByVal pR3 As RadioButton, ByVal pR4 As RadioButton, ByVal pValue As Integer)
        Select Case pValue
            Case 1
                pR1.Checked = True
            Case 2
                pR2.Checked = True
            Case 3
                pR3.Checked = True
            Case Else
                pR4.Checked = True
        End Select
    End Sub

    Friend Function myNullCheck0(ByVal pValue) As String
        If IsDBNull(pValue) Then
            Return "0"
        ElseIf pValue = "" Then
            Return "0"
        Else
            Return pValue
        End If
    End Function
End Module


