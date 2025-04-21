<%@ Page Language="vb" ContentType="text/html" ResponseEncoding="UTF-8" CodeBehind="contact_us_complete.aspx.vb" AutoEventWireup="false" Inherits="M2M_Redesign.contact_us_complete" %>

<% @ Import Namespace="System.IO" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head runat="server">
        <title>Contact Us | Global Methane Initiative</title>
     <!-- #include virtual="/includes/include_head.html" -->
</head>
<body>
    <!-- #include virtual="/includes/header.html" -->

	    <form id="contact_us_form" runat="server">
	 <section class="py-5 gmi-light-blue">
        <div class="container">
            <div class="row">
               
                <div class="col-sm-8">
                    <p><a href="/index.aspx">
                        <small class="text-muted text">
                            <i class="fa fa-arrow-left" aria-hidden="true"></i> 
                            Home
                        </small>
                        </a></p>
                    <h3>Contact Us</h3>
                    <h1>Thank You for Your Interest in GMI</h1>
     </div>
                </div>
            </div>
    </section>

	<section class="py-5 bg-white">
		<div class="container">
        
      

<asp:Panel ID="divsuccess" runat="server" Visible="true">
 
<p>Your submission has been saved. A member of the GMI team will respond to your submission as soon as possible. </p>
        </asp:Panel>

      	
        <asp:Panel ID="diverror" runat="server" Visible="false">
        <h2>A problem occurred</h2>
<p>Thank you for your request. Unfortuately, a problem occurred in saving your information. An administrator has been notified about the issue.


Please email              
<a href="mailto:secretariat@globalmethane.org&subject=Contact Us">secretariat@globalmethane.org</a> with immediate questions or concerns.</p>


        </asp:Panel><br /><br /><br />
        </div>
    	
	    
       
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
