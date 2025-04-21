<%@ Page Language="VB" AutoEventWireup="false" Inherits="M2M_Redesign.partners_index" Codebehind="index.aspx.vb" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Partner Countries  | Global Methane Initiative</title>
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
		
		


		
    </style>
</head>
<body>
    <!-- #include virtual="/includes/header.html" -->
    
    
	<!-- Page Content -->
    <!-- Page Content -->
    <section class="py-5 gmi-light-blue">
        <div class="container">
			<div class="row">
				<div class="col-sm-8">
                    <h1>
                        Partner Countries
                    </h1>
                    <p>GMI Partner Countries account for approximately 70 percent of global manmade methane emissions.  These countries offer special expertise and interest in developing solutions for mitigating methane emissions and using methane as a renewable energy source. As members of the GMI, Partner Countries are encouraged to develop and <a href="mailto:secretariat@globalmethane.org?subject=Partner Country Action Plan">submit to the Secretariat</a> action planning documents that outline key country activities and priorities, and provide a mechanism to advance cooperation among Partners.</p>
					<p><a role="button" class="btn btn-outline-primary" href="/documents/GMI_RevisedActionPlanningGuidance_June2013.pdf">Action Planning Guidance</a></p>

				</div>
                <div class="col-sm-4">
					<div class="border border-secondary bg-white px-0">
						<div class="py-1 text-center bg-dark text-white"><strong>On this page</strong></div>
                                <ul class="list-group py-2">
                                    <li class="list-group-item noborder nobackground py-1"><a href="#partner-countries">Countries and Year Joining GMI</a></li>
                                    <li class="list-group-item noborder nobackground py-1"><a href="#gmc">Global Methane Challenge Stories</a></li>
                                    <li class="list-group-item noborder nobackground py-1"><a href="#worldwide-emissions">Worldwide Methane Emissions</a></li>
                                </ul>
					</div>

				
                </div>
			</div>
		</div>
	</section>
    <section class="py-5 bg-white">
        <div class="container">
            <h2 id="partner-countries">
                Countries and Year Joining GMI
            </h2>
                     <div id="maincontentarea">
                        <script src="../maps/ammap/ammap.js"></script>
                        <script src="../maps/ammap/maps/js/worldHigh.js"></script>
                        <script src="../maps/ammap/plugins/export/export.min.js"></script>
                        <link rel="stylesheet" href="../maps/ammap/ammap.css" type="text/css" media="all" />
                        <link rel="stylesheet" href="../maps/ammap/plugins/export/export.css" type="text/css" media="all" />
                        <script src="../maps/ammap/themes/light.js"></script>
                        <script src="../maps/ammap/mapcodeInner.js"></script>
                        <div id="chartdiv"></div>
                    </div>				

			<div class="row">
                <div class="col-sm-3">
                    <div class="list-group-flush">
						<a class="small list-group-item gmi-list-group-hover" href='/partners/detail.aspx?c=albania'> <img src='/images/flag_albania.gif'> Albania <span class="gmi-light-blue-badge float-right">2013</span> </a>
						<a class="small list-group-item gmi-list-group-hover" href='/partners/detail.aspx?c=argentina'> <img src='/images/flag_argentina.gif'> Argentina <span class="gmi-light-blue-badge float-right">2004</span></a>
						<a class="small list-group-item gmi-list-group-hover" href='/partners/detail.aspx?c=australia'> <img src='/images/flag_australia.gif'> Australia <span class="gmi-light-blue-badge float-right">2004</span></a>
						<a class="small list-group-item gmi-list-group-hover" href='/partners/detail.aspx?c=brazil'> <img src='/images/flag_brazil.gif'> Brazil <span class="gmi-light-blue-badge float-right">2004</span></a>
						<a class="small list-group-item gmi-list-group-hover" href='/partners/detail.aspx?c=bulgaria'> <img src='/images/flag_bulgaria.gif'> Bulgaria <span class="gmi-light-blue-badge float-right">2009</span></a>
						<a class="small list-group-item gmi-list-group-hover" href='/partners/detail.aspx?c=canada'> <img src='/images/flag_canada.gif'> Canada <span class="gmi-light-blue-badge float-right">2005</span></a>
						<a class="small list-group-item gmi-list-group-hover" href='/partners/detail.aspx?c=chile'> <img src='/images/flag_chile.gif'> Chile <span class="gmi-light-blue-badge float-right">2009</span></a>
						<a class="small list-group-item gmi-list-group-hover" href='/partners/detail.aspx?c=china'> <img src='/images/flag_china.gif'> China <span class="gmi-light-blue-badge float-right">2004</span></a>
						<a class="small list-group-item gmi-list-group-hover" href='/partners/detail.aspx?c=colombia'> <img src='/images/flag_colombia.gif'> Colombia <span class="gmi-light-blue-badge float-right">2004</span></a>
						<a class="small list-group-item gmi-list-group-hover" href='/partners/detail.aspx?c=cotedivoire'> <img src='/images/flag_cotedivoire.gif'> Cote d'Ivoire <span class="gmi-light-blue-badge float-right">2018</span></a>
                        <a class="small list-group-item gmi-list-group-hover" href='/partners/detail.aspx?c=denmark'> <img src='/images/flag_denmark.gif'> Denmark <span class="gmi-light-blue-badge float-right">2022</span></a>
						<a class="small list-group-item gmi-list-group-hover" href='/partners/detail.aspx?c=dom_rep'> <img src='/images/flag_dom_rep.gif'> Dominican Republic <span class="gmi-light-blue-badge float-right">2009</span></a>
					</div>
				</div>
				<div class="col-sm-3">
                    <div class="list-group-flush">
                        <a class="small list-group-item gmi-list-group-hover" href='/partners/detail.aspx?c=ecuador'> <img src='/images/flag_ecuador.gif'> Ecuador <span class="gmi-light-blue-badge float-right">2006</span></a>
						<a class="small list-group-item gmi-list-group-hover" href='/partners/detail.aspx?c=ethiopia'> <img src='/images/flag_ethiopia.gif'> Ethiopia <span class="gmi-light-blue-badge float-right">2010</span></a>
						<a class="small list-group-item gmi-list-group-hover" href='#'> <img src='/images/flag_ec.gif'> European Commission <span class="gmi-light-blue-badge float-right">2007</span></a>
						<a class="small list-group-item gmi-list-group-hover" href='/partners/detail.aspx?c=finland'> <img src='/images/flag_finland.gif'> Finland <span class="gmi-light-blue-badge float-right">2008</span></a>
						<a class="small list-group-item gmi-list-group-hover" href='/partners/detail.aspx?c=georgia'> <img src='/images/flag_georgia.gif'> Georgia <span class="gmi-light-blue-badge float-right">2009</span></a>
						<a class="small list-group-item gmi-list-group-hover" href='/partners/detail.aspx?c=germany'> <img src='/images/flag_germany.gif'> Germany <span class="gmi-light-blue-badge float-right">2006</span></a>
						<a class="small list-group-item gmi-list-group-hover" href='/partners/detail.aspx?c=ghana'> <img src='/images/flag_ghana.gif'> Ghana <span class="gmi-light-blue-badge float-right">2010</span></a>
						<a class="small list-group-item gmi-list-group-hover" href='/partners/detail.aspx?c=india'> <img src='/images/flag_india.gif'> India <span class="gmi-light-blue-badge float-right">2004</span></a>
						<a class="small list-group-item gmi-list-group-hover" href='/partners/detail.aspx?c=indonesia'> <img src='/images/flag_indonesia.gif'> Indonesia <span class="gmi-light-blue-badge float-right">2010</span></a>
						<a class="small list-group-item gmi-list-group-hover" href='/partners/detail.aspx?c=israel'> <img src='/images/flag_israel.gif'> Israel <span class="gmi-light-blue-badge float-right">2018</span></a>
						<a class="small list-group-item gmi-list-group-hover" href='/partners/detail.aspx?c=italy'> <img src='/images/flag_italy.gif'> Italy <span class="gmi-light-blue-badge float-right">2004</span></a>
						<a class="small list-group-item gmi-list-group-hover" href='/partners/detail.aspx?c=japan'> <img src='/images/flag_japan.gif'> Japan <span class="gmi-light-blue-badge float-right">2004</span></a>
					</div>
				</div>
				<div class="col-sm-3">
                    <div class="list-group-flush">
						<a class="small list-group-item gmi-list-group-hover" href='/partners/detail.aspx?c=jordan'> <img src='/images/flag_jordan.gif'> Jordan <span class="gmi-light-blue-badge float-right">2011</span></a>
						<a class="small list-group-item gmi-list-group-hover" href='/partners/detail.aspx?c=kazakhstan'> <img src='/images/flag_kazakhstan.gif'> Kazakhstan <span class="gmi-light-blue-badge float-right">2008</span></a>
						<a class="small list-group-item gmi-list-group-hover" href='/partners/detail.aspx?c=mexico'> <img src='/images/flag_mexico.gif'> Mexico <span class="gmi-light-blue-badge float-right">2004</span></a>
						<a class="small list-group-item gmi-list-group-hover" href='/partners/detail.aspx?c=mongolia'> <img src='/images/flag_mongolia.gif'> Mongolia <span class="gmi-light-blue-badge float-right">2008</span></a>
						<a class="small list-group-item gmi-list-group-hover" href='/partners/detail.aspx?c=nicaragua'> <img src='/images/flag_nicaragua.gif'> Nicaragua <span class="gmi-light-blue-badge float-right">2010</span></a>
						<a class="small list-group-item gmi-list-group-hover" href='/partners/detail.aspx?c=nigeria'> <img src='/images/flag_nigeria.gif'> Nigeria <span class="gmi-light-blue-badge float-right">2004</span></a>
						<a class="small list-group-item gmi-list-group-hover" href='/partners/detail.aspx?c=norway'> <img src='/images/flag_norway.gif'> Norway <span class="gmi-light-blue-badge float-right">2011</span></a>
						<a class="small list-group-item gmi-list-group-hover" href='/partners/detail.aspx?c=pakistan'> <img src='/images/flag_pakistan.gif'> Pakistan <span class="gmi-light-blue-badge float-right">2008</span></a>
						<a class="small list-group-item gmi-list-group-hover" href='/partners/detail.aspx?c=peru'> <img src='/images/flag_peru.gif'> Peru <span class="gmi-light-blue-badge float-right">2010</span></a>
						<a class="small list-group-item gmi-list-group-hover" href='/partners/detail.aspx?c=philippines'> <img src='/images/flag_philippines.gif'> Philippines <span class="gmi-light-blue-badge float-right">2008</span></a>
						<a class="small list-group-item gmi-list-group-hover" href='/partners/detail.aspx?c=poland'> <img src='/images/flag_poland.gif'> Poland <span class="gmi-light-blue-badge float-right">2007</span></a>
						<a class="small list-group-item gmi-list-group-hover" href='/partners/detail.aspx?c=korea'> <img src='/images/flag_korea.gif'> Republic of Korea <span class="gmi-light-blue-badge float-right">2005</span></a>
					</div>
				</div>
				<div class="col-sm-3">
                    <div class="list-group-flush">
						<a class="small list-group-item gmi-list-group-hover" href='/partners/detail.aspx?c=russia'> <img src='/images/flag_russia.gif'> Russia <span class="gmi-light-blue-badge float-right">2004</span></a>
						<a class="small list-group-item gmi-list-group-hover" href='/partners/detail.aspx?c=saudiarabia'> <img src='/images/flag_saudi_arabia.gif'> Saudi Arabia <span class="gmi-light-blue-badge float-right">2014</span></a>
						<a class="small list-group-item gmi-list-group-hover" href='/partners/detail.aspx?c=serbia'> <img src='/images/flag_serbia.gif'> Serbia <span class="gmi-light-blue-badge float-right">2010</span></a>
						<a class="small list-group-item gmi-list-group-hover" href='/partners/detail.aspx?c=srilanka'> <img src='/images/flag_srilanka.gif'> Sri Lanka <span class="gmi-light-blue-badge float-right">2011</span></a>
						<a class="small list-group-item gmi-list-group-hover" href='/partners/detail.aspx?c=thailand'> <img src='/images/flag_thailand.gif'> Thailand <span class="gmi-light-blue-badge float-right">2008</span></a>
						<a class="small list-group-item gmi-list-group-hover" href='/partners/detail.aspx?c=turkey'> <img src='/images/flag_turkey.gif'> Turkey <span class="gmi-light-blue-badge float-right">2010</span></a>
						<a class="small list-group-item gmi-list-group-hover" href='/partners/detail.aspx?c=ukraine'> <img src='/images/flag_ukraine.gif'> Ukraine <span class="gmi-light-blue-badge float-right">2004</span></a>
						<a class="small list-group-item gmi-list-group-hover" href='/partners/detail.aspx?c=uk'> <img src='/images/flag_uk.gif'> United Kingdom <span class="gmi-light-blue-badge float-right">2004</span></a>
						<a class="small list-group-item gmi-list-group-hover" href='partner-country-detail.html'> <img src='/images/flag_us.gif'> United States <span class="gmi-light-blue-badge float-right">2004</span></a>
						<a class="small list-group-item gmi-list-group-hover" href='/partners/detail.aspx?c=vietnam'> <img src='/images/flag_vietnam.gif'> Vietnam <span class="gmi-light-blue-badge float-right">2017</span></a>
					</div>
				</div>


             </div>
			
			
		</div>
	</section>	
	<section class="py-5">
        <div class="container">
			<div class="row">
				<div class="col-sm-4">
                    <h2 id="gmc">
                        Global Methane Challenge Stories
                    </h2>
                    <p>The Global Methane Challenge is an international campaign to catalyze ambitious action around the world to reduce methane emissions and highlight policies and technologies being used to recover and use methane. Explore the stories to the right or visit the <a href="../challenge">Global Methane Challenge</a> website to learn more.</p>
				</div>
				<div class="col-sm-8" style="background-image: linear-gradient(#3F4F87, #1D85B9);">
					<p style="text-align:center;color:white;padding-top:5px;font-weight:bold;">Check out these Global Methane Challenge stories</p>
                            <div class="Countrytab">
                                <button class="Countrytablinks" onclick="openSector(event, 'BiogasTab')" id="defaultOpen">Biogas</button>
                                <button class="Countrytablinks" onclick="openSector(event, 'CoalTab')" id="thirdOpen">Coal</button>
                                <button class="Countrytablinks" onclick="openSector(event, 'OilgasTab')" id="secondOpen">Oil & Gas</button>
                                <button class="Countrytablinks" onclick="openSector(event, 'MultipleTab')" id="firstOpen">Cross-Sector</button>

                            </div>

                            <!-- Tab content -->
                            <div id="BiogasTab" class="Countrytabcontent">
                                            <div id="Bslider" class="Bslider" style="display:block;">

                                                    <div Class='Bslidediv'><a href='https://globalmethane.org/challenge/iitd.html'><img src='/images/gmc-thumbs/iitd.png' style='float:left;'></a><a href='https://globalmethane.org/challenge/iitd.html'><h3>Indian Institute of Technology Delhi</h3></a><br /><p>The Indian Institute of Technology Delhi (IITD) is committed to contributing innovative scientific and technical education and research to India and the world and serving as a valuable biogas resource for industry and society.</p><br /><a style = 'float:right;' Class='btn btn-primary' href='https://globalmethane.org/challenge/iitd.html'>Read More...</a></div>

                                                    <div Class='Bslidediv'><a href='https://globalmethane.org/challenge/gemidan.html'><img src='/images/gmc-thumbs/gemedian.png' style='float:left;'></a><a href='https://globalmethane.org/challenge/gemidan.html'><h3>Gemedian Ecogi A/S</h3></a><br /><p>Gemidan Ecogi A/S operates three food-waste pre-treatment systems in Denmark that treat food waste to produce a high-quality pulp (“bio-pulp”) for centralized anaerobic digester facilities.</p><br /><a style = 'float:right;' Class='btn btn-primary' href='https://globalmethane.org/challenge/gemidan.html'>Read More...</a></div>

                                                    <div Class='Bslidediv'><a href='https://globalmethane.org/challenge/solucycle.html'><img src='/images/gmc-thumbs/solucycle.png' style='float:left;'></a><a href='https://globalmethane.org/challenge/solucycle.html'><h3>Solucycle</h3></a><br /><p>Solucycle manages food waste with their SoluRobot technology. The system allows restaurants and caterers to divert organic waste matter to biogas facilities and track greenhouse gas reductions.</p><br /><a style = 'float:right;' Class='btn btn-primary' href='https://globalmethane.org/challenge/solucycle.html'>Read More...</a></div>

                                                    <div Class='Bslidediv'><a href='https://globalmethane.org/challenge/sourcefacilitybiocity.html'><img src='/images/gmc-thumbs/source-facility.png' style='float:left;'></a><a href='https://globalmethane.org/challenge/sourcefacilitybiocity.html'><h3>Source Facility and BioCity</h3></a><br /><p>Source Facility and BioCity partnered to address operational challenges of biogas systems in India. Together, they provide local communities with 2,500 kg of compressed biogas per day and help to meet fertilizer needs in rural and urban India. </p><br /><a style = 'float:right;' Class='btn btn-primary' href='https://globalmethane.org/challenge/sourcefacilitybiocity.html'>Read More...</a></div>

												
								</div>
                            </div>

                            <div id="CoalTab" class="Countrytabcontent">
                                			<div id="Cslider" class="Cslider">

                                                  <div Class='Cslidediv'><a href='https://globalmethane.org/challenge/francaise.html'><img src='/images/gmc-thumbs/francaise-de-l-energie.png' style='float:left;'></a><a href='https://globalmethane.org/challenge/francaise.html'><h3>La Française de l’Energie</h3></a><br /><p>La Française de l’Energie (LFDE) assessed and identified practical options to recover and utilize the gas from Northern France’s abandoned coal mines. Annual methane emissions reductions for LFDE’s project are estimated at 602,000 TCO<sub>2</sub>e.</p><br /><a style = 'float:right;' Class='btn btn-primary' href='https://globalmethane.org/challenge/francaise.html'>Read More...</a></div>

                                                  <div Class='Cslidediv'><a href='https://globalmethane.org/challenge/hydraulic.html'><img src='/images/gmc-thumbs/kuznetsk.png' style='float:left;'></a><a href='https://globalmethane.org/challenge/hydraulic.html'><h3>Hydraulic Fracturing of Kuznetsk LLC</h3></a><br /><p>Hydraulic Fracturing of Kuznetsk, LLC is working to reduce methane emissions in Russia through the development of a technology that increases the efficiency of degassing systems in modern coal mines.</p><br /><a style = 'float:right;' Class='btn btn-primary' href='https://globalmethane.org/challenge/hydraulic.html'>Read More...</a></div>

                                                  <div Class='Cslidediv'><a href='https://globalmethane.org/challenge/poland.html'><img src='/images/gmc-thumbs/poland-cmm.png' style='float:left;'></a><a href='https://globalmethane.org/challenge/poland.html'><h3>Poland International Centre of Excellence on Coal Mine Methane</h3></a><br /><p>Poland created the International Centre of Excellence on Coal Mine Methane (ICE-CMM) to support the Group of Experts on CMM in its capacity-building activities.</p><br /><a style = 'float:right;' Class='btn btn-primary' href='https://globalmethane.org/challenge/poland.html'>Read More...</a></div>

                                                  <div Class='Cslidediv'><a href='https://globalmethane.org/challenge/cbm.html'><img src='/images/gmc-thumbs/india-cmm-cbm.png' style='float:left;'></a><a href='https://globalmethane.org/challenge/cbm.html'><h3>India CBM Clearinghouse</h3></a><br /><p>The India CMM/CBM Clearinghouse addresses barriers to methane utilization projects in India. Several commercial CMM/CBM projects are scheduled to be implemented in 2020.</p><br /><a style = 'float:right;' Class='btn btn-primary' href='https://globalmethane.org/challenge/cbm.html'>Read More...</a></div>
												
												
											</div>
                            </div>

                            <div id="OilgasTab" class="Countrytabcontent">
                                            <div id="Ogslider" class="Ogslider">
                                                 <div class="Ogslidediv">
                                                    <img src="images/gmc-thumbs/unep-gma.png" style='float:left;'/>
                                                    <a href="https://globalmethane.org/challenge/gma.html">
                                                        <h3>UNEP: Global Methane Alliance</h3>
                                                    </a>
                                                    <br />
                                                    The GMA gathers international organizations, non-governmental organizations, financing institutions, and oil and gas companies to support countries in setting ambitious methane reduction targets for the oil and gas industry.<br />
                                                    <a style="float: right;" class="btn btn-primary" href="https://globalmethane.org/challenge/gma.html">Read More...</a>
                                                </div>
                                                <div class="Ogslidediv">
                                                    <img src="images/gmc-thumbs/unep-methane-science-studies.png" style='float:left;'/>
                                                    <a href="https://globalmethane.org/challenge/methanestudies.html">
                                                        <h3>UNEP: Methane Science Studies </h3>
                                                    </a>
                                                    <br />
                                                    The results of ongoing and future methane science studies will improve understanding of methane emissions at a global level, allowing industry, governments, and other stakeholders to prioritize actions to reduce methane emissions.<br />
                                                    <a style="float: right;" class="btn btn-primary" href="https://globalmethane.org/challenge/methanestudies.html">Read More...</a>
                                                </div>
                                                <div class="Ogslidediv">
                                                    <img src="images/gmc-thumbs/ogmp.png" style='float:left;'/>
                                                    <a href="https://globalmethane.org/challenge/ogmp.html">
                                                        <h3>UNEP: Oil and Gas Methane Partnership</h3>
                                                    </a>
                                                    <br />
                                                    The OGMP provides a protocol to help companies manage their methane emissions from upstream oil and gas operations and offers a credible platform to help member companies demonstrate reductions to industry stakeholders.<br />
                                                    <a style="float: right;" class="btn btn-primary" href="https://globalmethane.org/challenge/ogmp.html">Read More...</a>
                                                </div>
                                            </div>
                            </div>

                            <div id="MultipleTab" class="Countrytabcontent">

                                            <div id="Mslider" class="Mslider">

                                                    <div Class='Mslidediv'><a href='https://globalmethane.org/challenge/canada.html#menu4'><img src='/images/gmc-thumbs/canada-international.png' style='float:left;'></a><a href='https://globalmethane.org/challenge/canada.html#menu4'><h3>International Collaboration to Address Methane Emissions</h3></a><br /><p>Environment and Climate Change Canada is working to establish collaborative relationships with several international partners, including Vietnam, Senegal, Côte d’Ivoire, Chile, China, and Mexico. </p><br /><a style = 'float:right;' Class='btn btn-primary' href='https://globalmethane.org/challenge/canada.html#menu4'>Read More...</a></div>

                                                    <div Class='Mslidediv'><a href='https://globalmethane.org/challenge/haug.html'><img src='/images/gmc-thumbs/haug-sauer.png' style='float:left;'></a><a href='https://globalmethane.org/challenge/haug.html'><h3>HAUG Sauer Kompressoren AG</h3></a><br /><p>HAUG Sauer Kompressoren AG produces oil-free and dry-running piston compressors that allow systems to emit zero methane emissions.  The estimated emission reductions for each compressor installed at a typical natural gas station is approximately 1,634 TCO<sub>2</sub>e per year.</p><br /><a style = 'float:right;' Class='btn btn-primary' href='https://globalmethane.org/challenge/haug.html'>Read More...</a></div>

                                                    <div Class='Mslidediv'><a href='https://globalmethane.org/challenge/edl.html'><img src='/images/gmc-thumbs/edl.png' style='float:left;'></a><a href='https://globalmethane.org/challenge/edl.html'><h3>Energy Developments PTY Limited</h3></a><br /><p>Energy Development Limited’s actions have reduced methane emissions by 19 million tons of CO<sub>2</sub>e annually. This equates to removing approximately 5.7 million cars from the road every year. </p><br /><a style = 'float:right;' Class='btn btn-primary' href='https://globalmethane.org/challenge/edl.html'>Read More...</a></div>

                                                    <div Class='Mslidediv'><a href='https://globalmethane.org/challenge/usa.html'><img src='/images/gmc-thumbs/us-domestic.png' style='float:left;'></a><a href='https://globalmethane.org/challenge/usa.html'><h3>Domestic Methane Partnership Programs</h3></a><br /><p>The U.S. Environmental Protection Agency (EPA) has implemented several voluntary programs to promote cost-effective recovery and use of methane. EPA shares the expertise and experience gained through the voluntary domestic programs as part of its commitment to the Global Methane Initiative. </p><br /><a style = 'float:right;' Class='btn btn-primary' href='https://globalmethane.org/challenge/usa.html'>Read More...</a></div>
												
												
											</div>

                            </div>
				
				
				
				
				
				</div>
			</div>
		</div>
	</section>
	<section class="py-5 bg-white">
                <!-- Container (Global Statistics Section) -->
        <div id="matters" class="container">
			<h2 id="worldwide-emissions">Worldwide Methane Emissions by GMI Partner Countries<br><small class="text-muted">Biogas, Coal Mines, and Oil & Gas Sectors</small></h2>
            <div id="emissions" class="row">               
                 <div class="col-md-6">
                     The charts illustrate the projected emissions of methane in GMI partner countries through 2050.  These data were extracted from the U.S. Environmental Protection Agency (U.S. EPA) report, <a href="https://www.epa.gov/global-mitigation-non-co2-greenhouse-gases." target="_blank">Global Non-CO<sub>2</sub> Greenhouse Gas Emission Projections & Mitigation Potential: 2015-2050</a>. This page presents only data for methane emissions within the industry sectors targeted by GMI:  Biogas, Coal Mines, and Oil & Gas.  Additional data are available from the <a href="https://cfpub.epa.gov/ghgdata/nonco2/" target="_blank">U.S EPA’s Non-CO<sub>2</sub> Greenhouse Gas Data Tool</a>.
                 </div>
                 <div class="col-md-6">

                 	<a href="../methane-emissions-data.aspx"><img style="width:100%;" src="images/chart.PNG" /></a><br /><a href="../methane-emissions-data.aspx">Explore methane emissions measurements and projections</a> throughout the world in our interactive dashboard.


				</div>
            </div>
            <!--
            <div class="row py-3">
                <div class="col-md-4">
					<h2>Biogas Methane Emissions</h2>
                 	<p class="py-5">[insert chart]</p>   
					Chart shows the projected total amount of annual methane emissions through 2050 in all GMI Partner Countries for the Biogas sector. Data are shown for manure management, municipal solid waste, and wastewater.
				</div>
                <div class="col-md-4">
					<h2>Coal Mines Methane Emissions</h2>
                 	<p class="py-5">[insert chart]</p>   
					Chart shows the projected total amount of annual methane emissions through 2050 in all GMI Partner Countries for the Coal Mines sector. Data are shown for surface mines and underground mines.
				</div>
                <div class="col-md-4">
					<h2>Oil & Gas Methane Emissions</h2>
                 	<p class="py-5">[insert chart]</p>   
					Chart shows the projected total amount of annual methane emissions through 2050 in all GMI Partner Countries for the Oil & Gas sector.
				</div>
            </div>
            -->
        </div>
	</section>



	
	<button onclick="topFunction()" class="btn btn-dark btn-sm" id="btnToTop" title="Go to top"><i class="fa fa-chevron-up" aria-hidden="true"></i> Top</button>
	
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


            if ($('.Bslidediv').length > 0) {
                document.getElementById("defaultOpen").click();
            } else if ($('.Cslidediv').length > 0) {
                document.getElementById("thirdOpen").click();
            } else if ($('.Ogslidediv').length > 0) {
                document.getElementById("secondOpen").click();
            } else if ($('.Mslidediv').length > 0) {
                document.getElementById("firstOpen").click();
            }


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