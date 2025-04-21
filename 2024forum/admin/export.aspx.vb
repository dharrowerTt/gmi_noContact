
Imports System.Data
Imports System.Configuration
Imports System.Data.SqlClient
Public Class export
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        Dim query As String = "SELECT R.id
	  ,R.[firstName]
      ,R.[lastName]
      ,R.[jobTitle]
      ,R.[country]
      ,R.[organization]
      ,R.[orgType]
      ,R.[email]
      ,R.[created]
      ,R.[attendanceType]
      ,cast (R.[IPmondayUNECE] as int) as IPmondayUNECE
      ,cast (R.[IPmondayBiogas] as int) as IPmondayBiogas
      ,cast (R.[IPmondayGMI] as int) as IPmondayGMI
	  ,cast (R.[IPmondayCoal] as int) as IPmondayCoal
      ,cast (R.[IPtuesdayPlenary] as int) as IPtuesdayPlenary
      ,cast (R.[IPwednesdayCoal] as int) as IPwednesdayCoal
      ,cast (R.[IPwednesdayBiogas] as int) as IPwednesdayBiogas
      ,cast (R.[IPwednesdayOilGas] as int) as IPwednesdayOilGas
	  ,cast (R.[IPthursdayUNECE] as int) as IPthursdayUNECE
      ,cast (R.[IPmondayReception] as int) as IPmondayReception
      ,cast (R.[IPtuesdayReception] as int) as IPtuesdayReception
      ,cast (R.[VmondayBiogas] as int) as VmondayBiogas
      ,cast (R.[VmondaySteering] as int) as VmondaySteering
      ,cast (R.[VtuesdayPlenary] as int) as VtuesdayPlenary
      ,cast (R.[VwednesdayBiogas] as int) as VwednesdayBiogas
      ,R.[poster]
      ,cast (R.[optOut]  as int) as optOut,
       (
           SELECT CONCAT(AOE.area, ', ') AS [data()]
           FROM __2024formAOE AOE
           WHERE R.id = AOE.registerid
           FOR XML PATH('')
       ) AS AreasOfInterest,
       (
           SELECT CONCAT(Project.area, ', ') AS [data()]
           FROM __2024formProjects Project
           WHERE R.id = Project.registerid
           FOR XML PATH('')
       ) AS ProjectsList
FROM [__2024register] R
LEFT JOIN __2024formAOE AOE ON R.id = AOE.registerid
LEFT JOIN __2024formProjects Project ON R.id = Project.registerid
GROUP BY R.id,R.[firstName]
      ,R.[lastName]
      ,R.[jobTitle]
      ,R.[country]
      ,R.[organization]
      ,R.[orgType]
      ,R.[email]
      ,R.[created]
      ,R.[attendanceType]
      ,R.[IPmondayUNECE]
      ,R.[IPmondayBiogas]
      ,R.[IPmondayGMI]
	  ,R.[IPmondayCoal]
      ,R.[IPtuesdayPlenary]
      ,R.[IPwednesdayCoal]
      ,R.[IPwednesdayBiogas]
      ,R.[IPwednesdayOilGas]
	  ,R.[IPthursdayUNECE]
      ,R.[IPmondayReception]
      ,R.[IPtuesdayReception]
      ,R.[VmondayBiogas]
      ,R.[VmondaySteering]
      ,R.[VtuesdayPlenary]
      ,R.[VwednesdayBiogas]
      ,R.[poster]
      ,R.[optOut]
"

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

    End Sub

End Class