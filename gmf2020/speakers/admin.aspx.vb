Imports System.IO
Imports System.Data
Imports System.Configuration
Imports System.Data.SqlClient
Public Class admin1
    Inherits System.Web.UI.Page
    Private regCode As String
    Dim EventID As Int16 = 110
    Dim UserID As String = ""
    Dim LookupValue As String = ""
    Dim profilePic As String = ""



    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load



        If Not (Request.QueryString("ID") Is Nothing) Then
            LookupValue = Request.QueryString("ID")
        Else
            Response.Redirect("../index.aspx", True)
        End If


        Dim constr As String = Common.GetConnString()
        Using con As SqlConnection = New SqlConnection(constr)
            Using cmd As SqlCommand = New SqlCommand("SELECT * from _registercontact WHERE email = '" & LookupValue & "' AND EventID = " & EventID & " AND speakerStatus = 1")
                cmd.CommandType = CommandType.Text
                cmd.Connection = con
                con.Open()
                Using sdr As SqlDataReader = cmd.ExecuteReader()
                    sdr.Read()

                    fName.Text = sdr("fName").ToString()
                    lName.Text = sdr("lName").ToString()
                    profilePic = sdr("profilepic").ToString()

                    If Len(sdr("bio").ToString()) > 1 Then
                        speakerBioHolder.Text = sdr("bio").ToString()
                        speakerBioHolder.ReadOnly = True
                        speakerBioHolder.Visible = True
                        speakerBio.ReadOnly = False
                        classMe.Attributes("class") = "seeCheck"
                        Button2.Visible = True
                    End If

                    If Not IsDBNull(sdr("submitted")) Then
                        If sdr("submitted") = True Then
                            speakerBio.Visible = False
                            Button2.Visible = False
                            btnUpload.Visible = False
                        End If
                    End If

                    If Not IsDBNull(sdr("submittedDocs")) Then

                        If sdr("submittedDocs") = True Then
                            FileUpload2.Visible = False
                            Button1.Visible = False
                            classMe3.Attributes("class") = "seeCheck"
                        End If

                    End If


                    UserID = sdr("fName").ToString() & sdr("lName").ToString()

                End Using
                con.Close()
            End Using
        End Using

        Image1.ImageUrl = "/gmf2020/speakers/pixel.png"

        Dim folderPath As String = Server.MapPath("/gmf2020/speakers/" & UserID & "/image/")

        'Check whether Directory (Folder) exists.
        If Directory.Exists(folderPath) Then

            Image1.ImageUrl = "/gmf2020/speakers/" & UserID & "/image/" & profilePic
            FileUpload1.Visible = False
            btnUpload.Visible = False
            classMe2.Attributes("class") = "seeCheck"

        End If

        Dim uploadPath As String = Server.MapPath("/gmf2020/speakers/" & UserID & "/files/")

        'Check whether Directory (Folder) exists.
        If Directory.Exists(uploadPath) Then

            Dim filePaths() As String = Directory.GetFiles(Server.MapPath("/gmf2020/speakers/" & UserID & "/files/"))
            Dim files As List(Of ListItem) = New List(Of ListItem)
            For Each filePath As String In filePaths
                files.Add(New ListItem(Path.GetFileName(filePath), filePath))
            Next
            GridView1.DataSource = files
            GridView1.DataBind()


        End If


        Dim waiverPath As String = Server.MapPath("/gmf2020/speakers/" & UserID & "/waiver/")
        'Check whether Directory (Folder) exists.
        If Directory.Exists(waiverPath) Then

            Dim filePaths() As String = Directory.GetFiles(Server.MapPath("/gmf2020/speakers/" & UserID & "/waiver/"))
            Dim files As List(Of ListItem) = New List(Of ListItem)
            For Each filePath As String In filePaths
                files.Add(New ListItem(Path.GetFileName(filePath), filePath))
            Next
            GridView2.DataSource = files
            GridView2.DataBind()

            FileUpload3.Visible = False
            Button3.Visible = False
            classMe4.Attributes("class") = "seeCheck"
        End If

    End Sub

    Protected Sub UploadFile(sender As Object, e As EventArgs)
        Dim folderPath As String = Server.MapPath("/gmf2020/speakers/" & UserID & "/image/")

        'Check whether Directory (Folder) exists.
        If Not Directory.Exists(folderPath) Then
            'If Directory (Folder) does not exists. Create it.
            Directory.CreateDirectory(folderPath)
        End If

        'Save the File to the Directory (Folder).
        FileUpload1.SaveAs(folderPath & Path.GetFileName(FileUpload1.FileName))

        Dim sqlText = "UPDATE _registercontact SET profilepic = '" & Path.GetFileName(FileUpload1.FileName) & "' WHERE email = '" & LookupValue & "'"
        Using cnConnect = New SqlConnection(Common.GetConnString())
            Using cm = New SqlCommand(sqlText, cnConnect)
                cnConnect.Open()
                cm.ExecuteNonQuery()
            End Using
        End Using

        'Display the success message.
        lblMessage.Text = Path.GetFileName(FileUpload1.FileName) + " has been uploaded."

        Image1.ImageUrl = "/gmf2020/speakers/" & UserID & "/image/" & Path.GetFileName(FileUpload1.FileName)

    End Sub

    Protected Sub UploadDocument(sender As Object, e As EventArgs)
        Dim folderPath As String = Server.MapPath("/gmf2020/speakers/" & UserID & "/files/")


        If Len(Path.GetFileName(FileUpload2.FileName)) > 0 Then



            'Check whether Directory (Folder) exists.
            If Not Directory.Exists(folderPath) Then
                'If Directory (Folder) does not exists. Create it.
                Directory.CreateDirectory(folderPath)
            End If

            'Save the File to the Directory (Folder).
            FileUpload2.SaveAs(folderPath & Path.GetFileName(FileUpload2.FileName))

            'Display the success message.
            Label1.Text = Path.GetFileName(FileUpload2.FileName) + " has been uploaded."

        Else

            Label1.Text = "Please select a file first!"


        End If

    End Sub

    Protected Sub UploadWaiver(sender As Object, e As EventArgs)
        Dim folderPath As String = Server.MapPath("/gmf2020/speakers/" & UserID & "/waiver/")


        If Len(Path.GetFileName(FileUpload3.FileName)) > 0 Then

            'Check whether Directory (Folder) exists.
            If Not Directory.Exists(folderPath) Then
                'If Directory (Folder) does not exists. Create it.
                Directory.CreateDirectory(folderPath)
            End If

            'Save the File to the Directory (Folder).
            FileUpload3.SaveAs(folderPath & Path.GetFileName(FileUpload3.FileName))

            'Display the success message.
            Label2.Text = Path.GetFileName(FileUpload3.FileName) + " has been uploaded."

        Else

            Label2.Text = "Please select a file first!"


        End If
    End Sub

    Protected Sub UploadBio(sender As Object, e As EventArgs)



        Dim sqlText = "UPDATE _registercontact SET bio = @bio WHERE email= @email"
        Using cnConnect = New SqlConnection(Common.GetConnString())
            Using cm = New SqlCommand(sqlText, cnConnect)
                cnConnect.Open()
                cm.Parameters.Add("@bio", SqlDbType.NVarChar).Value = speakerBio.Text
                cm.Parameters.Add("@email", SqlDbType.NVarChar).Value = LookupValue

                cm.ExecuteNonQuery()
            End Using
        End Using



        Response.Redirect(HttpContext.Current.Request.Url.ToString(), True)


    End Sub

    Protected Sub Button4_Click(sender As Object, e As EventArgs) Handles Button4.Click

        Dim sqlText = "UPDATE _registercontact SET submitted = 1 WHERE email= @email"
        Using cnConnect = New SqlConnection(Common.GetConnString())
            Using cm = New SqlCommand(sqlText, cnConnect)
                cnConnect.Open()
                cm.Parameters.Add("@email", SqlDbType.NVarChar).Value = LookupValue

                cm.ExecuteNonQuery()
            End Using
        End Using


        SendSubmitterMail()
        SendMail()

    End Sub

    Private Sub SendMail()

        'arrMail : 0 - To, 1 - cc , 2 - bcc, 3 - from, 4 - subject, 5 - body, 6- format, 7 - attachment.

        Dim arrMail(7) As String

        arrMail(0) = "rosalie.bossler@tetratech.com"   'TO
        arrMail(2) = "secretariat@globalmethane.org"    'BCC
        arrMail(3) = "secretariat@globalmethane.org"    'FROM 'IIf(txtEmail.Text.Length > 0, txtEmail.Text, arrMail(0))     
        arrMail(4) = "New Speaker Profile Uploaded!"
        arrMail(6) = "HTML"

        Dim eMail As String = LookupValue
        Dim loginURL As String = "https://www.globalmethane.org/gmf2020/speakers/approve.aspx?id=" & LookupValue

        Dim sBody As String
        sBody = "<html><style type='text/css'>body{font-family:'Trebuchet MS'; font-size:90%}</style><body>"
        sBody += "<p>Great news! A speaker has submitted their profile for review.</p>"
        sBody += "<p>You can check it by clicking below:</p>"
        sBody += "<p><a href='" & loginURL & "' style='background:#487eb0;color:#f5f6fa;padding:10px;'>Approve Profile</a></p>"
        sBody += "<p>If the above link isn't working, try copying and pasting the following link:</p>"
        sBody += "<p><a href='" & loginURL & "'>" & loginURL & "</a>"
        sBody += "</body></html>"

        arrMail(5) = sBody

        clsEmail.SendEventEmail(arrMail)

        Label6.Text = "The Forum team has been notified of your profile updates."

    End Sub

    Private Sub SendDocmail()

        'arrMail : 0 - To, 1 - cc , 2 - bcc, 3 - from, 4 - subject, 5 - body, 6- format, 7 - attachment.

        Dim arrMail(7) As String

        arrMail(0) = "rosalie.bossler@tetratech.com"   'TO
        arrMail(2) = "secretariat@globalmethane.org"    'BCC
        arrMail(3) = "secretariat@globalmethane.org"    'FROM 'IIf(txtEmail.Text.Length > 0, txtEmail.Text, arrMail(0))     
        arrMail(4) = "New Speaker Profile Uploaded!"
        arrMail(6) = "HTML"

        Dim eMail As String = LookupValue
        Dim loginURL As String = "https://www.globalmethane.org/gmf2020/speakers/seedocs.aspx?id=" & UserID

        Dim sBody As String
        sBody = "<html><style type='text/css'>body{font-family:'Trebuchet MS'; font-size:90%}</style><body>"
        sBody += "<p>Great news! A speaker has submitted their profile for review.</p>"
        sBody += "<p>You can check it by clicking below:</p>"
        sBody += "<p><a href='" & loginURL & "' style='background:#487eb0;color:#f5f6fa;padding:10px;'>Approve Profile</a></p>"
        sBody += "<p>If the above link isn't working, try copying and pasting the following link:</p>"
        sBody += "<p><a href='" & loginURL & "'>" & loginURL & "</a>"
        sBody += "</body></html>"

        arrMail(5) = sBody

        clsEmail.SendEventEmail(arrMail)

        Label3.Text = "The Forum team has been notified of your profile updates."

    End Sub

    Protected Sub Button5_Click(sender As Object, e As EventArgs) Handles Button5.Click

        Dim sqlText = "UPDATE _registercontact SET submittedDocs = 1 WHERE email= @email"
        Using cnConnect = New SqlConnection(Common.GetConnString())
            Using cm = New SqlCommand(sqlText, cnConnect)
                cnConnect.Open()
                cm.Parameters.Add("@email", SqlDbType.NVarChar).Value = LookupValue

                cm.ExecuteNonQuery()
            End Using
        End Using


        SendSubmitterMail()
        SendDocmail()
    End Sub


    Private Sub SendSubmitterMail()

        'arrMail : 0 - To, 1 - cc , 2 - bcc, 3 - from, 4 - subject, 5 - body, 6- format, 7 - attachment.

        Dim arrMail(7) As String

        arrMail(0) = LookupValue  'TO
        arrMail(2) = "secretariat@globalmethane.org"    'BCC
        arrMail(3) = "secretariat@globalmethane.org"    'FROM 'IIf(txtEmail.Text.Length > 0, txtEmail.Text, arrMail(0))     
        arrMail(4) = "Confirmation of materials uploaded to the Global Methane Forum Speaker Webpage"
        arrMail(6) = "HTML"

        Dim eMail As String = LookupValue
        Dim loginURL As String = "https://www.globalmethane.org/gmf2020/speakers/admin.aspx?id=" & LookupValue

        Dim sBody As String
        sBody = "<html><style type='text/css'>body{font-family:'Trebuchet MS'; font-size:90%}</style><body>"
        sBody += "<p>Thank you for uploading materials to the Global Methane Forum. </p>"
        sBody += "<p>We look forward to seeing you in Geneva.</p>"
        sBody += "<p>Click the link below to revisit your profile </p>"
        sBody += "<p><a href='" & loginURL & "'>" & loginURL & "</a>"
        sBody += "<p>Secretariat<br>Global Methane Initiative</p>"
        sBody += "</body></html>"

        arrMail(5) = sBody

        clsEmail.SendEventEmail(arrMail)

        Label6.Text = "The Forum team has been notified of your profile updates."

    End Sub

End Class