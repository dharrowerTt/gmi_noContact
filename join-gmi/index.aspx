<%@ Page Language="VB" AutoEventWireup="false" Inherits="M2M_Redesign.join_gmi_index" Codebehind="index.aspx.vb" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Join GMI | Global Methane Initiative</title>
     <!-- #include virtual="/includes/include_head.html" -->
</head>
<body>
    <!-- #include virtual="/includes/header.html" -->
    <form id="join_gmi_index_form" runat="server">
    <div>
	<!-- Page Content -->
    <section class="py-5 gmi-light-blue">
        <div class="container">
			<h1>Join GMI</h1>
            <p>Partner Countries and Project Network members work collaboratively to facilitate methane abatement, recovery, and use projects internationally. The Global Methane Initiative (GMI) encourages interested parties to join.</p>
			<div class="row">
				<div class="col-sm-6">
					<h2><small class="text-muted">Become a Partner Country</small></h2>
					<p>National governments can become Partners by following the steps below <a href="#submit-letter"><i class="fa fa-angle-double-down"></i></a> agreed to by the Steering Committee. Interested governments may request to join the Global Methane Initiative at any time.</p>
				</div>
				<div class="col-sm-6">
					<h2><small class="text-muted">Join the Project Network</small></h2>
					<p>Other organizations including development banks, private-sector entities, and other governmental and non-governmental organizations can participate in GMI by joining the <a href="/project-network/index.aspx">Project Network</a>.</p>
				</div>
			</div>
		</div>
	</section>
	<section class="py-5 bg-white">
		<div class="container">

            <h2 id="submit-letter">Submit a Letter of Interest</h2>
				<p>To join, the lead ministry or agency should submit an e-mail of interest to the <a href="/secretariat/index.aspx">Secretariat</a>. At a minimum, the letter should include the following information:</p>
				<ul>
					<li>Primary contact's name, e-mail, and telephone and fax numbers.</li>
					<li>Reason for interest and the subcommittee(s) on which you plan to participate.</li>
					<li>A short description of the opportunities for methane projects and/or the type of expertise that your country can contribute.</li>
					<li>If appropriate, your interest and rationale for becoming a member of the Steering Committee.</li>
				</ul>
                <p>Countries may use this <a href="/documents/participate_letter_template.doc">suggested letter format</a> to assist in drafting their letter to the Secretariat.</p> 
				<p>The Secretariat will circulate this letter to the members of the Initiative's Steering Committee for review. If no objections are received within 60 days, the application is automatically accepted. If there are objections, these will be resolved at the next scheduled meeting of the Steering Committee.</p> 
		</div>
	</section>
	<section class="py-5">
		<div class="container">
			<h2>Formalize Membership</h2>	
                <p>Upon completion of Steering Committee approval, new Partners formalize their membership by signing and returning the <a href="/terms/index.aspx">Terms of Reference</a>. The new Partner will then appoint representatives to technical subcommittees. Partners may appoint up to three representatives to subcommittees for which they have expertise or an interest in pursuing projects. The new Partner will also identify an "Administrative Liaison" to act as the central contact point for all Global Methane Initiative issues.</p> 
				<p>If a country has requested to join the Steering Committee, the Steering Committee will make a decision on this request at its next scheduled meeting.</p>
		</div>
	</section>
	<section class="py-5 bg-white">
		<div class="container">
			<h3>More Information</h3>	
            <p>For more information about joining the GMI, please contact the <a href="/secretariat/index.aspx">Secretariat.</a></p> 

			
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
	
</body>

</html>