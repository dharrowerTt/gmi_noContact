<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="questions.aspx.vb" Inherits="M2M_Redesign.questions1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">

    <title>Global Methane Initiative | A Call to Action on Methane</title>
    <!-- Primary Meta Tags -->

    <meta name="title" content="Global Methane Initiative | A Call to Action on Methane">
    <meta name="description" content="an international dialogue hosted by the GMI">

    <!-- Open Graph / Facebook -->
    <meta property="og:type" content="website">
    <meta property="og:url" content="https://globalmethane.org/calltoaction/">
    <meta property="og:title" content="Global Methane Initiative | A Call to Action on Methane">
    <meta property="og:description" content="an international dialogue hosted by the GMI">
    <meta property="og:image" content="https://globalmethane.org/calltoaction/assets/ctathumb.png">

    <!-- Twitter -->
    <meta property="twitter:card" content="summary_large_image">
    <meta property="twitter:url" content="https://globalmethane.org/calltoaction/">
    <meta property="twitter:title" content="Global Methane Initiative | A Call to Action on Methane">
    <meta property="twitter:description" content="an international dialogue hosted by the GMI">
    <meta property="twitter:image" content="https://globalmethane.org/calltoaction/assets/ctathumb.png">
    <script type='text/javascript'
        src='https://platform-api.sharethis.com/js/sharethis.js#property=60636eccae08f90011442b11&product=sop'
        async='async'></script>
    <!-- #include virtual="/includes/include_head.html" -->

    <style>
        .gmi-light-orange {
            display: none;
        }

        body {
            background: #dcf4fd !important;
        }

        .agenda {
            width: 100%;
            margin: auto;
            margin-bottom: 20px;
        }

            .agenda tr:first-child {
                background: #2980b9;
                white-space: nowrap;
            }

            .agenda th {
                text-align: center;
                color: white;
                padding: 5px;
            }

            .agenda tr:nth-child(2) {
                background: #dcf4fd;
            }

            .agenda tr {
                border-bottom: 1px solid #0abde3;
            }

                .agenda tr td:first-child {
                    padding: 5px;
                    vertical-align: top;
                }


                .agenda tr td:nth-child(2) {
                    padding: 5px;
                    vertical-align: top;
                }

                .agenda tr td:first-child span {
                    font-weight: bold;
                }

                .agenda tr td:first-child ul {
                    list-style-type: none;
                }

        label span {
            color: #d63031;
        }

        .requiredNote {
            color: #d63031;
        }

        .sidebar h2 {
            color: #96def9;
        }

        .sidebar ul {
            margin: 0.75em 0;
            padding: 0 1em;
            list-style: none;
        }

            .sidebar ul li::before {
                content: "";
                border-color: transparent #96def9;
                border-style: solid;
                border-width: 0.35em 0 0.35em 0.45em;
                display: block;
                height: 0;
                width: 0;
                left: -1em;
                top: 0.9em;
                position: relative;
            }

        .agenda tr:nth-child(2) {
            background: #dcf4fd !important;
            border-bottom: 2px solid #007ac2;
        }

        .agenda tr:last-child {
            background: #dcf4fd !important;
            border-top: 2px solid #007ac2;
        }

        @media (max-width: 768px) {
            .sidebarImg {
                display: none
            }
        }

        .ctanav {
            background: #131131;
            color: #fafcfc;
            text-align: center;
            padding: 8px;
            border-bottom: 2px solid #262261;
        }

            .ctanav ul {
                list-style-type: none;
                margin: 0;
                padding-left: 0px;
                white-space: nowrap;
            }

        @media (max-width: 576px) {
            .ctanav ul {
                font-size: smaller;
            }
        }

        .ctanav ul li {
            padding: 15px;
            display: inline;
        }

            .ctanav ul li a {
                color: white;
            }

        .mainTitle {
            color: #262261;
            line-height: .8;
            font-size: 1.5rem !important;
            margin-bottom: 0;
        }

        h2 span {
            color: #455445;
            font-weight: normal;
            font-size: 16px;
        }

        h4 {
            margin-bottom: 0 !important;
            font-size: 1.35rem !important;
            font-weight: normal;
        }

        h5 {
            font-weight: normal;
            color: #444444;
            font-size: 16px;
            margin-bottom: 20px;
        }

        .smbreak {
            margin-bottom: 20px;
        }

        .detailspara {
            height: 100px;
            margin-bottom: 10px;
            -webkit-mask-image: linear-gradient(to bottom, black 50%, transparent 100%);
            mask-image: linear-gradient(to bottom, black 50%, transparent 100%);
            display: block;
            transition: height 2s;
        }

        .heightauto {
            max-height: auto !important;
            height: auto !important;
            -webkit-mask-image: none;
            mask-image: nonelinear-gradient(to bottom, black 50%, transparent 100%);
        }

        .morelessbtn {
            font-size: 12px;
            color: #262261;
            font-weight: bold;
            cursor: pointer;
        }

        .sidebar a{
            color:#96def9;
        }
        .sidebar a:hover{
            color:#f6f6f6;
        }
    </style>
