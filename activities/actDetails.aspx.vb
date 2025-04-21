Imports System.Data
Imports System.Configuration
Imports System.Data.SqlClient
Public Class actDetails1
    Inherits System.Web.UI.Page
    Public Shared ActName As String = ""
    Public Shared ActStage As String = ""
    Public Shared ActSector As String = ""
    Public Shared ActGeoFocus As String = ""
    Public Shared ActLocation As String = ""
    Public Shared ActDesc As String = ""
    Public Shared ActPartCountries As String = ""
    Public Shared ActInstOrgs As String = ""
    Public Shared ActEstLifetime As String = ""
    Public Shared ActEmisReductions As String = ""
    Public Shared ActResults As String = ""
    Public Shared ActAddDocumentation As String = ""
    Public Shared ActPrimContact As String = ""
    Public Shared ActFinancialSupport As String = ""
    Public Shared ActComments As String = ""
    Public Shared ActExpo As String = ""



    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        'Put user code to initialize the page here
        Dim activityID As Integer

        activityID = Server.HtmlEncode(Request.QueryString("id"))


        If Not IsNumeric(activityID) Then
            RedirectToIndex()
        End If


        Dim actDetails As String = "/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP (1000) [ProjectID]
      ,[Name]
      ,[Sector]
      ,[Description]
      ,[LocationDetail]
      ,[ObjectiveBenefits]
      ,[TypeofProject]
      ,[TypeofProjectDesc]
      ,[ProjectStatus]
      ,[Deliverables]
      ,[Comments]
      ,[ghgasreduction]
      ,[ImplementationSupport]
      ,[geographicFocus]
  FROM [dbo].[projectActivity] where ProjectID = " & activityID

        Using con3 As New SqlConnection(Common.GetConnString())
            Using cmd3 As New SqlCommand(actDetails)
                Using sda3 As New SqlDataAdapter()
                    cmd3.Connection = con3
                    sda3.SelectCommand = cmd3
                    Using ds3 As New DataSet()
                        sda3.Fill(ds3)
                        Dim dc3 As DataColumn
                        Dim dr3 As DataRow

                        If (ds3.Tables.Count = 0) Or (ds3.Tables(0).Rows.Count = 0) Then
                            RedirectToIndex()
                        End If

                        For Each dr3 In ds3.Tables(0).Rows

                            ActName = dr3(1).ToString()
                            ActStage = dr3(8).ToString()
                            ActDesc = dr3(3).ToString()
                            ActLocation = dr3(4).ToString()
                            ActGeoFocus = dr3(13).ToString()
                            ActSector = dr3(2).ToString()
                            ActEmisReductions = dr3(11).ToString()
                            ActResults = dr3(12).ToString()



                        Next

                    End Using
                End Using
            End Using
        End Using


    End Sub

    Public Sub RedirectToIndex()
        Response.Redirect("index.aspx")
    End Sub



End Class