
Public Class login
    Inherits System.Web.UI.Page

    Protected WithEvents userID As System.Web.UI.WebControls.TextBox
    Protected WithEvents userPwd As System.Web.UI.WebControls.TextBox
    Protected WithEvents Form1 As System.Web.UI.HtmlControls.HtmlForm
    Protected WithEvents Button1 As System.Web.UI.WebControls.Button

#Region " Web Form Designer Generated Code "

    'This call is required by the Web Form Designer.
    <System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()

    End Sub

    'NOTE: The following placeholder declaration is required by the Web Form Designer.
    'Do not delete or move it.
    Private designerPlaceholderDeclaration As System.Object

    Private Sub Page_Init(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Init
        'CODEGEN: This method call is required by the Web Form Designer
        'Do not modify it using the code editor.
        InitializeComponent()
    End Sub

#End Region

    Private Sub Page_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        'If Not Me.IsPostBack Then
        '    Session("userid") = ""
        'End If


    End Sub


    Private Sub LoginCheck(ByVal s As Object, ByVal e As CommandEventArgs) Handles Button1.Command

        If (Response.Cookies("failedlogin").Value > 8) Then Response.Redirect("~/error.aspx")

        If CheckLogin(userID.Text, userPwd.Text) Then

            'Session("userName") = "gmiweb13"
            Response.Redirect("index.aspx")
        Else
            Response.Redirect("login.aspx")
        End If


    End Sub


#Region "Private Functions"

    Private Function CheckLogin(ByVal pUserID As String, ByVal pUserPwd As String) As Boolean

        ' new code june08 to prevent sql injection
        Dim sEmail As String = pUserID
        Dim sPwd As String = pUserPwd

        If InStr(sEmail, "'") Or InStr(sPwd, "'") Then
            'Trace.Warn("sql injection: single quote")
            Return False
        ElseIf InStr(sEmail, Chr(34)) Or InStr(sPwd, Chr(34)) Then
            'Trace.Warn("sql injection: double quote")
            Return False
        ElseIf InStr(sEmail, " ") Or InStr(sPwd, " ") Then
            'Trace.Warn("sql injection: space")
            Return False
        End If

        Dim ubo As New User

        If ubo.authenticateUser(pUserID, pUserPwd) Then
            Response.Cookies("gmiuid").Value = pUserID
            ' Session("userid") = pUserID     'Session("userid") = 0
            Response.Cookies("failedlogin").Value = 0
            Return True
        Else
            System.Web.HttpContext.Current.Session("userid") = ""
            Response.Cookies("failedlogin").Value = Response.Cookies("failedlogin").Value + 1
            Return False

        End If

    End Function





#End Region


End Class
