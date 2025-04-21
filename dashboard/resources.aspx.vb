Imports System.Data
Imports System.Configuration
Imports System.Data.SqlClient
Public Class resources1
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load


		Dim query As String = ""
		query = "select count(resourceid) as totalResources from resources where status = 'Final'"

		Using con As New SqlConnection(Common.GetConnString())
			Using cmd As New SqlCommand(query)
				Using sda As New SqlDataAdapter()
					cmd.Connection = con
					sda.SelectCommand = cmd
					Using ds As New DataSet()
						sda.Fill(ds)
						KPI1.DataSource = ds.Tables(0)
						KPI1.DataBind()
						KPI1.HeaderRow.TableSection = TableRowSection.TableHeader
					End Using
				End Using
			End Using
		End Using

		query = "select countQuery.resourceCategory, count(countQuery.resourceid) as numResources from
	(
		select distinct R.resourceID, year(resourceFiledate) as resourceYear, year(getdate()) as currentyear, luC.resourceCategory
		from resources R 
			left join lu_resourceCategory luC on R.resourcecategoryID = luC.resourcecategoryID
		where status = 'Final' and year(getdate())-year(resourceFiledate)<3
	) as countQuery
group by resourceCategory
order by resourceCategory"

		Using con As New SqlConnection(Common.GetConnString())
			Using cmd As New SqlCommand(query)
				Using sda As New SqlDataAdapter()
					cmd.Connection = con
					sda.SelectCommand = cmd
					Using ds As New DataSet()
						sda.Fill(ds)
						Bar1.DataSource = ds.Tables(0)
						Bar1.DataBind()
						Bar1.HeaderRow.TableSection = TableRowSection.TableHeader
					End Using
				End Using
			End Using
		End Using

		query = "select countQuery.resourceCategory, count(countQuery.resourceid) as numResources from
	(
		select distinct R.resourceID, luC.resourceCategory
		from resources R 
			left join lu_resourceCategory luC on R.resourcecategoryID = luC.resourcecategoryID
		where status = 'Final'
	) as countQuery

group by resourceCategory
order by resourceCategory"

		Using con As New SqlConnection(Common.GetConnString())
			Using cmd As New SqlCommand(query)
				Using sda As New SqlDataAdapter()
					cmd.Connection = con
					sda.SelectCommand = cmd
					Using ds As New DataSet()
						sda.Fill(ds)
						Bar2.DataSource = ds.Tables(0)
						Bar2.DataBind()
						Bar2.HeaderRow.TableSection = TableRowSection.TableHeader
					End Using
				End Using
			End Using
		End Using

		query = "select countQuery.sector, count(countQuery.resourceid) as numResources from
	(
		select distinct R.resourceID,
		replace(
			replace(
				replace(
					replace(
						replace(
							replace(
								replace(
									replace(
										replace(
											replace(
												replace(
													replace(
														replace(CRS.sector,'biogas','Biogas'),
													'Agriculture','agri'),
												'agri','Biogas: Agriculture'),
											'Wastewater','ww'),
										'ww','Biogas: Wastewater'),
									'Municipal Solid Waste','msw'),
								'msw','Biogas: MSW'),
							'Coal Mines','coal'),
						'coal','Coal Mines'),
					'oilngas','Oil & Gas'),
				'Steering','steer'),
			'steer','Steering'),
		'mult','Multiple') as sector

	from resources R 
		left join cross_resource_sector CRS on R.resourceID = CRS.resourceID

	where status = 'Final'

	) as countQuery

group by sector
order by sector
"

		Using con As New SqlConnection(Common.GetConnString())
			Using cmd As New SqlCommand(query)
				Using sda As New SqlDataAdapter()
					cmd.Connection = con
					sda.SelectCommand = cmd
					Using ds As New DataSet()
						sda.Fill(ds)
						Bar3.DataSource = ds.Tables(0)
						Bar3.DataBind()
						Bar3.HeaderRow.TableSection = TableRowSection.TableHeader
					End Using
				End Using
			End Using
		End Using

		query = "select countQuery.language, count(countQuery.resourceid) as numResources from
	(
		select distinct R.resourceID, CRL.language
		from resources R 
			inner join cross_resource_language CRL on R.resourceID = CRL.resourceID
		where status = 'Final' and CRL.language <> 'English'
	) as countQuery

group by language
order by language
"

		Using con As New SqlConnection(Common.GetConnString())
			Using cmd As New SqlCommand(query)
				Using sda As New SqlDataAdapter()
					cmd.Connection = con
					sda.SelectCommand = cmd
					Using ds As New DataSet()
						sda.Fill(ds)
						Bar4.DataSource = ds.Tables(0)
						Bar4.DataBind()
						Bar4.HeaderRow.TableSection = TableRowSection.TableHeader
					End Using
				End Using
			End Using
		End Using

		query = "select subQuery1.resourceid, subQuery1.resourceName, subQuery1.resourceYear, subQuery1.resourceCategory, subQuery1.languageValue, STRING_AGG(subQuery1.sector,', ') as sectors
from
	(
		select distinct R.resourceID, trim(R.resourceName) as resourceName, R.resourceLink, year(R.resourceFiledate) as resourceYear,
		luC.resourceCategory, 
		IIF(CRL.language is null, 'English', CRL.language) as languageValue, 
		replace(
			replace(
				replace(
					replace(
						replace(
							replace(
								replace(
									replace(
										replace(
											replace(
												replace(
													replace(
														replace(CRS.sector,'biogas','Biogas'),
													'Agriculture','agri'),
												'agri','Biogas: Agriculture'),
											'Wastewater','ww'),
										'ww','Biogas: Wastewater'),
									'Municipal Solid Waste','msw'),
								'msw','Biogas: MSW'),
							'Coal Mines','coal'),
						'coal','Coal Mines'),
					'oilngas','Oil & Gas'),
				'Steering','steer'),
			'steer','Steering'),
		'mult','Multiple') as sector

	from resources R 
		left join cross_resource_sector CRS on R.resourceID = CRS.resourceID
		left join lu_resourceCategory luC on R.resourcecategoryID = luC.resourcecategoryID
		left join cross_resource_language CRL on R.resourceID = CRL.resourceID

	where status = 'Final'

	) as subQuery1

group by subQuery1.resourceid, subQuery1.resourceName, subQuery1.resourceYear, subQuery1.resourceCategory, subQuery1.languageValue
order by subQuery1.resourceName, subQuery1.resourceYear
"

		Using con As New SqlConnection(Common.GetConnString())
			Using cmd As New SqlCommand(query)
				Using sda As New SqlDataAdapter()
					cmd.Connection = con
					sda.SelectCommand = cmd
					Using ds As New DataSet()
						sda.Fill(ds)
						Table1.DataSource = ds.Tables(0)
						Table1.DataBind()
						Table1.HeaderRow.TableSection = TableRowSection.TableHeader
					End Using
				End Using
			End Using
		End Using

	End Sub

End Class