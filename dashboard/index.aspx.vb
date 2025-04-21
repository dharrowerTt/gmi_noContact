Imports System.Data
Imports System.Configuration
Imports System.Web.Script.Serialization
Imports System.Data.SqlClient
Public Class index17
    Inherits System.Web.UI.Page

    Public Shared countOfPN As String

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        Using connObj As New SqlClient.SqlConnection(Common.GetConnString())
            Using cmdObj As New SqlClient.SqlCommand("select count([name]) as PNCount from sf_countries where status='member' and [name] not like '%Natural Gas%' ", connObj)
                connObj.Open()
                Using readerObj As SqlClient.SqlDataReader = cmdObj.ExecuteReader
                    'This will loop through all returned records 
                    While readerObj.Read
                        countOfPN = readerObj("PNCount").ToString
                        'handle returned value before next loop here
                    End While
                End Using
                connObj.Close()
            End Using
        End Using

        Dim PCTablequery As String = "select SFC.[name] as countryName, YEAR(SFC.[date_joined]) as countryYearJoined,  IIF(SFC.steering_committee>0, IIF(SFC.[name] in (select distinct sf_countries.[name]  from sf_committee_delegate  inner join sf_countries on sf_countries.id = sf_committee_delegate.Country_Representing  where sf_committee_delegate.committee_role='Chair'), 'Steering Committee Chair', IIF(SFC.[name] in ( select distinct sf_countries.[name] from sf_committee_delegate  inner join sf_countries on sf_countries.id = sf_committee_delegate.Country_Representing  where sf_committee_delegate.committee_role='Vice Chair'),'Steering Committee Vice Chair', 'Steering Committee') ), '') as SteeringCommitteeMember from sf_countries SFC  where SFC.status='member' and SFC.[name] not like '%Natural Gas%' order by countryName "

        Using con As New SqlConnection(Common.GetConnString())
            Using cmd As New SqlCommand(PCTablequery)
                Using sda As New SqlDataAdapter()
                    cmd.Connection = con
                    sda.SelectCommand = cmd
                    Using ds As New DataSet()
                        sda.Fill(ds)
                        PCTable.DataSource = ds.Tables(0)
                        PCTable.DataBind()
                        PCTable.HeaderRow.TableSection = TableRowSection.TableHeader
                    End Using
                End Using
            End Using
        End Using

        Dim DeleTablequery As String = "select SFC.[name] as countryName, delegateList.FirstName, delegateList.LastName, delegateList.email, delegateList.OrganizationName,  delegateList.committeeName,  IIF(delegateList.Committee_Role='Chair','Chair', IIF(delegateList.Committee_Role='Vice Chair','Vice Chair', IIF(delegateList.Chair=1,'Chair', IIF(delegateList.Alternate=1,'Alternate', IIF(delegateList.committeeName is NULL,'','Delegate' ))))) as Role from sf_countries SFC left join ( select D.committee_role, D.Alternate, D.Chair, D.Country_Representing, IIF(SFCOM.[name]='Agriculture Technical Group', 'Biogas: Agriculture Technical Group', IIF(SFCOM.[name]='MSW Technical Group', 'Biogas: MSW Technical Group', IIF(SFCOM.[name]='Wastewater Technical Group', 'Biogas: Wastewater Technical Group', SFCOM.[name] ) ) ) as committeeName, C.FirstName, C.LastName, C.email, O.[name] as 'OrganizationName' from sf_committee_delegate D  inner join sf_contacts C on D.contact = C.id inner join sf_organizations O on C.organization = O.id inner join sf_committee SFCOM on D.committee = SFCOM.id where  D.active=1 and C.status='active' ) as delegateList on SFC.id = delegateList.Country_Representing where SFC.status='member' and SFC.[name] not like '%Natural Gas%' order by countryName, delegateList.LastName, delegateList.FirstName, committeeName "

        Using con As New SqlConnection(Common.GetConnString())
            Using cmd As New SqlCommand(DeleTablequery)
                Using sda As New SqlDataAdapter()
                    cmd.Connection = con
                    sda.SelectCommand = cmd
                    Using ds As New DataSet()
                        sda.Fill(ds)
                        dtable.DataSource = ds.Tables(0)
                        dtable.DataBind()
                        dtable.HeaderRow.TableSection = TableRowSection.TableHeader
                    End Using
                End Using
            End Using
        End Using


    End Sub



End Class