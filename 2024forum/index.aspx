<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="index.aspx.vb" Inherits="M2M_Redesign.index19" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Global Methane Forum 2024 | Global Methane Initiative</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans&display=swap" rel="stylesheet">
    <!-- Google Tag Manager -->
    <script>
        (function(w, d, s, l, i) {
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
    <!-- Google tag (gtag.js) -->
    <script async src="https://www.googletagmanager.com/gtag/js?id=G-46JVDVGWQS"></script>
    <script>
        window.dataLayer = window.dataLayer || [];

        function gtag() {
            dataLayer.push(arguments);
        }
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
            max-width: 500px;
            border-radius: 10px;
            float: right;
            margin-left: 12px;
        }
        
        @media screen and (max-width:1000px) {
            .cardimage {
                width: 100%;
                max-width: 100%!important;
                border-radius: 10px;
                float: right;
            }
        }
        
        @media screen and (max-width: 768px) {
            .cardimage {
                width: 100%;
                max-width: 100%!important;
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
    </style>
    <script src="https://kit.fontawesome.com/15da2e6088.js" crossorigin="anonymous"></script>
</head>

<body>

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
                            <a class="nav-link active" aria-current="page" href="#">Home</a>
                        </li>
                      <li class="nav-item">
                            <a class="nav-link" href="register.html">Register</a>
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

            <div class="bg-body-tertiary jumbotron rounded-3">
                <!--     <video autoplay muted playsinline poster="vid/poster.png">
                    <source src="vid/intro.mp4" type="video/mp4" />
                </video>
               -->
            </div>
            <div class="row align-items-md-stretch mb-2">

                <div class="col-md-12">

                    <!--<img src="forum24logo__.svg" style="width:100%;padding:5px;"> -->

                    <h2 style="font-weight:bold;">2024 Global Methane Forum</h2>

                    <h4 style="font-weight:bold;">Mobilizing Methane Action</h4>
                    <h6>18-21 March 2024 • Geneva, Switzerland</h6>
                    <hr>
                    <div class="row">
                        <div class="col-xl-7">
                            <div class="row">
                                <div class="col-12">
<div class="alert alert-primary alert-dismissible fade show" role="alert">
  <strong>New!</strong> The draft <a href="agenda.html">agenda for the Plenary Session</a> is now available; agendas for the Technical Sessions are coming soon.
  <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
</div>
<div class="alert alert-success" role="alert">
  <strong>Registration is now open!</strong> The 2024 Global Methane Forum is free to attend. <a href="register.html">Register today</a> to join us either in person or virtually.
</div>
                                    <p>The 2024 Global Methane Forum is a premier global event that will bring together global thought and industry leaders in Geneva, Switzerland from 18-21 March 2024 to promote replicable methane mitigation successes and
                                        mobilize action to achieve ambitious methane emission reductions. This event will be organized jointly with the UN Economic Commission for Europe’s Group of Experts meetings – the 19th Session of the Group of Experts on Coal Mine Methane and Just Transition, and the 11th Session of the
                                        Group of Experts on Gas.
                                    </p>

                                    <p>The goals of the 2024 Global Methane Forum are to:
                                        <ul>
                                            <li>Convene and inspire high-level international participants to advance action to achieve ambitious global methane mitigation targets; </li>
                                            <li>Highlight methane mitigation activities, including to achieve the goals of the Global Methane Pledge;</li>
                                            <li>Share information about technical, policy, financing, and regulatory issues related to methane policy and project development; and </li>
                                            <li>Engage and enhance private sector participation in methane mitigation. </li>
                                        </ul>
                                    </p>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-12">
                                    <h4>Who should attend?</h4>
                                    The target audience includes national and international policy makers, country representatives, methane capture and use project developers, site and/or project managers, financial institution representatives, scientists, researchers, and industry experts.
                                </div>
                            </div>
<br>
                            <div class="row">
                                <div class="col-12">
                                    <h4>Who is hosting the Forum?</h4>
                                    The Forum will be hosted by the Global Methane Initiative (GMI) and the <a href="https://unece.org/" target="_blank">United Nations Economic Commission for Europe (UNECE)</a> in partnership with the <a href="https://www.globalmethanehub.org/"
                                        target="_blank">Global Methane Hub</a> and the <a href="https://www.ccacoalition.org/" target="_blank">Climate and Clean Air Coalition (CCAC)</a>.
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-6 col-sm-3" style="padding:10px;">
                                    <a href="https://www.globalmethane.org/" title="Visit the Global Methane Initiative website" target="_blank"><img src="img/trad logo and tagline 1.svg" alt="Global Methane Initiative" style="width:100%;"></a>
                                </div>
                                <div class="col-6 col-sm-3" style="padding:10px;">
                                    <a href="https://unece.org/" title="Visit the UNECE website" target="_blank"><img src="img/United_Nations_Economic_and_Social_Commission_for_Europe_Logo.svg" alt="United Nations Economic Commission for Europe (UNECE)" style="width:100%;margin-top:15px;"></a>
                                </div>
                                <div class="col-6 col-sm-3" style="padding:10px;">
                                    <a href="https://www.globalmethanehub.org/" title="Visit the Global Methane Hub website" target="_blank"><img src="logo-color.png" alt="Global Methane Hub" style="width:95%;"></a>
                                </div>
                                <div class="col-6 col-sm-3" style="padding:10px;">
                                    <a href="https://www.ccacoalition.org/en" title="Visit the CCAC website" target="_blank"><img src="ccac.svg" alt="Climate and Clean Air Coalition (CCAC)" style="width:100%;"></a>
                                </div>
                            </div>

                        </div>
                        <div class="col-xl-5">

                            <div class="card" style="width: 100%;background:#cfe2ff">
                                <img src="img/card-horizontal-600.png" class="card-img-top" alt="2024 forum card">
                                <div class="card-body">
                                    <h4 class="card-title">Why should you attend?</h4>
                                    <p class="card-text">
                                        <ul>
                                            <li>Learn about global efforts to reduce methane, including the benefits of mobilizing action, the latest on policy and practices by governments and industry, the importance of data, and successful financing strategies
                                                for implementation</li>
                                            <li>Engage with representatives from around the world about methane reduction and mitigation opportunities, activities, and lessons learned</li>
                                            <li>Connect with technical experts in breakout sessions on biogas (agricultural sources, municipal solid waste, municipal wastewater systems), coal mines, and oil and gas systems </li>
                                            <li>Showcase your technical and policy achievements, leadership, and experiences on methane</li>
                                            <li>Participate in discussions that will shape the future of methane action in GMI Partner Countries and UNECE member States</li>
                                            <li>Attend meetings of the UNECE Group of Experts on Coal Mine Methane and Just Transition and Group of Experts on Gas </li>
                                            <li>Celebrate the 20th anniversary of GMI</li>
                                        </ul>
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <hr>

                </div>
            </div>

            <div class="row align-items-md-stretch mb-2">
                <div class="col-md-6">
                    <div class="h-100 p-5 text-bg rounded-3 jumboSide" style="background:transparent!important;border:1px solid #686868">
                    <style>
                        .embed-container {
                            position: relative;
                            padding-bottom: 56.25%;
                            height: 0;
                            overflow: hidden;
                            max-width: 100%;
                        }
                        
                        .embed-container iframe,
                        .embed-container object,
                        .embed-container embed {
                            position: absolute;
                            top: 0;
                            left: 0;
                            width: 100%;
                            height: 100%;
                        }
                    </style>
                         <h2>GMI Explained</h2>
                    <div class='embed-container border rounded-3'>
                        <video controls playsinline poster="vid/promoPoster.png">
                            <source src="/gmi_video_gmf.mp4" type="video/mp4" />
                        </video>
                    </div>
                        </div>
                    <!--<div class="h-100 p-5 bg-body-tertiary border rounded-3">
          <h2>Add borders</h2>
          <p>Or, keep it light and add a border for some added definition to the boundaries of your content. Be sure to look under the hood at the source HTML here as we've adjusted the alignment and sizing of both column's content for equal-height.</p>
          <button class="btn btn-outline-secondary" type="button">Example button</button>
        </div>-->
                </div>
               
            
                  <div class="col-md-6">
                      <div class="h-100 p-5 text-bg-dark rounded-3 jumboSide" style="background:#434368">
                          <h2>Attendance</h2>
                          We have <%= CountryCountString  %> people from <%= CountryCountString2  %> countries registered to attend the Forum either virtually or in person!
                      <div id="mapdiv" style="max-width: 100%; height: 250px;"></div>
                      </div>
                  </div>
                
                </div>
            <div class="row align-items-md-stretch mb-2">
                 <div class="col-md-12">
                    <div class="h-100 p-5 text-bg-dark rounded-3 jumboSide">
                        <h2>Stay Informed</h2>
                        <p>Sign up for our mailing list to learn more about the 2024 Global Methane Forum as details are confirmed. </p>
                        <!-- Begin Mailchimp Signup Form -->
                        <div id="mc_embed_signup">
                            <form action="https://globalmethane.us19.list-manage.com/subscribe/post?u=da591cea9e010abd0437239de&amp;id=a3abe26702&amp;f_id=0077a4e4f0" method="post" id="mc-embedded-subscribe-form" name="mc-embedded-subscribe-form" class="validate" target="_self">
                                <div id="mc_embed_signup_scroll">


                                    <div class="mc-field-group form-group">
                                        <label for="mce-EMAIL">Email Address
                                        </label>
                                        <input type="email" value="" name="EMAIL" class="required email form-control" id="mce-EMAIL" required>
                                        <span id="mce-EMAIL-HELPERTEXT" class="helper_text"></span>
                                    </div>
                                    <div id="mce-responses" class="clear">
                                        <div class="response" id="mce-error-response" style="display:none"></div>
                                        <div class="response" id="mce-success-response" style="display:none"></div>
                                    </div>
                                    <!-- real people should not fill this in and expect good things - do not remove this or risk form bot signups-->
                                    <div style="position: absolute; left: -5000px;" aria-hidden="true"><input type="text" name="b_da591cea9e010abd0437239de_a3abe26702" tabindex="-1" value=""></div>
                                    <div class="clear"><input type="submit" value="Subscribe" name="subscribe" id="mc-embedded-subscribe" class="button btn btn-primary"></div>
                                </div>
                            </form>
                        </div>

                        <!--End mc_embed_signup-->
                    </div>
                </div>
            </div>
            <!-- <div class="row mb-2">
                <div class="col-md-3">
<img src="img/trad logo and tagline 1.svg" style="width:100%">
                </div>
                <div class="col-md-3">
  <img src="img/United_Nations_Economic_and_Social_Commission_for_Europe_Logo.svg" style="width:100%;margin-top:20px;">
                </div>
              </div>-->

            <footer class="pt-3 mt-4 text-body-secondary border-top">
                <a href="https://www.globalmethane.org/" target="_blank">Global Methane Initiative (GMI)</a> | Leading methane action since 2004
            </footer>
        </div>
    </main>

    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous">
    </script>

        <script src="//cdn.amcharts.com/lib/4/core.js"></script>
    <script src="//cdn.amcharts.com/lib/4/maps.js"></script>
    <script src="//cdn.amcharts.com/lib/4/geodata/worldLow.js"></script>
    <script src="https://cdn.amcharts.com/lib/4/themes/animated.js"></script>

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