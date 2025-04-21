Imports System.Data.SqlClient

Public Class index110
    Inherits System.Web.UI.Page
    Dim EventID As Int16 = 110
    Public PlaceHolder1 As String


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load


        If Not Me.IsPostBack Then
            'Populating a DataTable from database.
            Dim dt As DataTable = Me.GetData()

            'Building an HTML string.
            Dim html As New StringBuilder()


            'Building the Data rows.

            For Each row As DataRow In dt.Rows
                html.Append("{'id':'")
                For Each column As DataColumn In dt.Columns
                    html.Append(row(column.ColumnName))
                Next
                html.Append("','showAsSelected':  true},")
            Next


            'Append the HTML string to Placeholder.
            PlaceHolder1 = html.ToString

        End If

    End Sub




    Protected Sub checkUser(ByVal s As Object, ByVal e As EventArgs)

        Dim registerObj As clsRegisterVO
        registerObj = New clsRegisterVO

        registerObj.setEmail(emailaddress.Text)
        registerObj.setEventID(EventID)


        Dim EmailAdd As String

        EmailAdd = clsRegisterDAO.insertEmail(registerObj)



    End Sub



    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        Dim constr As String = Common.GetConnString()


        Using con As SqlConnection = New SqlConnection(constr)
            Using cmd As SqlCommand = New SqlCommand("select count(*) As CountofRows FROM _registercontact where email = '" & emailaddress.Text & "' and editable = 1 and eventID = " & EventID)
                cmd.CommandType = CommandType.Text
                cmd.Connection = con
                con.Open()
                Using sdr As SqlDataReader = cmd.ExecuteReader()
                    sdr.Read()
                    If sdr("CountofRows") > 0 Then
                        Response.Redirect("success.aspx?id=" + emailaddress.Text, True)
                    Else
                        checkUser(emailaddress.Text, e)
                        Response.Redirect("regform.aspx?id=" + emailaddress.Text)
                    End If

                End Using
                con.Close()
            End Using
        End Using




        'recdirect or popup or whatever you feel like doing
        Response.Redirect("regform.aspx", True)
    End Sub

    Private Function GetData() As DataTable
        Dim constr As String = Common.GetConnString()
        Using con As SqlConnection = New SqlConnection(constr)


            Using cmd As New SqlCommand("select distinct country FROM _registercontact where not country in ('null','US') and eventID = " & EventID)
                cmd.CommandType = CommandType.Text
                cmd.Connection = con
                con.Open()
                Using sda As New SqlDataAdapter()
                    cmd.Connection = con
                    sda.SelectCommand = cmd
                    Using dt As New DataTable()
                        sda.Fill(dt)
                        Return dt
                    End Using
                End Using
                con.Close()
            End Using
        End Using


    End Function
End Class