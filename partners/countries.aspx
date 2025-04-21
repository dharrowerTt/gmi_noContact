<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="countries.aspx.vb" Inherits="globalmethane2020.countries" %>

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
            margin-top: 15px;

        }

        .BIMGslidediv img, .CIMGslidediv img, .OgIMGslidediv img, .MIMGslidediv img {
            margin: auto;
            width: 200px !important;
        }

        .slick-prev:before {
            color: #D1812C;
        }

        .slick-next:before {
            color: #D1812C;
        }

        .Bslider, .Cslider, .Ogslider, .Mslider {
            font-size: 16px;
            color: black;
        }

            .Bslider h3, .Cslider h3, .Ogslider h3, .Mslider h3 {
                font-size: 30px;
            }


        .gmctag {
            font-size: 12px;
            color: white;
            border-radius: 4px;
            display: inline-block;
            padding: 6px;
        }

        .gmcogtag {
            background-color: #464379;
        }

        .gmcbiogastag {
            background-color: #2e7e56;
        }

        .gmccoaltag {
            background-color: #f15c54;
        }

        .gmcmultipletag {
            background-color: #f1c40f;
        }

        .slick-dots {
        }

        /* Style the tab */
        .Countrytab {
            overflow: hidden;
            background-color: #FCC99A;
        }

            /* Style the buttons inside the tab */
            .Countrytab button {
                background-color: inherit;
                float: left;
                border: none;
                outline: none;
                cursor: pointer;
                padding: 14px 16px;
                transition: 0.3s;
                font-size: 17px;
            }

                /* Change background color of buttons on hover */
                .Countrytab button:hover {
                    background-color: #D1812C;
                }

                /* Create an active/current tablink class */
                .Countrytab button.active {
                    background-color: #FBB16C;
                }

        /* Style the tab content */
        .Countrytabcontent {
            display: none;
            padding: 6px 12px;
        }

        .Bslidediv{
            border:1px solid #232323;
            padding:15px;
            background:#fcfcfc;
        }

        .Bslidediv img{
            border: 1px solid #232323;
            margin-top:20px;
            margin-left:20px;
        }

                .Cslidediv{
            border:1px solid #232323;
            padding:15px;
            background:#fcfcfc;
        }

        .Cslidediv img{
            border: 1px solid #232323;
            margin-top:20px;
            margin-left:20px;
        }

                .Ogslidediv{
            border:1px solid #232323;
            padding:15px;
            background:#fcfcfc;
        }

                .SlideNone{
                            border:1px solid #232323;
            padding:15px;
            background:#fcfcfc;
                }

                .Bslidediv h3, .Cslidediv h3, .Mslidediv h3, .Ogslidediv h3{
                    font-size:17px;
                    font-weight: bold;
                }

        .Ogslidediv img{
            border: 1px solid #232323;
            margin-top:20px;
            margin-left:20px;
        }
                .Mslidediv{
            border:1px solid #232323;
            padding:15px;
            background:#fcfcfc;
        }

        .Mslidediv img{
            border: 1px solid #232323;
            margin-top:20px;
            margin-left:20px;
        }

        .tab-content {/*display: none;*/ position:absolute!important; left:-9999px!important;}
.tab-content.current {/*display: inherit;*/ position:relative!important; left:0!important;}


.slick-dots li {
        display: inline-block;
    }
