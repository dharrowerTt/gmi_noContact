Imports System.Data.SqlClient
Public Class export1
    Inherits System.Web.UI.Page
    Public visitorID As String
    Public visitorEmail As String
    Public sBody As String

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim htmlTable As New StringBuilder()

        Dim ErrorURL As String = "https://www.globalmethane.org"



        If Request.Cookies("userid") IsNot Nothing Then
            ' Retrieve the value of the 'userid' cookie
            Dim userId As String = Request.Cookies("userid").Value
            visitorID = userId
        Else
            ' 'userid' cookie does not exist, handle accordingly
            Response.Redirect(ErrorURL)
        End If

        Dim queryCount As String = "SELECT  email FROM dbo.__2024connections where id = " & visitorID & ";"

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

                            visitorEmail = dr2(0)

                        Next

                    End Using
                End Using
            End Using
        End Using


        Dim query As String = "SELECT 
firstname || ' ' || lastname AS 'Name'
      ,affiliation As 'Affiliation'
      ,CASE 
        WHEN share = 0 THEN 'not supplied'
        ELSE email
      END AS 'Email Address'
      ,note As 'Note'
  FROM dbo._forumConnectionList left join dbo.__2024connections on dbo._forumConnectionList.connection = dbo.__2024connections.id where userid =" + visitorID + ";"

        Using con As New SqlConnection(Common.GetConnString())
            Using cmd As New SqlCommand(query)
                Using sda As New SqlDataAdapter()
                    cmd.Connection = con
                    sda.SelectCommand = cmd
                    Using ds As New DataSet()
                        sda.Fill(ds)



                        ' Build HTML table dynamically
                        HtmlTable.Append("<table border='1'>")
                        ' Add header row
                        HtmlTable.Append("<tr>")
                        For Each column As DataColumn In ds.Tables(0).Columns
                            HtmlTable.Append("<th>")
                            HtmlTable.Append(column.ColumnName)
                            HtmlTable.Append("</th>")
                        Next
                        HtmlTable.Append("</tr>")

                        ' Add data rows
                        For Each row As DataRow In ds.Tables(0).Rows
                            HtmlTable.Append("<tr>")
                            For Each column As DataColumn In ds.Tables(0).Columns
                                HtmlTable.Append("<td>")
                                HtmlTable.Append(row(column.ColumnName).ToString())
                                HtmlTable.Append("</td>")
                            Next
                            HtmlTable.Append("</tr>")
                        Next
                        HtmlTable.Append("</table>")


                    End Using
                End Using
            End Using
        End Using

        Dim arrMail(7) As String

        arrMail(0) = visitorEmail  'TO
        arrMail(3) = "secretariat@globalmethane.org"    'FROM 'IIf(txtEmail.Text.Length > 0, txtEmail.Text, arrMail(0))     
        'arrMail(4) = "Thanks for registering for the 2024 Global Methane Forum!"
        arrMail(6) = "HTML"

        arrMail(4) = "Your 2024 Global Methane Forum Connections"

        sBody = "<html><style type='text/css'>body{font-family:'Calibri'; font-size:90%}</style><body>"
        sBody += "<p>Please see below for your connections from the 2024 Global Methane Forum.<br><br><br>"

        sBody += htmlTable.ToString



        arrMail(5) = sBody

        clsEmail.SendEventEmail(arrMail)


        Response.Redirect("connections.aspx")

    End Sub

End Class