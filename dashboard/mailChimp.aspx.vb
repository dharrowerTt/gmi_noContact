
Imports System.Data
Imports System.Configuration
Imports System.Data.SqlClient
Public Class mailChimp
    Inherits System.Web.UI.Page

    Public Shared mcFirst As Boolean = True
    Public Shared snapshotSubs As String
    Public Shared snapshotContacts As String
    Public Shared openRate As String
    Public Shared clickRate As String
    Public Shared bounceRate As String
    Public Shared unsubRate As String
    Public Shared snapshotSubsPrev As String
    Public Shared snapshotContactsPrev As String
    Public Shared openRatePrev As String
    Public Shared clickRatePrev As String
    Public Shared bounceRatePrev As String
    Public Shared unsubRatePrev As String

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim query As String = "SELECT        commID, subjectLine, msgURL, areaOfInterest, language,  convert(varchar, dateSent, 111)  as dateofSend FROM dbo.gmiComms ORDER BY dateSent DESC"

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

        Using connObj As New SqlClient.SqlConnection(Common.GetConnString())
            Using cmdObj As New SqlClient.SqlCommand("SELECT TOP (2)  snapshotSubs, snapshotContacts, openRate, clickRate, bounceRate, unsubRate
FROM            dbo.gmiComms order by dateSent DESC", connObj)
                connObj.Open()
                Using readerObj As SqlClient.SqlDataReader = cmdObj.ExecuteReader
                    'This will loop through all returned records 
                    While readerObj.Read
                        If mcFirst = True Then
                            snapshotSubs = readerObj("snapshotSubs").ToString
                            snapshotContacts = readerObj("snapshotContacts").ToString
                            openRate = readerObj("openRate").ToString
                            clickRate = readerObj("clickRate").ToString
                            bounceRate = readerObj("bounceRate").ToString
                            unsubRate = readerObj("unsubRate").ToString
                            mcFirst = False
                        Else
                            snapshotSubsPrev = readerObj("snapshotSubs").ToString
                            snapshotContactsPrev = readerObj("snapshotContacts").ToString
                            openRatePrev = readerObj("openRate").ToString
                            clickRatePrev = readerObj("clickRate").ToString
                            bounceRatePrev = readerObj("bounceRate").ToString
                            unsubRatePrev = readerObj("unsubRate").ToString
                        End If
                        'handle returned value before next loop here
                    End While
                End Using
                connObj.Close()
            End Using
        End Using


    End Sub



End Class