<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head>
    <title>
        Global Methane Inititative
    </title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <!-- Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet" type="text/css" />
    <link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet" type="text/css" />
    <!-- JQuery -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <!-- Bootstrap JS/CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css" />
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
    <!-- FontAwesome -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css"
        integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous" />
    <style>
        .jumbotron p {
            font-size: 16px !important;
        }

        #chartdiv {
            width: 100%;
            height: 400px;
            background: rgb(218, 236, 248);
            border: 1px solid white;

        }
    </style>


    <!-- Plugins -->

    <!-- GreenSock Animation-->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/2.0.2/TweenMax.min.js"></script>
    <!-- Sweet Alert -->
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <!-- End Plugins -->
    <!-- Header -->
    <!-- Google Tag Manager -->
    <script>
        (function (w, d, s, l, i) {
            w[l] = w[l] || [];
            w[l].push({
                'gtm.start': new Date().getTime(),
                event: 'gtm.js'
            });
            var f = d.getElementsByTagName(s)[0],
                j = d.createElement(s),
                dl = l != 'dataLayer' ? '&l=' + l : '';
            j.async = true;
            j.src =
                'https://www.googletagmanager.com/gtm.js?id=' + i + dl;
            f.parentNode.insertBefore(j, f);
        })(window, document, 'script', 'dataLayer', 'GTM-WM2LZW5');
    </script>
    <!-- End Google Tag Manager -->
    <!-- Open Graph -->
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta property="og:title" content="Global Methane Initiative" />
    <meta property="og:image" content="https://www.globalmethane.org/images/oggmi.png" />
    <meta property="og:description"
        content="The GMI is an international public-private partnership composed of 45 Partner countries and a Project Network that reaches more than 1,200 members, including private companies, financial institutions, universities, and other governmental and non-governmental organizations. " />
    <meta property="og:url" content="https://www.globalmethane.org" />
    <!--    Close Graph (HAHA) -->
    <meta name="twitter:title" content="Global Methane Initiative" />
    <meta name="twitter:description"
        content="The GMI is an international public-private partnership composed of 45 Partner countries and a Project Network that reaches more than 1,200 members, including private companies, financial institutions, universities, and other governmental and non-governmental organizations. " />
    <meta name="twitter:image" content="https://www.globalmethane.org/images/oggmi.png" />
    <meta name="twitter:card" content="summary_large_image" />
    <!-- Google Tag Manager (noscript) -->
    <noscript><iframe src="https://www.googletagmanager.com/ns.html?id=GTM-WM2LZW5" height="0" width="0"
            style="display:none;visibility:hidden"></iframe></noscript>
    <!-- End Google Tag Manager (noscript) -->
    <!-- End Header -->
    <!-- Custom Files-->
    <link rel="stylesheet" type="text/css" href="../css/style.css" />
    <script>

    </script>

    <!-- this is for the translate dropdown -->
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
        function changeGoogleStyles() {
            if (($goog = $('.goog-te-menu-frame').contents().find('body')).length) {
                var stylesHtml = '<style>' +
                    '.goog-te-menu2 {' +
                    'max-width:100% !important;' +
                    'overflow:scroll !important;' +
                    'box-sizing:border-box !important;' +
                    'height:auto !important;' +
                    '}' +
                    '</style>';
                $goog.prepend(stylesHtml);
                if (($goog = $('.gsc-results-wrapper-overlay').contents().find('body')).length) {
                    var stylesHtml = '<style>' +
                        '.gsc-results-wrapper-overlay {' +
                        '-webkit-box-shaddow: none !important;' +
                        'box-shadow:none !important;' +
                        'padding:0px !important;' +
                        'width:100% !important;' +
                        '}' +
                        '</style>';
                    $goog.prepend(stylesHtml);
                } else {
                    setTimeout(changeGoogleStyles, 50);
                }
            } else {
                setTimeout(changeGoogleStyles, 50);
            }
        }
        changeGoogleStyles();
    </script>
    <!-- END -- this is for the translate dropdown -->
</head>

