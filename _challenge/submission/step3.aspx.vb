Imports System.Data
Imports System.Text
Imports System.Configuration
Imports System.Web.Services
Imports System.Web.Script.Services
Imports System.Data.SqlClient
Public Class step3

    Inherits System.Web.UI.Page
    Public Shared submissionID As Integer
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then

            If Request.Form.Count > 0 Then


                If Request.Form("ID") IsNot Nothing Then
                    submissionID = Request.Form("ID")
                ElseIf Request.Form("submissionIDBack") IsNot Nothing Then
                    submissionID = Request.Form("submissionIDBack")
                End If

                ID.Text = submissionID
                End If

                Dim constr As String = Common.GetConnString()
            Using con As SqlConnection = New SqlConnection(constr)
                Using cmd As SqlCommand = New SqlCommand("SELECT * from gmcSubmission WHERE id = " & submissionID)
                    cmd.CommandType = CommandType.Text
                    cmd.Connection = con
                    con.Open()
                    Using sdr As SqlDataReader = cmd.ExecuteReader()
                        sdr.Read()

                        If sdr.HasRows = True Then

                            If Len(sdr("urlList").ToString()) > 0 Then
                                linkUrls.Visible = True
                                linkUrls.Text = sdr("urlList").ToString()
                                linkUrls.ReadOnly = True
                                EditBox.Visible = True
                            End If


                        End If

                    End Using
                    con.Close()
                End Using
            End Using

        End If
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
    Public Shared Sub uploadURLS(urls As Urls)

        Dim sqlText = "UPDATE gmcSubmission SET urlList = @urlList where id=@submissionID"
        Using cnConnect = New SqlConnection(Common.GetConnString())
            Using cm = New SqlCommand(sqlText, cnConnect)
                cnConnect.Open()
                cm.Parameters.AddWithValue("@submissionID", submissionID)
                cm.Parameters.AddWithValue("@urlList", urls.urlList)


                cm.ExecuteNonQuery()
            End Using
        End Using

    End Sub

    Protected Sub EditBox_Click(sender As Object, e As EventArgs) Handles EditBox.Click
        linkUrls.ReadOnly = False



    End Sub
End Class