<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="speakers.aspx.vb" Inherits="M2M_Redesign.speakers" %>


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
                    <li><a href="help.aspx">Help</a></li>
                </ul>
            </div>
        </div>
        <div class="row">
            <div class="col-md-4 sidebar  order-12 order-md-1"
                style="z-index: 300; background: #262261; padding-top: 20px; color: #fcfcfc;">

                <h2>Meet the Speakers </h2>
                You will hear from these global leaders and industry experts about the importance of taking urgent action now to reduce methane emissions.
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
                <h2>Speakers</h2>
                <p>Speaker biographies will be posted here as details are confirmed.</p>
                <p>
                    <img id="OlgaAlgayerova" src="assets/algayerovabanner.png" style="width: 100%"
                        alt="Headshot of Olga Algayerova, Executive Secretary, United Nations Economic Commission for Europe" />
                </p>
                <div class="detailspara" id="algayerovaText">
                    <p>
                        On 13 April 2017, the Secretary-General appointed Ms Olga Algayerova of Slovakia as the next Executive Secretary of the UNECE. She took office on 1 June 2017.
                    </p>
                    <p>Ms. Algayerova brings to the position a combination of leadership and diplomatic skills with deep knowledge of the region with its challenges and opportunities and a strong focus on building and nurturing partnerships among key stakeholders with the United Nations.</p>
                    <p>Prior to her appointment, she served as Permanent Representative of Slovakia to the International Organizations in Vienna, Austria (since 2012). She was previously President, Slovak Millennium Development Goals (2010-2012); State Secretary, Ministry of Foreign Affairs (2006-2010) and Corporate Export Manager, Zentiva International, a.s. (2004-2006).</p>
                    <p>Born in 1959, Ms. Algayerova holds a Master in Contemporary Diplomacy from Malta University, a Master in Business Administration from The Open University Business School, United Kingdom and a Dipl. in Engineer of Economy from the University of Economics Business Faculty, Bratislava.</p>
                    <p>On 12 July 2017, Ms. Olga Algayerova was sworn-in by the Secretary-General of the United Nations, Mr. António Guterres.</p>
                </div>
                 <a class="morelessbtn" id="togglealgayerova">Read More</a>
                <hr />
                <p>
                    <img id="VickiHollub" src="assets/hollubbanner.png" style="width: 100%"
                        alt="Headshot of Vicki Hollub, President and Chief Executive Officer, Occidental Petroleum" />
                </p>
                <div class="detailspara" id="hollubText">
                    <p>Vicki Hollub is President and Chief Executive Officer of Occidental. She has been a member of Occidental’s Board of Directors since 2015.</p>
                    <p>During her 35-year career with Occidental, Ms. Hollub has held a variety of management and technical positions with responsibilities on three continents, including roles in the United States, Russia, Venezuela and Ecuador. Most recently, she served as Occidental’s President and Chief Operating Officer, overseeing the company’s oil and gas, chemical and midstream operations.</p>
                    <p>Ms. Hollub previously was Senior Executive Vice President, Occidental, and President, Oxy Oil and Gas, where she was responsible for operations in the U.S., the Middle East region and Latin America. Prior to that, she held a variety of leadership positions, including Executive Vice President, Occidental, and President, Oxy Oil and Gas, Americas; Vice President, Occidental, and Executive Vice President, U.S. Operations, Oxy Oil and Gas; Executive Vice President, California Operations; and President and General Manager of the company’s Permian Basin operations. Ms. Hollub started her career at Cities Service, which was acquired by Occidental.</p>
                    <p>Ms. Hollub serves on the boards of the American Petroleum Institute and Lockheed Martin. She is the chair of the U.S. Secretary of Energy Advisory Board and the U.S. chair for the U.S.-Colombia Business Council. Ms. Hollub is also a member of the Oil and Gas Climate Initiative and the World Economic Forum, where she serves on the stewardship board for the Platform for Shaping the Future of Energy and Materials. A graduate of the University of Alabama, Ms. Hollub holds a Bachelor of Science in Mineral Engineering. She was inducted into the University of Alabama College of Engineering 2016 class of Distinguished Engineering Fellows.</p>
                </div>
                <a class="morelessbtn" id="togglehollub">Read More</a>
                <hr />
                <p>
                    <img id="FredKrupp" src="assets/kruppbanner.png" style="width: 100%"
                        alt="Headshot of Fred Krupp, President, Environmental Defense Fund" />
                </p>
                <div class="detailspara" id="kruppText">
                    <p>
                        Environmental Defense Fund president Fred Krupp has guided EDF for three decades, overseeing its
                        growth from a small nonprofit to one of the world’s most influential environmental
                        organizations, with more than 750 employees in the United States, China, Mexico and Europe and
                        an annual budget of more than $200 million.
                    </p>



                    <p>
                        As a leading voice on climate change, energy and corporate sustainability, Krupp appeared on the
                        TED stage in 2018 to announce plans to launch MethaneSAT, a satellite that will measure and map
                        planet-warming methane emissions from the oil and gas industry worldwide. In 2016, he played a
                        role in the adoption of the first major bipartisan environmental legislation in two decades, the
                        Lautenberg Chemical Safety Act, by a House vote of 203-12 and a voice vote in the Senate.
                    </p>



                    <p>
                        Krupp has pioneered innovative approaches to harnessing the power of the marketplace to protect
                        the environment and has led EDF’s groundbreaking corporate partnerships with FedEx, KKR,
                        McDonald’s, Walmart and others. Most recently, he helped GM develop its plan to sell only
                        zero-emission vehicles by 2035.
                    </p>



                    <p>
                        Educated at Yale and the University of Michigan Law School, Krupp appears frequently in the
                        media. He was named one of America’s Best Leaders by U.S. News and World Report and is a
                        recipient of the 2015 William K. Reilly Environmental Leadership Award from the Center for
                        Environmental Policy at American University. Krupp is co-author with Miriam Horn of the <em>New
                            York Times</em> bestseller <em>Earth: The Sequel – The Race to Reinvent Energy and Stop
                            Global Warming</em>.
                    </p>
                </div>
                <a class="morelessbtn" id="togglekrupp">Read More</a>
                <hr />
                <p>
                    <img id="DavidNewman" src="assets/newmanbanner.png" style="width: 100%"
                        alt="Headshot of David Newman, President, World Biogas Association" />
                </p>
                <div class="detailspara" id="newmanText">
                    <p>David Newman lived in Europe and the Middle East until 2016 when he returned to the UK. </p>
                    <p>
                        He was the Executive Director of Greenpeace Italy 1994-1997 after many years as a volunteer; from
                        1999 until 2014 he led the Italian composting and biogas association CIC and he led the Italian
                        Bioplastics Association from 2011 to 2015.
                    </p>
                    <p>
                        From 2012 to 2016 he was President of the International Solid Waste Association. During this time
                    (2012-13) he was personal advisor to the Italian Minister of Environment, Andrea Orlando.
                    </p>
                    <p>
                        David founded and leads the Bio Based and Biodegradable Industries Association UK since 2015 as well
                    as the European Circular Bioeconomy Policy Initiative; both work in the UK and EU to promote the
                    bioeconomy.
                    </p>
                    <p>He is President of the World Biogas Association since November 2016.</p>
                    <p>
                        He is a member of the Resources and Waste Stakeholder Advisory Group at DEFRA and a chartered member
                    of the CIWM.
                    </p>
                    <p>
                        His e-book "<em>Everything is Connected, understanding a complicated world</em>" was published in September
                    2020.
                    </p>
                </div>
                <a class="morelessbtn" id="togglenewman">Read More</a>
                <hr />
                <p>
                    <img id="HelenRyan" src="assets/ryanbanner.png" style="width: 100%"
                        alt="Headshot of Helen Ryan, Associate Assistant Deputy Minister of the Environmental Protection Branch, Environment and Climate Change Canada" />
                </p>
                <div class="detailspara" id="ryanText">
                    <p>
                        Helen Ryan is the Associate Assistant Deputy Minister of the Environmental Protection Branch
                        within Environment and Climate Change Canada. She is responsible for leading the development
                        and implementation of the Department’s clean air regulatory agenda, GHG regulations,
                        environmental emergencies, contaminated sites and disposal at sea, waste disposal and
                        management, as well as the plastics agenda.
                    </p>
                    <p>
                        Prior to Helen’s appointment in September 2018, she was the Director General of Environment
                        and Climate Change Canada’s Energy and Transportation Directorate heading the development
                        and implementation of regulations and standards to reduce air pollutants and greenhouse gas
                        emissions from the transportation, oil and gas, and electricity sectors. She has over thirty
                        years of
                        experience in the public service at the federal, provincial and municipal levels, including 17
                        years as a federal executive in ECCC and Health Canada.
                    </p>
                    <p>
                        Helen and her partner have five children. She is an avid cyclist, cross-country skier and enjoys
                        time spent in the outdoors.
                    </p>
                </div>
                <a class="morelessbtn" id="toggleryan">Read More</a>
                <hr />
                <p>
                    <img id="DrewShindell" src="assets/shindellbanner.png" style="width: 100%"
                        alt="Drew Shindell, Chair, Scientific Advisory Panel of the Climate & Clean Air Coalition and Professor of Climate Sciences, Duke University" />
                </p>
                <div class="detailspara" id="shindellText">
                    <p>
                        Dr. Drew Shindell is Nicholas Professor of Earth Sciences at Duke University. From 1995 to 2014
                        he was at the NASA Goddard Institute for Space Studies in New York. His research group is
                        particularly focused on quantifying the impacts on human health, agricultural yields, climate
                        and the economy of policies that might be put into place to mitigate climate change or improve
                        air quality. He has been an author on >275 peer-reviewed publications, received awards from
                        Scientific American, NASA, the NSF and the EPA, and is an elected fellow of the American
                        Geophysical Union and American Association for the Advancement of Science. He has testified on
                        climate issues before both houses of Congress (at the request of both parties), developed a
                        climate change course with the American Museum of Natural History, and made numerous media
                        appearances as part of his outreach efforts. He is chair of the Scientific Advisory Panel to the
                        Climate and Clean Air Coalition (CCAC) of nations and organizations. He chaired the 2011
                        Integrated Assessment of Black Carbon and Tropospheric Ozone from UNEP, was a Coordinating Lead
                        Author on the 2013 Fifth Assessment Report of the IPCC and on the 2018 IPCC Special Report on
                        1.5°C and chaired the 2021 Global Methane Assessment: Benefits and Costs of Mitigating Methane
                        Emissions from CCAC/UNEP.
                    </p>
                </div>
                <a class="morelessbtn" id="toggleshindell">Read More</a>
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

    <script>
        $.fn.extend({
            toggleHtml: function (a, b) {
                return this.html(this.html() == b ? a : b);
            }
        });

        if (window.location.hash) {
            var hash_link = location.hash;

            //hash_link will return the id in the URL example: #myid

            if (hash_link == '#DrewShindell') {
                $("#shindellText").toggleClass("heightauto");
                $("#toggleshindell").toggleHtml('Read More', 'Read Less');
            }
            if (hash_link == '#HelenRyan') {
                $("#ryanText").toggleClass("heightauto");
                $("#toggleryan").toggleHtml('Read More', 'Read Less');
            }
            if (hash_link == '#FredKrupp') {
                $("#kruppText").toggleClass("heightauto");
                $("#togglekrupp").toggleHtml('Read More', 'Read Less');
            }
            if (hash_link == '#DavidNewman') {
                $("#newmanText").toggleClass("heightauto");
                $("#togglenewman").toggleHtml('Read More', 'Read Less');
            }
            if (hash_link == '#VickiHollub') {
                $("#hollubText").toggleClass("heightauto");
                $("#togglehollub").toggleHtml('Read More', 'Read Less');
            }
            if (hash_link == '#OlgaAlgayerova') {
                $("#algayerovaText").toggleClass("heightauto");
                $("#togglealgayerova").toggleHtml('Read More', 'Read Less');
            }
        }



        $("#togglekrupp").click(function (e) {
            e.preventDefault();
            $("#kruppText").toggleClass("heightauto");
            $(this).toggleHtml('Read More', 'Read Less')
        });
        $("#toggleryan").click(function (e) {
            e.preventDefault();
            $("#ryanText").toggleClass("heightauto");
            $(this).toggleHtml('Read More', 'Read Less')
        });
        $("#toggleshindell").click(function (e) {
            e.preventDefault();
            $("#shindellText").toggleClass("heightauto");
            $(this).toggleHtml('Read More', 'Read Less')
        });
        $("#togglenewman").click(function (e) {
            e.preventDefault();
            $("#newmanText").toggleClass("heightauto");
            $(this).toggleHtml('Read More', 'Read Less')
        });
        $("#togglehollub").click(function (e) {
            e.preventDefault();
            $("#hollubText").toggleClass("heightauto");
            $(this).toggleHtml('Read More', 'Read Less')
        });
        $("#togglealgayerova").click(function (e) {
            e.preventDefault();
            $("#algayerovaText").toggleClass("heightauto");
            $(this).toggleHtml('Read More', 'Read Less')
        });
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
        function confirmSubmission() {
            Swal.fire({
                title: 'Success!',
                text: 'You have been registered, a link to the event will be emailed to you shortly.',
                icon: 'success',
                confirmButtonText: 'Close'
            })
        }

        function confirmSubmissionAgain() {
            Swal.fire({
                title: 'Success!',
                text: 'It looks like you already registered. We will send a copy of your sign up email shortly.',
                icon: 'success',
                confirmButtonText: 'Close'
            })
        }
    </script>
</body>

</html>
