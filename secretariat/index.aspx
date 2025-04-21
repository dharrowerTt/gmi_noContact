<%@ Page Language="VB" AutoEventWireup="false" Inherits="M2M_Redesign.secretariat_index" Codebehind="index.aspx.vb" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Secretariat | Global Methane Initiative</title>
     <!-- #include virtual="/includes/include_head.html" -->
</head>
<body>
    <!-- #include virtual="/includes/header.html" -->
    <form id="secretariat_index_form" runat="server">
    <div>
	<!-- Page Content -->
    <section class="py-5 gmi-light-blue">
        <div class="container">
                    <h1>
						Secretariat
					</h1>
                      <p>The Secretariat (formerly referred to as the Administrative Support Group), currently hosted by the U.S. Environmental Protection Agency, serves as the principal Initiative coordinator and provides the following support:</p>
                      <ul>
						  <li>Organizes GMI meetings and events</li>
                          <li>Facilitates communication among the Subcommittees and the Project Network</li>
                          <li>Develops general outreach materials and maintains the GMI website</li>
                          <li>Acts as an information clearinghouse</li>
                          <li>Processes membership requests</li>
                      </ul>
                      <p>The Secretariat reports directly to the <a href="/steering/index.aspx">Steering Committee</a> and coordinates with the technical subcommittees to assist with their needs.</p>

		</div>
	</section>
    <section class="py-5 bg-white">
        <div class="container">
                    <h2>Questions?</h2>
                    <p><strong>If you have a question about GMI or this website please contact us at:</strong></p>
						<p><strong>Monica Shimamura</strong><br>
							Director, GMI Secretariat<br>
							Hosted by the U.S. Environmental Protection Agency<br>
		                    Phone: +1.202.343.9683<br />
		                    Fax: +1.202.343.2202<br />
		                    E-mail: <a href="mailto:secretariat@globalmethane.org">secretariat@globalmethane.org</a></p>
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