<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="partner.aspx.vb" Inherits="partner" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head>
    <title>Global Methane Inititative
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


        tr.group,
        tr.group:hover {
            background-color: #3092c0 !important;
            font-weight: bold;
        }

        .dt-buttons {
            text-align: right;
            float: right;
            margin-left: 30px;
        }

        #list_filter {
            float: right;
        }

        .odd {
            background-color: #fafafc !important;
        }

        tfoot tr th {
            padding: 8px 10px !important;
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
    <link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" />
    <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick-theme.css" />
    <style>
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


    #TellUs{
        display:none;
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
    <!-- END // this is for the translate dropdown -->
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
                    <li><a href="#events">EVENTS</a></li>
                    <li><a href="#new">METHANE EMISSIONS</a></li>
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
                                    <a href="/sectors/index.aspx?s=steer" class="steering">Steering Committee</a>
                                </li>
                                <li class="divider sectorhide"></li>
                                <li class="dropdown sectorhide">
                                    <a href="/biogas/index.aspx" class="biogas">Biogas</a>
                                </li>
                                <li class="dropdown sectorhide">
                                    <a href="/coal/index.aspx" class="coal">Coal</a>

                                </li>
                                <li class="dropdown sectorhide">
                                    <a href="/sector.aspx?name=oilgas" class="oilgas">Oil &
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

                            </li>
                            <li class="divider"></li>
                            <li class="dropdown rollup" style="background: #ffa502; color: #000001!important;">
                                <a style="background: #ffa502; color: #000001!important;" href="challenge/showcase.html">Global
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
                <div class="col-sm-6" style="text-align: right;">
                    <p><a href="/index.aspx">HOME</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="countries.aspx">PARTNER COUNTRIES</a>&nbsp;&nbsp;|&nbsp;&nbsp;<%= strCountryName  %></p>
                    <h1><%= strCountryName  %></h1><h3><asp:PlaceHolder ID="datejoined" runat="server" /></h3>
                </div>
            </div>

            <div class="row"
                style="margin-bottom: 20px; background: rgba(255,255,255,1); padding-top: 10px; margin-left: 1px; margin-right: 1px; margin-bottom: 0; padding-bottom: 20px;">
                <div class="col-sm-6">
                    <h3>Methane Emissions Summary</h3>
                    <p>The table below provides estimates for projected methane emissions from 2020-2050. Data are presented in million metric tonnes carbon dioxide equivalent (MMTCO<sub>2</sub>e).</p>
                    <asp:PlaceHolder ID="PlaceHolder1" runat="server" />
                    <div id="events" style="font-size: 15px;">Source: <a href="https://www.epa.gov/global-mitigation-non-co2-greenhouse-gases">Global Non-CO<sub>2</sub> Greenhouse Gas Emission Projections & Mitigation Potential: 2015-2050</a>, U.S. EPA</div>

                    <h3 style="margin-top: 30px;">Events</h3>
                    <asp:Repeater ID="crlookupRepeater" runat="server" OnItemDataBound="crlookupDataBound">
                        <ItemTemplate>
                            <asp:Literal ID="crlitNav" runat="server"></asp:Literal>
                        </ItemTemplate>
                    </asp:Repeater>
                    <p><a href="/news-events/calendar.aspx">View all events</a>.</p>
                </div>
                <div class=" col-sm-6">
                    <h3 style="margin-top: 30px;">GMI Delegates</h3>
                    <p id="delInfo" runat="server">The number of delegates to the GMI Steering Committee and Subcommittees are listed below:</p>
                    <table style="margin-left: 15px; margin-bottom: 15px; width: 50%;">

                        <asp:Literal ID="delMsg" runat="server" Visible="false"></asp:Literal>
                        <asp:Repeater ID="lookupRepeater" runat="server" OnItemDataBound="lookupDataBound">
                            <ItemTemplate>
                                <asp:Literal ID="litNav" runat="server"></asp:Literal>
                            </ItemTemplate>
                        </asp:Repeater>

                    </table>
                    <p>For the full list of GMI delegates, please visit the <a href="/about/delegates.aspx">Steering Committee and Subcommittee Delegates page</a>.</p>
                    <section class="py-5 gmi-light-blue">        <div class="container">    <div class="row">    <div class="col-sm-12">
                        <form name="mapform" id="mapform">

                            <h3>GMI Project Sites</h3>
                            <p>The map below shows locations where GMI and our Partners have worked to reduce barriers to the recovery and use of methane as a clean energy source. Click on a site to learn more.</p>

                            <a id="mapflip" class="lightlinkrightsmall">How to use this map / Map key</a> <a id="mapflipclose"
                                class="lightlinkrightsmall">Close detail</a>
                            <div id="methanemapsiteshowto" style="background: rgba(48, 146, 192,.5)">
                                <p>
                                    The map shows completed and potential methane abatement, recovery, or use projects.
                                </p>
                                <ul>
                                    <li>Use the plus (+) and minus (-) buttons or scroll up and down to zoom in or out. </li>
                                    <li>Click an individual site to view a summary.</li>
                                    <li>For more site details click on the "View Detailed Information" link.</li>
                                    <li>Click "View larger map" to view a full-screen version of the map.</li>
                                </ul>
                                <p>
                                    <strong>Note:</strong> The placement of map icons is approximate, so the zoom-in
                feature is limited to avoid misrepresentations. Please <a href="/contactus.aspx">contact
                    us</a> us if you have more accurate information about the location of a project
                or site.
                                </p>
                                <div style="float: left; margin-right: 50px; margin-top: 30px;">
                                    <p>
                                        <strong>Map Key:</strong>
                                    </p>
                                    <p class="maplegenditem">

                                        <p class="maplegenditem">
                                            <asp:Image runat="server" alt="Red Icon" ImageUrl="~/images/Agricultureicon.png" />
                                            Agriculture
                                        </p>
                                        <p class="maplegenditem">
                                            <asp:Image runat="server" alt="Red Icon" ImageUrl="~/images/Coalicon.png" />
                                            Coal Mines
                                        </p>
                                        <p class="maplegenditem">
                                            <asp:Image runat="server" alt="Red Icon" ImageUrl="~/images/MSWicon.png" />
                                            MSW
                                        </p>
                                </div>
                                <div style="float: left; margin-top: 30px;">
                                    <p>
                                        &nbsp;
                                    </p>
                                    <p class="maplegenditem">
                                        <asp:Image runat="server" alt="Red Icon" ImageUrl="~/images/OilGasicon.png" />
                                        Oil & Gas
                                    </p>
                                    <p class="maplegenditem">
                                        <asp:Image runat="server" alt="Red Icon" ImageUrl="~/images/WasteWatericon.png" />
                                        Wastewater
                                    </p>
                                    <p class="maplegenditem">
                                        <asp:Image runat="server" alt="Red Icon" ImageUrl="~/images/partnerCountry.png" />
                                        Partner Country
                                    </p>
                                </div>
                            </div>

                            <div id="map_canvas" style="width: 100%;">
                                <asp:Literal ID="LitMap" runat="server"></asp:Literal>
                            </div>
                            <br class="clear" style="clear: both;" />

                            <br style="clear: both;" />
                        </form>

                    </div>

                </div>
            </div>
            
                <div id="gmcpromo" class="container-fluid">
                   <a href="/challenge"> <img src="../img/gmclogo.svg" class="gmcpromoimg"></a>
                    <div  id="CountryTag" class="gmcpromotag">Look what's happening in <%= strCountryName  %>...</div>
                     <div id="TellUs">Tell us how you're reducing methane emissions.</div>
                </div>
            


            <div id="new" class="container bodySections" style="background: #FCC99A; border-top:2px solid #F2973B;">

                <!-- Tab links -->
                <div class="Countrytab">
                    <button class="Countrytablinks" onclick="openSector(event, 'BiogasTab')" id="defaultOpen">Biogas</button>
                    <button class="Countrytablinks" onclick="openSector(event, 'CoalTab')" id="thirdOpen">Coal</button>
                    <button class="Countrytablinks" onclick="openSector(event, 'OilgasTab')" id="secondOpen">Oil & Gas</button>
                    <button class="Countrytablinks" onclick="openSector(event, 'MultipleTab')" id="firstOpen">Cross Sector</button>
                </div>

                <!-- Tab content -->
                <div id="BiogasTab" class="Countrytabcontent">
      


                                <div id="Bslider" class="Bslider">

                                    <asp:Repeater ID="resourceBRepeater" runat="server" OnItemDataBound="resourceBDataBound">
                                        <ItemTemplate>
                                            <asp:Literal ID="LitBResource" runat="server"></asp:Literal>
                                        </ItemTemplate>
                                    </asp:Repeater>

                                </div>
       
      

                </div>

                <div id="CoalTab" class="Countrytabcontent">

                    <div id="Cslider" class="Cslider">
                                <asp:Repeater ID="resourceCRepeater" runat="server" OnItemDataBound="resourceCDataBound">
                                        <ItemTemplate>
                                            <asp:Literal ID="LitCResource" runat="server"></asp:Literal>
                                        </ItemTemplate>
                                    </asp:Repeater>

                    </div>

                </div>

                <div id="OilgasTab" class="Countrytabcontent">

                                <div id="Ogslider" class="Ogslider">

                                    <asp:Repeater ID="resourceOGRepeater" runat="server" OnItemDataBound="resourceOGDataBound">
                                        <ItemTemplate>
                                            <asp:Literal ID="LitOGResource" runat="server"></asp:Literal>
                                        </ItemTemplate>
                                    </asp:Repeater>

                                </div>



                </div>

                <div id="MultipleTab" class="Countrytabcontent">

                                <div id="Mslider" class="Mslider">

                                    <asp:Repeater ID="resourceMRepeater" runat="server" OnItemDataBound="resourceMDataBound">
                                        <ItemTemplate>
                                            <asp:Literal ID="LitMResource" runat="server"></asp:Literal>
                                        </ItemTemplate>
                                    </asp:Repeater>

                                </div>
 
                </div>
                <p style="margin-left:12px;">Visit the <a href="../challenge/redesign.html">Global Methane Challenge</a> website to explore more.</p>
            </div>





            <!-- Container (Global Statistics Section) -->
            <div id="matters" class="container" style="background: #fcfffc;">
                <div class="row" style="background-color: #dfe6e9; padding-top: 10px;">

                    <div class="col-md-6">
                        <h2><%= strCountryName  %> Methane Emissions</h2>
                        Chart shows the total projected amount of annual methane emissions through 2050 for each of the GMI target sectors. The chart includes projected emissions data for <%= strCountryName  %>.
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
                                    xAxis: { title: 'Year' },
                                    isStacked: true,
                                    legend: { position: "below" },
                                    series: {
                                        0: { lineDashStyle: [1, 1] },
                                        1: { lineDashStyle: [4, 4] },
                                        2: { lineDashStyle: [2, 1, 2] }
                                    },
                                };
                                $.ajax({
                                    type: "POST",
                                    url: "partner.aspx/GetChartData",
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
                        Source: <a href="https://www.epa.gov/global-mitigation-non-co2-greenhouse-gases">Global Non-CO<sub>2</sub> Greenhouse Gas Emission Projections & Mitigation Potential: 2015-2050</a>, U.S. EPA
                    </div>
                </div>
                <div class="row" style="background-color: #dfe6e9; padding: 10px; margin-top: 10px;">
                    <div class="col-md-4">
                        <h2>Biogas Methane Emissions</h2>
                        <div id="biochart" style="width: 100%;"></div>
                        Chart shows the projected total amount of annual methane emissions through 2050 in <%= strCountryName  %> for the Biogas sector. Data are shown for manure management, municipal solid waste, and wastewater.
                    </div>
                    <div class="col-md-4">
                        <h2>Coal Mines Methane Emissions</h2>
                        <div id="coalchart" style="width: 100%;"></div>
                        Chart shows the projected total amount of annual methane emissions through 2050 in <%= strCountryName  %> for the Coal Mines sector. Data are shown for surface mines and underground mines.
                    </div>
                    <div class="col-md-4">
                        <h2>Oil & Gas Methane Emissions</h2>
                        <div id="oilchart" style="width: 100%;"></div>
                        Chart shows the projected total amount of annual methane emissions through 2050 in <%= strCountryName  %> for the Oil & Gas sector.
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

                                <br />
                                <br />

                                <a class="btn btn-primary" href="email.aspx" target="_blank">Send GMI an email.</a>

                            </div>
                            <div id="mailinglist" class="tab-pane fade">
                                <br />
                                <br />
                                <p>
                                    <a class="btn btn-primary" target="_blank" href="http://eepurl.com/ggwT3T">Sign Up
                                    Here</a>
                                </p>
                            </div>
                            <div id="partner" class="tab-pane fade">
                                <p>
                                    Interested national governments may request to become Partners in the Global Methane
                                Initiative at any time. Governments that join GMI have the opportunity to participate
                                in the work of the GMI Steering Committee, which guides the work of the initiative as a
                                whole, as well as any GMI subcommittees that may be of interest: biogas, coal mines,
                                and oil and gas.
                                </p>
                                <p>
                                    If you're interested in becoming a partner country, send us an <a
                                        href="mailto:asg@globalmethane.org?subject=Partner Country">email</a>.
                                </p>
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
        <!-- DataTable -->
        <link href="//ajax.googleapis.com/ajax/libs/jqueryui/1.11.1/themes/south-street/jquery-ui.min.css" rel="stylesheet" type="text/css" />
        <link href="//cdn.datatables.net/plug-ins/725b2a2115b/integration/jqueryui/dataTables.jqueryui.css" rel="stylesheet" type="text/css" />
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.css">
        <script src="//cdnjs.cloudflare.com/ajax/libs/moment.js/2.11.2/moment.min.js"></script>
        <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.js"></script>
        <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/plug-ins/1.10.19/dataRender/datetime.js"></script>

        <script src="//cdn.datatables.net/colreorder/1.1.2/js/dataTables.colReorder.min.js"></script>
        <script src="//cdn.datatables.net/plug-ins/725b2a2115b/api/fnFilterClear.js"></script>

        <link rel="stylesheet" type="text/css" href="https://rawgithub.com/swisnl/jQuery-contextMenu/master/dist/jquery.contextMenu.min.css">
        <script type="text/javascript" src="https://rawgithub.com/swisnl/jQuery-contextMenu/master/dist/jquery.contextMenu.min.js"></script>

        <!-- new scripts for the copy/download -->
        <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/buttons/1.5.6/js/dataTables.buttons.min.js"></script>
        <script type="text/javascript" charset="utf8" src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
        <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/buttons/1.5.6/js/buttons.html5.min.js"></script>
        <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/plug-ins/1.10.20/api/sum().js"></script>

        <script src="../includes/yadcf/jquery.dataTables.yadcf.js"></script>
        <link href="../includes/yadcf/jquery.dataTables.yadcf.css" rel="stylesheet" type="text/css" />


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
                    xAxis: { title: 'Year' },
                    isStacked: true,
                    legend: { position: 'top', alignment: 'start' },
                    series: {
                        0: { lineDashStyle: [1, 1] },
                        1: { lineDashStyle: [4, 4] }
                    },
                };
                $.ajax({
                    type: "POST",
                    url: "partner.aspx/GetCoalChartData",
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
                    xAxis: { title: 'Year' },
                    isStacked: true,
                    legend: { position: 'top', alignment: 'start' },
                    series: {
                        0: { lineDashStyle: [1, 1] },
                        1: { lineDashStyle: [4, 4] },
                        2: { lineDashStyle: [2, 1, 2] }
                    },
                };
                $.ajax({
                    type: "POST",
                    url: "partner.aspx/GetBioChartData",
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
                    xAxis: { title: 'Year' },
                    isStacked: true,
                    legend: { position: 'top', alignment: 'start' },
                };
                $.ajax({
                    type: "POST",
                    url: "partner.aspx/GetOilChartData",
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

        <script>
            $(document).ready(function () {
                $("#mapflip").click(function () {
                    $("#methanemapsiteshowto").slideDown("slow");
                    $('#mapflip').hide();
                    $('#mapflipclose').show();
                });
            });
            $(document).ready(function () {
                $("#mapflipclose").click(function () {
                    $("#methanemapsiteshowto").slideUp("slow");
                    $('#mapflip').show();
                    $('#mapflipclose').hide();
                });
            });
        </script>

        <script>
            $(document).ready(function () {
                var oTable = $('#myTable').DataTable({
                    "order": [[0, "desc"]],
                    "info": false,
                    "paging": false,
                    "searching": false,

                    "columnDefs": [{
                        targets: [1, 2, 3],
                        render: $.fn.dataTable.render.number(',', '.', 3)
                    }],
                    "footerCallback": function (row, data, start, end, display) {
                        var api = this.api();
                        nb_cols = api.columns().nodes().length;
                        var j = 1;
                        while (j < nb_cols) {
                            var pageTotal = api
                        .column(j, { page: 'current' })
                        .data()
                        .reduce(function (a, b) {
                            return Number(a) + Number(b);
                        }, 0);
                            // Update footre
                            $(api.column(j).footer()).html(pageTotal.toFixed(3));
                            j++;
                        }
                    }

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
            } else {
                document.getElementById("gmcHolder").style.display = "none";
                document.getElementById("TellUs").style.display = "block";
                document.getElementById("CountryTag").style.display = "none";
            }


            if ($('.Bslidediv').length == 0) {
                document.getElementById("Bslider").innerHTML += ("<div class='SlideNone'>Do you have a story about how <%= strCountryName  %> is reducing methane emissions in the Biogas sector?  <a href='../challenge/submission'>Submit your story today</a> to the Global Methane Challenge.<br><br>For more information, visit the <a href='../challenge/redesign.html'>Global Methane Challenge</a> website.</div>");
            }
            if ($('.Cslidediv').length == 0) {
                document.getElementById("Cslider").innerHTML += ("<div class='SlideNone'>Do you have a story about how <%= strCountryName  %> is reducing methane emissions in the Coal Mines sector?  <a href='../challenge/submission'>Submit your story today</a> to the Global Methane Challenge.<br><br>For more information, visit the <a href='../challenge/redesign.html'>Global Methane Challenge</a> website.</div>");
            }
            if ($('.Ogslidediv').length == 0) {
                document.getElementById("Ogslider").innerHTML += ("<div class='SlideNone'>Do you have a story about how <%= strCountryName  %> is reducing methane emissions in the Oil & Gas sector?  <a href='../challenge/submission'>Submit your story today</a> to the Global Methane Challenge.<br><br>For more information, visit the <a href='../challenge/redesign.html'>Global Methane Challenge</a> website.</div>");
            }
            if ($('.Mslidediv').length == 0) {
                document.getElementById("Mslider").innerHTML += ("<div class='SlideNone'>Do you have a story about how <%= strCountryName  %> is reducing methane emissions for multiple sectors?  <a href='../challenge/submission'>Submit your story today</a> to the Global Methane Challenge.<br><br>For more information, visit the <a href='../challenge/redesign.html'>Global Methane Challenge</a> website.</div>");
            }
        </script>
        <style>
            #methanemapsiteshowto {
                display: none;
            }

            #mapflipclose {
                display: none;
            }

            #myTable tr :first-child {
                white-space: nowrap;
            }
        </style>
</body>

</html>
