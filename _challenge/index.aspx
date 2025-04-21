<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="index.aspx.vb" Inherits="M2M_Redesign.challenge" %>

<!DOCTYPE html
	PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html>

<head>
	<title>Global Methane Challenge</title>
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
	<meta name="theme-color" content="#1aa4b8" />
	<meta property="og:title" content="Global Methane Challenge">
	<meta property="og:site_name" content="Global Methane Challenge">
	<meta property="og:url" content="http://www.globalmethane.org/challenge">
	<meta property="og:description"
		content="It’s time to take action! Join the Global Methane Challenge and showcase your work to reduce methane emissions.">
	<meta property="og:type" content="website">
	<meta property="og:image" content="http://www.globalmethane.org/challenge/gmclogo.png">
	<link rel="stylesheet" href="assets/css/font-awesome.min.css">
	<link rel="stylesheet" href="assets/css/main.css" />
	<link rel="stylesheet" href="assets/css/animate.css" />
	<link rel="stylesheet" href="assets/sweetalert/sweetalert2.min.css">
	<noscript>
		<link rel="stylesheet" href="assets/css/noscript.css" />
	</noscript>
	<style>
		.swal-button--cancel {
			background: #4c5c96 !important;
		}

		#bg {
			position: fixed;
			right: 0;
			bottom: 0;
			min-width: 100%;
			min-height: 100%;
			background: #0b8bb6;
		}

		#myVideo {
			position: fixed;
			right: 0;
			bottom: 0;
			min-width: 100%;
			min-height: 100%;
			-webkit-filter: blur(15px);
			-moz-filter: blur(15px);
			-o-filter: blur(15px);
			-ms-filter: blur(15px);
			filter: blur(15px);
		}

		#tile {
			position: fixed;
			background: url("images/tile.png")repeat;
			right: 0;
			bottom: 0;
			min-width: 100%;
			min-height: 100%;
			opacity: 0.5;
		}

		.fa-molecule:before {
			content: '';
			/* Remove default icon */
			display: inline-block;
			background: url('images/molecule.png') center center no-repeat;
			background-size: contain;
			opacity: .7;
		}

		.fa-fire:before {
			content: '';
			/* Remove default icon */
			display: inline-block;
			background: url('images/002-oil-platform.png') center center no-repeat;
			background-size: contain;
			opacity: .7;
		}

		.fa-pick:before {
			content: '';
			/* Remove default icon */
			display: inline-block;
			background: url('images/003-pick.png') center center no-repeat;
			background-size: contain;
			opacity: .7;
		}

		.fa-agriculture:before {
			content: '';
			/* Remove default icon */
			display: inline-block;
			background: url('images/001-cow.png') center center no-repeat;
			background-size: contain;
			opacity: .7;
		}

		.nav ul {
			position: fixed;
			z-index: 300;
			list-style-type: none;
			margin: 0;
			padding: 0;
			overflow: hidden;
			margin-top: -40px;
			background: rgba(0, 0, 0, 0.2);
		}

		.swal2-confirm:hover {
			color: #cacaca !important;
		}

		.nav ul:last-child {
			border-radius: 20px 20px 0px 0px;
		}

		.nav li {
			float: left;
		}

		.nav li a {
			display: block;
			color: white;
			text-align: center;
			height: 40px;
			padding-left: 15px;
			padding-right: 15px;
			text-decoration: none;
			border-bottom: 0px;
			-o-transition: .5s;
			-ms-transition: .5s;
			-moz-transition: .5s;
			-webkit-transition: .5s;
			transition: .5s;
		}

		.grid-icons li a span span {
			-o-transition: .5s;
			-ms-transition: .5s;
			-moz-transition: .5s;
			-webkit-transition: .5s;
			transition: .5s;
		}

		.grid-icons li a span:hover {

			-webkit-animation: jello 0.5s;
			animation: jello 0.5s;
		}



		/* Change the link color to #111 (black) on hover */

		.nav li a:hover {
			background-color: #1a94b8;
		}

		.nav li a:active {
			background-color: white;
			color: black;

		}

		nav {
			position: fixed;
			z-index: 500;
			padding-bottom: 12px;
			margin-top: -40px;

		}

		nav .line {
			height: 2px;
			position: absolute;
			bottom: 0;
			margin: 10px 0 0 0;
			background: white;
		}

		nav ul {
			padding: 0;
			margin: 0;
			list-style: none;
			display: flex;
		}

		nav ul li {
			margin: 0 40px 0 0;
			opacity: 0.4;
			transition: all 0.4s ease;
		}

		nav ul li:hover {
			opacity: 0.7;
		}

		nav ul li.active {
			opacity: 1;
			border-bottom: 1px solid white;
		}

		nav ul li:last-child {
			margin-right: 0;
		}

		nav ul li a {
			text-decoration: none;
			color: #fff;
			text-transform: uppercase;
			display: block;
			font-weight: 600;
			letter-spacing: 0.2em;
			font-size: 14px;
			border-bottom: 0px !important;
		}

		nav ul li a:hover {

			color: #000000;
			-webkit-animation: pulse 0.5s;
			animation: pulse 0.5s;
		}

		nav ul li a:active {
			-webkit-animation: tada 0.5s;
			animation: tada 0.5s;
		}

		.whitebg {
			background: white;
		}

		#languageWidget {
			position: fixed;
			left: 0;
			top: 0;
			z-index: 300;
			padding: 10px;
			background: rgba(20, 20, 20, .4);
			text-align: center;
		}

		#languageWidget p {
			margin: 0 !important;
		}

		#languageWidget p:hover {
			cursor: pointer;
		}

		.hider {
			text-align: center;
			display: none;
		}

		.textcolumns {
			columns: 3;
		}

		@media only screen and (max-width: 737px) {
			.textcolumns {
				columns: 1;
			}

		}

		#watcher {
			position: absolute;
			top: 0;
			left: 6px;
			background: black;
			width: 5px;
			height: 5px;
			z-index: -5000;
		}

		a .icon {
			color: #00539a !important;
		}

		.gmclogo {
			margin-top: 50px;
			margin-bottom: auto;
			margin-left: auto;
			margin-right: auto;
			text-align: center;
		}

		.gmilogo {
			margin-top: 5em;
			width: 225px;
		}

		a .gmilogo:hover {
			text-decoration: none;
		}

		.mobilenav {
			display: none;
		}

		@media only screen and (max-width: 737px) {
			.whitebg table {
				margin-bottom: 0;
			}

			.gmilogo {
				margin-top: 5px;
				height: 60px;
			}

			.gmclogo {
				margin-top: 40px;
				margin-bottom: auto;
			}

			.textcolumns {
				columns: 1;
			}

			#youtube {
				width: 100%;
				max-width: 560px;
				height: auto;
				height: 315px;
				margin-bottom: 10px;
			}

			nav {
				display: none;
			}

			.mobilenav {
				display: block;
				position: fixed;
				top: 0;
				right: 0;
				z-index: 400;
				background: rgba(0, 0, 0, 0.6);
				width: 10vw;
				height: 10vw;
				text-align: center;
			}

			.mobilenav:hover {
				cursor: pointer;
			}

			.mobilenav i {
				margin: 0;
				position: absolute;
				top: 50%;
				left: 50%;
				margin-right: -50%;
				transform: translate(-50%, -50%)
			}

			#languageWidget {
				display: none;
			}

			.invisible {
				visibility: hidden;
			}

			#mobileLinks {

				position: fixed;
				top: 0;
				left: 0;
				z-index: 401;
				width: 100vw;
				height: 100vh;
				background: rgba(255, 255, 255, 0.9);
				text-align: center;
			}

			#mobileLinks ul {
				width: 100%;
				display: table;
				padding: 0;
				background: rgba(107, 107, 107, 0.2);
				margin: 0;
				margin-top: 10vw;
			}

			#mobileLinks ul li {

				vertical-align: middle;
				color: black;
				font-size: 2em;
				width: 100%;
				height: 20vw;
				border-bottom: 0.25vw solid rgba(107, 107, 107, 0.2);
				line-height: 20vw;
				background: white;
				-webkit-transition: 2s;
				/* For Safari 3.1 to 6.0 */
				transition: 2s;
			}

			#mobileLinks ul li:hover {
				-webkit-animation: shake 1s;
				animation: shake 1s;
				cursor: pointer;
				background: rgba(107, 107, 107, 0.2);
			}

			#closeNav {
				position: absolute;
				top: 0;
				left: 0;
				width: 100%;
				background: #c23616;
				height: 10vw;
				text-align: center;
				border-top: 1vw solid #e84118;
			}

			#closeNav:hover {

				-webkit-animation: pulse 1s;
				animation: pulse 1s;
				cursor: pointer;
				background: #e17055;
				border-top: 1vw solid #fab1a0;

			}

			#closeNav i {
				margin: 0;
				position: absolute;
				top: 50%;
				left: 50%;
				margin-right: -50%;
				transform: translate(-50%, -50%)
			}

		}

		@media only screen and (max-width: 737px) and (orientation: landscape) {

			#mobileLinks ul li {
				height: 5vw;
				line-height: 100%;
				font-size: 1em;
			}
		}

		.idealist {
			list-style-type: none;
			margin-bottom:10px!important;
		}

		.idealist {
			padding: 0;
		}

		.idealist li {
			display: inline-block;
			width: 100%;
			margin: 4px;
			padding: 2px;
			padding-right: 4px;
			border-radius: 25px;

			background-color: #F79737;
			color: black;
			font-weight: bold;
		}

		.idealist p {
			margin: 0 0 0 0;
			margin-left: 40px;
		}

		.idealist img {
			Float: left;
			height: 40px;
			margin-left: 20px;
			margin-top: 5px;
			margin-right: 20px;
		}

		table td {
			text-align: center;
			vertical-align: middle;
		}

		#fourth a:hover {
			color: white;
		}



		@media all and (-ms-high-contrast: none),
		(-ms-high-contrast: active) {

			/* IE10+ CSS styles go here */
			#myVideo {
				display: none;
			}
		}

		.videoWrapper {
			position: relative;
			padding-bottom: 56.25%;
			/* 16:9 */
			padding-top: 25px;
			height: 0;
		}

		.videoWrapper iframe {
			position: absolute;
			top: 0;
			left: 0;
			width: 100%;
			height: 100%;
		}

		.item {
			color: #f79737;
			fill: #f79737;
		}

		.lightlink:hover {
			color: white;
		}

		#map {
			top: 0;
			bottom: 0;
		}

		@media only screen and (min-width: 737px) {
			.factsheet {
				padding: 10px;
				margin: auto;
				bottom: 0px;
				right: 0;
				position: fixed;
				background: #f79737;
				color: black;
				text-align: center;
				border-top-left-radius: 14px;

				box-shadow: 3px 4px 18px #000000;
			}

			.factsheet a {
				font-weight: bold;
			}

			.factsheet span {
				text-align: right;
				float: right;
				margin-right: 3px;
				color: white;
			}

			.factsheet span:hover {
				cursor: pointer;
			}

			.factsheet span a {
				text-decoration: none;
			}
		}

		.tilecontainer {
			position: relative;
		}

		.tiletext {
			position: absolute;
			top: 50%;
			left: 50%;
			transform: translate(-50%, -50%);
		}
	</style>
	<script>
		function setCookie(cname, cvalue, exdays) {
			var d = new Date();
			d.setTime(d.getTime() + (exdays * 24 * 60 * 60 * 1000));
			var expires = "expires=" + d.toGMTString();
			document.cookie = cname + "=" + cvalue + ";" + expires + ";path=/";
		}

		function getCookie(cname) {
			var name = cname + "=";
			var decodedCookie = decodeURIComponent(document.cookie);
			var ca = decodedCookie.split(';');
			for (var i = 0; i < ca.length; i++) {
				var c = ca[i];
				while (c.charAt(0) == ' ') {
					c = c.substring(1);
				}
				if (c.indexOf(name) == 0) {
					return c.substring(name.length, c.length);
				}
			}
			return "";
		}

		function deleteCookie() {
			document.cookie = "cdnd=; expires=Thu, 01 Jan 1970 00:00:00 UTC; path=/;";
		}

		function checkCookie() {

			var user = getCookie("cdnd");
			if (user != "") {

			} else {

				swal({
						position: 'bottom-end',
						imageUrl: 'images/gmcthumb.png',
						html: 'You can download this information in ' +
							'<a href="pdf/GMC Fact Sheet.pdf">PDF format <i class="fa fa-download" aria-hidden="true"></i></a> ' +
							'for offline use.',
						imageWidth: 200,
						imageHeight: 259,
						width: 300,
						height: 150,
						showConfirmButton: true,
						confirmButtonText: 'Got it, thanks!',
					})
					.then((value) => {
						switch (value) {

							case "Sure":
								setCookie("cdnd", "true", 14);
								break;

							case "catch":
								setCookie("cdnd", "true", 14);
								break;

							default:
								setCookie("cdnd", "true", 14);
								break;
						}
					});

			}
		}
	</script>

