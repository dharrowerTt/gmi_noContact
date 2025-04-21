Imports System.Data
Imports System.Data.SqlClient
Imports System.Configuration
Imports System.Web.Services
Public Class FeatureSelection
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Me.IsPostBack Then
            Dim dummy As DataTable = New DataTable()
            dummy.Columns.Add("Thumbnail")
            dummy.Columns.Add("ResourceName")
            dummy.Columns.Add("Sector")
            dummy.Columns.Add("Featured")
            dummy.Rows.Add()
            gvResources.DataSource = dummy
            gvResources.DataBind()

            'Required for jQuery DataTables to work.
            gvResources.UseAccessibleHeader = True
            gvResources.HeaderRow.TableSection = TableRowSection.TableHeader
        End If
    End Sub

    Public Class Resources
        Public Property Thumbnail As String
        Public Property ResourceName As String
        Public Property Sector As String
        Public Property Featured As String
    End Class



    <WebMethod()>
    Public Shared Function GetResources() As List(Of Resources)


        Dim resourceList As List(Of Resources) = New List(Of Resources)()
        Dim constr As String = Common.GetConnString()
        Using con As SqlConnection = New SqlConnection(constr)
            Using cmd As SqlCommand = New SqlCommand("SELECT  dbo.Resources.resourceImage, featuredbiogas, featuredcoal, featuredoilgas, dbo.Resources.resourceName, YEAR(dbo.Resources.resourceFiledate) AS resourceYear, dbo.Resources.resourceid, { fn CONCAT('/resources/details.aspx?resourceid=',
                         CAST(dbo.Resources.resourceid AS varchar)) } AS resourceLink, dbo.Resources.ResourceTopic, lu_FileType.fileType, dbo.cross_resource_language.Language, REPLACE(getsectorlist.sectorlist, '&', 'and') AS sectorList,
                         gettopicslist.topiclist, getcountrylist.countrylist, lu_resourceCategory.resourceCategory
FROM            dbo.Resources LEFT OUTER JOIN
                         dbo.lu_fileType ON resources.filetypeID = lu_FileType.filetypeID LEFT OUTER JOIN
                         dbo.cross_resource_language ON resources.resourceid = cross_resource_language.resourceid LEFT OUTER JOIN
                         dbo.lu_resourceCategory ON resources.resourcecategoryID = lu_resourceCategory.resourceCategoryID LEFT OUTER JOIN
                             (SELECT        resourceid AS sl_rid, string_agg(sector, ',') AS sectorlist
                               FROM            (SELECT        cross_resource_sector.resourceid, lu_sector.sector
                                                         FROM            dbo.cross_resource_sector INNER JOIN
                                                                                   dbo.lu_sector ON cross_resource_sector.sector = lu_sector.sectorabbr) AS cross_resource_sector2
                               GROUP BY resourceid) AS getsectorlist ON resources.resourceid = getsectorlist.sl_rid LEFT OUTER JOIN
                             (SELECT        resourceid AS tl_rid, string_agg(topic, ',') AS topiclist
                               FROM            dbo.cross_resource_topic
                               GROUP BY resourceid) AS gettopicslist ON resources.resourceid = gettopicslist.tl_rid LEFT OUTER JOIN
                             (SELECT        resourceid AS cl_rid, string_agg(country, ',') AS countrylist
                               FROM            dbo.cross_resource_country
                               GROUP BY resourceid) AS getcountrylist ON resources.resourceid = getcountrylist.cl_rid
WHERE        (resources.status = 'final') AND (resources.resourceName NOT LIKE '%challenge story%') AND LEN(resourceImage) > 1 AND LEN(resourceName) > 1 AND LEN(sectorList) > 1
ORDER BY dbo.Resources.resourceFiledate DESC", con)
                con.Open()
                Using sdr As SqlDataReader = cmd.ExecuteReader()
                    While sdr.Read()
                        resourceList.Add(New Resources With {
                            .Thumbnail = sdr("resourceImage").ToString(),
                            .ResourceName = sdr("resourceName").ToString(),
                            .Sector = sdr("sectorList").ToString(),
                            .Featured = " "
                        })
                    End While
                End Using
                con.Close()
            End Using
        End Using
        Return resourceList
    End Function

End Class