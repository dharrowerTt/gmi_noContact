Public Class resources
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        Page.MaintainScrollPositionOnPostBack = True
        If Not Me.IsPostBack Then






            Me.BindGrid()




        End If
    End Sub


    Private Sub BindGrid(Optional ByVal direction As String = "", Optional ByVal sortExpression As String = "")



        'LitresourcesCount.Text = "(0)"
        Dim data As New clsSearchDAO()
        Dim dt As DataTable = data.GetTopSearchResults(8, "", "", "", "'Resource'", "", "", "", "", 0, 1)


        Dim ds As DataSet = Nothing
        ds = New DataSet()
        dt.TableName = "dt"
        ds.Tables.Add(dt)

        'If dt Is Nothing Or dt.Rows.Count < 1 Then
        'Else

        Try
            Dim featuredResources As DataTable
            featuredResources = dt.AsEnumerable().Take(8).CopyToDataTable()
            Dim myLabel = New Literal
            myLabel.Text = ""
            For x = 0 To featuredResources.Rows.Count - 1


                Dim curImg As String = Server.MapPath(featuredResources.Rows(x)("ImgURL"))
                Dim curImgAlt As String = Server.MapPath("/images/" & featuredResources.Rows(x)("ImgURL").ToString)
                Dim curAltImg As String = ""
                If System.IO.File.Exists(curImg) = True Then
                    myLabel.Text += "<li><a href ='resource_details.aspx?r=" & featuredResources.Rows(x)("ID").ToString & "'><div class='resImg'><img src='" & featuredResources.Rows(x)("ImgURL").ToString & "' style='width:175px;height:115px;overflow:hidden;'/>"
                    myLabel.Text += "</div> <br><span>" & featuredResources.Rows(x)("LinkText").ToString & "</span></a></li>"

                ElseIf System.IO.File.Exists(curImgAlt) = True Then
                    myLabel.Text += "<li><a href ='resource_details.aspx?r=" & featuredResources.Rows(x)("ID").ToString & "'><div class='resImg'><img src='/images/" & featuredResources.Rows(x)("ImgURL").ToString & "' style='width:175px;height:115px;overflow:hidden;'/>"
                    myLabel.Text += "</div> <br><span>" & featuredResources.Rows(x)("LinkText").ToString & "</span></a></li>"

                Else
                    myLabel.Text += "<li><a href ='resource_details.aspx?r=" & featuredResources.Rows(x)("ID").ToString & "'><div class='resImg'><img src='/images/" & Left(Replace(Replace(featuredResources.Rows(x)("sectors"), " ", ""), ";", ""), 5).ToString & ".jpg' style='width:175px;height:115px;overflow:hidden;'/>"
                    myLabel.Text += "</div> <br><span>" & featuredResources.Rows(x)("LinkText").ToString & "</span></a></li>"

                End If
            Next
            PHfeaturedresources.Controls.Add(myLabel)







            'Results1.DataSource = dt
            'Results1.DataBind()

        Catch
            PHfeaturedresources.Visible = False


        End Try

        'LitresourcesCount.Text = "(0)"

        Dim topiclist As DataTable = data.GetTopicList("", "", "", "'Resource'", "", "", "", "", 0, 1)


        topicRepeater.DataSource = topiclist
        topicRepeater.DataBind()

        Dim sectorList As DataTable = data.GetSectorList("", "", "", "'Resource'", "", "", "", "", 0, 1)


        sectorRepeater.DataSource = sectorList
        sectorRepeater.DataBind()

        Dim countryList As DataTable = data.GetCountryList("", "", "", "'Resource'", "", "", "", "", 0, 1)


        countryRepeater.DataSource = countryList
        countryRepeater.DataBind()
    End Sub

    Sub countryItemDataBound(Sender As Object, e As RepeaterItemEventArgs)
        Dim litCountry As New Literal
        litCountry.Text = "<li><a href='resources_filtered.aspx?c=" & e.Item.DataItem("countryid") & "'>" & e.Item.DataItem("country") & "</a></li>"
        countryRepeater.Controls.Add(litCountry)
    End Sub

    Sub sectorItemDataBound(Sender As Object, e As RepeaterItemEventArgs)
        Dim litSector As New Literal
        litSector.Text = "<li><a href='resources_filtered.aspx?s=" & e.Item.DataItem("sectorAbbr") & "'>" & e.Item.DataItem("sector") & "</a></li>"
        sectorRepeater.Controls.Add(litSector)
    End Sub
End Class