<%@ Page Language="VB" AutoEventWireup="false" Inherits="M2M_Redesign.oil_gas_index" Codebehind="index.aspx.vb" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Oil and Gas | Global Methane Initiative</title>
     <!-- #include virtual="/includes/include_head.html" -->
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
		
				

        .gmi-light-orange{
            display:none;
        }

           .detailspara {
            max-height:100px; overflow:hidden;margin-bottom:10px;
			-webkit-mask-image: linear-gradient(to bottom, black 50%, transparent 100%);
    mask-image: linear-gradient(to bottom, black 50%, transparent 100%);
        }
.detailspar p:after {
content: "\f067";


}
    </style>
</head>
<body>
    <!-- #include virtual="/includes/header.html" -->
       <header>
        <div id="headercarouselarea" class="carousel slide carousel-fade" data-ride="carousel">
            <ol class="carousel-indicators">
                <li data-target="#headercarouselarea" data-slide-to="0" class="active"></li>
                <li data-target="#headercarouselarea" data-slide-to="1"></li>
				<li data-target="#headercarouselarea" data-slide-to="2"></li>
                <li data-target="#headercarouselarea" data-slide-to="3"></li>
            </ol>
            <div class="carousel-inner" role="listbox">
                <!-- Slide One - Set the background image for this slide in the line below -->
                <div class="carousel-item active"
                    style="background-image:linear-gradient(to bottom, rgba(255,255,255,0), rgba(0,0,0,.9)), url('assets/images/og-banner-1.png')">
                    <div class="carousel-caption d-none d-md-block">
						<h2 class="display-5" style="color:white;">Action Plan</h2>
                        <p class="lead" style="color:white;">Adopted in April 2018, the Action Plan provides a framework for projects and activities of the Oil & Gas Subcommittee</p>
						<p><a href="//globalmethane.org/documents/OG_Subcommittee_Action_Plan_2018_Final.pdf" class="btn btn-primary btn-sm" role="button">View the Action Plan</a></p>
                    </div>
                </div>
                <!-- Slide Two - Set the background image for this slide in the line below-->
                <div class="carousel-item"
                    style="background-image:linear-gradient(to bottom, rgba(73,211,255,1), rgba(11,24,61,0.9))">
                    <div class="carousel-caption d-none d-md-block">
						<img src="assets/images/iealogo.png" style="max-width:150px;padding:20px;" />
						<h2 class="display-5" style="color:white;">Methane Tracker 2020</h2>
                        <p class="lead" style="color:white;">The International Energy Agency (IEA), which often collaborates with GMI, provides an online tool that tracks oil and gas-related sources of methane</p>
						<p><a href="https://www.iea.org/weo/methane/database/" target="_blank" class="btn btn-primary btn-sm" role="button">View the Methane Tracker</a></p>
                    </div>
                </div>
		 		
                <!-- Slide Three - Set the background image for this slide in the line below-->
                <div class="carousel-item"
                    style="background-image:linear-gradient(to bottom, rgba(255,255,255,0), rgba(255,255,255,0.3), rgba(0,0,0,.3)), url('assets/images/og-banner-best-practice.png')">
                    <div class="carousel-caption d-none d-md-block">
                        <p class="lead" style="color:black;">Featured Resource</p>
						<h3 class="display-6" style="color:black;">Best Practice Guidance for Effective Methane Management in the Oil and Gas Sector: Monitoring,&nbsp;Reporting&nbsp;and&nbsp;Verification (MRV) and Mitigation</h2>
						<p><a href="/resources/details.aspx?resourceid=4996" target="_blank" class="btn btn-primary btn-sm" role="button">View Resource</a></p>
                    </div>
                </div>
                
				<!-- Slide Four - Set the background image for this slide in the line below-->
                <div class="carousel-item"
                    style="background-image:linear-gradient(to bottom, rgba(255,255,255,0.3), rgba(0,0,0,.9)), url('assets/images/og-banner-background-5.png')">
                    <div class="carousel-caption d-none d-md-block">
                        <p class="lead" style="color:white;">Featured Resource</p>
						<h3 style="color:white;">Identifying and Evaluating Opportunities for Greenhouse Gas Mitigation &&nbsp;Operational&nbsp;Efficiency&nbsp;Improvement at Oil and Gas Facilities</h2>
						<p><a href="/resources/details.aspx?resourceid=4925" target="_blank" class="btn btn-primary btn-sm" role="button">View Resource</a></p>
                    </div>
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
    </header>

    <!-- Page Content -->
    <section class="py-5 gmi-light-blue">
        <div class="container">
            
            <div class="row">
                <div class="col-sm-8 vertSplitter">
					<h1>Oil & Gas Sector</h1>
					<p>
                        The GMI Oil & Gas Subcommittee focuses on identifying and deploying practical and cost-effective methane mitigation technologies and practices. The Subcommittee’s objective is to reduce or eliminate emissions from oil and natural gas systems by encouraging collaboration between Partner Countries, Subcommittee members, and Project Network members. Through engagement, the Subcommittee aims to build capacity, develop strategies and markets, and remove technical and nontechnical barriers to methane mitigation project development. Ultimately, this support can increase environmental quality, improve operational efficiency, and strengthen the economy from additional methane brought to market.
                    </p>
                </div>
                <div class="col-sm-4">
					<div class="border border-secondary bg-white px-0">
						<div class="py-1 text-center bg-dark text-white"><strong>On this page</strong></div>
                                <ul class="list-group py-2">
                                    
                                    <li class="list-group-item noborder nobackground py-1"><a href="#resources">Recent Resources</a></li>
                                    <li class="list-group-item noborder nobackground py-1"><a href="#challenge">Global Methane Challenge Stories</a></li>
                                    <li id="phupcomingevents" runat="server" visible="false" class="list-group-item noborder nobackground py-1"><a href="#upcomingevents">Upcoming Events</a></li>
                                    <li class="list-group-item noborder nobackground py-1"><a href="#recentevents">Recent Events</a></li>
                                    <li class="list-group-item noborder nobackground py-1"><a href="#subcommittee">Oil & Gas Subcommittee</a></li>
                                    <li class="list-group-item noborder nobackground py-1"><a href="#connect">Connect, Contribute, and Stay in Touch</a></li>
                                </ul>
					</div>
                </div>
            </div>
        </div>
    </section>



	<section class="py-5 bg-white">
		<div class="container">
			<h2 id="resources">Recent Resources</h2>
				  <p>For a complete list of available oil & gas resources, including technical documents, presentations, and tools, please visit the resources page. </p>
				  <p><a href="../resources/index.aspx?sector=Oil%20&%20Gas" role="button" class="btn btn-outline-primary">View all Oil & Gas resources</a></p>
				  <div class="row py-2">
  				  	<div class="row py-2">
                        <div class="col-sm-2">
                            <img style='width:100%;' src = '//globalmethane.org/images/4925.jpg' />
						</div>
                        <div class="col-sm-10">
                            <div class="float-right"><i class="fa fa-file fa-2x"></i></div>
							<h4><a href='../resources/details.aspx?resourceid=4925'>
								Identifying and Evaluating Opportunities for Greenhouse Gas Mitigation & Operational Efficiency Improvement at Oil and Gas Facilities (2020)</a>
							</h4>
							<p>This document presents introductory guidance on a pragmatic, integrated approach to identifying, evaluating, and advancing cost-effective, high-impact opportunities to manage greenhouse gas (GHG) emissions and energy use at oil and natural gas facilities. The focus is primarily on key sources of short-lived climate pollutants (SLCP).
							The primary audience for this document includes company managers, facility operators, and relevant service providers outside of North America (particularly where other regulatory guidance for GHG reductions and energy management may not be available).</p>
							<p><a href="https://globalmethane.org/documents/Identifying_and_Evaluating_Opportunities_for_Greenhouse_Gas_Mitigation_Operational_Efficiency_Improvement_at_Oil_and_Gas_Facilities_2020_English.pdf" role="button" class="btn btn-outline-secondary">View Resource</a></p>

						</div>
                    </div>
                  </div>
			
				  <div class="row py-2">
  				  	<div class="row py-2">
                        <div class="col-sm-2">
                            <img style='width:100%;' src = 'https://globalmethane.org/images/doc_thumbs/jpeg/Best%20Practices%20Cover.JPG' />
						</div>
                        <div class="col-sm-10">
                            <div class="float-right"><i class="fa fa-file fa-2x"></i></div>
							<h4><a href='../resources/details.aspx?resourceid=4996'>
								Best Practice Guidance for Effective Methane Management in the Oil and Gas Sector: Monitoring, Reporting and Verification (MRV) and Mitigation (2019)</a>
							</h4>
							<p>This document is intended to be a resource for facility owners, operators and government policymakers. The purpose of this document is to provide information about cost-effective measures for detecting and mitigating methane emissions along the full oil and gas value chain at the company- and national-level. Guidance for developing and implementing practices for monitoring, reporting and verifying (MRV) methane emissions is also provided.</p>
							<p><a href="../resources/details.aspx?resourceid=4996" role="button" class="btn btn-outline-secondary">View More Details</a></p>

						</div>
                    </div>
                  </div>
				  
