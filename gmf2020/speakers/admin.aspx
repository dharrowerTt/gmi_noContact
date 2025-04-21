<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="admin.aspx.vb" Inherits="M2M_Redesign.admin1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
      <!--#include file="../../_register/googleAnalytics.html"-->
    <!--#include file="../include/metaproperties.html"-->
      <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

    <title>Global Methane Forum 2020</title>
    <link rel="stylesheet" type="text/css" href="../eventcss/eventstyles.css">
    <link rel="stylesheet" type="text/css" href="../../_register/css/addon.css">
    <link rel="stylesheet" type="text/css" href="../../_register/css/formstyles.css">
          <script src="https://use.fontawesome.com/f40f14ac2c.js"></script>
    <title></title>
    <style>
        .profileDiv{
            width:200px;
            height:200px;
            border: 1px solid #000024;
            margin:5px;
            margin-left:0;
            background:url(assets/default-avatar.jpg);
            background-size: contain;
        }
        #fName, #lName, #speakerBio{
            width:50%;
        }

        input:-moz-read-only { /* For Firefox */
  background-color: #fafafa;
}

input:read-only {
background-color: #fafafa;
}


.hiddenCheck i{
    display:none;
}
.seeCheck i{
    color:green;
}
    </style>
</head>
<body>
      <div id="page-container">
   <div id="content-wrap">
    <!--#include file="../include/header.html"-->

       <div class="container" style="margin-top:3.5rem;">



    <form id="form1" runat="server">
    <div>
        <h2>Speaker Profile</h2>
        You can return to this page at any time to make changes or add documents.
<hr />
        <h4 id="classMe" class="hiddenCheck" runat="server">Professional Biography&nbsp;<i class="fa fa-check-square" aria-hidden="true"></i></h4>
        <p>Please submit a brief professional biography by 6 March. Your biography will be published on the Global Methane Forum website.</p>
        <p>First Name:<br />
        <asp:TextBox ID = "fName" name="firstname" runat = "server" required ReadOnly/></p>
        <p>Last Name:<br />
        <asp:TextBox ID = "lName" name="lastname" runat = "server" required ReadOnly/></p>
          <p>    Type or paste a brief biographical summary below (approximately 200 words):<br />
              <asp:TextBox ID = "speakerBio" name="bio" TextMode="MultiLine" runat = "server" MaxLength="4000" /><br />
              <asp:TextBox ID = "speakerBioHolder" style="border:0; background:#f6f6f6; width: 50%" name="bio" TextMode="MultiLine" runat = "server" MaxLength="4000" Visible="False" />
           </p>
                <asp:Button ID="Button2" Text="Save" runat="server" OnClick="UploadBio" />
<hr />
        <h4 id="classMe2" class="hiddenCheck" runat="server">Profile Picture&nbsp;<i class="fa fa-check-square" aria-hidden="true"></i></h4>
        <p>Please upload a photograph/headshot by 6 March. Your photograph will be included alongside your biography on the Global Methane Forum website.</p>
        <div class="profileDiv"><asp:Image ID="Image1" runat="server" Height = "200" Width = "200" /></div>
            <asp:FileUpload ID="FileUpload1" runat="server" accept=".png,.jpg,.jpeg,.gif" />
        <asp:Button ID="btnUpload" Text="Upload" runat="server" OnClick="UploadFile" />
        <asp:Label ID="lblMessage" ForeColor="Green" runat="server" />
        <hr />
        <asp:Button ID="Button4" runat="server" Text="Submit Bio and Photo" /><br />
       
        <asp:Label ID="Label6" ForeColor="Green" runat="server" />
       <hr />
       <h4 id="classMe3" class="hiddenCheck" runat="server">Presentation&nbsp;<i class="fa fa-check-square" aria-hidden="true"></i></h4>
        <div style="width:50%;">Please upload your presentation in Microsoft PowerPoint (PPT) or Portable Document Format (PDF) format. Presentations are <b>due no later than 13 March 2020</b>.</div>
            <asp:FileUpload ID="FileUpload2" runat="server" accept=".pdf,.pptx,.ppt,.docx,.doc"/>
        <asp:Button ID="Button1" Text="Upload" runat="server" OnClick="UploadDocument" />
        <asp:Label ID="Label1" ForeColor="Green" runat="server" />
<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" EmptyDataText = "No files uploaded">
    <Columns>
        <asp:BoundField DataField="Text" HeaderText="File Name" />

    </Columns>
</asp:GridView>
<hr />
       <h4 id="classMe4" class="hiddenCheck" runat="server">Speaker Permission Form&nbsp;<i class="fa fa-check-square" aria-hidden="true"></i></h4>
        <div style="width:50%;">Please <a href="documents/SpeakerPermissionForm.pdf" target="_blank">download</a>, fill out, and upload this form to grant permission to the Global Methane Initiative to post an electronic copy of your presentation on the GMI's website. Waivers are <b>due no later than 13 March 2020</b>.</div>
            <asp:FileUpload ID="FileUpload3" runat="server" accept=".pdf,WW.docx,.doc"/>
        <asp:Button ID="Button3" Text="Upload" runat="server" OnClick="UploadWaiver" />
        <asp:Label ID="Label2" ForeColor="Green" runat="server" />
<asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" EmptyDataText = "No files uploaded">
    <Columns>
        <asp:BoundField DataField="Text" HeaderText="File Name" />
        
     
        
        
    </Columns>
</asp:GridView>

                <hr />
        <asp:Button ID="Button5" runat="server" Text="Submit Documents" /><br />
       
        <asp:Label ID="Label3" ForeColor="Green" runat="server" />
       <hr />
<br />
        <br />

        <p>If you have any questions or need assistance, please email <a href="mailto:secretariat@globalmethane.org?subject=Speaker Biography">secretariat@globalmethane.org</a>.</p>
    </div>
    </form>

           </div> <!-- /container -->
 
       </div>
    <!--#include file="../include/footer.html"-->
         </div>
          <script>
        var element = document.getElementById("speakersLink");
        element.classList.add("active");
    </script>
    <!-- Optional JavaScript -->

    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
  </body>
</html>