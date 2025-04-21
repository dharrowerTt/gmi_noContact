<%@ Page Language="VB" AutoEventWireup="false" Inherits="M2M_Redesign.partners_detail" CodeBehind="detail.aspx.vb" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
   <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
    <title>Partner Country Details | Global Methane Initiative</title>
    <!-- #include virtual="/includes/include_head.html" -->
  		<style>


		#chartdiv {
            width: 100%;
            height: 400px;
            /*background: rgb(218, 236, 248);*/
			background: white;
            border: 1px solid white;
            margin-top: 15px;

        }

        .BIMGslidediv img, .CIMGslidediv img, .OgIMGslidediv img, .MIMGslidediv img {
            margin: auto;
            width: 200px !important;
        }

        .slick-prev:before {
            color: #;
        }

        .slick-next:before {
            color: #D1812C;
        }

        .Bslider, .Cslider, .Ogslider, .Mslider {
            font-size: 16px;
            color: black;
        }

            .Bslider h3, .Cslider h3, .Ogslider h3, .Mslider h3 {
                font-size: 1em;
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
            /*background-color: #3F4F87;*/
        }

            /* Style the buttons inside the tab */
            .Countrytab a {
                background-color: #31699E;
				color:#D7EFF7!important;
				margin:0px 3px 0px 0px;
                float: left;
                border: none;
                outline: none;
                cursor: pointer;
                padding: 4px 12px;
                transition: 0.3s;
                font-size: 1em;
            }

                /* Change background color of buttons on hover */
                .Countrytab button:hover {
                    background-color: #1D85B9;
                }

                /* Create an active/current tablink class */
                .Countrytab button.active {
                    background-color: #1D85B9;
					color:white;
                }

        /* Style the tab content */
        .Countrytabcontent {
            background: #fff;
			border-top:4px solid #1D85B9;
            display: none;
            padding: 0px;
        }

        .Bslidediv{
            border:0px solid #232323;
            padding:15px;
            background:#fcfcfc;
        }

        .Bslidediv img{
            border: 0px solid #232323;
            margin:0px 25px 25px 0px;
        }

        .Cslidediv{
            border:0px solid #232323;
            padding:15px;
            background:#fcfcfc;
        }

        .Cslidediv img{
            border: 0px solid #232323;
            margin:0px 25px 25px 0px;
        }

        .Ogslidediv{
            border:0px solid #232323;
            padding:15px;
            background:#fcfcfc;
        }

        .SlideNone{
            border:0px solid #232323;
            padding:15px;
            background:#fcfcfc;
                }

        .Bslidediv h3, .Cslidediv h3, .Mslidediv h3, .Ogslidediv h3{
            font-size:1em;
            font-weight: bold;
        }

        .Ogslidediv img{
            border: 0px solid #232323;
            margin:0px 25px 25px 0px;
        }
       .Mslidediv{
            border:0px solid #232323;
            padding:15px;
            background:#fcfcfc;
        }

        .Mslidediv img{
            border: 0px solid #232323;
            margin:0px 25px 25px 0px;
        }

        .tab-content {/*display: none;*/ position:absolute!important; left:-9999px!important;}
