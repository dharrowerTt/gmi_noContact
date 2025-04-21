<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="speakerAdd.aspx.vb" Inherits="M2M_Redesign.speakerAdd" %>

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
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.24/css/jquery.dataTables.css">
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

        .bd-placeholder-img {
            font-size: 1.125rem;
            text-anchor: middle;
            -webkit-user-select: none;
            -moz-user-select: none;
            user-select: none;
        }

        @media (min-width: 768px) {
            .bd-placeholder-img-lg {
                font-size: 3.5rem;
            }
        }

        .b-example-divider {
            width: 100%;
            height: 3rem;
            background-color: rgba(0, 0, 0, .1);
            border: solid rgba(0, 0, 0, .15);
            border-width: 1px 0;
            box-shadow: inset 0 .5em 1.5em rgba(0, 0, 0, .1), inset 0 .125em .5em rgba(0, 0, 0, .15);
        }

        .b-example-vr {
            flex-shrink: 0;
            width: 1.5rem;
            height: 100vh;
        }

        .bi {
            vertical-align: -.125em;
            fill: currentColor;
        }

        .nav-scroller {
            position: relative;
            z-index: 2;
            height: 2.75rem;
            overflow-y: hidden;
        }

            .nav-scroller .nav {
                display: flex;
                flex-wrap: nowrap;
                padding-bottom: 1rem;
                margin-top: -1px;
                overflow-x: auto;
                text-align: center;
                white-space: nowrap;
                -webkit-overflow-scrolling: touch;
            }

        .bd-mode-toggle {
            z-index: 1500;
        }

        .bg-gmi {
            background: #3198c8 !important;
            color: white;
        }



        .jumboSide {
            background-image: url(img/triangles.svg);
            background-size: cover;
        }

        video {
            width: 100%;
            border-radius: 0.5rem;
            z-index: 2;
        }

        .jumbotron h1,
        .jumbotron h2 {
            z-index: 1;
        }

        .cardimage {
            width: auto;
            border-radius: 10px;
            float: right;
            margin-left: 12px;
        }

        @media screen and (max-width:1000px) {
            .cardimage {
                width: 45%;
                border-radius: 10px;
                float: right;
                margin-left: 12px;
            }
        }

        @media screen and (max-width: 768px) {
            .cardimage {
                width: 100%;
                border-radius: 10px;
                margin-left: 0;
            }
        }

        .nobr {
            white-space: nowrap;
        }

        .smedia {
            padding: .5rem;
            color: white;
        }

        #optOutBox input {
            margin-right: 0.8rem;
        }

        #posterResponse input {
            margin-right: 0.8rem;
        }

        #areaOfInterest td input {
            margin-right: 0.8rem;
        }

        #attendanceType td input {
            margin-right: 0.8rem;
        }

        #aoiProjects td input {
            margin-right: 0.8rem;
        }

        #inper input {
            margin-right: 0.8rem;
        }

        #inpersonOptions td input {
            margin-right: 0.8rem;
        }

        #inpersonReceptions td input {
            margin-right: 0.8rem;
        }

        #virtualOptions td input {
            margin-right: 0.8rem;
        }

        #inpersonQs {
            display: none;
        }

        #virtualQs {
            display: none;
        }

        .attendanceHolder {
            display: block;
        }

            .attendanceHolder input {
                margin-right: 0.8rem;
            }

        label span {
            color: red;
        }

        .info span {
            color: red;
        }

        #posterPicker td input {
            margin-right: 0.8rem;
        }
    </style>
    <script src="https://kit.fontawesome.com/15da2e6088.js" crossorigin="anonymous"></script>
</head>
<body>
    <main>
        <nav class="navbar navbar-expand-lg navbar-dark bg-gmi">
            <div class="container">
                <a href="/" class="d-flex align-items-center text-dark text-decoration-none">
                    <img src="../img/trad logo white.svg" width="60"><span style="color: white;">Global Methane Initiative</span></a>
                <div class="d-flex">
                    <a href="https://www.facebook.com/globalmethane" target="_blank" class="smedia"><i class="fa fa-brands fa-facebook"></i></a>
                    <a href="https://twitter.com/globalmethane?lang=en" target="_blank" class="smedia"><i class="fa fa-brands fa-x-twitter"></i></a>
                    <a href="https://www.linkedin.com/company/global-methane-initiative-gmi-/" target="_blank" class="smedia"><i class="fa fa-brands fa-linkedin "></i></a>
                    <a href="https://globalmethane.us19.list-manage.com/subscribe?u=da591cea9e010abd0437239de&id=a3abe26702" target="_blank" class="smedia"><i class="fa fa-solid fa-envelope"></i></a>
                </div>
            </div>
        </nav>

        <div class="container py-4">

            <div class="col-md-12">

                <!--<img src="forum24logo__.svg" style="width:100%;padding:5px;"> -->

                <h2 style="font-weight: bold;">2024 Global Methane Forum</h2>

                <h4 style="font-weight: bold;">Mobilizing Methane Action</h4>
                <h6>18-20 March 2024 • Geneva, Switzerland</h6>
                <hr>
            </div>
            <div class="col-10">
                <form id="form1" runat="server" class="row g-3">
                    <div class="col-md-6">
                        <label for="email" class="form-label">Email Address</label>
                        <asp:TextBox ID="email" type="email" class="form-control" placeholder="" runat="server" required="true"></asp:TextBox>
                    </div>
                    <div class="col-12">
                        <asp:Button class="btn btn-primary btn-lg" ID="submit" runat="server" Style="float: left;" Text="Submit" />
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                                   <div class="row">
            <div class="col-md-10">
                <hr />
               <asp:GridView ID="gvComms" runat="server" AutoGenerateColumns="false">
    <Columns>
        <asp:BoundField DataField="id" HeaderText="id"  />
        <asp:BoundField DataField="email" HeaderText="Email"  />
        <asp:BoundField DataField="created" HeaderText="Created"  />
        <asp:BoundField DataField="code" HeaderText="code"  />
    </Columns>
</asp:GridView>
            </div>
        </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </main>
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous">
    </script>
    <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.24/js/jquery.dataTables.js"></script>
    <script>
        $(document).ready(function () {
            $('#gvComms').DataTable({
                "order": [[0, "desc"]],
                columnDefs: [
                    {
                        "render": function (data, type, row) {
                            return '<a href="https://www.globalmethane.org/2024forum/speakerAdmin.aspx?id=' + row[3] + '">Custom Link</a>';
                        },
                        "title": "Link",
                        "targets": [3]
                    },
                    {
                        "targets": [0],
                        "visible": false
                    }]
            });
        });
    </script>

        <script type="text/javascript">
            function confirmSubmission() {
                window.location.href = "speakerAdd.aspx";
            }
        </script>
</body>
</html>
