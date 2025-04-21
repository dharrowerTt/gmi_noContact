Imports System.IO
Imports System.Text
Imports System.Data
Imports System.Data.SqlClient

Partial Class form
    Inherits System.Web.UI.Page

    Private gmcLatest As String
    Private gmcCode As String
    Public emailAddress As String = ""
    Public firstName As String = ""
    Public lastName As String = ""
    Public Org As String = ""

    Protected WithEvents submission As System.Web.UI.HtmlControls.HtmlInputSubmit

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs) Handles Me.Load
        DropDownList1.Items.Add("--Select One--")
        DropDownList1.Items.Add("Emission monitoring/ emission inventory")
        DropDownList1.Items.Add("Action plan To reduce emissions")
        DropDownList1.Items.Add("Information sharing")
        DropDownList1.Items.Add("Capacity building - technical support")
        DropDownList1.Items.Add("Capacity building - project finance")
        DropDownList1.Items.Add("Emission reduction activity")
        DropDownList1.Items.Add("Emission reduction policy")
        DropDownList1.Items.Add("Other")


        'Put user code to initialize the page here
        gmcCode = Server.HtmlEncode(Request.QueryString("id"))


        If Not IsNumeric(gmcCode) Then
            gmcCode = 1
        End If
        'hui filter the query string

        Dim constr As String = Common.GetConnString()
        Using con As SqlConnection = New SqlConnection(constr)
            Using cmd As SqlCommand = New SqlCommand("SELECT * from gmcData WHERE gmcCode = " & gmcCode)
                cmd.CommandType = CommandType.Text
                cmd.Connection = con
                con.Open()
                Using sdr As SqlDataReader = cmd.ExecuteReader()
                    sdr.Read()

                    fName.Text = sdr("firstName").ToString()
                    lName.Text = sdr("lastName").ToString()
                    eAddress.Text = sdr("emailAddress").ToString()
                    OrgName.Text = sdr("organization").ToString()
                    codeCheck.Text = sdr("gmcCode").ToString()


                End Using
                con.Close()
            End Using
        End Using


    End Sub

    Protected Sub SaveEvent1(ByVal s As Object, ByVal e As EventArgs) Handles submission.ServerClick


        SaveUpdate(s, e)

        'recdirect or popup or whatever you feel like doing
        Response.Redirect("index.aspx?submit=commitment", True)

    End Sub

    Protected Sub SaveUpdate(ByVal s As Object, ByVal e As EventArgs)

        Dim sqlText = "UPDATE gmcData SET _title = @title, _type = @type, _description = @description, _workingWithOthers = @workingWithOthers, _where = @where, _domestic = @domestic, _progressTrack = @progressTrack, _successTrack = @successTrack, _anticipatedReductions = @anticipatedReductions where gmcCode = @gmcCode"
        Using cnConnect = New SqlConnection(Common.GetConnString())
            Using cm = New SqlCommand(sqlText, cnConnect)
                cnConnect.Open()

                cm.Parameters.Add("@gmcCode", SqlDbType.NVarChar).Value = codeCheck.Text

                cm.Parameters.Add("@title", SqlDbType.NVarChar).Value = titleQ.Text
                cm.Parameters.Add("@type", SqlDbType.NVarChar).Value = DropDownList1.SelectedValue
                cm.Parameters.Add("@description", SqlDbType.NVarChar).Value = description.Text
                cm.Parameters.Add("@workingWithOthers", SqlDbType.NVarChar).Value = partnerQ.Text
                cm.Parameters.Add("@where", SqlDbType.NVarChar).Value = whereQ.Text
                cm.Parameters.Add("@domestic", SqlDbType.NVarChar).Value = styleQ.Text
                cm.Parameters.Add("@progressTrack", SqlDbType.NVarChar).Value = trackPQ.Text
                cm.Parameters.Add("@successTrack", SqlDbType.NVarChar).Value = trackSQ.Text
                cm.Parameters.Add("@anticipatedReductions", SqlDbType.NVarChar).Value = reductionQ.Text


                cm.ExecuteNonQuery()
            End Using
        End Using


        SendMail()


    End Sub

    Private Sub SendMail()

        'arrMail : 0 - To, 1 - cc , 2 - bcc, 3 - from, 4 - subject, 5 - body, 6- format, 7 - attachment.

        Dim arrMail(7) As String

        arrMail(0) = "sam.tremaine@tetratech.com"   'TO
        arrMail(2) = "dougie.harrower@tetratech.com"    'BCC
        arrMail(3) = "asg@globalmethane.org"    'FROM 'IIf(txtEmail.Text.Length > 0, txtEmail.Text, arrMail(0))     
        arrMail(4) = "New GMC Submission!"
        arrMail(6) = "HTML"


        Dim sBody As String
        sBody = "<html><style type='text/css'>body{font-family:'Trebuchet MS'; font-size:90%}</style><body>"
        sBody += "<p>Great news! There's been a new submission!</p>"
        sBody += "<p>From: " & firstName & " " & lastName & " - " & emailAddress & " - " & Org & "</p>"
        sBody += "<p>Title of Global Methane Challenge action</p>"
        sBody += titleQ.Text
        sBody += "<p>Action type</p>"
        sBody += DropDownList1.SelectedValue
        sBody += "<p>Description of action:</p>"
        sBody += description.Text
        sBody += "<p>Are you working with other partners on this action? Please describe.</p>"
        sBody += partnerQ.Text
        sBody += "<p>Where are you planning to take the action(s)?</p>"
        sBody += whereQ.Text
        sBody += "<p>Is the action domestic, bilateral or multilateral? If other countries are involved, please identify the name and roles of each country.</p>"
        sBody += styleQ.Text
        sBody += "<p>How will you measure or track progress for this action?</p>"
        sBody += trackPQ.Text
        sBody += "<p>How will you measure or track success for this action?</p>"
        sBody += trackSQ.Text
        sBody += "<p>Anticipated emission reductions from this action:</p>"
        sBody += reductionQ.Text


        sBody += "</body></html>"

        arrMail(5) = sBody

        clsEmail.SendEventEmail(arrMail)



    End Sub


End Class