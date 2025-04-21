<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="oilgas-sector.aspx.vb" Inherits="M2M_Redesign.oilgas_sector" %>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
    <title>Measurement, Reporting and Verification (MRV) of Methane: Oil & Gas Sector  | Global Methane Initiative</title>
    <!-- #include virtual="/includes/include_head.html" -->
    <meta name="keywords"
        content=" biogas, measurement, reporting, verification, global, methane, GMI, climate, environment, GHG">
    <meta name="description"
        content="The MRV Handbook is designed to help decision makers in developing countries reduce methane emissions from the biogas sector with measurement, reporting, and verification.">
    <meta name="robots" content="max-snippet:-1">
    <meta name="googlebot" content="max-snippet:-1">
</head>

<body>
      <style>
        .box {
            position:fixed;
            top:0;
            left:0;
            z-index:200;
            display: flex;
            align-items: center;
            justify-content: center;
            width: 100vw;
            height: 100vh;
            background: white;
        }

            .box div {
                width: 300px;
                height: 300px;
            }
    </style>

    <div class="box" id="boxToHide">
        <div>
            <label for="pass">Password:</label>
            <input type="password" id="txtEmail" name="password"
                minlength="8" required>
            <a id="passwordbtn" class="btn btn-dark" style="color: white">Sign In</a>
        </div>

    </div>
    <!-- #include virtual="/includes/header.html" -->

    <!-- Page Content -->

    <style>
        .MRVOnThisPage {
            background: #f8f8f8;
            border: 1px solid #e7b000;
            padding: 20px;
            margin-bottom: 20px;
        }

        .MRVList {
            list-style: none;
            padding-left: 0 !important;
        }

            .MRVList li::before {
                content: "";
                background-size: contain;
                display: inline-block;
                width: 2.5em;
                height: 2.5em;
                position: relative;
                top: 0.1rem;
                margin-right: 0.2rem;
            }

            .MRVList li:nth-child(1)::before {
                background-image: url(measurement.svg);
            }

            .MRVList li:nth-child(2)::before {
                background-image: url(reporting.svg);
            }

            .MRVList li:nth-child(3)::before {
                background-image: url(verification.svg);
            }

        .MRVWhenList {
            list-style: none;
            padding-left: 0 !important;
        }

            .MRVWhenList li::before {
                content: "";
                background-size: contain;
                display: inline-block;
                width: 2.5em;
                height: 2.5em;
                position: relative;
                top: 0.1rem;
                margin-right: 0.2rem;
            }

            .MRVWhenList li:nth-child(1)::before {
                background-image: url(emissions.svg);
            }

            .MRVWhenList li:nth-child(2)::before {
                background-image: url(reduction.svg);
            }
    </style>
    <section class="py-5 gmi-light-blue">
        <div class="container">

            <div class="row">
                <div class="col-sm-12">
                    <h1>Measurement, Reporting and Verification (MRV) of Methane: Oil & Gas Sector </h1>
                    <p>
                       <small class="text-muted text">
                                        <i class="fa fa-arrow-left" aria-hidden="true"></i>
                                        <a href="index.aspx">MRV Hub</a>
                                    </small>
                    </p>
                </div>
            </div>
        </div>
    </section>

    <section class="py-5 bg-white">
        <div class="container">
            <p>This page is currently under development.  Check back soon for tools to support the MRV of methane emissions and emissions reductions in the Oil & Gas Sector.</p>
<p>Join the <a href="http://eepurl.com/ggwT3T" target="_blank">GMI Mailing List</a> to receive updates and follow us on <a href="https://www.facebook.com/globalmethane/" target="_blank">Facebook</a> and <a href="https://twitter.com/globalmethane?lang=en" target="_blank">Twitter</a>.</p>

                </div>
    </section>




    <button onclick="topFunction()" class="btn btn-dark btn-sm" id="btnToTop" title="Go to top">
        <i
            class="fa fa-chevron-up" aria-hidden="true"></i>Top</button>

    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
        integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous">
    </script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
        integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous">
    </script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
        integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous">
    </script>

    <script type="text/javascript" src="https://www.google.com/jsapi"></script>


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

    <script>
        $("#passwordbtn").click(function () {
            event.preventDefault();
            if ($("#txtEmail").val() === "loudF3rret82") {
                $('#boxToHide').hide();
            } else {
                window.location.href = "../index.aspx";
            }
        });
    </script>

</body>

</html>