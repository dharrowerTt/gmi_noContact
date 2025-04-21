<%@ Page Language="VB" AutoEventWireup="false" Inherits="M2M_Redesign.coal_index" Codebehind="index.aspx.vb" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Coal | Global Methane Initiative</title>
     <!-- #include virtual="/includes/include_head.html" -->

    <style>
body {
            background: url("/assets/images/paper_fibers.png");
        }


        .Countrytab img, {
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

                        .Cslidediv img{
            border: 0px solid #232323;
            margin:0px 25px 25px 0px;
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
.gmi-light-gray{
		background:#d1d8e0 !important;
		background-image: linear-gradient(-10deg, #d1d8e0, #a5b1c2);
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
            <!--
                <li data-target="#headercarouselarea" data-slide-to="3"></li>
			-->
            </ol>
            <div class="carousel-inner" role="listbox">
                <!-- Slide One - Set the background image for this slide in the line below -->
                <div class="carousel-item active"
                    style="background-image:linear-gradient(to right, rgba(255,255,255,0), rgba(109,7,26,0.2), rgba(109,7,26,1)), url('assets/images/coal-banner-training.png')">
                    <div class="carousel-caption d-none d-md-block">
						<h2 class="display-5" style="color:white;">Conducting Pre-Feasibility Studies <br />for Coal Mine Methane Projects</h2>
                        <p class="lead" style="color:white;">Online Training Course</p>
						<p><a href="/training/coalminetraining.aspx" class="btn btn-primary btn-sm" role="button">View Now</a></p>
                    </div>
                </div>
                <!-- Slide Two - Set the background image for this slide in the line below-->
                <div class="carousel-item"
                    style="background-image:linear-gradient(to bottom, rgba(255,255,255,0), rgba(0,0,0,.9)), url('assets/images/coal-banner-generic.png')">
                    <div class="carousel-caption d-none d-md-block">
						<h2 class="display-5" style="color:white;">Action Plan</h2>
                        <p class="lead" style="color:white;">The Action Plan provides a blueprint for the important activities and priorities of the Coal Mines Subcommittee to advance coal mine methane (CMM) projects</p>
						<p><a href="/documents/Coal_Subcommittee_Action_Plan_September2018.pdf" class="btn btn-primary btn-sm" role="button">View the Action Plan</a></p>
                    </div>
                </div>
		 		
                <!-- Slide Three - Set the background image for this slide in the line below-->
                <div class="carousel-item"
                    style="background-image:linear-gradient(to bottom, rgba(255,255,255,0), rgba(0,0,0,.9)), url('assets/images/coal-banner-profiles.png')">
                    <div class="carousel-caption d-none d-md-block">
						<h2 class="display-5" style="color:white;">Coal Mine Methane Country Profiles</h2>
                        <p class="lead" style="color:white;">Contains individual, comprehensive profiles that characterize the coal and coal mine methane sectors of 37 countries.</p>
						<p><a href="/coal/country-profiles.aspx" class="btn btn-primary btn-sm" role="button">View Profiles</a></p>
                    </div>
                </div>

				<!-- Slide Four - Set the background image for this slide in the line below-->
				
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
		            <h1>Coal Sector</h1>
					<p>
                        The Coal Mines Subcommittee focuses on supporting the identification and deployment of practical and cost-effective methane mitigation technologies and practices to reduce or eliminate emissions from coal mines. This is achieved by encouraging collaboration among Partner Countries, Subcommittee members, and Project Network members to build capacity, develop strategies and markets, and remove technical and non-technical barriers to methane mitigation project development. Ultimately, such collaboration can increase environmental quality, improve operational efficiency, and strengthen the economy via the additional methane brought to market.
                    </p>
                </div>
				<div class="col-sm-4">
					<div class="border border-secondary bg-white px-0">
						<div class="py-1 text-center bg-dark text-white"><strong>On this page</strong></div>
                                <ul class="list-group py-2">
                                    <li class="list-group-item noborder nobackground py-1"><a href="#newsannouncements">News & Announcements</a></li>
                                    <li id="phupcomingevents" runat="server" visible="false" class="list-group-item noborder nobackground py-1"><a href="#upcomingevents">Upcoming Events</a></li>
                                    <li class="list-group-item noborder nobackground py-1"><a href="#recentevents">Recent Events</a></li>
                                    <li class="list-group-item noborder nobackground py-1"><a href="#subcommittee">Coal Mines Subcommittee</a></li>
                                    <li class="list-group-item noborder nobackground py-1"><a href="#challenge">Global Methane Challenge Stories</a></li>
									<li class="list-group-item noborder nobackground py-1"><a href="#connect">Connect, Contribute, and Stay in Touch</a></li>
                                    <li class="list-group-item noborder nobackground py-1"><a href="#resources">Recent Resources</a></li>
                                </ul>
					</div>
                </div>
            </div>
        </div>
    </section>

      <section class="py-5 gmi-light-gray">
        <div class="container">
            <div class="row">
                <div class="col-sm-12">
                    <h2 id="newsannouncements">News & Announcements</h2>
                </div>
            </div>
            <div class="row">
                			<div class="col-sm-12">
                                <div class="imagebox" style="background:white; padding:10px; float:left; margin-right:20px; margin-bottom:10px; width:25%;">
			<img src="screenshot.PNG" style="width:100%;border:1px solid black;"/>
                                    </div>
              
		            
				<h3>USGS Fellowship Opportunity</h3>
                        <p>Check out this new Research Fellowship Opportunity that is being offered by the United States Geological Survey (USGS). The Mendenhall Research Fellowship Program is seeking Ph.D. candidates who are interested in conducting research on coal mine methane (CMM) emissions and resource recovery potential. Coal mining accounts for 9% of anthropogenic methane emissions, and research under this opportunity aims to analyze capture and use opportunities to reduce methane emissions.  </p>

<p>Applications are due by 11:59 pm ET on January 6, 2022. Because this fellowship is a U.S. Government position, preference will be given to U.S. citizens. Read the full job description for more information and instructions on how to apply:  </p>

<p><a href="https://www.usgs.gov/centers/mendenhall/20-41-quantitative-coal-mine-methane-research-and-development-scenario-analysis">20-41. Quantitative coal mine methane research and development of scenario analysis tools to reduce atmospheric emissions (usgs.gov).  </a></p>
                    
                </div>
	
            </div>
        </div>
    </section>

    <section class="py-5 bg-white" id="upcomingevents" runat="server">
        <div class="container">
            
            <h2 id="upcomingEvents">Upcoming Events</h2>
            <div class="row py-2">
               
                    <div id="coalevents" runat="server" visible="true"><!-- #include virtual="/events/upcoming_coalevents.html" --></div>
                    <p><a href="/events/index.aspx" role="button" class="btn btn-outline-primary">View GMI Calendar</a></p>
               
            </div>

        </div>

    </section>
     <section class="py-5" id="recentevents" runat="server">
        <div class="container">
            <h2 id="recentEvents">Recent Events</h2>
            <div class="row py-2">
               
                   <!-- #include virtual="/events/recent_coalevents.html" -->
                   
                    <p><a href="/events/past_events.aspx" role="button" class="btn btn-outline-primary">View All Past Events</a></p>
               
            </div>

        </div>

    </section>

	<section class="py-5 bg-white">
		<div class="container">

				<h2 id="subcommittee">Coal Mines Subcommittee</h2>
					<div class="row py-2">
                        <%--<div class="col-sm-4">
                          <!--  <h3>Next Meeting:</h3>  -->
                             

							<h3>Recent Meeting:</h3>
                                <p><a href="/events/details.aspx?eventid=586">GMI Coal Mines Subcommittee Meeting, 4 March 2021</a></p>
								<p><a href="/events/details.aspx?eventid=547">29th GMI Coal Mines Subcommittee Virtual Meeting, 23 July 2020</a></p>
								<p><a href="/events/index.aspx" role="button" class="btn btn-outline-primary">View GMI Calendar</a></p>
						</div>--%>
                        <div class="col-sm-6">
                            <h3>Subcommittee Co-chairs</h3>
                            <asp:placeholder ID="phChairs" runat="server" Visible="true"></asp:placeholder>
                            
                             
						</div>
                        <div class="col-sm-6">
                              <h3>Subcommittee Members</h3>
                              <p>Representatives from 22 countries participate in the Coal Mines Subcommittee.</p>
							  <p><a href="/delegates/index.aspx?sector=coal" role="button" class="btn btn-outline-primary">View Delegates</a></p>

							  <h3>Project Network</h3>
                              <p>Hundreds of Project Network members support methane abatement projects in the coal sector.</p>
							  <p><a href="/project-network/member_list.aspx" role="button" class="btn btn-outline-primary">Search members</a></p>

						</div>
                    </div>


		</div>
	</section>
	<section class="py-5">
		<div class="container">
			<h2 id="challenge">Tell Us Your Story</h2>
			<div class="row">
                <div class="col-sm-6 vertSplitter">
					<p><a href="/challenge" target="_blank"><img src="../challenge/images/gmclogo.svg" style="max-width:350px;" /></a></p>
					<p>Learn how you can showcase your efforts to reduce methane emissions in the coal sector through the <a href="/challenge" target="_blank">Global Methane Challenge</a>.</p>
				</div>
				<div class="col-sm-6 vertSplitter">


				
						<div style="background-image: linear-gradient(#3F4F87, #1D85B9);">
					        <div class="Countrytab">
                                <button class="" onclick="openSector(event, 'CoalTab')" id="defaultOpen">Selected Coal Stories</button>
								<a style="float:right;color:white;padding:3px 10px;" href="/challenge/showcase.html">View all</a>
                            </div>

                            <!-- Tab content -->
                            <div id="CoalTab" class="Countrytabcontent">
                                <div id="Cslider" class="Cslider">

									<div Class='Cslidediv'>
										<a href='https:/challenge/china.html'>
										<img style='float:left;' src = '/images/gmc-thumbs/china.png' /></a>
										<a href='https:/challenge/china.html'>
										<p>The International Centre of Excellence on Coal Mine Methane serves as a regional and international center for best practices in gas capture and utilization. Its objectives include increasing clean power generation, reducing greenhouse gas emissions, and improving mine safety.</p>
										</a>
									</div>
                                
									<div Class='Cslidediv'>
										<a href='https:/challenge/hydraulic.html'>
										<img style='float:left;' src = '/images/gmc-thumbs/kuznetsk.png' /></a>
										<a href='/challenge/hydraulic.html'>
										<p>Hydraulic Fracturing of Kuznetsk, LLC is working to reduce methane emissions in Russia through the development of a technology that increases the efficiency of degassing systems in modern coal mines.</p>
										</a>
									</div>
                                
									<div Class='Cslidediv'>
										<a href='/challenge/cbm.html'>
										<img style='float:left;' src = '/images/gmc-thumbs/india-cmm-cbm.png' /></a>
										<a href='/challenge/cbm.html'>
										<p>The India CMM/CBM Clearinghouse addresses barriers to methane utilization projects in India. Several commercial CMM/CBM projects are scheduled to be implemented in 2020.</p>
										</a>
									</div>
                                
									<div Class='Cslidediv'>
										<a href='/challenge/francaise.html'>
										<img style='float:left;' src = '/images/gmc-thumbs/francaise-de-l-energie.png' /></a>
										<a href='/challenge/francaise.html'>
										<p>La Française de l’Energie (LFDE) assessed and identified practical options to recover and utilize the gas from Northern France’s abandoned coal mines. Annual methane emissions reductions for LFDE’s project are estimated at 602,000 TCO<sub>2</sub>e.</p>
										</a>
									</div>
                                
									<div Class='Cslidediv'>
										<a href='/challenge/mnec.html'>
										<img style='float:left;' src = '/images/gmc-thumbs/mnec.png' /></a>
										<a href='/challenge/mnec.html'>
										<p>The Mongolian Nature & Environment Consortium (MNEC) created an inventory of CMM fugitive emissions, increased capacity for CMM exploration and project development, and published several outreach materials to increase public awareness.</p>
										</a>
									</div>
                                
									<div Class='Cslidediv'>
										<a href='/challenge/poland.html'>
										<img style='float:left;' src = '/images/gmc-thumbs/poland-cmm.png' /></a>
										<a href='/challenge/poland.html'>
										<p>Poland created the International Centre of Excellence on Coal Mine Methane (ICE-CMM) to support the Group of Experts on CMM in its capacity-building activities.</p>
										</a>
									</div>

								
								</div>
                            </div>
				
						</div>					
					

				</div>
			</div>
		</div>
    </section>
	<section class="py-5 bg-white">
		<div class="container">
			<h2 id="connect">Connect, Contribute, and Stay in Touch</h2>
			<div class="row">
              <div class="col-sm-4">
				<p><strong>Do you know about a potential coal mine methane mitigation opportunity?<br />Would you like to share your expertise in this sector?</strong></p>
				  <p>Use the contact us form to submit information about your potential opportunity or just let us know about your expertise.</p>
				  <p><a href="/contact-us/index.aspx" role="button" class="btn btn-outline-primary">Contact Us</a></p>
				</div>
				<div class="col-sm-4">
				<p><strong>Would you like to recommend a resource?</strong></p>
				  <p>Click the button below to recommend a resource that you would like to see featured on the GMI website. The Secretariat and members of the Coal Mines Subcommittee will review your recommendation.</p>
				  <p><a href="/resources/recommend.aspx" role="button" class="btn btn-outline-primary">Recommend a resource</a></p>
				</div>
				<div class="col-sm-4">
				<p><strong>Would you like to receive updates?</strong></p>
				  <p>Sign up on the GMI mailing list to receive communications from GMI by email. You can select your topics of interest.</p>
				  <p><a href="http://eepurl.com/ggwT3T" role="button" class="btn btn-outline-primary">Join the GMI mailing list</a></p>
				  <p><a href="/communications/index.aspx" role="button" class="btn btn-outline-primary">View recent communications</a></p>
				</div>
			</div>
				
			
		</div>
	</section>
	<section class="py-5">
		<div class="container">
			<h2 id="resources">Recent Resources</h2>
				  <p>Check out these featured resources.  For a complete list of available coal resources, including technical documents, presentations, and tools, please visit the resources page. </p>
				  <p><a href="/resources/index.aspx?sector=coal mines" role="button" class="btn btn-outline-primary">View all coal resources</a></p>
                  <div class="row py-2">
                    <div class="col-sm-2">
                        <img style='width:100%;' src = '/assets/images/coaldbthumbnail.PNG' />
                    </div>
                    <div class="col-sm-10">
                        <div class="float-right"><i class="fa fa-tools fa-2x"></i></div>
                        <h4><a href='/resources/details.aspx?resourceid=1981'>International Coal Mine Methane Projects Database (2021)</a></h4>
                        <p>This Excel document contains information on over two hundred coal mine methane recovery and utilization projects operating, in development, or planned around the world in both Global Methane Initiative partner and non-partner countries.</p>
                    </div>
                </div>
				  	<div class="row py-2">
                        <div class="col-sm-2">
                            <img style='width:100%;' src = '/images/doc_thumbs/4995_CMM_training_screenshot.png' />
						</div>
                        <div class="col-sm-10">
                            <div class="float-right"><i class="fa fa-film fa-2x"></i></div>
							<h4><a href='/training/coalminetraining.aspx'>
								Conducting Pre-Feasibility Studies for Coal Mine Methane Projects Training (2020)</a>
							</h4>
							<p>The U.S. EPA is developing this training course in support of the GMI and in conjunction with the United Nations Economic Commission for Europe (UNECE). This course introduces principles for assessing the potential of developing projects to capture and/or use Coal Mine Methane (CMM). The introduced general approach should be underpinned by mine-specific data and analyses, allowing the principles to be tailored to the unique conditions at each mine. Ideally, such an assessment will lead to project development and implementation.</p>
						</div>
                    </div>
				  	<div class="row py-2">
                        <div class="col-sm-2">
                            <img style='width:100%;' src = '/images/doc_thumbs/jpeg/Global_Methane_Emissions_from_Coal_Mining_thumb.png' />
						</div>
                        <div class="col-sm-10">
                            <div class="float-right"><i class="fa fa-file fa-2x"></i></div>
							<h4><a href='/resources/details.aspx?resourceid=4997'>
								Global Methane Emissions from Coal Mining to Continue Growing Even with Declining Coal Production (2020)</a>
							</h4>
							<p>Coal mines are one of the largest sources of anthropogenic methane emissions. As the world produces more coal, coal mines get deeper every year, and methane emissions grow with increasing mining depth. Mine operators also abandon old coal mines, which still emit methane into the atmosphere. The U.S. EPA, in collaboration with the Global Methane Initiative and several other organizations, co-authored this paper that presents projections of global methane emissions from coal mining under different coal extraction scenarios and with increasing mining depth through 2100. The study estimates methane emissions from underground and surface coal production while accounting for the increase in mining depth using several new and compiled data sets. </p>
						</div>
                    </div>

				  	<div class="row py-2">
                        <div class="col-sm-2">
                            <img style='width:100%;' src = '/images/thumb_countryProfiles_2016.png' />
						</div>
                        <div class="col-sm-10">
                            <div class="float-right"><i class="fa fa-file fa-2x"></i></div>
							<h4><a href='/coal/country-profiles.aspx'>
								Coal Mine Methane Country Profiles (2020)</a>
							</h4>
							<p>This document contains individual, comprehensive profiles that characterize the coal and coal mine methane sectors of 37 countries—29 Global Methane Initiative partners and an additional eight coal-producing nations. In addition, an Introduction section provides additional methane information, summary tables, and country statistics.</p>
						</div>
                    </div>

				    <div class="row py-2">
                        <div class="col-sm-2">
                            <img style='width:100%;' src = '/images/doc_thumbs/jpeg/GMI_Prefeasibility_Study_Casa_Blanca_Mine_Image.jpg' />
						</div>
                        <div class="col-sm-10">
                            <div class="float-right"><i class="fa fa-file fa-2x"></i></div>
							<h4><a href='/resources/details.aspx?resourceid=4821'>Pre-Feasibility Study for Methane Drainage and Utilization at the Casa Blanca Coal&nbsp;Mine&nbsp;(2019)</a></h4>
							<p>This pre-feasibility study was completed to determine the feasibility of a coal mine methane (CMM) capture and utilization project at the Casa Blanca Coal Mine in Colombia.</p>
						</div>
                    </div>
				  	<div class="row py-2">
                        <div class="col-sm-2">
                            <img style='width:100%;' src = '/images/doc_thumbs/jpeg/Pootkee_PFS_final 11-27-19_Image.jpg' />
						</div>
                        <div class="col-sm-10">
                            <div class="float-right"><i class="fa fa-file fa-2x"></i></div> 
							<h4><a href='/resources/details.aspx?resourceid=4900'>Pre-Feasibility Study for Methane Drainage and Utilization at the Pootkee Colliery, Damodar Valley (2019)</a></h4>
							<p>This pre-feasibility study was completed to determine the viability of a CMM drainage project at the Pootkee Colliery. Specifically, the study evaluated the technical and economic viability of utilizing long in-mine horizontal boreholes drilled into Seam XII to drain methane in advance of mining, and to identify end-use options for the drained methane.</p>
						</div>
                    </div>
				    <div class="row py-2">
                        <div class="col-sm-2">
                            <img style='width:100%;' src = '/images/resource_feature_coalmines0.JPG' />
						</div>
                        <div class="col-sm-10">
                            <div class="float-right"><i class="fa fa-file fa-2x"></i></div>
							<h4><a href='/resources/details.aspx?resourceid=1927'>
								Coal Mine Methane Mitigation and Utilization Technologies and Project Profiles (2018)</a><br />
								<small class="text-muted">(also referred to as the Coal Mine Methane Technology Database)</small>
							</h4>
							<p>This database provides basic descriptions of several key technologies applicable to coal mine methane recovery and utilization, including each technology&rsquo;s current status and commercial availability. It is intended to be a living document, which will be periodically updated to remain current. The database is an updated and revised version of the original database compiled by Australia&rsquo;s Department of Industry, Tourism and Resources, on behalf of the Global Methane Initiative.</p>
						</div>
                    </div>
				  	<div class="row py-2">
                        <div class="col-sm-2">
                            <img style='width:100%;' src = '/images/mmm_home.jpg' />
						</div>
                        <div class="col-sm-10">
                            <div class="float-right"><i class="fa fa-film fa-2x"></i></div>
							<h4><a href='/resources/details.aspx?resourceid=4741'>Methane Mitigation Matters (2015)</a></h4>
							<p>Methane is a prevalent manmade greenhouse gas that traps 28 times more heat than carbon dioxide (CO2). Reducing methane emissions by recovering and using methane as a clean energy source offers many benefits for the environment and local communities. This video highlights the many ways that reducing methane can benefit the environment and local communities. </p>
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
                $('.Cslider').slick('refresh');
            });

            $('#firstOpen').click(function () {

                $('.Mslider').slick('refresh');
            });

            $('#secondOpen').click(function () {
                $('.Ogslider').slick('refresh');
   
            });
            $('#thirdOpen').click(function () {
                $('.Bslider').slick('refresh');

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
            if ($('.Cslidediv').length > 0) {
                document.getElementById("defaultOpen").click();
            }else if($('.Ogslidediv').length > 0) {
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