<body id="home" data-spy="scroll" data-target=".navbar" data-offset="60">

    <nav class="navbar navbar-default navbar-fixed-top one-edge-shadow">
        <div class="container">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="#home">
                    <img id="smalllogo" onclick="deleteCookie()" style="margin-top: -15px;" src="../img/gmi.png"></a>
            </div>
            <div class="collapse navbar-collapse" id="myNavbar">
                <ul class="nav navbar-nav navbar-right">

                    <li><a href="#about">ABOUT GMI</a></li>
                    <li><a href="#sectors">SECTORS</a></li>
                    <li><a href="#contact">COMMUNICATION</a></li>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle pulsecolor dropdown-menu-right"
                            data-toggle="dropdown">EXPLORE<b class="caret"></b></a>
                        <ul class="dropdown-menu">
                            <li class="dropdown rollup">
                                <a href="partners/index.aspx">Partner Countries</a>
                            </li>
                            <li class="divider"></li>
                            <li class="dropdown dropdown-submenu sectorclick"><a href="#"
                                    class="dropdown-toggle  sectorclick" data-toggle="dropdown">Sectors & Committees</a>
                            <li class="dropdown sectorhide">
                                <a href="/sectors/index.aspx?s=steer" class="steering">Steering Committee</a>
                            </li>
                            <li class="divider sectorhide"></li>
                            <li class="dropdown sectorhide">
                                <a href="sector.aspx?name=biogas" class="biogas">Biogas</a>
                            </li>
                            <li class="dropdown sectorhide">
                                <a href="sector.aspx?name=coal" class="coal">Coal</a>

                            </li>
                            <li class="dropdown sectorhide">
                                <a href="sector.aspx?name=oilgas" class="oilgas">Oil &
                                    Gas</a>
                            </li>


                    </li>
                    <li class="divider"></li>
                    <li class="dropdown rollup">
                        <a href="sites/index.aspx">Methane Sites & Activities</a>
                    </li>
                    <li class="divider"></li>
                    <li class="dropdown rollup">
                        <a href="tools-resources/resources.aspx">Tools & Resources</a>
                    </li>
                    <li class="divider"></li>
                    <li class="dropdown rollup">
                        <a href="project-network.aspx">Project Network</a>
                    </li>
                    <li class="divider"></li>
                    <li class="dropdown dropdown-submenu subeventclick"><a href="#"
                            class="dropdown-toggle subeventclick" data-toggle="dropdown">Subcommittee Events</a>


                    </li>
                    <li class="dropdown dropdown-submenu eventclick"><a href="#" class="dropdown-toggle eventclick"
                            data-toggle="dropdown">Other Events</a>


                    <li class='eventhide navevent'><a
                            href='https://www.globalmethane.org/news-events/event_detailsbyID.aspx?eventid=539'
                            target='_blank'>Global Methane Forum 2020</a>
                        <div class='eventDetails'><strong><em>23 - 27 March</em></strong><br>The Global Methane Forum
                            2020 (GMF 2020) will be held
                            in Geneva, Switzerland from 23-27 M...</div>
                    </li>

                    <li class='eventhide navevent'><a
                            href='https://www.globalmethane.org/news-events/event_detailsbyID.aspx?eventid=532'
                            target='_blank'>The World Biogas Summit 2020</a>
                        <div class='eventDetails'><strong><em>1 - 2 July</em></strong><br>Held in conjunction with the
                            UK AD and World Biogas Expo 2020 and the AD and Biogas Indust...</div>
                    </li>
                    <li class="eventhide"><a href="/news-events/">More Events</a></li>

                    </li>
                    <li class="divider"></li>
                    <li class="dropdown rollup" style="background:#ffa502; color:#000001!important;">
                        <a style="background:#ffa502; color:#000001!important;" href="challenge/list.html">Global
                            Methane Challenge Actions </a>
                    </li>

                </ul>
                </li>
                </ul>
            </div>
        </div>
    </nav>

    <div class="jumbotron" style="position: relative; padding-bottom: 0; overflow: hidden;">
        <video autoplay muted loop id="myVideo" class="bgvid">
            <!--    <source src="vid/vid.mp4" type="video/mp4"> -->
            <source src="https://globalmethane.org/challenge/assets/video/methanebg.mp4" type="video/mp4">
        </video>
        <div class="container" style="position: relative; padding-bottom: 0; overflow: hidden;">

            <div id="translatearea">
                <div id="google_translate_element"></div>
            </div>

            <div class="row"
                style="margin-bottom: 20px; background: rgba(255,255,255,1); padding-top: 10px; margin-left: 1px; margin-right: 1px; margin-bottom: 0; padding-bottom: 20px;">
                <div class="col-sm-6">
                    <img class="logoimg" src="../img/gmi.svg"><br>
                    <p>The Global Methane Initiative (GMI) is represented by countries with large sources of methane
                        and/or special expertise and interest in developing methane projects. GMI Partner Countries
                        account for approximately 70 percent of global manmade methane emissions.</p>
                    <p>Partner Countries are encouraged to develop action planning documents to identify the overall
                        vision for their participation in the GMI, outline key country activities and priorities, and
                        provide a mechanism to advance cooperation among Partners by identifying needs and
                        opportunities. The <a href="../sectors/index.aspx?s=steer">GMI Steering Committee</a> approved
                        <a href="../documents/GMI_RevisedActionPlanningGuidance_June2013.pdf">revised Action Planning
                            guidance</a> (PDF, 7 pp, 191 KB) in July 2013 and asks that Partners submit their plans to
                        the <a href="mailto:asg@globalmethane.org">Administrative Support Group</a> for posting.</p>
                </div>
                <div class=" col-sm-6">
                    <section class="py-5 gmi-light-blue">        <div class="container">    <div class="row">    <div class="col-sm-12">
                        <script src="../maps/ammap/ammap.js"></script>
                        <script src="../maps/ammap/maps/js/worldHigh.js"></script>
                        <script src="../maps/ammap/plugins/export/export.min.js"></script>
                        <link rel="stylesheet" href="../maps/ammap/ammap.css" type="text/css" media="all" />
                        <link rel="stylesheet" href="../maps/ammap/plugins/export/export.css" type="text/css" media="all" />
                        <script src="../maps/ammap/themes/light.js"></script>
                        <script src="../maps/ammap/mapcodeInner.js"></script>
                        <div style="margin-top:150px;" id="chartdiv"></div>


                    </div>

                </div>
            </div>
            <a href="/challenge" class="gmcpromolink">
                <div id="gmcpromo" class="container-fluid">
                    <img src="../img/gmclogo.svg" class="gmcpromoimg">
                    <div class="gmcpromotag">Tell us how you're reducing methane emissions</div>
                </div>
            </a>
        </div>

    </div>

    <div id="new" class="container bodySections">
        <!-- Container (Global Statistics Section) -->
        <div id="matters" class="container-fluid" style="background:#fcfffc;">
            <div class="row">
                    <div class="col-sm-6">
                            <canvas id="chart-04" 
                                style="border-radius:0px;width:100%;padding-left:0px;padding-right:0px;padding-top:0px;padding-bottom:0px"></canvas>
                        </div>
                <div class="col-sm-6">
                    <canvas id="chart-01" 
                        style="border-radius:0px;width:100%;padding-left:0px;padding-right:0px;padding-top:0px;padding-bottom:0px"></canvas>
                </div>
                <div class="col-sm-6">
                    <canvas id="chart-02" 
                    style="border-radius:0px;width:100%;padding-left:0px;padding-right:0px;padding-top:0px;padding-bottom:0px"></canvas>
                </div>
                <div class="col-sm-6">
                    <canvas id="chart-03"
                        style="border-radius:0px;width:100%;padding-left:0px;padding-right:0px;padding-top:0px;padding-bottom:0px"></canvas>
                </div>
            </div>
        </div>

        <!-- Container (Contact Section) -->
        <div id="contact" class="container-fluid bg-grey">
            <h2 class="text-center">Communication</h2>
            <div class="row">
                <div class="col-sm-12">
                    <ul class="nav nav-tabs">
                        <li class="active"><a data-toggle="tab" href="#contactform">Contact Us</a></li>
                        <li><a data-toggle="tab" href="#mailinglist">Join The Mailing List</a></li>
                        <li><a data-toggle="tab" href="#partner">Become a Partner Country</a></li>
                        <li><a data-toggle="tab" href="#projectnetwork">Join The Project Network</a></li>
                    </ul>

                    <div class="tab-content">
                        <div id="contactform" class="tab-pane fade in active">

                            <br /><br />

                            <a class="btn btn-primary" href="email.aspx" target="_blank">Send GMI an email.</a>

                        </div>
                        <div id="mailinglist" class="tab-pane fade">
                            <br /><br />
                            <p><a class="btn btn-primary" target="_blank" href="http://eepurl.com/ggwT3T">Sign Up
                                    Here</a></p>
                        </div>
                        <div id="partner" class="tab-pane fade">
                            <p>
                                Interested national governments may request to become Partners in the Global Methane
                                Initiative at any time. Governments that join GMI have the opportunity to participate
                                in the work of the GMI Steering Committee, which guides the work of the initiative as a
                                whole, as well as any GMI subcommittees that may be of interest: biogas, coal mines,
                                and oil and gas.
                            </p>
                            <p>If you're interested in becoming a partner country, send us an <a
                                    href="mailto:asg@globalmethane.org?subject=Partner Country">email</a>.</p>
                        </div>
                        <div id="projectnetwork" class="tab-pane fade">
                            <p>
                                The Project Network is a growing community of private-sector entities, financial
                                institutions, and other governmental and non-governmental organizations with an
                                interest in
                                methane abatement, recovery, and use projects.
                            </p>

                            <p>
                                Project Network members are actively involved in the Initiative and are critical to its
                                success. Working with countries who are Global Methane Initiative (GMI) Partners,
                                Project
                                Network members can galvanize action, setting the stage for methane reduction projects.
                            </p>
                            <a href="/project-network/pnmJoin.aspx" class="btn btn-primary">Join
                                The Project Network</a>
                        </div>
                    </div>


                </div>
            </div>
        </div>
    </div>

    <footer class="container-fluid text-center">
        <a href="#home" title="To Top">
            <span class="glyphicon glyphicon-chevron-up"></span>
        </a>

        <div class="row">
            <div class="col-sm-12">
                <div class="smIcons">
                    <a href="https://twitter.com/globalmethane?lang=en"><i class="fab fa-twitter fa-3x"></i></a>
                    <a href="https://www.youtube.com/channel/UC0wmNVURWg9oAJnp3IA1gvA"><i
                            class="fab fa-youtube fa-3x"></i></a>
                    <a href="https://www.facebook.com/pg/globalmethane/"><i class="fab fa-facebook-f fa-3x"></i></a>
                    <a href="https://www.linkedin.com/company/global-methane-initiative-gmi-/"><i
                            class="fab fa-linkedin-in fa-3x"></i></a>
                    <a href="mailto:asg@globalmethane.org"><i class="far fa-envelope-open fa-3x"></i></a>
                </div>
            </div>
        </div>
    </footer>

    <script src="https://unpkg.com/tippy.js@3/dist/tippy.all.min.js"></script>
    <script type="text/javascript" src="https://www.amcharts.com/lib/3/ammap.js"></script>
    <script type="text/javascript" src="https://www.amcharts.com/lib/3/maps/js/worldLow.js"></script>
    <script src="https://www.amcharts.com/lib/4/core.js"></script>
    <script src="https://www.amcharts.com/lib/4/charts.js"></script>
    <script src="https://www.amcharts.com/lib/4/themes/animated.js"></script>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/d3/5.7.0/d3.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.2/Chart.bundle.js"></script>
    <!-- local javascript file -->
    <script src="script.js"></script>


    <script>
        function DrawTheChart(ChartData, ChartOptions, ChartId, ChartType) {
            eval('var myLine = new Chart(document.getElementById(ChartId).getContext("2d"),{type:"' + ChartType +
                '",data:ChartData,options:ChartOptions});document.getElementById(ChartId).getContext("2d").stroke();'
                )
        }
    </script>

    <script>
        function MoreChartOptions() {}
        var ChartData = {
            labels: ["Year", "1990", "1991", "1992", "1993", "1994", "1995", "1996", "1997", "1998", "1999", "2000",
                "2001", "2002", "2003", "2004", "2005", "2006", "2007", "2008", "2009", "2010", "2011", "2012",
                "2013", "2014", "2015", "2016", "2017", "2018", "2019", "2020", "2021", "2022", "2023", "2024",
                "2025", "2026", "2027", "2028", "2029", "2030", "2031", "2032", "2033", "2034", "2035", "2036",
                "2037", "2038", "2039", "2040", "2041", "2042", "2043", "2044", "2045", "2046", "2047", "2048",
                "2049", "2050",
            ],
            datasets: [{
                    data: [1105.166196, 1062.841472, 1004.838975, 961.0970674, 923.4137008, 906.68536,
                        909.8487131, 916.7541255, 910.1986119, 908.0490973, 917.6832931, 942.4485482,
                        969.9366645, 1025.563144, 1058.646546, 1073.357731, 1094.401561, 1110.264814,
                        1126.736483, 1099.579211, 1120.738149, 1135.258953, 1128.427579, 1137.368435,
                        1140.698069, 1143.085728, 1149.993849, 1151.431617, 1152.869385, 1154.307153,
                        1155.744921, 1163.592198, 1171.439476, 1179.286754, 1187.134032, 1194.981309,
                        1198.42416, 1201.867012, 1205.309863, 1208.752714, 1212.195566, 1220.534474,
                        1228.873383, 1237.212292, 1245.5512, 1253.890109, 1264.194788, 1274.499468,
                        1284.804148, 1295.108827, 1305.413507, 1316.529992, 1327.646477, 1338.762962,
                        1349.879446, 1360.995931, 1368.632409, 1376.268887, 1383.905365, 1391.541843,
                        1399.178321,
                    ],
                    backgroundColor: '#464379',
                    borderColor: 'rgba(136,136,136,0.5)',
                    pointBackgroundColor: 'rgba(0,0,0,0)',
                pointBorderColor: 'rgba(0,0,0,0)',
                    label: "Oil & Gas"
                },

            ]
        };
        ChartOptions = {
            responsive: false,
            layout: {
                padding: {
                    top: 12,
                    left: 12,
                    bottom: 12,
                },
            },
            scales: {
                xAxes: [{
                    stacked: true,
                    scaleLabel:{
	display:true,
	labelString:'Year',
	fontColor:'#666666',
	fontSize:16,
	},
                    gridLines: {
                        borderDash: [],
                    },
                }],

                yAxes: [{
                    stacked: true,
                    scaleLabel:{
	display:true,
	labelString:'CH4 Emission (MMTCO2e)',
	fontColor:'#666666',
	fontSize:16,
	},
                    gridLines: {
                        borderDash: [],
                    },
                }],
            },
            plugins: {
                datalabels: {
                    display: false
                },
            },
            legend: {
                labels: {
                    boxWidth:10,
                    generateLabels: function (chart) {
                        return chart.data.datasets.map(function (dataset, i) {
                            return {
                                text: dataset.label,
                                lineCap: dataset.borderCapStyle,
                                lineDash: [],
                                lineDashOffset: 0,
                                lineJoin: dataset.borderJoinStyle,
                                fillStyle: dataset.backgroundColor,
                                strokeStyle: dataset.borderColor,
                                lineWidth: dataset.pointBorderWidth,
                                lineDash: dataset.borderDash,
                            }
                        })
                    },

                },
            },

            title: {
                display: true,
                text: 'Oil & Gas Methane Emissions ',
                fontColor: '#464379',
                fontSize: 24,
                fontStyle: ' bold',
            },
            elements: {
                arc: {},
                point: {},
                line: {
                    tension: 0.4,
                },
                rectangle: {},
            },
            tooltips: {},
            hover: {
                mode: 'nearest',
                animationDuration: 400,
            },
        };
        DrawTheChart(ChartData, ChartOptions, "chart-01", "line");
    </script>

    <script>
        function toggleDiv(divid) {

            varon = divid + 'on';
            varoff = divid + 'off';

            if (document.getElementById(varon).style.display == 'block') {
                document.getElementById(varon).style.display = 'none';
                document.getElementById(varoff).style.display = 'block';
                $(".oeText").addClass("bold");
                $(".subText").removeClass("bold");
            } else {
                document.getElementById(varoff).style.display = 'none';
                document.getElementById(varon).style.display = 'block';
                $(".subText").addClass("bold");
                $(".oeText").removeClass("bold");
            }
        }

        $(document).ready(function () {


            $(".rollup").hover(function () {
                if (!$('.eventhide').is(':visible')) {
                    $(".eventhide").slideUp("slow", function () {
                        // Animation complete.
                    });


                }
                if (!$('.sectorhide').is(':visible')) {
                    $(".sectorhide").slideUp("slow", function () {
                        // Animation complete.
                    });


                }

            });

            $(".sectorclick").click(function () {
                $(".sectorhide").slideDown("slow", function () {
                    // Animation complete.
                });
                $(".eventhide").hide();
                $(".subeventhide").hide();
            });

            $(".subeventclick").click(function () {
                $(".subeventhide").slideDown("slow", function () {
                    // Animation complete.
                });
                $(".sectorhide").hide();
                $(".eventhide").hide();
            });

            $(".eventclick").click(function () {
                $(".eventhide").slideDown("slow", function () {
                    // Animation complete.
                });
                $(".sectorhide").hide();
                $(".subeventhide").hide();
            });


            $('ul.dropdown-menu [data-toggle=dropdown]').on('click', function (event) {
                event.preventDefault();
                event.stopPropagation();
                $(this).parent().siblings().removeClass('open');
                $(this).parent().toggleClass('open');
            });

            // Add smooth scrolling to all links in navbar + footer link
            $(".navbar a, footer a[href='#home']").on('click', function (event) {
                // Make sure this.hash has a value before overriding default behavior
                if (this.hash !== "") {
                    // Prevent default anchor click behavior
                    event.preventDefault();

                    // Store hash
                    var hash = this.hash;

                    // Using jQuery's animate() method to add smooth page scroll
                    // The optional number (900) specifies the number of milliseconds it takes to scroll to the specified area
                    $('html, body').animate({
                        scrollTop: $(hash).offset().top
                    }, 900, function () {

                        // Add hash (#) to URL when done scrolling (default click behavior)
                        window.location.hash = hash;
                    });
                } // End if
            });

            $(window).scroll(function () {
                $(".slideanim").each(function () {
                    var pos = $(this).offset().top;

                    var winTop = $(window).scrollTop();
                    if (pos < winTop + 600) {
                        $(this).addClass("slide");
                    }
                });
            });
        })



        var vid = document.getElementById("myVideo");

        vid.playbackRate = 0.4;

        $(window).scroll(function () {
            var y_scroll_pos = window.pageYOffset;
            var scroll_pos_test = 150;
            // set to whatever you want it to be

            if (y_scroll_pos > scroll_pos_test) {
                $("#smalllogo").slideDown("slow", function () {
                    // Animation complete.
                });
            } else {
                $("#smalllogo").slideUp("slow", function () {
                    // Animation complete.
                });
            }
        });
    </script>

