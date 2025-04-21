Imports System.IO

Public Class sector_edits
    Inherits System.Web.UI.Page

    Private Property EditingFile As String
        Get
            Return If(ViewState("EditingFile"), "")
        End Get
        Set(value As String)
            ViewState("EditingFile") = value
        End Set
    End Property

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            ddlSubOption.Enabled = False
            pnlEditor.Visible = False
        End If
    End Sub

    Protected Sub ddlSector_SelectedIndexChanged(ByVal sender As Object, ByVal e As EventArgs)
        ddlSubOption.Items.Clear()
        ddlSubOption.Items.Add(New ListItem("--Choose a section--", "")) ' Add blank default option
        ddlSubOption.Enabled = True

        Select Case ddlSector.SelectedValue
            Case "biogas"
                ddlSubOption.Items.Add(New ListItem("Introduction", "biogas/include/introduction.html"))
                ddlSubOption.Items.Add(New ListItem("Recent Resources", "biogas/include/recentResources.html"))
                ddlSubOption.Items.Add(New ListItem("Featured Tools", "biogas/include/featuredTools.html"))
            Case "coal"
                ddlSubOption.Items.Add(New ListItem("Introduction", "coal/include/introduction.html"))
                ddlSubOption.Items.Add(New ListItem("Recent Resources", "coal/include/recentResources.html"))
            Case "oil-gas"
                ddlSubOption.Items.Add(New ListItem("Introduction", "oil-gas/include/introduction.html"))
                ddlSubOption.Items.Add(New ListItem("Recent Resources", "oil-gas/include/recentResources.html"))
            Case Else
                ddlSubOption.Enabled = False
        End Select

        ' Reset the editor and hide the panel
        pnlEditor.Visible = False
    End Sub


    Protected Sub ddlSubOption_SelectedIndexChanged(ByVal sender As Object, ByVal e As EventArgs)
        If ddlSubOption.SelectedValue <> "" Then
            Dim filePath As String = Server.MapPath("~/" & ddlSubOption.SelectedValue)

            If File.Exists(filePath) Then
                EditingFile = filePath
                ftbEditor.Text = File.ReadAllText(filePath)
                pnlEditor.Visible = True
            Else
                EditingFile = ""
                pnlEditor.Visible = False
                ScriptManager.RegisterStartupScript(Me, Me.GetType(), "alert",
                    "Swal.fire({icon: 'error', title: 'Error', text: 'File not found!'});", True)
            End If
        End If
    End Sub

    Protected Sub btnSave_Click(sender As Object, e As EventArgs)
        If Not String.IsNullOrEmpty(EditingFile) Then
            Try
                File.WriteAllText(EditingFile, ftbEditor.Text)
                ScriptManager.RegisterStartupScript(Me, Me.GetType(), "alert",
                    "Swal.fire({icon: 'success', title: 'Success', text: 'Page updated successfully!'}).then(() => {location.reload();});", True)
            Catch ex As Exception
                ScriptManager.RegisterStartupScript(Me, Me.GetType(), "alert",
                    "Swal.fire({icon: 'error', title: 'Error', text: 'Failed to update file!'});", True)
            End Try
        End If
    End Sub

    Protected Sub btnCancel_Click(sender As Object, e As EventArgs)
        pnlEditor.Visible = False
    End Sub
End Class
