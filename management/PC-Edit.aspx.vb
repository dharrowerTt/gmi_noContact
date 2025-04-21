Imports System.IO

Public Class PC_Edit
    Inherits System.Web.UI.Page

    Private Const BasePath As String = "/partners/include"
    Private Property CurrentPath As String
        Get
            Return If(ViewState("CurrentPath"), Server.MapPath(BasePath))
        End Get
        Set(value As String)
            ViewState("CurrentPath") = value
        End Set
    End Property

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            LoadDirectoryContents(CurrentPath)
        End If
    End Sub

    Private Sub LoadDirectoryContents(path As String)
        lblCurrentPath.Text = path.Replace(Server.MapPath(BasePath), BasePath)

        Dim directories = Directory.GetDirectories(path).Select(Function(d) New With {.Name = System.IO.Path.GetFileName(d), .Type = "Directory", .Path = d}).ToList()
        Dim files = Directory.GetFiles(path, "*.html").Select(Function(f) New With {.Name = System.IO.Path.GetFileName(f), .Type = "File", .Path = f}).ToList()

        gvFiles.DataSource = directories.Concat(files)
        gvFiles.DataBind()

        ' Show Up button only if not in base directory
        btnUp.Visible = (CurrentPath <> Server.MapPath(BasePath) AndAlso pnlEditor.Visible = False)
        lblCurrentPath.Text = path.Replace(Server.MapPath(BasePath), BasePath).Replace("\", " > ")

    End Sub


    Protected Sub btnUp_Click(sender As Object, e As EventArgs)
        CurrentPath = Directory.GetParent(CurrentPath).FullName
        LoadDirectoryContents(CurrentPath)
    End Sub

    Protected Sub gvFiles_RowCommand(sender As Object, e As GridViewCommandEventArgs)
        Dim filePath As String = e.CommandArgument.ToString()

        If e.CommandName = "Directory" Then
            CurrentPath = filePath
            LoadDirectoryContents(CurrentPath)
        ElseIf e.CommandName = "File" Then
            EditFile(filePath)
        End If
    End Sub

    Private Sub EditFile(filePath As String)
        pnlEditor.Visible = True
        gvFiles.Visible = False
        btnUp.Visible = False  ' Hide the Up button when editing
        ftbEditor.Text = File.ReadAllText(filePath)
        ViewState("EditingFile") = filePath
    End Sub


    Protected Sub btnSave_Click(sender As Object, e As EventArgs)
        Dim filePath As String = ViewState("EditingFile").ToString()
        File.WriteAllText(filePath, ftbEditor.Text)

        pnlEditor.Visible = False
        gvFiles.Visible = True
        LoadDirectoryContents(CurrentPath)
    End Sub

    Protected Sub btnCancel_Click(sender As Object, e As EventArgs)
        pnlEditor.Visible = False
        gvFiles.Visible = True
        LoadDirectoryContents(CurrentPath) ' Reload directory contents to reset the view and show the Up button if applicable
    End Sub

End Class
