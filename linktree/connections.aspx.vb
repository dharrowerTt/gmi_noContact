Imports System.Data.SqlClient
Public Class connections
    Inherits System.Web.UI.Page
    Public visitorID As String
    Public Shared visitorName As String = ""

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

        Dim query As String = "SELECT id as GMIRegID
	  ,firstName
	  ,lastName
      ,email
      ,affiliation
	  ,country
      ,share
  FROM [dbo].[__2024connections] order by lastname, firstname"

        Using con As New SqlConnection(Common.GetConnString())
            Using cmd As New SqlCommand(query)
                Using sda As New SqlDataAdapter()
                    cmd.Connection = con
                    sda.SelectCommand = cmd
                    Using ds As New DataSet()
                        sda.Fill(ds)
                        gvComms.DataSource = ds.Tables(0)

                        gvComms.DataBind()
                        gvComms.HeaderRow.TableSection = TableRowSection.TableHeader
                    End Using
                End Using
            End Using
        End Using

        Dim currentPage As String = "connections"

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

        query = "SELECT connectionID
      ,userid
      ,note
      ,connection  
	  ,firstname
	  ,lastname
      ,affiliation
  FROM dbo._forumConnectionList left join dbo.__2024connections on dbo._forumConnectionList.connection = dbo.__2024connections.id where userid =" + visitorID + ";"

        Using con As New SqlConnection(Common.GetConnString())
            Using cmd As New SqlCommand(query)
                Using sda As New SqlDataAdapter()
                    cmd.Connection = con
                    sda.SelectCommand = cmd
                    Using ds As New DataSet()
                        sda.Fill(ds)
                        If ds.Tables.Count > 0 AndAlso ds.Tables(0).Rows.Count > 0 Then
                            conList.DataSource = ds.Tables(0)
                            conList.DataBind()
                            conList.HeaderRow.TableSection = TableRowSection.TableHeader
                        Else
                            ' No rows returned, you can handle this case if needed
                            ' For example, display a message or perform other actions
                            conList.DataSource = Nothing
                            conList.DataBind()
                            myConnectionSection.Visible = False
                        End If
                    End Using

                End Using
            End Using
        End Using


    End Sub

End Class