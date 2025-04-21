Imports System.IO
Imports System.Text
Imports System.Data
Imports System.Data.SqlClient
Partial Class biogas_index
    Inherits System.Web.UI.Page


    Private Sub Page_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load

        Try


            getUpcomingEvents()
            getRecentEvents()

            Dim data As New DAL()
#Disable Warning BC42025 ' Access of shared member, constant member, enum member or nested type through an instance
            Dim subcommitteeChairs As String = data.GetCommitteeChairList("biogas")
#Enable Warning BC42025 ' Access of shared member, constant member, enum member or nested type through an instance

            Dim myLabel As Literal
            myLabel = New Literal
            myLabel.Text = subcommitteeChairs
            phChairs.Controls.Add(myLabel)

        Catch

        End Try



    End Sub

    Friend Function getUpcomingEvents()


        Dim currentMon As String = ""
        Dim currentYear As String = ""



        Dim myToday As DateTime
        myToday = DateTime.Today
        currentMon = myToday.Month
        currentYear = myToday.Year


        If Not IsPostBack Then

            Try
                Dim dt As DataTable = Nothing
                Dim CatchMsg As String = ""
                Dim phString As String = ""



                Dim lst As New List(Of String) _
                From {"biogas"}
                For Each item As String In lst


                    dt = Nothing

                    dt = clsEventDAO.getUpcomingEvents(currentMon, currentYear, item)

                    phString = "There are no upcoming events."


                    If dt.Rows.Count > 0 Then
                        phString = clsEventDAO.ShowEvents(dt)
                        phupcomingevents.Visible = True
                    Else
                        upcomingevents.Visible = False
                        phupcomingevents.Visible = False
                    End If
                    Dim allCSVLines As New List(Of String)
                    allCSVLines.Add(phString)
                    Dim htmlfile As String = System.Web.HttpContext.Current.Server.MapPath("\events\upcoming_" & item & "events.html")
                    File.WriteAllLines(htmlfile, allCSVLines)


                Next







            Catch

            End Try
        Else
            Trace.Warn("ispostback")
        End If

    End Function

    Friend Function getRecentEvents()


        Dim currentMon As String = ""
        Dim currentYear As String = ""



        Dim myToday As DateTime
        myToday = DateTime.Today
        currentMon = myToday.Month
        currentYear = myToday.Year


        If Not IsPostBack Then

            Try
                'Dim dtall As DataTable = Nothing
                Dim dt As DataTable = Nothing
                Dim CatchMsg As String = ""
                Dim phString As String = ""
                ' dt = dtall.AsEnumerable().Take(20).CopyToDataTable()



                Dim lst As New List(Of String) _
                From {"biogas"}
                For Each item As String In lst


                    dt = Nothing
                    If item = "" Or item = "all" Then
                        dt = clsEventDAO.getRecentEvents()
                    Else
                        dt = clsEventDAO.getRecentEvents(item)
                    End If
                    phString = ""
                    phString = clsEventDAO.ShowEventList(dt, False)
                    Dim allCSVLines As New List(Of String)
                    allCSVLines.Add(phString)
                    Dim htmlfile As String = System.Web.HttpContext.Current.Server.MapPath("\events\recent_" & item & "events.html")
                    File.WriteAllLines(htmlfile, allCSVLines)


                Next




            Catch

            End Try
        Else
            Trace.Warn("ispostback")
        End If

    End Function



End Class