.slick-dots li:only-child {
        display: none;
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
    <link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
    <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick-theme.css" />
    <style>
        .IMGslidediv img{
            margin:auto;
            width:200px!important;
        }
        .slick-prev:before {
  color: #2f3640;
}
.slick-next:before {
  color: #2f3640;
}

.gmctag{
    font-size:12px;
    color:white;
    border-radius:4px;
    display:inline-block;
    padding:6px;
}
.gmcogtag{
    background-color:#464379;
}
.gmcbiogastag{
   background-color: #2e7e56;
}
.gmccoaltag{
   background-color: #f15c54;
}
.gmcmultipletag{
    background-color:#f1c40f;
}

.slider-for{
    font-size: 16px;
    color:black;
}

.slider-for h3{
    font-size:30px;
}

    </style>
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

                    <!--<li><a href="#about">ABOUT GMI</a></li>-->
                    <li><a href="#emissions">METHANE EMISSIONS</a></li>
                    <li><a href="#contact">COMMUNICATION</a></li>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle pulsecolor dropdown-menu-right"
                            data-toggle="dropdown">EXPLORE<b class="caret"></b></a>
                        <ul class="dropdown-menu">
                            <li class="dropdown rollup">
                                <a href="countries.aspx">Partner Countries</a>
                            </li>
                            <li class="divider"></li>
                            <li class="dropdown dropdown-submenu sectorclick"><a href="#"
                                    class="dropdown-toggle  sectorclick" data-toggle="dropdown">Sectors & Committees</a>
                            <li class="dropdown sectorhide">
                                <a href="../sectors/index.aspx?s=steer" class="steering">Steering Committee</a>
                            </li>
                            <li class="divider sectorhide"></li>
                            <li class="dropdown sectorhide">
                                <a href="../biogas/index.aspx" class="biogas">Biogas</a>
                            </li>
                            <li class="dropdown sectorhide">
                                <a href="../coal/index.aspx" class="coal">Coal</a>

                            </li>
                            <li class="dropdown sectorhide">
                                <a href="../sector.aspx?name=oilgas" class="oilgas">Oil &
                                    Gas</a>
                            </li>


                    </li>
                    <li class="divider"></li>
                    <li class="dropdown rollup">
                        <a href="/sites/index.aspx">Methane Sites & Activities</a>
                    </li>
                    <li class="divider"></li>
                    <li class="dropdown rollup">
                        <a href="/tools-resources/resources.aspx">Tools & Resources</a>
                    </li>
                    <li class="divider"></li>
                    <li class="dropdown rollup">
                        <a href="/project-network.aspx">Project Network</a>
                    </li>
                    <li class="divider"></li>
                    <li class="dropdown dropdown-submenu subeventclick"><a href="#"
                            class="dropdown-toggle subeventclick" data-toggle="dropdown">Subcommittee Events</a>
                                           <asp:Repeater ID="navSubRepeater" runat="server" OnItemDataBound="CalendarNavSubDataBound">
                                    <ItemTemplate>
                                        <asp:Literal ID="litSubNav" runat="server"></asp:Literal>
                                    </ItemTemplate>
                                </asp:Repeater>

                    </li>
                    <li class="dropdown dropdown-submenu eventclick"><a href="#" class="dropdown-toggle eventclick"
                            data-toggle="dropdown">Other Events</a>


                       <asp:Repeater ID="navRepeater" runat="server" OnItemDataBound="CalendarNavDataBound">
                                    <ItemTemplate>
                                        <asp:Literal ID="litNav" runat="server"></asp:Literal>
                                    </ItemTemplate>
                                </asp:Repeater>
                                <li class="eventhide"><a href="/news-events/">More Events</a></li>

                    </li>
                    <li class="divider"></li>
                    <li class="dropdown rollup" style="background:#ffa502; color:#000001!important;">
                        <a style="background:#ffa502; color:#000001!important;" href="challenge/showcase.html">Global
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
                    <a href="/index.aspx">
                        <img class="logoimg" src="../img/gmi.svg"></a>
                    
                </div>
                <div class=" col-sm-6" style="text-align:right;">
                    <p><a href="/index.aspx">HOME</a> &nbsp;&nbsp;|&nbsp;&nbsp;PARTNER COUNTRIES</p>
                    <h1>Partner Countries</h1>
                   

                </div>
            </div>
            <div class="row"  style="margin-bottom: 20px; background: rgba(255,255,255,1); padding-top: 10px; margin-left: 1px; margin-right: 1px; margin-bottom: 0; padding-bottom: 20px;">
                <div class="col-sm-6">
                    <p>GMI Partner Countries account for approximately 70 percent of global manmade methane emissions.  These countries offer special expertise and interest in developing solutions for mitigating methane emissions and using methane as a renewable energy source.</p><p>As members of the GMI, Partner Countries are encouraged to develop and <a href="mailto:asg@globalmethane.org?subject=Partner Country Action Plan">submit to the Secretariat</a> action planning documents that outline key country activities and priorities, and provide a mechanism to advance cooperation among Partners. The GMI Steering Committee’s <a href="/documents/GMI_RevisedActionPlanningGuidance_June2013.pdf">Action Planning guidance</a> (PDF, 7 pp, 191 KB) contains information to help Partners develop these planning documents.</p>
                    <p>Click on the map or the country name to learn more about each Partner, including an overview of estimated methane emissions.  Worldwide methane emissions are summarized below.</p>
                </div>
                <div class="col-sm-6">
                     <section class="py-5 gmi-light-blue">        <div class="container">    <div class="row">    <div class="col-sm-12">
                        <script src="../maps/ammap/ammap.js"></script>
                        <script src="../maps/ammap/maps/js/worldHigh.js"></script>
                        <script src="../maps/ammap/plugins/export/export.min.js"></script>
                        <link rel="stylesheet" href="../maps/ammap/ammap.css" type="text/css" media="all" />
                        <link rel="stylesheet" href="../maps/ammap/plugins/export/export.css" type="text/css" media="all" />
                        <script src="../maps/ammap/themes/light.js"></script>
                        <script src="../maps/ammap/mapcodeInner.js"></script>
                        <div id="chartdiv"></div>


                    </div>
                </div>
            </div>
            <div class="row" style="margin-bottom: 20px; background: rgba(255,255,255,1); padding-top: 10px; margin-left: 1px; margin-right: 1px; margin-bottom: 0; padding-bottom: 20px;">
                <div class="col-sm-12">
                    <h2>Partner Countries and Year Joining GMI</h2>
                </div>
                <div class="col-sm-3">
                    
                    <asp:PlaceHolder ID="countryList" runat="server" />
                   

                </div>
            <div id="gmcpromo" class="container-fluid">
                   <a href="/challenge"> <img src="../img/gmclogo.svg" class="gmcpromoimg"></a>
                    <div class="gmcpromotag">Explore these Global Methane Challenge stories…</div>
                </div>
            


            <div id="new" class="container bodySections" style="background: #FCC99A; border-top:2px solid #F2973B;">

                <!-- Tab links -->
                <div class="Countrytab" style="display:none;">
                    <button class="Countrytablinks" onclick="openSector(event, 'BiogasTab')" id="defaultOpen">Biogas</button>
                    <button class="Countrytablinks" onclick="openSector(event, 'CoalTab')" id="thirdOpen">Coal</button>
                    <button class="Countrytablinks" onclick="openSector(event, 'OilgasTab')" id="secondOpen">Oil & Gas</button>
                    <button class="Countrytablinks" onclick="openSector(event, 'MultipleTab')" id="firstOpen">Cross Sector</button>
                </div>

                <!-- Tab content -->
                <div id="BiogasTab" style="display:none;"  class="Countrytabcontent">
      


                                <div id="Bslider" class="Bslider">

                                    <asp:Repeater ID="resourceBRepeater" runat="server" OnItemDataBound="resourceBDataBound">
                                        <ItemTemplate>
                                            <asp:Literal ID="LitBResource" runat="server"></asp:Literal>
                                        </ItemTemplate>
                                    </asp:Repeater>

                                </div>
       
      

                </div>

                <div id="CoalTab" style="display:none;" class="Countrytabcontent">

                    <div id="Cslider" class="Cslider">
                                <asp:Repeater ID="resourceCRepeater" runat="server" OnItemDataBound="resourceCDataBound">
                                        <ItemTemplate>
                                            <asp:Literal ID="LitCResource" runat="server"></asp:Literal>
                                        </ItemTemplate>
                                    </asp:Repeater>

                    </div>

                </div>

                <div id="OilgasTab" style="display:none;" class="Countrytabcontent">

                                <div id="Ogslider" class="Ogslider">

                                    <asp:Repeater ID="resourceOGRepeater" runat="server" OnItemDataBound="resourceOGDataBound">
                                        <ItemTemplate>
                                            <asp:Literal ID="LitOGResource" runat="server"></asp:Literal>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                 <!--   <div class="Ogslidediv">
                                        <img src="images/gmc-thumbs/unep-gma.png" style='float:right;'/>
                                        <a href="https://globalmethane.org/challenge/gma.html">
                                            <h3>UNEP: Global Methane Alliance</h3>
                                        </a>
                                        <div class="gmctag gmcogtag">Oil & Gas</div>
                                        <br />
                                        The GMA gathers international organizations, non-governmental organizations, financing institutions, and oil and gas companies to support countries in setting ambitious methane reduction targets for the oil and gas industry.<br />
                                        <a style="float: right;" class="btn btn-primary" href="https://globalmethane.org/challenge/gma.html">Read More...</a>
                                    </div>
                                    <div class="Ogslidediv">
                                        <img src="images/gmc-thumbs/unep-methane-science-studies.png" style='float:right;'/>
                                        <a href="https://globalmethane.org/challenge/methanestudies.html">
                                            <h3>UNEP: Methane Science Studies </h3>
                                        </a>
                                        <div class="gmctag gmcogtag">Oil & Gas</div>
                                        <br />
                                        The results of ongoing and future methane science studies will improve understanding of methane emissions at a global level, allowing industry, governments, and other stakeholders to prioritize actions to reduce methane emissions.<br />
                                        <a style="float: right;" class="btn btn-primary" href="https://globalmethane.org/challenge/methanestudies.html">Read More...</a>
                                    </div>
                                    <div class="Ogslidediv">
                                        <img src="images/gmc-thumbs/ogmp.png" style='float:right;'/>
                                        <a href="https://globalmethane.org/challenge/ogmp.html">
                                            <h3>UNEP: Oil and Gas Methane Partnership</h3>
                                        </a>
                                        <div class="gmctag gmcogtag">Oil & Gas</div>
                                        <br />
                                        The OGMP provides a protocol to help companies manage their methane emissions from upstream oil and gas operations and offers a credible platform to help member companies demonstrate reductions to industry stakeholders.<br />
                                        <a style="float: right;" class="btn btn-primary" href="https://globalmethane.org/challenge/ogmp.html">Read More...</a>
                                    </div> -->
                                </div>



                </div>

                <div id="MultipleTab" style="display:none;" class="Countrytabcontent">

                                <div id="Mslider" class="Mslider">

                                    <asp:Repeater ID="resourceMRepeater" runat="server" OnItemDataBound="resourceMDataBound">
                                        <ItemTemplate>
                                            <asp:Literal ID="LitMResource" runat="server"></asp:Literal>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                  <!--  <div class="Mslidediv">
                                        <img src="images/gmc-thumbs/arctic-council.png" style='float:right;'/>
                                        <a href="https://globalmethane.org/challenge/arctic.html">
                                            <h3>Arctic Council's Expert Group on Black Carbon and Methane</h3>
                                        </a>
                                        <div class="gmctag gmcmultipletag">Mutliple</div>
                                        <br />
                                        The Arctic Council established the Expert Group on Black Carbon and Methane (EGBCM) to assess progress towards the reduction of black carbon and methane emissions across the Arctic.  Every two years, the EGBCM develops a report that summarizes emissions and develops recommendations to policy makers on voluntary actions to reduce emissions.<br />
                                        <a style="float: right;" class="btn btn-primary" href="https://globalmethane.org/challenge/arctic.html">Read More...</a>
                                    </div> -->
                                </div>
 
                </div>
                <p style="margin-left:12px;">Visit the <a href="../challenge/redesign.html">Global Methane Challenge</a> website to explore more.</p>
            </div>
        <!-- Container (Global Statistics Section) -->
        <div id="matters" class="container-fluid" style="background:#fcfffc;">
            <div class="row">
                The charts below illustrate the projected emissions of methane in GMI partner countries through 2050.  These data were extracted from the U.S. Environmental Protection Agency (U.S. EPA) report, <a href="https://www.epa.gov/global-mitigation-non-co2-greenhouse-gases." target="_blank">Global Non-CO<sub>2</sub> Greenhouse Gas Emission Projections & Mitigation Potential: 2015-2050</a>. This page presents only data for methane emissions within the industry sectors targeted by GMI:  Biogas, Coal Mines, and Oil & Gas.  Additional data are available from the <a href="https://cfpub.epa.gov/ghgdata/nonco2/" target="_blank">U.S EPA’s Non-CO<sub>2</sub> Greenhouse Gas Data Tool</a>.
            </div>
            <div id="emissions"  class="row" style="background-color:#dfe6e9;padding:10px;">               
                       <div class="col-md-6">
                           <h2>Worldwide Methane Emissions</h2>
                           Chart shows the total projected amount of annual methane emissions through 2050 for each of the GMI target sectors. The chart includes projected emissions data for only GMI Partner countries.
                           </div>
                    <div class="col-md-6">

                        <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
<script type="text/javascript" src="https://www.google.com/jsapi"></script>
<script type="text/javascript">
    google.load("visualization", "1", { packages: ["corechart"] });
    google.setOnLoadCallback(drawChart);
    function drawChart() {
        var options = {
            colors: ['#2e7e56', '#f15c54', '#464379'],
            height: 400,
            vAxis: { title: 'MMTCO2e' },
            xAxis: {title: 'Year'},
            isStacked: true,
            legend: { position: "below" },
        };
        $.ajax({
            type: "POST",
            url: "countries.aspx/GetChartData",
            data: '{}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (r) {
                var data = google.visualization.arrayToDataTable(r.d);
                var chart = new google.visualization.AreaChart($("#chart")[0]);
                chart.draw(data, options);
            },
            failure: function (r) {
                alert(r.d);
            },
            error: function (r) {
                alert(r.d);
            }
        });
    }
