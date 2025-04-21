Imports System.Data
Imports System.Configuration
Imports System.Data.SqlClient
Imports System.Web.UI.DataVisualization.Charting
Imports System.Drawing
Public Class index18
    Inherits System.Web.UI.Page
    Public Shared countryCount As String = ""
    Public Shared regCount As String = ""

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        Dim query As String = "SELECT DISTINCT p.id, p.firstName, p.lastName, p.email, p.jobTitle, p.organization, p.orgType, p.attendanceType, p.poster, p.country, CAST(p.created AS DATE) as 'regDate', tmp.areaList
FROM __2024register p
INNER JOIN 
(
SELECT  id
       ,STUFF((SELECT ', ' + CAST(area AS VARCHAR(100)) [text()]
         FROM viewAoI 
         WHERE registerid = t.id
         FOR XML PATH(''), TYPE)
        .value('.','NVARCHAR(MAX)'),1,2,' ') areaList
FROM __2024register t
GROUP BY id) tmp ON tmp.id = p.id"

        Using con As New SqlConnection(Common.GetConnString())
            Using cmd As New SqlCommand(query)
                Using sda As New SqlDataAdapter()
                    cmd.Connection = con
                    sda.SelectCommand = cmd
                    Using ds As New DataSet()
                        sda.Fill(ds)
                        forumRegs.DataSource = ds.Tables(0)

                        forumRegs.DataBind()
                        forumRegs.HeaderRow.TableSection = TableRowSection.TableHeader
                    End Using
                End Using
            End Using
        End Using

        Dim query2 As String = "SELECT attendanceType, count(id) as registrantCount FROM [dbo].[__2024register] group by attendanceType"

        Using con2 As New SqlConnection(Common.GetConnString())
            Using cmd2 As New SqlCommand(query2)
                Using sda2 As New SqlDataAdapter()
                    cmd2.Connection = con2
                    sda2.SelectCommand = cmd2
                    Using ds2 As New DataSet()
                        sda2.Fill(ds2)
                        attType.DataSource = ds2.Tables(0)
                        attType.DataBind()
                        attType.HeaderRow.TableSection = TableRowSection.TableHeader
                    End Using
                End Using
            End Using
        End Using

        Dim query3 As String = "SELECT top 3 country, count(id) as registrantCount FROM [dbo].[__2024register] group by country order by registrantCount desc"

        Using con3 As New SqlConnection(Common.GetConnString())
            Using cmd3 As New SqlCommand(query3)
                Using sda3 As New SqlDataAdapter()
                    cmd3.Connection = con3
                    sda3.SelectCommand = cmd3
                    Using ds3 As New DataSet()
                        sda3.Fill(ds3)
                        top3Country.DataSource = ds3.Tables(0)

                        top3Country.DataBind()
                        top3Country.HeaderRow.TableSection = TableRowSection.TableHeader
                    End Using
                End Using
            End Using
        End Using

        Dim query4 As String = "SELECT
	SUM(CASE WHEN IPmondayUNECE = 1 THEN 1 ELSE 0 END) as 'IPmonUNECE',
	SUM(CASE WHEN IPmondayBiogas = 1 THEN 1 ELSE 0 END) as 'IPmonBiogas',
	SUM(CASE WHEN IPmondayCoal = 1 THEN 1 ELSE 0 END) as 'IPmonCoal',
	SUM(CASE WHEN IPmondayGMI = 1 THEN 1 ELSE 0 END) as 'IPmonGMI',
	SUM(CASE WHEN IPtuesdayPlenary = 1 THEN 1 ELSE 0 END) as 'IPtuePlenary',
	SUM(CASE WHEN IPwednesdayCoal = 1 THEN 1 ELSE 0 END) as 'IPwedCoal',
	SUM(CASE WHEN IPwednesdayBiogas = 1 THEN 1 ELSE 0 END) as 'IPwedBiogas',
	SUM(CASE WHEN IPwednesdayOilGas = 1 THEN 1 ELSE 0 END) as 'IPwedOilGas',
    SUM(CASE WHEN IPthursdayUNECE = 1 THEN 1 ELSE 0 END) as 'IPthuUNECE',
	SUM(CASE WHEN IPmondayReception = 1 THEN 1 ELSE 0 END) as 'IPmonReception',
	SUM(CASE WHEN IPtuesdayReception = 1 THEN 1 ELSE 0 END) as 'IPtueReception',

	SUM(CASE WHEN VmondaySteering = 1 THEN 1 ELSE 0 END) as 'VmonSteering',
	SUM(CASE WHEN VmondayBiogas = 1 THEN 1 ELSE 0 END) as 'VmonBiogas',
	SUM(CASE WHEN VtuesdayPlenary = 1 THEN 1 ELSE 0 END) as 'VtuePlenary',
	SUM(CASE WHEN VwednesdayBiogas = 1 THEN 1 ELSE 0 END) as 'VwedBiogas'
