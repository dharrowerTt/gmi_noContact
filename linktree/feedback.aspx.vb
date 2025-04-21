Imports System.Data.SqlClient
Public Class feedback
    Inherits System.Web.UI.Page
    Public visitorID As String
    Public Shared visitorName As String = ""
    Public Shared SessionNote As String = ""

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        Dim ErrorURL As String = "https://www.globalmethane.org"

        If Request.Cookies("userid") IsNot Nothing Then
            ' Retrieve the value of the 'userid' cookie
            Dim userId As String = Request.Cookies("userid").Value

            visitorID = userId
        Else
            ' 'userid' cookie does not exist, handle accordingly
            Response.Redirect(ErrorURL)
        End If

        Dim currentPage As String = "feedback"

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


        'Fill the dropdown


        Dim Query = "SELECT feedbackid
      ,userid
      ,session
      ,feedback
  FROM [dbo].[_forumFeedback]where userid =" + visitorID + ";"

        Using con As New SqlConnection(Common.GetConnString())
            Using cmd As New SqlCommand(Query)
                Using sda As New SqlDataAdapter()
                    cmd.Connection = con
                    sda.SelectCommand = cmd
                    Using ds As New DataSet()
                        sda.Fill(ds)
                        If ds.Tables.Count > 0 AndAlso ds.Tables(0).Rows.Count > 0 Then
                            feedList.DataSource = ds.Tables(0)
                            feedList.DataBind()
                            feedList.HeaderRow.TableSection = TableRowSection.TableHeader
                        Else
                            ' No rows returned, you can handle this case if needed
                            ' For example, display a message or perform other actions
                            feedList.DataSource = Nothing
                            feedList.DataBind()
                            myFeedbackSection.Visible = False
                        End If
                    End Using

                End Using
            End Using
        End Using




    End Sub

    Protected Sub addFeedback_Action(sender As Object, e As EventArgs) Handles addFeedback.Click

        If Len(ddlCategories.SelectedItem.Value) Then
            Dim currentPage As String = "homepage"

            Dim sqlText = "INSERT INTO _forumFeedback (userid,session,feedback) VALUES (@userid, @session, @feedback);"
            Using cnConnect = New SqlConnection(Common.GetConnString())
                Using cm = New SqlCommand(sqlText, cnConnect)
                    cnConnect.Open()
                    cm.Parameters.Add("@userid", SqlDbType.Int).Value = user.Text
                    cm.Parameters.Add("@session", SqlDbType.NVarChar).Value = ddlCategories.SelectedItem.Value
                    cm.Parameters.Add("@feedback", SqlDbType.NVarChar).Value = feedback.Text


                    Dim currentID As Integer = cm.ExecuteScalar()
                    'Set the ID value to RowNumber for redirection

                End Using
            End Using

            Response.Redirect("feedback.aspx?s=success")

        Else

            SessionNote = "Please select a specific session before submitting."

        End If


    End Sub



End Class