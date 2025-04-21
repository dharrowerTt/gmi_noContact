Imports System.Data.SqlClient
Public Class schedule
    Inherits System.Web.UI.Page
    Public Shared ScheduleResponse As String = ""

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim sqlText = "Declare @Result NVARCHAR(MAX);

SET @Result = (SELECT [itemID] as 'id'
      ,[startDateTime] as 'start'
      ,[endDateTime] as 'end'
      ,[titleText] as 'text'
      ,[backColor]
      ,[barColor]
  FROM [dbo].[__scheduler]

  
FOR JSON AUTO);

Select @Result;"
        Using cnConnect = New SqlConnection(Common.GetConnString())
            Using cm = New SqlCommand(sqlText, cnConnect)
                cnConnect.Open()


                ScheduleResponse = cm.ExecuteScalar()

            End Using
        End Using
    End Sub


End Class