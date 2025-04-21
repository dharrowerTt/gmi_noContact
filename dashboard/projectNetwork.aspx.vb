Imports System.Data
Imports System.Configuration
Imports System.Data.SqlClient
Public Class projectNetwork
    Inherits System.Web.UI.Page

	''START TABLE VIEW''
	Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
		Dim query As String = ""
		query = "select PNorgs.id, PNorgs.organizationName, PNorgs.yearJoined, PNorgs.lastupdate, PNorgs.organization_category_group, 
PNcontacts.numberOfActiveContacts, PNorgs.website, PNorgs.expertise, areasInterest, PNorgs.geographicInterest
from
	(select sfo.id, [name] as organizationName, year(sfo.createdDate) as yearJoined, FORMAT(sfo.lastModifiedDate,'yyyy-MM-dd') as lastupdate, 
	sfo.organization_category, 
		IIF(sfo.organization_category='Association','NGO',
			IIF(sfo.organization_category='Contractor','Private Sector',
				IIF(sfo.organization_category='International','NGO',
					IIF(sfo.organization_category='Research','Research/Academic',
						IIF(sfo.organization_category='University','Research/Academic',
						sfo.organization_category
						)
					)
				)
			)
		) as organization_category_group,
		sfo.website, sfo.expertise, 
		replace(replace(replace(sfo.Project_Network_Areas_of_Interest,';','; '),',',', '),'  ',' ') as areasInterest, 
		replace(replace(replace(sfo.Project_Network_Geographic_Interest,';','; '),',',', '),'  ',' ') as geographicInterest
		from sf_organizations sfo
		where sfo.Project_Network_Member>0) as PNorgs
	left join 
		(select sfc.organization, count(sfc.id) as numberOfActiveContacts
			from sf_contacts sfc
			where status='Active'
			group by sfc.organization
		) as PNcontacts
		on PNorgs.id=PNcontacts.organization
order by PNorgs.organizationName
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
		''START FINANCIAL TABLE VIEW''
		query = "select PNsummary.PN_Areas_of_Interest, sum(countOfPNOrgs) as NumPNOrgs
from (select 
		PNorgs.organization_category_group, 
		replace(
			replace(
				replace(
					replace(
						replace(
							replace(
								replace(
									replace(PNAOI.PN_Areas_of_Interest,
									'Wastewater','Biogas: Wastewater'),
								'MSW','Biogas: MSW'),
							'Agriculture','Biogas: Agriculture'),
						'Oil and Gas','Oil & Gas'),
					'Coal Mines','Coal'),
				'Other: Chemical industry','Other'),
			'Landfill','Biogas: MSW'),
		'Coal','Coal Mines') as PN_Areas_of_Interest, 
		count(PNorgs.id) as countOfPNOrgs

	from (select distinct
			sfo.id, 'Private Sector' as organization_category_group
			from sf_organizations sfo inner join sf_contacts on sfo.id=sf_contacts.organization
			where sfo.Project_Network_Member>0 
				and sf_contacts.status='Active'
				and sfo.organization_category in ('Financial Institution')
			) as PNorgs
			inner join
			(select id, value as 'PN_Areas_of_Interest' from sf_organizations 
				cross apply string_split(Project_Network_Areas_of_Interest,';')
			) as PNAOI
			on PNorgs.id=PNAOI.id
	group by PNorgs.organization_category_group, PNAOI.PN_Areas_of_Interest

) as PNsummary 
group by PNsummary.PN_Areas_of_Interest
order by PNsummary.PN_Areas_of_Interest"

		Using con As New SqlConnection(Common.GetConnString())
			Using cmd As New SqlCommand(query)
				Using sda As New SqlDataAdapter()
					cmd.Connection = con
					sda.SelectCommand = cmd
					Using ds As New DataSet()
						sda.Fill(ds)
						CountsPNOrganizationsActiveContactsFinancialInstitutions.DataSource = ds.Tables(0)
						CountsPNOrganizationsActiveContactsFinancialInstitutions.DataBind()
						CountsPNOrganizationsActiveContactsFinancialInstitutions.HeaderRow.TableSection = TableRowSection.TableHeader
					End Using
				End Using
			End Using
		End Using
		''START ACADEMICAL/RESEARCH TABLE VIEW''
		query = "select PNsummary.PN_Areas_of_Interest, sum(countOfPNOrgs) as NumPNOrgs
