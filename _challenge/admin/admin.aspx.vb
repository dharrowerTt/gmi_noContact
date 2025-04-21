Public Class admin
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



        'LitresourcesCount.Text = "(0)"


        Dim commitList As DataTable = Nothing
        Dim commitList2 As DataTable = Nothing



        commitList = data.GetCommitments("", "", "", "'Resource'", "", "", "", "", 0, 1)


        If commitList Is Nothing Or commitList.Rows.Count < 1 Then

        Else
            countryRepeater.DataSource = commitList
            countryRepeater.DataBind()
        End If

        ' commitList2 = data.GetDetails("", "", "", "'Resource'", "", "", "", "", 0, 1)

        'If commitList2 Is Nothing Or commitList2.Rows.Count < 1 Then

        'Else
        'Repeater1.DataSource = commitList2
        'Repeater1.DataBind()
        'End If

    End Sub

    Sub countryItemDataBound(Sender As Object, e As RepeaterItemEventArgs)
        Dim litCountry As New Literal

        litCountry.Text = "<tr><td><a href='mailto:" & e.Item.DataItem("emailAddress") & "'>" & e.Item.DataItem("salutation") & " " & e.Item.DataItem("firstName") & " " & e.Item.DataItem("lastName") & "</a></td><td>" & e.Item.DataItem("actionType") & " - " & e.Item.DataItem("organization") & "</td><td>" & e.Item.DataItem("gmiRelationship") & "</td><td>" & e.Item.DataItem("commitment") & "</td><td><button type='button' class='btn btn-info btn-lg'data-toggle='modal' data-target='#myModal" & e.Item.DataItem("challengeID") & "'><i class='fa fa-cogs' aria-hidden='true'></i></button></td></tr>"
        countryRepeater.Controls.Add(litCountry)
    End Sub


    Sub moreDetailsDataBound(Sender As Object, e As RepeaterItemEventArgs)
        Dim moreDetails As New Literal

        moreDetails.Text = "<div id='myModal" & e.Item.DataItem("challengeID") & "' class='modal fade' role='dialog'>  <div class='modal-dialog'><div class='modal-content'><div class='modal-body'><p> <b>Contact:</b> " & e.Item.DataItem("salutation") & " " & e.Item.DataItem("firstName") & " " & e.Item.DataItem("lastName") & "<br><b>Action Type: </b>" & e.Item.DataItem("actionType") & "<br><b>Organization:</b> " & e.Item.DataItem("Organization") & "<br><b>GMI Relationship:</b> " & e.Item.DataItem("gmiRelationship") & " <br></p></div><div class='modal-footer'><button type='button' class='btn btn-Default alert-danger' data-dismiss='modal'>Close</button></div></div></div></div>"
        Repeater1.Controls.Add(moreDetails)
    End Sub

End Class

