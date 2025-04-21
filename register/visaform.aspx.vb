Public Class visaform
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub updateVisa(ByVal s As Object, ByVal e As EventArgs)

        Dim registerObj As clsRegisterVO
        registerObj = New clsRegisterVO

        registerObj.setFullName(fullName.Text)
        registerObj.setPassportNumber(PassportNumber.Text)
        registerObj.setIssuance(Issuance.Text)
        registerObj.setIssuanceDate(IssuanceDate.Text)
        registerObj.setExpirationDate(ExpirationDate.Text)
        registerObj.setBirthDate(BirthDate.Text)
        registerObj.setCitizenship(citizenship.SelectedItem.Value)
        registerObj.setEmbassy(embassy.Text)
        registerObj.setSchedule(schedule.Text)


        Dim EmailAdd As String


        EmailAdd = clsRegisterDAO.editVisa(registerObj)

    End Sub

End Class