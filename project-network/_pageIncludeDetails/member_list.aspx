<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="member_list.aspx.vb" Inherits="M2M_Redesign.member_list" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Members | Project Network | Global Methane Initiative</title>
     <!-- #include virtual="/includes/include_head.html" -->
		<style>
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

		
		.lightblue{
    /*
	background-color:#e1e1e1;
    padding:3px;
    margin:2px;
    border-radius:4px;
	*/
}
		.lightblue::after{
			content:"\A";
			white-space:pre;
		}

.yadcf-filter-reset-button{
    background-color:rgba(0,0,0,0);
    border:0;
    height:20px!important;
    margin-left:2px;
}
				
    </style>
</head>
<body>
    <!-- #include virtual="/includes/header.html" -->
        <!-- -->
	<section class="py-5 gmi-light-blue">
		<div class="container">

		        <div class="row">
		            <div class="col-sm-8">
					<h1 id="members">Project Network Members</h1>
					<p>GMI can help connect organizations with similar interests to exchange information. Search, sort and filter the table below to identify Project Network members. Click on the member's name to view more information.</p>
		            </div>
		            <div class="col-sm-4">
		                <div class="border border-secondary bg-white px-0">
		                    <div class="py-1 text-center bg-dark text-white"><strong>Learn More</strong></div>
		                    <ul class="list-group py-2">
		                        <li class="list-group-item noborder nobackground py-1"><a href="index.aspx">About the Project Network</a></li>
		                        <li class="list-group-item noborder nobackground py-1"><a href="join.aspx">Join Now</a></li>
		                    </ul>
		                </div>
		            </div>
		        </div>

		</div>
	</section>
	<section class="py-5 bg-white">
		<div class="container">

            			<div class="row">
				<div class="col-sm-4">
					<strong>Area of Interest</strong>
					<div id="external_filter_interest"></div>
				</div>
				<div class="col-sm-4">
					<strong>Organization Type</strong>
					<div id="external_filter_orgtype"></div>
				</div>
				<div class="col-sm-4">
					<strong>Country</strong>
					<div id="external_filter_country"></div>
				</div>
			</div>
