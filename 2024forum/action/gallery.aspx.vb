Imports System.Data
Imports System.Configuration
Imports System.Data.SqlClient
Public Class gallery

    Inherits System.Web.UI.Page
    Public GalleryItems As String = ""
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load


        Dim query As String = "SELECT [dbo].[_2024ForumGallery].id, owner, timestamp, filename, caption, display, firstname,lastname, affiliation, email FROM [dbo].[_2024ForumGallery] inner join dbo.__2024connections on [dbo].[_2024ForumGallery].owner =  dbo.__2024connections.id"

        Using con As New SqlConnection(Common.GetConnString())
            Using cmd As New SqlCommand(query)
                Using sda As New SqlDataAdapter()
                    cmd.Connection = con
                    sda.SelectCommand = cmd
                    Using ds As New DataSet()
                        sda.Fill(ds)

                        For Each dr As DataRow In ds.Tables(0).Rows

                            GalleryItems += "<div class='item'><div class='image'><img src='../../Gallery/" & dr("filename") & "'></div><div class='caption'>" & dr("caption") & "</div><div class='credit'>Uploaded by <a href='mailto:" & dr("email") & "'>" & dr("firstname") & " " & dr("lastname") & "</a> - " & dr("affiliation") & "</div></div>"


                        Next


                    End Using
                End Using
            End Using
        End Using

    End Sub


End Class