</head>

<body class="is-preload" onload="checkCookie()">
	<div id="bg"></div>
	<video autoplay muted loop id="myVideo" poster="images/vidposter.png">
		<source src="assets/video/methanebg.mp4" type="video/mp4">
		<source src="assets/video/methanebg.ogg" type="video/ogg">
		<source src="assets/video/methanebg.webm" type="video/webm"> Your browser does not support HTML5 video.
	</video>
	<div id="tile"></div>

	<img id="watcher" src="images/watcher.png">

	

	<div id="languageWidget">
		<div class="hider">
			<div id="google_translate_element"></div>
		</div>
		<p class="translateText">Translate this page&nbsp;
			<i class="fa fa-language" aria-hidden="true"></i>
		</p>
	</div>
	<div class="mobilenav" id="mobilenav">
		<i class="fa fa-bars fa-2x" aria-hidden="true"></i>
	</div>

	<div id="mobileLinks" class="invisible">
		<div id="closeNav">
			<i class="fa fa-times-circle-o fa-2x" aria-hidden="true"></i>
		</div>
		<ul>
			<a class="linkClick" href="#home">
				<li>Home</li>
			</a>
			<a class="linkClick" href="#info">
				<li>The Challenge</li>
			</a>
			<!--<a class="linkClick" href="#mmatters"><li>Methane Matters</li></a>-->
			<a class="linkClick" href="#actionmap">
				<li>Action Map</li>
			</a>
			<a class="linkClick" href="#actions">
				<li>Actions</li>
			</a>
			<a class="linkClick" href="#faq">
					<li>FAQs</li>
				</a>
			<a class="linkClick" href="#fourth">
				<li>Tell Your Story</li>
			</a>
			<a class="translateText">
				<li style="background:#dff9fb;"><i class="fa fa-language" aria-hidden="true"></i>&nbsp;Translate</li>
			</a>
		</ul>

	</div>
	<!-- Wrapper -->


	<div id="page-wrapper">

		<div id="wrapper">
			<nav>
				<ul>
					<!--						<li id="navLeft">
								<i class="fa  fa-arrow-circle-left" aria-hidden="true"></i>
							</li>-->
							<li>
								
									<a style="color:black;" href="../">GlobalMethane.org</a>
							</li>
							<li>|</li>
					<li id="homenav" class="active">
						<a href="#home">Home</a>
					</li>
					<li id="infonav">
						<a href="#info">The Challenge</a>
					</li>
					<!--<li id="mmattersnav">
						<a href="#mmatters">Methane Matters</a>
				</li>-->
					<li id="actionmapnav">
						<a href="#actionmap">Action Map</a>
					</li>
					<li id="actionsnav">
						<a href="#actions">Actions</a>
					</li>
					<li id="faqnav">
							<a href="#faq">FAQs</a>
						</li>
					
					<li id="fourthnav">
						<a href="#fourth">Tell Your Story</a>
					</li>

					<!--					<li id="navRight">
						<i class="fa fa-arrow-circle-right" aria-hidden="true"></i>
					</li>-->
				</ul>
			</nav>

			<!-- Panel (Banner) -->
			<section class="panel banner right" id="home" style="overflow: hidden;">
				<div class="content color1 span-4">
					<h1 class="major" style="border:black;">
						<img style="filter: drop-shadow( 2px 0 2px hsla(0, 0%, 0%, 0.2));"
							alt="Global Methane Challenge Logo" title="Global Methane Challenge Logo" class="gmclogo"
							src="images/gmclogo.svg">
					</h1>
					<p style="color:black;">It’s time to take action! Join the Global Methane Challenge and showcase
						your work to
						reduce methane emissions.</p>
					<p style="color:black;"><a class="lightlink" href="#info"><i style="float:right; bottom:0;"
								class="fa fa-2x fa-arrow-circle-right" aria-hidden="true"></i></a></a>
						The Global Methane Challenge is open to all public and private-sector actors interested in
						showcasing their
						actions to reduce methane emissions. The goal of the challenge is to catalyze ambitious action
						to reduce methane
						emissions and showcase policies and technologies being used to reduce methane emissions around
						the world. Learn
						more about the
						<a href="https://www.globalmethane.org/participate/index.aspx" target="_blank">Global Methane
							Initiative (GMI)</a>.
					</p>

				</div>
				<div class="whitebg" data-position="25% 25%">
					<table height="100%">
						<tr>
							<td colspan="4">
								<a href="http://www.globalmethane.org"><img alt="Global Methane Initiative Logo"
										title="Global Methane Initiative Logo" class="gmilogo"
										src="images/gmilogo.svg"></a>
							</td>
						</tr>
						<tr height="50px">
							<td>
								<ul class="contact-icons color1">
									<a target="_blank" href="https://twitter.com/globalmethane">
										<li class="icon fa-twitter" title="GMI's Twitter Account"
											alt="GMI's Twitter Account"></li>
									</a>
								</ul>
							</td>
							<td>
								<ul class="contact-icons color1">
									<a target="_blank" href="https://www.facebook.com/globalmethane/">
										<li class="icon fa-facebook" title="GMI's Facebook Account"
											alt="GMI's Facebook Account"></li>
									</a>
								</ul>
							</td>
							<td>
								<ul class="contact-icons color1">
									<a target="_blank"
										href="https://www.linkedin.com/company/global-methane-initiative-gmi-/">
										<li class="icon fa-linkedin" title="GMI's LinkedIn Account"
											alt="GMI's LinkedIn Account"></li>
									</a>
								</ul>
							</td>
							<td>
								<ul class="contact-icons color1">
									<a target="_blank"
										href="https://www.globalmethane.org/participate/joinmailinglist.aspx">
										<li class="icon fa-envelope" title="Sign up for the GMI Mailing List"
											alt="Sign up for the GMI Mailing List"></li>
									</a>
								</ul>
							</td>
						</tr>
					</table>
					<!--
					<table>
						<tr>
							<td style="text-align:center;">
								<ul class="contact-icons color1">
									<a target="_blank" href="https://twitter.com/globalmethane">
										<li class="icon fa-twitter" alt="GMI's Twitter Account"></li>
									</a>
								</ul>
							</td>
							<td style="text-align:center;">
								<ul class="contact-icons color1">
									<a target="_blank" href="https://www.facebook.com/globalmethane/">
										<li class="icon fa-facebook" alt="GMI's Facebook Account"></li>
									</a>
								</ul>
							</td>
							<td style="text-align:center;">
								<ul class="contact-icons color1">
									<a target="_blank" href="https://www.linkedin.com/company/global-methane-initiative-gmi-/">
										<li class="icon fa-linkedin" alt="GMI's LinkedIn Account">
										</li>
									</a>
								</ul>
							</td>
							<td style="text-align:center;">
								<ul class="contact-icons color1" id="mailLink">
									<a target="_blank" href="https://www.globalmethane.org/participate/joinmailinglist.aspx">
										<li alt="sign up for the GMI Mailing List" class="icon fa-envelope"></li>
									</a>
								</ul>
							</td>
						</tr>
					</table>
