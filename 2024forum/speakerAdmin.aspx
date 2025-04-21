<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="speakerAdmin.aspx.vb" Inherits="M2M_Redesign.speakerAdmin" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Global Methane Forum 2024 | Global Methane Initiative</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans&display=swap" rel="stylesheet">
    <!-- Google Tag Manager -->
    <script>
        (function (w, d, s, l, i) {
            w[l] = w[l] || []; w[l].push({
                'gtm.start':
                    new Date().getTime(), event: 'gtm.js'
            }); var f = d.getElementsByTagName(s)[0],
                j = d.createElement(s), dl = l != 'dataLayer' ? '&l=' + l : ''; j.async = true; j.src =
                    'https://www.googletagmanager.com/gtm.js?id=' + i + dl; f.parentNode.insertBefore(j, f);
        })(window, document, 'script', 'dataLayer', 'GTM-WM2LZW5');</script>
    <!-- End Google Tag Manager -->
    <!-- Google tag (gtag.js) -->
    <script async src="https://www.googletagmanager.com/gtag/js?id=G-46JVDVGWQS"></script>
    <script>
        window.dataLayer = window.dataLayer || [];
        function gtag() { dataLayer.push(arguments); }
        gtag('js', new Date());

        gtag('config', 'G-46JVDVGWQS');
    </script>
    <style>
        html,
        body {
            font-family: 'Open Sans', sans-serif;
            background-color: #fafafa;
            background-image: url(img/bg.png), url(img/2024.png);
            background-attachment: fixed;
            background-size: cover, contain;
            background-position: center, bottom;
            background-repeat: no-repeat, no-repeat;
            height: 100%;
        }

        .smedia {
            padding: .5rem;
            color: white;
        }

        .bg-gmi {
            background: #3198c8 !important;
            color: white;
        }
        table{
            width:100%;
        }
        th,td{
            padding:5px;
        }
    </style>
    <script src="https://kit.fontawesome.com/15da2e6088.js" crossorigin="anonymous"></script>
</head>
<body>
    <form id="form1" runat="server" enctype="multipart/form-data">
        <main>
            <nav class="navbar navbar-expand-lg navbar-dark bg-gmi">
            <div class="container">
                <a href="/" class="d-flex align-items-center text-dark text-decoration-none">
                    <img src="img/trad logo white.svg" width="60">
                </a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
              </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
              <li class="nav-item">
                            <a class="nav-link" href="index.html">Home</a>
                        </li>
                      <li class="nav-item">
                            <a class="nav-link active" aria-current="page" href="#">Register</a>
                        </li>
                      <li class="nav-item">
                            <a class="nav-link" href="agenda.html">Agenda</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="about.html">About</a>
                        </li>
                    </ul>
                   <div class="d-flex"><a href="https://www.linkedin.com/company/global-methane-initiative-gmi-/" target="_blank" class="smedia"><i class="fa fa-brands fa-linkedin "></i></a>
                        <a href="https://www.facebook.com/globalmethane" target="_blank" class="smedia"><i class="fa fa-brands fa-facebook"></i></a>
                        <a href="https://twitter.com/globalmethane?lang=en" target="_blank" class="smedia"><i class="fa fa-brands fa-x-twitter"></i></a>
                        
                        <a href="https://globalmethane.us19.list-manage.com/subscribe?u=da591cea9e010abd0437239de&id=a3abe26702" target="_blank" class="smedia"><i class="fa fa-solid fa-envelope"></i></a>
                    </div>
                </div>
            </div>
        </nav>
            <div class="container py-4">


                <div class="row">
                    <div class="col-md-12">
                        <h2 style="font-weight: bold;">2024 Global Methane Forum</h2>

                        <h4 style="font-weight: bold;">Speaker Administration - <%= speakerEmail  %></h4>
                        <hr>
                    </div>
                </div>
                <div class="row">
                    <asp:Label ID="regLabel" runat="server" Text="Label">
                <div class="alert alert-success" role="alert">
  <h4 class="alert-heading">Registration found</h4>
  <p>Thank you for registering for the 2024 Global Methane Forum. If you have any changes to your registration, please contact <a href="mailto:secretariat@globalmethane.org">secretariat@globalmethane.org</a>.</p>
</div>
                    </asp:Label>
                    <asp:Label ID="unRegLabel" runat="server" Text="Label">
                <div class="alert alert-warning" role="alert">
  <h4 class="alert-heading">No record of registration found</h4>
  <p>It looks like you still need to complete the registration process for the 2024 Global Methane Forum. You can do so on the <a href="register.aspx">registration page</a>. Please contact <a href="mailto:secretariat@globalmethane.org">secretariat@globalmethane.org</a> if you have any questions.</p>
