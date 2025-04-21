<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="index_post.aspx.vb" Inherits="M2M_Redesign.index6" %>

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
    <script type='text/javascript' src='https://platform-api.sharethis.com/js/sharethis.js#property=60636eccae08f90011442b11&product=sop' async='async'></script>
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

        .caption span {
            color: #d63031;
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

            .smbreak {
                margin-bottom: 20px;
            }
        }

        .caption {
            font-size: 12px;
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

        .radiostyle {
            height: auto;
        }

            .radiostyle label {
                margin-left: 3px !important;
                margin-right: 10px !important;
            }
    </style>
</head>
<body>
    <!-- #include virtual="/includes/header.html" -->
    <div class="container" style="z-index: 300; background: rgba(255,255,255,.8); padding: 0;">
        <header>

            <div id="headercarouselarea" class="carousel slide carousel-fade" data-ride="carousel" data-interval="10000" style="border-bottom: 2px solid #007ac2;">
                <ol class="carousel-indicators">
                    <li data-target="#headercarouselarea" data-slide-to="0" class="active"></li>
                    <li data-target="#headercarouselarea" data-slide-to="1"></li>

                </ol>
                <div class="carousel-inner" role="listbox">
                    <!-- Slide One - Set the background image for this slide in the line below -->
                    <div class="carousel-item active" data-interval="12000" style="background-image: linear-gradient(to bottom, rgba(0,0,0,0), rgba(0,0,0,.5)), url('assets/space.jpg')">
                        <div class="carousel-caption d-none d-md-block" style="color: #fcfcfc!important;">
                            <h1 class="display-5">A Call to Action on Methane:</h1>
                            <h2>an international dialogue hosted by the GMI</h2>
                        </div>
                    </div>
                    <!-- Slide Two - Set the background image for this slide in the line below -->
                    <div class="carousel-item" data-interval="12000"
                         style="background-image:linear-gradient(to bottom, rgba(0,0,0,0), rgba(0,0,0,.8)), url('assets/space2.jpg')">
                        <div class="carousel-caption d-none d-md-block">
                            <h2 class="display-5">Featured Speakers</h2>
                            <p class="lead">
                                View a list of speakers at our event on 3 June.
                            </p>
                            <p><a role="button" class="btn btn-primary btn-sm" href="sepeakers.aspx">View Speakers</a></p>
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
                    <li><a href="index.aspx">Home</a></li>
                    <li><a href="agenda.aspx">Agenda</a></li>
                    <li><a href="speakers.aspx">Speakers</a></li>
                </ul>
            </div>
        </div>
        <div class="row">
            <div class="col-md-4 sidebar order-12 order-md-1" style="z-index: 300; background: #262261; padding-top: 20px; color: #fcfcfc;">
                <h2>Thank You         </h2>
                <div id="mapdiv" style="max-width: 100%; height: 250px;"></div>
                Hundreds of individuals from around the world participated in this event.
                <hr>

        <br />
                <br />
            </div>
            <div class="col-md-8 order-1 order-md-12" style="z-index: 300; background: #fcfcfc; padding-top: 20px; color: #232323;">
                <div class="row">
                    <div class="col-md-9">
                        <h3 class="mainTitle" style="white-space: nowrap;">A Call to Action on Methane:</h3>
                        <h4>an international dialogue hosted by&nbsp;the&nbsp;GMI</h4>
                       
                    </div>
                    <div class="col-md-3 smbreak">
                        <p style="text-align: right; font-size: 12px; color: #565656; margin-bottom: 3px;">Share this page:</p>
                        <div class="sharethis-inline-share-buttons"></div>
                    </div>
                </div>

                <h2>This event has concluded</h2>


<p>Thank you to everyone who participated in the live event to raise international awareness of the critical need to reduce methane emissions and emphasize opportunities for international leaders in industry, private sector, and government to take action.</p>
                <ul>
                    <li><a href="agenda.aspx">View the agenda</a></li>
<li><a href="speakers.aspx">Learn about the speakers</a></li>
                    </ul>

<p>A recording of the live event will be made available as soon as possible.</p>


                <!-- form needs unhidden-->
         
                <br />
                <br />
                     <hr style="margin-bottom:30px;"/>
            </div>
        </div>
        <div class="row">

            <div class="col-md-12">

                <br />
                <br />
            </div>
        </div>
    </div>

    <button onclick="topFunction()" class="btn btn-dark btn-sm" id="btnToTop" title="Go to top"><i class="fa fa-chevron-up" aria-hidden="true"></i>Top</button>

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


    <script src="//cdn.amcharts.com/lib/4/core.js"></script>
    <script src="//cdn.amcharts.com/lib/4/maps.js"></script>
    <script src="//cdn.amcharts.com/lib/4/geodata/worldLow.js"></script>
    <script src="https://cdn.amcharts.com/lib/4/themes/animated.js"></script>


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
        window.onscroll = function () { scrollFunction() };

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
        function confirmSubmission() {
            Swal.fire({
                title: 'Success!',
                text: 'Thanks for registering, check your inbox for the confirmation email.',
                icon: 'success',
                confirmButtonText: 'Close',
                html: `
    <div>Thanks for registering. Check your inbox for the confirmation email.<br>
      <button class="swal2-styled" onclick="location.href='agenda.aspx';" style="margin-top:20px;"W>View The Agenda</button>
      <button class="swal2-styled" onclick="location.href='speakers.aspx';">Meet The Speakers</button>
    </div>`
            })
        }
        function confirmSubmissionAgain() {
            Swal.fire({
                title: 'Success!',
                text: 'It looks like you already registered. We will send a copy of your confirmation message shortly.',
                icon: 'success',
                confirmButtonText: 'Close',
                html: `
    <div>Thanks for registering. Check your inbox for the confirmation email.<br>
      <button class="btn btn-primary" onclick="location.href='agenda.aspx';">View The Agenda</button>
      <button class="btn btn-primary" onclick="location.href='speakers.aspx';">Meet The Speakers</button>
    </div>`
            })
        } function closeEarly() {
            Swal.fire({
                title: 'Error!',
                text: 'An error was detected in the form. Please try again later.',
                icon: 'warning',
                confirmButtonText: 'Close'
            })
        }
    </script>

    <script>
        var chart = am4core.create("mapdiv", am4maps.MapChart);

        // Set map definition
        chart.geodata = am4geodata_worldLow;


        // Set projection
        chart.projection = new am4maps.projections.Orthographic();
        chart.panBehavior = "rotateLongLat";
        chart.deltaLatitude = -20;
        chart.padding(20, 20, 20, 20);


        // limits vertical rotation
        chart.adapter.add("deltaLatitude", function (delatLatitude) {
            return am4core.math.fitToRange(delatLatitude, -90, 90);
        })


        // Create map polygon series
        var polygonSeries = chart.series.push(new am4maps.MapPolygonSeries());

        // Make map load polygon (like country names) data from GeoJSON
        polygonSeries.useGeodata = true;

        // Configure series
        var polygonTemplate = polygonSeries.mapPolygons.template;
        polygonTemplate.tooltipText = "{Popvalue}";
        polygonTemplate.fill = am4core.color("#74B266");

        // Create hover state and set alternative fill color
        var hs = polygonTemplate.states.create("hover");
        hs.properties.fill = am4core.color("#367B25");

        // Remove Antarctica
        polygonSeries.exclude = ["AQ"];

        // Add some data
        polygonSeries.data = [<%= CountryData  %>];



        // Bind "fill" property to "fill" key in data
        polygonTemplate.propertyFields.fill = "fill";
        //
        var graticuleSeries = chart.series.push(new am4maps.GraticuleSeries());
        graticuleSeries.mapLines.template.line.stroke = am4core.color("#ffffff");
        graticuleSeries.mapLines.template.line.strokeOpacity = 0.08;
        graticuleSeries.fitExtent = false;


        chart.backgroundSeries.mapPolygons.template.polygon.fillOpacity = 0.5;
        chart.backgroundSeries.mapPolygons.template.polygon.fill = am4core.color("#1B9CFC");

        // Create hover state and set alternative fill color
        var hs = polygonTemplate.states.create("hover");
        hs.properties.fill = chart.colors.getIndex(0).brighten(-0.5);

        let animation;
        setTimeout(function () {
            animation = chart.animate({ property: "deltaLongitude", to: 100000 }, 20000000);
        }, 3000)

        chart.seriesContainer.events.on("down", function () {
            if (animation) {
                animation.stop();
            }
        })



    </script>
</body>

</html>