<table id="PNtable" class="table display responsive dataTable no-footer dtr-inline" role="grid" aria-describedby="PNtable_info" style="width: 1110px;">
						

                           
	
        <thead>							<tbody><tr><td><a href="details.aspx?ID=a0AA0000002qfdDMAQ"> 4RCap Holdings Ltd.</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">MSW</span><span class="label lightblue">Oil &amp; Gas</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Europe</span><span class="label  lightblue">Russia</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfdJMAQ"> Abatement Solutions - Asia Pacific</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">Coal Mines</span><span class="label lightblue">MSW</span><span class="label lightblue">Oil &amp; Gas</span><span class="label lightblue">Other</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Australia</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfqmMAA"> ABB Measurement &amp; Analytics</a></td> 
            <td><span class="label lightblue">Coal Mines</span><span class="label lightblue">MSW</span><span class="label lightblue">Oil &amp; Gas</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">United States</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfdKMAQ"> Abbott Energy &amp; Environment Consulting, Inc.</a></td> 
            <td><span class="label lightblue">MSW</span><span class="label lightblue">Oil &amp; Gas</span><span class="label lightblue">Wastewater</span><span class="label lightblue">All GMI Topics</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Pakistan</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfdMMAQ"> Abhirutu Consultants</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">Coal Mines</span><span class="label lightblue">MSW</span><span class="label lightblue">Oil &amp; Gas</span><span class="label lightblue">Wastewater</span><span class="label lightblue">Biogas</span><span class="label lightblue">All GMI Topics</span></td>
            <td>Financial Institution</td>
            <td><span class="label  lightblue">Partnership-wide</span><span class="label  lightblue">Asia</span><span class="label  lightblue">India</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AG000000fCt1gMAC"> Abt Associates</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">Coal Mines</span><span class="label lightblue">MSW</span><span class="label lightblue">Oil &amp; Gas</span><span class="label lightblue">Wastewater</span><span class="label lightblue">Other</span><span class="label lightblue">Biogas</span><span class="label lightblue">All GMI Topics</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Partnership-wide</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfdVMAQ"> Access Energy, LLC</a></td> 
            <td><span class="label lightblue">Coal Mines</span><span class="label lightblue">MSW</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">United States</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AG00000094xfsMAA"> ACOI, Inc.</a></td> 
            <td><span class="label lightblue">Oil &amp; Gas</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Partnership-wide</span><span class="label  lightblue">North America</span><span class="label  lightblue">United States</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfdXMAQ"> Acterra Group, Inc.</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">MSW</span><span class="label lightblue">Other</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">United States</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfdYMAQ"> ADAS UK Ltd</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">Other</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">United Kingdom</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfdZMAQ"> Adsorptech Inc.</a></td> 
            <td><span class="label lightblue">Coal Mines</span><span class="label lightblue">MSW</span><span class="label lightblue">Oil &amp; Gas</span><span class="label lightblue">Other</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">United States</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfdbMAA"> Advanced Resources International, Inc. (ARI)</a></td> 
            <td><span class="label lightblue">Coal Mines</span><span class="label lightblue">MSW</span><span class="label lightblue">Oil &amp; Gas</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Partnership-wide</span><span class="label  lightblue">United States</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfddMAA"> Advantage Environmental Technologies</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">Other</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">United States</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfdhMAA"> AESEDA, Penn State University</a></td> 
            <td><span class="label lightblue">MSW</span><span class="label lightblue">Oil &amp; Gas</span></td>
            <td>Research</td>
            <td><span class="label  lightblue">United States</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfdiMAA"> Africa Initiative For Environment Sustainable Netw</a></td> 
            <td><span class="label lightblue">MSW</span><span class="label lightblue">Oil &amp; Gas</span></td>
            <td>Other</td>
            <td><span class="label  lightblue">Nigeria</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfdjMAA"> African Centre for Sustainanble Energy Technologie</a></td> 
            <td><span class="label lightblue">MSW</span><span class="label lightblue">Oil &amp; Gas</span><span class="label lightblue">Other</span></td>
            <td>Research</td>
            <td><span class="label  lightblue">Nigeria</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfdkMAA"> AGAMA Biogas</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">MSW</span><span class="label lightblue">Wastewater</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Africa</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfdmMAA"> AgE Tecnologias Meio Ambiente, Saneam. &amp; Ambiência</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">Coal Mines</span><span class="label lightblue">MSW</span><span class="label lightblue">Wastewater</span><span class="label lightblue">Other</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Brazil</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfdpMAA"> AgRefresh</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">Oil &amp; Gas</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">United States</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfdsMAA"> Agricultural Engineering Associates, Inc.</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">Other</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">United States</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AG000000CKz1vMAD"> Agroenergy</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">MSW</span></td>
            <td>NGO</td>
            <td><span class="label  lightblue">Partnership-wide</span><span class="label  lightblue">Europe</span><span class="label  lightblue">Italy</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfduMAA"> Agrogreen Asia</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">Biogas</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Partnership-wide</span><span class="label  lightblue">Asia</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfe1MAA"> AISU</a></td> 
            <td><span class="label lightblue">Coal Mines</span><span class="label lightblue">MSW</span><span class="label lightblue">Oil &amp; Gas</span></td>
            <td>Other</td>
            <td><span class="label  lightblue">United States</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfe4MAA"> Akeida Capital Management</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">Coal Mines</span><span class="label lightblue">MSW</span><span class="label lightblue">Oil &amp; Gas</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Partnership-wide</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0At00000036IPXEA2"> Aleres</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">MSW</span><span class="label lightblue">Wastewater</span><span class="label lightblue">Biogas</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Latin America</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfe6MAA"> Alkane Energy plc</a></td> 
            <td><span class="label lightblue">Coal Mines</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">United Kingdom</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfe9MAA"> Aloe Private Equity</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">Coal Mines</span><span class="label lightblue">MSW</span><span class="label lightblue">Oil &amp; Gas</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Asia</span><span class="label  lightblue">United Kingdom</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfeAMAQ"> Al-Qasim Foundation</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">Coal Mines</span></td>
            <td>Other</td>
            <td><span class="label  lightblue">Asia</span><span class="label  lightblue">Pakistan</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfeBMAQ"> AlterLat Energia Alternativa de Latinoamerica</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">Coal Mines</span><span class="label lightblue">MSW</span><span class="label lightblue">Oil &amp; Gas</span><span class="label lightblue">Other</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">North America</span><span class="label  lightblue">South America</span><span class="label  lightblue">Mexico</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AG000000815hcMAA"> Alterna</a></td> 
            <td><span class="label lightblue">Agriculture</span></td>
            <td>NGO</td>
            <td><span class="label  lightblue">South America</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AG000000cKTj8MAG"> Alterna Verde</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">Wastewater</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Asia</span><span class="label  lightblue">Philippines</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AG000000g2LZDMA2"> AmbiSense, Ltd.</a></td> 
            <td><span class="label lightblue">MSW</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Partnership-wide</span><span class="label  lightblue">Europe</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfeFMAQ"> Ameresco, Inc.</a></td> 
            <td><span class="label lightblue">Agriculture</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">United States</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfeGMAQ"> American Petroleum Institute (API)</a></td> 
            <td><span class="label lightblue">MSW</span><span class="label lightblue">Oil &amp; Gas</span></td>
            <td>Other</td>
            <td><span class="label  lightblue">United States</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0At0000002xny1EAA"> Ammongas A/S</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">MSW</span><span class="label lightblue">Wastewater</span><span class="label lightblue">Biogas</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Partnership-wide</span><span class="label  lightblue">Australia/Oceania</span><span class="label  lightblue">Europe</span><span class="label  lightblue">North America</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfeJMAQ"> Anagha Datta Trade</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">Coal Mines</span><span class="label lightblue">Oil &amp; Gas</span><span class="label lightblue">Other</span><span class="label lightblue">Biogas</span><span class="label lightblue">All GMI Topics</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Partnership-wide</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AG000000818t5MAA"> Andean Co.</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">MSW</span><span class="label lightblue">Oil &amp; Gas</span><span class="label lightblue">Other</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Partnership-wide</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AG000000Hp1jNMAR"> Anguil Environmental Systems, Inc.</a></td> 
            <td><span class="label lightblue">Coal Mines</span><span class="label lightblue">MSW</span><span class="label lightblue">Oil &amp; Gas</span><span class="label lightblue">Wastewater</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Partnership-wide</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfeQMAQ"> APESB</a></td> 
            <td><span class="label lightblue">MSW</span></td>
            <td>Other</td>
            <td><span class="label  lightblue">Partnership-wide</span><span class="label  lightblue">Europe</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfeRMAQ"> Apnea Srl</a></td> 
            <td><span class="label lightblue">MSW</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Italy</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfeTMAQ"> Applied GeoSolutions, LLC</a></td> 
            <td><span class="label lightblue">Agriculture</span></td>
            <td>Research</td>
            <td><span class="label  lightblue">United States</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfeUMAQ"> AquaLimpia Beratende Ingenieure</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">MSW</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Germany</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfeXMAQ"> Arc Media Global</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">Coal Mines</span><span class="label lightblue">MSW</span><span class="label lightblue">Oil &amp; Gas</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Partnership-wide</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AG000000AlqkkMAB"> ARC Technologies Corporation</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">Coal Mines</span><span class="label lightblue">MSW</span><span class="label lightblue">Oil &amp; Gas</span><span class="label lightblue">Wastewater</span></td>
            <td>Other</td>
            <td><span class="label  lightblue">Partnership-wide</span><span class="label  lightblue">North America</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0At0000000NTAYEA4"> Arcanum Energy</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">MSW</span><span class="label lightblue">Oil &amp; Gas</span><span class="label lightblue">Wastewater</span><span class="label lightblue">Other</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Partnership-wide</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfeqMAA"> Argentina Solid Waste Association (ARS)</a></td> 
            <td><span class="label lightblue">MSW</span></td>
            <td>Other</td>
            <td><span class="label  lightblue">Argentina</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfebMAA"> Argonne National Laboratory</a></td> 
            <td><span class="label lightblue">MSW</span><span class="label lightblue">Oil &amp; Gas</span><span class="label lightblue">Wastewater</span></td>
            <td>Research</td>
            <td><span class="label  lightblue">United States</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfedMAA"> Ariane Finance</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">MSW</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">United Kingdom</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfefMAA"> Armond &amp; Associates</a></td> 
            <td><span class="label lightblue">Coal Mines</span><span class="label lightblue">Other</span></td>
            <td>Research</td>
            <td><span class="label  lightblue">United States</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfelMAA"> Ashok Sansthan</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">Coal Mines</span><span class="label lightblue">MSW</span><span class="label lightblue">Oil &amp; Gas</span></td>
            <td>Other</td>
            <td><span class="label  lightblue">Partnership-wide</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfemMAA"> Asia Clean Energy Pte Ltd</a></td> 
            <td><span class="label lightblue">Coal Mines</span><span class="label lightblue">Oil &amp; Gas</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">China</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfenMAA"> Asian Development Bank (ADB)</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">Coal Mines</span><span class="label lightblue">MSW</span></td>
            <td>Financial Institution</td>
            <td><span class="label  lightblue">Philippines</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfepMAA"> Asociación Fénix</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">Biogas</span></td>
            <td>Other</td>
            <td><span class="label  lightblue">South America</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AG000000k5qd7MAA"> Association des Ong de l'Environnement (AOE)</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">Coal Mines</span><span class="label lightblue">MSW</span><span class="label lightblue">Oil &amp; Gas</span><span class="label lightblue">Wastewater</span></td>
            <td>NGO</td>
            <td><span class="label  lightblue">Africa</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qferMAA"> ATA</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">MSW</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Philippines</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfeuMAA"> Australasian Energy Pty Limited</a></td> 
            <td><span class="label lightblue">Coal Mines</span><span class="label lightblue">MSW</span><span class="label lightblue">Oil &amp; Gas</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Australia</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfevMAA"> Australian Climate Exchange</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">MSW</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Asia</span><span class="label  lightblue">Australia</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfewMAA"> Australian Coal Association</a></td> 
            <td><span class="label lightblue">Coal Mines</span></td>
            <td>Other</td>
            <td><span class="label  lightblue">Australia</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfezMAA"> Australian Lot Feeders Association</a></td> 
            <td><span class="label lightblue">Agriculture</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Australia</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qff0MAA"> Australian Petroleum Prod. &amp; Exploration Assoc.</a></td> 
            <td><span class="label lightblue">Coal Mines</span><span class="label lightblue">Oil &amp; Gas</span><span class="label lightblue">Biogas</span><span class="label lightblue">All GMI Topics</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Australia</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qff2MAA"> Avalon Consulting</a></td> 
            <td><span class="label lightblue">Coal Mines</span><span class="label lightblue">MSW</span><span class="label lightblue">Oil &amp; Gas</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">India</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qff3MAA"> Ayurvet Reserch Foundation</a></td> 
            <td><span class="label lightblue">Agriculture</span></td>
            <td>Research</td>
            <td><span class="label  lightblue">India</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qff7MAA"> BalanceCO2</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">Coal Mines</span><span class="label lightblue">MSW</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Canada</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qffAMAQ"> Bannari Amman Sugars Ltd</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">Other</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">India</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AG000000DfWwhMAF"> Bapele Green Power Resources</a></td> 
            <td><span class="label lightblue">MSW</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Partnership-wide</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qffCMAQ"> BAS Associates Consulting</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">MSW</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Nigeria</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qffHMAQ"> Beacon Generating, LLC</a></td> 
            <td><span class="label lightblue">MSW</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">United States</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AG000000818vaMAA"> BECG Global</a></td> 
            <td><span class="label lightblue">MSW</span><span class="label lightblue">Other</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Africa</span><span class="label  lightblue">Ghana</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AG000000B0chAMAR"> Beijing SinoHypro Petrochemical Tech. Co., Ltd.</a></td> 
            <td><span class="label lightblue">Coal Mines</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Partnership-wide</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qffMMAQ"> Benfam Institute of Natural Living</a></td> 
            <td><span class="label lightblue">Agriculture</span></td>
            <td>Other</td>
            <td><span class="label  lightblue">Iran</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qffOMAQ"> Berwick Manley Associates Ltd.</a></td> 
            <td><span class="label lightblue">MSW</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">United Kingdom</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qffRMAQ"> Bharat Coking Coal Limited</a></td> 
            <td><span class="label lightblue">Coal Mines</span></td>
            <td>Other</td>
            <td><span class="label  lightblue">India</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qffSMAQ"> Bhartiya Dnyanpith Bahhuudeshiya Gramin Vikas Sans</a></td> 
            <td><span class="label lightblue">Agriculture</span></td>
            <td>Other</td>
            <td><span class="label  lightblue">Partnership-wide</span><span class="label  lightblue">Asia</span><span class="label  lightblue">India</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qffYMAQ"> Bio Applications</a></td> 
            <td><span class="label lightblue">Agriculture</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Nigeria</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qffZMAQ"> BIO CDM</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">Coal Mines</span><span class="label lightblue">MSW</span><span class="label lightblue">Oil &amp; Gas</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Republic of Korea (South Korea)</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0At000000133D9EAI"> bio2energy</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">MSW</span><span class="label lightblue">Oil &amp; Gas</span><span class="label lightblue">Wastewater</span><span class="label lightblue">Biogas</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Partnership-wide</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qffaMAA"> BioAust Energy Pty Ltd</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">MSW</span></td>
            <td>Research</td>
            <td><span class="label  lightblue">Australia</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qffbMAA"> BioConstructors and Landfills Consultants</a></td> 
            <td><span class="label lightblue">MSW</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">United States</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AG0000009uFs2MAE"> Biodiversity Conservation and Protection League</a></td> 
            <td><span class="label lightblue">Agriculture</span></td>
            <td>Research</td>
            <td><span class="label  lightblue">Asia</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfffMAA"> BioEnergy Consult</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">Other</span></td>
            <td>Other</td>
            <td><span class="label  lightblue">Partnership-wide</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qffgMAA"> BioEnergy Events and Services (Bees)</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">Biogas</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">France</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qffiMAA"> Biofuels Racing Alliance</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">MSW</span><span class="label lightblue">Oil &amp; Gas</span><span class="label lightblue">Other</span></td>
            <td>Other</td>
            <td><span class="label  lightblue">Partnership-wide</span><span class="label  lightblue">North America</span><span class="label  lightblue">Brazil</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qffjMAA"> Biog Ltd</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">MSW</span><span class="label lightblue">Other</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Partnership-wide</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qffkMAA"> Biogas de Juarez</a></td> 
            <td><span class="label lightblue">MSW</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Partnership-wide</span><span class="label  lightblue">South America</span><span class="label  lightblue">Mexico</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfflMAA"> Biogas de Nicaragua</a></td> 
            <td><span class="label lightblue">Agriculture</span></td>
            <td>Research</td>
            <td><span class="label  lightblue">Nicaragua</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qffmMAA"> Biogas Energy Systems</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">Other</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">United States</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qffqMAA"> Bio-Gas Technologies, Ltd.</a></td> 
            <td><span class="label lightblue">Coal Mines</span><span class="label lightblue">Other</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">United States</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qffpMAA"> Biogas Technology Ltd</a></td> 
            <td><span class="label lightblue">Coal Mines</span><span class="label lightblue">MSW</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">United Kingdom</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0At0000002xny2EAA"> BiogasClean A/S</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">Oil &amp; Gas</span><span class="label lightblue">Wastewater</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Partnership-wide</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AG000000gSkpPMAS"> Bioland Environmental Protection Technology Group</a></td> 
            <td><span class="label lightblue">MSW</span><span class="label lightblue">Wastewater</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">China</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0At0000001jJwhEAE"> Biomass Green Fuels LLC.</a></td> 
            <td><span class="label lightblue">MSW</span><span class="label lightblue">Oil &amp; Gas</span><span class="label lightblue">Biogas</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">United States</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0At0000002N90oEAC"> Biomethane Total Solution Corporation</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">MSW</span><span class="label lightblue">Wastewater</span><span class="label lightblue">Biogas</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Partnership-wide</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qffzMAA"> Bio-Organic Catalyst, Inc.</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">MSW</span><span class="label lightblue">Oil &amp; Gas</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">United States</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfg2MAA"> Biorem</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">MSW</span><span class="label lightblue">Oil &amp; Gas</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Partnership-wide</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AG0000009wVbUMAU"> BioSphere Plastics</a></td> 
            <td><span class="label lightblue">MSW</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Partnership-wide</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0At0000004TseaEAC"> Biosphere Technologies Inc.</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">MSW</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Partnership-wide</span><span class="label  lightblue">North America</span><span class="label  lightblue">Canada</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AG000000XfWCNMA3"> Biosteris Specialties, Ltd.</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">MSW</span><span class="label lightblue">Oil &amp; Gas</span><span class="label lightblue">Wastewater</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Africa</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfg4MAA"> Biothermica Technologies, Inc.</a></td> 
            <td><span class="label lightblue">Coal Mines</span><span class="label lightblue">MSW</span><span class="label lightblue">Oil &amp; Gas</span><span class="label lightblue">Biogas</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Canada</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AG00000095rDkMAI"> Biotrix</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">MSW</span><span class="label lightblue">Other</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Partnership-wide</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0At00000035QixEAE"> Bird</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">Coal Mines</span><span class="label lightblue">MSW</span><span class="label lightblue">Oil &amp; Gas</span><span class="label lightblue">Wastewater</span><span class="label lightblue">Biogas</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">North America</span><span class="label  lightblue">Canada</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfg5MAA"> BJCECEP</a></td> 
            <td><span class="label lightblue">Coal Mines</span><span class="label lightblue">MSW</span><span class="label lightblue">Oil &amp; Gas</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Asia</span><span class="label  lightblue">China</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfg7MAA"> Blair Air System</a></td> 
            <td><span class="label lightblue">Coal Mines</span><span class="label lightblue">Oil &amp; Gas</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Partnership-wide</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfg8MAA"> Blev Bnefesh Carbon Finance</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">Coal Mines</span><span class="label lightblue">MSW</span><span class="label lightblue">Oil &amp; Gas</span><span class="label lightblue">Other</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Partnership-wide</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfgAMAQ"> Bluestone</a></td> 
            <td><span class="label lightblue">MSW</span><span class="label lightblue">Oil &amp; Gas</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">United States</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfdRMAQ"> Brazilian Association of Sanitation &amp; Special Waste Companies (ABRELPE)</a></td> 
            <td><span class="label lightblue">MSW</span></td>
            <td>Other</td>
            <td><span class="label  lightblue">South America</span><span class="label  lightblue">Brazil</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0At0000001tlhjEAA"> Brennan Brister</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">Biogas</span></td>
            <td>Research</td>
            <td><span class="label  lightblue">Partnership-wide</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AG0000009uJbVMAU"> Bveledza Solutions Pty. Ltd</a></td> 
            <td><span class="label lightblue">MSW</span><span class="label lightblue">Oil &amp; Gas</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Partnership-wide</span><span class="label  lightblue">Africa</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfqNMAQ"> Byo-Gon</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">Wastewater</span><span class="label lightblue">Other</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Partnership-wide</span><span class="label  lightblue">United States</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfgMMAQ"> C TRADE</a></td> 
            <td><span class="label lightblue">Agriculture</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">United States</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfgOMAQ"> California International Trade Connection</a></td> 
            <td><span class="label lightblue">MSW</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Partnership-wide</span><span class="label  lightblue">South America</span><span class="label  lightblue">Colombia</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0At00000012txrEAA"> Calscan Solutions - USA</a></td> 
            <td><span class="label lightblue">MSW</span><span class="label lightblue">Oil &amp; Gas</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Partnership-wide</span><span class="label  lightblue">North America</span><span class="label  lightblue">Canada</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfgRMAQ"> Camara Empresaria de Medio Ambiente</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">Coal Mines</span><span class="label lightblue">MSW</span><span class="label lightblue">Oil &amp; Gas</span><span class="label lightblue">Other</span></td>
            <td>NGO</td>
            <td><span class="label  lightblue">Partnership-wide</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AG000000AlqoEMAR"> Cambridge Project Development, Inc.</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">MSW</span><span class="label lightblue">Oil &amp; Gas</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Partnership-wide</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfrsMAA"> Cameroon Ministry of Energy and Water</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">MSW</span><span class="label lightblue">Oil &amp; Gas</span></td>
            <td>Government</td>
            <td><span class="label  lightblue">Cameroon</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AG000000gl8B2MAI"> Cape Carbon</a></td> 
            <td><span class="label lightblue">MSW</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Partnership-wide</span><span class="label  lightblue">Australia/Oceania</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0At00000012uK1EAI"> Cap-Op Energy</a></td> 
            <td><span class="label lightblue">Oil &amp; Gas</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Partnership-wide</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfgVMAQ"> Cappy and Associates, Mex. SA de CV</a></td> 
            <td><span class="label lightblue">Coal Mines</span><span class="label lightblue">MSW</span><span class="label lightblue">Biogas</span><span class="label lightblue">All GMI Topics</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Partnership-wide</span><span class="label  lightblue">North America</span><span class="label  lightblue">Mexico</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AG00000081JUIMA2"> Carbon Capital Management</a></td> 
            <td><span class="label lightblue">Coal Mines</span><span class="label lightblue">MSW</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Asia</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfgaMAA"> Carbon Limits AS</a></td> 
            <td><span class="label lightblue">MSW</span><span class="label lightblue">Oil &amp; Gas</span><span class="label lightblue">All GMI Topics</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Partnership-wide</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfgbMAA"> Carbon Management Consulting Ltd. ('CMC')</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">MSW</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">China</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfgeMAA"> Carbon Way - Clean Development Solutions</a></td> 
            <td><span class="label lightblue">MSW</span><span class="label lightblue">Oil &amp; Gas</span><span class="label lightblue">Other</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Partnership-wide</span><span class="label  lightblue">South America</span><span class="label  lightblue">Brazil</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfggMAA"> Carbono Eficiente</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">MSW</span><span class="label lightblue">Oil &amp; Gas</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Partnership-wide</span><span class="label  lightblue">Asia</span><span class="label  lightblue">South America</span><span class="label  lightblue">Brazil</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfgjMAA"> Carbotrader</a></td> 
            <td><span class="label lightblue">Coal Mines</span><span class="label lightblue">MSW</span><span class="label lightblue">Oil &amp; Gas</span><span class="label lightblue">Other</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Brazil</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfglMAA"> Carver &amp; Associates</a></td> 
            <td><span class="label lightblue">Oil &amp; Gas</span></td>
            <td>Other</td>
            <td><span class="label  lightblue">United States</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfgpMAA"> Caterpillar, Inc.</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">Coal Mines</span><span class="label lightblue">MSW</span><span class="label lightblue">Oil &amp; Gas</span><span class="label lightblue">Wastewater</span><span class="label lightblue">Biogas</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">South America</span><span class="label  lightblue">Argentina</span><span class="label  lightblue">Colombia</span><span class="label  lightblue">India</span><span class="label  lightblue">Mexico</span><span class="label  lightblue">United States</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfgsMAA"> CDM Smith</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">Coal Mines</span><span class="label lightblue">MSW</span><span class="label lightblue">Oil &amp; Gas</span><span class="label lightblue">Other</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">United States</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfh0MAA"> Cecil Morgan Consulting</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">Coal Mines</span><span class="label lightblue">MSW</span><span class="label lightblue">Oil &amp; Gas</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">United States</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfh2MAA"> Cedigaz</a></td> 
            <td><span class="label lightblue">Coal Mines</span><span class="label lightblue">Oil &amp; Gas</span></td>
            <td>Other</td>
            <td><span class="label  lightblue">France</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfh3MAA"> CEERES Sp. z o.o.</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">MSW</span><span class="label lightblue">Other</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Europe</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AG000000BKpUDMA1"> Cenergy USA, Inc.</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">MSW</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Africa</span><span class="label  lightblue">Australia/Oceania</span><span class="label  lightblue">Europe</span><span class="label  lightblue">North America</span><span class="label  lightblue">South America</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfh6MAA"> Centek Laboratories, LLC</a></td> 
            <td><span class="label lightblue">MSW</span><span class="label lightblue">Oil &amp; Gas</span><span class="label lightblue">Other</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Partnership-wide</span><span class="label  lightblue">United States</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AG00000081UqIMAU"> Center for Alternative Resources, Authentic Technology Services (CARATS)</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">Other</span></td>
            <td>NGO</td>
            <td><span class="label  lightblue">Partnership-wide</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AG000000fCdObMAK"> Center for Innovation and Development of Sustainable Energy (CIFES)</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">MSW</span></td>
            <td>Government</td>
            <td><span class="label  lightblue">Latin America</span><span class="label  lightblue">South America</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AG0000008O2a4MAC"> Center for Scientific and Industrial Research</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">MSW</span><span class="label lightblue">Oil &amp; Gas</span></td>
            <td>Research</td>
            <td><span class="label  lightblue">Asia</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfhEMAQ"> Central Mining Institute</a></td> 
            <td><span class="label lightblue">Coal Mines</span></td>
            <td>Research</td>
            <td><span class="label  lightblue">Poland</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfhLMAQ"> Ceres Associates Gulf</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">MSW</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Partnership-wide</span><span class="label  lightblue">Asia</span><span class="label  lightblue">United Kingdom</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfhMMAQ"> Ceres Associates Gulf LLC</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">MSW</span><span class="label lightblue">Other</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Partnership-wide</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfhNMAQ"> CETAC-WEST</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">Coal Mines</span><span class="label lightblue">MSW</span><span class="label lightblue">Oil &amp; Gas</span><span class="label lightblue">Biogas</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Canada</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0At00000035QjWEAU"> CH4nge</a></td> 
            <td><span class="label lightblue">Oil &amp; Gas</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Partnership-wide</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AG00000081UrJMAU"> CH4Projects</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">Coal Mines</span><span class="label lightblue">MSW</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Africa</span><span class="label  lightblue">Asia</span><span class="label  lightblue">Australia/Oceania</span><span class="label  lightblue">Europe</span><span class="label  lightblue">Latin America</span><span class="label  lightblue">Middle East</span><span class="label  lightblue">North America</span><span class="label  lightblue">South America</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfhSMAQ"> Cheminfo Services Inc.</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">Coal Mines</span><span class="label lightblue">MSW</span><span class="label lightblue">Oil &amp; Gas</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Canada</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfhUMAQ"> Chicago Climate Exchange</a></td> 
            <td><span class="label lightblue">Coal Mines</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">United States</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AG000000e3egHMAQ"> China Coal Strategies Research Center (CCSR)</a></td> 
            <td><span class="label lightblue">Coal Mines</span></td>
            <td>Research</td>
            <td><span class="label  lightblue">Asia</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfhfMAA"> Cicon Environment Technologies Ltd.</a></td> 
            <td><span class="label lightblue">Other</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">India</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AG00000081UriMAE"> Circom Development Corporation</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">Coal Mines</span><span class="label lightblue">MSW</span><span class="label lightblue">Oil &amp; Gas</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Partnership-wide</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfhkMAA"> Clarke Energy Pty Ltd</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">Coal Mines</span><span class="label lightblue">MSW</span><span class="label lightblue">Oil &amp; Gas</span><span class="label lightblue">Other</span><span class="label lightblue">Biogas</span><span class="label lightblue">All GMI Topics</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Africa</span><span class="label  lightblue">Asia</span><span class="label  lightblue">Australia/Oceania</span><span class="label  lightblue">Europe</span><span class="label  lightblue">India</span><span class="label  lightblue">Nigeria</span><span class="label  lightblue">United Kingdom</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfhlMAA"> Clean Air Initiative for Asian Cities</a></td> 
            <td><span class="label lightblue">Coal Mines</span><span class="label lightblue">MSW</span><span class="label lightblue">Oil &amp; Gas</span><span class="label lightblue">Other</span></td>
            <td>Government</td>
            <td><span class="label  lightblue">Philippines</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AG00000081UsQMAU"> Clean Air Task Force</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">Coal Mines</span><span class="label lightblue">MSW</span><span class="label lightblue">Oil &amp; Gas</span></td>
            <td>NGO</td>
            <td><span class="label  lightblue">Partnership-wide</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfhnMAA"> Clean All Waste Energy Technologies</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">Coal Mines</span><span class="label lightblue">MSW</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Partnership-wide</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AG000000cKXnGMAW"> Clean Energy</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">Coal Mines</span></td>
            <td>NGO</td>
            <td><span class="label  lightblue">Mongolia</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AG000000818vzMAA"> Clean TeQ</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">Coal Mines</span><span class="label lightblue">MSW</span><span class="label lightblue">Oil &amp; Gas</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Partnership-wide</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AG00000081bvMMAQ"> ClimaLoop</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">Coal Mines</span><span class="label lightblue">MSW</span><span class="label lightblue">Other</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Partnership-wide</span><span class="label  lightblue">Africa</span><span class="label  lightblue">Asia</span><span class="label  lightblue">Europe</span><span class="label  lightblue">Middle East</span><span class="label  lightblue">South America</span><span class="label  lightblue">Argentina</span><span class="label  lightblue">Australia</span><span class="label  lightblue">Brazil</span><span class="label  lightblue">Chile</span><span class="label  lightblue">Colombia</span><span class="label  lightblue">Dominican Republic</span><span class="label  lightblue">Ecuador</span><span class="label  lightblue">Ethiopia</span><span class="label  lightblue">European Commission</span><span class="label  lightblue">Germany</span><span class="label  lightblue">Ghana</span><span class="label  lightblue">India</span><span class="label  lightblue">Indonesia</span><span class="label  lightblue">Italy</span><span class="label  lightblue">Japan</span><span class="label  lightblue">Mexico</span><span class="label  lightblue">Nicaragua</span><span class="label  lightblue">Nigeria</span><span class="label  lightblue">Pakistan</span><span class="label  lightblue">Peru</span><span class="label  lightblue">Philippines</span><span class="label  lightblue">Poland</span><span class="label  lightblue">Republic of Korea (South Korea)</span><span class="label  lightblue">Russia</span><span class="label  lightblue">Serbia</span><span class="label  lightblue">Thailand</span><span class="label  lightblue">Turkey</span><span class="label  lightblue">Ukraine</span><span class="label  lightblue">United Kingdom</span><span class="label  lightblue">United States</span><span class="label  lightblue">Vietnam</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AG000000g5BBeMAM"> Climate Action Reserve</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">Coal Mines</span><span class="label lightblue">MSW</span><span class="label lightblue">Oil &amp; Gas</span><span class="label lightblue">Wastewater</span></td>
            <td>Financial Institution</td>
            <td><span class="label  lightblue">Partnership-wide</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AG00000081bzZMAQ"> Climate Change Coordination Centre</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">Coal Mines</span><span class="label lightblue">MSW</span><span class="label lightblue">Oil &amp; Gas</span></td>
            <td>NGO</td>
            <td><span class="label  lightblue">Asia</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfhwMAA"> Climate Change Research Institute</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">Coal Mines</span><span class="label lightblue">MSW</span><span class="label lightblue">Oil &amp; Gas</span><span class="label lightblue">Other</span></td>
            <td>Other</td>
            <td><span class="label  lightblue">Partnership-wide</span><span class="label  lightblue">Africa</span><span class="label  lightblue">Asia</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfhxMAA"> Climate Mitigation Works</a></td> 
            <td><span class="label lightblue">Coal Mines</span><span class="label lightblue">All GMI Topics</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">United Kingdom</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfi0MAA"> ClimateWedge</a></td> 
            <td><span class="label lightblue">Coal Mines</span><span class="label lightblue">MSW</span><span class="label lightblue">Oil &amp; Gas</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">United States</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qflPMAQ"> ClimeCo Corporation</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">MSW</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">United States</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfi1MAA"> Clouston Energy Research, LLC</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">Coal Mines</span><span class="label lightblue">MSW</span><span class="label lightblue">Oil &amp; Gas</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">United States</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfi2MAA"> Club Biogaz - ATEE</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">MSW</span><span class="label lightblue">Oil &amp; Gas</span></td>
            <td>Other</td>
            <td><span class="label  lightblue">Partnership-wide</span><span class="label  lightblue">Europe</span><span class="label  lightblue">European Commission</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfi5MAA"> CO2 Solutions</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">Coal Mines</span><span class="label lightblue">MSW</span><span class="label lightblue">Oil &amp; Gas</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Europe</span><span class="label  lightblue">North America</span><span class="label  lightblue">South America</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AG000000BKpTtMAL"> Coal Gas Technology Co. (CGT)</a></td> 
            <td><span class="label lightblue">Coal Mines</span><span class="label lightblue">Oil &amp; Gas</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Partnership-wide</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0At0000002xny3EAA"> Coalition for Renewable Natural Gas International Advisory Committee</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">Wastewater</span><span class="label lightblue">Landfill</span></td>
            <td>Other</td>
            <td><span class="label  lightblue">Partnership-wide</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfiCMAQ"> Coherent Green</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">MSW</span><span class="label lightblue">Other</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Partnership-wide</span><span class="label  lightblue">North America</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfiDMAQ"> Colegio de Ingenieros Ambientales de Mexico</a></td> 
            <td><span class="label lightblue">MSW</span></td>
            <td>Other</td>
            <td><span class="label  lightblue">Partnership-wide</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AG0000008mXqiMAE"> Colombiana de Minerales</a></td> 
            <td><span class="label lightblue">Coal Mines</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Partnership-wide</span><span class="label  lightblue">South America</span><span class="label  lightblue">Colombia</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfiFMAQ"> Combustion  Technologies Pvt. Ltd.</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">Coal Mines</span><span class="label lightblue">MSW</span><span class="label lightblue">Oil &amp; Gas</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Partnership-wide</span><span class="label  lightblue">Asia</span><span class="label  lightblue">India</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AG000000hY7kJMAS"> Combustion Research Associates (CRA)</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">Coal Mines</span><span class="label lightblue">MSW</span><span class="label lightblue">Oil &amp; Gas</span><span class="label lightblue">Wastewater</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Partnership-wide</span><span class="label  lightblue">Asia</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfiGMAQ"> COMM Engineering</a></td> 
            <td><span class="label lightblue">MSW</span><span class="label lightblue">Oil &amp; Gas</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Partnership-wide</span><span class="label  lightblue">Africa</span><span class="label  lightblue">Asia</span><span class="label  lightblue">Australia/Oceania</span><span class="label  lightblue">Europe</span><span class="label  lightblue">Middle East</span><span class="label  lightblue">North America</span><span class="label  lightblue">South America</span><span class="label  lightblue">Argentina</span><span class="label  lightblue">Brazil</span><span class="label  lightblue">Canada</span><span class="label  lightblue">China</span><span class="label  lightblue">Colombia</span><span class="label  lightblue">Ecuador</span><span class="label  lightblue">European Commission</span><span class="label  lightblue">Germany</span><span class="label  lightblue">India</span><span class="label  lightblue">Italy</span><span class="label  lightblue">Japan</span><span class="label  lightblue">Mexico</span><span class="label  lightblue">Mongolia</span><span class="label  lightblue">Nigeria</span><span class="label  lightblue">Pakistan</span><span class="label  lightblue">Philippines</span><span class="label  lightblue">Poland</span><span class="label  lightblue">Republic of Korea (South Korea)</span><span class="label  lightblue">Russia</span><span class="label  lightblue">Thailand</span><span class="label  lightblue">Ukraine</span><span class="label  lightblue">United Kingdom</span><span class="label  lightblue">United States</span><span class="label  lightblue">Viet</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AG000000f9tV6MAI"> Commercial Industrial Delta South America (CIDELSA)</a></td> 
            <td><span class="label lightblue">Agriculture</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">South America</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfiHMAQ"> Community Development Research</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">MSW</span></td>
            <td>NGO</td>
            <td><span class="label  lightblue">Partnership-wide</span><span class="label  lightblue">Africa</span><span class="label  lightblue">Ethiopia</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AG000000965hAMAQ"> Community Foundation Western Province</a></td> 
            <td><span class="label lightblue">Agriculture</span></td>
            <td>NGO</td>
            <td><span class="label  lightblue">Partnership-wide</span><span class="label  lightblue">Africa</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfiIMAQ"> Community Initiatives for Development &amp; Environment</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">MSW</span><span class="label lightblue">Oil &amp; Gas</span></td>
            <td>Other</td>
            <td><span class="label  lightblue">Asia</span><span class="label  lightblue">Pakistan</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfiJMAQ"> Com-N-Power, Inc.</a></td> 
            <td><span class="label lightblue">Coal Mines</span><span class="label lightblue">MSW</span><span class="label lightblue">Oil &amp; Gas</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">United States</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfiMMAQ"> Compressor Engineering Corp. (CECO)</a></td> 
            <td><span class="label lightblue">MSW</span><span class="label lightblue">Oil &amp; Gas</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Partnership-wide</span><span class="label  lightblue">Mexico</span><span class="label  lightblue">United States</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AG00000081cAjMAI"> Compton Group</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">Other</span></td>
            <td>Research</td>
            <td><span class="label  lightblue">North America</span><span class="label  lightblue">Australia</span><span class="label  lightblue">United States</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfiVMAQ"> Core Carbon Group</a></td> 
            <td><span class="label lightblue">Coal Mines</span><span class="label lightblue">MSW</span><span class="label lightblue">Oil &amp; Gas</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Russia</span><span class="label  lightblue">Ukraine</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AG000000804JVMAY"> Corporación CDT de GAS</a></td> 
            <td><span class="label lightblue">Oil &amp; Gas</span></td>
            <td>Research</td>
            <td><span class="label  lightblue">Colombia</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfiZMAQ"> COzero Pty. Ltd.</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">MSW</span><span class="label lightblue">Oil &amp; Gas</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Partnership-wide</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfieMAA"> Cryogenic Consulting Service, LLC</a></td> 
            <td><span class="label lightblue">Coal Mines</span><span class="label lightblue">MSW</span><span class="label lightblue">Oil &amp; Gas</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">United States</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfimMAA"> Dason Technology</a></td> 
            <td><span class="label lightblue">Oil &amp; Gas</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Partnership-wide</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfinMAA"> DATUM</a></td> 
            <td><span class="label lightblue">Coal Mines</span><span class="label lightblue">MSW</span><span class="label lightblue">Oil &amp; Gas</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">United States</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfirMAA"> DDMA Engenharia, Pesquisa e Desenvolvimento Ltda</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">MSW</span><span class="label lightblue">Oil &amp; Gas</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">South America</span><span class="label  lightblue">Brazil</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfiuMAA"> Delhiraj Agro Foods &amp; Beverages Pvt Ltd</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">Oil &amp; Gas</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Partnership-wide</span><span class="label  lightblue">Asia</span><span class="label  lightblue">India</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfiwMAA"> Deneb Solutions</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">Oil &amp; Gas</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Partnership-wide</span><span class="label  lightblue">Asia</span><span class="label  lightblue">India</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfjDMAQ"> Desert Research Institute</a></td> 
            <td><span class="label lightblue">MSW</span></td>
            <td>Research</td>
            <td><span class="label  lightblue">Partnership-wide</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfjEMAQ"> DETES Engineering GmbH</a></td> 
            <td><span class="label lightblue">MSW</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Germany</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfjFMAQ"> Deuman</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">Coal Mines</span><span class="label lightblue">MSW</span><span class="label lightblue">Oil &amp; Gas</span><span class="label lightblue">Other</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Chile</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfjIMAQ"> Development Alternatives Group</a></td> 
            <td><span class="label lightblue">Agriculture</span></td>
            <td>Other</td>
            <td><span class="label  lightblue">Partnership-wide</span><span class="label  lightblue">Asia</span><span class="label  lightblue">India</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfjMMAQ"> Dipartimento di Energetica "Sergio Stecco" Firenze</a></td> 
            <td><span class="label lightblue">MSW</span></td>
            <td>Research</td>
            <td><span class="label  lightblue">Italy</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfjNMAQ"> Direct Engineering Limited</a></td> 
            <td><span class="label lightblue">MSW</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Africa</span><span class="label  lightblue">Nigeria</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfjTMAQ"> DMT Mobile Toilets</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">MSW</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Nigeria</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AG00000081cD9MAI"> Dominion Energy Ohio</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">Coal Mines</span><span class="label lightblue">MSW</span><span class="label lightblue">Oil &amp; Gas</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">North America</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AG0000009vBpDMAU"> Douglas County, NE</a></td> 
            <td><span class="label lightblue">MSW</span></td>
            <td>Government</td>
            <td><span class="label  lightblue">Partnership-wide</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfjbMAA"> Drax Power Limited</a></td> 
            <td><span class="label lightblue">Coal Mines</span><span class="label lightblue">MSW</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">United Kingdom</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfjdMAA"> Durham Geo Slope Indicator</a></td> 
            <td><span class="label lightblue">MSW</span></td>
            <td>Research</td>
            <td><span class="label  lightblue">Partnership-wide</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfjhMAA"> Earth Charter International</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">Coal Mines</span><span class="label lightblue">MSW</span><span class="label lightblue">Oil &amp; Gas</span></td>
            <td>Other</td>
            <td><span class="label  lightblue">Sweden</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfjjMAA"> Earth Savers Energy Makers Phil.</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">MSW</span><span class="label lightblue">Other</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Partnership-wide</span><span class="label  lightblue">Asia</span><span class="label  lightblue">Philippines</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfjkMAA"> Eastern Power Limited</a></td> 
            <td><span class="label lightblue">MSW</span><span class="label lightblue">Other</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Partnership-wide</span><span class="label  lightblue">North America</span><span class="label  lightblue">Canada</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfjlMAA"> Eastern Research Group, Inc. (ERG)</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">Coal Mines</span><span class="label lightblue">MSW</span><span class="label lightblue">Oil &amp; Gas</span><span class="label lightblue">Wastewater</span><span class="label lightblue">Other</span><span class="label lightblue">Biogas</span><span class="label lightblue">All GMI Topics</span></td>
            <td>Contractor</td>
            <td><span class="label  lightblue">Partnership-wide</span><span class="label  lightblue">United States</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfjnMAA"> EC Applications, Inc.</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">MSW</span><span class="label lightblue">Other</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">United States</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfjpMAA"> Ecco Projects Inc.</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">Coal Mines</span><span class="label lightblue">MSW</span><span class="label lightblue">Oil &amp; Gas</span><span class="label lightblue">Other</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Partnership-wide</span><span class="label  lightblue">Europe</span><span class="label  lightblue">North America</span><span class="label  lightblue">Canada</span><span class="label  lightblue">European Commission</span><span class="label  lightblue">Germany</span><span class="label  lightblue">Italy</span><span class="label  lightblue">United Kingdom</span><span class="label  lightblue">United States</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfjsMAA"> Eco Corporate</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">MSW</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">India</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfjuMAA"> Eco Energy s.r.l</a></td> 
            <td><span class="label lightblue">Agriculture</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Europe</span><span class="label  lightblue">Middle East</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfjxMAA"> Eco Tecnologie and Processi</a></td> 
            <td><span class="label lightblue">Agriculture</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Partnership-wide</span><span class="label  lightblue">Europe</span><span class="label  lightblue">Italy</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfjzMAA"> Ecoengineer</a></td> 
            <td><span class="label lightblue">MSW</span></td>
            <td>Research</td>
            <td><span class="label  lightblue">Partnership-wide</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfk1MAA"> EcoFrontier</a></td> 
            <td><span class="label lightblue">Coal Mines</span><span class="label lightblue">MSW</span><span class="label lightblue">Oil &amp; Gas</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Partnership-wide</span><span class="label  lightblue">Republic of Korea (South Korea)</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfk3MAA"> Ecolkom</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">Coal Mines</span><span class="label lightblue">MSW</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Ukraine</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AG000000CKz3nMAD"> Ecomembrane, LLC</a></td> 
            <td><span class="label lightblue">Agriculture</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Partnership-wide</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfk7MAA"> EcoMundo</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">MSW</span></td>
            <td>Research</td>
            <td><span class="label  lightblue">Partnership-wide</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AG00000094xiIMAQ"> Ecopetrol S.A.</a></td> 
            <td><span class="label lightblue">Oil &amp; Gas</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Latin America</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfkBMAQ"> Ecosambito Cia. Ltda.</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">Other</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Ecuador</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfkCMAQ"> EcoSecurities, Ltd</a></td> 
            <td><span class="label lightblue">Oil &amp; Gas</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Asia</span><span class="label  lightblue">India</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AG00000081cDUMAY"> EcoSmartPlastics</a></td> 
            <td><span class="label lightblue">MSW</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Partnership-wide</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfkEMAQ"> ecosur</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">MSW</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">France</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AG000000gl8BHMAY"> ECOTEC</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">Coal Mines</span><span class="label lightblue">MSW</span><span class="label lightblue">Oil &amp; Gas</span><span class="label lightblue">Wastewater</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Partnership-wide</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfkFMAQ"> Ecotieda</a></td> 
            <td><span class="label lightblue">Other</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">South America</span><span class="label  lightblue">Colombia</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AG000000iVcBNMA0"> EcoVapor Recovery Systems (EcoVapor)</a></td> 
            <td><span class="label lightblue">Oil &amp; Gas</span><span class="label lightblue">Biogas</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Partnership-wide</span><span class="label  lightblue">North America</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfkGMAQ"> Eco-Zone, Inc.</a></td> 
            <td><span class="label lightblue">Agriculture</span></td>
            <td>Other</td>
            <td><span class="label  lightblue">Africa</span><span class="label  lightblue">North America</span><span class="label  lightblue">South America</span><span class="label  lightblue">Brazil</span><span class="label  lightblue">Germany</span><span class="label  lightblue">United States</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfkHMAQ"> ECP CONSULTING</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">Coal Mines</span><span class="label lightblue">MSW</span><span class="label lightblue">Oil &amp; Gas</span><span class="label lightblue">Other</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Partnership-wide</span><span class="label  lightblue">Asia</span><span class="label  lightblue">India</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfkJMAQ"> eda Environmental Ltd.</a></td> 
            <td><span class="label lightblue">Coal Mines</span><span class="label lightblue">MSW</span><span class="label lightblue">Oil &amp; Gas</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Canada</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AG000000hY7kOMAS"> Edgeboro International, Inc.</a></td> 
            <td><span class="label lightblue">Coal Mines</span><span class="label lightblue">MSW</span><span class="label lightblue">Oil &amp; Gas</span><span class="label lightblue">Biogas</span><span class="label lightblue">All GMI Topics</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Partnership-wide</span><span class="label  lightblue">North America</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfkLMAQ"> EDL Group Operations Pty Ltd</a></td> 
            <td><span class="label lightblue">Coal Mines</span><span class="label lightblue">MSW</span><span class="label lightblue">Other</span><span class="label lightblue">Biogas</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Australia</span><span class="label  lightblue">United Kingdom</span><span class="label  lightblue">United States</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfkNMAQ"> Edwards Industrial Equipment Corp</a></td> 
            <td><span class="label lightblue">MSW</span><span class="label lightblue">Oil &amp; Gas</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">United States</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfkPMAQ"> EESTech, Incorporated</a></td> 
            <td><span class="label lightblue">Coal Mines</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Australia</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfkQMAQ"> Effective Information, LLC</a></td> 
            <td><span class="label lightblue">Coal Mines</span><span class="label lightblue">MSW</span><span class="label lightblue">Oil &amp; Gas</span><span class="label lightblue">Other</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">United States</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AG0000008mXt4MAE"> EHV Engineering</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">MSW</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Partnership-wide</span><span class="label  lightblue">Europe</span><span class="label  lightblue">United Kingdom</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AG000000gkLQ8MAM"> EKI Energy Services Limited</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">Coal Mines</span><span class="label lightblue">MSW</span><span class="label lightblue">Oil &amp; Gas</span><span class="label lightblue">Wastewater</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Asia</span><span class="label  lightblue">India</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AG00000083ElpMAE"> EkoTech Energy LLC</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">Coal Mines</span><span class="label lightblue">MSW</span><span class="label lightblue">Oil &amp; Gas</span><span class="label lightblue">Wastewater</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Partnership-wide</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AG000000OFgLzMAL"> ElectraTherm</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">MSW</span><span class="label lightblue">Oil &amp; Gas</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Partnership-wide</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfkSMAQ"> Electrigaz Technologies, Inc.</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">MSW</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">North America</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfkdMAA"> Emergent Ventures India</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">Coal Mines</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">India</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AG00000081cDtMAI"> Emilaug Energy Limited</a></td> 
            <td><span class="label lightblue">Oil &amp; Gas</span><span class="label lightblue">Other</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Partnership-wide</span><span class="label  lightblue">Africa</span><span class="label  lightblue">Nigeria</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfklMAA"> EnEffect-Center for Energy Efficiency</a></td> 
            <td><span class="label lightblue">Coal Mines</span><span class="label lightblue">MSW</span><span class="label lightblue">Oil &amp; Gas</span><span class="label lightblue">Wastewater</span><span class="label lightblue">Biogas</span></td>
            <td>NGO</td>
            <td><span class="label  lightblue">Europe</span><span class="label  lightblue">Bulgaria</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AG0000009ezSgMAI"> Enerco2</a></td> 
            <td><span class="label lightblue">MSW</span><span class="label lightblue">Other</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">South America</span><span class="label  lightblue">Argentina</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AG000000DeY4GMAV"> Ener-Core, Inc.</a></td> 
            <td><span class="label lightblue">Coal Mines</span><span class="label lightblue">MSW</span><span class="label lightblue">Oil &amp; Gas</span><span class="label lightblue">Other</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Partnership-wide</span><span class="label  lightblue">Asia</span><span class="label  lightblue">Australia/Oceania</span><span class="label  lightblue">Europe</span><span class="label  lightblue">Middle East</span><span class="label  lightblue">North America</span><span class="label  lightblue">South America</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AG0000009vBppMAE"> Energetics</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">Coal Mines</span><span class="label lightblue">MSW</span><span class="label lightblue">Oil &amp; Gas</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Partnership-wide</span><span class="label  lightblue">Australia/Oceania</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfkpMAA"> Energium GH/GES Inc</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">Coal Mines</span><span class="label lightblue">MSW</span><span class="label lightblue">Oil &amp; Gas</span><span class="label lightblue">Other</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Canada</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfktMAA"> Energy &amp; Environment Business Services Ltd. (EEBS)</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">Coal Mines</span><span class="label lightblue">MSW</span><span class="label lightblue">Oil &amp; Gas</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">United Kingdom</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfkyMAA"> Energy Changes</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">MSW</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Germany</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfl0MAA"> Energy Environment &amp; Development Society</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">Other</span></td>
            <td>Other</td>
            <td><span class="label  lightblue">Partnership-wide</span><span class="label  lightblue">Asia</span><span class="label  lightblue">India</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfl5MAA"> Energy Strategy Consultants</a></td> 
            <td><span class="label lightblue">Oil &amp; Gas</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Switzerland</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfl7MAA"> Energy-Guru.com</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">MSW</span><span class="label lightblue">Other</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">United States</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AG000000k5qeFMAQ"> EnerPro Biogas</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">MSW</span><span class="label lightblue">Wastewater</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Partnership-wide</span><span class="label  lightblue">Africa</span><span class="label  lightblue">Europe</span><span class="label  lightblue">South America</span><span class="label  lightblue">Colombia</span><span class="label  lightblue">France</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AG000000De0X1MAJ"> Enersus Mexico</a></td> 
            <td><span class="label lightblue">MSW</span><span class="label lightblue">Wastewater</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Partnership-wide</span><span class="label  lightblue">Latin America</span><span class="label  lightblue">Mexico</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qflAMAQ"> Eni S.p.A.</a></td> 
            <td><span class="label lightblue">Oil &amp; Gas</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Italy</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0At0000002WnkkEAC"> enSift Corp.</a></td> 
            <td><span class="label lightblue">Oil &amp; Gas</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Partnership-wide</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qflBMAQ"> ENSO Plastics</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">MSW</span><span class="label lightblue">Biogas</span><span class="label lightblue">All GMI Topics</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Partnership-wide</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AG000000NEdRCMA1"> ENSO Plastics, LLC</a></td> 
            <td><span class="label lightblue">Biogas</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Partnership-wide</span><span class="label  lightblue">North America</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qflGMAQ"> Environment Action Pty Ltd</a></td> 
            <td><span class="label lightblue">Coal Mines</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Australia</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AG00000081ffmMAA"> Environment Depot for Wasterwater to Energy Ltd.</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">Wastewater</span><span class="label lightblue">Other</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Partnership-wide</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qflJMAQ"> Environment Engg &amp; Control</a></td> 
            <td><span class="label lightblue">MSW</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">India</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qflRMAQ"> Environmental Fabrics, Inc.</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">MSW</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">United States</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qflUMAQ"> Environmental Products &amp; Technologies Corporation (EP&amp;T)</a></td> 
            <td><span class="label lightblue">Agriculture</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">United States</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qflWMAQ"> Environmental Protection Welfare Ass. of India</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">MSW</span><span class="label lightblue">Oil &amp; Gas</span><span class="label lightblue">Other</span></td>
            <td>Other</td>
            <td><span class="label  lightblue">Partnership-wide</span><span class="label  lightblue">Africa</span><span class="label  lightblue">Asia</span><span class="label  lightblue">Australia/Oceania</span><span class="label  lightblue">Europe</span><span class="label  lightblue">Middle East</span><span class="label  lightblue">North America</span><span class="label  lightblue">South America</span><span class="label  lightblue">Argentina</span><span class="label  lightblue">Brazil</span><span class="label  lightblue">Bulgaria</span><span class="label  lightblue">Canada</span><span class="label  lightblue">Chile</span><span class="label  lightblue">China</span><span class="label  lightblue">Colombia</span><span class="label  lightblue">Dominican Republic</span><span class="label  lightblue">Ecuador</span><span class="label  lightblue">Ethiopia</span><span class="label  lightblue">European Commission</span><span class="label  lightblue">Finland</span><span class="label  lightblue">Georgia</span><span class="label  lightblue">Germany</span><span class="label  lightblue">Ghana</span><span class="label  lightblue">India</span><span class="label  lightblue">Italy</span><span class="label  lightblue">Japan</span><span class="label  lightblue">Mexico</span><span class="label  lightblue">Mongolia</span><span class="label  lightblue">Nigeria</span><span class="label  lightblue">Philippines</span><span class="label  lightblue">Poland</span><span class="label  lightblue">Republic of Korea (South Korea)</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfllMAA"> Environmental Resources Management, Inc.</a></td> 
            <td><span class="label lightblue">Coal Mines</span><span class="label lightblue">MSW</span><span class="label lightblue">Oil &amp; Gas</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Brazil</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfldMAA"> Envirosys International Pvt. Ltd.</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">Other</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">India</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfleMAA"> Envirotech</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">MSW</span><span class="label lightblue">Oil &amp; Gas</span><span class="label lightblue">Other</span></td>
            <td>Other</td>
            <td><span class="label  lightblue">Pakistan</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0At0000002xqohEAA"> Eosense</a></td> 
            <td><span class="label lightblue">Oil &amp; Gas</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Canada</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qflhMAA"> EPS Capital Corp.</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">Coal Mines</span><span class="label lightblue">MSW</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Europe</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfliMAA"> EQS</a></td> 
            <td><span class="label lightblue">MSW</span><span class="label lightblue">Oil &amp; Gas</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">United States</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qflnMAA"> ESBI Carbon Solutions</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">Coal Mines</span><span class="label lightblue">MSW</span><span class="label lightblue">Oil &amp; Gas</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Partnership-wide</span><span class="label  lightblue">Asia</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfloMAA"> Esmeralda Conceptions Organization</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">MSW</span><span class="label lightblue">Oil &amp; Gas</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">United States</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qflrMAA"> Ethan Bio Fuels</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">Coal Mines</span><span class="label lightblue">MSW</span><span class="label lightblue">Oil &amp; Gas</span><span class="label lightblue">Other</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Partnership-wide</span><span class="label  lightblue">Africa</span><span class="label  lightblue">Ethiopia</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qflsMAA"> EUCC - The Coastal Union</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">Coal Mines</span><span class="label lightblue">MSW</span><span class="label lightblue">Oil &amp; Gas</span><span class="label lightblue">Other</span><span class="label lightblue">Biogas</span><span class="label lightblue">All GMI Topics</span></td>
            <td>Other</td>
            <td><span class="label  lightblue">Partnership-wide</span><span class="label  lightblue">United Kingdom</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfluMAA"> European Bank for Reconstruction and Development</a></td> 
            <td><span class="label lightblue">Coal Mines</span></td>
            <td>Financial Institution</td>
            <td><span class="label  lightblue">Europe</span><span class="label  lightblue">Mongolia</span><span class="label  lightblue">Poland</span><span class="label  lightblue">Russia</span><span class="label  lightblue">Ukraine</span><span class="label  lightblue">United Kingdom</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qflvMAA"> Everest Agriculture and Farming Sdn Bhd</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">Coal Mines</span><span class="label lightblue">MSW</span><span class="label lightblue">Oil &amp; Gas</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Malaysia</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qflxMAA"> EWS LLC</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">MSW</span><span class="label lightblue">Wastewater</span><span class="label lightblue">Other</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Partnership-wide</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AG000000g2La1MAE"> EXeidea Ltd.</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">Coal Mines</span><span class="label lightblue">MSW</span><span class="label lightblue">Oil &amp; Gas</span><span class="label lightblue">Wastewater</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Partnership-wide</span><span class="label  lightblue">Asia</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfmCMAQ"> Federal University of Santa Catarina (Brazil) (UFSC)</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">MSW</span></td>
            <td>University</td>
            <td><span class="label  lightblue">Brazil</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfmEMAQ"> Federation of Indian Chambers of Commerce and Industry (FICCI)</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">Coal Mines</span><span class="label lightblue">MSW</span><span class="label lightblue">Oil &amp; Gas</span></td>
            <td>Other</td>
            <td><span class="label  lightblue">India</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfmDMAQ"> Fertigaz</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">Other</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">France</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfmZMAQ"> Field Specialties Inc.</a></td> 
            <td><span class="label lightblue">MSW</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Partnership-wide</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfmHMAQ"> FilterSure Inc.</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">MSW</span><span class="label lightblue">Other</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">United States</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfmJMAQ"> Finning International Inc.</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">Coal Mines</span><span class="label lightblue">MSW</span><span class="label lightblue">Oil &amp; Gas</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Partnership-wide</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfmLMAQ"> FirmGreen, Inc.</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">Coal Mines</span><span class="label lightblue">MSW</span><span class="label lightblue">Oil &amp; Gas</span><span class="label lightblue">Wastewater</span><span class="label lightblue">Other</span><span class="label lightblue">Biogas</span><span class="label lightblue">All GMI Topics</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Partnership-wide</span><span class="label  lightblue">United States</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfmMMAQ"> First Exploration and Development Services</a></td> 
            <td><span class="label lightblue">Oil &amp; Gas</span><span class="label lightblue">Other</span><span class="label lightblue">Biogas</span><span class="label lightblue">All GMI Topics</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Philippines</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfmOMAQ"> Fluid Components International (FCI)</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">Coal Mines</span><span class="label lightblue">MSW</span><span class="label lightblue">Oil &amp; Gas</span><span class="label lightblue">Other</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">United States</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0At0000002xny4EAA"> FnBB Fachgruppe Biogas GmbH</a></td> 
            <td><span class="label lightblue">Agriculture</span></td>
            <td>Other</td>
            <td><span class="label  lightblue">Germany</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfmPMAQ"> Food Safety and Security Project</a></td> 
            <td><span class="label lightblue">Agriculture</span></td>
            <td>Other</td>
            <td><span class="label  lightblue">Partnership-wide</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfmQMAQ"> Fools Gold LLC</a></td> 
            <td><span class="label lightblue">Agriculture</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">North America</span><span class="label  lightblue">United States</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfmTMAQ"> Foundation for Greentech Environmental Systems</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">MSW</span><span class="label lightblue">Other</span></td>
            <td>Other</td>
            <td><span class="label  lightblue">India</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AG000000cMaAIMA0"> Foundation for Research and Sustainable Development (FRSD)</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">MSW</span><span class="label lightblue">Wastewater</span></td>
            <td>NGO</td>
            <td><span class="label  lightblue">Partnership-wide</span><span class="label  lightblue">Asia</span><span class="label  lightblue">India</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfmWMAQ"> Franatech GmbH</a></td> 
            <td><span class="label lightblue">MSW</span><span class="label lightblue">Oil &amp; Gas</span><span class="label lightblue">Other</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Germany</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0At0000002N91EEAS"> Francaise de L'energie</a></td> 
            <td><span class="label lightblue">Coal Mines</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Europe</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfmXMAQ"> Friends for Life and Nature (FLN)</a></td> 
            <td><span class="label lightblue">Agriculture</span></td>
            <td>Other</td>
            <td><span class="label  lightblue">Partnership-wide</span><span class="label  lightblue">Africa</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfmYMAQ"> FSD - The Swiss Foundation for MineAction</a></td> 
            <td><span class="label lightblue">MSW</span></td>
            <td>Other</td>
            <td><span class="label  lightblue">Partnership-wide</span><span class="label  lightblue">Asia</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfmcMAA"> Fundacion Entorno</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">MSW</span><span class="label lightblue">Oil &amp; Gas</span><span class="label lightblue">Wastewater</span></td>
            <td>Other</td>
            <td><span class="label  lightblue">Partnership-wide</span><span class="label  lightblue">Asia</span><span class="label  lightblue">Colombia</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfmdMAA"> Fundación Japa</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">Biogas</span></td>
            <td>Other</td>
            <td><span class="label  lightblue">Partnership-wide</span><span class="label  lightblue">Dominican Republic</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfmeMAA"> Fundacion Torcuato Di Tella</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">Coal Mines</span><span class="label lightblue">MSW</span><span class="label lightblue">Oil &amp; Gas</span></td>
            <td>Other</td>
            <td><span class="label  lightblue">Argentina</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfmfMAA"> Future Enviroassets, LLC</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">Coal Mines</span><span class="label lightblue">MSW</span><span class="label lightblue">Oil &amp; Gas</span><span class="label lightblue">Biogas</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">United States</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AG000000gSkpeMAC"> GAD Environmental</a></td> 
            <td><span class="label lightblue">MSW</span><span class="label lightblue">Wastewater</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">China</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000005JjWEMA0"> GAIL (India) Limited</a></td> 
            <td><span class="label lightblue">Oil &amp; Gas</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">India</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfmjMAA"> Gandhipathagar</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">MSW</span></td>
            <td>Other</td>
            <td><span class="label  lightblue">Partnership-wide</span><span class="label  lightblue">Asia</span><span class="label  lightblue">India</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfmkMAA"> Gardes Energy Services Inc.</a></td> 
            <td><span class="label lightblue">Coal Mines</span><span class="label lightblue">MSW</span><span class="label lightblue">Oil &amp; Gas</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">United States</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfmlMAA"> Gas Data Ltd</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">Coal Mines</span><span class="label lightblue">MSW</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">United Kingdom</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfmoMAA"> Gas Technologies LLC</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">Coal Mines</span><span class="label lightblue">MSW</span><span class="label lightblue">Oil &amp; Gas</span><span class="label lightblue">All GMI Topics</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">United States</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AG00000081fjqMAA"> GB Eco Solutions</a></td> 
            <td><span class="label lightblue">MSW</span><span class="label lightblue">Other</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">South America</span><span class="label  lightblue">Brazil</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0At0000002JQJ0EAO"> Gemidan Ecogi</a></td> 
            <td><span class="label lightblue">MSW</span><span class="label lightblue">Biogas</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">North America</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfmzMAA"> Genegas S.A. De C.V.</a></td> 
            <td><span class="label lightblue">Agriculture</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Partnership-wide</span><span class="label  lightblue">North America</span><span class="label  lightblue">Mexico</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AG000000iWa4QMAS"> GENERON</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">Coal Mines</span><span class="label lightblue">MSW</span><span class="label lightblue">Oil &amp; Gas</span><span class="label lightblue">Wastewater</span><span class="label lightblue">Other</span><span class="label lightblue">Biogas</span><span class="label lightblue">All GMI Topics</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Partnership-wide</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AG000000hiy84MAA"> Geo Cost Management (GCM), LLC</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">MSW</span><span class="label lightblue">Wastewater</span><span class="label lightblue">Biogas</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Asia</span><span class="label  lightblue">North America</span><span class="label  lightblue">South America</span><span class="label  lightblue">Brazil</span><span class="label  lightblue">Canada</span><span class="label  lightblue">China</span><span class="label  lightblue">Colombia</span><span class="label  lightblue">India</span><span class="label  lightblue">Nicaragua</span><span class="label  lightblue">Philippines</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfn1MAA"> Geo Drilling Limited</a></td> 
            <td><span class="label lightblue">Coal Mines</span><span class="label lightblue">Other</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Partnership-wide</span><span class="label  lightblue">Asia</span><span class="label  lightblue">India</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfn2MAA"> geoconsult</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">Coal Mines</span><span class="label lightblue">MSW</span><span class="label lightblue">Oil &amp; Gas</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Partnership-wide</span><span class="label  lightblue">Europe</span><span class="label  lightblue">Middle East</span><span class="label  lightblue">North America</span><span class="label  lightblue">South America</span><span class="label  lightblue">China</span><span class="label  lightblue">Mexico</span><span class="label  lightblue">United States</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfn4MAA"> Geomatics &amp; Land Resource Lab - Trent University</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">Other</span></td>
            <td>Research</td>
            <td><span class="label  lightblue">Canada</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfn6MAA"> Geoprecision - Geotenologias &amp; Agronegócio</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">MSW</span><span class="label lightblue">Wastewater</span><span class="label lightblue">Other</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Partnership-wide</span><span class="label  lightblue">South America</span><span class="label  lightblue">Brazil</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfn9MAA"> GERES</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">MSW</span><span class="label lightblue">Oil &amp; Gas</span></td>
            <td>Other</td>
            <td><span class="label  lightblue">Cambodia</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfiPMAQ"> GHD</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">Coal Mines</span><span class="label lightblue">MSW</span><span class="label lightblue">Oil &amp; Gas</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Partnership-wide</span><span class="label  lightblue">Canada</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AG00000081fkFMAQ"> GHG Accounting Services</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">Coal Mines</span><span class="label lightblue">MSW</span><span class="label lightblue">Oil &amp; Gas</span><span class="label lightblue">Other</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Partnership-wide</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfnIMAQ"> Global Edge Project Consulting</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">MSW</span><span class="label lightblue">Oil &amp; Gas</span><span class="label lightblue">Other</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Asia</span><span class="label  lightblue">South America</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfnLMAQ"> Global Green Power plc</a></td> 
            <td><span class="label lightblue">Other</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Philippines</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfnNMAQ"> Global Industrial Dynamics</a></td> 
            <td><span class="label lightblue">Coal Mines</span><span class="label lightblue">Oil &amp; Gas</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Partnership-wide</span><span class="label  lightblue">Europe</span><span class="label  lightblue">Poland</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfnOMAQ"> Global Network for Env. and Econ. Dev. Research</a></td> 
            <td><span class="label lightblue">Agriculture</span></td>
            <td>Other</td>
            <td><span class="label  lightblue">Nigeria</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfnPMAQ"> Global Oil</a></td> 
            <td><span class="label lightblue">MSW</span><span class="label lightblue">Oil &amp; Gas</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">United States</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfnQMAQ"> Global Relief Foundation</a></td> 
            <td><span class="label lightblue">Other</span></td>
            <td>Other</td>
            <td><span class="label  lightblue">Ghana</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfnRMAQ"> GM Engineers and Associates</a></td> 
            <td><span class="label lightblue">Agriculture</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Partnership-wide</span><span class="label  lightblue">Asia</span><span class="label  lightblue">Philippines</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AG000000fADvMMAW"> GoHz Power Supply, Inc.</a></td> 
            <td><span class="label lightblue">Oil &amp; Gas</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Partnership-wide</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfnYMAQ"> Graduate School of Engineering, Hokkaido University</a></td> 
            <td><span class="label lightblue">Coal Mines</span></td>
            <td>Research</td>
            <td><span class="label  lightblue">Japan</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AG0000009cNh4MAE"> Green Concepts Associates</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">Coal Mines</span><span class="label lightblue">MSW</span><span class="label lightblue">Oil &amp; Gas</span><span class="label lightblue">Wastewater</span><span class="label lightblue">Biogas</span><span class="label lightblue">All GMI Topics</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Partnership-wide</span><span class="label  lightblue">Europe</span><span class="label  lightblue">United Kingdom</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfnbMAA"> Green Domus Desenvolvimento Sustentável Ltda</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">Coal Mines</span><span class="label lightblue">MSW</span><span class="label lightblue">Oil &amp; Gas</span><span class="label lightblue">Other</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Brazil</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AG000000hWo5JMAS"> Green Fuels Corp.</a></td> 
            <td><span class="label lightblue">MSW</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Partnership-wide</span><span class="label  lightblue">Latin America</span><span class="label  lightblue">North America</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AG000000cLuatMAC"> Green Group Mexico</a></td> 
            <td><span class="label lightblue">MSW</span><span class="label lightblue">Oil &amp; Gas</span><span class="label lightblue">Wastewater</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Partnership-wide</span><span class="label  lightblue">North America</span><span class="label  lightblue">Mexico</span><span class="label  lightblue">United States</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfngMAA"> Green Innovation Technologies</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">MSW</span><span class="label lightblue">Other</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Partnership-wide</span><span class="label  lightblue">United States</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfnhMAA"> Green Life Sri Lanka</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">MSW</span></td>
            <td>Other</td>
            <td><span class="label  lightblue">Asia</span><span class="label  lightblue">Argentina</span><span class="label  lightblue">Australia</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfnjMAA"> Green Power Energy Conferences</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">Coal Mines</span><span class="label lightblue">MSW</span><span class="label lightblue">Oil &amp; Gas</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Partnership-wide</span><span class="label  lightblue">Europe</span><span class="label  lightblue">United Kingdom</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfnkMAA"> Green Stratos Consulting (P) Ltd.</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">MSW</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Partnership-wide</span><span class="label  lightblue">Africa</span><span class="label  lightblue">Asia</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AG000000g3cOqMAI"> Greenhouse Gas Reduction Initiative</a></td> 
            <td><span class="label lightblue">Oil &amp; Gas</span></td>
            <td>NGO</td>
            <td><span class="label  lightblue">Africa</span><span class="label  lightblue">Nigeria</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfnpMAA"> GreenMax Capital Advisors</a></td> 
            <td><span class="label lightblue">MSW</span></td>
            <td>Financial Institution</td>
            <td><span class="label  lightblue">Poland</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfnqMAA"> Greennovative Chain LLC</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">MSW</span><span class="label lightblue">Wastewater</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Africa</span><span class="label  lightblue">Asia</span><span class="label  lightblue">North America</span><span class="label  lightblue">South America</span><span class="label  lightblue">Brazil</span><span class="label  lightblue">China</span><span class="label  lightblue">India</span><span class="label  lightblue">Mexico</span><span class="label  lightblue">Nigeria</span><span class="label  lightblue">Philippines</span><span class="label  lightblue">United States</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfnrMAA"> GreenPath Energy Ltd</a></td> 
            <td><span class="label lightblue">Oil &amp; Gas</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Partnership-wide</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfnsMAA"> GreenPowerTek International Limited</a></td> 
            <td><span class="label lightblue">Coal Mines</span><span class="label lightblue">MSW</span><span class="label lightblue">Oil &amp; Gas</span><span class="label lightblue">Other</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Partnership-wide</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AG000000963xAMAQ"> Greentech Avenue Inc.</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">MSW</span><span class="label lightblue">Wastewater</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Partnership-wide</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfnwMAA"> Greka Group</a></td> 
            <td><span class="label lightblue">Coal Mines</span><span class="label lightblue">MSW</span><span class="label lightblue">Oil &amp; Gas</span><span class="label lightblue">Other</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">China</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfnyMAA"> Growcom</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">Other</span><span class="label lightblue">Biogas</span></td>
            <td>Other</td>
            <td><span class="label  lightblue">Australia</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AG00000081flDMAQ"> Growdiesel Ventures</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">MSW</span><span class="label lightblue">Other</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Partnership-wide</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfo0MAA"> Grupo Ambiental Amazonia Grama, C.A.</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">MSW</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Partnership-wide</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfo2MAA"> Grupo Empresarial Energia y Medio Ambiente</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">MSW</span><span class="label lightblue">Oil &amp; Gas</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Partnership-wide</span><span class="label  lightblue">North America</span><span class="label  lightblue">Mexico</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfo3MAA"> GT Environmental Finance, LLC</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">Coal Mines</span><span class="label lightblue">MSW</span><span class="label lightblue">Oil &amp; Gas</span></td>
            <td>Financial Institution</td>
            <td><span class="label  lightblue">United States</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfo7MAA"> Guizhou International Cooperation Center for Environmental Protection (GZICCEP)</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">Coal Mines</span><span class="label lightblue">MSW</span><span class="label lightblue">Wastewater</span></td>
            <td>Other</td>
            <td><span class="label  lightblue">Partnership-wide</span><span class="label  lightblue">Asia</span><span class="label  lightblue">China</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfo8MAA"> Gulf Coast Environmental Systems</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">Coal Mines</span><span class="label lightblue">MSW</span><span class="label lightblue">Oil &amp; Gas</span><span class="label lightblue">Biogas</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Partnership-wide</span><span class="label  lightblue">Asia</span><span class="label  lightblue">North America</span><span class="label  lightblue">South America</span><span class="label  lightblue">Argentina</span><span class="label  lightblue">Brazil</span><span class="label  lightblue">Canada</span><span class="label  lightblue">Chile</span><span class="label  lightblue">China</span><span class="label  lightblue">Colombia</span><span class="label  lightblue">Dominican Republic</span><span class="label  lightblue">Ecuador</span><span class="label  lightblue">Kazakhstan</span><span class="label  lightblue">Mexico</span><span class="label  lightblue">Peru</span><span class="label  lightblue">Poland</span><span class="label  lightblue">Ukraine</span><span class="label  lightblue">United States</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AG000000Alr5CMAR"> Gulf Coast Green Energy</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">MSW</span><span class="label lightblue">Oil &amp; Gas</span><span class="label lightblue">Wastewater</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Partnership-wide</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfoAMAQ"> Haiti International Business Center</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">MSW</span><span class="label lightblue">Oil &amp; Gas</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Partnership-wide</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AG000000CKz3IMAT"> Hammoudeh Group</a></td> 
            <td><span class="label lightblue">Agriculture</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Partnership-wide</span><span class="label  lightblue">Asia</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AG0000008Ln5OMAS"> Hanoi University of Science and Technology</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">MSW</span><span class="label lightblue">Oil &amp; Gas</span><span class="label lightblue">Wastewater</span></td>
            <td>University</td>
            <td><span class="label  lightblue">Asia</span><span class="label  lightblue">Vietnam</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qflbMAA"> HARC/Environmentally Friendly Drilling Systems Program</a></td> 
            <td><span class="label lightblue">Oil &amp; Gas</span></td>
            <td>Research</td>
            <td><span class="label  lightblue">Partnership-wide</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfoEMAQ"> Hartowijaya Pty Ltd</a></td> 
            <td><span class="label lightblue">Coal Mines</span><span class="label lightblue">Oil &amp; Gas</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Asia</span><span class="label  lightblue">Australia/Oceania</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfoHMAQ"> Harzyn Nuruu Mongolia</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">Coal Mines</span><span class="label lightblue">MSW</span><span class="label lightblue">Oil &amp; Gas</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Partnership-wide</span><span class="label  lightblue">North America</span><span class="label  lightblue">United States</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfoLMAQ"> HCS Group, Inc.</a></td> 
            <td><span class="label lightblue">MSW</span><span class="label lightblue">Oil &amp; Gas</span><span class="label lightblue">Other</span><span class="label lightblue">Biogas</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">United States</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfoMMAQ"> Heath Consultants Inc.</a></td> 
            <td><span class="label lightblue">Oil &amp; Gas</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Africa</span><span class="label  lightblue">Europe</span><span class="label  lightblue">Middle East</span><span class="label  lightblue">North America</span><span class="label  lightblue">South America</span><span class="label  lightblue">Argentina</span><span class="label  lightblue">Australia</span><span class="label  lightblue">Brazil</span><span class="label  lightblue">Canada</span><span class="label  lightblue">China</span><span class="label  lightblue">Colombia</span><span class="label  lightblue">Ecuador</span><span class="label  lightblue">European Commission</span><span class="label  lightblue">Finland</span><span class="label  lightblue">Germany</span><span class="label  lightblue">India</span><span class="label  lightblue">Italy</span><span class="label  lightblue">Japan</span><span class="label  lightblue">Kazakhstan</span><span class="label  lightblue">Mexico</span><span class="label  lightblue">Mongolia</span><span class="label  lightblue">Nigeria</span><span class="label  lightblue">Pakistan</span><span class="label  lightblue">Philippines</span><span class="label  lightblue">Poland</span><span class="label  lightblue">Republic of Korea (South Korea)</span><span class="label  lightblue">Russia</span><span class="label  lightblue">Thailand</span><span class="label  lightblue">Ukraine</span><span class="label  lightblue">United Kingdom</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfoNMAQ"> Heaven Sent Energies, Inc.</a></td> 
            <td><span class="label lightblue">Agriculture</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Philippines</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfoOMAQ"> Hellenic Solid Waste Management Association</a></td> 
            <td><span class="label lightblue">MSW</span></td>
            <td>Other</td>
            <td><span class="label  lightblue">Greece</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfoPMAQ"> Help and hope</a></td> 
            <td><span class="label lightblue">Agriculture</span></td>
            <td>Other</td>
            <td><span class="label  lightblue">Asia</span><span class="label  lightblue">India</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfoQMAQ"> Highland Energy (N.S.) Inc.</a></td> 
            <td><span class="label lightblue">MSW</span><span class="label lightblue">Biogas</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Partnership-wide</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfoSMAQ"> Him Rewenable Energy &amp; Environment Consultants</a></td> 
            <td><span class="label lightblue">Agriculture</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Partnership-wide</span><span class="label  lightblue">Asia</span><span class="label  lightblue">India</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AG000000XfWDGMA3"> Horn Africa Center for Research and Development (HACRED)</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">MSW</span><span class="label lightblue">Wastewater</span></td>
            <td>NGO</td>
            <td><span class="label  lightblue">Africa</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfoYMAQ"> HSA Golden</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">Coal Mines</span><span class="label lightblue">MSW</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Partnership-wide</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfobMAA"> Hydro Geo Chem, Inc.</a></td> 
            <td><span class="label lightblue">MSW</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">United States</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfocMAA"> IACX Energy</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">Coal Mines</span><span class="label lightblue">MSW</span><span class="label lightblue">Oil &amp; Gas</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">United States</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AG000000ASngjMAD"> IAV Hassan 2</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">Biogas</span></td>
            <td>Research</td>
            <td><span class="label  lightblue">Partnership-wide</span><span class="label  lightblue">Middle East</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0At0000002xny6EAA"> IBBK Fachgruppe Biogas GmbH</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">Wastewater</span><span class="label lightblue">Landfill</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Partnership-wide</span><span class="label  lightblue">Africa</span><span class="label  lightblue">Asia</span><span class="label  lightblue">Australia/Oceania</span><span class="label  lightblue">Europe</span><span class="label  lightblue">Middle East</span><span class="label  lightblue">North America</span><span class="label  lightblue">South America</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfoeMAA"> ICEED, Nigeria</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">Other</span></td>
            <td>Research</td>
            <td><span class="label  lightblue">Nigeria</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfofMAA"> ICF International (ICF)</a></td> 
            <td><span class="label lightblue">Coal Mines</span><span class="label lightblue">MSW</span><span class="label lightblue">Oil &amp; Gas</span></td>
            <td>Contractor</td>
            <td><span class="label  lightblue">United States</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfohMAA"> IEA Clean Coal Centre</a></td> 
            <td><span class="label lightblue">Coal Mines</span><span class="label lightblue">Oil &amp; Gas</span></td>
            <td>Other</td>
            <td><span class="label  lightblue">United Kingdom</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfoiMAA"> Ifbio</a></td> 
            <td><span class="label lightblue">Agriculture</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Partnership-wide</span><span class="label  lightblue">South America</span><span class="label  lightblue">Argentina</span><span class="label  lightblue">Brazil</span><span class="label  lightblue">Chile</span><span class="label  lightblue">Colombia</span><span class="label  lightblue">Ecuador</span><span class="label  lightblue">Germany</span><span class="label  lightblue">Mexico</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfokMAA"> IHT</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">Coal Mines</span><span class="label lightblue">MSW</span><span class="label lightblue">Oil &amp; Gas</span></td>
            <td>Other</td>
            <td><span class="label  lightblue">Partnership-wide</span><span class="label  lightblue">Asia</span><span class="label  lightblue">Pakistan</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfomMAA"> Illinois-Missouri Biotechnology Alliance</a></td> 
            <td><span class="label lightblue">Agriculture</span></td>
            <td>Research</td>
            <td><span class="label  lightblue">United States</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0At00000012sdUEAQ"> Impacto Energia S.A.</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">MSW</span><span class="label lightblue">Wastewater</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Partnership-wide</span><span class="label  lightblue">South America</span><span class="label  lightblue">Brazil</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfopMAA"> IMW Industries Ltd.</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">MSW</span><span class="label lightblue">Oil &amp; Gas</span><span class="label lightblue">Other</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Partnership-wide</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfj9MAA"> India Department of Environmental Technology</a></td> 
            <td><span class="label lightblue">MSW</span><span class="label lightblue">Wastewater</span><span class="label lightblue">Other</span><span class="label lightblue">Biogas</span></td>
            <td>Research</td>
            <td><span class="label  lightblue">India</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AG000000ifYJ6MAM"> Indian Green Service (IGS)</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">MSW</span><span class="label lightblue">Wastewater</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Partnership-wide</span><span class="label  lightblue">Asia</span><span class="label  lightblue">India</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qforMAA"> Indian Institute of Sustainable Development</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">Coal Mines</span><span class="label lightblue">MSW</span><span class="label lightblue">Oil &amp; Gas</span><span class="label lightblue">Other</span></td>
            <td>Other</td>
            <td><span class="label  lightblue">India</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AG000000LTKuEMAX"> Indian Institute of Technology Delhi</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">MSW</span><span class="label lightblue">Wastewater</span><span class="label lightblue">Biogas</span></td>
            <td>Other</td>
            <td><span class="label  lightblue">India</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfotMAA"> Indian Veterinary Research Institute (India)</a></td> 
            <td><span class="label lightblue">Agriculture</span></td>
            <td>Research</td>
            <td><span class="label  lightblue">Asia</span><span class="label  lightblue">India</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfoyMAA"> Industrial Technology Research Institute</a></td> 
            <td><span class="label lightblue">Coal Mines</span><span class="label lightblue">MSW</span><span class="label lightblue">Oil &amp; Gas</span></td>
            <td>Other</td>
            <td><span class="label  lightblue">Taiwan</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfozMAA"> Industry Support Systems Limited</a></td> 
            <td><span class="label lightblue">Oil &amp; Gas</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Nigeria</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AG000000jdTYtMAM"> Ingenieria Aplicada Telecomunicaciones (I+A)</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">Coal Mines</span><span class="label lightblue">MSW</span><span class="label lightblue">Oil &amp; Gas</span><span class="label lightblue">Wastewater</span><span class="label lightblue">Biogas</span><span class="label lightblue">All GMI Topics</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Partnership-wide</span><span class="label  lightblue">Latin America</span><span class="label  lightblue">South America</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0At00000035dXDEAY"> Innergy Tech Inc.</a></td> 
            <td><span class="label lightblue">Oil &amp; Gas</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Partnership-wide</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfp5MAA"> Innovative Industrial Equipment Pvt Ltd</a></td> 
            <td><span class="label lightblue">Other</span></td>
            <td>Research</td>
            <td><span class="label  lightblue">Partnership-wide</span><span class="label  lightblue">Asia</span><span class="label  lightblue">India</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfp8MAA"> Institute for Environmental Management, Inc.</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">MSW</span></td>
            <td>Other</td>
            <td><span class="label  lightblue">United States</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0At0000000wQbWEAU"> Integrated Development Association (IDEA)</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">MSW</span><span class="label lightblue">Wastewater</span><span class="label lightblue">Other</span><span class="label lightblue">Biogas</span></td>
            <td>NGO</td>
            <td><span class="label  lightblue">Partnership-wide</span><span class="label  lightblue">Asia</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfpGMAQ"> Integrated Gas Recovery Services Inc.</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">Other</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Canada</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfpLMAQ"> International Bioenergy Research Center</a></td> 
            <td><span class="label lightblue">Agriculture</span></td>
            <td>Research</td>
            <td><span class="label  lightblue">Republic of Korea (South Korea)</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AG000000jdgIMMAY"> International Met (Intermet) Systems</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">Coal Mines</span><span class="label lightblue">MSW</span><span class="label lightblue">Oil &amp; Gas</span><span class="label lightblue">Wastewater</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Partnership-wide</span><span class="label  lightblue">North America</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfpTMAQ"> International Renewable Resources Institute - Mexico (IRRI)</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">MSW</span></td>
            <td>Other</td>
            <td><span class="label  lightblue">Partnership-wide</span><span class="label  lightblue">Mexico</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AG00000081pIlMAI"> Intertranstechno FZC</a></td> 
            <td><span class="label lightblue">Coal Mines</span><span class="label lightblue">MSW</span><span class="label lightblue">Oil &amp; Gas</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Europe</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AG00000081pJAMAY"> Inversiones Guacamaya Honduras</a></td> 
            <td><span class="label lightblue">Agriculture</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Partnership-wide</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfpZMAQ"> Irbaris</a></td> 
            <td><span class="label lightblue">Coal Mines</span><span class="label lightblue">MSW</span><span class="label lightblue">Oil &amp; Gas</span><span class="label lightblue">All GMI Topics</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Africa</span><span class="label  lightblue">Canada</span><span class="label  lightblue">Kazakhstan</span><span class="label  lightblue">Russia</span><span class="label  lightblue">Ukraine</span><span class="label  lightblue">United Kingdom</span><span class="label  lightblue">United States</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfpaMAA"> IRT Consult Inc.</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">Coal Mines</span><span class="label lightblue">MSW</span><span class="label lightblue">Oil &amp; Gas</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Partnership-wide</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfpcMAA"> Ishikawajima-Harima Heavy Industries Co., Ltd.</a></td> 
            <td><span class="label lightblue">Coal Mines</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Japan</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AG000000A7AIJMA3"> Istanbul Technical University (ITU)</a></td> 
            <td><span class="label lightblue">MSW</span><span class="label lightblue">Wastewater</span><span class="label lightblue">Biogas</span></td>
            <td>University</td>
            <td><span class="label  lightblue">Turkey</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfphMAA"> ITT Corporation</a></td> 
            <td><span class="label lightblue">Oil &amp; Gas</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">North America</span><span class="label  lightblue">South America</span><span class="label  lightblue">United States</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfplMAA"> Jamia Millia Islamia University, New Delhi</a></td> 
            <td><span class="label lightblue">MSW</span><span class="label lightblue">Oil &amp; Gas</span></td>
            <td>Research</td>
            <td><span class="label  lightblue">Partnership-wide</span><span class="label  lightblue">Asia</span><span class="label  lightblue">India</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfpnMAA"> Janechek &amp; Associates</a></td> 
            <td><span class="label lightblue">MSW</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Partnership-wide</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000005lp4zMAA"> Japan Ministry of Economy, Trade and Industry</a></td> 
            <td><span class="label lightblue">Coal Mines</span><span class="label lightblue">MSW</span><span class="label lightblue">Oil &amp; Gas</span></td>
            <td>Government</td>
            <td><span class="label  lightblue">Asia</span><span class="label  lightblue">Indonesia</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfpqMAA"> JAPAN NUS Co., Ltd.</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">Coal Mines</span><span class="label lightblue">MSW</span><span class="label lightblue">Oil &amp; Gas</span></td>
            <td>Research</td>
            <td><span class="label  lightblue">Japan</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfvmMAA"> Japan Resouces Dept., JCOAL</a></td> 
            <td><span class="label lightblue">Oil &amp; Gas</span></td>
            <td>Research</td>
            <td><span class="label  lightblue">Japan</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AG0000008jsnsMAA"> John Zink Hamworthy Combustion</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">Coal Mines</span><span class="label lightblue">MSW</span><span class="label lightblue">Oil &amp; Gas</span><span class="label lightblue">Other</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Partnership-wide</span><span class="label  lightblue">Asia</span><span class="label  lightblue">Indonesia</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0At0000002xny8EAA"> Jose Luis Davila</a></td> 
            <td><span class="label lightblue">Wastewater</span><span class="label lightblue">Landfill</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Partnership-wide</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfpvMAA"> JPB Holdings, LLC</a></td> 
            <td><span class="label lightblue">MSW</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">United States</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0At0000000W1EsEAK"> JSC National Company</a></td> 
            <td><span class="label lightblue">Oil &amp; Gas</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Partnership-wide</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfpwMAA"> Juan Manuel Lopez H. - Consultor Ambiental</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">Other</span></td>
            <td>Research</td>
            <td><span class="label  lightblue">Partnership-wide</span><span class="label  lightblue">South America</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfpxMAA"> Julius Kewir Tangka</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">Biogas</span></td>
            <td>Research</td>
            <td><span class="label  lightblue">Cameroon</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfpyMAA"> K. National Traders</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">Coal Mines</span></td>
            <td>Other</td>
            <td><span class="label  lightblue">Asia</span><span class="label  lightblue">Pakistan</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AG00000081pJPMAY"> Kaifa Performa Kapital</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">Coal Mines</span><span class="label lightblue">MSW</span><span class="label lightblue">Oil &amp; Gas</span></td>
            <td>NGO</td>
            <td><span class="label  lightblue">Partnership-wide</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AG00000081pM2MAI"> Karadeniz Technical University, Mining and Engineering Department</a></td> 
            <td><span class="label lightblue">Coal Mines</span><span class="label lightblue">Oil &amp; Gas</span></td>
            <td>Research</td>
            <td><span class="label  lightblue">Europe</span><span class="label  lightblue">Turkey</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfq1MAA"> Kassinga (W.A.), Inc.</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">MSW</span><span class="label lightblue">Oil &amp; Gas</span><span class="label lightblue">Wastewater</span></td>
            <td>Financial Institution</td>
            <td><span class="label  lightblue">Africa</span><span class="label  lightblue">Nigeria</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfq3MAA"> Katowicki Holding Weglowy SA (KHW)</a></td> 
            <td><span class="label lightblue">Coal Mines</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Poland</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfq5MAA"> Kazakhstan Trade Consultants</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">Coal Mines</span><span class="label lightblue">MSW</span><span class="label lightblue">Oil &amp; Gas</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Partnership-wide</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfq7MAA"> KCI Technologies, Inc.</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">Coal Mines</span><span class="label lightblue">MSW</span><span class="label lightblue">Oil &amp; Gas</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Partnership-wide</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfjAMAQ"> Kenya Department of Renewable Energy, Min. of Energy</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">MSW</span></td>
            <td>Government</td>
            <td><span class="label  lightblue">Argentina</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AG00000094pCeMAI"> Kesari Renewal Energies</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">Other</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Asia</span><span class="label  lightblue">India</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qg0NMAQ"> Kimley-Horn</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">Coal Mines</span><span class="label lightblue">MSW</span><span class="label lightblue">Wastewater</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Partnership-wide</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfqAMAQ"> KINEK Ltd</a></td> 
            <td><span class="label lightblue">MSW</span><span class="label lightblue">Oil &amp; Gas</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Ukraine</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfqCMAQ"> Klein Dassenberg Pure Energy</a></td> 
            <td><span class="label lightblue">Agriculture</span></td>
            <td>Research</td>
            <td><span class="label  lightblue">Africa</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0At0000002xny9EAA"> Klinserve Environmental Solutions</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">Biogas</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Partnership-wide</span><span class="label  lightblue">Africa</span><span class="label  lightblue">Nigeria</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AG0000008KnDgMAK"> KOE Environmental Consultancy, Inc.</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">Coal Mines</span><span class="label lightblue">MSW</span><span class="label lightblue">Oil &amp; Gas</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Partnership-wide</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfqHMAQ"> Korea National Oil Corporation</a></td> 
            <td><span class="label lightblue">Oil &amp; Gas</span></td>
            <td>Government</td>
            <td><span class="label  lightblue">Republic of Korea (South Korea)</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfqKMAQ"> Kwality Boot House</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">Coal Mines</span><span class="label lightblue">MSW</span><span class="label lightblue">Oil &amp; Gas</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Partnership-wide</span><span class="label  lightblue">Asia</span><span class="label  lightblue">India</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfqMMAQ"> KYOTOenergy Pte Ltd</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">MSW</span><span class="label lightblue">Other</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Singapore</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AG00000081pKDMAY"> L.N.K</a></td> 
            <td><span class="label lightblue">MSW</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Partnership-wide</span><span class="label  lightblue">Europe</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfqOMAQ"> Lakes Environmental</a></td> 
            <td><span class="label lightblue">Coal Mines</span><span class="label lightblue">MSW</span><span class="label lightblue">Oil &amp; Gas</span></td>
            <td>Research</td>
            <td><span class="label  lightblue">Canada</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfqRMAQ"> Landfill Gas Recovery</a></td> 
            <td><span class="label lightblue">MSW</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Partnership-wide</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfqTMAQ"> LandGas Technology, LLC</a></td> 
            <td><span class="label lightblue">Coal Mines</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">United States</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfqUMAQ"> LANDTEC North America, Inc.</a></td> 
            <td><span class="label lightblue">MSW</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">United States</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfqWMAQ"> Lars Enviro Pvt. Ltd.</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">Wastewater</span><span class="label lightblue">Other</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Asia</span><span class="label  lightblue">India</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfqZMAQ"> Leak Finder, Inc.</a></td> 
            <td><span class="label lightblue">Coal Mines</span><span class="label lightblue">MSW</span><span class="label lightblue">Oil &amp; Gas</span><span class="label lightblue">Other</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Partnership-wide</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfqaMAA"> Leak Surveys, Inc.</a></td> 
            <td><span class="label lightblue">Oil &amp; Gas</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">United States</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfqeMAA"> LFG Technologies, Inc.</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">Coal Mines</span><span class="label lightblue">MSW</span><span class="label lightblue">Oil &amp; Gas</span><span class="label lightblue">Other</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">United States</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AG00000081pKTMAY"> LI-COR Biosciences</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">MSW</span><span class="label lightblue">Oil &amp; Gas</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Partnership-wide</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AG00000095rD6MAI"> LiDAR Services International Inc.</a></td> 
            <td><span class="label lightblue">Coal Mines</span><span class="label lightblue">MSW</span><span class="label lightblue">Oil &amp; Gas</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Partnership-wide</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AG000000jDZQjMAO"> Linde AG</a></td> 
            <td><span class="label lightblue">Oil &amp; Gas</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Partnership-wide</span><span class="label  lightblue">Europe</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfqlMAA"> LMS Energy</a></td> 
            <td><span class="label lightblue">Coal Mines</span><span class="label lightblue">MSW</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Australia</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfqpMAA"> LumaSense Technologies</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">MSW</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Partnership-wide</span><span class="label  lightblue">Africa</span><span class="label  lightblue">Asia</span><span class="label  lightblue">Europe</span><span class="label  lightblue">Middle East</span><span class="label  lightblue">South America</span><span class="label  lightblue">Argentina</span><span class="label  lightblue">Australia</span><span class="label  lightblue">Brazil</span><span class="label  lightblue">Canada</span><span class="label  lightblue">China</span><span class="label  lightblue">Colombia</span><span class="label  lightblue">Ecuador</span><span class="label  lightblue">European Commission</span><span class="label  lightblue">Germany</span><span class="label  lightblue">India</span><span class="label  lightblue">Italy</span><span class="label  lightblue">Japan</span><span class="label  lightblue">Mexico</span><span class="label  lightblue">Mongolia</span><span class="label  lightblue">Nigeria</span><span class="label  lightblue">Pakistan</span><span class="label  lightblue">Philippines</span><span class="label  lightblue">Poland</span><span class="label  lightblue">Republic of Korea (South Korea)</span><span class="label  lightblue">Russia</span><span class="label  lightblue">Thailand</span><span class="label  lightblue">Ukraine</span><span class="label  lightblue">United Kingdom</span><span class="label  lightblue">United States</span><span class="label  lightblue">Vietnam</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfqqMAA"> Lumina energia</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">MSW</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Partnership-wide</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfqrMAA"> Lungagas Pty LTD</a></td> 
            <td><span class="label lightblue">Coal Mines</span><span class="label lightblue">Oil &amp; Gas</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Australia</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfqtMAA"> M/S TCE Consulting Engineers Ltd.</a></td> 
            <td><span class="label lightblue">Coal Mines</span><span class="label lightblue">MSW</span><span class="label lightblue">Oil &amp; Gas</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">India</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfquMAA"> Mack Glass LLC</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">Coal Mines</span><span class="label lightblue">MSW</span><span class="label lightblue">Oil &amp; Gas</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Partnership-wide</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AG00000081pKyMAI"> Magic Green Solutions</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">Coal Mines</span><span class="label lightblue">MSW</span><span class="label lightblue">Oil &amp; Gas</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Partnership-wide</span><span class="label  lightblue">Europe</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfqyMAA"> Maharishi Dayanand Gosamwardhan Kendra</a></td> 
            <td><span class="label lightblue">Agriculture</span></td>
            <td>Other</td>
            <td><span class="label  lightblue">India</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfr1MAA"> Managing Emissions Pvt Ltd</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">Coal Mines</span><span class="label lightblue">MSW</span><span class="label lightblue">Oil &amp; Gas</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Africa</span><span class="label  lightblue">Asia</span><span class="label  lightblue">South America</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfr3MAA"> Mannvit Engineering</a></td> 
            <td><span class="label lightblue">Other</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Partnership-wide</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AG0000009uJc7MAE"> Maq Energy Services</a></td> 
            <td><span class="label lightblue">Oil &amp; Gas</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Africa</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfvUMAQ"> Martin Construction Resource LLC (formerly RCM)</a></td> 
            <td><span class="label lightblue">Agriculture</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Partnership-wide</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfr6MAA"> Marubeni Corporation</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">Coal Mines</span><span class="label lightblue">MSW</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Japan</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfr9MAA"> Mavi Consultants</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">MSW</span><span class="label lightblue">Oil &amp; Gas</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Turkey</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfrAMAQ"> McLellan and Partners Ltd</a></td> 
            <td><span class="label lightblue">MSW</span><span class="label lightblue">Oil &amp; Gas</span><span class="label lightblue">Other</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">United Kingdom</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0At0000000mpJ7EAI"> Mercados Energy Markets India</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">MSW</span><span class="label lightblue">Wastewater</span><span class="label lightblue">Biogas</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Asia</span><span class="label  lightblue">India</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfrGMAQ"> Mercator Lines Ltd.</a></td> 
            <td><span class="label lightblue">Coal Mines</span><span class="label lightblue">Oil &amp; Gas</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">India</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfrHMAQ"> Mercy Foundation</a></td> 
            <td><span class="label lightblue">Agriculture</span></td>
            <td>Other</td>
            <td><span class="label  lightblue">United States</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfrIMAQ"> Meru Kapital Pvt.Ltd.</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">Coal Mines</span><span class="label lightblue">MSW</span><span class="label lightblue">Oil &amp; Gas</span></td>
            <td>Financial Institution</td>
            <td><span class="label  lightblue">Partnership-wide</span><span class="label  lightblue">Asia</span><span class="label  lightblue">India</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfrKMAQ"> Merzbach Group, LLC</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">Coal Mines</span><span class="label lightblue">MSW</span><span class="label lightblue">Oil &amp; Gas</span><span class="label lightblue">Other</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">United States</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfrMMAQ"> Metan Ltd.</a></td> 
            <td><span class="label lightblue">Other</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Iceland</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfrNMAQ"> Meter Mate</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">Other</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">South Africa</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AG000000cK9q6MAC"> MetGas Industries</a></td> 
            <td><span class="label lightblue">Coal Mines</span><span class="label lightblue">Oil &amp; Gas</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">North America</span><span class="label  lightblue">Canada</span><span class="label  lightblue">United States</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfrQMAQ"> Metro Vancouver</a></td> 
            <td><span class="label lightblue">MSW</span></td>
            <td>Government</td>
            <td><span class="label  lightblue">Canada</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfrRMAQ"> Metro Waste Handling Pvt. Ltd.</a></td> 
            <td><span class="label lightblue">MSW</span><span class="label lightblue">Oil &amp; Gas</span><span class="label lightblue">Other</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Partnership-wide</span><span class="label  lightblue">Asia</span><span class="label  lightblue">India</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfrYMAQ"> MIECOFT Consultants &amp; Services</a></td> 
            <td><span class="label lightblue">Other</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">India</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfrtMAA"> Ministry of Energy of Iran</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">Other</span></td>
            <td>Government</td>
            <td><span class="label  lightblue">Iran</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfsPMAQ"> Mitsubishi Heavy Industries, Ltd.</a></td> 
            <td><span class="label lightblue">Coal Mines</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Japan</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AG00000081pPwMAI"> Modern Technology Methods</a></td> 
            <td><span class="label lightblue">Agriculture</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">North America</span><span class="label  lightblue">United States</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfgdMAA"> Mor Hydro</a></td> 
            <td><span class="label lightblue">MSW</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Latin America</span><span class="label  lightblue">Mexico</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AG000000NEdU8MAL"> Motunrayo Martins &amp; Co (Legal Practitioners)</a></td> 
            <td><span class="label lightblue">Oil &amp; Gas</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Partnership-wide</span><span class="label  lightblue">Africa</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfscMAA"> MTM Capital Partners Limited</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">Coal Mines</span><span class="label lightblue">MSW</span><span class="label lightblue">Oil &amp; Gas</span></td>
            <td>Financial Institution</td>
            <td><span class="label  lightblue">United Kingdom</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AG000000k73RzMAI"> Municipality of Valladolid</a></td> 
            <td><span class="label lightblue">MSW</span></td>
            <td>Government</td>
            <td><span class="label  lightblue">Mexico</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfsjMAA"> MWH sa</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">Coal Mines</span><span class="label lightblue">MSW</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Belgium</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfjGMAQ"> MWM GmbH</a></td> 
            <td><span class="label lightblue">Coal Mines</span><span class="label lightblue">MSW</span><span class="label lightblue">Oil &amp; Gas</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Partnership-wide</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0At0000004U31fEAC"> MxTEQ SERVICE</a></td> 
            <td><span class="label lightblue">Coal Mines</span><span class="label lightblue">Oil &amp; Gas</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Partnership-wide</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfskMAA"> My Africa</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">Coal Mines</span><span class="label lightblue">MSW</span><span class="label lightblue">Oil &amp; Gas</span></td>
            <td>Research</td>
            <td><span class="label  lightblue">United States</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfspMAA"> National Association of Regulatory Utility Commissioners (NARUC)</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">Coal Mines</span><span class="label lightblue">MSW</span><span class="label lightblue">Oil &amp; Gas</span><span class="label lightblue">Wastewater</span></td>
            <td>Other</td>
            <td><span class="label  lightblue">Partnership-wide</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qft7MAA"> National Environmental Engineering Research Institute (NEERI)</a></td> 
            <td><span class="label lightblue">Coal Mines</span><span class="label lightblue">Oil &amp; Gas</span><span class="label lightblue">Biogas</span></td>
            <td>Research</td>
            <td><span class="label  lightblue">India</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qft0MAA"> National Taitung University</a></td> 
            <td><span class="label lightblue">Other</span></td>
            <td>Research</td>
            <td><span class="label  lightblue">Taiwan</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfzaMAA"> National University of the Center of the Buenos Aires Province (UNICEN)</a></td> 
            <td><span class="label lightblue">MSW</span><span class="label lightblue">Biogas</span></td>
            <td>University</td>
            <td><span class="label  lightblue">Argentina</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qft5MAA"> Navyug Sewa Sansthan</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">MSW</span><span class="label lightblue">Oil &amp; Gas</span></td>
            <td>NGO</td>
            <td><span class="label  lightblue">Partnership-wide</span><span class="label  lightblue">Asia</span><span class="label  lightblue">India</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qft9MAA"> Nepal Agricultural Research Council</a></td> 
            <td><span class="label lightblue">Agriculture</span></td>
            <td>Research</td>
            <td><span class="label  lightblue">Nepal</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qftDMAQ"> New Energy Capital Invest</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">Coal Mines</span><span class="label lightblue">MSW</span><span class="label lightblue">Oil &amp; Gas</span><span class="label lightblue">Wastewater</span></td>
            <td>Financial Institution</td>
            <td><span class="label  lightblue">Partnership-wide</span><span class="label  lightblue">Austria</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qftFMAQ"> Newport Recycling Corp dba AR Waste</a></td> 
            <td><span class="label lightblue">MSW</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Partnership-wide</span><span class="label  lightblue">North America</span><span class="label  lightblue">United States</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfpKMAQ"> NGV Global</a></td> 
            <td><span class="label lightblue">Agriculture</span></td>
            <td>Other</td>
            <td><span class="label  lightblue">Partnership-wide</span><span class="label  lightblue">Australia/Oceania</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0At0000004TsefEAC"> NGV SEA</a></td> 
            <td><span class="label lightblue">Biogas</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Asia</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qftPMAQ"> Niko Consult Nigeria Ltd</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">Coal Mines</span><span class="label lightblue">MSW</span><span class="label lightblue">Oil &amp; Gas</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Nigeria</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qftRMAQ"> NL Agency</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">MSW</span><span class="label lightblue">Oil &amp; Gas</span><span class="label lightblue">Other</span></td>
            <td>Government</td>
            <td><span class="label  lightblue">Partnership-wide</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qftSMAQ"> Non-Conventional Energy &amp; Rural Dev. Society</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">MSW</span><span class="label lightblue">Other</span></td>
            <td>Other</td>
            <td><span class="label  lightblue">India</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000005HbEYMA0"> None</a></td> 
            <td><span class="label lightblue">MSW</span></td>
            <td>Other</td>
            <td><span class="label  lightblue">Africa</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qftWMAQ"> Northeast Energy Systems</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">Coal Mines</span><span class="label lightblue">MSW</span><span class="label lightblue">Oil &amp; Gas</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">United States</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AG00000081pQQMAY"> Norwegian University for Natural Sciences &amp; Tech.</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">Other</span></td>
            <td>Research</td>
            <td><span class="label  lightblue">Africa</span><span class="label  lightblue">Europe</span><span class="label  lightblue">North America</span><span class="label  lightblue">South America</span><span class="label  lightblue">Canada</span><span class="label  lightblue">Colombia</span><span class="label  lightblue">Nigeria</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qftdMAA"> Nouveau Energy Management Services</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">Coal Mines</span><span class="label lightblue">MSW</span><span class="label lightblue">Oil &amp; Gas</span><span class="label lightblue">Biogas</span><span class="label lightblue">All GMI Topics</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Partnership-wide</span><span class="label  lightblue">Asia</span><span class="label  lightblue">Australia/Oceania</span><span class="label  lightblue">Europe</span><span class="label  lightblue">Middle East</span><span class="label  lightblue">North America</span><span class="label  lightblue">South America</span><span class="label  lightblue">Pakistan</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0At0000001oswgEAA"> Nova Geotechnical and Inspection Services</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">Coal Mines</span><span class="label lightblue">MSW</span><span class="label lightblue">Oil &amp; Gas</span><span class="label lightblue">Wastewater</span><span class="label lightblue">Biogas</span><span class="label lightblue">All GMI Topics</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Partnership-wide</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfteMAA"> Novagon Ltd.</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">MSW</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Israel</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AG00000094pAxMAI"> Novena University</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">Coal Mines</span><span class="label lightblue">MSW</span><span class="label lightblue">Oil &amp; Gas</span><span class="label lightblue">Wastewater</span><span class="label lightblue">Other</span></td>
            <td>University</td>
            <td><span class="label  lightblue">Africa</span><span class="label  lightblue">Nigeria</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qftfMAA"> NPB Associates</a></td> 
            <td><span class="label lightblue">MSW</span><span class="label lightblue">Oil &amp; Gas</span><span class="label lightblue">Biogas</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">United States</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfthMAA"> Numark Associates, Inc.</a></td> 
            <td><span class="label lightblue">MSW</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Chile</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0At000000132CFEAY"> Nutawa sagl</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">Coal Mines</span><span class="label lightblue">MSW</span><span class="label lightblue">Oil &amp; Gas</span><span class="label lightblue">Wastewater</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Partnership-wide</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qftjMAA"> Nuworld Research and Development</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">Coal Mines</span><span class="label lightblue">MSW</span><span class="label lightblue">Other</span></td>
            <td>Research</td>
            <td><span class="label  lightblue">Canada</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qftkMAA"> nxG Energy</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">Coal Mines</span><span class="label lightblue">MSW</span><span class="label lightblue">Oil &amp; Gas</span><span class="label lightblue">Other</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Partnership-wide</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AG0000008m7o5MAA"> Octaform</a></td> 
            <td><span class="label lightblue">Agriculture</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Partnership-wide</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0At0000002xnyAEAQ"> Oda Bultum University</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">Wastewater</span><span class="label lightblue">Landfill</span></td>
            <td>University</td>
            <td><span class="label  lightblue">Partnership-wide</span><span class="label  lightblue">Africa</span><span class="label  lightblue">Ethiopia</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qftqMAA"> Ogooue Global, LLC</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">Coal Mines</span><span class="label lightblue">MSW</span><span class="label lightblue">Oil &amp; Gas</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Partnership-wide</span><span class="label  lightblue">Africa</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfttMAA"> Oil Gas CBM Services Pty Ltd</a></td> 
            <td><span class="label lightblue">Oil &amp; Gas</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Australia</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AG000000gyOQGMA2"> Oil Industry Safety Directorate</a></td> 
            <td><span class="label lightblue">Oil &amp; Gas</span></td>
            <td>Government</td>
            <td><span class="label  lightblue">India</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qftuMAA"> Oil Production Research Inst. ShengLi Oil Field</a></td> 
            <td><span class="label lightblue">Coal Mines</span><span class="label lightblue">MSW</span><span class="label lightblue">Oil &amp; Gas</span></td>
            <td>Government</td>
            <td><span class="label  lightblue">Australia/Oceania</span><span class="label  lightblue">Colombia</span><span class="label  lightblue">Dominican Republic</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qftvMAA"> OLEEV Group</a></td> 
            <td><span class="label lightblue">MSW</span><span class="label lightblue">Oil &amp; Gas</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">United States</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0At0000002NHqYEAW"> Onboard Dynamics, Inc.</a></td> 
            <td><span class="label lightblue">Coal Mines</span><span class="label lightblue">Oil &amp; Gas</span><span class="label lightblue">Biogas</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Partnership-wide</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AG0000008KnGOMA0"> Ontario Ministry of Agriculture, Food and Rural Affairs</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">Biogas</span></td>
            <td>Government</td>
            <td><span class="label  lightblue">Canada</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0At0000002WpFWEA0"> OPRA Turbines</a></td> 
            <td><span class="label lightblue">MSW</span><span class="label lightblue">Oil &amp; Gas</span><span class="label lightblue">Biogas</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Partnership-wide</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AG00000081pR1MAI"> Optimum Gem Products</a></td> 
            <td><span class="label lightblue">MSW</span><span class="label lightblue">Oil &amp; Gas</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Partnership-wide</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfu1MAA"> Organic Power Ltd</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">Oil &amp; Gas</span><span class="label lightblue">Other</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">United Kingdom</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfu3MAA"> Organics Group plc</a></td> 
            <td><span class="label lightblue">MSW</span><span class="label lightblue">Oil &amp; Gas</span><span class="label lightblue">Other</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Thailand</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfu5MAA"> ORVECON</a></td> 
            <td><span class="label lightblue">Oil &amp; Gas</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Ecuador</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfu6MAA"> Osaka Gas Co., Ltd</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">MSW</span><span class="label lightblue">Oil &amp; Gas</span><span class="label lightblue">Other</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Japan</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfu7MAA"> OTA Associates</a></td> 
            <td><span class="label lightblue">Coal Mines</span><span class="label lightblue">Oil &amp; Gas</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Partnership-wide</span><span class="label  lightblue">Africa</span><span class="label  lightblue">Asia</span><span class="label  lightblue">Australia/Oceania</span><span class="label  lightblue">Europe</span><span class="label  lightblue">Middle East</span><span class="label  lightblue">North America</span><span class="label  lightblue">South America</span><span class="label  lightblue">India</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfuBMAQ"> Pakways</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">MSW</span><span class="label lightblue">Oil &amp; Gas</span><span class="label lightblue">Other</span></td>
            <td>Other</td>
            <td><span class="label  lightblue">Panama</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfuCMAQ"> Pan African Vision for the Environment(PAVE)</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">Coal Mines</span><span class="label lightblue">MSW</span><span class="label lightblue">Oil &amp; Gas</span><span class="label lightblue">Wastewater</span><span class="label lightblue">Biogas</span><span class="label lightblue">All GMI Topics</span></td>
            <td>Other</td>
            <td><span class="label  lightblue">Nigeria</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfuGMAQ"> PARENIN</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">Coal Mines</span><span class="label lightblue">MSW</span><span class="label lightblue">Oil &amp; Gas</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Partnership-wide</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfuJMAQ"> Pastoralists of Tanzania Climate Change Alliance</a></td> 
            <td><span class="label lightblue">Agriculture</span></td>
            <td>Other</td>
            <td><span class="label  lightblue">Kenya</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0At00000036IPNEA2"> Patriot Well Solutions LLC</a></td> 
            <td><span class="label lightblue">Oil &amp; Gas</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Partnership-wide</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AG000000cLueSMAS"> Pentagon Technology Co Ltd</a></td> 
            <td><span class="label lightblue">Agriculture</span></td>
            <td>Other</td>
            <td><span class="label  lightblue">Africa</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfuTMAQ"> Perspectives Climate Change</a></td> 
            <td><span class="label lightblue">Coal Mines</span><span class="label lightblue">MSW</span><span class="label lightblue">Oil &amp; Gas</span><span class="label lightblue">Other</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Germany</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfuWMAQ"> Petroland Nigeria Limited</a></td> 
            <td><span class="label lightblue">Oil &amp; Gas</span><span class="label lightblue">Wastewater</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Nigeria</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfuYMAQ"> Petroleum Club of Romania</a></td> 
            <td><span class="label lightblue">Oil &amp; Gas</span></td>
            <td>Other</td>
            <td><span class="label  lightblue">Romania</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AG00000082cJXMAY"> Petrolinvest DD</a></td> 
            <td><span class="label lightblue">Coal Mines</span><span class="label lightblue">Oil &amp; Gas</span><span class="label lightblue">Wastewater</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Partnership-wide</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfuZMAQ"> Petromin Resources Ltd.</a></td> 
            <td><span class="label lightblue">Coal Mines</span><span class="label lightblue">MSW</span><span class="label lightblue">Oil &amp; Gas</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Canada</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AG00000081sv2MAA"> Philippine Rice Research Institute</a></td> 
            <td><span class="label lightblue">Agriculture</span></td>
            <td>Research</td>
            <td><span class="label  lightblue">Partnership-wide</span><span class="label  lightblue">Asia</span><span class="label  lightblue">Philippines</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfudMAA"> Picarro, Inc.</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">Coal Mines</span><span class="label lightblue">MSW</span><span class="label lightblue">Oil &amp; Gas</span><span class="label lightblue">Other</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">United States</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfuhMAA"> PK Ores Private Ltd.</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">Coal Mines</span><span class="label lightblue">Oil &amp; Gas</span></td>
            <td>Financial Institution</td>
            <td><span class="label  lightblue">Partnership-wide</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AG000000ifYLqMAM"> PlanIt Green Sustainable Energy Development, LLC</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">MSW</span><span class="label lightblue">Oil &amp; Gas</span><span class="label lightblue">Wastewater</span><span class="label lightblue">Biogas</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Partnership-wide</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfujMAA"> Plant Process Equipment Inc.</a></td> 
            <td><span class="label lightblue">Coal Mines</span><span class="label lightblue">MSW</span><span class="label lightblue">Oil &amp; Gas</span><span class="label lightblue">Other</span><span class="label lightblue">Biogas</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">United States</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfunMAA"> POCH Ambiental S.A</a></td> 
            <td><span class="label lightblue">Agriculture</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Partnership-wide</span><span class="label  lightblue">South America</span><span class="label  lightblue">Chile</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AG00000081syaMAA"> Pollux Consulting</a></td> 
            <td><span class="label lightblue">Coal Mines</span><span class="label lightblue">MSW</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Partnership-wide</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfuqMAA"> Pondicherry Engineering College</a></td> 
            <td><span class="label lightblue">Other</span></td>
            <td>Research</td>
            <td><span class="label  lightblue">India</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfurMAA"> Positive Energy Alternatives, LLC</a></td> 
            <td><span class="label lightblue">Agriculture</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">North America</span><span class="label  lightblue">United States</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfutMAA"> PPE Machtron Co, Ltd</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">MSW</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Thailand</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0At0000002NhvREAS"> Prabhu Energy Labs</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">Coal Mines</span><span class="label lightblue">MSW</span><span class="label lightblue">Oil &amp; Gas</span><span class="label lightblue">Wastewater</span><span class="label lightblue">Other</span><span class="label lightblue">Biogas</span></td>
            <td>Research</td>
            <td><span class="label  lightblue">Partnership-wide</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfuuMAA"> Prestels</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">MSW</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Asia</span><span class="label  lightblue">India</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfuzMAA"> PRM Energy Systems, Inc.</a></td> 
            <td><span class="label lightblue">Coal Mines</span><span class="label lightblue">Other</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Asia</span><span class="label  lightblue">Thailand</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfv5MAA"> Promigas S.A. ESP</a></td> 
            <td><span class="label lightblue">Coal Mines</span><span class="label lightblue">Oil &amp; Gas</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Colombia</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfvAMAQ"> PRUHESA</a></td> 
            <td><span class="label lightblue">Other</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Mexico</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0At0000002xnyBEAQ"> Puralab s.r.o.</a></td> 
            <td><span class="label lightblue">Landfill</span><span class="label lightblue">Other: Chemical industry</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Partnership-wide</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0At0000000W0B4EAK"> PVG GmbH - Resources Services &amp; Management</a></td> 
            <td><span class="label lightblue">Coal Mines</span><span class="label lightblue">MSW</span><span class="label lightblue">Oil &amp; Gas</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Partnership-wide</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfvFMAQ"> QED Environmental Systems, Inc.</a></td> 
            <td><span class="label lightblue">MSW</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">United States</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfvHMAQ"> Quality Tonnes</a></td> 
            <td><span class="label lightblue">MSW</span><span class="label lightblue">Oil &amp; Gas</span></td>
            <td>Research</td>
            <td><span class="label  lightblue">Argentina</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfvIMAQ"> Quanelle, LLC</a></td> 
            <td><span class="label lightblue">MSW</span><span class="label lightblue">Oil &amp; Gas</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">United States</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfvJMAQ"> Quantum Dynamics Inc.</a></td> 
            <td><span class="label lightblue">Oil &amp; Gas</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Partnership-wide</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfvKMAQ"> Quarrysolve</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">Coal Mines</span><span class="label lightblue">MSW</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Partnership-wide</span><span class="label  lightblue">Australia/Oceania</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfvLMAQ"> Queensland Resource Council</a></td> 
            <td><span class="label lightblue">Coal Mines</span><span class="label lightblue">MSW</span><span class="label lightblue">Oil &amp; Gas</span></td>
            <td>Other</td>
            <td><span class="label  lightblue">Australia</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfvMMAQ"> Quest Integrated</a></td> 
            <td><span class="label lightblue">MSW</span><span class="label lightblue">Oil &amp; Gas</span><span class="label lightblue">All GMI Topics</span></td>
            <td>Research</td>
            <td><span class="label  lightblue">United States</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AG0000007H551MAC"> Questor Technology Inc.</a></td> 
            <td><span class="label lightblue">Coal Mines</span><span class="label lightblue">MSW</span><span class="label lightblue">Oil &amp; Gas</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Partnership-wide</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0At0000001oswlEAA"> Quintessence Biogas</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">Coal Mines</span><span class="label lightblue">Biogas</span></td>
            <td>Other</td>
            <td><span class="label  lightblue">Partnership-wide</span><span class="label  lightblue">Africa</span><span class="label  lightblue">Nigeria</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0At00000035QkAEAU"> r/FPTO</a></td> 
            <td><span class="label lightblue">Coal Mines</span><span class="label lightblue">MSW</span><span class="label lightblue">Oil &amp; Gas</span><span class="label lightblue">Wastewater</span><span class="label lightblue">Biogas</span></td>
            <td>NGO</td>
            <td><span class="label  lightblue">Partnership-wide</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AG000000A9IGEMA3"> RandTech</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">MSW</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Partnership-wide</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfvQMAQ"> Raven Engineered Films</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">Coal Mines</span><span class="label lightblue">MSW</span><span class="label lightblue">Oil &amp; Gas</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">United States</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfvRMAQ"> Raven Knight</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">MSW</span><span class="label lightblue">Oil &amp; Gas</span><span class="label lightblue">Other</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Partnership-wide</span><span class="label  lightblue">Africa</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfvVMAQ"> Raven Ridge Resources, Inc. (RRR)</a></td> 
            <td><span class="label lightblue">Coal Mines</span><span class="label lightblue">Oil &amp; Gas</span><span class="label lightblue">All GMI Topics</span></td>
            <td>Contractor</td>
            <td><span class="label  lightblue">United States</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0At000000134yBEAQ"> RC-WEE Solutions</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">MSW</span><span class="label lightblue">Oil &amp; Gas</span><span class="label lightblue">Wastewater</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Partnership-wide</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfvWMAQ"> Real Environmental Products</a></td> 
            <td><span class="label lightblue">MSW</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Partnership-wide</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfvYMAQ"> RealEnergy, LLC</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">MSW</span><span class="label lightblue">Other</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">United States</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0At0000000xvFlEAI"> RedBioLAC</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">MSW</span><span class="label lightblue">Wastewater</span><span class="label lightblue">Biogas</span></td>
            <td>NGO</td>
            <td><span class="label  lightblue">Latin America</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfvbMAA"> Reliance Industries Limited</a></td> 
            <td><span class="label lightblue">Coal Mines</span><span class="label lightblue">Oil &amp; Gas</span><span class="label lightblue">Other</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">India</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AG0000008KHHHMA4"> Remuch Energy, Inc.</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">MSW</span><span class="label lightblue">Oil &amp; Gas</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Partnership-wide</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfvcMAA"> Renetech AB</a></td> 
            <td><span class="label lightblue">Agriculture</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Europe</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0At0000002xnyCEAQ"> Renew Energy</a></td> 
            <td><span class="label lightblue">Biogas</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Partnership-wide</span><span class="label  lightblue">North America</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfvdMAA"> Renewable Energy Agency (REA)</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">MSW</span></td>
            <td>NGO</td>
            <td><span class="label  lightblue">Ukraine</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfveMAA"> Renewable Energy Association</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">Coal Mines</span></td>
            <td>Other</td>
            <td><span class="label  lightblue">United Kingdom</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfvgMAA"> RenGEN, LLC</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">MSW</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">United States</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfvjMAA"> Research &amp;Supervisory Centre of Underground Mining</a></td> 
            <td><span class="label lightblue">Coal Mines</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Poland</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfvkMAA"> Research Institute for Humanity and Nature</a></td> 
            <td><span class="label lightblue">Oil &amp; Gas</span></td>
            <td>Research</td>
            <td><span class="label  lightblue">Partnership-wide</span><span class="label  lightblue">Asia</span><span class="label  lightblue">Japan</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AG000000A7tcYMAR"> Resource Mobilization Advisors</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">Coal Mines</span><span class="label lightblue">MSW</span><span class="label lightblue">Oil &amp; Gas</span><span class="label lightblue">Biogas</span></td>
            <td>NGO</td>
            <td><span class="label  lightblue">Partnership-wide</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AG000000CLmjIMAT"> Right Path Projects</a></td> 
            <td><span class="label lightblue">MSW</span></td>
            <td>NGO</td>
            <td><span class="label  lightblue">Partnership-wide</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AG000000A8pzDMAR"> Riverstone Environmental Sdn Bhd</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">MSW</span><span class="label lightblue">Oil &amp; Gas</span><span class="label lightblue">Other</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Asia</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0At0000004TNPhEAO"> Rockywood Energy Ltd</a></td> 
            <td><span class="label lightblue">MSW</span><span class="label lightblue">Wastewater</span><span class="label lightblue">Biogas</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Europe</span><span class="label  lightblue">North America</span><span class="label  lightblue">South America</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfw1MAA"> Ro-Flo Compressors, LLC</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">Coal Mines</span><span class="label lightblue">MSW</span><span class="label lightblue">Oil &amp; Gas</span><span class="label lightblue">Other</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Partnership-wide</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfw3MAA"> Rolls-Royce</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">Coal Mines</span><span class="label lightblue">MSW</span><span class="label lightblue">Oil &amp; Gas</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Partnership-wide</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfw8MAA"> Ruby Canyon Engineering, Inc.(RCE)</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">Coal Mines</span><span class="label lightblue">MSW</span><span class="label lightblue">Oil &amp; Gas</span><span class="label lightblue">Biogas</span><span class="label lightblue">All GMI Topics</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Partnership-wide</span><span class="label  lightblue">United States</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfw9MAA"> Run Energy LP</a></td> 
            <td><span class="label lightblue">Coal Mines</span><span class="label lightblue">MSW</span><span class="label lightblue">Oil &amp; Gas</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">United States</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfwAMAQ"> Rural Development Organization</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">Wastewater</span></td>
            <td>Other</td>
            <td><span class="label  lightblue">India</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AG0000008KUg2MAG"> Rural Environment Development Society</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">Other</span></td>
            <td>NGO</td>
            <td><span class="label  lightblue">Asia</span><span class="label  lightblue">India</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfwBMAQ"> RUSDEM-EE</a></td> 
            <td><span class="label lightblue">MSW</span></td>
            <td>Other</td>
            <td><span class="label  lightblue">Russia</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfwFMAQ"> Rwanda Environment Project</a></td> 
            <td><span class="label lightblue">Oil &amp; Gas</span></td>
            <td>Other</td>
            <td><span class="label  lightblue">Rwanda</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfwGMAQ"> RWTH Aachen University</a></td> 
            <td><span class="label lightblue">Oil &amp; Gas</span></td>
            <td>Research</td>
            <td><span class="label  lightblue">Germany</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AG00000081t0rMAA"> S.A. Power Utilities Pvt. Ltd.</a></td> 
            <td><span class="label lightblue">MSW</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Asia</span><span class="label  lightblue">India</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0At0000001osxAEAQ"> Safety Technologies, Ltd.</a></td> 
            <td><span class="label lightblue">Coal Mines</span><span class="label lightblue">Oil &amp; Gas</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Partnership-wide</span><span class="label  lightblue">Russia</span><span class="label  lightblue">Ukraine</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfwIMAQ"> Sagacity, Inc</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">MSW</span><span class="label lightblue">Oil &amp; Gas</span><span class="label lightblue">Other</span><span class="label lightblue">Biogas</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Partnership-wide</span><span class="label  lightblue">United States</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfwSMAQ"> Saras Environment Consultant (SEC)</a></td> 
            <td><span class="label lightblue">MSW</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Partnership-wide</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfwTMAQ"> Satyam Inds Pvt. ltd.</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">Coal Mines</span><span class="label lightblue">MSW</span><span class="label lightblue">Oil &amp; Gas</span><span class="label lightblue">Other</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">India</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfwUMAQ"> SBGI</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">MSW</span><span class="label lightblue">Oil &amp; Gas</span></td>
            <td>Other</td>
            <td><span class="label  lightblue">United Kingdom</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0At0000001jH9zEAE"> Scale Up</a></td> 
            <td><span class="label lightblue">Agriculture</span></td>
            <td>Other</td>
            <td><span class="label  lightblue">Asia</span><span class="label  lightblue">Indonesia</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfwWMAQ"> Scientific Drilling</a></td> 
            <td><span class="label lightblue">Coal Mines</span><span class="label lightblue">Oil &amp; Gas</span><span class="label lightblue">Other</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Partnership-wide</span><span class="label  lightblue">Europe</span><span class="label  lightblue">Georgia</span><span class="label  lightblue">Kazakhstan</span><span class="label  lightblue">Russia</span><span class="label  lightblue">Ukraine</span><span class="label  lightblue">United Kingdom</span><span class="label  lightblue">United States</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0At0000002xnyEEAQ"> Score Diagnostics Limited</a></td> 
            <td><span class="label lightblue">Oil &amp; Gas</span><span class="label lightblue">Wastewater</span><span class="label lightblue">Coal</span><span class="label lightblue">Landfill</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Partnership-wide</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfwZMAQ"> SCS Engineers</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">Coal Mines</span><span class="label lightblue">MSW</span><span class="label lightblue">Oil &amp; Gas</span><span class="label lightblue">Wastewater</span></td>
            <td>Contractor</td>
            <td><span class="label  lightblue">Partnership-wide</span><span class="label  lightblue">North America</span><span class="label  lightblue">United States</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfwbMAA"> SEAF Cleantech Deployment Fund</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">Coal Mines</span><span class="label lightblue">MSW</span></td>
            <td>Financial Institution</td>
            <td><span class="label  lightblue">Partnership-wide</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfwmMAA"> SEE Tech Solution Pvt. Ltd</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">Coal Mines</span><span class="label lightblue">MSW</span><span class="label lightblue">Oil &amp; Gas</span><span class="label lightblue">Other</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">India</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AG00000081t2JMAQ"> Shalin Finland</a></td> 
            <td><span class="label lightblue">Agriculture</span></td>
            <td>NGO</td>
            <td><span class="label  lightblue">Partnership-wide</span><span class="label  lightblue">Africa</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfwuMAA"> Shanghai Haiting Environmental Co. Ltd</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">Coal Mines</span><span class="label lightblue">MSW</span><span class="label lightblue">Oil &amp; Gas</span><span class="label lightblue">Other</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">China</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AG0000008kQA8MAM"> Shanxi HY</a></td> 
            <td><span class="label lightblue">Coal Mines</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">China</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfwxMAA"> Sharp Electrical Services, Inc.</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">Coal Mines</span><span class="label lightblue">MSW</span><span class="label lightblue">Oil &amp; Gas</span><span class="label lightblue">Other</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Nigeria</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfx2MAA"> Short Creek Farm</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">MSW</span><span class="label lightblue">Other</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">United States</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfx3MAA"> Shree Gau Sanrakshan Va Anusandhan Sanstha</a></td> 
            <td><span class="label lightblue">Agriculture</span></td>
            <td>Research</td>
            <td><span class="label  lightblue">Asia</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfx4MAA"> Shreyans Energy Private Limited</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">MSW</span><span class="label lightblue">Wastewater</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Partnership-wide</span><span class="label  lightblue">Asia</span><span class="label  lightblue">India</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfx6MAA"> SIBICO</a></td> 
            <td><span class="label lightblue">MSW</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Russia</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfygMAA"> Smallholders Foundation</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">MSW</span></td>
            <td>Other</td>
            <td><span class="label  lightblue">Africa</span><span class="label  lightblue">Nigeria</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfxIMAQ"> Sneha Enterprises</a></td> 
            <td><span class="label lightblue">MSW</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Partnership-wide</span><span class="label  lightblue">India</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AG00000083EmBMAU"> SNV Netherlands Development Organisation</a></td> 
            <td><span class="label lightblue">Agriculture</span></td>
            <td>NGO</td>
            <td><span class="label  lightblue">Partnership-wide</span><span class="label  lightblue">Africa</span><span class="label  lightblue">Asia</span><span class="label  lightblue">South America</span><span class="label  lightblue">China</span><span class="label  lightblue">Colombia</span><span class="label  lightblue">Ecuador</span><span class="label  lightblue">Ethiopia</span><span class="label  lightblue">Ghana</span><span class="label  lightblue">India</span><span class="label  lightblue">Indonesia</span><span class="label  lightblue">Nicaragua</span><span class="label  lightblue">Peru</span><span class="label  lightblue">Philippines</span><span class="label  lightblue">Thailand</span><span class="label  lightblue">Vietnam</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfxKMAQ"> Society for Environment &amp; Workers Alliance (SEWA)</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">Coal Mines</span><span class="label lightblue">MSW</span></td>
            <td>Other</td>
            <td><span class="label  lightblue">India</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfxLMAQ"> Soil &amp; More International B.V.</a></td> 
            <td><span class="label lightblue">Agriculture</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Netherlands</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AG0000008O2ZLMA0"> Solid Waste Group</a></td> 
            <td><span class="label lightblue">MSW</span></td>
            <td>Research</td>
            <td><span class="label  lightblue">South America</span><span class="label  lightblue">Chile</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfxQMAQ"> Solutions Using Renewable Energy (SURE) Inc.</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">Other</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Asia</span><span class="label  lightblue">Philippines</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfxRMAQ"> SOPAN O &amp; M Co. Pvt. Ltd.</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">Coal Mines</span><span class="label lightblue">MSW</span><span class="label lightblue">Oil &amp; Gas</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Partnership-wide</span><span class="label  lightblue">Asia</span><span class="label  lightblue">India</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfxTMAQ"> South Coast Products/Chemola</a></td> 
            <td><span class="label lightblue">Oil &amp; Gas</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">United States</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfxUMAQ"> South Pole Carbon Asset Management Ltd.</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">Coal Mines</span><span class="label lightblue">MSW</span><span class="label lightblue">Oil &amp; Gas</span><span class="label lightblue">Other</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Switzerland</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfxVMAQ"> Southern Cross Agricultural Developments</a></td> 
            <td><span class="label lightblue">Agriculture</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Australia</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfxXMAQ"> SPANDAN</a></td> 
            <td><span class="label lightblue">Agriculture</span></td>
            <td>Other</td>
            <td><span class="label  lightblue">India</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfxYMAQ"> Spark Green Energy</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">Other</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Partnership-wide</span><span class="label  lightblue">Asia</span><span class="label  lightblue">India</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0At00000012tyzEAA"> Sulfur Recovery Engineering Inc.</a></td> 
            <td><span class="label lightblue">Coal Mines</span><span class="label lightblue">Oil &amp; Gas</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Partnership-wide</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfxqMAA"> SUN - Society for the Underprivileged</a></td> 
            <td><span class="label lightblue">Agriculture</span></td>
            <td>Other</td>
            <td><span class="label  lightblue">India</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AG000000ifYMKMA2"> Suncurrent S.A. de CV</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">MSW</span><span class="label lightblue">Oil &amp; Gas</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Partnership-wide</span><span class="label  lightblue">Latin America</span><span class="label  lightblue">North America</span><span class="label  lightblue">South America</span><span class="label  lightblue">Canada</span><span class="label  lightblue">Colombia</span><span class="label  lightblue">Dominican Republic</span><span class="label  lightblue">Mexico</span><span class="label  lightblue">Nicaragua</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfxuMAA"> Suraj Inamdar Business Consortium</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">Coal Mines</span><span class="label lightblue">MSW</span><span class="label lightblue">Oil &amp; Gas</span><span class="label lightblue">Biogas</span><span class="label lightblue">All GMI Topics</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Partnership-wide</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfxvMAA"> Sustainable Agriculture Community Development Pgm.</a></td> 
            <td><span class="label lightblue">Agriculture</span></td>
            <td>Other</td>
            <td><span class="label  lightblue">Partnership-wide</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfxxMAA"> Sustainable Energy Associates</a></td> 
            <td><span class="label lightblue">Other</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">United States</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfxyMAA"> Sustainable Technology For Rural and Urban Develop</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">MSW</span></td>
            <td>Other</td>
            <td><span class="label  lightblue">Partnership-wide</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0At0000002xnyFEAQ"> SysEne Consulting</a></td> 
            <td><span class="label lightblue">Oil &amp; Gas</span><span class="label lightblue">Coal</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Partnership-wide</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfy5MAA"> Taiwo Adewole and Associates</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">Coal Mines</span><span class="label lightblue">MSW</span><span class="label lightblue">Oil &amp; Gas</span></td>
            <td>Research</td>
            <td><span class="label  lightblue">Partnership-wide</span><span class="label  lightblue">Africa</span><span class="label  lightblue">Nigeria</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfy6MAA"> Tamil Nadu Agricultural University, India</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">Other</span></td>
            <td>Research</td>
            <td><span class="label  lightblue">India</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfy7MAA"> Tamil Nadu Newsprint and Papers Ltd</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">Other</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Partnership-wide</span><span class="label  lightblue">Asia</span><span class="label  lightblue">India</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfy8MAA"> Tamilnadu Agricultural University</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">MSW</span><span class="label lightblue">Other</span></td>
            <td>Research</td>
            <td><span class="label  lightblue">India</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AG000000CKz79MAD"> Tara Technology Systems</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">Coal Mines</span><span class="label lightblue">MSW</span><span class="label lightblue">Oil &amp; Gas</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">North America</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfy9MAA"> Tatonka Resources</a></td> 
            <td><span class="label lightblue">Coal Mines</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">United States</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfyDMAQ"> Team Sustain</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">MSW</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Partnership-wide</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfyJMAQ"> Tecnologia Ambiental de Mexico SA de CV</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">MSW</span><span class="label lightblue">Other</span></td>
            <td>Government</td>
            <td><span class="label  lightblue">North America</span><span class="label  lightblue">South America</span><span class="label  lightblue">Mexico</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfyLMAQ"> TekKraft</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">MSW</span><span class="label lightblue">Other</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Partnership-wide</span><span class="label  lightblue">Asia</span><span class="label  lightblue">China</span><span class="label  lightblue">India</span><span class="label  lightblue">Pakistan</span><span class="label  lightblue">Republic of Korea (South Korea)</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0At0000002xnyGEAQ"> Telops</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">Oil &amp; Gas</span><span class="label lightblue">Wastewater</span><span class="label lightblue">Coal</span><span class="label lightblue">Landfill</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Partnership-wide</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0At000000267GhEAI"> Tema Oil Refinery (TOR) Limited</a></td> 
            <td><span class="label lightblue">Oil &amp; Gas</span><span class="label lightblue">All GMI Topics</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Partnership-wide</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfyOMAQ"> TerraVerdae BioWorks Inc.</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">Coal Mines</span><span class="label lightblue">MSW</span><span class="label lightblue">Oil &amp; Gas</span><span class="label lightblue">Other</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Partnership-wide</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfyPMAQ"> TerraWest Energy Corp.</a></td> 
            <td><span class="label lightblue">Coal Mines</span><span class="label lightblue">MSW</span><span class="label lightblue">Oil &amp; Gas</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Canada</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0At00000012tz3EAA"> TESCORP</a></td> 
            <td><span class="label lightblue">Oil &amp; Gas</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">North America</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0At0000002xnyHEAQ"> Tesista</a></td> 
            <td><span class="label lightblue">Biogas</span><span class="label lightblue">Landfill</span></td>
            <td>Research</td>
            <td><span class="label  lightblue">Partnership-wide</span><span class="label  lightblue">South America</span><span class="label  lightblue">Peru</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfiWMAQ"> Tetra Tech SWE</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">MSW</span><span class="label lightblue">Oil &amp; Gas</span><span class="label lightblue">Other</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">North America</span><span class="label  lightblue">United States</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfyRMAQ"> Tetra Tech, Inc.</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">Coal Mines</span><span class="label lightblue">MSW</span><span class="label lightblue">Oil &amp; Gas</span><span class="label lightblue">Wastewater</span><span class="label lightblue">Other</span><span class="label lightblue">Biogas</span><span class="label lightblue">All GMI Topics</span></td>
            <td>Contractor</td>
            <td><span class="label  lightblue">Partnership-wide</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfyTMAQ"> TFS</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">Coal Mines</span><span class="label lightblue">MSW</span><span class="label lightblue">Oil &amp; Gas</span></td>
            <td>Financial Institution</td>
            <td><span class="label  lightblue">United Kingdom</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AG000000g58QLMAY"> The Aerospace Corporation</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">Coal Mines</span><span class="label lightblue">MSW</span><span class="label lightblue">Oil &amp; Gas</span><span class="label lightblue">Wastewater</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Partnership-wide</span><span class="label  lightblue">North America</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AG0000008LAyPMAW"> The Autonomous Regional Government of the Atlantic South</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">Coal Mines</span><span class="label lightblue">MSW</span><span class="label lightblue">Oil &amp; Gas</span></td>
            <td>Government</td>
            <td><span class="label  lightblue">Partnership-wide</span><span class="label  lightblue">South America</span><span class="label  lightblue">Nicaragua</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfyUMAQ"> The Business Alliance</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">Coal Mines</span><span class="label lightblue">MSW</span><span class="label lightblue">Oil &amp; Gas</span><span class="label lightblue">Other</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">India</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000005nXjLMAU"> The Chugoku Electric Power Co., Inc.</a></td> 
            <td><span class="label lightblue">Coal Mines</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Japan</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfyZMAQ"> The Communications Design Group</a></td> 
            <td><span class="label lightblue">MSW</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">North America</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfyaMAA"> The Corporate Council on Africa</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">Coal Mines</span><span class="label lightblue">MSW</span><span class="label lightblue">Oil &amp; Gas</span></td>
            <td>Other</td>
            <td><span class="label  lightblue">United States</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AG0000008KHIxMAO"> The Gas Institute of National Academy of Sciences of Ukraine</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">Coal Mines</span><span class="label lightblue">MSW</span><span class="label lightblue">Oil &amp; Gas</span><span class="label lightblue">Biogas</span></td>
            <td>Research</td>
            <td><span class="label  lightblue">Partnership-wide</span><span class="label  lightblue">Europe</span><span class="label  lightblue">Ukraine</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfycMAA"> The Groundwater Foundation</a></td> 
            <td><span class="label lightblue">Coal Mines</span><span class="label lightblue">MSW</span><span class="label lightblue">Oil &amp; Gas</span></td>
            <td>Other</td>
            <td><span class="label  lightblue">United States</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfydMAA"> The LEVON Group, LLC</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">MSW</span><span class="label lightblue">Oil &amp; Gas</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">United States</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0At00000012ws5EAA"> The National University of Life and Environmental Sciences of Ukraine</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">MSW</span><span class="label lightblue">Wastewater</span><span class="label lightblue">Biogas</span></td>
            <td>University</td>
            <td><span class="label  lightblue">Ukraine</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfyeMAA"> The Oikos Trust for Env. Management (TOTEM)</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">Coal Mines</span><span class="label lightblue">Wastewater</span><span class="label lightblue">Other</span></td>
            <td>Other</td>
            <td><span class="label  lightblue">India</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qg0RMAQ"> The World Bank</a></td> 
            <td><span class="label lightblue">MSW</span><span class="label lightblue">Other</span></td>
            <td>Financial Institution</td>
            <td><span class="label  lightblue">United States</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfyjMAA"> Thimun</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">Coal Mines</span><span class="label lightblue">MSW</span><span class="label lightblue">Oil &amp; Gas</span></td>
            <td>Other</td>
            <td><span class="label  lightblue">Netherlands</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfykMAA"> TIS Eco Ltd.</a></td> 
            <td><span class="label lightblue">MSW</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Partnership-wide</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfypMAA"> Toyo Energy Corporation</a></td> 
            <td><span class="label lightblue">Coal Mines</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Japan</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfyqMAA"> Toyo Engineering Corporation</a></td> 
            <td><span class="label lightblue">MSW</span><span class="label lightblue">Oil &amp; Gas</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Japan</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfytMAA"> Trade plus Aid</a></td> 
            <td><span class="label lightblue">Agriculture</span></td>
            <td>Other</td>
            <td><span class="label  lightblue">Partnership-wide</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AG000000ARhhbMAD"> TRANS TECH</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">MSW</span><span class="label lightblue">Oil &amp; Gas</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Partnership-wide</span><span class="label  lightblue">South America</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AG0000008KUfNMAW"> Trans-Atlantic Environmental, Inc. (TAE)</a></td> 
            <td><span class="label lightblue">MSW</span><span class="label lightblue">Oil &amp; Gas</span><span class="label lightblue">Wastewater</span><span class="label lightblue">Other</span></td>
            <td>NGO</td>
            <td><span class="label  lightblue">Partnership-wide</span><span class="label  lightblue">Africa</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfyxMAA"> Tri-Chandra College</a></td> 
            <td><span class="label lightblue">Oil &amp; Gas</span></td>
            <td>Research</td>
            <td><span class="label  lightblue">Nepal</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfz1MAA"> Tryton Enterprise</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">MSW</span><span class="label lightblue">Other</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Partnership-wide</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfz4MAA"> Turner County Dairy</a></td> 
            <td><span class="label lightblue">Agriculture</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">United States</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfzqMAA"> U.S. Energy Services, Inc.</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">MSW</span><span class="label lightblue">Other</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">United States</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfzRMAQ"> Unicamp</a></td> 
            <td><span class="label lightblue">MSW</span></td>
            <td>Research</td>
            <td><span class="label  lightblue">South America</span><span class="label  lightblue">Brazil</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0At0000002xnyIEAQ"> Unigate Forwarding India Pvt Ltd</a></td> 
            <td><span class="label lightblue">Oil &amp; Gas</span><span class="label lightblue">Coal</span><span class="label lightblue">Landfill</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Partnership-wide</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0At0000002N92UEAS"> UNIPAK TRADING INC.</a></td> 
            <td><span class="label lightblue">Biogas</span></td>
            <td>Other</td>
            <td><span class="label  lightblue">United States</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfzSMAQ"> Unison Solutions, Inc.</a></td> 
            <td><span class="label lightblue">Agriculture</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">United States</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0At0000002X3HfEAK"> Universal Automation Private Limited</a></td> 
            <td><span class="label lightblue">Wastewater</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Asia</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfzZMAQ"> Universidad Michoacana de San Nicolas de Hidalgo</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">Other</span></td>
            <td>Research</td>
            <td><span class="label  lightblue">Mexico</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AG0000008MFZ7MAO"> Universidad Politechnica de Nicaragua (UPOLI)</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">MSW</span><span class="label lightblue">Other</span><span class="label lightblue">Biogas</span><span class="label lightblue">All GMI Topics</span></td>
            <td>Research</td>
            <td><span class="label  lightblue">Partnership-wide</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfzcMAA"> Universidad Tecnica Federico Santa Maria</a></td> 
            <td><span class="label lightblue">MSW</span></td>
            <td>Research</td>
            <td><span class="label  lightblue">Partnership-wide</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0At0000001CwEZEA0"> Universiti Putra Malaysia</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">Biogas</span></td>
            <td>University</td>
            <td><span class="label  lightblue">Malaysia</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AG0000008k3FjMAI"> University EAN</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">Coal Mines</span><span class="label lightblue">MSW</span><span class="label lightblue">Oil &amp; Gas</span></td>
            <td>University</td>
            <td><span class="label  lightblue">Latin America</span><span class="label  lightblue">Colombia</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfzeMAA"> University of Central Florida</a></td> 
            <td><span class="label lightblue">MSW</span></td>
            <td>Research</td>
            <td><span class="label  lightblue">United States</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfzgMAA"> University of Glamorgan</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">Other</span></td>
            <td>Research</td>
            <td><span class="label  lightblue">United Kingdom</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0At00000036LkREAU"> University of Lethbridge</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">Wastewater</span></td>
            <td>University</td>
            <td><span class="label  lightblue">Partnership-wide</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfzjMAA"> University of Miskolc</a></td> 
            <td><span class="label lightblue">Coal Mines</span></td>
            <td>Research</td>
            <td><span class="label  lightblue">Hungary</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AG000000hilzxMAA"> University of Nottingham</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">Other</span></td>
            <td>University</td>
            <td><span class="label  lightblue">United Kingdom</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AG0000009tg5PMAQ"> University of Port Harcourt, Nigeria</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">MSW</span><span class="label lightblue">Oil &amp; Gas</span><span class="label lightblue">Wastewater</span></td>
            <td>University</td>
            <td><span class="label  lightblue">Partnership-wide</span><span class="label  lightblue">Africa</span><span class="label  lightblue">Nigeria</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AG000000hY7kTMAS"> University of Santander</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">MSW</span><span class="label lightblue">Wastewater</span></td>
            <td>University</td>
            <td><span class="label  lightblue">Partnership-wide</span><span class="label  lightblue">South America</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfzkMAA"> University of South Florida</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">Coal Mines</span><span class="label lightblue">MSW</span><span class="label lightblue">Oil &amp; Gas</span><span class="label lightblue">Wastewater</span></td>
            <td>Research</td>
            <td><span class="label  lightblue">Partnership-wide</span><span class="label  lightblue">South America</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0At0000002xnyJEAQ"> UNO Ingeniería</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">Wastewater</span><span class="label lightblue">Biogas</span><span class="label lightblue">Landfill</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">South America</span><span class="label  lightblue">Argentina</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfznMAA"> Urban Council - Balangoda</a></td> 
            <td><span class="label lightblue">Other</span></td>
            <td>Government</td>
            <td><span class="label  lightblue">Asia</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfzoMAA"> Urja Bio Systems</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">MSW</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">India</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AG00000081t6mMAA"> URMO Ingeniería Integral, SA</a></td> 
            <td><span class="label lightblue">MSW</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Mexico</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfztMAA"> Vallmitjana &amp; Company Consulting Services</a></td> 
            <td><span class="label lightblue">MSW</span><span class="label lightblue">Oil &amp; Gas</span><span class="label lightblue">Other</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Argentina</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfzuMAA"> Val-Tex</a></td> 
            <td><span class="label lightblue">MSW</span><span class="label lightblue">Oil &amp; Gas</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Partnership-wide</span><span class="label  lightblue">Africa</span><span class="label  lightblue">Asia</span><span class="label  lightblue">Australia/Oceania</span><span class="label  lightblue">Europe</span><span class="label  lightblue">Middle East</span><span class="label  lightblue">North America</span><span class="label  lightblue">South America</span><span class="label  lightblue">Republic of Korea (South Korea)</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfzvMAA"> Vanquish Energies (pvt) LTD</a></td> 
            <td><span class="label lightblue">Agriculture</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Partnership-wide</span><span class="label  lightblue">Asia</span><span class="label  lightblue">Pakistan</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfzxMAA"> Vayam Technologies Ltd</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">Coal Mines</span><span class="label lightblue">MSW</span><span class="label lightblue">Oil &amp; Gas</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Partnership-wide</span><span class="label  lightblue">Africa</span><span class="label  lightblue">Asia</span><span class="label  lightblue">Australia/Oceania</span><span class="label  lightblue">Europe</span><span class="label  lightblue">Middle East</span><span class="label  lightblue">North America</span><span class="label  lightblue">South America</span><span class="label  lightblue">Canada</span><span class="label  lightblue">China</span><span class="label  lightblue">European Commission</span><span class="label  lightblue">Finland</span><span class="label  lightblue">Germany</span><span class="label  lightblue">India</span><span class="label  lightblue">Italy</span><span class="label  lightblue">Japan</span><span class="label  lightblue">Kazakhstan</span><span class="label  lightblue">Mexico</span><span class="label  lightblue">Mongolia</span><span class="label  lightblue">Nigeria</span><span class="label  lightblue">Pakistan</span><span class="label  lightblue">Philippines</span><span class="label  lightblue">Poland</span><span class="label  lightblue">Republic of Korea (South Korea)</span><span class="label  lightblue">Russia</span><span class="label  lightblue">Thailand</span><span class="label  lightblue">Ukraine</span><span class="label  lightblue">United Kingdom</span><span class="label  lightblue">United States</span><span class="label  lightblue">Vietnam</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qfzzMAA"> Venture Energy</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">MSW</span><span class="label lightblue">Oil &amp; Gas</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Cameroon</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AG000000De0XUMAZ"> Verambex</a></td> 
            <td><span class="label lightblue">MSW</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Partnership-wide</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AG000000g2La6MAE"> Verso Energy</a></td> 
            <td><span class="label lightblue">Coal Mines</span><span class="label lightblue">MSW</span><span class="label lightblue">Oil &amp; Gas</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Australia/Oceania</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AG00000095OcUMAU"> Via Expo</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">MSW</span><span class="label lightblue">Oil &amp; Gas</span><span class="label lightblue">Other</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Partnership-wide</span><span class="label  lightblue">Europe</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AG0000009vhitMAA"> Vietnam Institute of Meteorology, Hydrology and Environment</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">MSW</span><span class="label lightblue">Oil &amp; Gas</span></td>
            <td>Research</td>
            <td><span class="label  lightblue">Partnership-wide</span><span class="label  lightblue">Asia</span><span class="label  lightblue">Vietnam</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AG0000008mXupMAE"> Viogaz</a></td> 
            <td><span class="label lightblue">Agriculture</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">South America</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0At0000002xnyKEAQ"> Viper Drones</a></td> 
            <td><span class="label lightblue">Oil &amp; Gas</span><span class="label lightblue">Coal</span><span class="label lightblue">Landfill</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Partnership-wide</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AG000000cLue3MAC"> Vireo Energy</a></td> 
            <td><span class="label lightblue">MSW</span><span class="label lightblue">Oil &amp; Gas</span><span class="label lightblue">Wastewater</span><span class="label lightblue">Biogas</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Africa</span><span class="label  lightblue">Asia</span><span class="label  lightblue">Australia/Oceania</span><span class="label  lightblue">Europe</span><span class="label  lightblue">Latin America</span><span class="label  lightblue">Middle East</span><span class="label  lightblue">North America</span><span class="label  lightblue">South America</span><span class="label  lightblue">United States</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AG000000De0UgMAJ"> Virgin Botanicals Ltd</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">Coal Mines</span><span class="label lightblue">MSW</span><span class="label lightblue">Oil &amp; Gas</span><span class="label lightblue">Wastewater</span></td>
            <td>Research</td>
            <td><span class="label  lightblue">Partnership-wide</span><span class="label  lightblue">Africa</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qg0CMAQ"> W&amp;Y Environmental International Inc.</a></td> 
            <td><span class="label lightblue">Coal Mines</span><span class="label lightblue">MSW</span><span class="label lightblue">Oil &amp; Gas</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Canada</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AG000000FastaMAB"> W. R. Henderson Construction, Inc.</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">Coal Mines</span><span class="label lightblue">MSW</span><span class="label lightblue">Oil &amp; Gas</span><span class="label lightblue">Wastewater</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Partnership-wide</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qg0IMAQ"> Waste To Energy, Inc.</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">Coal Mines</span><span class="label lightblue">MSW</span><span class="label lightblue">Oil &amp; Gas</span><span class="label lightblue">Other</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Partnership-wide</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qg0KMAQ"> Wastecorp Pumps LLC</a></td> 
            <td><span class="label lightblue">Coal Mines</span><span class="label lightblue">MSW</span><span class="label lightblue">Oil &amp; Gas</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">United States</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AG000000NDmXjMAL"> Water Environment Federation (WEF)</a></td> 
            <td><span class="label lightblue">Wastewater</span></td>
            <td>Association</td>
            <td><span class="label  lightblue">Partnership-wide</span><span class="label  lightblue">United States</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qg0LMAQ"> WES Tech Inc.</a></td> 
            <td><span class="label lightblue">Agriculture</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">South America</span><span class="label  lightblue">Colombia</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0At0000002xnyLEAQ"> Wheig SAS</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">Landfill</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Asia</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AG000000gSkuuMAC"> Wilson Center</a></td> 
            <td><span class="label lightblue">MSW</span><span class="label lightblue">Wastewater</span></td>
            <td>International</td>
            <td><span class="label  lightblue">China</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qg0PMAQ"> Women Foundation for Ag., Env., and Health</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">Coal Mines</span><span class="label lightblue">Other</span></td>
            <td>Other</td>
            <td><span class="label  lightblue">Africa</span><span class="label  lightblue">United States</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qg0QMAQ"> World Alliance for Decentralized Energy</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">Coal Mines</span><span class="label lightblue">MSW</span><span class="label lightblue">Oil &amp; Gas</span><span class="label lightblue">Wastewater</span><span class="label lightblue">Other</span></td>
            <td>Other</td>
            <td><span class="label  lightblue">Partnership-wide</span><span class="label  lightblue">United States</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qg0TMAQ"> World Leaders Symposium Committee</a></td> 
            <td><span class="label lightblue">Coal Mines</span><span class="label lightblue">MSW</span><span class="label lightblue">Oil &amp; Gas</span><span class="label lightblue">Other</span></td>
            <td>Other</td>
            <td><span class="label  lightblue">United States</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qg0UMAQ"> World Safety Inc.</a></td> 
            <td><span class="label lightblue">Other</span></td>
            <td>Other</td>
            <td><span class="label  lightblue">United States</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AG00000081flZMAQ"> World Wildlife Fund (WWF)</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">MSW</span><span class="label lightblue">Oil &amp; Gas</span></td>
            <td>NGO</td>
            <td><span class="label  lightblue">Partnership-wide</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0At0000002xnyMEAQ"> YAANADI EDUCATION SOCIETY</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">Wastewater</span><span class="label lightblue">Landfill</span></td>
            <td>Other</td>
            <td><span class="label  lightblue">India</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qg0XMAQ"> Yayasan Bina Usaha Lingkungan</a></td> 
            <td><span class="label lightblue">Coal Mines</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Indonesia</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AG000000AQYVsMAP"> Yekta Edeh Shargh</a></td> 
            <td><span class="label lightblue">MSW</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">Middle East</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0AA0000002qg0YMAQ"> YNG Environ Consultants</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">MSW</span></td>
            <td>Private Sector</td>
            <td><span class="label  lightblue">India</span></td>
            </tr><tr><td><a href="details.aspx?ID=a0At00000012wsFEAQ"> Zhytomyr National Agroecological University</a></td> 
            <td><span class="label lightblue">Agriculture</span><span class="label lightblue">Biogas</span></td>
            <td>University</td>
            <td><span class="label  lightblue">Ukraine</span></td>
            </tr></tbody>

		
		
		</table>
		</div>
	</section>
    <script
  src="https://code.jquery.com/jquery-3.5.1.min.js"
  integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
  crossorigin="anonymous"></script>