from (select 
		PNorgs.organization_category_group, 
		replace(
			replace(
				replace(
					replace(
						replace(
							replace(
								replace(
									replace(PNAOI.PN_Areas_of_Interest,
									'Wastewater','Biogas: Wastewater'),
								'MSW','Biogas: MSW'),
							'Agriculture','Biogas: Agriculture'),
						'Oil and Gas','Oil & Gas'),
					'Coal Mines','Coal'),
				'Other: Chemical industry','Other'),
			'Landfill','Biogas: MSW'),
		'Coal','Coal Mines') as PN_Areas_of_Interest, 
		count(PNorgs.id) as countOfPNOrgs

	from (select distinct
			sfo.id, 'Private Sector' as organization_category_group
			from sf_organizations sfo inner join sf_contacts on sfo.id=sf_contacts.organization
			where sfo.Project_Network_Member>0 
				and sf_contacts.status='Active'
				and sfo.organization_category in ('Research','University')
			) as PNorgs
			inner join
			(select id, value as 'PN_Areas_of_Interest' from sf_organizations 
				cross apply string_split(Project_Network_Areas_of_Interest,';')
			) as PNAOI
			on PNorgs.id=PNAOI.id
	group by PNorgs.organization_category_group, PNAOI.PN_Areas_of_Interest

) as PNsummary 
group by PNsummary.PN_Areas_of_Interest
order by PNsummary.PN_Areas_of_Interest
"

		Using con As New SqlConnection(Common.GetConnString())
			Using cmd As New SqlCommand(query)
				Using sda As New SqlDataAdapter()
					cmd.Connection = con
					sda.SelectCommand = cmd
					Using ds As New DataSet()
						sda.Fill(ds)
						CountsPNOrganizationsActiveContactsResearch.DataSource = ds.Tables(0)
						CountsPNOrganizationsActiveContactsResearch.DataBind()
						CountsPNOrganizationsActiveContactsResearch.HeaderRow.TableSection = TableRowSection.TableHeader
					End Using
				End Using
			End Using
		End Using

		''START OTHER ORGS TABLE VIEW''
		query = "select PNsummary.PN_Areas_of_Interest, sum(countOfPNOrgs) as NumPNOrgs
from (select 
		PNorgs.organization_category_group, 
		replace(
			replace(
				replace(
					replace(
						replace(
							replace(
								replace(
									replace(PNAOI.PN_Areas_of_Interest,
									'Wastewater','Biogas: Wastewater'),
								'MSW','Biogas: MSW'),
							'Agriculture','Biogas: Agriculture'),
						'Oil and Gas','Oil & Gas'),
					'Coal Mines','Coal'),
				'Other: Chemical industry','Other'),
			'Landfill','Biogas: MSW'),
		'Coal','Coal Mines') as PN_Areas_of_Interest, 
		count(PNorgs.id) as countOfPNOrgs

	from (select distinct
			sfo.id, 'Private Sector' as organization_category_group
			from sf_organizations sfo inner join sf_contacts on sfo.id=sf_contacts.organization
			where sfo.Project_Network_Member>0 
				and sf_contacts.status='Active'
				and sfo.organization_category in ('Other')
			) as PNorgs
			inner join
			(select id, value as 'PN_Areas_of_Interest' from sf_organizations 
				cross apply string_split(Project_Network_Areas_of_Interest,';')
			) as PNAOI
			on PNorgs.id=PNAOI.id
	group by PNorgs.organization_category_group, PNAOI.PN_Areas_of_Interest

) as PNsummary 
group by PNsummary.PN_Areas_of_Interest
order by PNsummary.PN_Areas_of_Interest"

		Using con As New SqlConnection(Common.GetConnString())
			Using cmd As New SqlCommand(query)
				Using sda As New SqlDataAdapter()
					cmd.Connection = con
					sda.SelectCommand = cmd
					Using ds As New DataSet()
						sda.Fill(ds)
						CountsPNOrganizationsActiveContactsOthers.DataSource = ds.Tables(0)
						CountsPNOrganizationsActiveContactsOthers.DataBind()
						CountsPNOrganizationsActiveContactsOthers.HeaderRow.TableSection = TableRowSection.TableHeader
					End Using
				End Using
			End Using
		End Using

		''START PRIVATE TABLE VIEW''
		query = "select PNsummary.PN_Areas_of_Interest, sum(countOfPNOrgs) as NumPNOrgs