</script>
<div id="chart" style="width: 100%;">
</div>
</div>
            </div>
            <div class="row" style="background-color:#dfe6e9;padding:10px;margin-top:10px;">
                <div class="col-md-4"><h2>Biogas Methane Emissions</h2><div id="biochart" style="width: 100%;"></div>Chart shows the projected total amount of annual methane emissions through 2050 in all GMI Partner Countries for the Biogas sector. Data are shown for manure management, municipal solid waste, and wastewater.</div>
                <div class="col-md-4"><h2>Coal Mines Methane Emissions</h2><div id="coalchart" style="width: 100%;"></div>Chart shows the projected total amount of annual methane emissions through 2050 in all GMI Partner Countries for the Coal Mines sector. Data are shown for surface mines and underground mines.</div>
                <div class="col-md-4"><h2>Oil & Gas Methane Emissions</h2><div id="oilchart" style="width: 100%;"></div>Chart shows the projected total amount of annual methane emissions through 2050 in all GMI Partner Countries for the Oil & Gas sector.</div>
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
        </a><br />

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

                <script>
            function openSector(evt, cityName) {
                var i, tabcontent, tablinks;
                tabcontent = document.getElementsByClassName("Countrytabcontent");
                for (i = 0; i < tabcontent.length; i++) {
                    tabcontent[i].style.display = "none";
                }
                tablinks = document.getElementsByClassName("Countrytablinks");
                for (i = 0; i < tablinks.length; i++) {
                    tablinks[i].className = tablinks[i].className.replace(" active", "");
                }
                document.getElementById(cityName).style.display = "block";
                evt.currentTarget.className += " active";

                $('.Mslider').resize();
                $('.Ogslider').resize();
                $('.Cslider').resize();
                $('.Bslider').resize();
            }

            // Get the element with id="defaultOpen" and click on it


       

            $('#defaultOpen').click(function () {
                $('.Bslider').slick('refresh');
            });

            $('#firstOpen').click(function () {

                $('.Mslider').slick('refresh');
            });

            $('#secondOpen').click(function () {
                $('.Ogslider').slick('refresh');
   
            });
            $('#thirdOpen').click(function () {
                $('.Cslider').slick('refresh');

            });

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


