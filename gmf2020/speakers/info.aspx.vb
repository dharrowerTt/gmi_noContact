Imports System.IO
Imports System.Data
Imports System.Configuration
Imports System.Data.SqlClient

Public Class info
    Inherits System.Web.UI.Page
    Private regCode As String
    Dim EventID As Int16 = 110
    Dim UserID As String = ""
    Dim LookupValue As String = ""
    Dim profilePic As String = ""

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Me.IsPostBack Then

            Dim LookupValue As String = ""

            If Not (Request.QueryString("id") Is Nothing) Then
                LookupValue = Request.QueryString("id")
            Else
                Response.Redirect("index.aspx", True)
            End If


            Dim constr As String = Common.GetConnString()
            Using con As SqlConnection = New SqlConnection(constr)
                Using cmd As SqlCommand = New SqlCommand("SELECT * from _registercontact WHERE email = '" & LookupValue & "' AND EventID = " & EventID)
                    cmd.CommandType = CommandType.Text
                    cmd.Connection = con
                    con.Open()
                    Using sdr As SqlDataReader = cmd.ExecuteReader()
                        sdr.Read()

                        fName.Text = sdr("fName").ToString()
                        lName.Text = sdr("lName").ToString()
                        bio.Text = sdr("bio").ToString()

                        profilePic = sdr("profilepic").ToString()
                        UserID = sdr("fName").ToString() & sdr("lName").ToString()


                        Dim folderPath As String = Server.MapPath("/gmf2020/speakers/" & UserID & "/image/")

                        'Check whether Directory (Folder) exists.
                        If Directory.Exists(folderPath) Then

                            Image1.ImageUrl = "/gmf2020/speakers/" & UserID & "/image/" & profilePic


                        End If



                        If Not IsDBNull(sdr("editable")) Then
                            If sdr("editable") = True Then
                                Response.Redirect("success.aspx?id=" & LookupValue)
                            End If
                        End If



                    End Using
                    con.Close()
                End Using
            End Using
        End If
    End Sub

End Class