.tab-content.current {/*display: inherit;*/ position:relative!important; left:0!important;}

		.alliance {color:#F89737;margin:0px;padding:0px;}

		
.slick-dots li {
        display: inline-block;
    }
.slick-dots li:only-child {
        display: none;
    }
		

		#chartdiv {
            width: 100%;
            height: 400px;
            /*background: rgb(218, 236, 248);*/
			background: white;
            border: 1px solid white;
            margin-top: 15px;

        }

        .BIMGslidediv img, .CIMGslidediv img, .OgIMGslidediv img, .MIMGslidediv img {
            margin: auto;
            width: 200px !important;
        }

        .slick-prev:before {
            color: #;
        }

        .slick-next:before {
            color: #D1812C;
        }

        .Bslider, .Cslider, .Ogslider, .Mslider {
            font-size: 16px;
            color: black;
        }

            .Bslider h3, .Cslider h3, .Ogslider h3, .Mslider h3 {
                font-size: 1em;
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
            /*background-color: #3F4F87;*/
        }

            /* Style the buttons inside the tab */
            .Countrytab button {
                background-color: #31699E;
				color:#D7EFF7;
				margin:0px 3px 0px 0px;
                float: left;
                border: none;
                outline: none;
                cursor: pointer;
                padding: 4px 12px;
                transition: 0.3s;
                font-size: 1em;
            }

                /* Change background color of buttons on hover */
                .Countrytab button:hover {
                    background-color: #1D85B9;
                }

                /* Create an active/current tablink class */
                .Countrytab button.active {
                    background-color: #1D85B9;
					color:white;
                }

        /* Style the tab content */
        .Countrytabcontent {
            background: #fff;
			border-top:4px solid #1D85B9;
            display: none;
            padding: 0px;
        }

        .Bslidediv{
            border:0px solid #232323;
            padding:15px;
            background:#fcfcfc;
        }

        .Bslidediv img{
            border: 0px solid #232323;
            margin:0px 25px 25px 0px;
        }

        .Cslidediv{
            border:0px solid #232323;
            padding:15px;
            background:#fcfcfc;
        }

        .Cslidediv img{
            border: 0px solid #232323;
            margin:0px 25px 25px 0px;
        }

        .Ogslidediv{
            border:0px solid #232323;
            padding:15px;
            background:#fcfcfc;
        }

        .SlideNone{
            border:0px solid #232323;
            padding:15px;
            background:#fcfcfc;
                }

        .Bslidediv h3, .Cslidediv h3, .Mslidediv h3, .Ogslidediv h3{
            font-size:1em;
            font-weight: bold;
        }

        .Ogslidediv img{
            border: 0px solid #232323;
            margin:0px 25px 25px 0px;
        }
       .Mslidediv{
            border:0px solid #232323;
            padding:15px;
            background:#fcfcfc;
        }

        .Mslidediv img{
            border: 0px solid #232323;
            margin:0px 25px 25px 0px;
        }

        .tab-content {/*display: none;*/ position:absolute!important; left:-9999px!important;}