FROM dbo.__2024register
"

        Using con4 As New SqlConnection(Common.GetConnString())
            Using cmd4 As New SqlCommand(query4)
                Using sda4 As New SqlDataAdapter()
                    cmd4.Connection = con4
                    sda4.SelectCommand = cmd4
                    Using ds4 As New DataSet()
                        sda4.Fill(ds4)
                        sums.DataSource = ds4.Tables(0)

                        sums.DataBind()
                        sums.HeaderRow.TableSection = TableRowSection.TableHeader
                    End Using
                End Using
            End Using
        End Using


        Dim constr As String = Common.GetConnString()
        Using con As SqlConnection = New SqlConnection(constr)
            Using cmd As SqlCommand = New SqlCommand("SELECT count(distinct country) as countryCount FROM [dbo].[__2024register]")
                cmd.CommandType = CommandType.Text
                cmd.Connection = con
                con.Open()
                Using sdr As SqlDataReader = cmd.ExecuteReader()
                    sdr.Read()
                    If sdr.HasRows = True Then
                        countryCount = sdr("countryCount").ToString()
                    Else
                    End If
                End Using
                con.Close()
            End Using
        End Using

        Using con As SqlConnection = New SqlConnection(constr)
            Using cmd As SqlCommand = New SqlCommand("SELECT count(id) as registrantCount FROM [dbo].[__2024register]")
                cmd.CommandType = CommandType.Text
                cmd.Connection = con
                con.Open()
                Using sdr As SqlDataReader = cmd.ExecuteReader()
                    sdr.Read()
                    If sdr.HasRows = True Then
                        regCount = sdr("registrantCount").ToString()
                    Else
                    End If
                End Using
                con.Close()
            End Using
        End Using

        Dim CstmColors = New Color() {Color.FromArgb(255, 0, 63, 92), Color.FromArgb(255, 47, 75, 124), Color.FromArgb(255, 102, 81, 145), Color.FromArgb(255, 160, 81, 149), Color.FromArgb(255, 212, 80, 135), Color.FromArgb(255, 249, 93, 106), Color.FromArgb(255, 255, 124, 67), Color.FromArgb(255, 255, 166, 0), Color.FromArgb(255, 255, 166, 0), Color.FromArgb(255, 255, 166, 0), Color.FromArgb(255, 0, 63, 92), Color.FromArgb(255, 47, 75, 124), Color.FromArgb(255, 102, 81, 145), Color.FromArgb(255, 160, 81, 149), Color.FromArgb(255, 212, 80, 135)}

        Dim dt1 As DataTable = Me.GetData1()
        Chart1.DataSource = dt1
        Chart1.Series(0).ChartType = SeriesChartType.Column
        Chart1.Series(0).XValueMember = "orgType"
        Chart1.Series(0).YValueMembers = "orgTypeCount"
        Chart1.DataBind()
        Chart1.ChartAreas(0).AxisX.MajorGrid.Enabled = False
        Chart1.ChartAreas(0).AxisX.MinorGrid.Enabled = False
        Chart1.ChartAreas(0).AxisY.MajorGrid.Enabled = False
        Chart1.ChartAreas(0).AxisY.MinorGrid.Enabled = False

        Dim i = 0
        For Each point In Chart1.Series(0).Points
            Chart1.Series(0).Points(i).Color = CstmColors(i)
            i = i + 1
        Next




        Dim dt2 As DataTable = Me.GetData2()
        Chart2.DataSource = dt2
        Chart2.Series(0).ChartType = SeriesChartType.Column
        Chart2.Series(0).XValueMember = "area"
        Chart2.Series(0).YValueMembers = "areaCount"
        Chart2.DataBind()
        Chart2.ChartAreas(0).AxisX.MajorGrid.Enabled = False
        Chart2.ChartAreas(0).AxisX.MinorGrid.Enabled = False
        Chart2.ChartAreas(0).AxisY.MajorGrid.Enabled = False
        Chart2.ChartAreas(0).AxisY.MinorGrid.Enabled = False

        Dim j = 0



    End Sub

    Private Function GetData1() As DataTable
        Dim constr As String = Common.GetConnString()
        Using con As New SqlConnection(constr)
            Using cmd As New SqlCommand("SELECT distinct orgType, count(orgType) as orgTypeCount FROM [dbo].[__2024register] group by orgType")
                Using sda As New SqlDataAdapter()
                    cmd.Connection = con
                    sda.SelectCommand = cmd
                    Using dt As New DataTable()
                        sda.Fill(dt)
                        Return dt
                    End Using
                End Using
            End Using
        End Using
    End Function

    Private Function GetData2() As DataTable
        Dim constr As String = Common.GetConnString()
        Using con As New SqlConnection(constr)
            Using cmd As New SqlCommand("SELECT distinct area, count(area) as areaCount FROM [dbo].[__2024formAOE] where area not like '%other%' group by area")
                Using sda As New SqlDataAdapter()
                    cmd.Connection = con
                    sda.SelectCommand = cmd
                    Using dt As New DataTable()
                        sda.Fill(dt)
                        Return dt
                    End Using
                End Using
            End Using
        End Using
    End Function

End Class