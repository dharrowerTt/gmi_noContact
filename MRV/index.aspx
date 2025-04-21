<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="index.aspx.vb" Inherits="M2M_Redesign.index10" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>MRV Knowledge Hub | Global Methane Initiative</title>
    <!-- #include virtual="/includes/include_head.html" -->
    <meta name="keywords" content="biogas, measurement, reporting, verification, global, methane, GMI, climate, environment, GHG">
    <meta name="description" content="The Global Methane Initiative seeks to reduce greenhouse gas emissions in the biogas sector through measurement, verification, and reporting.">
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
                    <h1>Measurement, Reporting and Verification (MRV) of Methane</h1>
                    <p>A hub of knowledge and tools to support the MRV of methane emissions and emissions reductions.</p>
                </div>
            </div>
        </div>
    </section>

    <section class="py-5 bg-white">
        <div class="container">

            <div class="row" id="part1">
                <div class="col-sm-12">
                    <div class="MRVOnThisPage">
                        <div class="row">
                            <div class="col-sm-6">

                                <h4>On this page:</h4>
                                <ul>
                                    <li><a href="#part2">What is MRV?</a></li>
                                    <li><a href="#part4">When to use MRV Frameworks</a></li>
                                    <li><a href="#part5">Why MRV of Methane Matters</a></li>
                                    <li><a href="#part6">Best Practices and Resources</a></li>
                                </ul>

                            </div>
                            <div class="col-sm-6">

                                <h4>Visit MRV guidance by sector:</h4>
                                <ul>
                                    <li><a href="biogas-sector.aspx">Biogas Sector (Municipal Solid Waste, Agriculture, Municipal Wastewater)</a> </li>
                                    <li><a href="oilgas-sector.aspx">Oil & Gas Sector</a></li>
                                    <li><a href="coal-sector.aspx">Coal Mines Sector</a></li>

                                </ul>

                            </div>
                        </div>
                    </div>

                </div>
            </div>

            <div class="row" id="part2">
                <div class="col-sm-12">
                    <h2>What is MRV?</h2>
                    MRV frameworks offer systematic approaches to accounting for emissions and emissions reductions. MRV is an ongoing process that is repeated throughout the life of a project—often annually. The three components of an effective MRV framework include: 
                </div>
            </div>

            <div class="row" id="part3">
                <div class="col-md-8">
                    <ul class="MRVList">
                        <li><strong><span style="font-size: 22px; margin-left: 10px;">Measurement</span></strong>
                            <br />
                            Measurement is the tracking and documentation of data and information on GHG emissions or emissions reductions.
                            <br />
                            <br />
                        </li>
                        <li><strong><span style="font-size: 22px; margin-left: 10px;">Reporting </strong>
                            <br />
                            Reporting entails the dissemination of measured GHG emissions and emissions reduction data and information using standardized methods and formats.
                            <br />
                            <br />
                        </li>
                        <li><strong><span style="font-size: 22px; margin-left: 10px;">Verification</span> </strong>
                            <br />
                            Verification is an independent assessment of reported GHG emissions and emissions reductions. It is typically undertaken by an independent, third-party verification body to ensure impartial assessment.
                            <br />
                            <br />
                        </li>
                    </ul>

                </div>
                <div class="col-md-4">
                    <img src="MRV-gx.svg" />
                </div>
            </div>

            <div class="row" id="part4">
                <div class="col-sm-12">


                    <h2>When To Use MRV Frameworks </h2>

                    <p>
                        MRV can be used for multiple purposes. The nature of the MRV activities differs depending on the context. This MRV Knowledge Hub provides information on two main types of MRV: 

                        <ul class="MRVWhenList">
                            <li><strong><span style="font-size: 22px; margin-left: 10px;">MRV of methane emissions </span></strong>
                                <br />
                                MRV of emissions seeks to understand emissions of an entity over time. It is generally performed at a national, organization, or facility level.
                                <br />
                                <br />
                            </li>
                            <li><strong><span style="font-size: 22px; margin-left: 10px;">MRV of methane mitigation actions or emissions reductions  </span></strong>
                                <br />
                                MRV of mitigation actions or emission reductions seeks to understand the change in emissions resulting from a project or policy. 
                                <br />
                                <br />
                            </li>
                        </ul>
                </div>
            </div>

            <div class="row" id="part5">
                <div class="col-sm-12">
                    <h2>Why MRV of Methane Matters</h2>
                    <p>MRV of emissions seeks to understand emissions of an entity over time. It is generally performed at a national, organization, or facility level. </p>
                    <style>
                        .list-wrapper {
                            position: relative;
                        }

                        .list-item-wrapper {
                            margin-top: 10px;
                            position: relative;
                        }

                        .list-bullet {
                            float: left;
                            position: absolute;
                            margin-right: 20px;
                            background: #129d94;
                            height: 30px;
                            width: 30px;
                            z-index: 6;
                            line-height: 30px;
                            border-radius: 100px;
                            font-weight: 700;
                            color: white;
                            text-align: center;
                        }

                        .list-item {
                            position: relative;
                            display: table-row;
                            vertical-align: middle;
                            left: 40px;
                        }

                        .list-title {
                            font-weight: 700;
                        }

                        .list-text {
                            font-weight: 400;
                        }

                        .red-line {
                            background: #dbf0ef;
                            z-index: 4;
                            width: 8px;
                            height: 100%;
                            position: absolute;
                            left: 10px;
                        }

                        .white-line {
                            background: #FFF;
                            bottom: 0px;
                            z-index: 5;
                            width: 8px;
                            height: 100%;
                            position: absolute;
                            left: 10px;
                        }
                    </style>
                    <div class="list-wrapper">

                        <div class="red-line"></div>
                        <script src="https://kit.fontawesome.com/fd4c65d2f4.js"></script>
                        <div class="list-item-wrapper">
                            <div class="list-bullet"><i class="fas fa-angle-right fa-2x" style="margin-left: 5px;"></i></div>
                            <div class="list-item">
                                <div class="list-title">Supporting the development of robust emissions inventories </div>
                                <div class="list-text">National inventories that use Tier 1 approaches (i.e., based on default values) for one or more categories to estimate emissions can have high levels of uncertainty. These inventories can be made more robust by incorporating bottom-up, location-specific data collected through MRV activities. </div>
                            </div>
                        </div>

                        <div class="list-item-wrapper">
                            <div class="list-bullet"><i class="fas fa-angle-right fa-2x" style="margin-left: 5px;"></i></div>
                            <div class="list-item">
                                <div class="list-title">Enhancing targets, policies, and actions in Nationally Determined Contributions (NDCs) </div>
                                <div class="list-text">
                                    <p>Some countries have included specific methane emissions reduction targets in their national goals, including their NDCs to the Paris Agreement. Methane emissions reductions are often overlooked in these documents; countries typically focus on the largest carbon dioxide emissions source sectors such as energy and transportation.  </p>
                                    <p>
                                        However, methane emissions reductions can contribute substantially to national emissions reductions targets. Robust methane MRV activities can help demonstrate that a country has met NDC targets.   

                                    </p>
                                </div>
                            </div>
                        </div>

                        <div class="list-item-wrapper">
                            <div class="list-bullet"><i class="fas fa-angle-right fa-2x" style="margin-left: 5px;"></i></div>
                            <div class="list-item">
                                <div class="list-title">Demonstrating progress toward sustainable development and other national priorities </div>
                                <div class="list-text">Capturing and using methane can generate considerable economic and social benefits beyond climate change mitigation. These benefits can be tied to United Nations’ Sustainable Development Goals, such as goal 7 on affordable and clean energy and goal 11 on sustainable cities and communities. MRV can provide data to track and demonstrate progress toward these goals. </div>
                            </div>

                        </div>

                        <div class="list-item-wrapper">
                            <div class="list-bullet"><i class="fas fa-angle-right fa-2x" style="margin-left: 5px;"></i></div>
                            <div class="list-item">
                                <div class="list-title">Increasing access to external funding sources to promote economic growth   </div>
                                <div class="list-text">
                                    MRV helps ensure that emissions reductions can be quantified, thus enabling project developers to better demonstrate to financiers and funders the prospective and actual mitigation benefits of their investments. MRV activities are also fundamental to securing funding through carbon markets, whether they are mandatory or voluntary programs. 
                                </div>
                            </div>

                        </div>
                        <div class="list-item-wrapper">
                            <div class="list-bullet"><i class="fas fa-angle-right fa-2x" style="margin-left: 5px;"></i></div>
                            <div class="list-item">
                                <div class="list-title">Robust MRV activities contribute to national-level priorities and objectives   </div>
                                <div class="list-text">
                                </div>
                            </div>
                            <div class="white-line"></div>
                        </div>

                    </div>
                    <img src="MRV-NPL.svg" style="width: 100%; margin-top: 30px; margin-bottom: 60px;" />

                </div>
            </div>

            <div class="row" id="part6">
                <div class="col-sm-12" style="margin-bottom: 20px;">
                    <h2>Best Practices and Resources </h2>
                    Find sector-specific best practices and resources for methane MRV: 
                </div>
            </div>
            <style>
                .MRVIMG {
                    width: 100%;
                    border-radius: 20px;
                    transition: all .2s ease-in-out;
                    filter: grayscale(70%);
                }

                    .MRVIMG:hover {
                        filter: grayscale(0%);
                    }
            </style>
            <div class="row" id="part7">
                <div class="col-sm-4">
                    <a href="biogas-sector.aspx">
                        <img src="biogas.jpg" class="MRVIMG bioHover" /></a>
                </div>
                <div class="col-sm-4">
                    <a href="oilgas-sector.aspx">
                        <img src="oilgas.jpg" class="MRVIMG oilHover" /></a>
                </div>
                <div class="col-sm-4">
                    <a href="coal-sector.aspx">
                        <img src="coal.jpg" class="MRVIMG coalHover" /></a>
                </div>
            </div>


        </div>
    </section>




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
