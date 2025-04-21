<%@ Page Language="VB" AutoEventWireup="false" Inherits="M2M_Redesign.steering_index" Codebehind="index.aspx.vb" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

    <title>Steering Committee | Global Methane Initiative</title>
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
		
				
    </style>
</head>
<body>
    <!-- #include virtual="/includes/header.html" -->
    <form id="steering_index_form" runat="server">
    <div>
    <!-- Page Content -->
    <section class="py-5 gmi-light-blue">
        <div class="container">
			

            <div class="row">
                <div class="col-sm-8 vertSplitter">
					<h1>Steering Committee</h1>
					<p>
                        The Steering Committee governs the overall framework, policies, and procedures of the GMI. The Steering Committee also reviews the progress of the Initiative and provides guidance to the GMI Secretariat and Subcommittees.
                    </p>
					<p>Delegates from more than 20 Partner countries participate in the Steering Committee. All Partners are considered Steering Committee "observers" from the time they join the Initiative.  Twelve months after joining and any time thereafter, Partner Countries may submit a request to become a Steering Committee member by sending a letter to the Secretariat that outlines their engagement in the Initiative. Subcommittee Co-Chairs may serve as ex-officio members of the Steering Committee.</p>
                </div>
                <div class="col-sm-4">
					<div class="border border-secondary bg-white px-0">
						<div class="py-1 text-center bg-dark text-white"><strong>On this page</strong></div>
                                <ul class="list-group py-2">
                                    <li class="list-group-item noborder nobackground py-1"><a href="#committee">Steering Committee Members</a></li>
                                    <li class="list-group-item noborder nobackground py-1"><a href="#activities">Activities of the Steering Committee</a></li>
									<li class="list-group-item noborder nobackground py-1"><a href="#resources">Steering Committee Resources</a></li>
                                </ul>
					</div>
                </div>
			</div>			
        </div>
    </section>
	<section class="py-5 bg-white">
		<div class="container">
				<h2 id="committee">Steering Committee Members</h3>
					<div class="row py-2">
                        <div class="col-sm-4">
                            <h3>Chair</h3>  
                              <p><strong>Helen Ryan</strong><br>Environment and Climate Change Canada (ECCC)</p>
						</div>
                        <div class="col-sm-4">
                              <h3>Members</h3>
                              <p>Delegates from more than 20 countries participate in the Steering Committee.</p>
							  <p><a href="/delegates/index.aspx" role="button" class="btn btn-outline-primary">View Delegates</a></p>

						</div>
                        <div class="col-sm-4">
							<h3>Director, GMI Secretariat</h3>
								<p><strong>Denise Mulholland</strong><br>U.S. Environmental Protection Agency</p>
								<p><a href="/secretariat/index.aspx" role="button" class="btn btn-outline-primary">More about the Secretariat</a></p>
						</div>
                    </div>

		</div>		
    </section>
	<section class="py-5">
		<div class="container" id="activities">
					<h2>Activities of the Steering Committee</h2>
                      <table class="table">
                          <tbody>
							  <tr>
								  <td class="text-nowrap">May-July 2020</td>
								  <td><strong>Executive Task Force Virtual Meetings</strong><br>
									  The GMI Steering Committee was scheduled to meet in person on 23 and 25 March 2020 during the Global Methane Forum 2020 in Geneva, Switzerland. 
									  Because the Forum was unfortunately postponed, a series of virtual sessions were held with an "Executive Task Force" to facilitate discussion and decision-making regarding the future of GMI, among other issues.
								  </td>
							  </tr>
							  <tr>
								  <td class="text-nowrap">18 - 19 November 2019</td>
								  <td><strong><a href="/events/details.aspx?eventid=540" target="_blank">GMI Steering Committee Meeting</a></strong><br>
									  Paris, France<br>
									  The 2-day meeting took place at the United Nations Environment Programme, UNESCO headquarters annex, hosted by the Climate and Clean Air Coalition (CCAC) Secretariat.
								  </td>
							  </tr>
                          </tbody>
                      </table>
					
		</div>
    </section>
	<section class="py-5 bg-white">
		<div class="container">
			<h2 id="resources">Resources</h2>
				  <p>For a complete list of available Steering Committee resources, please visit the resources page. The resources page includes white papers, meeting proceedings, technical documents, presentations, and other tools.</p>
				  <p><a href="/resources/index.aspx?sector=steering" role="button" class="btn btn-outline-primary">View all Steering Committee resources</a></p>
				  <div class="row py-2">
                        <div class="col-sm-2">
                            <img style="width:100%;border:1px solid #ccc;" src = "//globalmethane.org/images/doc_thumbs/termsofreference.png" />
						</div>
                        <div class="col-sm-10">
                            <div class="float-right"><i class="fa fa-file fa-2x"></i></div>
							<h4><a href="/terms/index.aspx">Terms of Reference for the Global Methane Initiative</a></h4>
							<p>Establishes the Terms of Reference for national government entities who participate in the Global Methane Initiative.</p>
						</div>
                    </div>

					<div class="row py-2">
                        <div class="col-sm-2">
                            <img style="width:100%;border:1px solid #ccc;" src = "//globalmethane.org/images/doc_thumbs/communique2018.png" />
						</div>
                        <div class="col-sm-10">
                            <div class="float-right"><i class="fa fa-file fa-2x"></i></div>
							<h4><a href='//globalmethane.org/gmf2018/pdf/GMF_Communique.pdf'>Global Methane Initiative Communique: Momentum on Methane (2018)</a></h4>
							<p>Recognizes the achievements of GMI Partners and confirms the GMI's commitment to incentivize scientific and technological innovations on monitoring, measuring and mitigating methane, as well as facilitating access to financing and investment resources. 
                            </p>
						</div>
                    </div>

					<div class="row py-2">
                        <div class="col-sm-2">
                            <img style="width:100%;border:1px solid #ccc;" src = "//globalmethane.org/images/doc_thumbs/JPEG/Steering_2016Feb24_Clearance_Draft_Communique_2-25-16.jpg" />
						</div>
                        <div class="col-sm-10">
                            <div class="float-right"><i class="fa fa-file fa-2x"></i></div>
							<h4><a href='//globalmethane.org/documents/Steering_2016Mar29_Partners-Communique_FINAL.pdf'>Global Methane Initiative Partners Communique (2016)</a></h4>
							<p>Distributed during the 2016 Global Methane Forum, the communiqué reaffirmed the Partners' commitment to the Initiative and announced the rechartering of GMI for the next five years to address methane.  
								The communique also described the formation of strategic alliances with CCAC and UNECE to expand international collaboration to reduce global methane emissions. 
                            </p>
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


            if ($('.Bslidediv').length > 0) {
                document.getElementById("defaultOpen").click();
            }else if($('.Cslidediv').length > 0) {
                document.getElementById("thirdOpen").click();
            }else if ($('.Ogslidediv').length > 0) {
                document.getElementById("secondOpen").click();
            } else if ($('.Mslidediv').length > 0) {
                document.getElementById("firstOpen").click();
            }


            if ($('.Bslidediv').length == 0) {
                document.getElementById("Bslider").innerHTML += ("<div class='SlideNone'>Do you have a story about how you are reducing methane emissions in the Biogas sector?  <a href='/challenge/submission'>Submit your story today</a> to the Global Methane Challenge.<br><br>For more information, visit the <a href='/challenge/redesign.html'>Global Methane Challenge</a> website.</div>");
            }
            if ($('.Cslidediv').length == 0) {
                document.getElementById("Cslider").innerHTML += ("<div class='SlideNone'>Do you have a story about how you are reducing methane emissions in the Coal Mines sector?  <a href='/challenge/submission'>Submit your story today</a> to the Global Methane Challenge.<br><br>For more information, visit the <a href='/challenge/redesign.html'>Global Methane Challenge</a> website.</div>");
            }
            if ($('.Ogslidediv').length == 0) {
                document.getElementById("Ogslider").innerHTML += ("<div class='SlideNone'>Do you have a story about how you are reducing methane emissions in the Oil & Gas sector?  <a href='/challenge/submission'>Submit your story today</a> to the Global Methane Challenge.<br><br>For more information, visit the <a href='/challenge/redesign.html'>Global Methane Challenge</a> website.</div>");
            }
            if ($('.Mslidediv').length == 0) {
                document.getElementById("Mslider").innerHTML += ("<div class='SlideNone'>Do you have a story about how you are reducing methane emissions for multiple sectors?  <a href='/challenge/submission'>Submit your story today</a> to the Global Methane Challenge.<br><br>For more information, visit the <a href='/challenge/redesign.html'>Global Methane Challenge</a> website.</div>");
            }
        </script>		
		
		
</body>

</html>