-->

				</div>


			</section>
			<!-- Panel (Spotlight) -->
			<!--							<section class="panel spotlight medium right" id="first">
								<div class="intro joined">
									<h2 class="major">Around the world</h2>
									<p>SVG map with clickable countries. Each country would launch a pop over screen with list of case studies for that country.</p>
								</div>
								<div class="inner">
									<img src="images/worldLow.svg" width="100%">
								</div>
								<div class="image filtered tinted" data-position="top right" style="background:rgba(0,0,0,0.8);">
								
								</div>
							</section>
						-->
			<!-- Panel -->
			<!--						
							<section class="panel color1" id="second">
								<div class="intro joined">
									<h2 class="major">Across all sectors</h2>
									<p>Clickable icons that launch popover screen with list of case studies by sector. Would be database driven to avoid duplication</p>
								</div>
								<div class="inner">
									<ul class="grid-icons three connected">
										<li><span class="icon fa-trash-o"><span class="label">Lorem</span></span></li>
										<li><span class="icon fa-molecule"><span class="label">Ipsum</span></span></li>
										<li><span class="icon fa-tint"><span class="label">Dolor</span></span></li>
										<li><a href="oilgas.html"><span class="icon fa-fire"><span class="label">Sit</span></span></a></li>
										<li><span class="icon fa-pick"><span class="label">Amet</span></span></li>
										<li><span class="icon fa-agriculture"><span class="label">Nullam</span></span></li>
									</ul>
								</div>
							</section>

-->
			<!-- Panel -->
			<!--
							<section class="panel" id="third">
								<div class="intro color2">
									<h2 class="major">Showcase</h2>
									<p>Feature images for stories. Clicking on images can load infographics, PDFs, videos, etc.</p>
								</div>
								<div class="gallery">
									<div class="group span-3">
										<a href="images/gallery/fulls/01.jpg" class="image filtered span-3" data-position="bottom"><img src="images/gallery/thumbs/01.jpg" alt="" /></a>
										<a href="images/gallery/fulls/02.jpg" class="image filtered span-1-5" data-position="center"><img src="images/gallery/thumbs/02.jpg" alt="" /></a>
										<a href="images/gallery/fulls/03.jpg" class="image filtered span-1-5" data-position="bottom"><img src="images/gallery/thumbs/03.jpg" alt="" /></a>
									</div>
									<a href="images/gallery/fulls/04.jpg" class="image filtered span-2-5" data-position="top"><img src="images/gallery/thumbs/04.jpg" alt="" /></a>
									<a href="images/gallery/fulls/09.jpg" class="image filtered span-2-5" data-position="right"><img src="images/gallery/thumbs/09.jpg" alt="" /></a>
								</div>
							</section>
-->
<style>
	#info a:hover{
		color:white;
		border-bottom:1px solid white;
	}
</style>
			<!-- Panel -->
			<section class="panel color3" id="info">
				<div class="inner columns aligned">
					<div class="span-2-5">

						<h2 class="major">
							<!--<a class="lightlink" href="#home"><i class="fa  fa-arrow-circle-left" aria-hidden="true"></i></a>&nbsp;-->The
							Challenge&nbsp;<a class="lightlink" href="#actionmap"><i class="fa  fa-arrow-circle-right"
									aria-hidden="true"></i></a>

						</h2>
						<p>
							The Global Methane Challenge is your chance to tell the world what you are doing to reduce
							methane emissions.
							Whether you
							are ready to make a new commitment or want to highlight an ongoing effort, we want to
							showcase it here.
						</p>
						<p>
							<h4>Why methane?</h4>
							<ul>
								<li>Methane is a powerful greenhouse gas, and emissions are on the rise</li>
								<li>Methane is a short-lived climate pollutant, so reductions made now can have
									significant short-term benefits</li>
								<li>Cost-effective technologies to capture and use methane are widely available today
								</li>
							</ul>

						</p>

					</div>

					<div class="span-3">

						<h4>Here are some ideas for how you can participate:</h4>

						<ul class="idealist">
							<li>
								<img class="item" src="images/listicons/005-research.svg">
								<p>Monitor methane emissions and create an emissions inventory.</p>
							</li>
							<li>
								<img class="item" src="images/listicons/001-wedding-planning.svg">
								<p>Develop an action plan for reducing emissions in one or more sectors.</p>
							</li>
							<li>
								<img class="item" src="images/listicons/002-dollar-symbol.svg">
								<p>Provide technical or financial support to a methane mitigation project.</p>
							</li>
							<li>
								<img class="item" src="images/listicons/003-mortarboard.svg">
								<p>Educate the public about methane emissions and abatement opportunities.</p>
							</li>
							<li>
								<img class="item" src="images/listicons/004-information.svg">
								<p>Showcase a methane mitigation project or technology.</p>
							</li>
						</ul>
						<p>For additional ideas for specific sectors, click <a href="documents/GMC_Ideas.pdf"
								target="_blank" class="lightlink">here
								<i class="fa fa-download" aria-hidden="true"></i></a>. You can also download the GMC
								Fact Sheet <a
								href="pdf/GMC Fact Sheet.pdf">in English <i class="fa fa-download" aria-hidden="true"></i></a> | <a
								href="pdf/GMC Fact Sheet_ES.pdf">en Español <i class="fa fa-download" aria-hidden="true"></i></a></p>


					</div>

				</div>
			</section>
			<!-- <section class="panel color8" id="mmatters">
				<div class="inner columns aligned">

					<div class="span-4">
							<h2 class="major">
								<a class="lightlink" href="#info"><i class="fa  fa-arrow-circle-left" aria-hidden="true"></i></a>&nbsp;Methane Matters&nbsp;<a class="lightlink" href="#actionmap"><i class="fa  fa-arrow-circle-right" aria-hidden="true"></i></a></h2>
						<div class="videoWrapper">
							<iframe id="youtube" src="https://www.youtube.com/embed/TL2K_Oh4THM?modestbranding=1&autohide=1&showinfo=0&controls=1" frameborder="0"
							    allow="autoplay; encrypted-media" allowfullscreen></iframe>
						</div>
					</div>

				</div>
			</section>-->
			<section class="panel color6" id="actionmap">
				<div class="intro">
					<h2 class="major">
						<a class="lightlink" href="#info"><i class="fa  fa-arrow-circle-left"
								aria-hidden="true"></i></a>&nbsp;Action
						Map&nbsp;<a class="lightlink" href="#actions"><i class="fa  fa-arrow-circle-right"
								aria-hidden="true"></i></a></h2>
					<p>Click on the map to learn more about how actors around the world are participating in the Global
						Methane
						Challenge.</p>
				</div>
				<div class="inner columns">
					<div class="span-3">
						<div id="map" style="width: 100%; height:400px; border:solid 2px rgba(255, 255, 255, 0.25);border-radius:0.25em;	box-shadow: 0 9px 20px rgba(0, 0, 0, 0.2)  ; 
							-webkit-box-shadow: 0 9px 20px rgba(0, 0, 0, 0.2)  ; 
							-moz-box-shadow: 0 9px 20px rgba(0, 0, 0, 0.2)  ; "></div>
					</div>

				</div>
			</section>
			<style>
				.gallery .group>* {
					height: 33.3%;
				}
			</style>
			<section class="panel color3" id="actions">
				<div class="intro span-4">
						<div class="">
					<h2 class="major">
						<a class="lightlink" href="#actionmap"><i class="fa  fa-arrow-circle-left"
								aria-hidden="true"></i></a>&nbsp;Actions&nbsp;<a class="lightlink" href="#faq"><i
								class="fa  fa-arrow-circle-right" aria-hidden="true"></i></a></h2>
					<p>Click on the photos to learn more about the methane mitigation activities taking place in different industry sectors around the world.</p>
				</div>
				</div>
				<div class="gallery">
					<div class="group span-1-5">

						<a class="image filtered span-1-5 biogas_slider" data-position="bottom">
							<img src="sectors/biogas.jpg" alt="" />

							<div class="image span-1-5" style="position:absolute; text-align:center; bottom:0;">
								<h2>7 Stories</h2>
							</div>
						</a>
						<a class="image filtered span-1-5 coal_slider" data-position="bottom">
							<img src="sectors/coal-mines.jpg" alt="" />

							<div class="image span-1-5" style="position:absolute; text-align:center; bottom:0;">
								<h2>4 Stories</h2>
							</div>
						</a>

						<a class="image filtered span-1-5 oilgas_slider" data-position="bottom">
							<img src="sectors/oil-gas.jpg" alt="" />

							<div class="image span-1-5" style="position:absolute; text-align:center; bottom:0;">
								<h2>4 Stories</h2>
							</div>
						</a>
					</div>
				</div>
			</section>
			<style>
				#hidden_content {
					display: none;
				}
			</style>
			<section class="panel color6" id="hidden_content">
				<div class="inner columns aligned">
					<div class="span-2">
						<div class="oilgascontent">
							<h2 class="major">
								Oil & Gas Actions
							</h2>
							<ul>
								<li style="list-style: none;"><b>National Actions</b></li>
								<ul>
								<li><a href="https://www.globalmethane.org/challenge/canada.html">Canada</a></li>
								<li><a href="https://www.globalmethane.org/challenge/mexico.html">Mexico</a></li>
								<li><a href="https://www.globalmethane.org/challenge/usa.html">USA</a></li>
							</ul>
								<li style="list-style: none;"><b>Subnational Actions</b></li>
							<ul><li><a href="https://www.globalmethane.org/challenge/ecopetrol.html">Ecopetrol</a></li>
								<li><a href="https://www.globalmethane.org/challenge/lidar.html">LiDAR Services International</a></li>
							</ul>
							</ul>
						</div>
						<div class="biogascontent">
							<h2 class="major">
								Biogas Actions
							</h2>
							<ul>
									<li style="list-style: none;"><b>National Actions</b></li>	
								<li><a href="https://www.globalmethane.org/challenge/canada.html">Canada</a></li>
									<!--<li><a href="https://www.globalmethane.org/challenge/mexico_ww.html">Mexico</a></li>-->
										<li><a href="https://www.globalmethane.org/challenge/kazakhstan.html">Kazakhstan</a></li>
								<li><a href="https://www.globalmethane.org/challenge/naucalpan.html">Nucalpan de Juárez</a></li>
								<li><a href="https://www.globalmethane.org/challenge/serbia.html">Serbia</a></li>
								<li><a href="https://www.globalmethane.org/challenge/usa.html">USA</a></li>
							</ul>
								<li style="list-style: none;"><b>Subnational Actions</b></li>
								<ul><li><a href="https://www.globalmethane.org/challenge/sourcefacilitybiocity.html">Source Facility and BioCity</a></li></ul>
							</ul>
						</div>
						<div class="coalcontent">
							<h2 class="major">
								Coal Actions
							</h2>
							<ul>
									<li style="list-style: none;"><b>National Actions</b></li>
									<ul><li><a href="https://www.globalmethane.org/challenge/canada.html">Canada</a></li>
									<li><a href="https://www.globalmethane.org/challenge/china.html">China</a></li>
									<li><a href="https://www.globalmethane.org/challenge/poland.html">Poland</a></li>
								<li><a href="https://www.globalmethane.org/challenge/usa.html">USA</a></li></ul>
							</ul>
						</div>
					</div>

				</div>
			</section>

			<section class="panel color6" id="faq">
				<div class="intro">
					<h2 class="major">
						<a class="lightlink" href="#actions"><i class="fa  fa-arrow-circle-left"
								aria-hidden="true"></i></a>&nbsp;FAQs&nbsp;<a class="lightlink" href="#fourth"><i class="fa  fa-arrow-circle-right"
								aria-hidden="true"></i></a></h2>
					<p></p>
				</div>
				<div class="inner columns">
					<div class="span-6">
		<style>
		/* Style the tab */