<script type="text/javascript">
    google.load("visualization", "1", { packages: ["corechart"] });
    google.setOnLoadCallback(drawChart);
    function drawChart() {
        var options = {
            colors: ['#ac2a17', '#f15c54'],
            height: 400,
            vAxis: { title: 'MMTCO2e' },
            xAxis: {title: 'Year'},
            isStacked: true,
            legend: { position: 'top', alignment: 'start' },
        };
        $.ajax({
            type: "POST",
            url: "countries.aspx/GetCoalChartData",
            data: '{}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (r) {
                var data = google.visualization.arrayToDataTable(r.d);
                var chart = new google.visualization.AreaChart($("#coalchart")[0]);
                chart.draw(data, options);
            },
            failure: function (r) {
                alert(r.d);
            },
            error: function (r) {
                alert(r.d);
            }
        });
    }
</script>
    <script type="text/javascript">
    google.load("visualization", "1", { packages: ["corechart"] });
    google.setOnLoadCallback(drawChart);
    function drawChart() {
        var options = {
            colors: ['#2e7e56', '#58BAB4', '#7AAD85'],
            height: 400,
            vAxis: { title: 'MMTCO2e' },
            xAxis: {title: 'Year'},
            isStacked: true,
            legend: { position: 'top', alignment: 'start' },
        };
        $.ajax({
            type: "POST",
            url: "countries.aspx/GetBioChartData",
            data: '{}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (r) {
                var data = google.visualization.arrayToDataTable(r.d);
                var chart = new google.visualization.AreaChart($("#biochart")[0]);
                chart.draw(data, options);
            },
            failure: function (r) {
                alert(r.d);
            },
            error: function (r) {
                alert(r.d);
            }
        });
    }
