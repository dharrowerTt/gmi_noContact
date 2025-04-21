Imports System.Data.SqlClient
Imports System.IO
Public Class scheduleForm
    Inherits System.Web.UI.Page
    Public Shared ScheduleResponse As String = ""
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        Dim eventFile As String = System.Web.HttpContext.Current.Server.MapPath("\2024forum\_events.json")
        Dim sqlText = "INSERT INTO __scheduler (eventID,startDateTime,endDateTime,titleText,contentText,backColor,barColor,status) VALUES (@eventID, @startDateTime, @endDateTime, @titleText, @contentText,@backColor,@barColor,@status);Declare @Result NVARCHAR(MAX);

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
                cm.Parameters.Add("@eventID", SqlDbType.Int).Value = 1
                cm.Parameters.Add("@startDateTime", SqlDbType.NVarChar).Value = startDateCheck.Text & "T" & startTimeCheck.Text & ":00"
                cm.Parameters.Add("@endDateTime", SqlDbType.NVarChar).Value = endDateCheck.Text & "T" & endTimeCheck.Text & ":00"
                cm.Parameters.Add("@titleText", SqlDbType.NVarChar).Value = title.Text
                cm.Parameters.Add("@contentText", SqlDbType.NVarChar).Value = content.Text
                cm.Parameters.Add("@backColor", SqlDbType.NVarChar).Value = backColorPickerCheck.Text
                cm.Parameters.Add("@barColor", SqlDbType.NVarChar).Value = barColorPickerCheck.Text
                cm.Parameters.Add("@status", SqlDbType.NVarChar).Value = status.SelectedValue

                ScheduleResponse = cm.ExecuteScalar()

                System.IO.File.WriteAllText(eventFile, ScheduleResponse)

            End Using
        End Using
    End Sub
End Class