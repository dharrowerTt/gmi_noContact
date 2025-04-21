Imports System.IO
Public Class speakerFiles
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not Me.IsPostBack Then
            Dim rootInfo As New DirectoryInfo(Server.MapPath("/2024forum/Uploads/"))
            Me.PopulateTreeView(rootInfo, Nothing)
        End If
    End Sub

    Private Sub PopulateTreeView(dirInfo As DirectoryInfo, treeNode As TreeNode)
        For Each directory As DirectoryInfo In dirInfo.GetDirectories()
            Dim directoryNode As New TreeNode() With {
         .Text = directory.Name,
         .Value = directory.FullName
        }

            If treeNode Is Nothing Then
                'If Root Node, add to TreeView.
                TreeView1.Nodes.Add(directoryNode)
            Else
                'If Child Node, add to Parent Node.
                treeNode.ChildNodes.Add(directoryNode)
            End If

            'Get all files in the Directory.
            For Each file As FileInfo In directory.GetFiles()
                'Add each file as Child Node.
                Dim fileNode As New TreeNode() With {
              .Text = file.Name,
              .Value = file.FullName,
              .Target = "_blank",
              .NavigateUrl = (New Uri(Server.MapPath("/~/~/"))).MakeRelativeUri(New Uri(file.FullName)).ToString()
            }
                directoryNode.ChildNodes.Add(fileNode)
            Next

            PopulateTreeView(directory, directoryNode)
        Next
    End Sub

End Class