</script>
    <script type="text/javascript">
    google.load("visualization", "1", { packages: ["corechart"] });
    google.setOnLoadCallback(drawChart);
    function drawChart() {
        var options = {
            colors: ['#464379'],
            height: 400,
            vAxis: { title: 'MMTCO2e' },
            xAxis: {title: 'Year'},
            isStacked: true,
            legend: { position: 'top', alignment: 'start' },
        };
        $.ajax({
            type: "POST",
            url: "countries.aspx/GetOilChartData",
            data: '{}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (r) {
                var data = google.visualization.arrayToDataTable(r.d);
                var chart = new google.visualization.AreaChart($("#oilchart")[0]);
                chart.draw(data, options);
            },
            failure: function (r) {
                alert(r.d);
            },
            error: function (r) {
                alert(r.d);
            }
        });
    }
</script>
    <script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>

  <script type="text/javascript">
    $(document).ready(function(){
        $('.slider-for').slick({
            slidesToShow: 1,
            slidesToScroll: 1,
            arrows: false,
            fade: true,
            asNavFor: '.slider-nav'
        });
        $('.slider-nav').slick({
            slidesToShow: 1,
            slidesToScroll: 1,
            asNavFor: '.slider-for',
            dots: true,
            centerMode: true,
            centerPadding: '0px',
            focusOnSelect: true
        });
    });
  </script>

        <script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
        <script type="text/javascript">
            $(document).ready(function () {
                $('.slider-for').slick({
                    slidesToShow: 1,
                    speed: 300,
                    slidesToScroll: 1,
                    arrows: false,
                    fade: true,
                    asNavFor: '.slider-nav'
                });
                $('.slider-nav').slick({
                    slidesToShow: 1,
                    speed: 300,
                    slidesToScroll: 1,
                    asNavFor: '.slider-for',
                    dots: true,
                    centerMode: true,
                    centerPadding: '0px',
                    focusOnSelect: true
                });
                $('.Bslider').slick({
                    slidesToShow: 1,
                    speed: 300,
                    slidesToScroll: 1,
                    arrows: true,
                    dots: true,
                    fade: true,
                });

                $('.Cslider').slick({
                    slidesToShow: 1,
                    speed: 300,
                    slidesToScroll: 1,
                    arrows: true,
                    dots: true,
                    fade: true,
                });
                $('.Ogslider').slick({
                    slidesToShow: 1,
                    speed: 300,
                    slidesToScroll: 1,
                    arrows: true,
                    dots: true,
                    fade: true,
                });
                $('.Mslider').slick({
                    slidesToShow: 1,
                    speed: 300,
                    slidesToScroll: 1,
                    arrows: true,
                    dots: true,
                    fade: true,
                });
            });


            if ($('.Bslidediv').length > 0) {
                document.getElementById("defaultOpen").click();
            }else if($('.Cslidediv').length > 0) {
                document.getElementById("thirdOpen").click();
            }else if ($('.Ogslidediv').length > 0) {
                document.getElementById("secondOpen").click();
            } else if ($('.Mslidediv').length > 0) {
                document.getElementById("firstOpen").click();
            }


            if ($('.Bslidediv').length == 0) {
                document.getElementById("Bslider").innerHTML += ("<div class='SlideNone'>Do you have a story about reducing methane emissions in the Biogas sector?  <a href='../challenge/submission'>Submit your story today</a> to the Global Methane Challenge.<br><br>For more information, visit the <a href='../challenge/redesign.html'>Global Methane Challenge</a> website.</div>");
            }
            if ($('.Cslidediv').length == 0) {
                document.getElementById("Cslider").innerHTML += ("<div class='SlideNone'>Do you have a story about reducing methane emissions in the Coal Mines sector?  <a href='../challenge/submission'>Submit your story today</a> to the Global Methane Challenge.<br><br>For more information, visit the <a href='../challenge/redesign.html'>Global Methane Challenge</a> website.</div>");
            }
            if ($('.Ogslidediv').length == 0) {
                document.getElementById("Ogslider").innerHTML += ("<div class='SlideNone'>Do you have a story about reducing methane emissions in the Oil & Gas sector?  <a href='../challenge/submission'>Submit your story today</a> to the Global Methane Challenge.<br><br>For more information, visit the <a href='../challenge/redesign.html'>Global Methane Challenge</a> website.</div>");
            }
            if ($('.Mslidediv').length == 0) {
                document.getElementById("Mslider").innerHTML += ("<div class='SlideNone'>Do you have a story about reducing methane emissions for multiple sectors?  <a href='../challenge/submission'>Submit your story today</a> to the Global Methane Challenge.<br><br>For more information, visit the <a href='../challenge/redesign.html'>Global Methane Challenge</a> website.</div>");
            }
        </script>

</body>

</html>