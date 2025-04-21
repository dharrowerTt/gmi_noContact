Partial Class ParticipateIndex
    Inherits System.Web.UI.Page

#Region " Web Form Designer Generated Code "

    'This call is required by the Web Form Designer.
    <System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()

    End Sub

    'NOTE: The following placeholder declaration is required by the Web Form Designer.
    'Do not delete or move it.
    Private designerPlaceholderDeclaration As System.Object


    Protected WithEvents txtFirstName As System.Web.UI.WebControls.TextBox
    Protected WithEvents txtLastName As System.Web.UI.WebControls.TextBox
    Protected WithEvents txtOrgName As System.Web.UI.WebControls.TextBox
    Protected WithEvents txtOrgWebsite As System.Web.UI.WebControls.TextBox
    Protected WithEvents txtOrgCountry As System.Web.UI.WebControls.TextBox
    Protected WithEvents txtEmail As System.Web.UI.WebControls.TextBox

    Protected WithEvents rfvFirstName As System.Web.UI.WebControls.RequiredFieldValidator
    Protected WithEvents rfvLastName As System.Web.UI.WebControls.RequiredFieldValidator
    Protected WithEvents rfvOrgName As System.Web.UI.WebControls.RequiredFieldValidator
    Protected WithEvents rfvEmail As System.Web.UI.WebControls.RequiredFieldValidator
    Protected WithEvents cvSectors As System.Web.UI.WebControls.CustomValidator

    Protected WithEvents cblSectors As System.Web.UI.WebControls.CheckBoxList
    Protected WithEvents litThankYou As System.Web.UI.WebControls.Literal
    Protected WithEvents btnSubmit As System.Web.UI.WebControls.ImageButton


    Private Sub Page_Init(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Init
        'CODEGEN: This method call is required by the Web Form Designer
        'Do not modify it using the code editor.
        InitializeComponent()
    End Sub

#End Region

    Private Sub Page_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        'rfvFirstName.Enabled = False : rfvLastName.Enabled = False
        'rfvOrgName.Enabled = False : rfvEmail.Enabled = False
    End Sub

    Protected Sub cvSectors_ServerValidate(ByVal source As Object, ByVal args As System.Web.UI.WebControls.ServerValidateEventArgs) Handles cvSectors.ServerValidate
        cvSectors.ErrorMessage = "At least one sector must be checked."
        args.IsValid = IsAnyItemSelected(cblSectors)

    End Sub

    Private Sub SendMail()

        'arrMail : 0 - To, 1 - cc , 2 - bcc, 3 - from, 4 - subject, 5 - body, 6- format, 7 - attachment.

        Dim arrMail(7) As String

        arrMail(0) = GetConfiguration("SupportEmail")    'TO
        arrMail(1) = txtEmail.Text                  'CC
        arrMail(2) = GetConfiguration("SystemEmail")     'BCC
        arrMail(3) = GetConfiguration("SupportEmail")    'FROM 'IIf(txtEmail.Text.Length > 0, txtEmail.Text, arrMail(0))     
        arrMail(4) = "Join the Mailing List"
        arrMail(6) = "HTML"

        Dim sSectors As String = ""

        For Each item As ListItem In cblSectors.Items
            If (item.Selected) Then sSectors += item.Text + "; "
        Next

        If (sSectors.Length > 0) Then
            sSectors = sSectors.Substring(0, sSectors.Length - 2) 'Trim last '; '
        End If


        Dim sName As String = txtFirstName.Text + " " + txtLastName.Text

        Dim sBody As String
        sBody = "<html><style type='text/css'>body{font-family:'Trebuchet MS'; font-size:90%}</style><body>"
        sBody += "<b>" + sName + "</b> would like to join the GMI mailing list <br/>"
        sBody += "Organization: " + txtOrgName.Text + "<br/>"
        sBody += "E-mail: " + txtEmail.Text + "<br/>"
        sBody += "Website: " + txtOrgWebsite.Text + "<br/>"
        sBody += "Country: " + txtOrgCountry.Text + "<br/>"
        sBody += "Sector(s) of Interest: " + sSectors
        sBody += "</body></html>"

        arrMail(5) = sBody

        clsEmail.SendM2MEmail(arrMail)

    End Sub

    Private Sub sendEmail(ByVal s As Object, ByVal e As CommandEventArgs) Handles btnSubmit.Command
        If (Page.IsValid) Then
            SendMail()
            DashCF()
            ResetFields()
        End If

    End Sub
    Protected Sub DashCF()
        Dim dashboardObj As clsDashboardVO
        dashboardObj = New clsDashboardVO


        dashboardObj.setName(txtFirstName.Text + " " + txtLastName.Text)
        dashboardObj.setEmail(txtEmail.Text)
        dashboardObj.setOrg(txtOrgName.Text)
        dashboardObj.setWebsite(txtOrgWebsite.Text)
        dashboardObj.setCountry(txtOrgCountry.Text)
        dashboardObj.setComment("Mailing List")
        dashboardObj.setStatus("New")
        dashboardObj.setMemo("")


        Dim mID As String

        mID = clsdashboardDAO.insertCFData(dashboardObj)



    End Sub
    Private Sub ResetFields()
        txtFirstName.Text = String.Empty
        txtLastName.Text = String.Empty
        txtEmail.Text = String.Empty
        txtOrgWebsite.Text = String.Empty
        txtOrgCountry.Text = String.Empty
        txtOrgName.Text = String.Empty
        For Each item As ListItem In cblSectors.Items
            item.Selected = False
        Next
        btnSubmit.Visible = False
        litThankYou.Visible = True

    End Sub

    Private Function IsAnyItemSelected(ByVal l As ListControl) As Boolean
        Dim retVal As Boolean
        For Each item As ListItem In l.Items
            If (item.Selected) Then
                retVal = True
                Exit For
            End If
        Next

        Return retVal

    End Function

End Class
