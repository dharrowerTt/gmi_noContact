Imports System.IO
Imports System.Text
Imports System.Data
Imports System.Data.SqlClient
Public Class challenge
    Inherits System.Web.UI.Page


    ' // KJ // errors xx is already declared
    ' Protected WithEvents firstName As System.Web.UI.WebControls.TextBox
    ' Protected WithEvents lastName As System.Web.UI.WebControls.TextBox
    ' Protected WithEvents salutation As System.Web.UI.WebControls.DropDownList
    ' Protected WithEvents organization As System.Web.UI.WebControls.TextBox
    ' Protected WithEvents btnSave1 As System.Web.UI.HtmlControls.HtmlInputSubmit


    'Protected WithEvents actionType As System.Web.UI.WebControls.DropDownList
    'Protected WithEvents heardAbout As System.RRwWeb.UI.WebControls.DropDownList
    'Protected WithEvents gmiRelationship As System.Web.UI.WebControls.DropDownList
    'Protected WithEvents phoneNumber As System.Web.UI.WebControls.TextBox
    'Protected WithEvents email As System.Web.UI.WebControls.TextBox
    'Protected WithEvents commitment As System.Web.UI.WebControls.TextBox
    Protected WithEvents status As String







    Private editChallengeID As String
    Private mode As String


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load



        If Not IsPostBack Then
            'FillResourceCategory()

            mode = IIf(IsNothing(Server.HtmlEncode(Request.QueryString("mode"))), String.Empty, Server.HtmlEncode(Request.QueryString("mode")))
            'Trace.Warn("not ispostback")
            If mode = "" Then
                mode = "n"
            End If
            If (mode.ToLower() = "n") Then

                status = "Draft"
            Else
                editChallengeID = Server.HtmlEncode(Request.QueryString("challengeID"))
                If (IsNothing(editChallengeID) = False) Then
                    'FillPageForEdit()

                    Dim myLabel As Literal
                    myLabel = New Literal
                    Dim thisStr As New clsChallengeDAO()

                End If
            End If

        Else
            Trace.Warn("ispostback")
        End If


    End Sub


    Protected Sub SaveEvent1(ByVal s As Object, ByVal e As EventArgs) Handles btnSave1.ServerClick


        SaveNewEvent(s, e)

        'recdirect or popup or whatever you feel like doing
        Response.Redirect("form.aspx?submit=" & email.Text, True)

    End Sub


    Protected Sub SaveNewEvent(ByVal s As Object, ByVal e As EventArgs)
        Dim challengeObj As clsChallengeVO
        challengeObj = New clsChallengeVO

        challengeObj.setfirstName(firstName.Text)
        challengeObj.setlastName(lastName.Text)
        challengeObj.setsalutation(salutation.Text)
        challengeObj.setemailAddress(email.Text)
        challengeObj.setorganization(organization.Text)
        challengeObj.setheardAbout(heardAbout.Text)


        Dim newEventId As String

        newEventId = clsChallengeDAO.insertgmcData(challengeObj)

        Dim constr As String = Common.GetConnString()
        Using con As SqlConnection = New SqlConnection(constr)
            Using cmd As SqlCommand = New SqlCommand("SELECT TOP 1 * from gmcData WHERE emailAddress = '" & email.Text & "' order by datestamp desc")
                cmd.CommandType = CommandType.Text
                cmd.Connection = con
                con.Open()
                Using sdr As SqlDataReader = cmd.ExecuteReader()
                    sdr.Read()
                    Dim GMCCODE As String = ""
                    GMCCODE = sdr("gmcCode").ToString()

                    Response.Redirect("form.aspx?id=" & GMCCODE, True)

                End Using
                con.Close()
            End Using
        End Using




        'Trace.Write("Sarah inserted an event.")

    End Sub
End Class