</head>

<body>
    <!-- #include virtual="/includes/header.html" -->
    <div class="container" style="z-index: 300; background: rgba(255,255,255,.8); padding: 0;">
        <header>

            <div id="headercarouselarea" class="carousel slide carousel-fade" data-ride="carousel" data-interval="10000"
                style="border-bottom: 2px solid #007ac2;">
                <ol class="carousel-indicators">
                    <li data-target="#headercarouselarea" data-slide-to="0" class="active"></li>
                    <li data-target="#headercarouselarea" data-slide-to="1"></li>

                </ol>
                <div class="carousel-inner" role="listbox">
                    <!-- Slide One - Set the background image for this slide in the line below -->
                    <div class="carousel-item active" data-interval="12000"
                        style="background-image: linear-gradient(to bottom, rgba(0,0,0,0), rgba(0,0,0,.5)), url('assets/space.jpg')">
                        <div class="carousel-caption d-none d-md-block" style="color: #fcfcfc!important;">
                            <h1 class="display-5">A Call to Action on Methane:</h1>
                            <h2>an international dialogue hosted by the GMI</h2>
                        </div>
                    </div>
                    <!-- Slide Two - Set the background image for this slide in the line below -->
                    <div class="carousel-item" data-interval="12000"
                        style="background-image: linear-gradient(to bottom, rgba(0,0,0,0), rgba(0,0,0,.8)), url('assets/space2.jpg')">
                        <div class="carousel-caption d-none d-md-block">
                            <h2 class="display-5">Featured Speakers</h2>
                            <p class="lead">
                                View a list of speakers at our event on 3 June.
                            </p>
                            <p>
                                <a role="button" class="btn btn-primary btn-sm" href="speakers.aspx">View Speakers</a>
                            </p>
                        </div>
                    </div>

                    <a class="carousel-control-prev" href="#headercarouselarea" role="button" data-slide="prev">
                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                        <span class="sr-only">Previous</span>
                    </a>
                    <a class="carousel-control-next" href="#headercarouselarea" role="button" data-slide="next">
                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                        <span class="sr-only">Next</span>
                    </a>


                </div>

            </div>
        </header>
    </div>
    <div class="container">
        <div class="row ctanav">
            <div class="col-md-12">
                <ul>
                    <li><a href="index.aspx">Register</a></li>
                    <li><a href="agenda.aspx">Agenda</a></li>
                    <li><a href="speakers.aspx">Speakers</a></li>
                    <li><a href="questions.aspx">Ask a Panelist</a></li>
                    <li><a href="help.aspx">Help</a></li>
                </ul>
            </div>
        </div>
        <div class="row">
            <div class="col-md-4 sidebar  order-12 order-md-1"
                style="z-index: 300; background: #262261; padding-top: 20px; color: #fcfcfc;">

                <h2>Do you have a question for a panelist? </h2>
                Use the form to submit a question to be raised during the industry panel session. 
Visit the <a href="agenda.aspx">Agenda</a> for information about the sessions. 

                <hr>
                <img class="sidebarImg" src="assets/methane.png" style="width: 100%;">
                <br />
                <br />
            </div>
            <div class="col-md-8  order-1 order-md-12"
                style="z-index: 300; background: #fcfcfc; padding-top: 20px; color: #232323;">
                <div class="row">
                    <div class="col-md-9">
                        <h3 class="mainTitle" style="white-space: nowrap;">A Call to Action on Methane:</h3>
                        <h4>an international dialogue hosted by&nbsp;the&nbsp;GMI</h4>
                        <h5>3 June 2021 • 8:00-10:30 am EDT (&zwj;<a href="help.aspx">UTC&nbsp;-&zwj;4</a>&zwj;)</h5>
                    </div>
                    <div class="col-md-3 smbreak">
                        <p style="text-align: right; font-size: 12px; color: #565656; margin-bottom: 3px;">
                            Share this
                            page:
                        </p>
                        <div class="sharethis-inline-share-buttons"></div>
                    </div>
                </div>
                <h2>Ask a Panelist</h2>
                <p>
            <%= QuestionText  %></p>
                <p>
                    <div style="background-color:#c8d6e5;padding:6px;">
            <strong>Industry Panel Discussion and Moderated Question & Answer</strong><br />
                            Moderator: <a href="speakers.aspx#DrewShindell">Drew Shindell</a>, Chair, Scientific Advisory Panel of the Climate & Clean Air Coalition and Professor of Climate Sciences, Duke University (confirmed)
