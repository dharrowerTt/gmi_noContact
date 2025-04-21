<%@ Page Language="VB" AutoEventWireup="false" Inherits="M2M_Redesign.stage_events_details" Codebehind="stageEventDetails.aspx.vb" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Event Details | Global Methane Initiative</title>
     <!-- #include virtual="/includes/include_head.html" -->
</head>
<body>
    <!-- #include virtual="/includes/header.html" -->
    <form id="eventdetailsform" runat="server">
    <div>
	<!-- Page Content -->
    <section class="py-5 gmi-light-blue">
        <div class="container">

			<div class="row">
				<asp:PlaceHolder id="pheventhead" runat="server"></asp:PlaceHolder>
			</div>
		</div>
	</section>
	<section class="py-5 bg-white">
		<div class="container">
			<div class="row">
				<div class="col-sm-3">
					<table id="eventsummary" class="table table-sm">
						<tbody>
                         <asp:PlaceHolder ID="pheventsummary" runat="server"></asp:PlaceHolder>
                         <asp:PlaceHolder ID="phrelatedresources" runat="server"></asp:PlaceHolder>
						</tbody>
					</table>
				</div>
				<div class="col-sm-9">
                    <asp:PlaceHolder ID="pheventdetails" runat="server"></asp:PlaceHolder>
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

	
</body>

</html>