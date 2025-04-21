Imports System.IO
Imports System.Data
Imports System.Text
Imports System.Configuration
Imports System.Web.Services
Imports System.Web.Script.Services
Imports System.Data.SqlClient


Public Class step4
    Inherits System.Web.UI.Page
    Public Shared submissionID As Integer
    Public Shared Deleteditem As String

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then

            If Request.Form.Count > 0 Then
                submissionID = Request.Form("submissionID")
                ID.Text = submissionID
            End If


            Dim constr As String = Common.GetConnString()


            Using conn As SqlConnection = New SqlConnection(constr)
                Using sda As SqlDataAdapter = New SqlDataAdapter("SELECT * FROM gmcSubmissionImages where submissionID = " & submissionID, conn)
                    Dim dt As DataTable = New DataTable()
                    sda.Fill(dt)
                    gvImages.DataSource = dt
                    gvImages.DataBind()
                End Using
            End Using






            Using con As SqlConnection = New SqlConnection(constr)
                Using cmd As SqlCommand = New SqlCommand("SELECT * from gmcSubmission WHERE id = " & submissionID)
                    cmd.CommandType = CommandType.Text
                    cmd.Connection = con
                    con.Open()
                    Using sdr As SqlDataReader = cmd.ExecuteReader()
                        sdr.Read()

                        If sdr.HasRows = True Then


                            If Len(sdr("youtubeList").ToString()) > 0 Then
                                youtubeUrls.Visible = True
                                youtubeUrls.Text = sdr("youtubeList").ToString()
                                youtubeUrls.ReadOnly = True
                                EditBox.Visible = True
                            End If

                        End If

                    End Using
                    con.Close()
                End Using
            End Using


        End If
    End Sub

    Protected Sub BindGrid()

    End Sub

    Public Class Urls
        Public Property urlList() As String
            Get
                Return _urlList
            End Get
            Set(value As String)
                _urlList = value
            End Set
        End Property
        Private _urlList As String
    End Class

    <WebMethod()>
    <ScriptMethod()>
    Public Shared Sub uploadYoutube(urls As Urls)

        Dim sqlText = "UPDATE gmcSubmission SET youtubeList = @youtubeList where id=@submissionID"
        Using cnConnect = New SqlConnection(Common.GetConnString())
            Using cm = New SqlCommand(sqlText, cnConnect)
                cnConnect.Open()
                cm.Parameters.AddWithValue("@submissionID", submissionID)
                cm.Parameters.AddWithValue("@youtubeList", urls.urlList)


                cm.ExecuteNonQuery()
            End Using
        End Using

    End Sub

    <WebMethod()>
    <ScriptMethod()>
    Public Shared Sub deleteImg(urls As Urls)

        Dim sqlText = "DELETE from gmcSubmissionImages where Path=@imageurl"
        Using cnConnect = New SqlConnection(Common.GetConnString())
            Using cm = New SqlCommand(sqlText, cnConnect)
                cnConnect.Open()
                cm.Parameters.AddWithValue("@imageurl", urls)
                System.Console.WriteLine("Log text")

                cm.ExecuteNonQuery()
                cnConnect.Close()
            End Using
        End Using

    End Sub

    Protected Sub Upload(ByVal sender As Object, ByVal e As EventArgs)
        'Extract Image File Name.
        Dim fileName As String = Path.GetFileName(FileUpload1.PostedFile.FileName)




        'Set the Image File Path.
        Dim filePath As String = "uploads/" & submissionID & "-" & fileName

        'Save the Image File in Folder.
        FileUpload1.PostedFile.SaveAs(Server.MapPath(filePath))

        Dim sqlText = "INSERT INTO gmcSubmissionImages (submissionID,Name,Path) VALUES (@submissionID,@Name, @Path)"
        Using cnConnect = New SqlConnection(Common.GetConnString())
            Using cm = New SqlCommand(sqlText, cnConnect)
                cnConnect.Open()
                cm.Parameters.AddWithValue("@submissionID", submissionID)
                cm.Parameters.AddWithValue("@Name", fileName)
                cm.Parameters.AddWithValue("@Path", filePath)

                cm.ExecuteNonQuery()
                cnConnect.Close()
            End Using
        End Using

        Response.Redirect(Request.Url.AbsoluteUri)
    End Sub

    Protected Sub EditBox_Click(sender As Object, e As EventArgs) Handles EditBox.Click
        youtubeUrls.ReadOnly = False

    End Sub


    Protected Sub OnRowDataBound(sender As Object, e As GridViewRowEventArgs)
        If e.Row.RowType = DataControlRowType.DataRow Then
            Deleteditem = e.Row.Cells(0).Text
            For Each button As Button In e.Row.Cells(2).Controls.OfType(Of Button)()
                If button.CommandName = "Delete" Then
                    button.Attributes("onclick") = "if(!confirm('Do you want to delete " + Deleteditem + "?')){ return false; };"


                End If
            Next
        End If
    End Sub

    Protected Sub OnRowDeleting(sender As Object, e As GridViewDeleteEventArgs)
        Dim index As String = Convert.ToString(e.Values(0))
        Dim sqlText = "DELETE from gmcSubmissionImages where Path=@imageurl"
        Using cnConnect = New SqlConnection(Common.GetConnString())
            Using cm = New SqlCommand(sqlText, cnConnect)
                cnConnect.Open()
                cm.Parameters.AddWithValue("@imageurl", "uploads/" & submissionID & "-" & index)
                System.Console.WriteLine("Log text")

                cm.ExecuteNonQuery()
                cnConnect.Close()
            End Using
        End Using

        Dim strPath As String = Server.MapPath("uploads/" & submissionID & "-" & index)

        System.IO.File.Delete(strPath)

        Dim constr As String = Common.GetConnString()


        Using conn As SqlConnection = New SqlConnection(constr)
            Using sda As SqlDataAdapter = New SqlDataAdapter("SELECT * FROM gmcSubmissionImages where submissionID = " & submissionID, conn)
                Dim dt As DataTable = New DataTable()
                sda.Fill(dt)
                gvImages.DataSource = dt
                gvImages.DataBind()
            End Using
        End Using


    End Sub


End Class