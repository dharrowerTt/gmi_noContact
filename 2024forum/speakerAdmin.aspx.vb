Imports System.Data
Imports System.Configuration
Imports System.Data.SqlClient
Imports System.Collections.Generic
Imports System.IO
Public Class speakerAdmin
    Inherits System.Web.UI.Page
    Public speakerid As String = ""
    Public speakerEmail As String
    Public waiverCheck As String = ""
    Public soundCheck As String = ""
    Public presentationCheck As String = ""
    Public picCheck As String = ""
    Public visitorName As String = ""

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Len(Server.HtmlEncode(Request.QueryString("id"))) < 5 Then
            Response.Redirect("https://www.globalmethane.org/2024forum/register.aspx")
            Response.End()
            'speakerid = "3f138915-73a3-4bb5-bc84-36013c9642b8"
        Else
            speakerid = Request.Params("id")
        End If
        'speakerid = Request.Params("id")
        Dim constr As String = Common.GetConnString()
        Using con As SqlConnection = New SqlConnection(constr)
            Using cmd As SqlCommand = New SqlCommand("SELECT * from __2024Speakers WHERE code = '" & speakerid & "'")
                cmd.CommandType = CommandType.Text
                cmd.Connection = con
                con.Open()
                Using sdr As SqlDataReader = cmd.ExecuteReader()
                    sdr.Read()
                    If sdr.HasRows = True Then
                        speakerEmail = sdr("email").ToString()
                    Else
                        Response.Redirect("https://www.globalmethane.org/2024forum/register.aspx")
                    End If
                End Using
                con.Close()
            End Using
        End Using
        'check registrant list
        Using con As SqlConnection = New SqlConnection(constr)
            Using cmd As SqlCommand = New SqlCommand("SELECT * from __2024register WHERE email = '" & speakerEmail & "'")
                cmd.CommandType = CommandType.Text
                cmd.Connection = con
                con.Open()
                Using sdr As SqlDataReader = cmd.ExecuteReader()
                    sdr.Read()
                    If sdr.HasRows = True Then
                        unRegLabel.Visible = False
                    Else
                        regLabel.Visible = False
                    End If
                End Using
                con.Close()
            End Using
        End Using

        Dim folderPath As String = Server.MapPath("/2024forum/Uploads/" & speakerEmail & "/waiver/")
        'Check whether Directory (Folder) exists.
        If Directory.Exists(folderPath) Then
            Dim filePaths() As String = Directory.GetFiles(Server.MapPath("/2024forum/Uploads/" & speakerEmail & "/waiver/"))
            Dim files As List(Of ListItem) = New List(Of ListItem)
            For Each filePath As String In filePaths
                ' files.Add(New ListItem("<a href='Uploads/" + speakerEmail + "/waiver/" + Path.GetFileName(filePath) + "'>" + Path.GetFileName(filePath) + "</a>", filePath))
                files.Add(New ListItem(Path.GetFileName(filePath), filePath))
            Next
            GridView1.DataSource = files
            GridView1.DataBind()
        End If

        Dim folderPath2 As String = Server.MapPath("/2024forum/Uploads/" & speakerEmail & "/audio/")
        'Check whether Directory (Folder) exists.
        If Directory.Exists(folderPath2) Then
            Dim filePaths2() As String = Directory.GetFiles(Server.MapPath("/2024forum/Uploads/" & speakerEmail & "/audio/"))
            Dim files2 As List(Of ListItem) = New List(Of ListItem)
            For Each filePath2 As String In filePaths2
                files2.Add(New ListItem(Path.GetFileName(filePath2), filePath2))
            Next
            GridView2.DataSource = files2
            GridView2.DataBind()
        End If

        Dim folderPath3 As String = Server.MapPath("/2024forum/Uploads/" & speakerEmail & "/presentation/")
        'Check whether Directory (Folder) exists.
        If Directory.Exists(folderPath3) Then
            Dim filePaths3() As String = Directory.GetFiles(Server.MapPath("/2024forum/Uploads/" & speakerEmail & "/presentation/"))
            Dim files3 As List(Of ListItem) = New List(Of ListItem)
            For Each filePath3 As String In filePaths3
                files3.Add(New ListItem(Path.GetFileName(filePath3), filePath3))
            Next
            GridView3.DataSource = files3
            GridView3.DataBind()
        End If

        Dim folderPath4 As String = Server.MapPath("/2024forum/Uploads/" & speakerEmail & "/images/")
        'Check whether Directory (Folder) exists.
        If Directory.Exists(folderPath4) Then
            Dim filePaths4() As String = Directory.GetFiles(Server.MapPath("/2024forum/Uploads/" & speakerEmail & "/images/"))
            Dim files4 As List(Of ListItem) = New List(Of ListItem)
            For Each filePath4 As String In filePaths4
                files4.Add(New ListItem(Path.GetFileName(filePath4), filePath4))
            Next
            GridView4.DataSource = files4
            GridView4.DataBind()
        End If

        Dim folderPath5 As String = Server.MapPath("/2024forum/Uploads/" & speakerEmail & "/slides/")
        'Check whether Directory (Folder) exists.
        If Directory.Exists(folderPath5) Then
            Dim filePaths5() As String = Directory.GetFiles(Server.MapPath("/2024forum/Uploads/" & speakerEmail & "/slides/"))
            Dim files5 As List(Of ListItem) = New List(Of ListItem)
            For Each filePath4 As String In filePaths5
                files5.Add(New ListItem(Path.GetFileName(filePath4), filePath4))
            Next
            GridView5.DataSource = files5
            GridView5.DataBind()
        End If

    End Sub

    Protected Sub Upload1(ByVal sender As Object, ByVal e As EventArgs)
        Dim folderPath As String = Server.MapPath("/2024forum/Uploads/" & speakerEmail & "/waiver/")
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

            Dim arrMail(7) As String
            arrMail(0) = "emma.eichelman@tetratech.com"  'TO
            arrMail(3) = "secretariat@globalmethane.org"    'FROM 'IIf(txtEmail.Text.Length > 0, txtEmail.Text, arrMail(0))   
            'arrMail(4) = "Thanks for registering for the 2024 Global Methane Forum!"
            arrMail(6) = "HTML"
            arrMail(4) = speakerEmail + " just uploaded a waiver"
            Dim sBody = "<html><style type='text/css'>body{font-family:'Calibri'; font-size:90%}</style><body>"
            sBody += "<p>https://www.globalmethane.org/2024forum/Uploads/" & speakerEmail & "/waiver/" + FileUpload2.FileName + "</p>"
            'sBody += HtmlTable.ToString
            arrMail(5) = sBody
            clsEmail.SendEventEmail(arrMail)

            visitorName = Server.HtmlEncode(Request.QueryString("id"))
            Dim RedirectURL As String = "https://www.globalmethane.org/2024forum/speakerAdmin.aspx?id=" + visitorName
            Response.Redirect(RedirectURL)

        Else
            Label1.Text = "Please select a file first!"
        End If




        Dim script As String = "window.onload = function() { confirmSubmission(); };"
        ClientScript.RegisterStartupScript(Me.GetType(), "confirmSubmission", script, True)



    End Sub
    Protected Sub Upload2(ByVal sender As Object, ByVal e As EventArgs)
        Dim folderPath As String = Server.MapPath("/2024forum/Uploads/" & speakerEmail & "/audio/")
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

            Dim arrMail(7) As String
            arrMail(0) = "emma.eichelman@tetratech.com"  'TO
            arrMail(3) = "secretariat@globalmethane.org"    'FROM 'IIf(txtEmail.Text.Length > 0, txtEmail.Text, arrMail(0))   
            'arrMail(4) = "Thanks for registering for the 2024 Global Methane Forum!"
            arrMail(6) = "HTML"
            arrMail(4) = speakerEmail + " just uploaded an audio recording"
            Dim sBody = "<html><style type='text/css'>body{font-family:'Calibri'; font-size:90%}</style><body>"
            sBody += "<p>https://www.globalmethane.org/2024forum/Uploads/" & speakerEmail & "/audio/" + FileUpload2.FileName + "</p>"
            'sBody += HtmlTable.ToString
            arrMail(5) = sBody
            clsEmail.SendEventEmail(arrMail)
        Else
            Label2.Text = "Please select a file first!"
        End If

        visitorName = Server.HtmlEncode(Request.QueryString("id"))
        Dim RedirectURL As String = "https://www.globalmethane.org/2024forum/speakerAdmin.aspx?id=" + visitorName
        Response.Redirect(RedirectURL)

        Dim script As String = "window.onload = function() { confirmSubmission(); };"
        ClientScript.RegisterStartupScript(Me.GetType(), "confirmSubmission", script, True)
    End Sub
    Protected Sub Upload3(ByVal sender As Object, ByVal e As EventArgs)
        Dim folderPath As String = Server.MapPath("/2024forum/Uploads/" & speakerEmail & "/presentation/")
        If Len(Path.GetFileName(FileUpload4.FileName)) > 0 Then
            'Check whether Directory (Folder) exists.
            If Not Directory.Exists(folderPath) Then
                'If Directory (Folder) does not exists. Create it.
                Directory.CreateDirectory(folderPath)
            End If
            'Save the File to the Directory (Folder).
            FileUpload4.SaveAs(folderPath & Path.GetFileName(FileUpload4.FileName))
            'Display the success message.
            Label3.Text = Path.GetFileName(FileUpload4.FileName) + " has been uploaded."

            Dim arrMail(7) As String
            arrMail(0) = "emma.eichelman@tetratech.com"  'TO
            arrMail(3) = "secretariat@globalmethane.org"    'FROM 'IIf(txtEmail.Text.Length > 0, txtEmail.Text, arrMail(0))   
            'arrMail(4) = "Thanks for registering for the 2024 Global Methane Forum!"
            arrMail(6) = "HTML"
            arrMail(4) = speakerEmail + " just uploaded a bio"
            Dim sBody = "<html><style type='text/css'>body{font-family:'Calibri'; font-size:90%}</style><body>"
            sBody += "<p>https://www.globalmethane.org/2024forum/Uploads/" & speakerEmail & "/presentation/" + FileUpload2.FileName + "</p>"
            'sBody += HtmlTable.ToString
            arrMail(5) = sBody
            clsEmail.SendEventEmail(arrMail)


        Else
            Label3.Text = "Please select a file first!"
        End If

        visitorName = Server.HtmlEncode(Request.QueryString("id"))
        Dim RedirectURL As String = "https://www.globalmethane.org/2024forum/speakerAdmin.aspx?id=" + visitorName
        Response.Redirect(RedirectURL)

        Dim script As String = "window.onload = function() { confirmSubmission(); };"
        ClientScript.RegisterStartupScript(Me.GetType(), "confirmSubmission", script, True)
    End Sub
    Protected Sub Upload4(ByVal sender As Object, ByVal e As EventArgs)
        Dim folderPath As String = Server.MapPath("/2024forum/Uploads/" & speakerEmail & "/images/")
        If Len(Path.GetFileName(FileUpload5.FileName)) > 0 Then
            'Check whether Directory (Folder) exists.
            If Not Directory.Exists(folderPath) Then
                'If Directory (Folder) does not exists. Create it.
                Directory.CreateDirectory(folderPath)
            End If
            'Save the File to the Directory (Folder).
            FileUpload5.SaveAs(folderPath & Path.GetFileName(FileUpload5.FileName))
            'Display the success message.
            Label4.Text = Path.GetFileName(FileUpload5.FileName) + " has been uploaded."

            Dim arrMail(7) As String
            arrMail(0) = "emma.eichelman@tetratech.com"  'TO
            arrMail(3) = "secretariat@globalmethane.org"    'FROM 'IIf(txtEmail.Text.Length > 0, txtEmail.Text, arrMail(0))   
            'arrMail(4) = "Thanks for registering for the 2024 Global Methane Forum!"
            arrMail(6) = "HTML"
            arrMail(4) = speakerEmail + " just uploaded a headshot"
            Dim sBody = "<html><style type='text/css'>body{font-family:'Calibri'; font-size:90%}</style><body>"
            sBody += "<p>https://www.globalmethane.org/2024forum/Uploads/" & speakerEmail & "/images/" + FileUpload2.FileName + "</p>"
            'sBody += HtmlTable.ToString
            arrMail(5) = sBody
            clsEmail.SendEventEmail(arrMail)


        Else
            Label4.Text = "Please select a file first!"
        End If

        visitorName = Server.HtmlEncode(Request.QueryString("id"))
        Dim RedirectURL As String = "https://www.globalmethane.org/2024forum/speakerAdmin.aspx?id=" + visitorName
        Response.Redirect(RedirectURL)

        Dim script As String = "window.onload = function() { confirmSubmission(); };"
        ClientScript.RegisterStartupScript(Me.GetType(), "confirmSubmission", script, True)
    End Sub

    Protected Sub Upload5(ByVal sender As Object, ByVal e As EventArgs)
        Dim folderPath As String = Server.MapPath("/2024forum/Uploads/" & speakerEmail & "/slides/")
        If Len(Path.GetFileName(FileUpload6.FileName)) > 0 Then
            'Check whether Directory (Folder) exists.
            If Not Directory.Exists(folderPath) Then
                'If Directory (Folder) does not exists. Create it.
                Directory.CreateDirectory(folderPath)
            End If
            'Save the File to the Directory (Folder).
            FileUpload6.SaveAs(folderPath & Path.GetFileName(FileUpload6.FileName))
            'Display the success message.
            Label5.Text = Path.GetFileName(FileUpload6.FileName) + " has been uploaded."

            Dim arrMail(7) As String
            arrMail(0) = "emma.eichelman@tetratech.com"  'TO
            arrMail(3) = "secretariat@globalmethane.org"    'FROM 'IIf(txtEmail.Text.Length > 0, txtEmail.Text, arrMail(0))   
            'arrMail(4) = "Thanks for registering for the 2024 Global Methane Forum!"
            arrMail(6) = "HTML"
            arrMail(4) = speakerEmail + " just uploaded a slide deck"
            Dim sBody = "<html><style type='text/css'>body{font-family:'Calibri'; font-size:90%}</style><body>"
            sBody += "<p>https://www.globalmethane.org/2024forum/Uploads/" & speakerEmail & "/slides/" + FileUpload2.FileName + "</p>"
            'sBody += HtmlTable.ToString
            arrMail(5) = sBody
            clsEmail.SendEventEmail(arrMail)

        Else
            Label5.Text = "Please select a file first!"
        End If

        visitorName = Server.HtmlEncode(Request.QueryString("id"))
        Dim RedirectURL As String = "https://www.globalmethane.org" + visitorName
        Response.Redirect(RedirectURL)

        Dim script As String = "window.onload = function() { confirmSubmission(); };"
        ClientScript.RegisterStartupScript(Me.GetType(), "confirmSubmission", script, True)
    End Sub



End Class