<!--
				  
				<div class="float-right"><i class="fa fa-film fa-2x"></i></div>
				<h4 id="videos">Videos of Methane Leaks</h4>
				<p>These short videos show methane emissions from oil and gas facilities using thermal imaging.</p>
				  <div class="row py-2">
                        <div class="col-sm-3">
                            <a href='//globalmethane.org/sectorContent/GasSTAR-Fugitive_Emissions_from_Various_Sources.mp4' target='_blank'>
								<img src='//globalmethane.org/vidimg/1.png' width='100%'></a>
                            Fugitive Emissions from Various Sources
							
						</div>
                        <div class="col-sm-3">
                            <a href='//globalmethane.org/sectorContent/GasSTAR-Condensate_Storage_Tank_Emissions.mp4.mp4' target='_blank'>
								<img src='//globalmethane.org/vidimg/2.png' width='100%'></a>
                            Condensate Storage Tank Emissions
							
						</div>
                        <div class="col-sm-3">
                            <a href='//globalmethane.org/sectorContent/GasSTAR-Centrifugal_Compressor_Wet_Seal_Vent.mp4.mp4' target='_blank'>
								<img src='//globalmethane.org/vidimg/3.png' width='100%'></a>
                            Centrifugal Compressor Wet Seal Vent
							
						</div>
                        <div class="col-sm-3">
                            <a href='//globalmethane.org/sectorContent/GasSTAR-Valve_Emissions.mp4.mp4' target='_blank'>
								<img src='//globalmethane.org/vidimg/4.png' width='100%'></a>
                            Valve Emissions
							
						</div>
                  </div>
			<p>&nbsp;</p>
			<p>These videos offer more in-depth results of emissions mapping done at oil and gas facilities, providing a range of examples showing methane emissions leaks captured with thermal cameras.</p>
				  <div class="row py-2">
                        <div class="col-sm-6">
                            <a href='//globalmethane.org/sectorContent/Hazira_Emissions_Mapping_Video.mp4.mp4' target='_blank'>
								<img src='//globalmethane.org/vidimg/5.png' width='100%'></a>
                            Hazira Emissions Mapping
						
						</div>
                        <div class="col-sm-6">
                            <a href='//globalmethane.org/sectorContent/ONGC_Normal-IR_Comparison.mp4.mp4' target='_blank'>
								<img src='//globalmethane.org/vidimg/6.png' width='100%'></a>
                            ONGC Normal IR Comparison
							
						</div>
                  </div>