<script>
    function MoreChartOptions() {}
    var ChartData = {
        labels: ["Year", "1990", "1991", "1992", "1993", "1994", "1995", "1996", "1997", "1998", "1999", "2000",
            "2001", "2002", "2003", "2004", "2005", "2006", "2007", "2008", "2009", "2010", "2011", "2012",
            "2013", "2014", "2015", "2016", "2017", "2018", "2019", "2020", "2021", "2022", "2023", "2024",
            "2025", "2026", "2027", "2028", "2029", "2030", "2031", "2032", "2033", "2034", "2035", "2036",
            "2037", "2038", "2039", "2040", "2041", "2042", "2043", "2044", "2045", "2046", "2047", "2048",
            "2049", "2050",
        ],
        datasets: [{
                data: [24.87961841, 21.19744449, 19.80786643, 19.01856744, 17.6528975, 18.90936232, 18.28808485,
                    18.19234157, 16.72460066, 17.88498319, 17.96191753, 16.71433496, 15.7733802, 14.86203556,
                    13.03095827, 12.3980146, 11.59120807, 12.20543553, 12.52827196, 11.85122181, 12.11268098,
                    12.54746177, 13.17917836, 12.39400873, 12.72514387, 10.46942232, 11.72049496, 11.68156939,
                    11.64264383, 11.60371827, 11.5647927, 11.51310518, 11.46141767, 11.40973015, 11.35804263,
                    11.30635512, 11.26581605, 11.22527698, 11.18473791, 11.14419885, 11.10365978, 11.09554823,
                    11.08743668, 11.07932514, 11.07121359, 11.06310204, 11.03236377, 11.00162551, 10.97088724,
                    10.94014897, 10.90941071, 10.89895269, 10.88849468, 10.87803667, 10.86757865, 10.85712064,
                    10.87103001, 10.88493938, 10.89884875, 10.91275812, 10.92666749,
                ],
                backgroundColor: '#d8524b',
                borderColor: '#782e2a',
                pointBackgroundColor: 'rgba(0,0,0,0)',
                pointBorderColor: 'rgba(0,0,0,0)',
                label: "Surface"
            },

            {
                data: [544.3832039, 530.3702974, 523.5916245, 500.4926331, 483.9663735, 481.908282, 486.3829684,
                    493.2954104, 496.6887572, 503.2977396, 517.2860249, 532.5617936, 530.6855888, 546.6431481,
                    561.8103348, 573.7808158, 618.3656794, 659.6524979, 714.7189598, 752.2836698, 798.5110847,
                    831.3908511, 870.7150403, 888.5220614, 909.7486511, 928.6455068, 922.0444127, 920.9794864,
                    919.9145601, 918.8496338, 917.7847075, 914.6155316, 911.4463557, 908.2771798, 905.1080039,
                    901.938828, 895.8726208, 889.8064136, 883.7402063, 877.6739991, 871.6077919, 866.5327893,
                    861.4577868, 856.3827842, 851.3077816, 846.2327791, 841.1229334, 836.0130877, 830.9032421,
                    825.7933964, 820.6835507, 816.3015999, 811.919649, 807.5376982, 803.1557474, 798.7737965,
                    793.9051178, 789.036439, 784.1677602, 779.2990815, 774.4304027,
                ],
                backgroundColor: '#f69d98',
                borderColor: '#aa2e2a',
                pointBackgroundColor: 'rgba(0,0,0,0)',
                pointBorderColor: 'rgba(0,0,0,0)',
                label: "Underground"
            },

        ]
    };
    ChartOptions = {
        responsive: false,
        layout: {
            padding: {
                top: 12,
                left: 12,
                bottom: 12,
            },
        },
        scales: {
            xAxes: [{
                stacked: true,
                scaleLabel:{
	display:true,
	labelString:'Year',
	fontColor:'#666666',
	fontSize:16,
	},
                gridLines: {
                    borderDash: [],
                },
            }],

            yAxes: [{
                stacked: true,
                scaleLabel:{
	display:true,
	labelString:'CH4 Emission (MMTCO2e)',
	fontColor:'#666666',
	fontSize:16,
	},
                gridLines: {
                    borderDash: [],
                    
                },
            }],
        },
        plugins: {
            datalabels: {
                display: false
            },
        },
        legend: {
            labels: {
                boxWidth:10,
                generateLabels: function (chart) {
                    return chart.data.datasets.map(function (dataset, i) {
                        return {
                            text: dataset.label,
                            lineCap: dataset.borderCapStyle,
                            lineDash: [],
                            lineDashOffset: 0,
                            lineJoin: dataset.borderJoinStyle,
                            fillStyle: dataset.backgroundColor,
                            strokeStyle: dataset.borderColor,
                            lineWidth: dataset.pointBorderWidth,
                            lineDash: dataset.borderDash,
                        }
                    })
                },

            },
        },

        title: {
            display: true,
            text: 'Coal Mines Methane Emissions ',
            fontColor: '#f15c54',
            fontSize: 24,
            fontStyle: ' bold',
        },
        elements: {
            arc: {},
            point: {},
            line: {
                tension: 0.4,
            },
            rectangle: {},
        },
        tooltips: {},
        hover: {
            mode: 'nearest',
            animationDuration: 400,
        },
    };
    DrawTheChart(ChartData, ChartOptions, "chart-02", "line");
