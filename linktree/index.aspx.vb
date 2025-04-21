Imports System.Data.SqlClient
Public Class index21
    Inherits System.Web.UI.Page
    Public visitorID As String
    Public Shared visitorName As String = ""

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        visitorID = Server.HtmlEncode(Request.QueryString("id"))

        Dim ErrorURL As String = "https://www.globalmethane.org"

        If Len(visitorID) < 1 Then

            If Request.Cookies("userid") IsNot Nothing Then
                ' Retrieve the value of the 'userid' cookie
                Dim userId As String = Request.Cookies("userid").Value

                visitorID = userId
            Else
                ' 'userid' cookie does not exist, handle accordingly
                Response.Redirect(ErrorURL)
            End If

        End If

        Dim queryCount As String = "SELECT  firstName, lastName FROM dbo.__2024connections where id = " & visitorID & ";"

        Using con2 As New SqlConnection(Common.GetConnString())
            Using cmd2 As New SqlCommand(queryCount)
                Using sda2 As New SqlDataAdapter()
                    cmd2.Connection = con2
                    sda2.SelectCommand = cmd2
                    Using ds3 As New DataSet()
                        sda2.Fill(ds3)
                        Dim dc2 As DataColumn
                        Dim dr2 As DataRow

                        For Each dr2 In ds3.Tables(0).Rows

                            visitorName = dr2(0) & " " & dr2(1)

                        Next

                    End Using
                End Using
            End Using
        End Using

        Dim currentPage As String = "homepage"

        Dim sqlText = "INSERT INTO linkTreeAnalytics (visitorID,timestamp,page) VALUES (@visitorID, @timeStamp, @page);"
        Using cnConnect = New SqlConnection(Common.GetConnString())
            Using cm = New SqlCommand(sqlText, cnConnect)
                cnConnect.Open()
                cm.Parameters.Add("@visitorID", SqlDbType.Int).Value = visitorID
                cm.Parameters.Add("@timeStamp", SqlDbType.DateTime).Value = Now
                cm.Parameters.Add("@page", SqlDbType.NVarChar).Value = currentPage


                Dim currentID As Integer = cm.ExecuteScalar()
                'Set the ID value to RowNumber for redirection

            End Using
        End Using


    End Sub

End Class