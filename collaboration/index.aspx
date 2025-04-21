<%@ Page Language="VB" AutoEventWireup="false" Inherits="M2M_Redesign.collaboration_index" Codebehind="index.aspx.vb" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>International Collaboration | Global Methane Initiative</title>
     <!-- #include virtual="/includes/include_head.html" -->
    	<style>
        body {
            background: url("assets/images/paper_fibers.png");
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
		
		


		
    </style>
</head>
<body>
    <!-- #include virtual="/includes/header.html" -->
    <form id="collaboration_index_form" runat="server">
    <div>

    
	<!-- Page Content -->
    <section class="py-5 gmi-light-blue">
        <div class="container">
			<div class="row">
				<div class="col-sm-6">
                    <h1>
                        International Collaboration
                    </h1>
                    <p>
                        Since the GMI was first launched, the global community's interest in addressing methane has grown significantly. The GMI collaborates routinely with other international organizations and initiatives, described below, to create synergies to mitigate methane globally. In particular, the GMI has strategic partnerships with the Climate and Clean Air Coalition (CCAC) and the United Nations Economic Commission for Europe (UNECE).
                    </p>
					<p>Several of these international organizations are participating in the Global Methane Challenge. Explore the stories to the right or visit the <a href="/challenge">Global Methane Challenge</a> website to learn more.</p>
				</div>
				<div class="col-sm-6" style="background-image: linear-gradient(#3F4F87, #1D85B9);">
					<p style="text-align:center;color:white;padding-top:5px;font-weight:bold;">Check out these Global Methane Challenge stories</p>
                            <div class="Countrytab">
                                <button class="Countrytablinks" onclick="openSector(event, 'BiogasTab')" id="defaultOpen">Biogas</button>
                                <button class="Countrytablinks" onclick="openSector(event, 'CoalTab')" id="thirdOpen">Coal</button>
                                <button class="Countrytablinks" onclick="openSector(event, 'OilgasTab')" id="secondOpen">Oil & Gas</button>
                                <button class="Countrytablinks" onclick="openSector(event, 'MultipleTab')" id="firstOpen">Cross-Sector</button>

                            </div>

                            <!-- Tab content -->
                            <div id="BiogasTab" class="Countrytabcontent active" style="display: block;">
                                            <div id="Bslider" class="Bslider">
                                                    <div Class='Bslidediv'><a href='https://globalmethane.org/challenge/ledslac.html'><img src='/assets/images/gmc-thumbs/latinamericacaribbean-BioE-CoP.png' style='float:left;'></a><a href='https://globalmethane.org/challenge/ledslac.html'><h3>Latin America and Caribbean BioE-CoP</h3></a><p>The Bioenergy Community of Practice (BioE-CoP) is a peer-to-peer learning network that advances the development of bioenergy to reduce greenhouse gas emissions, increase the use of fossil fuel alternatives, and support sustainable development goals in Latin America and the Caribbean.</p><a style = 'float:right;' Class='btn btn-primary' href='https://globalmethane.org/challenge/ledslac.html'>Read More...</a></div>
                                            </div>
                            </div>

                            <div id="CoalTab" class="Countrytabcontent">
                                			<div id="Cslider" class="Cslider">
													<div Class='Cslidediv'><a href='https://globalmethane.org/challenge/poland.html'><img src='/assets/images/gmc-thumbs/poland-cmm.png' style='float:left;'></a><a href='https://globalmethane.org/challenge/poland.html'><h3>Poland International Centre of Excellence on Coal Mine Methane</h3></a><p>Poland created the International Centre of Excellence on Coal Mine Methane (ICE-CMM) to support the Group of Experts on CMM in its capacity-building activities.</p><a style = 'float:right;' Class='btn btn-primary' href='https://globalmethane.org/challenge/poland.html'>Read More...</a></div>
                               				</div>
                            </div>

                            <div id="OilgasTab" class="Countrytabcontent">
                                            <div id="Ogslider" class="Ogslider">
                                                    <div Class='Ogslidediv'><a href='https://globalmethane.org/challenge/colombia.html'><img src='/assets/images/gmc-thumbs/ecopetrol.png' style='float:left;'></a><a href='https://globalmethane.org/challenge/colombia.html'><h3>Collaborating with Climate and Clean Air Coalition (CCAC) Oil & Gas Methane Partnership (OGMP)</h3></a><p>Ecopetrol is developing an implementation plan to identify and assess methane emissions from core emission sources in their crude production operations.</p><a style = 'float:right;' Class='btn btn-primary' href='https://globalmethane.org/challenge/colombia.html'>Read More...</a></div>
                                                    <div Class='Ogslidediv'><a href='https://globalmethane.org/challenge/gma.html'><img src='/assets/images/gmc-thumbs/unep-gma.png' style='float:left;'></a><a href='https://globalmethane.org/challenge/gma.html'><h3>UNEP & CCAC: Global Methane Alliance (GMA)</h3></a><p>The GMA gathers international organizations, non-governmental organizations, financing institutions, and oil and gas companies to support countries in setting ambitious methane reduction targets for the oil and gas industry.</p><a style = 'float:right;' Class='btn btn-primary' href='https://globalmethane.org/challenge/gma.html'>Read More...</a></div>
                                                    <div Class='Ogslidediv'><a href='https://globalmethane.org/challenge/methanestudies.html'><img src='/assets/images/gmc-thumbs/unep-methane-science-studies.png' style='float:left;'></a><a href='https://globalmethane.org/challenge/methanestudies.html'><h3>UNEP: Methane Science Studies </h3></a><p>The results of ongoing and future methane science studies will improve understanding of methane emissions at a global level, allowing industry, governments, and other stakeholders to prioritize actions to reduce methane emissions.</p><a style = 'float:right;' Class='btn btn-primary' href='https://globalmethane.org/challenge/methanestudies.html'>Read More...</a></div>
                                                    <div Class='Ogslidediv'><a href='https://globalmethane.org/challenge/ogmp.html'><img src='/assets/images/gmc-thumbs/ogmp.png' style='float:left;'></a><a href='https://globalmethane.org/challenge/ogmp.html'><h3>UNEP: Oil and Gas Methane Partnership (OGMP)</h3></a><p>The OGMP provides a protocol to help companies manage their methane emissions from upstream oil and gas operations and offers a credible platform to help member companies demonstrate reductions to industry stakeholders.</p><a style = 'float:right;' Class='btn btn-primary' href='https://globalmethane.org/challenge/ogmp.html'>Read More...</a></div>
                                                    <div Class='Ogslidediv'><a href='https://globalmethane.org/challenge/iea.html'><img src='/assets/images/gmc-thumbs/iea.png' style='float:left;'></a><a href='https://globalmethane.org/challenge/iea.html'><h3>International Energy Agency (IEA)</h3></a><p>IEA is an intergovernmental organization made up of 30 member countries. IEA analyses examining ways to reduce environmental impacts associated with fossil fuels consistently underscore that reducing methane is a powerful and cost-effective way to act.</p><a style = 'float:right;' Class='btn btn-primary' href='https://globalmethane.org/challenge/iea.html'>Read More...</a></div>
                                            </div>
                            </div>

                            <div id="MultipleTab" class="Countrytabcontent">

                                            <div id="Mslider" class="Mslider">
                                                    <div Class='Mslidediv'><a href='https://globalmethane.org/challenge/canada.html#menu4'><img src='/assets/images/gmc-thumbs/canada-international.png' style='float:left;'></a><a href='https://globalmethane.org/challenge/canada.html#menu4'><h3>International Collaboration to Address Methane Emissions</h3></a><p>Environment and Climate Change Canada is working to establish collaborative relationships with several international partners, including Vietnam, Senegal, Côte d’Ivoire, Chile, China, and Mexico. </p><a style = 'float:right;' Class='btn btn-primary' href='https://globalmethane.org/challenge/canada.html#menu4'>Read More...</a></div>
                                            </div>

                            </div>
				
				
				
				
				
				</div>
			</div>
		</div>
	</section>
	<section class="py-5 bg-white">
        <div class="container">
			<div class="row">
				<div class="col-sm-3">
					<img src="/assets/images/alliances/ccac.png" style="max-width:80%;" />
				</div>
				<div class="col-sm-9">
					<!--<p class="alliance">GMI Strategic Alliance</p>-->
					<a href="http://www.ccacoalition.org/" target="_blank"><h2>Climate and Clean Air Coalition (CCAC)</h2></a>
                	<p>CCAC is a voluntary partnership dedicated to reducing short-lived climate pollutants. CCAC Partners work on-the-ground to reduce methane from municipal solid waste in cities all over the world. They cooperate with the private sector to address methane from upstream oil and gas operations and help farmers to address agricultural emissions. </p>
                          <ul class="list-group">

                              <li class="list-group-item noborder nobackground"><a href="https://www.ccacoalition.org/en/initiatives/agriculture" target="_blank">Agriculture Initiative</a> <br />
                          Through the Agriculture Initiative, CCAC assists countries with tools, capacity-building, and financing evidence in order to advance policies and activities that mitigate the effects of short-lived climate pollutants, including methane, on agriculture, land use, and food systems.  </li>

                              <li class="list-group-item noborder nobackground"><a href="https://www.ccacoalition.org/en/activity/ccac-oil-gas-methane-partnership" target="_blank">CCAC Oil and Gas Methane Partnership (OGMP)</a><br />
                          The OGMP was formed in 2015 as a voluntary initiative to enhance peer-to-peer cooperation on oil and gas, the largest industrial source of methane globally. In January 2020, OGMP members adopted a new reporting framework focused on reduction approaches, technology advancement, and policy development.</li>

                              <li class="list-group-item noborder nobackground"><a href="https://www.ccacoalition.org/en/activity/global-alliance-significantly-reduce-methane-emissions-oil-and-gas-sector-2030" target="_blank">Global Methane Alliance</a><br />
                          The Global Methane Alliance was initiated in 2019 by CCAC and the United Nations Environment Programme (UNEP) to support ambitious methane reduction targets from the oil and gas industry. Participating organizations support countries pursuing these targets through technical assistance, policy support, and sharing of knowledge, technologies, and best management practices.</li>

                              <li class="list-group-item noborder nobackground"><a href="https://www.ccacoalition.org/en/initiatives/waste" target="_blank">Municipal Solid Waste (MSW) Initiative</a><br />
                          Under this initiative, CCAC provides technical assistance and supports information exchange, training, and capacity building to reduce methane emissions by diverting organic waste from landfills and decrease black carbon emissions by preventing the open burning of waste.</li>

                          </ul>
				</div>
			</div>
		</div>
	</section>
	<section class="py-5">
        <div class="container">
			<div class="row">
				<div class="col-sm-3">
					<img src="/assets/images/alliances/unece.png" style="max-width:80%;" />
				</div>
				<div class="col-sm-9">
					<!--<p class="alliance">GMI Strategic Alliance</p>-->
					<a href="http://www.unece.org/" target="_blank"><h2>United Nations Economic Commission for Europe (UNECE)</h2></a>
                	<p>UNECE, one of five regional commissions of the United Nations, helps countries meet sustainable development goals. Through these groups, UNECE develops and disseminates best practice guidance and brings together stakeholders and experts in the coal mining and oil and gas sectors.</p>
                <ul class="list-group">
					<li class="list-group-item noborder nobackground"><a href="https://www.unece.org/energy/se/cmm.html" target="_blank">UNECE Group of Experts on Coal Mine Methane (CMM)</a><br />
                The UNECE’s Committee on Sustainable Energy established the Group of Experts on CMM, which carries out activities related to sustainable development and profitable recovery and use of CMM and abandoned mine methane (AMM). These activities mitigate climate change, improve mine safety and productivity, and generate revenue and cost savings.</li>
                	<li class="list-group-item noborder nobackground"><a href="https://www.unece.org/energy/gas.html" target="_blank">UNECE Group of Experts on Gas</a><br />
                The Group of Experts on Gas promotes the sustainable and clean production, distribution, and consumption of natural gas in the UNECE region.
                    </li></ul>
				</div>
			</div>
		</div>
	</section>
	<section class="py-5 bg-white">
        <div class="container">
			<div class="row">
				<div class="col-sm-3">
					<img src="/assets/images/alliances/iea.jpg" style="max-width:80%;" />
				</div>
				<div class="col-sm-9">
					<a href="https://www.iea.org/" target="_blank"><h2>International Energy Agency</h2></a>
                	<p>The International Energy Agency is an autonomous intergovernmental organization, within the Organisation for Economic Co-operation and Development framework, made up of 30 member countries. IEA conducts methane work as part of a broad organizational mission to shape energy policies for a secure and sustainable future. The IEA’s Methane Tracker uses the latest evidence from the scientific literature and measurement campaigns to analyze needs and opportunities to reduce methane emissions in the oil and gas sector.</p>
				</div>
			</div>
		</div>
	</section>
	<section class="py-5">
        <div class="container">
			<div class="row">
				<div class="col-sm-3">
					<img src="/assets/images/alliances/unep.png" style="max-width:80%;" />
				</div>
				<div class="col-sm-9">
					<a href="http://www.unep.org/" target="_blank"><h2>The United Nations Environment Programme (UNEP)</h2></a>
                	<p>UNEP is the leading global environmental authority that sets the global environmental agenda, promotes the coherent implementation of the environmental dimension of sustainable development within the United Nations system, and serves as an authoritative advocate for the global environment.  Since 2014, the UNEP-hosted Climate and Clean Air Coalition (CCAC) has worked with a variety of governments, non-governmental organizations, and international oil and gas companies to reduce methane emissions from the oil and gas sector.</p>
				</div>
			</div>
		</div>
	</section>
	<section class="py-5 bg-white">
        <div class="container">
			<div class="row">
				<div class="col-sm-3">
					<img src="/assets/images/alliances/wb.jpg" style="max-width:80%;" />
				</div>
				<div class="col-sm-9">
					<a href="http://www.worldbank.org/en/topic/climatechange" target="_blank"><h2>The World Bank’s Climate Change Group</h2></a>
                	<p>The World Bank works in every major area of development. In the area of climate change, the World Bank helps countries by providing a wide array of financial products and technical assistance for infrastructure projects and efforts to shift to low-carbon economies.</p>
                <a href="http://www.worldbank.org/en/programs/gasflaringreduction" target="_blank"><h2>The World Bank’s Global Gas Flaring Reduction Initiative (GGFR)</h2></a>
                	<p>The GGFR is a public-private initiative comprising international and national oil companies, national and regional governments, and international institutions that works to increase use of natural gas associated with oil production. Specifically, the GGFR addresses technical and regulatory barriers to flaring reduction, conducts research, disseminates best practices, and develops country-specific gas flaring reduction programs.</p>
				</div>
			</div>
		</div>
	</section>
	<section class="py-5">
        <div class="container">
			<div class="row">
				<div class="col-sm-3">
					<img src="/assets/images/alliances/gacsa.jpg" style="max-width:80%;" />
				</div>
				<div class="col-sm-9">
					<a href="http://www.fao.org/gacsa/en/" target="_blank"><h2>Global Alliance for Climate-Smart Agriculture (GACSA)</h2></a>
                	<p>GACSA advances the three pillars of climate smart agriculture – productivity, adaptation and mitigation – by providing a platform to share and exchange experiences and knowledge about mitigating the effects of greenhouse gas emissions in the agriculture sector.</p>
				</div>
			</div>
		</div>
	</section>
	<section class="py-5 bg-white">
        <div class="container">
			<div class="row">
				<div class="col-sm-3">
					<img src="/assets/images/alliances/ogci.png" style="max-width:80%;" />
				</div>
				<div class="col-sm-9">
					<a href="https://oilandgasclimateinitiative.com/" target="_blank"><h2>Oil and Gas Climate Initiative (OGCI)</h2></a>
                	<p>OGCI is a chief executive officer (CEO)-led consortium that aims to accelerate the industry response to climate change. Reducing member companies’ methane emissions to near zero is a top priority for OGCI.</p>
				</div>
			</div>
		</div>
	</section>
        </form>

	
	<button onclick="topFunction()" class="btn btn-dark btn-sm" id="btnToTop" title="Go to top"><i class="fa fa-chevron-up" aria-hidden="true"></i> Top</button>
	
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

	
	
	
	
	
	
	
         <script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
 <script>
     function openSector(evt, cityName) {
         event.preventDefault();
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


  


            if ($('.Bslidediv').length == 0) {
                document.getElementById("Bslider").innerHTML += ("<div class='SlideNone'>Do you have a story about how you are reducing methane emissions in the Biogas sector?  <a href='../challenge/submission'>Submit your story today</a> to the Global Methane Challenge.<br><br>For more information, visit the <a href='../challenge/redesign.html'>Global Methane Challenge</a> website.</div>");
            }
            if ($('.Cslidediv').length == 0) {
                document.getElementById("Cslider").innerHTML += ("<div class='SlideNone'>Do you have a story about how you are reducing methane emissions in the Coal Mines sector?  <a href='../challenge/submission'>Submit your story today</a> to the Global Methane Challenge.<br><br>For more information, visit the <a href='../challenge/redesign.html'>Global Methane Challenge</a> website.</div>");
            }
            if ($('.Ogslidediv').length == 0) {
                document.getElementById("Ogslider").innerHTML += ("<div class='SlideNone'>Do you have a story about how you are reducing methane emissions in the Oil & Gas sector?  <a href='../challenge/submission'>Submit your story today</a> to the Global Methane Challenge.<br><br>For more information, visit the <a href='../challenge/redesign.html'>Global Methane Challenge</a> website.</div>");
            }
            if ($('.Mslidediv').length == 0) {
                document.getElementById("Mslider").innerHTML += ("<div class='SlideNone'>Do you have a story about how you are reducing methane emissions for multiple sectors?  <a href='../challenge/submission'>Submit your story today</a> to the Global Methane Challenge.<br><br>For more information, visit the <a href='../challenge/redesign.html'>Global Methane Challenge</a> website.</div>");
            }
        </script>	
	
</body>

</html>