<ul>
    <li><a href="speakers.aspx#VickiHollub">Vicki Hollub</a>, President and Chief Executive Officer, Occidental (confirmed)</li>
<li><a href="speakers.aspx#DavidNewman">David Newman</a>, President, World Biogas Association (confirmed)</li>
    </ul>
</div>
                </p>
                <form runat="server">
                    <div class="caption"><span style="color: #d63031;">*</span> Denotes a required field</div>
                    <div class="form-group">
                        <label for="question">What question would you like to ask?<span>*</span></label><br />
                        <asp:TextBox ID="question" runat="server" class="form-control" required TextMode="MultiLine" Rows="4" type="text" MaxLength="400"></asp:TextBox>
                    </div>
                    <div class="row form-group">

                        <div class="col">
                            <label for="panelist">To which panelist would you like to direct your question? (Optional)</label><br />
                            <asp:TextBox ID="panelist" runat="server" class="form-control" placeholder="Panelist Name" type="text" MaxLength="120"></asp:TextBox>
                        </div>
                    </div>
                    <div class="row form-group">
                        <div class="col">
                                                        <label for="email">What is your email address?<span>*</span></label><br />
                            <asp:TextBox ID="email" runat="server" class="form-control" placeholder="Email Address" required type="email" MaxLength="100"></asp:TextBox>
                        </div>
                    </div>

                    <asp:Button class="btn btn-primary btn-lg" ID="questionSubmit" runat="server" Style="float: left;" Text="Submit Question" Enabled="True" />
                </form>
                <br /><br />
                <div style="clear:both"></div>
                <hr style="margin-bottom: 30px;" />


            </div>
        </div>
        <div class="row">

            <div class="col-md-12">

                <br />
                <br />
            </div>
        </div>
    </div>

    <button onclick="topFunction()" class="btn btn-dark btn-sm" id="btnToTop" title="Go to top">
        <i
            class="fa fa-chevron-up" aria-hidden="true"></i>Top</button>

    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"
        integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
        integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous">
    </script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
        integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous">
    </script>


    <script type="text/javascript">
        function googleTranslateElementInit() {
            new google.translate.TranslateElement({
                pageLanguage: 'en',
                layout: google.translate.TranslateElement.InlineLayout.SIMPLE
            }, 'google_translate_element');
        }
    </script>
    <script type="text/javascript" src="//translate.google.com/translate_a/element.js?cb=googleTranslateElementInit">
    </script>
    <script>
        $('.translateText').click(function () {
            $("#languageWidget").css("display", "block");
            $(".hider").slideToggle();
        });
    </script>

    <script>
        //Get the button
        var mybtnToTop = document.getElementById("btnToTop");

        // When the user scrolls down 20px from the top of the document, show the button
        window.onscroll = function () {
            scrollFunction()
        };

        function scrollFunction() {
            if (document.body.scrollTop > 20 || document.documentElement.scrollTop > 20) {
                mybtnToTop.style.display = "block";
            } else {
                mybtnToTop.style.display = "none";
            }
        }

        // When the user clicks on the button, scroll to the top of the document
        function topFunction() {
            document.body.scrollTop = 0;
            document.documentElement.scrollTop = 0;
        }
    </script>

    <script src="//cdn.jsdelivr.net/npm/sweetalert2@10"></script>
    <script type="text/javascript">
        function confirmSubmission1() {
            Swal.fire({
                title: 'Thank You!',
                text: 'Your question has been submitted. Thank you!',
                icon: 'success',
                confirmButtonText: 'Close'
            })
        }

        function confirmSubmission2() {
            Swal.fire({
                title: 'Thank you!',
                text: 'It looks like you already registered. We will send a copy of your sign up email shortly.',
                icon: 'success',
                confirmButtonText: 'Close',
                html: '<div>Your question has been submitted. Thank you!<br>Don\'t forget to <a href="index.aspx">register<a> for the event.'
            })
        }

        function tryAgain() {
            Swal.fire({
                title: 'Sorry!',
                text: 'It looks like your question is too long. Please try rewording and submitting again. Thank you.',
                icon: 'alert',
                confirmButtonText: 'Close'
            })
        }
    </script>
</body>

</html>