</div>
                    </asp:Label>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <h4>Speaker Uploads</h4>
                    </div>
                </div>
                <div class="row">
                    <div class="col-8">
                        <h5>Speaker Permission Form</h5>
                        <p>Please download, fill out, and upload the <a href="GMI_UNECE Speaker Permission Form_2024 Forum.pdf" download>Speaker Permission Form</a> to grant permission to the Global Methane Initiative (GMI) to post an electronic copy of your presentation on the GMI website. <em>Acceptable file formats are PDF and Microsoft Word</em>.</p>
                        <!-- Speaker Permission Start -->
                        <asp:FileUpload ID="FileUpload2" runat="server" accept=".pdf,.docx,.doc" />
                        <asp:Button ID="Button1" Text="Upload" runat="server" OnClick="Upload1" />
                        <asp:Label ID="Label1" ForeColor="Green" runat="server" />
                        <!-- Speaker Permission End -->
                        <hr />
                    </div>
                    <div class="col-4">
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" EmptyDataText="No files uploaded">
                            <Columns>
                          <asp:BoundField DataField="Text" HeaderText="File Name" />
                            </Columns>
                        </asp:GridView>
                    </div>
                </div>
            <div class="row">
                <div class="col-md-8">
                    <h5>Name Audio Recording</h5>
                    <p>Please upload an audio recording of how to pronounce your name. For instructions on how to use the recording software, click <a href="Recording Speaker Names Instructions 2023.pdf" download>here</a>. <em>Acceptable file formats are MP3, MP4, WAV, and M4A</em>.</p>
                    <!-- Audio Start -->
                    <asp:FileUpload ID="FileUpload3" runat="server" accept=".mp3,.mp4,.wav,.m4a" />
                    <asp:Button ID="Button2" Text="Upload" runat="server" OnClick="Upload2" />
                    <asp:Label ID="Label2" ForeColor="Green" runat="server" />
                    <!--  Audio End -->
                    <hr />
                </div>
                <div class="col-4">
                    <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="false" EmptyDataText="No files uploaded">
                        <Columns>
                            <asp:BoundField DataField="Text" HeaderText="File Name" />
                        </Columns>
                    </asp:GridView>
                </div>
            </div>
            <div class="row">
                <div class="col-8">
                    <h5>Speaker Biography</h5>
                    <p>Please submit a brief professional biography (200 words or less). Your biography will be published on the Global Methane Forum website. <em>Acceptable file formats are PDF, PowerPoint, and Word files</em>.</p>
                    <!--  Bio Start -->
                    <asp:FileUpload ID="FileUpload4" runat="server" accept=".pdf,.pptx,.ppt,.docx,.doc" />
                    <asp:Button ID="Button3" Text="Upload" runat="server" OnClick="Upload3" />
                    <asp:Label ID="Label3" ForeColor="Green" runat="server" />
                    <!--  Bio End -->
                    <hr />
                </div>
                <div class="col-4">
                    <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="false" EmptyDataText="No files uploaded">
                        <Columns>
                            <asp:BoundField DataField="Text" HeaderText="File Name" />
                        </Columns>
                    </asp:GridView>
                </div>
                </div>
                <div class="row">
                    <div class="col-8">
                        <h5>Speaker Headshot</h5>
                        <p>Please upload a photograph/headshot. Your photograph will be included alongside your biography on the Global Methane Forum website. <em>Acceptable file formats are JPG, PNG, and GIF files</em>.</p>
                        <!--  Headshot Start -->
                        <asp:FileUpload ID="FileUpload5" runat="server" accept=".jpg,.jpeg,.png,.gif,.doc,.docx" />
                        <asp:Button ID="Button4" Text="Upload" runat="server" OnClick="Upload4" />
                        <asp:Label ID="Label4" ForeColor="Green" runat="server" />
                        <!--  Headshot End -->
                         <hr />
                    </div>
                    <div class="col-4">
                        <asp:GridView ID="GridView4" runat="server" AutoGenerateColumns="false" EmptyDataText="No files uploaded">
                            <Columns>
                                <asp:BoundField DataField="Text" HeaderText="File Name" />
                            </Columns>
                        </asp:GridView>
                    </div>
                </div>
                                <div class="row">
                    <div class="col-8">
                        <h5>Speaker Slides</h5>
                        <p>Please upload the slides for your presentation. <em>Acceptable file formats are PowerPoint (ppt, pptx) and PDF files</em>.</p>
                        <!--  Slides Start -->
                        <asp:FileUpload ID="FileUpload6" runat="server" accept=".pptx,.ppt,.pdf" />
                        <asp:Button ID="Button5" Text="Upload" runat="server" OnClick="Upload5" />
                        <asp:Label ID="Label5" ForeColor="Green" runat="server" />
                        <!--  Slides End -->
                    </div>
                    <div class="col-4">
                        <asp:GridView ID="GridView5" runat="server" AutoGenerateColumns="false" EmptyDataText="No files uploaded">
                            <Columns>
                                <asp:BoundField DataField="Text" HeaderText="File Name" />
                            </Columns>
                        </asp:GridView>
                    </div>
                </div>
            </div>




            <footer class="pt-3 mt-4 text-body-secondary border-top">
                <a href="https://www.globalmethane.org/" target="_blank">Global Methane Initiative (GMI)</a> | Leading
                methane action since 2004
            </footer>

        </main>
    </form>
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous">
    </script>
            <script type="text/javascript">
                function confirmSubmission() {
                    location.reload();
                }
            </script>
</body>
</html>