.tab {
  float: left;
  border: 1px solid #ccc;
  background-color: #f1f1f1;
  width: 50%;

}

/* Style the buttons inside the tab */
.tab button {
  display: block;
  background-color: inherit;
  color: black;
  padding: 22px 16px;
  width: 100%;
  border: none;
  outline: none;
  text-align: left;
  cursor: pointer;
  transition: 0.3s;
  font-size: 17px;
}

/* Change background color of buttons on hover */
.tab button:hover {
  background-color: #ddd;
}

/* Create an active/current "tab button" class */
.tab button.active {
  background-color: #ccc;
}

/* Style the tab content */
.tabcontent {
  float: left;
  padding: 0px 12px;
  width: 45%;
  border-left: none;
}
.tabcontent h3{
	color: #60a3bc;
	background:white;
	padding:4px;
}
</style></style>

		<div class="tab">
			<button class="tablinks" onclick="openCity(event, 'who')" id="defaultOpen">Who can participate?</button>
			<button class="tablinks" onclick="openCity(event, 'what')">What type of information should I submit?</button>
			<button class="tablinks" onclick="openCity(event, 'howlong')">How long will the Global Methane Challenge last?</button>
			<button class="tablinks" onclick="openCity(event, 'when')">When is the latest I can send my submission?</button>
			<button class="tablinks" onclick="openCity(event, 'howelse')">How else can I help?</button>
			<button class="tablinks" onclick="openCity(event, 'other')">Other Questions?</button>
		  </div>
		  
		  <div id="who" class="tabcontent">
			<h3>Who can participate?</h3>
			<p>The Global Methane Challenge (GMC) is open to public and private organizations who are committed to reducing methane across the globe. Governmental and non-governmental organizations, research and educational institutions, private companies, public utilities, and any organization or group that is interested in making a commitment to reduce methane are welcome to participate.</p>
		  </div>
		  
		  <div id="what" class="tabcontent">
				<h3>What type of information should I submit?</h3>
		<p>The Global Methane Challenge was launched to help all public and private actors showcase their specific actions to reduce methane throughout the year. In order to share your success story, please send us a case study or a description of the particular action or commitment you are taking, technical information about how you measure success of your efforts, as well as graphics, illustrations, or photographs that help bring your action to life. Please note that featuring GMC projects does not imply endorsement by the Global Methane Initiative (GMI).</p> 
		  </div>
		  
		  <div id="howlong" class="tabcontent">
				<h3>How long will the Global Methane Challenge last?</h3>
			<p>The Global Methane Challenge began in early 2019 and will culminate in a Capstone event in the spring of 2020. The GMC officially ends 31 December 2019.</p>
		  </div>
		  <div id="when" class="tabcontent">
				<h3>When is the latest I can send my submission?</h3>
			<p>Please submit information about your new methane reduction action no later than 31 December 2019. Submissions will be shared on the Global Methane Challenge website (<a href="www.globalmethane.org/challenge">www.globalmethane.org/challenge</a>) until the GMC 2020 Capstone event.</p>
		  </div>
		  <div id="howelse" class="tabcontent">
				<h3>How else can I help?</h3>
			<p>Get the word out! If you belong to an agency or organization, share information about the GMC with other organization members. Follow the GMI on social media, and “Like” or “Share” GMC submissions with your organization’s members or followers. <a href="https://www.globalmethane.org/project-network/pnmJoin.aspx">Become a member</a> of the Project Network, and add a link to your website or email signature with the <a href="https://www.globalmethane.org/project-network/logoDetails.aspx">Project Network Member logo</a>.</p>
		  <br>
		  <table>
		  <tr height="100px" style="background-color:rgba(0,0,0,0);border-top:0px;border-bottom:0px;">
			<td>
				<ul class="contact-icons color1">
					<a target="_blank" href="https://twitter.com/globalmethane">
						<li class="icon fa-twitter" title="GMI's Twitter Account"
							alt="GMI's Twitter Account"></li>
					</a>
				</ul>
			</td>
			<td>
				<ul class="contact-icons color1">
					<a target="_blank" href="https://www.facebook.com/globalmethane/">
						<li class="icon fa-facebook" title="GMI's Facebook Account"
							alt="GMI's Facebook Account"></li>
					</a>
				</ul>
			</td>
			<td>
				<ul class="contact-icons color1">
					<a target="_blank"
						href="https://www.linkedin.com/company/global-methane-initiative-gmi-/">
						<li class="icon fa-linkedin" title="GMI's LinkedIn Account"
							alt="GMI's LinkedIn Account"></li>
					</a>
				</ul>
			</td>
		</tr>
	</table></div>
		  <div id="other" class="tabcontent">
				<h3>Other Questions?</h3>
			<p>Feel free to email any GMI- or GMC-related questions to <a href="mailto:asg@globalmethane.org">asg@globalmethane.org</a>.</p>
		  </div>
		  
		  <script>
		  function openCity(evt, cityName) {
			var i, tabcontent, tablinks;
			tabcontent = document.getElementsByClassName("tabcontent");
			for (i = 0; i < tabcontent.length; i++) {
			  tabcontent[i].style.display = "none";
			}
			tablinks = document.getElementsByClassName("tablinks");
			for (i = 0; i < tablinks.length; i++) {
			  tablinks[i].className = tablinks[i].className.replace(" active", "");
			}
			document.getElementById(cityName).style.display = "block";
			evt.currentTarget.className += " active";
		  }
		  
		  // Get the element with id="defaultOpen" and click on it
		  document.getElementById("defaultOpen").click();
		  </script>
					</div>


				</div>
			</section>

			<section class="panel" id="fourth">
				<div class="intro" style="background:rgba(0,0,0,0.8);">
					<h2 class="major">
						<!--<a class="lightlink" href="#actionmap"><i class="fa  fa-arrow-circle-left" aria-hidden="true"></i></a>&nbsp;-->Tell
						your story</h2>
					<p>Get featured in the Challenge showcase by reaching out with your story.</p>
				</div>
				<div class="inner columns" style="background:rgba(0,0,0,0.8);">
					<div class="span-4">
						<form runat="server">
							<div class="fields">
								<div class="field third">
									<label for="salutation">Salutation</label>
									<div class="select-wrapper">
										<asp:DropDownList runat="server" style="background:rgba(255,255,255,0.5);"
											id="salutation">
											<asp:ListItem value="-" Text="-"></asp:ListItem>
											<asp:ListItem value="Mr." Text="Mr."></asp:ListItem>
											<asp:ListItem value="Ms." Text="Ms."></asp:ListItem>
											<asp:ListItem value="Dr." Text="Dr."></asp:ListItem>
										</asp:DropDownList>
									</div>
								</div>
								<div class="field third">
									<label for="firstName">First Name</label>
									<asp:TextBox runat="server" style="background:rgba(255,255,255,0.5);"
										id="firstName" />
								</div>
								<div class="field third">
									<label for="lastname">Last Name</label>
									<asp:TextBox runat="server" style="background:rgba(255,255,255,0.5);"
										id="lastName" />
								</div>
								<div class="field half">
									<label for="organization">Organization</label>
									<asp:TextBox runat="server" style="background:rgba(255,255,255,0.5);"
										id="organization" />
								</div>
								<div class="field half">
									<label for="relationship">Email Address</label>
									<div class="select-wrapper">
										<asp:TextBox runat="server" style="background:rgba(255,255,255,0.5);"
											id="email" />
									</div>
								</div>
								<!--<div class="field third">
									<label for="actionType">Type of Action</label>
										<asp:DropDownList runat="server" style="background:rgba(255,255,255,0.5);" id="actionType">
											  <asp:ListItem  value="0" Text="-"></asp:ListItem>
											  <asp:ListItem  value="Emission monitoring / emission inventory" Text="Emission monitoring / emission inventory"></asp:ListItem>
											  <asp:ListItem  value="Action plan to reduce emissions" Text="Action plan to reduce emissions"></asp:ListItem>
											  <asp:ListItem  value="Information sharing" Text="Information sharing"></asp:ListItem>
                                              <asp:ListItem  value="Capacity building – technical support" Text="Capacity building – technical support"></asp:ListItem>
											  <asp:ListItem  value="Capacity building – project finance" Text="Capacity building – project finance"></asp:ListItem>
											  <asp:ListItem  value="Emission reduction activity" Text="Emission reduction activity"></asp:ListItem>
											  <asp:ListItem  value="Emission reduction policy" Text="Emission reduction policy"></asp:ListItem>
                                              <asp:ListItem  value="Other" Text="Other"></asp:ListItem>
										</asp:DropDownList>
								</div>-->

								<div class="field">
									<label for="phone">How did you hear about the challenge?</label>
									<asp:DropDownList runat="server" style="background:rgba(255,255,255,0.5);"
										id="heardAbout">
										<asp:ListItem value="0" Text="-"></asp:ListItem>
										<asp:ListItem value="GMI email announcement" Text="GMI email announcement">
										</asp:ListItem>
										<asp:ListItem value="Social media message" Text="Social media message">
										</asp:ListItem>
										<asp:ListItem value="Project Network member" Text="Project Network member">
										</asp:ListItem>
										<asp:ListItem value="Globalmethane.org" Text="Globalmethane.org"></asp:ListItem>
										<asp:ListItem value="epa.gov" Text="EPA.gov"></asp:ListItem>
										<asp:ListItem value="Other" Text="Other webite (e.g. ensia.com)"></asp:ListItem>
										<asp:ListItem value="searchengine" Text="Search Engine"></asp:ListItem>
									</asp:DropDownList>
								</div>


								<!-- Break -->


								<!--<div class="field half">
									<label for="commitment">How we will participate in the Global Methane Challenge
									</label>
									<asp:TextBox TextMode="multiline" runat="server" style="background:rgba(255,255,255,0.5);" id="commitment" rows="3" />
								</div>-->
								<div class="field half">
									Provide your contact information and press submit to launch an online form to provide more details about your story.<br>
									Download the form <a href="docx/gmc form_EN.docx" download>in English</a> | <a href="docx/gmc form_ES.docx" download>en Español</a>
								</div>
								<div class="field half">

									<ul style="list-style-type: none;">
										<li style="padding:3px;">Questions? Contact the GMI Administrative Support Group
											at
											<a href="mailto:gmc@globalmethane.org">gmc@globalmethane.org</a></li>
										<li style="padding:3px;">

											<input runat="server" id="btnSave1" type="submit" value="Submit"
												class="button primary" /></li>
									</ul>
								</div>
							</div>

						</form>
					</div>

				</div>
			</section>


			<!-- Copyright -->

		</div>
		
	</div>


	<!-- Scripts -->
	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/js/browser.min.js"></script>
	<script src="assets/js/breakpoints.min.js"></script>
	<script src="assets/js/main.js"></script>
	<script type="text/javascript" src="https://www.amcharts.com/lib/3/ammap.js"></script>
	<script type="text/javascript" src="https://www.amcharts.com/lib/3/maps/js/worldLow.js"></script>
	<script src="assets/sweetalert/sweetalert2.min.js"></script>
	<script src="//cdnjs.cloudflare.com/ajax/libs/jquery-scrollTo/2.1.2/jquery.scrollTo.min.js"></script>

	<script>
		$(document).ready(function () {
			$(".biogas_slider").click(function () {
				$(".biogascontent").fadeIn();
				$(".coalcontent").hide();
				$(".oilgascontent").hide();
				$("#hidden_content").animate({
					width: 'show'
				}, "slow");
			});
			$(".coal_slider").click(function () {
				$(".biogascontent").hide();
				$(".coalcontent").fadeIn();
				$(".oilgascontent").hide();
				$("#hidden_content").animate({
					width: 'show'
				}, "slow");
			});
			$(".oilgas_slider").click(function () {
				$(".biogascontent").hide();
				$(".coalcontent").hide();
				$(".oilgascontent").fadeIn();
				$("#hidden_content").animate({
					width: 'show'
				}, "slow");
			});
		});
	</script>

	<!-- amCharts javascript code -->
	<script type="text/javascript">
		AmCharts.makeChart("map", {
			"type": "map",
			"pathToImages": "http://www.amcharts.com/lib/3/images/",
			"addClassNames": true,
			"fontSize": 15,
			"color": "#000000",
			"projection": "mercator",
			"backgroundAlpha": 1,
			"dragMap": false,
			"panControlEnabled": true,
			"mouseWheelZoomEnabled": false,
			"backgroundColor": "rgba(255,255,255,0.12)",
			"dataProvider": {
				"map": "worldLow",
				"getAreasFromMap": true,
				"balloon": {
					"enabled": false,
					"adjustBorderColor": true,
					"color": "#000000",
					"cornerRadius": 5,
					"fillColor": "#FFFFFF"
				},
				"images": [{
						"selectable": true,
						"longitude": 95.698830,
						"latitude": 42.427944,
						"svgPath": "M3.5,13.277C3.5,6.22,9.22,0.5,16.276,0.5C23.333,0.5,29.053,6.22,29.053,13.277C29.053,14.54,28.867,15.759,28.526,16.914C26.707,24.271,16.219,32.5,16.219,32.5C16.219,32.5,4.37,23.209,3.673,15.542C3.673,15.542,3.704,15.536,3.704,15.536C3.572,14.804,3.5,14.049,3.5,13.277C3.5,13.277,3.5,13.277,3.5,13.277M16.102,16.123C18.989,16.123,21.329,13.782,21.329,10.895C21.329,8.008,18.989,5.668,16.102,5.668C13.216,5.668,10.876,8.008,10.876,10.895C10.876,13.782,13.216,16.123,16.102,16.123C16.102,16.123,16.102,16.123,16.102,16.123",
						"color": "rgba(247,151,55,1)",
						"scale": 1,
						"url": 'javascript:china()',
						"balloonText": '[[title]]',
						"cancelButtonColor": '#4c5c96',
						"title": 'China<br> International Centre of Excellence on Coal Mine Methane',
						//China		
					},
					{
						"selectable": true,
						"longitude": 66.698830,
						"latitude": 51.427944,
						"svgPath": "M3.5,13.277C3.5,6.22,9.22,0.5,16.276,0.5C23.333,0.5,29.053,6.22,29.053,13.277C29.053,14.54,28.867,15.759,28.526,16.914C26.707,24.271,16.219,32.5,16.219,32.5C16.219,32.5,4.37,23.209,3.673,15.542C3.673,15.542,3.704,15.536,3.704,15.536C3.572,14.804,3.5,14.049,3.5,13.277C3.5,13.277,3.5,13.277,3.5,13.277M16.102,16.123C18.989,16.123,21.329,13.782,21.329,10.895C21.329,8.008,18.989,5.668,16.102,5.668C13.216,5.668,10.876,8.008,10.876,10.895C10.876,13.782,13.216,16.123,16.102,16.123C16.102,16.123,16.102,16.123,16.102,16.123",
						"color": "rgba(247,151,55,1)",
						"scale": 1,
						"url": 'javascript:kazakhstan()',
						"balloonText": '[[title]]',
						"cancelButtonColor": '#4c5c96',
						"title": 'Kazakhstan:<br>Wastewater Biogas Recovery Initiative',
						//Poland			
					},
					{
						"selectable": true,
						"longitude": 20.698830,
						"latitude": 52.427944,
						"svgPath": "M3.5,13.277C3.5,6.22,9.22,0.5,16.276,0.5C23.333,0.5,29.053,6.22,29.053,13.277C29.053,14.54,28.867,15.759,28.526,16.914C26.707,24.271,16.219,32.5,16.219,32.5C16.219,32.5,4.37,23.209,3.673,15.542C3.673,15.542,3.704,15.536,3.704,15.536C3.572,14.804,3.5,14.049,3.5,13.277C3.5,13.277,3.5,13.277,3.5,13.277M16.102,16.123C18.989,16.123,21.329,13.782,21.329,10.895C21.329,8.008,18.989,5.668,16.102,5.668C13.216,5.668,10.876,8.008,10.876,10.895C10.876,13.782,13.216,16.123,16.102,16.123C16.102,16.123,16.102,16.123,16.102,16.123",
						"color": "rgba(247,151,55,1)",
						"scale": 1,
						"url": 'javascript:poland()',
						"balloonText": '[[title]]',
						"cancelButtonColor": '#4c5c96',
						"title": 'Poland:<br> International Centre of Excellence on Coal Mine Methane',
						//Poland			
					},
					{
						"selectable": true,
						"longitude": 20.698830,
						"latitude": 45.427944,
						"svgPath": "M3.5,13.277C3.5,6.22,9.22,0.5,16.276,0.5C23.333,0.5,29.053,6.22,29.053,13.277C29.053,14.54,28.867,15.759,28.526,16.914C26.707,24.271,16.219,32.5,16.219,32.5C16.219,32.5,4.37,23.209,3.673,15.542C3.673,15.542,3.704,15.536,3.704,15.536C3.572,14.804,3.5,14.049,3.5,13.277C3.5,13.277,3.5,13.277,3.5,13.277M16.102,16.123C18.989,16.123,21.329,13.782,21.329,10.895C21.329,8.008,18.989,5.668,16.102,5.668C13.216,5.668,10.876,8.008,10.876,10.895C10.876,13.782,13.216,16.123,16.102,16.123C16.102,16.123,16.102,16.123,16.102,16.123",
						"color": "rgba(247,151,55,1)",
						"scale": 1,
						"url": 'javascript:serbia()',
						"balloonText": '[[title]]',
						"cancelButtonColor": '#4c5c96',
						"title": 'Serbia:<br> Building Capacity for Organic Waste Management',
						//Serbia			
					},
					{
						"selectable": true,
						"longitude": -73.698830,
						"latitude": 9.427944,
						"svgPath": "M3.5,13.277C3.5,6.22,9.22,0.5,16.276,0.5C23.333,0.5,29.053,6.22,29.053,13.277C29.053,14.54,28.867,15.759,28.526,16.914C26.707,24.271,16.219,32.5,16.219,32.5C16.219,32.5,4.37,23.209,3.673,15.542C3.673,15.542,3.704,15.536,3.704,15.536C3.572,14.804,3.5,14.049,3.5,13.277C3.5,13.277,3.5,13.277,3.5,13.277M16.102,16.123C18.989,16.123,21.329,13.782,21.329,10.895C21.329,8.008,18.989,5.668,16.102,5.668C13.216,5.668,10.876,8.008,10.876,10.895C10.876,13.782,13.216,16.123,16.102,16.123C16.102,16.123,16.102,16.123,16.102,16.123",
						"color": "rgba(72,168,138,1)",
						"scale": 1,
						"url": 'javascript:colombia()',
						"balloonText": '[[title]]',
						"cancelButtonColor": '#4c5c96',
						"title": 'Colombia:<br> Collaborating with Climate and Clean Air Coalition (CCAC) Oil and Gas Methane Partnership (OGMP)',
						//Colombia			
					},

					{
						"selectable": true,
						"longitude": -95.698830,
						"latitude": 20.427944,
						"svgPath": "M3.5,13.277C3.5,6.22,9.22,0.5,16.276,0.5C23.333,0.5,29.053,6.22,29.053,13.277C29.053,14.54,28.867,15.759,28.526,16.914C26.707,24.271,16.219,32.5,16.219,32.5C16.219,32.5,4.37,23.209,3.673,15.542C3.673,15.542,3.704,15.536,3.704,15.536C3.572,14.804,3.5,14.049,3.5,13.277C3.5,13.277,3.5,13.277,3.5,13.277M16.102,16.123C18.989,16.123,21.329,13.782,21.329,10.895C21.329,8.008,18.989,5.668,16.102,5.668C13.216,5.668,10.876,8.008,10.876,10.895C10.876,13.782,13.216,16.123,16.102,16.123C16.102,16.123,16.102,16.123,16.102,16.123",
						"color": "rgba(247,151,55,1)",
						"scale": 1,
						"url": 'javascript:nauc()',
						"balloonText": '[[title]]',
						"cancelButtonColor": '#4c5c96',
						"title": 'Naucalpan de Juárez, Mexico:<br>Improving Waste Management Practices and Reducing Methane',
						//Naucalpan
					},
//					{
//						"selectable": true,
//						"longitude": -102.698830,
//						"latitude": 26.427944,
//						"svgPath": "M3.5,13.277C3.5,6.22,9.22,0.5,16.276,0.5C23.333,0.5,29.053,6.22,29.053,13.277C29.053,14.54,28.867,15.759,28.526,16.914C26.707,24.271,16.219,32.5,16.219,32.5C16.219,32.5,4.37,23.209,3.673,15.542C3.673,15.542,3.704,15.536,3.704,15.536C3.572,14.804,3.5,14.049,3.5,13.277C3.5,13.277,3.5,13.277,3.5,13.277M16.102,16.123C18.989,16.123,21.329,13.782,21.329,10.895C21.329,8.008,18.989,5.668,16.102,5.668C13.216,5.668,10.876,8.008,10.876,10.895C10.876,13.782,13.216,16.123,16.102,16.123C16.102,16.123,16.102,16.123,16.102,16.123",
//						"color": "rgba(247,151,55,1)",
//						"scale": 1,
//						"url": 'javascript://()',
//						"balloonText": '[[title]]',
//						"cancelButtonColor": '#4c5c96',
//						"title": 'Mexico:<br> Wastewater Biogas Recovery Initiative ',
//						//Mexico
//					},
					{
						"selectable": true,
						"longitude": -108.698830,
						"latitude": 28.427944,
						"svgPath": "M3.5,13.277C3.5,6.22,9.22,0.5,16.276,0.5C23.333,0.5,29.053,6.22,29.053,13.277C29.053,14.54,28.867,15.759,28.526,16.914C26.707,24.271,16.219,32.5,16.219,32.5C16.219,32.5,4.37,23.209,3.673,15.542C3.673,15.542,3.704,15.536,3.704,15.536C3.572,14.804,3.5,14.049,3.5,13.277C3.5,13.277,3.5,13.277,3.5,13.277M16.102,16.123C18.989,16.123,21.329,13.782,21.329,10.895C21.329,8.008,18.989,5.668,16.102,5.668C13.216,5.668,10.876,8.008,10.876,10.895C10.876,13.782,13.216,16.123,16.102,16.123C16.102,16.123,16.102,16.123,16.102,16.123",
						"color": "rgba(247,151,55,1)",
						"scale": 1,
						"url": 'javascript:mex()',
						"balloonText": '[[title]]',
						"cancelButtonColor": '#4c5c96',
						"title": 'Mexico:<br> Guidelines for the Prevention and Integral Control of Methane Emissions from the Hydrocarbon Sector',
						//Mexico
					},
					{
						"selectable": true,
						"longitude": -110.698830,
						"latitude": 60.427944,
						"svgPath": "M3.5,13.277C3.5,6.22,9.22,0.5,16.276,0.5C23.333,0.5,29.053,6.22,29.053,13.277C29.053,14.54,28.867,15.759,28.526,16.914C26.707,24.271,16.219,32.5,16.219,32.5C16.219,32.5,4.37,23.209,3.673,15.542C3.673,15.542,3.704,15.536,3.704,15.536C3.572,14.804,3.5,14.049,3.5,13.277C3.5,13.277,3.5,13.277,3.5,13.277M16.102,16.123C18.989,16.123,21.329,13.782,21.329,10.895C21.329,8.008,18.989,5.668,16.102,5.668C13.216,5.668,10.876,8.008,10.876,10.895C10.876,13.782,13.216,16.123,16.102,16.123C16.102,16.123,16.102,16.123,16.102,16.123",
						"color": "rgba(72,168,138,1)",
						"scale": 1,
						"url": 'javascript:lidar()',
						"balloonText": '[[title]]',
						"cancelButtonColor": '#4c5c96',
						"title": 'LiDAR Services International Inc.:<br> Airborne methane mapping and comprehensive remote emissions intelligence, surveillance and reconnaissance sensing',
						//CanadaPN
					},
					{
						"selectable": true,
						"longitude": -75.698830,
						"latitude": 55.427944,
						"svgPath": "M3.5,13.277C3.5,6.22,9.22,0.5,16.276,0.5C23.333,0.5,29.053,6.22,29.053,13.277C29.053,14.54,28.867,15.759,28.526,16.914C26.707,24.271,16.219,32.5,16.219,32.5C16.219,32.5,4.37,23.209,3.673,15.542C3.673,15.542,3.704,15.536,3.704,15.536C3.572,14.804,3.5,14.049,3.5,13.277C3.5,13.277,3.5,13.277,3.5,13.277M16.102,16.123C18.989,16.123,21.329,13.782,21.329,10.895C21.329,8.008,18.989,5.668,16.102,5.668C13.216,5.668,10.876,8.008,10.876,10.895C10.876,13.782,13.216,16.123,16.102,16.123C16.102,16.123,16.102,16.123,16.102,16.123",
						"color": "rgba(247,151,55,1)",
						"scale": 1,
						"url": 'javascript:can()',
						"balloonText": '[[title]]',
						"cancelButtonColor": '#4c5c96',
						"title": 'Canada:<br>Domestic & International Methane Activities',
						//Canada
					},
					{
						"selectable": true,
						"longitude": -75.698830,
						"latitude": 40.427944,
						"svgPath": "M3.5,13.277C3.5,6.22,9.22,0.5,16.276,0.5C23.333,0.5,29.053,6.22,29.053,13.277C29.053,14.54,28.867,15.759,28.526,16.914C26.707,24.271,16.219,32.5,16.219,32.5C16.219,32.5,4.37,23.209,3.673,15.542C3.673,15.542,3.704,15.536,3.704,15.536C3.572,14.804,3.5,14.049,3.5,13.277C3.5,13.277,3.5,13.277,3.5,13.277M16.102,16.123C18.989,16.123,21.329,13.782,21.329,10.895C21.329,8.008,18.989,5.668,16.102,5.668C13.216,5.668,10.876,8.008,10.876,10.895C10.876,13.782,13.216,16.123,16.102,16.123C16.102,16.123,16.102,16.123,16.102,16.123",
						"color": "rgba(247,151,55,1)",
						"scale": 1,
						"url": 'javascript:usa()',
						"balloonText": '[[title]]',
						"cancelButtonColor": '#4c5c96',
						"title": 'USA:<br>Domestic & International Methane Activities',
						//USA

					},
					{
						"selectable": true,
						"longitude": 81.698830,
						"latitude": 25.427944,
						"svgPath": "M3.5,13.277C3.5,6.22,9.22,0.5,16.276,0.5C23.333,0.5,29.053,6.22,29.053,13.277C29.053,14.54,28.867,15.759,28.526,16.914C26.707,24.271,16.219,32.5,16.219,32.5C16.219,32.5,4.37,23.209,3.673,15.542C3.673,15.542,3.704,15.536,3.704,15.536C3.572,14.804,3.5,14.049,3.5,13.277C3.5,13.277,3.5,13.277,3.5,13.277M16.102,16.123C18.989,16.123,21.329,13.782,21.329,10.895C21.329,8.008,18.989,5.668,16.102,5.668C13.216,5.668,10.876,8.008,10.876,10.895C10.876,13.782,13.216,16.123,16.102,16.123C16.102,16.123,16.102,16.123,16.102,16.123",
						"color": "rgba(72,168,138,1)",
						"scale": 1,
						"url": 'javascript:biocity()',
						"balloonText": '[[title]]',
						"cancelButtonColor": '#4c5c96',
						"title": 'Source Facility and BioCity:<br>Capturing and using agricultural biogas',
						//India
					}
				],
				areas: [{
						"id": "AL",
						"color": "#733e75"
					},
					{
						"id": "BG",
						"color": "#733e75"
					},
					{
						"id": "FI",
						"color": "#733e75"
					},
					{
						"id": "GE",
						"color": "#733e75"
					},
					{
						"id": "DE",
						"color": "#733e75"
					},
					{
						"id": "IT",
						"color": "#733e75"
					},
					{
						"id": "NO",
						"color": "#733e75"
					},
					{
						"id": "PL",
						"color": "#733e75"
					},
					{
						"id": "RU",
						"color": "#733e75"
					},
					{
						"id": "RS",
						"color": "#733e75"
					},
					{
						"id": "TR",
						"color": "#733e75"
					},
					{
						"id": "UA",
						"color": "#733e75"
					},
					{
						"id": "GB",
						"color": "#733e75"
					},
					{
						"id": "CA",
						"color": "#733e75"
					},
					{
						"id": "DO",
						"color": "#733e75"
					},
					{
						"id": "MX",
						"color": "#733e75"
					},
					{
						"id": "NI",
						"color": "#733e75"
					},
					{
						"id": "US",
						"color": "#733e75"
					},
					{
						"id": "AR",
						"color": "#733e75"
					},
					{
						"id": "BR",
						"color": "#733e75"
					},
					{
						"id": "CL",
						"color": "#733e75"
					},
					{
						"id": "CO",
						"color": "#733e75"
					},
					{
						"id": "EC",
						"color": "#733e75"
					},
					{
						"id": "PE",
						"color": "#733e75"
					},
					{
						"id": "CI",
						"color": "#733e75"
					},
					{
						"id": "ET",
						"color": "#733e75"
					},
					{
						"id": "GH",
						"color": "#733e75"
					},
					{
						"id": "NG",
						"color": "#733e75"
					},
					{
						"id": "CN",
						"color": "#733e75"
					},
					{
						"id": "IN",
						"color": "#733e75"
					},
					{
						"id": "ID",
						"color": "#733e75"
					},
					{
						"id": "IL",
						"color": "#733e75"
					},
					{
						"id": "JP",
						"color": "#733e75"
					},
					{
						"id": "JO",
						"color": "#733e75"
					},
					{
						"id": "KZ",
						"color": "#733e75"
					},
					{
						"id": "MN",
						"color": "#733e75"
					},
					{
						"id": "PK",
						"color": "#733e75"
					},
					{
						"id": "PH",
						"color": "#733e75"
					},
					{
						"id": "SA",
						"color": "#733e75"
					},
					{
						"id": "KR",
						"color": "#733e75"
					},
					{
						"id": "LK",
						"color": "#733e75"
					},
					{
						"id": "TH",
						"color": "#733e75"
					},
					{
						"id": "VN",
						"color": "#733e75"
					},
					{
						"id": "AU",
						"color": "#733e75"
					}
				]
			},
			"balloon": {
				"horizontalPadding": 15,
				"borderAlpha": 0,
				"borderThickness": 1,
				"verticalPadding": 15
			},
			"areasSettings": {
				"color": "rgba(255,255,255,1)",
				"outlineColor": "rgba(0,0,0,.2)",
				"rollOverOutlineColor": "rgba(114,205,215,1)",
				"rollOverBrightness": 5,
				"selectedBrightness": 10,
				"selectable": true,
				"unlistedAreasAlpha": 0,
				"unlistedAreasOutlineAlpha": 0
			},
			"imagesSettings": {
				"alpha": 1,
				"color": "rgba(255,255,255,1)",
				"outlineAlpha": 0,
				"rollOverOutlineAlpha": 0,
				"outlineColor": "rgba(114,205,215,1)",
				"rollOverBrightness": 20,
				"selectedBrightness": 20,
				"selectable": true
			},
			"linesSettings": {
				"color": "rgba(255,255,255,1)",
				"selectable": true,
				"rollOverBrightness": 20,
				"selectedBrightness": 20
			},
			"zoomControl": {
				"zoomControlEnabled": true,
				"homeButtonEnabled": false,
				"panControlEnabled": true,
				"right": 38,
				"bottom": 30,
				"minZoomLevel": 0.25,
				"gridHeight": 100,
				"gridAlpha": 0.1,
				"gridBackgroundAlpha": 0,
				"gridColor": "#FFFFFF",
				"draggerAlpha": 1,
				"buttonCornerRadius": 2
			},
			"legend": {
				"backgroundColor": "#fff",
				"backgroundAlpha": 0.5,
				"align": "center",
				"data": [{
					"title": "GMI Partner Country",
					"color": "#733e75"
				}, {
					"title": "National Action",
					"color": "#f79737"
				}, {
					"title": "Subnational Action",
					"color": "#48A88A"
				}]
			}
		});
	</script>
	<script>
		function colombia() {
			swal({
				imageUrl: "images/tiles/colombia.png",
				imageWidth: 550,
				title: 'Colombia',
				imageHeight: 225,
				imageAlt: "Collaborating with Climate and Clean Air Coalition (CCAC) Oil and Gas Methane Partnership (OGMP)",
				text: 'Collaborating with Climate and Clean Air Coalition (CCAC) Oil and Gas Methane Partnership (OGMP)',
				showCancelButton: true,
				confirmButtonColor: '#3085d6',
				cancelButtonColor: '#82589F',
				confirmButtonText: 'Tell me more'
			}).then((result) => {
				if (result.value) {
					window.location.href = "colombia.html";
				}
			})
		}

		function lidar() {
			swal({
				imageUrl: "images/tiles/canada.png",
				imageWidth: 550,
				title: 'LiDAR Services',
				imageHeight: 225,
				imageAlt: "Airborne methane mapping and comprehensive remote emissions intelligence, surveillance and reconnaissance sensing",
				text: 'Airborne methane mapping and comprehensive remote emissions intelligence, surveillance and reconnaissance sensing',
				showCancelButton: true,
				confirmButtonColor: '#3085d6',
				cancelButtonColor: '#82589F',
				confirmButtonText: 'Tell me more'
			}).then((result) => {
				if (result.value) {
					window.location.href = "lidar.html";
				}
			})
		}

		function china() {
			swal({
				imageUrl: "images/tiles/china.png",
				imageWidth: 550,
				title: 'China',
				imageHeight: 225,
				imageAlt: "China International Centre of Excellence on Coal Mine Methane",
				text: 'China International Centre of Excellence on Coal Mine Methane',
				showCancelButton: true,
				confirmButtonColor: '#3085d6',
				cancelButtonColor: '#82589F',
				confirmButtonText: 'Tell me more'
			}).then((result) => {
				if (result.value) {
					window.location.href = "china.html";
				}
			})
		}

		function poland() {
			swal({
				imageUrl: "images/tiles/poland.png",
				imageWidth: 550,
				title: 'Poland',
				imageHeight: 225,
				imageAlt: "Poland International Centre of Excellence on Coal Mine Methane",
				text: 'Poland International Centre of Excellence on Coal Mine Methane',
				showCancelButton: true,
				confirmButtonColor: '#3085d6',
				cancelButtonColor: '#82589F',
				confirmButtonText: 'Tell me more'
			}).then((result) => {
				if (result.value) {
					window.location.href = "poland.html";
				}
			})
		}

		function serbia() {
			swal({
				imageUrl: "images/tiles/serbia.png",
				imageWidth: 550,
				title: 'Serbia',
				imageHeight: 225,
				imageAlt: "Building Capacity for Organic Waste Management",
				text: 'Building Capacity for Organic Waste Management',
				showCancelButton: true,
				confirmButtonColor: '#3085d6',
				cancelButtonColor: '#82589F',
				confirmButtonText: 'Tell me more'
			}).then((result) => {
				if (result.value) {
					window.location.href = "serbia.html";
				}
			})
		}

		function nauc() {
			swal({
				imageUrl: "images/tiles/naucalpan.png",
				imageWidth: 550,
				title: 'Naucalpan',
				imageHeight: 225,
				imageAlt: "Improving Waste Management Practices and Reducing Methane",
				text: 'Improving Waste Management Practices and Reducing Methane',
				showCancelButton: true,
				confirmButtonColor: '#3085d6',
				cancelButtonColor: '#82589F',
				confirmButtonText: 'Tell me more'
			}).then((result) => {
				if (result.value) {
					window.location.href = "naucalpan.html";
				}
			})
		}

		function kazakhstan() {
			swal({
				imageUrl: "images/tiles/kazakhstan.png",
				imageWidth: 550,
				title: 'Kazakhstan',
				imageHeight: 225,
				imageAlt: "Wastewater Biogas Recovery Initiative ",
				text: 'Wastewater Biogas Recovery Initiative ',
				showCancelButton: true,
				confirmButtonColor: '#3085d6',
				cancelButtonColor: '#82589F',
				confirmButtonText: 'Tell me more'
			}).then((result) => {
				if (result.value) {
					window.location.href = "kazakhstan.html";
				}
			})
		}