</script>

<script> function MoreChartOptions(){} 
    var ChartData = {
        labels : ["Year","1990","1991","1992","1993","1994","1995","1996","1997","1998","1999","2000","2001","2002","2003","2004","2005","2006","2007","2008","2009","2010","2011","2012","2013","2014","2015","2016","2017","2018","2019","2020","2021","2022","2023","2024","2025","2026","2027","2028","2029","2030","2031","2032","2033","2034","2035","2036","2037","2038","2039","2040","2041","2042","2043","2044","2045","2046","2047","2048","2049","2050",],
        datasets : [
            {
            data : [185.7266893,186.5794613,182.5255106,181.0455476,180.9544243,179.707196,175.7798247,176.7275732,181.2452737,182.7902453,184.4168387,191.918222,197.6896706,203.8203129,206.2808465,214.5104447,216.9940447,224.4142521,225.4976405,226.6046331,230.8523658,233.4653,238.7829427,236.8002455,237.0873404,240.73917,242.6026776,242.8040938,243.0055099,243.2069261,243.4083423,243.2107489,243.0131555,242.8155621,242.6179688,242.4203754,241.8747468,241.3291182,240.7834896,240.2378609,239.6922323,238.8818634,238.0714944,237.2611254,236.4507564,235.6403875,234.7177693,233.7951511,232.872533,231.9499148,231.0272966,230.0242327,229.0211688,228.0181049,227.015041,226.0119771,225.0100982,224.0082193,223.0063404,222.0044615,221.0025826,],
            backgroundColor :'#2e7e56',
            borderColor : '#2e7e37',
            pointBackgroundColor: 'rgba(0,0,0,0)',
                pointBorderColor: 'rgba(0,0,0,0)',
            label:"Manure Management"},
    
            {
            data : [462.041121,474.7199252,483.8647826,491.1426904,498.6469455,499.1931356,496.4703854,489.7611918,480.7656433,476.0454603,474.2005648,470.0015068,466.6368904,464.9312717,458.0256584,455.8810075,454.0042224,450.6818621,446.0309422,443.4804847,443.2709445,438.1239412,439.1440297,439.2523316,446.6570646,452.029846,453.724421,458.4945563,463.2646917,468.034827,472.8049624,477.4685842,482.132206,486.7958279,491.4594497,496.1230716,500.5659026,505.0087337,509.4515648,513.8943959,518.337227,522.5036461,526.6700652,530.8364842,535.0029033,539.1693224,543.0323682,546.8954139,550.7584597,554.6215055,558.4845512,562.0330379,565.5815245,569.1300112,572.6784978,576.2269845,579.4517982,582.6766119,585.9014256,589.1262393,592.351053,],
            backgroundColor :'#81b199',
            borderColor : '#81b177',
            pointBackgroundColor: 'rgba(0,0,0,0)',
                pointBorderColor: 'rgba(0,0,0,0)',
            label:"Municipal Solid Waste"},
    
            {
            data : [427.8155005,433.4129995,438.7562091,449.3799596,453.865308,447.6061167,440.4339043,433.7243388,425.4657694,419.6685247,413.4775223,397.3094843,383.6488316,370.14308,357.0661992,343.1761773,344.2433448,345.1505105,345.0700901,344.1836479,344.6977111,344.1650621,341.2575899,336.7029058,346.8421073,357.0771485,360.2862235,363.5600614,366.8338993,370.1077373,373.3815752,376.1727861,378.963997,381.7552079,384.5464188,387.3376297,389.6660564,391.9944832,394.32291,396.6513367,398.9797635,400.8842002,402.788637,404.6930737,406.5975105,408.5019473,410.0203772,411.538807,413.0572369,414.5756668,416.0940967,417.2682585,418.4424202,419.616582,420.7907437,421.9649055,422.7885106,423.6121157,424.4357208,425.2593259,426.082931,],
            backgroundColor :'#246444',
            borderColor : '#246422',
            pointBackgroundColor: 'rgba(0,0,0,0)',
                pointBorderColor: 'rgba(0,0,0,0)',
            label:"Wastewater"},
    
    ]
        };
    ChartOptions= {
    responsive:false,
        layout:{padding:{top:12,left:12,bottom:12,},},
         scales: {
        xAxes:[{
            stacked: true,gridLines:{borderDash:[],},
            scaleLabel:{
	display:true,
	labelString:'Year',
	fontColor:'#666666',
	fontSize:16,
	},
    }],
    
        yAxes:[{
            stacked: true,gridLines:{borderDash:[],},
            scaleLabel:{
	display:true,
	labelString:'CH4 Emission (MMTCO2e)',
	fontColor:'#666666',
	fontSize:16,
	},
    }],
     },plugins:{
    datalabels:{display:false},
    },
    legend:{
        labels:{
            boxWidth:10,
            generateLabels: function(chart){
                 return  chart.data.datasets.map( function( dataset, i ){
                    return{
                        text:dataset.label,
                        lineCap:dataset.borderCapStyle,
                        lineDash:[],
                        lineDashOffset: 0,
                        lineJoin:dataset.borderJoinStyle,
                        fillStyle:dataset.backgroundColor,
                        strokeStyle:dataset.borderColor,
                        lineWidth:dataset.pointBorderWidth,
                        lineDash:dataset.borderDash,
                    }
                })
            },
    
        },
    },
    
    title:{
        display:true,
        text:'Biogas Methane Emissions ',
        fontColor:'#2e7e56',
        fontSize:24,
        fontStyle:' bold',
        },
    elements: {
        arc: {
    },
        point: {},
        line: {tension:0.4,
    },
        rectangle: {
    },
    },
    tooltips:{
    },
    hover:{
        mode:'nearest',
        animationDuration:400,
    },
    };
     DrawTheChart(ChartData,ChartOptions,"chart-03","line");</script>
     <script> function MoreChartOptions(){} 
            var ChartData = {
                labels : ["Year","1990","1991","1992","1993","1994","1995","1996","1997","1998","1999","2000","2001","2002","2003","2004","2005","2006","2007","2008","2009","2010","2011","2012","2013","2014","2015","2016","2017","2018","2019","2020","2021","2022","2023","2024","2025","2026","2027","2028","2029","2030","2031","2032","2033","2034","2035","2036","2037","2038","2039","2040","2041","2042","2043","2044","2045","2046","2047","2048","2049","2050",],
                datasets : [
                    {
                    data : [569.2628223,551.5677419,543.399491,519.5112005,501.619271,500.8176444,504.6710533,511.4877519,513.4133579,521.1827228,535.2479424,549.2761286,546.458969,561.5051836,574.841293,586.1788304,629.9568875,671.8579334,727.2472318,764.1348916,810.6237657,843.9383129,883.8942187,900.9160701,922.473795,939.1149291,933.7649077,932.6610558,931.557204,930.4533521,929.3495002,926.1286368,922.9077734,919.68691,916.4660465,913.2451831,907.1384368,901.0316905,894.9249442,888.8181979,882.7114517,877.6283375,872.5452234,867.4621093,862.3789952,857.2958811,852.1552972,847.0147132,841.8741293,836.7335454,831.5929614,827.2005526,822.8081437,818.4157349,814.023326,809.6309172,804.7761478,799.9213784,795.066609,790.2118396,785.3570702,],
                    backgroundColor :'#f15c54',
                    borderColor : 'rgba(242,155,150,0.5)',
                    pointBackgroundColor:'#3498db',
                    pointBorderColor : '#fff',
                    label:"Coal"},
            
                    {
                    data : [1075.583311,1094.712386,1105.146502,1121.568198,1133.466678,1126.506448,1112.684114,1100.213104,1087.476686,1078.50423,1072.094926,1059.229213,1047.975393,1038.894665,1021.372704,1013.567629,1015.241612,1020.246625,1016.598673,1014.268766,1018.821021,1015.754303,1019.184562,1012.755483,1030.586512,1049.846164,1056.613322,1064.858711,1073.104101,1081.34949,1089.59488,1096.852119,1104.109359,1111.366598,1118.623837,1125.881077,1132.106706,1138.332335,1144.557964,1150.783594,1157.009223,1162.26971,1167.530197,1172.790683,1178.05117,1183.311657,1187.770515,1192.229372,1196.68823,1201.147087,1205.605945,1209.325529,1213.045114,1216.764698,1220.484283,1224.203867,1227.250407,1230.296947,1233.343487,1236.390027,1239.436567,],
                    backgroundColor :'#2e7e56',
                    borderColor : '#4b9470',
                    pointBackgroundColor:'#2ecc71',
                    pointBorderColor : '#fff',
                    label:"Bio"},
            
                    {
                    data : [1105.166196,1062.841472,1004.838975,961.0970674,923.4137008,906.68536,909.8487131,916.7541255,910.1986119,908.0490973,917.6832931,942.4485482,969.9366645,1025.563144,1058.646546,1073.357731,1094.401561,1110.264814,1126.736483,1099.579211,1120.738149,1135.258953,1128.427579,1137.368435,1140.698069,1143.085728,1149.993849,1151.431617,1152.869385,1154.307153,1155.744921,1163.592198,1171.439476,1179.286754,1187.134032,1194.981309,1198.42416,1201.867012,1205.309863,1208.752714,1212.195566,1220.534474,1228.873383,1237.212292,1245.5512,1253.890109,1264.194788,1274.499468,1284.804148,1295.108827,1305.413507,1316.529992,1327.646477,1338.762962,1349.879446,1360.995931,1368.632409,1376.268887,1383.905365,1391.541843,1399.178321,],
                    backgroundColor :'#464379',
                    borderColor : '#68668f',
                    pointBackgroundColor:'#9b59b6',
                    pointBorderColor : '#fff',
                    label:"Oil"},
            
            ]
                };
            ChartOptions= {
            responsive:false,
                layout:{padding:{top:12,left:12,bottom:12,},},
                 scales: {
                xAxes:[{
                    stacked: true,
                    scaleLabel:{
	display:true,
	labelString:'Year',
	fontColor:'#666666',
	fontSize:16,
	},gridLines:{borderDash:[],},
            }],
            
                yAxes:[{
                    stacked: true,scaleLabel:{
	display:true,
	labelString:'CH4 Emission (MMTCO2e)',
	fontColor:'#666666',
	fontSize:16,
	},gridLines:{borderDash:[],},
            }],
             },plugins:{
            datalabels:{display:false},
            },
            legend:{
                labels:{
                    boxWidth:10,
                    generateLabels: function(chart){
                         return  chart.data.datasets.map( function( dataset, i ){
                            return{
                                text:dataset.label,
                                lineCap:dataset.borderCapStyle,
                                lineDash:[],
                                lineDashOffset: 0,
                                lineJoin:dataset.borderJoinStyle,
                                fillStyle:dataset.backgroundColor,
                                strokeStyle:dataset.borderColor,
                                lineWidth:dataset.pointBorderWidth,
                                lineDash:dataset.borderDash,
                            }
                        })
                    },
            
                },
            },
            
            title:{
                display:true,
                text:'World Wide Methane Emissions',
                fontColor:'#3498db',
                fontSize:24,
                fontStyle:' bold',
                },
            elements: {
                arc: {
            },
                point: {radius:0},
                line: {tension:0.4,
            },
                rectangle: {
            },
            },
            tooltips:{
            },
            hover:{
                mode:'nearest',
                animationDuration:400,
            },
            };
             DrawTheChart(ChartData,ChartOptions,"chart-04","line");</script>
</body>

</html>