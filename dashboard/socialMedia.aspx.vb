Imports System.Data
Imports System.Configuration
Imports System.Web.Script.Serialization
Imports System.Data.SqlClient
Public Class socialMedia
    Inherits System.Web.UI.Page

    Public Shared linkedInFirst As Boolean = True
    Public Shared linkedIn1a As String
    Public Shared linkedIn1b As String
    Public Shared linkedIn2a As String
    Public Shared linkedIn2b As String
    Public Shared linkedIn3a As String
    Public Shared linkedIn3b As String

    Public Shared FacebookFirst As Boolean = True
    Public Shared Facebook1a As String
    Public Shared Facebook1b As String
    Public Shared Facebook2a As String
    Public Shared Facebook2b As String
    Public Shared Facebook3a As String
    Public Shared Facebook3b As String

    Public Shared XFirst As Boolean = True
    Public Shared X1a As String
    Public Shared X1b As String
    Public Shared X2a As String
    Public Shared X2b As String
    Public Shared X3a As String
    Public Shared X3b As String

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Using connObj As New SqlClient.SqlConnection(Common.GetConnString())
            Using cmdObj As New SqlClient.SqlCommand("SELECT TOP (2) platform, posted, followers, posts, engagementRate
FROM            dbo.__socialMediaDash where platform = 'linkedin' order by posted DESC", connObj)
                connObj.Open()
                Using readerObj As SqlClient.SqlDataReader = cmdObj.ExecuteReader
                    'This will loop through all returned records 
                    While readerObj.Read
                        If linkedInFirst = True Then
                            linkedIn1a = readerObj("followers").ToString
                            linkedIn2a = readerObj("posts").ToString
                            linkedIn3a = readerObj("engagementRate").ToString
                            linkedInFirst = False
                        Else
                            linkedIn1b = readerObj("followers").ToString
                            linkedIn2b = readerObj("posts").ToString
                            linkedIn3b = readerObj("engagementRate").ToString
                        End If
                        'handle returned value before next loop here
                    End While
                End Using
                connObj.Close()
            End Using
        End Using

        Using connObj As New SqlClient.SqlConnection(Common.GetConnString())
            Using cmdObj As New SqlClient.SqlCommand("SELECT TOP (2) platform, posted, followers, posts, engagementRate
FROM            dbo.__socialMediaDash where platform = 'facebook' order by posted DESC", connObj)
                connObj.Open()
                Using readerObj As SqlClient.SqlDataReader = cmdObj.ExecuteReader
                    'This will loop through all returned records 
                    While readerObj.Read
                        If FacebookFirst = True Then
                            Facebook1a = readerObj("followers").ToString
                            Facebook2a = readerObj("posts").ToString
                            Facebook3a = readerObj("engagementRate").ToString
                            FacebookFirst = False
                        Else
                            Facebook1b = readerObj("followers").ToString
                            Facebook2b = readerObj("posts").ToString
                            Facebook3b = readerObj("engagementRate").ToString
                        End If
                        'handle returned value before next loop here
                    End While
                End Using
                connObj.Close()
            End Using
        End Using

        Using connObj As New SqlClient.SqlConnection(Common.GetConnString())
            Using cmdObj As New SqlClient.SqlCommand("SELECT TOP (2) platform, posted, followers, posts, engagementRate
FROM            dbo.__socialMediaDash where platform = 'x' order by posted DESC", connObj)
                connObj.Open()
                Using readerObj As SqlClient.SqlDataReader = cmdObj.ExecuteReader
                    'This will loop through all returned records 
                    While readerObj.Read
                        If XFirst = True Then
                            X1a = readerObj("followers").ToString
                            X2a = readerObj("posts").ToString
                            X3a = readerObj("engagementRate").ToString
                            XFirst = False
                        Else
                            X1b = readerObj("followers").ToString
                            X2b = readerObj("posts").ToString
                            X3b = readerObj("engagementRate").ToString
                        End If
                        'handle returned value before next loop here
                    End While
                End Using
                connObj.Close()
            End Using
        End Using

    End Sub

End Class