<script type="text/javascript" language="javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
	<script type="text/javascript" language="javascript" src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/pdfmake.min.js"></script>
    
	<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.css">
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/buttons/1.5.6/css/buttons.dataTables.min.css" />
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/responsive/2.2.3/css/responsive.dataTables.min.css" />

	<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.js"></script>
    <script type="text/javascript" charset="utf-8"  src="https://cdn.datatables.net/buttons/1.5.6/js/dataTables.buttons.min.js"></script>
    <script type="text/javascript" language="javascript" src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/vfs_fonts.js"></script>
	<script type="text/javascript" language="javascript" src="https://cdn.datatables.net/buttons/1.5.6/js/buttons.html5.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/yadcf/0.9.4/jquery.dataTables.yadcf.js" integrity="sha256-j83V52uLomZxGL9GIZ7eyiv32ntFn7Kr6WQSfz3mvRs=" crossorigin="anonymous"></script>
    <script type="text/javascript" language="javascript" src="https://cdn.datatables.net/responsive/2.2.3/js/dataTables.responsive.min.js"> </script>
		
		
    <script>



        $(document).ready(function () {





            var table = $('#PNtable').DataTable({
                responsive: true,
                dom: 'Bfrtip',
                search: 'agriculture',
                buttons: [
                                 'csvHtml5'
           
                ],
                "columns": [
                    { "width": "40%" },
                    { "width": "20%" },
                    { "width": "20%" },
                    { "width": "20%" }
                ]

            });

            yadcf.init(table, [{
                column_number: 1,
                column_data_type: "html",
                html_data_type: "text",
                filter_default_label: "All Areas",
                filter_reset_button_text: false,
                filter_container_id: "external_filter_interest"
            }, {
                column_number: 2,
                column_data_type: "html",
                html_data_type: "text",
                filter_default_label: "All Types",
                filter_reset_button_text: false,
                filter_container_id: "external_filter_orgtype"
            }, {
                column_number: 3,
                column_data_type: "html",
                html_data_type: "text",
                filter_default_label: "All Countries",
                filter_reset_button_text: false,
                filter_container_id: "external_filter_country"
            }]);


            $('#tableFilter').on('click', 'a', function () {
                event.preventDefault();
                $("#tableFilter a").removeClass("filterBold");
                $(this).addClass("filterBold");


                table
                    .columns(2)
                    .search($(this).text())
                    .draw();
            });

            $('#tableFilter').on('click', 'a.reset', function () {
                event.preventDefault();
                table
                    .search('')
                    .columns(2)
                    .search('')
                    .draw();
            });

            $(".rollup").hover(function () {
                if (!$('.eventhide').is(':visible')) {
                    $(".eventhide").slideUp("slow", function () {
                        // Animation complete.
                    });


                }
                if (!$('.sectorhide').is(':visible')) {
                    $(".sectorhide").slideUp("slow", function () {
                        // Animation complete.
                    });


                }

            });



            $(".sectorclick").click(function () {
                $(".sectorhide").slideDown("slow", function () {
                    // Animation complete.
                });
                $(".eventhide").hide();
                $(".subeventhide").hide();
            });

            $(".subeventclick").click(function () {
                $(".subeventhide").slideDown("slow", function () {
                    // Animation complete.
                });
                $(".sectorhide").hide();
                $(".eventhide").hide();
            });

            $(".eventclick").click(function () {
                $(".eventhide").slideDown("slow", function () {
                    // Animation complete.
                });
                $(".sectorhide").hide();
                $(".subeventhide").hide();
            });


            $('ul.dropdown-menu [data-toggle=dropdown]').on('click', function (event) {
                event.preventDefault();
                event.stopPropagation();
                $(this).parent().siblings().removeClass('open');
                $(this).parent().toggleClass('open');
            });

            // Add smooth scrolling to all links in navbar + footer link
            $(".navbar a, footer a[href='#home']").on('click', function (event) {
                // Make sure this.hash has a value before overriding default behavior
                if (this.hash !== "") {
                    // Prevent default anchor click behavior
                    event.preventDefault();

                    // Store hash
                    var hash = this.hash;

                    // Using jQuery's animate() method to add smooth page scroll
                    // The optional number (900) specifies the number of milliseconds it takes to scroll to the specified area
                    $('html, body').animate({
                        scrollTop: $(hash).offset().top
                    }, 900, function () {

                        // Add hash (#) to URL when done scrolling (default click behavior)
                        window.location.hash = hash;
                    });
                } // End if
            });

            $(window).scroll(function () {
                $(".slideanim").each(function () {
                    var pos = $(this).offset().top;

                    var winTop = $(window).scrollTop();
                    if (pos < winTop + 600) {
                        $(this).addClass("slide");
                    }
                });
            });
        })





        $("#clickme").click(function () {
            $(".hider").slideToggle("slow", function () {
                // Animation complete.
            });
        });

       

 

        var vid = document.getElementById("myVideo");

      

        $(window).scroll(function () {
            var y_scroll_pos = window.pageYOffset;
            var scroll_pos_test = 150;
            // set to whatever you want it to be

            if (y_scroll_pos > scroll_pos_test) {
                $("#smalllogo").slideDown("slow", function () {
                    // Animation complete.
                });
            } else {
                $("#smalllogo").slideUp("slow", function () {
                    // Animation complete.
                });
            }
        });
    </script>


    <!-- Optional JavaScript -->
<!-- jQuery first, then Popper.js, then Bootstrap JS -->

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
		
		
		
		
</body>

</html>