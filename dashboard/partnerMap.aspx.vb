Imports System.Data
Imports System.Configuration
Imports System.Web.Script.Serialization
Imports System.Data.SqlClient
Public Class partnerMap
    Inherits System.Web.UI.Page
    Public Shared PartnerMapJSON As String
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim MapTablequery As String = "select SFC.[name] as countryName, delegateList.committeeName, delegateList.numDelegates from sf_countries SFC left join ( select D.Country_Representing,  IIF(SFCOM.[name]='Agriculture Technical Group', 'Biogas: Agriculture Technical Group', IIF(SFCOM.[name]='MSW Technical Group', 'Biogas: MSW Technical Group', IIF(SFCOM.[name]='Wastewater Technical Group', 'Biogas: Wastewater Technical Group', SFCOM.[name]) ) ) as committeeName, count(c.id) as numDelegates  from sf_committee_delegate D  inner join sf_contacts C on D.contact = C.id inner join sf_organizations O on C.organization = O.id inner join sf_committee SFCOM on D.committee = SFCOM.id where  D.active=1 and C.status='active' group by D.Country_Representing, SFCOM.[name] ) as delegateList on SFC.id = delegateList.Country_Representing where SFC.status='member' and SFC.[name] not like '%Natural Gas%' order by countryName, committeeName "

        Using con As New SqlConnection(Common.GetConnString())
            Using cmd As New SqlCommand(MapTablequery)
                Using sda As New SqlDataAdapter()
                    cmd.Connection = con
                    sda.SelectCommand = cmd
                    Using ds As New DataSet()
                        sda.Fill(ds)
                        PartnerMapJSON = DataSetToJSON(ds).ToString
                    End Using
                End Using
            End Using
        End Using
    End Sub

    Function DataSetToJSON(ds As DataSet) As String
        Dim dict As New Dictionary(Of String, Object)

        For Each dt As DataTable In ds.Tables
            Dim arr(dt.Rows.Count) As Object
            For i As Integer = 0 To dt.Rows.Count - 1
                arr(i) = dt.Rows(i).ItemArray
            Next
            dict.Add(dt.TableName, arr)
        Next

        Dim json As New JavaScriptSerializer
        Return json.Serialize(dict)

    End Function

End Class