from (select 
		PNorgs.organization_category_group, 
		replace(
			replace(
				replace(
					replace(
						replace(
							replace(
								replace(
									replace(PNAOI.PN_Areas_of_Interest,
									'Wastewater','Biogas: Wastewater'),
								'MSW','Biogas: MSW'),
							'Agriculture','Biogas: Agriculture'),
						'Oil and Gas','Oil & Gas'),
					'Coal Mines','Coal'),
				'Other: Chemical industry','Other'),
			'Landfill','Biogas: MSW'),
		'Coal','Coal Mines') as PN_Areas_of_Interest, 
		count(PNorgs.id) as countOfPNOrgs
 
	from (select distinct
			sfo.id, 'Private Sector' as organization_category_group
			from sf_organizations sfo inner join sf_contacts on sfo.id=sf_contacts.organization
			where sfo.Project_Network_Member>0 
				and sf_contacts.status='Active'
				and sfo.organization_category in ('Private Sector','Contractor')
			) as PNorgs
			inner join
			(select id, value as 'PN_Areas_of_Interest' from sf_organizations 
				cross apply string_split(Project_Network_Areas_of_Interest,';')
			) as PNAOI
			on PNorgs.id=PNAOI.id
	group by PNorgs.organization_category_group, PNAOI.PN_Areas_of_Interest
 
) as PNsummary 
group by PNsummary.PN_Areas_of_Interest
order by PNsummary.PN_Areas_of_Interest"

		Using con As New SqlConnection(Common.GetConnString())
			Using cmd As New SqlCommand(query)
				Using sda As New SqlDataAdapter()
					cmd.Connection = con
					sda.SelectCommand = cmd
					Using ds As New DataSet()
						sda.Fill(ds)
						CountsPNOrganizationsActiveContactsPrivate.DataSource = ds.Tables(0)
						CountsPNOrganizationsActiveContactsPrivate.DataBind()
						CountsPNOrganizationsActiveContactsPrivate.HeaderRow.TableSection = TableRowSection.TableHeader
					End Using
				End Using
			End Using
		End Using

		''START GOV TABLE VIEW''
		query = "select PNsummary.PN_Areas_of_Interest, sum(countOfPNOrgs) as NumPNOrgs
from (select 
		PNorgs.organization_category_group, 
		replace(
			replace(
				replace(
					replace(
						replace(
							replace(
								replace(
									replace(PNAOI.PN_Areas_of_Interest,
									'Wastewater','Biogas: Wastewater'),
								'MSW','Biogas: MSW'),
							'Agriculture','Biogas: Agriculture'),
						'Oil and Gas','Oil & Gas'),
					'Coal Mines','Coal'),
				'Other: Chemical industry','Other'),
			'Landfill','Biogas: MSW'),
		'Coal','Coal Mines') as PN_Areas_of_Interest, 
		count(PNorgs.id) as countOfPNOrgs

	from (select distinct
			sfo.id, 'Private Sector' as organization_category_group
			from sf_organizations sfo inner join sf_contacts on sfo.id=sf_contacts.organization
			where sfo.Project_Network_Member>0 
				and sf_contacts.status='Active'
				and sfo.organization_category in ('Government')
			) as PNorgs
			inner join
			(select id, value as 'PN_Areas_of_Interest' from sf_organizations 
				cross apply string_split(Project_Network_Areas_of_Interest,';')
			) as PNAOI
			on PNorgs.id=PNAOI.id
	group by PNorgs.organization_category_group, PNAOI.PN_Areas_of_Interest

) as PNsummary 
group by PNsummary.PN_Areas_of_Interest
order by PNsummary.PN_Areas_of_Interest"

		Using con As New SqlConnection(Common.GetConnString())
			Using cmd As New SqlCommand(query)
				Using sda As New SqlDataAdapter()
					cmd.Connection = con
					sda.SelectCommand = cmd
					Using ds As New DataSet()
						sda.Fill(ds)
						CountsPNOrganizationsActiveContactsGov.DataSource = ds.Tables(0)
						CountsPNOrganizationsActiveContactsGov.DataBind()
						CountsPNOrganizationsActiveContactsGov.HeaderRow.TableSection = TableRowSection.TableHeader
					End Using
				End Using
			End Using
		End Using

		''START NON-GOV TABLE VIEW''
		query = "select PNsummary.PN_Areas_of_Interest, sum(countOfPNOrgs) as NumPNOrgs
from (select 
		PNorgs.organization_category_group, 
		replace(
			replace(
				replace(
					replace(
						replace(
							replace(
								replace(
									replace(PNAOI.PN_Areas_of_Interest,
									'Wastewater','Biogas: Wastewater'),
								'MSW','Biogas: MSW'),
							'Agriculture','Biogas: Agriculture'),
						'Oil and Gas','Oil & Gas'),
					'Coal Mines','Coal'),
				'Other: Chemical industry','Other'),
			'Landfill','Biogas: MSW'),
		'Coal','Coal Mines') as PN_Areas_of_Interest, 
		count(PNorgs.id) as countOfPNOrgs

	from (select distinct
			sfo.id, 'Private Sector' as organization_category_group
			from sf_organizations sfo inner join sf_contacts on sfo.id=sf_contacts.organization
			where sfo.Project_Network_Member>0 
				and sf_contacts.status='Active'
				and sfo.organization_category in ('NGO','Association','International')
			) as PNorgs
			inner join
			(select id, value as 'PN_Areas_of_Interest' from sf_organizations 
				cross apply string_split(Project_Network_Areas_of_Interest,';')
			) as PNAOI
			on PNorgs.id=PNAOI.id
	group by PNorgs.organization_category_group, PNAOI.PN_Areas_of_Interest

) as PNsummary 
group by PNsummary.PN_Areas_of_Interest
order by PNsummary.PN_Areas_of_Interest"

		Using con As New SqlConnection(Common.GetConnString())
			Using cmd As New SqlCommand(query)
				Using sda As New SqlDataAdapter()
					cmd.Connection = con
					sda.SelectCommand = cmd
					Using ds As New DataSet()
						sda.Fill(ds)
						CountsPNOrganizationsActiveContactsNonGov.DataSource = ds.Tables(0)
						CountsPNOrganizationsActiveContactsNonGov.DataBind()
						CountsPNOrganizationsActiveContactsNonGov.HeaderRow.TableSection = TableRowSection.TableHeader
					End Using
				End Using
			End Using
		End Using

		''START Pie chart 1 for Active PN Contacts by Category''
		query = "select PNorgs.organization_category_group, count(PNorgs.id) as numPNOrgs
