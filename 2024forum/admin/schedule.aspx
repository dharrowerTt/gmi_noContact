<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="schedule.aspx.vb" Inherits="M2M_Redesign.schedule" %>

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
    <!-- DayPilot library -->
    <script src="../js/daypilot/daypilot-all.min.js"></script>
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
        
        .calendar_default_corner div:nth-child(2) {
            display: none!important;
        }
    </style>
    <script src="https://kit.fontawesome.com/15da2e6088.js" crossorigin="anonymous"></script>
</head>

<body>

    <form id="form2" runat="server">
        <div>

    <main>
        <nav class="navbar navbar-expand-lg navbar-dark bg-gmi">
            <div class="container">
                <a href="https://www.globalmethane.org/2024/agenda.html" class="d-flex align-items-center text-dark text-decoration-none">
                    <img src="../img/trad logo white.svg" width="60"> 2024 Forum Scheduler
                </a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
              </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                        <li class="nav-item">
                            <a class="nav-link" href="add.aspx">New Item</a>
                        </li>
                    </ul>
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
                    <h4>Schedule</h4>
                    <p>Click a scheduled event to edit details, or <a href="add.aspx">Add a new event</a>.</p>
                    <div id="dp"></div>






                </div>
            </div>


            <footer class="pt-3 mt-4 text-body-secondary border-top">
                <a href="https://www.globalmethane.org/" target="_blank">Global Methane Initiative (GMI)</a> | Leading methane action since 2004
            </footer>
        </div>
    </main>

    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous">
    </script>


    <script>
        const dp = new DayPilot.Calendar("dp", {

            locale: "en-gb",
            viewType: "WorkWeek",
            headerDateFormat: "dddd (d MMMM)",
            timeRangeSelectedHandling: "Disabled",
            cellDuration: 15,
            eventMoveHandling: "Disabled",
            eventResizeHandling: "Disabled",
            heightSpec: "BusinessHoursNoScroll",
        });

        dp.viewType = "Days";
        dp.showCurrentTime = true;
        dp.days = 4;
        dp.businessBeginsHour = 9;
        dp.businessEndsHour = 19.30;
        dp.useEventBoxes = "Never";
        dp.eventArrangement = "SideBySide";
        dp.startDate = "2024-03-18";
        dp.events.list = <%=ScheduleResponse%>;
        dp.onBeforeTimeHeaderRender = function(args) {
            if (args.header.level === 1) {
                var dayOfWeek = args.header.start.getDayOfWeek();
                if (dayOfWeek === 1) {
                    args.header.backColor = "#4472c4";
                    args.header.cssClass = "weekend_header";
                }
                if (dayOfWeek === 2) {
                    args.header.backColor = "#ff0000";
                    args.header.cssClass = "weekend_header";
                }
            }
        }
        dp.init();

        dp.onEventClicked = function (args) {
            window.location.href = 'editEvent.aspx?id='+args.e.id();
        };

    </script>
                    </div>
    </form>
</body>

</html>
