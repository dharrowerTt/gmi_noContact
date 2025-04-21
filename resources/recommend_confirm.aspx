<%@ Page Language="vb" ContentType="text/html" ResponseEncoding="UTF-8" CodeBehind="recommend_confirm.aspx.vb"
    AutoEventWireup="false" Inherits="M2M_Redesign.recommend_confirm" %>

<%@ Import Namespace="System.IO" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
    <title>Recommend a Resource | Global Methane Initiative</title>
    <!-- #include virtual="/includes/include_head.html" -->
</head>
<body>
<!-- #include virtual="/includes/header.html" -->
     <form id="recommendationform" runat="server">
    <div>
	<!-- Page Content -->
    <section class="py-5 gmi-light-blue">
        <div class="container">
            <div class="row">
                
                <div class="col-sm-8">
                    <p><a href="index.aspx">
                        <small class="text-muted text">
                            <i class="fa fa-arrow-left" aria-hidden="true"></i> 
                            Resources
                        </small>
                        </a></p>
                    <h1> Confirm Your Recommendation</h1>
        <p>
            Before you go, please confirm your submission.</div>
        </div>
    </section>
    <section class="py-5 bg-white">
		<div class="container">
        <asp:Panel ID="divverify" runat="server">
            <p>
                <strong>Thank you for completing the form to recommend a new resource. Click or tap the Confirm button at the bottom of this page if the information below is correct. If you want to make changes, use the browser back button to update the form.</strong></p>
           
            <h2>
                Your Information:</h2>
            <div style="width: 50%; float: left; min-height: 100px;">
                <p>
                    <label for="Name">
                        Name: </label>
                    <strong>
                        <asp:Label ID="Name" runat="server"></asp:Label></strong></p>
                
                <p>
                    <label for="organization">
                        Organization: </label>
                    <strong>
                        <asp:Label ID="organization" runat="server"></asp:Label></strong></p>
            </div>
            <div style="width: 50%; float: left; min-height: 100px;">
                <p>
                    <label for="Email">
                        Email Address: </label>
                   <strong>
                        <asp:Label ID="Email" runat="server"></asp:Label></strong></p>
                <p>
                    <label for="Telephone">
                        Phone Number: </label>
                     <strong>
                        <asp:Label ID="Telephone" runat="server"></asp:Label></strong></p>
            </div>
           
            <h2>
                Your Recommendation</h2>
            <p> <label for="Title">
                        Title: </label>
                <strong>
                   <asp:Label ID="title" runat="server"></asp:Label></strong></p>
            <p> <label for="Link">
                        Link: </label>
                <strong>
                    <asp:Label ID="link" runat="server"></asp:Label></strong></p>
            <p> <label for="Recommendation">
                        Recommendation: </label>
                <strong>
                    <asp:Label ID="recommendation" runat="server"></asp:Label></strong></p>
              <asp:Label runat="server" ID ="lblMemo" Visible="true"></asp:Label>
            <asp:Button ID="btnBack" runat="server" Text="Back" Visible="false" CssClass="btn btn-outline-danger"></asp:Button>
            <asp:Button ID="btnSubmit" runat="server" Text="Confirm"  CssClass="btn btn-primary"></asp:Button>
        </asp:Panel>
        <asp:Panel ID="diverror" runat="server" Visible="false">
            <h2>
                A problem occurred</h2>
            <p>
                Thank you for submitting your request. Unfortunately, an error occurred in saving your information. An administrator has been notified about the issue.
            </p>
            <p>
                For immediate assistance, please email <a href="mailto:secretariat@globalmethane.org&subject=Join the GMI Project Network">
                    secretariat@globalmethane.org</a>.</p>
            <p>
             </p>
        </asp:Panel>
       
        
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
		
	
				<!-- #include virtual="/includes/footer_scripts.aspx" -->
		
</body>

</html>