.tab-content.current {/*display: inherit;*/ position:relative!important; left:0!important;}

		.alliance {color:#F89737;margin:0px;padding:0px;}

		
.slick-dots li {
        display: inline-block;
    }
.slick-dots li:only-child {
        display: none;
    }
		
		
.countryBanner{
    background:url();
}

		
    </style>
</head>
<body>

    <script>
        (function () {
            // Helper function to get URL parameters
            function getUrlParameter(name) {
                const urlParams = new URLSearchParams(window.location.search);
                return urlParams.get(name);
            }

            // The URL parameter 'c'
            const paramC = getUrlParameter('c');

            // Define custom redirection rules
            const redirectionMap = {
                "albania": "profile.aspx?c=albania",
                "argentina": "profile.aspx?c=argentina",
                "australia": "profile.aspx?c=australia",
                "brazil": "profile.aspx?c=brazil",
                "bulgaria": "profile.aspx?c=bulgaria",
                "canada": "profile.aspx?c=canada",
                "chile": "profile.aspx?c=chile",
                "china": "profile.aspx?c=china",
                "colombia": "profile.aspx?c=colombia",
                "cotedivoire": "profile.aspx?c=cotedIvoire",
                "denmark": "profile.aspx?c=denmark",
                "dom_rep": "profile.aspx?c=dominicanrepublic",
                "ecuador": "profile.aspx?c=ecuador",
                "ethiopia": "profile.aspx?c=ethiopia",
                "finland": "profile.aspx?c=finland",
                "georgia": "profile.aspx?c=georgia",
                "germany": "profile.aspx?c=germany",
                "ghana": "profile.aspx?c=ghana",
                "india": "profile.aspx?c=india",
                "indonesia": "profile.aspx?c=indonesia",
                "israel": "profile.aspx?c=israel",
                "italy": "profile.aspx?c=italy",
                "japan": "profile.aspx?c=japan",
                "jordan": "profile.aspx?c=jordan",
                "kazakhstan": "profile.aspx?c=kazakhstan",
                "madagascar": "profile.aspx?c=madagascar",
                "mexico": "profile.aspx?c=mexico",
                "mongolia": "profile.aspx?c=mongolia",
                "montenegro": "profile.aspx?c=montenegro",
                "nicaragua": "profile.aspx?c=nicaragua",
                "nigeria": "profile.aspx?c=nigeria",
                "norway": "profile.aspx?c=norway",
                "pakistan": "profile.aspx?c=pakistan",
                "peru": "profile.aspx?c=peru",
                "philippines": "profile.aspx?c=philippines",
                "poland": "profile.aspx?c=poland",
                "korea": "profile.aspx?c=republicofkorea",
                "macedonia": "profile.aspx?c=republicofnorthmacedonia",
                //"russia": "profile.aspx?c=russia",
                "saudiarabia": "profile.aspx?c=saudiarabia",
                "serbia": "profile.aspx?c=serbia",
                "srilanka": "profile.aspx?c=srilanka",
                "thailand": "profile.aspx?c=thailand",
                "turkey": "profile.aspx?c=turkiye",
                "ukraine": "profile.aspx?c=ukraine",
                "uk": "profile.aspx?c=unitedkingdom",
                "us": "profile.aspx?c=unitedstates",
                "vietnam": "profile.aspx?c=vietnam"
            };

            // Define pages where users should stay on the same page
            const stayOnPage = ["russia"];

            // Logic for redirection based on 'c' parameter
            if (paramC) {
                if (stayOnPage.includes(paramC)) {
                    // Do nothing if the user should stay on the page
                    return;
                } else if (redirectionMap[paramC]) {
                    // Show confirmation for specific redirection
                    const targetUrl = redirectionMap[paramC];
                    //const confirmRedirect = confirm(`You will be redirected to: ${targetUrl}. Do you want to continue?`);
                    
                        window.location.href = targetUrl;
                   
                } else {
                    // Default redirect with confirmation
                    const defaultUrl = `/new_page.aspx?c=${paramC}`;
                   // const confirmRedirect = confirm(`You will be redirected to: ${defaultUrl}. Do you want to continue?`);
                                            window.location.href = defaultUrl;
                
                }
            }
        })();

    </script>


    <!-- #include virtual="/includes/header.html" -->
    <form id="partner_detail_form" runat="server">
        
            <!-- Page Content -->
            <section class="py-5 gmi-light-blue" style="background:url('../assets/images/countryBanner/<%= strBanner  %>')no-repeat center center fixed; 
  -webkit-background-size: cover;
  -moz-background-size: cover;
  -o-background-size: cover;
  background-size: cover;">
                <div class="container">
                    
                    <div class="row">
                        <div class="col-sm-12">
                            <p>
                                <a href="index.aspx">
                                    <small class="text-muted text" style="padding:4px;background:#D7EFF7;border-radius:10px;">
                                        <i class="fa fa-arrow-left" aria-hidden="true"></i>
                                        Partner Countries
                                    </small>
                                </a>
                            </p>
                            <h1 style="text-shadow: 1px 1px 2px black;  -webkit-text-fill-color: white; /* Will override color (regardless of order) */
  -webkit-text-stroke-width: 1px;
  -webkit-text-stroke-color: black;display: inline;padding-left:10px;padding-right:10px;">
                                <img src='/assets/images/<%= strCountryFlag  %>' >
                                <%= strCountryName  %>
                            </h1>
                                                        <p style="color:white;text-shadow: 1px 1px 2px black;"><strong>
                                <asp:PlaceHolder ID="datejoined" runat="server" />
                            </strong></p>
                            </div>
                        </div>
                    </div>
                </section>
          <section class="py-5 bg-white">

                <!-- Container (Global Statistics Section) -->
                <div id="matters" class="container">
                                  <div id="alertMessage" class="alert alert-info" role="alert">
<span id="alertText">

            The GMI Secretariat prepared this profile using publicly available information. If you are a delegate and wish to submit edits or additions, please contact the Secretariat at <a href="mailto:secretariat@globalmethane.org">secretariat@globalmethane.org</a>.
</span>
</div>
                    <h2 id="methane-emissions"><%= strCountryName  %> Methane Emissions Summary</h2>





                    <div id="emissions" class="row">
                        <div class="col-md-6">

                            <p>The table and charts provides estimate for projected methane emissions within the industry sectors targeted by GMI (biogas, coal mines, and oil & gas) from 2020-2050. Data are presented in million metric tonnes carbon dioxide equivalent (MMTCO<sub>2</sub>e).</p>
                            <asp:PlaceHolder ID="PlaceHolder1" runat="server" />
                            <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
                            <script type="text/javascript" src="https://www.google.com/jsapi"></script>
                            <script type="text/javascript">
                                google.load("visualization", "1", { packages: ["corechart"] });
                                google.setOnLoadCallback(drawChart);
                                function drawChart() {
                                    var options = {
                                        colors: ['#2e7e56', '#f15c54', '#464379', '#696969'],
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
                                        url: "detail.aspx/GetChartData",
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

                            <p>Source: <a href="https://www.epa.gov/global-mitigation-non-co2-greenhouse-gases">Global Non-CO<sub>2</sub> Greenhouse Gas Emission Projections & Mitigation Potential: 2015-2050</a>, U.S. EPA</p>
                        </div>
                        <div class="col-md-6">
                            <p><a href="../methane-emissions-data.aspx">Explore methane emissions measurements and projections</a> throughout the world in our interactive dashboard.</p>

                            <div id="chart" style="width: 100%;">
                            </div>
                            <a style="float:right; margin:10px;" class="btn btn-primary" href="../methane-emissions-data.aspx" tabindex="0">View Data</a>
                        </div>
                    </div>
                </div>
            </section>

    <section class="py-5">
        <div class="container">
            <div class="col-md-12">
                            <a class="btn btn-sm btn-primary float-right" role="button" href="/delegates/index.aspx?country=<%= objid  %>">View Delegates</a>

                            <h3>GMI Delegates</h3>
                            <asp:Literal ID="delMsg" runat="server" Visible="false"></asp:Literal>
                            <table id="delegatesummary" class="table table-sm">
                                <tbody>
                                    <asp:Repeater ID="lookupRepeater" runat="server" OnItemDataBound="lookupDataBound">
                                        <ItemTemplate>
                                            <asp:Literal ID="litNav" runat="server"></asp:Literal>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                </tbody>
                            </table>
                </div>
            </div>
        </section>


        <section class="py-5 bg-white">
            <div class="container">
                <div class="col-md-12">

                            <h3>GMI Project Sites</h3>
                            <p>
                                The map shows locations where GMI and our Partners have worked to reduce barriers to the recovery and use of methane as a clean energy source. Click on a site to learn more. 
                     The placement of map icons is approximate; the zoom-in feature is limited to avoid misrepresentations.
                            </p>
                        </div>
                        <div class="col-sm-12">
                            <form name="mapform" id="mapform">

                                <div id="map_canvas" style="display:none">
                                    <asp:Literal ID="LitMap" runat="server"></asp:Literal>
                                </div>
                                <br class="clear" style="clear: both;" />

                                <br style="clear: both;" />
                            </form>

                            <p class="py-3 text-center">
                                <img alt="Red Icon" src="/assets/images/Agricultureicon.png" />&nbsp;Agriculture&nbsp;&nbsp;
                                            <img alt="Red Icon" src="/assets/images/Coalicon.png" />&nbsp;Coal Mines&nbsp;&nbsp;
                                            <img alt="Red Icon" src="/assets/images/MSWicon.png" />&nbsp;MSW&nbsp;&nbsp;
                                            <img alt="Red Icon" src="/assets/images/OilGasicon.png" />&nbsp;Oil & Gas&nbsp;&nbsp;
                                            <img alt="Red Icon" src="/assets/images/WasteWatericon.png" />&nbsp;Wastewater
                            </p>



                        </div>
                    </div>
            </section>

      
       

          

    </form>



    <button onclick="topFunction()" class="btn btn-dark btn-sm" id="btnToTop" title="Go to top"><i class="fa fa-chevron-up" aria-hidden="true"></i>Top</button>

 
    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script
  src="https://code.jquery.com/jquery-3.5.1.min.js"
  integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
  crossorigin="anonymous"></script>
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


            
     <!-- #include virtual="/includes/footer.html" -->


</body >

</html>
