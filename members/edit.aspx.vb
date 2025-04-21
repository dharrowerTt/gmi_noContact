Imports System.Data
Imports System.Configuration
Imports System.Data.SqlClient
Imports System.Collections.Generic
Public Class edit1
    Inherits System.Web.UI.Page
    Private userID As String
    Private profileID As String
    Private geoID As String
    Private roleType As Integer

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        profileID = Server.HtmlEncode(Request.QueryString("id"))

        If Len(profileID) > 5 Then

            If Not IsPostBack Then



                Dim constr As String = Common.GetConnString()
                Using con As SqlConnection = New SqlConnection(constr)
                    Using cmd As SqlCommand = New SqlCommand("SELECT * from _mbrDelegateLookUp WHERE userID = CONVERT(uniqueidentifier,'" & userID & "')")
                        cmd.CommandType = CommandType.Text
                        cmd.Connection = con
                        con.Open()
                        Using sdr As SqlDataReader = cmd.ExecuteReader()
                            sdr.Read()

                            If sdr.HasRows = True Then

                                firstName.Text = sdr("firstName").ToString()
                                lastName.Text = sdr("lastName").ToString()
                                organization.Text = sdr("organization").ToString()
                                email.Text = sdr("emailAddress").ToString()
                                telephone.Text = sdr("phonenumber").ToString()
                                title.Text = sdr("title").ToString()

                                nominate.SelectedValue = sdr("nomination").ToString()

                            End If
                        End Using
                        con.Close()
                    End Using
                End Using


            End If

        End If


    End Sub

End Class