from
	(select sfo.id, 
		IIF(sfo.organization_category='Association','NGO',
			IIF(sfo.organization_category='Contractor','Private Sector',
				IIF(sfo.organization_category='International','NGO',
					IIF(sfo.organization_category='Research','Research/Academic',
						IIF(sfo.organization_category='University','Research/Academic',
						sfo.organization_category
						)
					)
				)
			)
		) as organization_category_group
		from sf_organizations sfo
		where sfo.Project_Network_Member>0) as PNorgs
	inner join 
		(select distinct sfc.organization from sf_contacts sfc where status='Active') as PNcontacts
		on PNorgs.id=PNcontacts.organization
group by PNorgs.organization_category_group
order by numPNOrgs desc
"

		Using con As New SqlConnection(Common.GetConnString())
			Using cmd As New SqlCommand(query)
				Using sda As New SqlDataAdapter()
					cmd.Connection = con
					sda.SelectCommand = cmd
					Using ds As New DataSet()
						sda.Fill(ds)
						PieChart1.DataSource = ds.Tables(0)
						PieChart1.DataBind()
						PieChart1.HeaderRow.TableSection = TableRowSection.TableHeader
					End Using
				End Using
			End Using
		End Using

		''START Pie chart 2 for Active PN Contacts by Category''
		query = "select PNorgs.organization_category_group, count(PNorgs.id) as numPNOrgs, sum(PNcontacts.numberOfActiveContacts) as totalNumActivePNContacts
from
	(select sfo.id, 
		IIF(sfo.organization_category='Association','NGO',
			IIF(sfo.organization_category='Contractor','Private Sector',
				IIF(sfo.organization_category='International','NGO',
					IIF(sfo.organization_category='Research','Research/Academic',
						IIF(sfo.organization_category='University','Research/Academic',
						sfo.organization_category
						)
					)
				)
			)
		) as organization_category_group
		from sf_organizations sfo
		where sfo.Project_Network_Member>0) as PNorgs
	inner join 
		(select sfc.organization, count(sfc.id) as numberOfActiveContacts
			from sf_contacts sfc
			where status='Active'
			group by sfc.organization
		) as PNcontacts
		on PNorgs.id=PNcontacts.organization
group by PNorgs.organization_category_group
order by numPNOrgs desc
"

		Using con As New SqlConnection(Common.GetConnString())
			Using cmd As New SqlCommand(query)
				Using sda As New SqlDataAdapter()
					cmd.Connection = con
					sda.SelectCommand = cmd
					Using ds As New DataSet()
						sda.Fill(ds)
						PieChart2.DataSource = ds.Tables(0)
						PieChart2.DataBind()
						PieChart2.HeaderRow.TableSection = TableRowSection.TableHeader
					End Using
				End Using
			End Using
		End Using

		''START Total number of PN Orgs with Active Contacts''
		query = "select count(PNorgs.id) as numPNOrgs
from
	(select id from sf_organizations where Project_Network_Member>0) as PNorgs
	inner join 
	(select distinct organization from sf_contacts where [status]='Active') as PNcontacts
	on PNorgs.id=PNcontacts.organization
"

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

		''START Total number of PN Orgs with Active Contacts''
		query = "select count(sfc.id) as numPNActiveContacts
from sf_organizations sfo inner join sf_contacts sfc on sfo.id=sfc.organization
where sfo.Project_Network_Member>0 and sfc.status='Active'"

		Using con As New SqlConnection(Common.GetConnString())
			Using cmd As New SqlCommand(query)
				Using sda As New SqlDataAdapter()
					cmd.Connection = con
					sda.SelectCommand = cmd
					Using ds As New DataSet()
						sda.Fill(ds)
						KPI2.DataSource = ds.Tables(0)
						KPI2.DataBind()
						KPI2.HeaderRow.TableSection = TableRowSection.TableHeader
					End Using
				End Using
			End Using
		End Using


	End Sub

End Class