-->

		</div>
	</section>




	<section class="py-5">
		<div class="container">
			<h2 id="challenge">Tell Us Your Story</h2>
			<div class="row">
                <div class="col-sm-7 vertSplitter">
					<p><a href="//globalmethane.org/challenge" target="_blank"><img src="../challenge/images/gmclogo.svg" style="max-width:350px;" /></a></p>
					<p>Learn how you can showcase your efforts to reduce methane emissions in the oil & gas sector through the <a href="//globalmethane.org/challenge" target="_blank">Global Methane Challenge</a>.</p>
				</div>
				<div class="col-sm-5 vertSplitter">


						<div style="background-image: linear-gradient(#3F4F87, #1D85B9);">
					        <div class="Countrytab">
                                <button class="" onclick="openSector(event, 'OilgasTab')" id="defaultOpen">Selected Oil & Gas Stories</button>
								<a style="float:right;color:white;padding:3px 10px;" href="//globalmethane.org/challenge/showcase.html">View all</a>
                            </div>

                            <!-- Tab content -->
                            <div id="OilgasTab" class="Countrytabcontent">
                                <div id="Ogslider" class="Ogslider">

									<div Class='Ogslidediv'>
										<a href='https://globalmethane.org/challenge/mexico.html'>
											<img src='/images/gmc-thumbs/mexico.png' style='float:left;'></a>
										<a href='https://globalmethane.org/challenge/mexico.html'>
											<p>In November 2018, Mexico put into effect the regulation “Guidelines for the Prevention and Integral Control of Methane Emissions from the Hydrocarbon Sector” to significantly reduce methane emissions.
											</p>
										</a>
									</div>
									<div Class='Ogslidediv'>
										<a href='https://globalmethane.org/challenge/gie.html'>
											<img src='/images/gmc-thumbs/gie.png' style='float:left;'></a>
										<a href='https://globalmethane.org/challenge/gie.html'>
											<p>Belgium-based Gas Infrastructure Europe (GIE) and MARCOGAZ published an industry-wide study, “Potential ways the gas industry can contribute to the reduction of methane emissions” that provides an overview of methane emissions and actions taken.
											</p>
										</a>
									</div>
									<div Class='Ogslidediv'>
										<a href='https://globalmethane.org/challenge/canada.html#menu1'>
											<img src='/images/gmc-thumbs/canada-og-reg.png' style='float:left;'></a>
										<a href='https://globalmethane.org/challenge/canada.html#menu1'>
											<p>Canada’s regulations that restrict methane emissions from upstream activities (exploration, drilling, production, processing and transmission) will result in reductions of 20 megatonnes of CO<sub>2</sub>e by 2035.
											</p>
										</a>
									</div>
									<div Class='Ogslidediv'>
										<a href='https://globalmethane.org/challenge/colombia.html'>
											<img src='/images/gmc-thumbs/ecopetrol.png' style='float:left;'></a>
										<a href='https://globalmethane.org/challenge/colombia.html'>
											<p>Ecopetrol is developing an implementation plan to identify and assess methane emissions from core emission sources in their crude production operations.
											</p>
										</a>
									</div>
									<div Class='Ogslidediv'>
										<a href='https://globalmethane.org/challenge/qlm.html'>
											<img src='/images/gmc-thumbs/qlm.png' style='float:left;'></a>
										<a href='https://globalmethane.org/challenge/qlm.html'>
											<p>QLM's compact, high-sensitivity, low-power Tuneable Diode Lidar (TDLidar) gas detection and imaging systems are expected to help reduce methane emissions by approximately 100 MtCO<sub>2</sub>e/year.
											</p>
										</a>
									</div>
									<div Class='Ogslidediv'>
										<a href='https://globalmethane.org/challenge/aie.html'>
											<img src='/images/gmc-thumbs/aie2.png' style='float:left;'></a>
										<a href='https://globalmethane.org/challenge/aie.html'>
											<p>AIE conducts desktop screening of facilities to identify areas with significant methane emissions, then creates inspection plans that use optimized infrared (IR) imaging to validate leaks. Once leaks are validated, AIE develops and implements action plans.
											</p>
										</a>
									</div>

								
								</div>
                            </div>
				
						</div>					
					

				</div>
			</div>
		</div>
    </section>


     <section class="py-5 bg-white" id="upcomingevents" runat="server">
        <div class="container">
            
            <h2 id="upcomingEvents">Upcoming Events</h2>
            <div class="row py-2">
               
                    <div id="coalevents" runat="server" visible="true"><!-- #include virtual="/events/upcoming_oilgasevents.html" --></div>
                    <p><a href="/events/index.aspx" role="button" class="btn btn-outline-primary">View GMI Calendar</a></p>
               
            </div>

        </div>

    </section>
     <section class="py-5" id="recentevents" runat="server">
        <div class="container">
            <h2 id="recentEvents">Recent Events</h2>
            <div class="row py-2">
               
                   <!-- #include virtual="/events/recent_oilgasevents.html" -->
                   
                    <p><a href="/events/past_events.aspx" role="button" class="btn btn-outline-primary">View All Past Events</a></p>
               
            </div>

        </div>

    </section>


	<section class="py-5 bg-white">
		<div class="container">
				<h2 id="subcommittee">Oil & Gas Subcommittee</h3>
					<div class="row py-2">
                        <%--<div class="col-sm-4">
                            <!--<h3>Next Meeting:</h3>  
                              <p><em>To be determined</em></p>-->

							<h3>Recent Meeting:</h3>
								<p><a href="../events/details.aspx?eventid=588">GMI Oil & Gas Subcommittee Webinar: Accelerating Methane Mitigation Through Markets, 24 February 2021</a></p>
                            <h3>Upcoming Meeting:</h3>
								<p><a href="../events/details.aspx?eventid=600">GMI Oil & Gas Subcommittee Webinar: Improved Collection and Verification of Methane Emissions Data for Effective Mitigation, 30 March 2021</a></p>
								<p><a href="../events/index.aspx" role="button" class="btn btn-outline-primary">View GMI Calendar</a></p>
						</div>--%>
                        <div class="col-sm-6">
                            <h3>Subcommittee Co-chairs</h3>  
                              <asp:placeholder ID="phChairs" runat="server" Visible="true"></asp:placeholder>
						</div>
                        <div class="col-sm-6">
                              <h3>Subcommittee Members</h3>
                              <p>Representatives from 26 countries participate in the Oil & Gas Subcommittee.</p>
							  <p><a href="/delegates/index.aspx?sector=oil" role="button" class="btn btn-outline-primary">View Delegates</a></p>

							  <h3>Project Network</h3>
                              <p>Hundreds of Project Network members support methane abatement projects in the oil & gas sector.</p>
							  <p><a href="/project-network/member_list.aspx" role="button" class="btn btn-outline-primary">Search members</a></p>

						</div>
                    </div>

		</div>
    </section>







	<section class="py-5">
		<div class="container">
			<h2 id="connect">Connect, Contribute, and Stay in Touch</h2>
			<div class="row">
              <div class="col-sm-4">
				<p><strong>Want to share your oil & gas sector expertise with GMI?</strong></p>
				  <p>Use the contact us form to tell us know about your expertise or to ler us know about current or potential methane mitigation projects.</p>
				  <p><a href="../contact-us/index.aspx" role="button" class="btn btn-outline-primary">Contact Us</a></p>
				</div>
				<div class="col-sm-4">
				<p><strong>Would you like to recommend a resource?</strong></p>
				  <p>Click the button below to recommend a resource that you would like to see featured on the GMI website. The Secretariat and members of the Oil & Gas Subcommittee will review your recommendation.</p>
				  <p><a href="../resources/recommend.aspx" role="button" class="btn btn-outline-primary">Recommend a resource</a></p>
				</div>
				<div class="col-sm-4">
				<p><strong>Would you like to receive updates?</strong></p>
				  <p>Sign up on the GMI mailing list to receive communications from GMI by email. You can select your topics of interest.</p>
				  <p><a href="http://eepurl.com/ggwT3T" role="button" class="btn btn-outline-primary">Join the GMI mailing list</a></p>
				  <p><a href="../communications/index.aspx" role="button" class="btn btn-outline-primary">View recent communications</a></p>
				</div>
			</div>
				
			
		</div>
	</section>	






       

		
		
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
    window.onscroll = function() {scrollFunction()};

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
                var i, tabcontent, tablinks;
                tabcontent = document.getElementsByClassName("Countrytabcontent");
                for (i = 0; i < tabcontent.length; i++) {
                    tabcontent[i].style.display = "block";
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

            /*
            if ($('.Ogslidediv').length > 0) {
                document.getElementById("defaultOpen").click();
            }else if($('.Cslidediv').length > 0) {
                document.getElementById("thirdOpen").click();
            }else if ($('.Bslidediv').length > 0) {
                document.getElementById("secondOpen").click();
            } else if ($('.Mslidediv').length > 0) {
                document.getElementById("firstOpen").click();
            }
            */

            if ($('.Bslidediv').length == 0) {
                document.getElementById("Bslider").innerHTML += ("<div class='SlideNone'>Do you have a story about how you are reducing methane emissions in the Biogas sector?  <a href='/challenge/submission'>Submit your story today</a> to the Global Methane Challenge.<br /><br />For more information, visit the <a href='/challenge/redesign.html'>Global Methane Challenge</a> website.</div>");
            }
            if ($('.Cslidediv').length == 0) {
                document.getElementById("Cslider").innerHTML += ("<div class='SlideNone'>Do you have a story about how you are reducing methane emissions in the Coal Mines sector?  <a href='/challenge/submission'>Submit your story today</a> to the Global Methane Challenge.<br /><br />For more information, visit the <a href='/challenge/redesign.html'>Global Methane Challenge</a> website.</div>");
            }
            if ($('.Ogslidediv').length == 0) {
                document.getElementById("Ogslider").innerHTML += ("<div class='SlideNone'>Do you have a story about how you are reducing methane emissions in the Oil & Gas sector?  <a href='/challenge/submission'>Submit your story today</a> to the Global Methane Challenge.<br /><br />For more information, visit the <a href='/challenge/redesign.html'>Global Methane Challenge</a> website.</div>");
            }
            if ($('.Mslidediv').length == 0) {
                document.getElementById("Mslider").innerHTML += ("<div class='SlideNone'>Do you have a story about how you are reducing methane emissions for multiple sectors?  <a href='/challenge/submission'>Submit your story today</a> to the Global Methane Challenge.<br /><br />For more information, visit the <a href='/challenge/redesign.html'>Global Methane Challenge</a> website.</div>");
            }
        </script>		
		
		
</body>

</html>