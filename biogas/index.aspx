<%@ Page Language="VB" AutoEventWireup="false" Inherits="M2M_Redesign.biogas_index" Codebehind="index.aspx.vb" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Biogas | Global Methane Initiative</title>
     <!-- #include virtual="/includes/include_head.html" -->
    	<style>
        body {
            background: url("/assets/images/paper_fibers.png");
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
                <!--
				<li data-target="#headercarouselarea" data-slide-to="3"></li>
				-->
            </ol>
            <div class="carousel-inner" role="listbox">
                <!-- Slide One - Set the background image for this slide in the line below -->
                <div class="carousel-item active"
                    style="background-image:linear-gradient(to bottom, rgba(255,255,255,0), rgba(0,0,0,.9)), url('assets/images/biogas-toolkit.jpg')">
                    <div class="carousel-caption d-none d-md-block">
                        <h2 class="display-5" style="color:white;">Biogas Toolkit</h2>
                        <p class="lead" style="color:white;">The U.S. Environmental Protection Agency (EPA) Biogas Toolkit serves as a centralized knowledge hub for biogas project stakeholders</p>
						<p><a href="https://www.epa.gov/agstar/biogas-toolkit" class="btn btn-primary btn-sm" role="button">Visit Now</a></p>
                    </div>
                </div>
                <!-- Slide Two - Set the background image for this slide in the line below -->
                <div class="carousel-item"
                    style="background-image:linear-gradient(to bottom, rgba(255,255,255,0), rgba(0,0,0,.4)), url('assets/images/slide2bg.png')">
                    <div class="carousel-caption d-none d-md-block">
                        
						<h2 class="display-5" style="color:white;">Market Opportunities for Anaerobic Digestion of Livestock and<br />Agro-Industrial Wastes in India (2020)</h2>
                        <p class="lead" style="color:white;">Developed by the U.S. Environmental Protection Agency </p>
						<p><a href="/resources/details.aspx?resourceid=4917" class="btn btn-secondary btn-sm" role="button">View Resource!</a></p>
                    </div>
                </div>

				<!-- Slide Three - Set the background image for this slide in the line below -->
                <div class="carousel-item"
                    style="background-image:linear-gradient(220deg, rgba(255,255,255,0.5), rgba(46,126,86,0.9)), url('assets/images/biogas-banner-2.png')">
                    <div class="carousel-caption d-none d-md-block">
                        <h2 class="display-5" style="color:black;">Biogas Tools & Resources</h2>
                        <p class="lead" style="color:black;">GMI has a library of more than 1,000 biogas resources</p>
						<p><a href="/resources/index.aspx?sector=biogas" class="btn btn-primary btn-sm" role="button">Explore Now</a></p>
                    </div>
                </div>

				<!-- Slide Four - Set the background image for this slide in the line below -->


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
	            <h1>Biogas Sector</h1>
					<p>
                        The GMI Biogas Subcommittee focuses on building capacity within Partner Countries to leverage common interests across the areas of agriculture, municipal solid waste, and municipal wastewater. These interests include biogas energy use, the types of wastes managed, waste treatment technologies, and the potential for synergistic projects involving input streams from multiple sources. Efforts include developing and promoting tools, policy guidance, and project development resources at the national, state, and city level within Partner Countries.
                    </p>

                </div>
                <div class="col-sm-4">
					<div class="border border-secondary bg-white px-0">
						<div class="py-1 text-center bg-dark text-white"><strong>On this page</strong></div>
                                <ul class="list-group py-2">
                                    <li ID="phupcomingevents" runat="server" Visible="false" class="list-group-item noborder nobackground py-1"><a href="#upcomingevents">Upcoming Events</a></li>
                                     <li class="list-group-item noborder nobackground py-1"><a href="#recentevents">Recent Events</a></li>
                                    <li class="list-group-item noborder nobackground py-1"><a href="#subcommittee">Biogas Subcommittee</a></li>
									<li class="list-group-item noborder nobackground py-1"><a href="#connect">Connect, Contribute, and Stay in Touch</a></li>
                                    <li class="list-group-item noborder nobackground py-1"><a href="#challenge">Global Methane Challenge Stories</a></li>
                                    <li class="list-group-item noborder nobackground py-1"><a href="#tools">Featured Tools</a></li>
                                    <li class="list-group-item noborder nobackground py-1"><a href="#resources">Recent Resources</a></li>
                                </ul>
					</div>

				
                </div>
            </div>
					<h3 class="py-3">GMI Technical Groups</h3>
					<p>Within the Biogas Sector, GMI maintains active technical groups in the areas of agriculture, municipal solid waste (MSW), and municipal wastewater. 
						These groups provide international leadership to mitigate global methane emissions through the abatement, recovery, and use of methane. 
						They promote collaboration between delegates from Partner Countries and Project Network members to build capacity, develop strategies, and expand opportunities for using methane as a renewable energy resource.</p>
						<div class="row">
							<div class="col-sm-4">
								<a href="agriculture.aspx"><img src="../images/bkgd_sector_ag_banner2.jpg" style="width:100%;" /></a>
								<h4 class="py-2"><a href="agriculture.aspx">Agriculture</a></h4>
								<p class="small">Methane emissions come from livestock enteric fermentation, livestock waste management, rice cultivation, and agricultural waste burning.</p>
							</div>
							<div class="col-sm-4">
								<a href="msw.aspx"><img src="../images/bkgd_sector_land_banner2.jpg" style="width:100%;" /></a>
								<h4 class="py-2"><a href="msw.aspx">Municipal Solid Waste</a></h4>
								<p class="small">Municipal solid waste management and treatment activities such as landfilling and anaerobic digestion are sources of methane emissions worldwide.</p>
							</div>
							<div class="col-sm-4">
								<a href="ww.aspx"><img src="../images/bkgd_sector_ww_banner3.jpg" style="width:100%;" /></a>
								<h4 class="py-2"><a href="ww.aspx">Municipal Wastewater</a></h4>
								<p class="small">Methane is produced when the organic material in municipal wastewater decomposes anaerobically.</p>
							</div>
						</div>
        </div>
    </section>
        <section class="py-5 bg-white" id="upcomingevents" runat="server">
        <div class="container">
            
            <h2 id="upcomingEvents">Upcoming Events</h2>
            <div class="row py-2">
               
                    <div id="coalevents" runat="server" visible="true"><!-- #include virtual="/events/upcoming_biogasevents.html" --></div>
                    <p><a href="/events/index.aspx" role="button" class="btn btn-outline-primary">View GMI Calendar</a></p>
               
            </div>

        </div>

    </section>
     <section class="py-5" id="recentevents" runat="server">
        <div class="container">
            <h2 id="recentEvents">Recent Events</h2>
            <div class="row py-2">
               
                   <!-- #include virtual="/events/recent_biogasevents.html" -->
                   
                    <p><a href="/events/past_events.aspx" role="button" class="btn btn-outline-primary">View All Past Events</a></p>
               
            </div>

        </div>

    </section>


	<section class="py-5 bg-white">
		<div class="container">
				<h2 id="subcommittee">Biogas Subcommittee</h2>
					<div class="row py-2">
                       <%-- <div class="col-sm-4">
                            <h3>Upcoming Events:</h3>  
                              <p><a href="/events/details.aspx?eventid=590">Sustainable Biogas – Climate and Environmental Effects of Biogas Production, 16 March 2021</a></p>
                              <p><a href="/events/details.aspx?eventid=591">Food & Biogas: Driving the Circular Economy in Denmark, 24 March 2021</a></p>	
                              <p><a href="/events/index.aspx" role="button" class="btn btn-outline-primary">View GMI Calendar</a></p>
						</div>--%>
                        <div class="col-sm-6">
                            <h3>Subcommittee Co-chairs</h3>  
                           
                            <asp:placeholder ID="phChairs" runat="server" Visible="true"></asp:placeholder>
						</div>
                        <div class="col-sm-6">
                              <h3>Subcommittee Members</h3>
                              <p>Representatives from 38 countries participate in the Biogas Subcommittee.</p>
							  <p><a href="/delegates/index.aspx?sector=biogas" role="button" class="btn btn-outline-primary">View Delegates</a></p>

							  <h3>Project Network</h3>
                              <p>Hundreds of Project Network members support methane abatement projects in the biogas sector.</p>
							  <p><a href="/project-network/member_list.aspx" role="button" class="btn btn-outline-primary">Search members</a></p>

						</div>
                    </div>

			

		</div>
    </section>
	<section class="py-5">
		<div class="container">
			<h2 id="challenge">Tell Us Your Story</h2>
			<div class="row">
                <div class="col-sm-7 vertSplitter">
					<p><a href="/challenge" target="_blank"><img src="../challenge/images/gmclogo.svg" style="max-width:350px;" /></a></p>
					<p>Learn how you can showcase your efforts to reduce methane emissions in the biogas sector through the <a href="../challenge" target="_blank">Global Methane Challenge</a>.</p>
				</div>
				<div class="col-sm-5 vertSplitter">
						<div style="background-image: linear-gradient(#3F4F87, #1D85B9);">
					        <div class="Countrytab">
                                <button class="" onclick="openSector(event, 'BiogasTab')" id="defaultOpen">Selected Biogas Stories</button>
								<a style="float:right;color:white;padding:3px 10px;" href="../challenge/showcase.html">View all</a>
                            </div>

                            <!-- Tab content -->
                            <div id="BiogasTab" class="Countrytabcontent">
                                <div id="Bslider" class="Bslider">

									<div Class='Bslidediv'><a href='https://globalmethane.org/challenge/ledslac.html'><img src='/images/gmc-thumbs/latinamericacaribbean-BioE-CoP.png' style='float:left;'></a><a href='https://globalmethane.org/challenge/ledslac.html'><p>The Bioenergy Community of Practice (BioE-CoP) is a peer-to-peer learning network that advances the development of bioenergy.</p></a></div>

									<div Class='Bslidediv'><a href='https://globalmethane.org/challenge/abiogas.html'><img src='/images/gmc-thumbs/abiogas.png' style='float:left;'></a><a href='https://globalmethane.org/challenge/abiogas.html'><p>In 2019, ABiogás promoted the biogas sector in Brazil by formulating legal frameworks for biogas policies at the national level.</p></a></div>

									<div Class='Bslidediv'><a href='https://globalmethane.org/challenge/iitd.html'><img src='/images/gmc-thumbs/iitd.png' style='float:left;'></a><a href='https://globalmethane.org/challenge/iitd.html'><p>IITD is committed to contributing innovative scientific and technical education and research to India and the world.</p></a></div>

									<div Class='Bslidediv'><a href='https://globalmethane.org/challenge/mexico_ww.html'><img src='/images/gmc-thumbs/mexico-ww.png' style='float:left;'></a><a href='https://globalmethane.org/challenge/mexico_ww.html'><p>Government agencies in Mexico are working to reduce methane emissions from wastewater treatment plants.</p></a></div>
								
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
				<p><strong>Are you actively involved in methane mitigation projects in the biogas sector?</strong></p>
				  <p>Use the contact us form to let us know about your expertise and how you would like to get involved with GMI.</p>
				  <p><a href="../contact-us/index.aspx" role="button" class="btn btn-outline-primary">Contact Us</a></p>
				</div>
				<div class="col-sm-4">
				<p><strong>Would you like to recommend a resource?</strong></p>
				  <p>Click the button below to recommend a resource that you would like to see featured on the GMI website. The Secretariat and members of the Biogas Subcommittee will review your recommendation.</p>
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
	<section class="py-5">
		<div class="container">
			<h2 id="tools">Featured Tools</h2>
				  <p>Check out these featured tools.</p>
				  <p><a href="../resources/index.aspx?sector=biogas" role="button" class="btn btn-outline-primary">View all biogas resources</a></p>
	

					<div class="row py-2">
                        <div class="col-sm-2">
                            <img style="width:100%;" src = "assets/images/biogas-toolkit-thumb.jpg" />
						</div>
                        <div class="col-sm-10">
                            <div class="float-right"><i class="fa fa-tools fa-2x"></i></div>
                            <h4><a href='https://www.epa.gov/agstar/biogas-toolkit'>Biogas Toolkit (U.S. EPA) (2020)</a></h4>
							<p>The U.S. Environmental Protection Agency (EPA) Biogas Toolkit serves as a centralized knowledge hub for biogas project stakeholders.  The toolkit is designed to allow stakeholders to search and browse for information and resources that meet their specific project needs. The toolkit includes information and resources compiled from across several EPA programs, including AgSTAR, the Landfill Methane Outreach Program (LMOP), and GMI.</p>
						</div>
                    </div>
			
					<div class="row py-2">
                        <div class="col-sm-2">
                            <img style="width:100%;" src = "//globalmethane.org/images/doc_thumbs/jpeg/SWEET.png" />
						</div>
                        <div class="col-sm-10">
                            <div class="float-right"><i class="fa fa-tools fa-2x"></i></div>
                            <h4><a href='../resources/details.aspx?resourceid=4758'>Solid Waste Emissions Estimation Tool (SWEET) (2020)</a></h4>
							<p>SWEET is a free Excel tool created by the Waste Initiative. SWEET helps users scope emissions sources such as waste collection and transportation, open burning, landfill gas collection systems, organic waste management projects, waste handling equipment (e.g., bulldozers), and waste incineration facilities. It estimates waste sector emissions including methane, black carbon, and several other pollutants. It also evaluates emissions reduction benefits of multiple alternative waste management scenarios.</p>
						</div>
                    </div>
                    <div class="row py-2">
                        <div class="col-sm-2">
                            <img style="width:100%;" src = "//globalmethane.org/images/doc_thumbs/jpeg/organEcs.png" />
						</div>
                        <div class="col-sm-10">
                            <div class="float-right"><i class="fa fa-tools fa-2x"></i></div>
                            <h4><a href='../resources/details.aspx?resourceid=4757'>OrganEcs (2016)</a></h4>
							<p>OrganEcs aims to help local decision makers in their first evaluation of different treatment options (e.g., composting options and/or anaerobic digestion options). OrganEcs helps users determine the economic feasibility of waste management scenarios by calculating tipping fees, sales of products (e.g., organic compost), and the internal rate of return. OrganEcs use requires expert support.</p>
						</div>
                    </div>
                    <div class="row py-2">
                        <div class="col-sm-2">
                            <img style="width:100%;max-height:200px;object-fit: cover;" src = "//globalmethane.org/images/doc_thumbs/JPEG/BioWATT_v1-0_FINAL_1-27-16.jpg" />
						</div>
                        <div class="col-sm-10">
                            <div class="float-right"><i class="fa fa-tools fa-2x"></i></div>
                            <h4><a href="../resources/details.aspx?resourceid=1913">Biogas Wastewater Assessment Technology Tool (BioWATT) (2016)</a></h4>
							<p>The Biogas Wastewater Assessment Technology Tool (BioWATT) provides a quick and preliminary assessment of wastewater-to-energy projects. Through BioWATT, users can receive a specific summary of their biogas production estimates for various wastewater-to-energy technologies, electricity generation potential from the produced biogas, greenhouse gas savings associated with biogas-generated electricity, and more.</p>
						</div>
                    </div>


                    <div class="row py-2">
                        <div class="col-sm-2">
                            <img style="width:100%;" src = "assets/images/thumb_lfge-pdh.png" />
						</div>
                        <div class="col-sm-10">
                            <div class="float-right"><i class="fa fa-tools fa-2x"></i></div>
                            <h4><a href='../resources/details.aspx?resourceid=1980'>International Best Practices Guide for Landfill Gas Energy Projects (2012)</a></h4>
							<p>Global Methane Initiative’s (GMI) International Best Practices Guide for Landfill Gas Energy Projects provides a broad overview of the development process for LFGE projects in international settings and presents the technological, economic and political considerations that typically affect the success of LFGE projects. The goal of the guide is to encourage environmentally and economically sound LFGE projects by connecting stakeholders with available information, tools and services. The guide is not intended to provide a step-by-step protocol for project development.</p>
						</div>
                    </div>


		    <div class="row py-2">
                        <div class="col-sm-2">
                            <img style="width:100%;" src = "assets/images/thumb_central-europe-lfg-model.png" />
						</div>
                        <div class="col-sm-10">
                            <div class="float-right"><i class="fa fa-tools fa-2x"></i></div>
                            <h4><a href='../resources/details.aspx?resourceid=5000'>Central and Eastern Europe Landfill Gas Model</a></h4>
							<p>The Model can be used to estimate landfill gas generation rates from SWD sites, and potential landfill gas recovery rates for disposal sites that have, or plan to have, gas collection and control systems and are located in Central or Eastern European countries. The Model also may be used for SWD sites in other countries which experience similar site conditions and climate, and have waste composition data.</p>
							<p><a href='../resources/details.aspx?resourceid=5001'>User Manual</a></p>
						</div>
                    </div>


		    <div class="row py-2">
                        <div class="col-sm-2">
                            <img style="width:100%;" src = "assets/images/thumb_colombia-lfg-model.png" />
						</div>
                        <div class="col-sm-10">
                            <div class="float-right"><i class="fa fa-tools fa-2x"></i></div>
                            <h4><a href='../resources/details.aspx?resourceid=2058'>Colombia Landfill Gas Model</a></h4>
							<p>The Model can be used to estimate landfill gas generation rates from landfills, and potential landfill gas recovery rates for landfills that have, or plan to have, gas collection and control systems in Colombia.</p>
							<p><a href='../resources/details.aspx?resourceid=2061'>User Manual</a></p>
							<p>Spanish Version: <a href='../resources/details.aspx?resourceid=2059'>Colombia Landfill Gas Model</a> and <a href='../resources/details.aspx?resourceid=2060'>User Manual</a></p>
						</div>
                    </div>


                </section>
	<section class="py-5 bg-white">
		<div class="container">
			<h2 id="resources">Recent Resources</h2>
				  <p>For a complete list of available biogas resources, including technical documents, presentations, and tools, please visit the resources page. </p>
				  <p><a href="../resources/index.aspx?sector=biogas" role="button" class="btn btn-outline-primary">View all biogas resources</a></p>
			
				
				  	<div class="row py-2">
                        <div class="col-sm-2">
                            <img style="width:100%;" src = "//globalmethane.org/images/doc_thumbs/jpeg/cover.PNG" />
						</div>
                        <div class="col-sm-10">
                            <div class="float-right"><i class="fa fa-file fa-2x"></i></div> 
							<h4><a href='../resources/details.aspx?resourceid=4917'>Market Opportunities for Anaerobic Digestion of Livestock and Agro-Industrial Wastes in India (2020)</a></h4>
							<p>The report on the <b>Market Opportunities for Anaerobic Digestion of Livestock and Agro-Industrial Wastes in India</b> will help inform project developers, policymakers, and other interested stakeholders about the potential for biogas capture and use in India.  The report estimates biogas production and emission reduction potential from India’s largest agricultural sectors, and it includes an overview of the uses of biogas and digestate, current biogas policies, technology options, and business models relevant for India. 
                            </p>
						</div>
                    </div>
                    <div class="row py-2">
                        <div class="col-sm-2">
                            <img style="width:100%;" src = "//globalmethane.org/images/doc_thumbs/jpeg/Sludge_thumbnail.jpg" />
						</div>
                        <div class="col-sm-10">
                            <div class="float-right"><i class="fa fa-file fa-2x"></i></div> 
                            <h4><a href='../resources/details.aspx?resourceid=4780'>Scaling Sludge Mountains: Breaking Down Barriers for Chinese Cities to Turn Sludge Waste into Energy (2019)</a></h4>
							<p>The Wilson Center’s China Environment Forum (CEF) produced this sludge scoping report for the U.S. EPA and the Global Methane Initiative. The report describes drivers that created mountains of municipal sludge, introduces key political and research entities involved in sludge regulation in China, reviews obstacles in adoption of anaerobic digestion, provides a case study of the challenges facing sludge-to-energy projects, and highlights opportunities for U.S. government, cities, and companies to engage with Chinese government agencies. </p>
						</div>
                    </div>
                    <div class="row py-2">
                        <div class="col-sm-2">
                            <img style="width:100%;" src = "//globalmethane.org/images/doc_thumbs/jpeg/CCAC video thumbnail.JPG" />
						</div>
                        <div class="col-sm-10">
                            <div class="float-right"><i class="fa fa-file fa-2x"></i></div> 
                            <h4><a href='../resources/details.aspx?resourceid=4781'>Naucalpan, Mexico Waste Characterization Study (2019)</a></h4>
							<p>In March 2017, the U.S. Environmental Protection Agency – as a lead partner in the Waste Initiative – conducted a waste characterization study at the municipality’s transfer station. The study indicated that approximately 69% of the waste handled at the transfer station could be recycled or otherwise diverted from the landfill, and that more than half of the waste could be used as feedstock in composting or anaerobic digestion projects. The municipality is using the results of the study to inform decision making about the project design and procurement options.</p>
						</div>
                    </div>
                    <div class="row py-2">
                        <div class="col-sm-2">
                            <img style="width:100%;" src = "//globalmethane.org/images/doc_thumbs/JPEG/Farm_to_Table_Thumbnail.png" />
						</div>
                        <div class="col-sm-10">
                            <div class="float-right"><i class="fa fa-file fa-2x"></i></div> 
                            <h4><a href='../resources/details.aspx?resourceid=4789'>From Farm to Table to Energy: Co-digesting China’s Urban Food Waste in Wastewater Treatment Plants (2019)</a></h4>
							<p>Prepared by the Wilson’s Center China Environment Forum with assistance provided by GMI, the report highlights food waste trends in Chinese cities and assesses the possibilities of redirecting food waste to municipal wastewater (MWW) and sludge-to-energy (StE) plants. This report also highlights some specific gaps that GMI and other organizations could help fill and potential Chinese partners to engage with to highlight the environmental and economic benefits of co-digestion.</p>
						</div>
                    </div>
                    <div class="row py-2">
                        <div class="col-sm-2">
                            <img style="width:100%;" src = "//globalmethane.org/images/doc_thumbs/jpeg/resource_biogas_introduction_20Mar2018.JPG" />
						</div>
                        <div class="col-sm-10">
                            <div class="float-right"><i class="fa fa-film fa-2x"></i></div>
							<h4><a href='../resources/details.aspx?resourceid=4735'>Biogas Done Right - Introduction (2019)</a></h4>
							<p>Jorge Hilbert explains and introduces the importance of biogas in the agricultural sector, while additionally explaining biogas&rsquo;s potential for increasing future energy efficiency and technological sustainability.</p>
						</div>
                    </div>
                    <div class="row py-2">
                        <div class="col-sm-2">
                            <img style="width:100%;" src = "//globalmethane.org/images/doc_thumbs/jpeg/AD101_DZVem4BJln8.png" />
						</div>
                        <div class="col-sm-10">
                            <div class="float-right"><i class="fa fa-film fa-2x"></i></div>
							<h4><a href='../resources/details.aspx?resourceid=4742'>Using Animal Manure as a Resource (2019)</a></h4>
							<p>Anaerobic digestion, or AD, is the biological process that breaks down biological materials like compost or manure into biogas. Livestock manure accounts for 3 percent of man-made methane emissions globally. Methane, when captured and stored, can be used to generate electricity and heat, or it can be processed into natural gas fuel. By capturing the biogas, we are also preventing the release of methane, one of the most potent greenhouse gases, to the atmosphere.</p>
						</div>
                    </div>
                    <div class="row py-2">
                        <div class="col-sm-2">
                            <img style="width:100%;" src = "//globalmethane.org/images/mmm_home.jpg" />
						</div>
                        <div class="col-sm-10">
                            <div class="float-right"><i class="fa fa-film fa-2x"></i></div>
							<h4><a href='../resources/details.aspx?resourceid=4741'>Methane Mitigation Matters:  Climate Change (2015)</a></h4>
							<p>Methane is a prevalent manmade greenhouse gas that traps 28 times more heat than carbon dioxide (CO2). Reducing methane emissions by recovering and using methane as a clean energy source offers many benefits for the
                            environment and local communities. This video highlights the many ways that reducing methane can benefit the environment and local communities.</p> 
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

            /*
            if ($('.Bslidediv').length > 0) {
                document.getElementById("defaultOpen").click();
            }else if($('.Cslidediv').length > 0) {
                document.getElementById("thirdOpen").click();
            }else if ($('.Ogslidediv').length > 0) {
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