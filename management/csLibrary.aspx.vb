Imports System.Data.SqlClient

Public Class csLibrary
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            BindCaseStudies()
        End If
    End Sub

    Private Sub BindCaseStudies()
        Dim connString As String = Common.GetConnString()
        Dim query As String = "SELECT ID, thumbnail, csTitle, source, countryApplicability, briefSummary, gmiSectors, topics, startDate, url, csType FROM csCaseStudyRecords"

        Using conn As New SqlConnection(connString)
            Using cmd As New SqlCommand(query, conn)
                conn.Open()
                Dim reader As SqlDataReader = cmd.ExecuteReader()
                gvCaseStudies.DataSource = reader
                gvCaseStudies.DataBind()
            End Using
        End Using
    End Sub

    Protected Sub gvCaseStudies_PreRender(sender As Object, e As EventArgs)
        gvCaseStudies.UseAccessibleHeader = True
        gvCaseStudies.HeaderRow.TableSection = TableRowSection.TableHeader
    End Sub

    Protected Function FormatCountries(ByVal countries As String) As String
        If String.IsNullOrEmpty(countries) Then
            Return "N/A"
        End If

        Dim countryArray As String() = countries.Split(";"c)
        Dim result As New StringBuilder()

        For Each country As String In countryArray
            If Not String.IsNullOrWhiteSpace(country) Then
                result.AppendFormat("<span class='country-pill'>{0}</span> ", country.Trim())
            End If
        Next

        Return result.ToString().Trim()
    End Function
End Class