//		function mexww() {
//			swal({
//				imageUrl: "images/tiles/mexico.png",
//				imageWidth: 550,
//				title: 'Mexico',
//				imageHeight: 225,
//				imageAlt: "Wastewater Biogas Recovery Initiative ",
//				text: 'Wastewater Biogas Recovery Initiative ',
//				showCancelButton: true,
//				confirmButtonColor: '#3085d6',
//				cancelButtonColor: '#82589F',
//				confirmButtonText: 'Tell me more'
//			}).then((result) => {
//				if (result.value) {
//					window.location.href = "mexico_ww.html";
//				}
//			})
//		}

		function mex() {
			swal({
				imageUrl: "images/tiles/mexico.png",
				imageWidth: 550,
				title: 'Mexico',
				imageHeight: 225,
				imageAlt: "Guidelines for the Prevention and Integral Control of Methane Emissions from the Hydrocarbon Sector",
				text: 'Guidelines for the Prevention and Integral Control of Methane Emissions from the Hydrocarbon Sector',
				showCancelButton: true,
				confirmButtonColor: '#3085d6',
				cancelButtonColor: '#82589F',
				confirmButtonText: 'Tell me more'
			}).then((result) => {
				if (result.value) {
					window.location.href = "mexico.html";
				}
			})
		}

		function can() {
			swal({
				imageUrl: "images/tiles/canada1.png",
				imageWidth: 550,
				title: 'Canada',
				imageHeight: 225,
				imageAlt: "Domestic & International Methane Activities",
				text: "Domestic & International Methane Activities",
				showCancelButton: true,
				confirmButtonColor: '#3085d6',
				cancelButtonColor: '#82589F',
				confirmButtonText: 'Tell me more'
			}).then((result) => {
				if (result.value) {
					window.location.href = "canada.html";
				}
			})
		}

		function usa() {
			swal({
				imageUrl: "images/tiles/usa.png",
				imageWidth: 550,
				title: 'USA',
				imageHeight: 225,
				imageAlt: "Domestic & International Methane Activities",
				text: 'Domestic & International Methane Activities',
				showCancelButton: true,
				confirmButtonColor: '#3085d6',
				cancelButtonColor: '#82589F',
				confirmButtonText: 'Tell me more'
			}).then((result) => {
				if (result.value) {
					window.location.href = "usa.html";
				}
			})
		}

		function biocity() {
			swal({
				imageUrl: "images/tiles/indiapn.png",
				imageWidth: 550,
				title: 'Source Facility and BioCity',
				imageHeight: 225,
				imageAlt: "Capturing and using agricultural biogas",
				text: 'Capturing and using agricultural biogas',
				showCancelButton: true,
				confirmButtonColor: '#3085d6',
				cancelButtonColor: '#82589F',
				confirmButtonText: 'Tell me more'
			}).then((result) => {
				if (result.value) {
					window.location.href = "sourcefacilitybiocity.html";
				}
			})
		}
	</script>
	<script>
		$('.navRight').click(function (e) {
			e.preventDefault();
			$('#foo').css({
				'right': '0px',
				'left': ''
			}).animate({
				'right': '30px'
			});
		});
		$('.navLeft').click(function (e) {
			e.preventDefault();
			$('#foo').css({
				'right': '',
				'left': '0px'
			}).animate({
				'left': '30px'
			});
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
		$(document).ready(function () {



			var getUrlParameter = function getUrlParameter(sParam) {
				var sPageURL = decodeURIComponent(window.location.search.substring(1)),
					sURLVariables = sPageURL.split('&'),
					sParameterName,
					i;

				for (i = 0; i < sURLVariables.length; i++) {
					sParameterName = sURLVariables[i].split('=');

					if (sParameterName[0] === sParam) {
						return sParameterName[1] === undefined ? true : sParameterName[1];
					}
				}
			};

			var submit = getUrlParameter('submit');

			if (submit == 'commitment') {
				if (submit == 'commitment') {


					Swal.fire(
						'Thanks!',
						'Thank you for your commitment! We will be in touch shortly to discuss your GMC story.',
						'success'
					)


				}
			}

			$('a[title="Interactive JavaScript maps"]').hide();

			$("#mobileLinks").click(function () {
				$('#mobileLinks').removeClass('animated slideInUp');
				$('#mobileLinks').addClass('animated slideOutDown');
			});

			$(".linkClick").click(function () {
				$('#mobileLinks').removeClass('animated slideInUp');
				$('#mobileLinks').addClass('animated slideOutDown');
			});

			$("#mobilenav").click(function () {
				$('#mobileLinks').removeClass('animated slideOutDown');
				$('#mobileLinks').removeClass('invisible');
				$('#mobileLinks').addClass('animated slideInUp');
			});

			$("#closeNav").click(function () {
				$('#mobileLinks').removeClass('animated slideInUp');
				$('#mobileLinks').addClass('animated slideOutDown');

			})
		});
	</script>
	<script>
		var vid = document.getElementById("myVideo");

		vid.playbackRate = 0.4;

		$('.translateText').click(function () {
			$("#languageWidget").css("display", "block");
			$(".hider").slideToggle();
		});

		var watcher = document.getElementById('watcher');

		$.fn.isInViewport = function () {
			var elementLeft = $(this).offset().left;
			var elementRight = elementLeft;

			var viewportLeft = $(window).scrollLeft();
			var viewportRight = viewportLeft + $(window).width();

			return elementRight > viewportLeft && elementLeft < viewportRight;
		};

		$(window).on('resize scroll', function () {
			$('section').each(function () {
				var activeColor = $(this).attr('id');

				if ($(this).isInViewport()) {
					$('nav ul li a').removeClass('active');
					$('#' + activeColor + 'nav').addClass('active');

				} else {
					$('#' + activeColor + 'nav').removeClass('active');
				}

			});
			var vid = document.getElementById("myVideo");
			if ($(watcher).isInViewport()) {
				vid.play();
				$('#infonav').removeClass('active');
			} else {

				vid.pause();
			}

		});
	</script>

	<label class="modal-backdrop" for="modal-toggle"></label>
	<div class="modal-content">
		<label class="modal-close" for="modal-toggle">&#x2715;</label>
		<h2>Modal title</h2>
		<hr />
		<p>Hello from inside the modal!</p>
		<label class="modal-content-btn" for="modal-toggle">OK</label>
	</div>


</body>

</html>