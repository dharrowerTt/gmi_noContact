Imports System.Data.SqlClient
Public Class index19
    Inherits System.Web.UI.Page
    Public Shared CountryData As String = ""
    Public Shared CountryCount As Integer = 0
    Public Shared CountryCountString As String = ""
    Public Shared CountryCount2 As Integer = 0
    Public Shared CountryCountString2 As String = ""

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        CountryData = ""


        Dim queryCountry As String = "SELECT  country, f2, COUNT(email) AS Expr1 FROM dbo.__2024register left join dbo.countryLookup on __2024register.country = countryLookUp.F1 where not country = 'N/A' GROUP BY country, f2 ORDER BY Expr1 DESC"

        Using con2 As New SqlConnection(Common.GetConnString())
            Using cmd2 As New SqlCommand(queryCountry)
                Using sda2 As New SqlDataAdapter()
                    cmd2.Connection = con2
                    sda2.SelectCommand = cmd2
                    Using ds2 As New DataSet()
                        sda2.Fill(ds2)
                        Dim dc As DataColumn
                        Dim dr As DataRow

                        For Each dr In ds2.Tables(0).Rows

                            CountryData += "{'id': '" & dr(1).ToString & "','name': '" & dr(0).ToString & "','Popvalue': '" & dr(0).ToString & ": " & dr(2).ToString & "','fill': am4core.color('#82589F')},"



                        Next
                        CountryData += "{'id': 'ZZ','name': 'zz','Popvalue': 0,'fill': am4core.color('#5C5CFF')}"

                    End Using
                End Using
            End Using
        End Using
        ''''''''''''''''''''''''''''''''''''''''''''''''''
        Dim queryCount As String = "SELECT  COUNT(email) AS Expr1 FROM dbo.__2024register"

        Using con2 As New SqlConnection(Common.GetConnString())
            Using cmd2 As New SqlCommand(queryCount)
                Using sda2 As New SqlDataAdapter()
                    cmd2.Connection = con2
                    sda2.SelectCommand = cmd2
                    Using ds3 As New DataSet()
                        sda2.Fill(ds3)
                        Dim dc2 As DataColumn
                        Dim dr2 As DataRow

                        For Each dr2 In ds3.Tables(0).Rows

                            CountryCount = dr2(0)

                        Next

                    End Using
                End Using
            End Using
        End Using

        If CountryCount = 200 Then
            CountryCountString = "200"
        End If
        If CountryCount > 200 Then
            CountryCountString = "More than 200"
        End If
        If CountryCount > 240 Then
            CountryCountString = "More than 240"
        End If
        If CountryCount > 250 Then
            CountryCountString = "More than 250"
        End If

        If CountryCount = 300 Then
            CountryCountString = "300"
        End If
        If CountryCount > 300 Then
            CountryCountString = "ore than 300"
        End If
        If CountryCount > 320 Then
            CountryCountString = "More than 320"
        End If
        If CountryCount > 330 Then
            CountryCountString = "More than 330"
        End If
        If CountryCount > 340 Then
            CountryCountString = "More than 340"
        End If
        If CountryCount = 350 Then
            CountryCountString = "350"
        End If
        If CountryCount > 350 Then
            CountryCountString = "More than 350"
        End If
        If CountryCount > 375 Then
            CountryCountString = "More than 375"
        End If
        If CountryCount = 400 Then
            CountryCountString = "400"
        End If
        If CountryCount > 425 Then
            CountryCountString = "More than 400"
        End If
        If CountryCount = 450 Then
            CountryCountString = "450"
        End If
        If CountryCount > 450 Then
            CountryCountString = "More than 450"
        End If
        If CountryCount > 475 Then
            CountryCountString = "More than 475"
        End If
        If CountryCount = 500 Then
            CountryCountString = "More than 500"
        End If
        If CountryCount > 520 Then
            CountryCountString = "More than 520"
        End If
        If CountryCount > 575 Then
            CountryCountString = "More than 575"
        End If
        If CountryCount = 600 Then
            CountryCountString = "600"
        End If
        If CountryCount > 600 Then
            CountryCountString = "More than 600"
        End If
        If CountryCount > 625 Then
            CountryCountString = "More than 625"
        End If
        If CountryCount = 650 Then
            CountryCountString = "650"
        End If
        If CountryCount > 650 Then
            CountryCountString = "More than 650"
        End If
        If CountryCount > 675 Then
            CountryCountString = "More than 675"
        End If
        If CountryCount = 700 Then
            CountryCountString = "700"
        End If
        If CountryCount > 700 Then
            CountryCountString = "More than 700"
        End If
        If CountryCount = 750 Then
            CountryCountString = "750"
        End If
        If CountryCount > 725 Then
            CountryCountString = "More than 725"
        End If
        If CountryCount = 750 Then
            CountryCountString = "750"
        End If
        If CountryCount > 750 Then
            CountryCountString = "More than 750"
        End If
        If CountryCount = 775 Then
            CountryCountString = "775"
        End If
        If CountryCount > 775 Then
            CountryCountString = "More than 775"
        End If
        If CountryCount = 800 Then
            CountryCountString = "800"
        End If
        If CountryCount > 800 Then
            CountryCountString = "More than 800"
        End If
        If CountryCount > 975 Then
            CountryCountString = "More than 975"
        End If
        If CountryCount = 1000 Then
            CountryCountString = "1000"
        End If
        If CountryCount > 1000 Then
            CountryCountString = "More than 1000"
        End If
        If CountryCount = 1050 Then
            CountryCountString = "1050"
        End If

        ''''''''''''''''''''''''''''''''''
        Dim queryCount2 As String = "SELECT  distinct COUNT(country) AS Expr1 FROM dbo.__2024register"

        Using con2 As New SqlConnection(Common.GetConnString())
            Using cmd3 As New SqlCommand(queryCount2)
                Using sda3 As New SqlDataAdapter()
                    cmd3.Connection = con2
                    sda3.SelectCommand = cmd3
                    Using ds4 As New DataSet()
                        sda3.Fill(ds4)
                        Dim dc3 As DataColumn
                        Dim dr3 As DataRow

                        For Each dr3 In ds4.Tables(0).Rows

                            CountryCount2 = dr3(0)

                        Next

                    End Using
                End Using
            End Using
        End Using

        If CountryCount2 > 40 Then
            CountryCountString2 = "40"
        End If

        If CountryCount2 > 50 Then
            CountryCountString2 = "50"
        End If

        If CountryCount2 > 60 Then
            CountryCountString2 = "60"
        End If

        If CountryCount2 > 70 Then
            CountryCountString2 = "70"
        End If

        If CountryCount2 > 80 Then
            CountryCountString2 = "80"
        End If
    End Sub

End Class