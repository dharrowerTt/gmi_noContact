<%@ Page Language="vb" ContentType="text/html" ResponseEncoding="UTF-8" CodeBehind="contact_us_confirm.aspx.vb"
    AutoEventWireup="false" Inherits="M2M_Redesign.contact_us_confirm" %>

<%@ Import Namespace="System.IO" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
    <title>Contact Us | Global Methane Initiative</title>
    <!-- #include virtual="/includes/include_head.html" -->
</head>
<body>
<!-- #include virtual="/includes/header.html" -->
     <form id="form1" runat="server">
    <div>
	<!-- Page Content -->
    <section class="py-5 gmi-light-blue">
        <div class="container">
            <div class="row">
              
                <div class="col-sm-8">
                    <p><a href="index.aspx">
                        <small class="text-muted text">
                            <i class="fa fa-arrow-left" aria-hidden="true"></i> 
                            Contact Us
                        </small>
                        </a></p>
                    <h1> Submit Your Request</h1>
        <p>
            Before you go, please confirm your submission.</div>
        </div>
    </section>
    <section class="py-5 bg-white">
		<div class="container">
        <asp:Panel ID="divverify" runat="server">
            <p>
                <strong>Thank you for completing the contact us form. Click or tap the Confirm button at the bottom of this page if the information below is correct. If you want to make changes, use the browser back button to update the form.</strong></p>
           
            <h2>
                Contact Information:</h2>
            <div style="width: 50%; float: left; min-height: 100px;">
                <p>
                    <label for="Name">
                        Name:</label>
                    <strong>
                        <asp:Label ID="Name" runat="server"></asp:Label></strong></p>
                
                <p>
                    <label for="organization">
                        Organization:</label>
                    <strong>
                        <asp:Label ID="organization" runat="server"></asp:Label></strong></p>
            </div>
            <div style="width: 50%; float: left; min-height: 100px;">
                <p>
                    <label for="Email">
                        Email Address:</label>
                     <strong>
                        <asp:Label ID="Email" runat="server"></asp:Label></strong></p>
                <p>
                    <label for="Telephone">
                        Phone Number:</label>
                     <strong>
                        <asp:Label ID="Telephone" runat="server"></asp:Label></strong></p>
            </div>
            <h2 class="clear">
                    Areas of Interest:</h2>
            <div style="width: 50%; float: left; min-height: 170px; ">
               
                <p>
                    
                    <asp:Image ID="aoi_biogas" runat="server" ImageUrl="/assets/images/Uncheckedbox_trans.gif">
                    </asp:Image>Biogas</p>
                <p>
                    
                    &nbsp;&nbsp;&nbsp; <asp:Image ID="aoi_agriculture" runat="server" ImageUrl="/assets/images/Uncheckedbox_trans.gif">
                    </asp:Image>Agriculture</p>
                <p>
                         
                    &nbsp;&nbsp;&nbsp; <asp:Image ID="aoi_landfill" runat="server" ImageUrl="/assets/images/Uncheckedbox_trans.gif">
                    </asp:Image>
                    Municipal Solid Waste
                </p>
                <p>
                        
                    &nbsp;&nbsp;&nbsp; <asp:Image ID="aoi_wastewater" runat="server" ImageUrl="/assets/images/Uncheckedbox_trans.gif">
                    </asp:Image>
                    Municipal Wastewater
                </p>
                    
                
            </div>
            <div style="width: 50%; float: left; min-height: 170px; ">
                <p>
                         
                    <asp:Image ID="aoi_coal" runat="server" ImageUrl="/assets/images/Uncheckedbox_trans.gif">
                    </asp:Image>
                    Coal Mines</p>
                
                <p><asp:Image ID="aoi_oilNgas" runat="server" ImageUrl="/assets/images/Uncheckedbox_trans.gif">
                    
                    </asp:Image>
                    Oil and Gas
                </p>
                
                <p>
                         
                    <asp:Image ID="aoi_other" runat="server" ImageUrl="/assets/images/Uncheckedbox_trans.gif">
                    </asp:Image>
                    Other:
                    <asp:Label ID="aoiDesc" runat="server" Width="312px"></asp:Label></p>
            </div>
            <asp:Label ID="txtbiogas" runat="server" Visible="false"></asp:Label>
            <asp:Label ID="txtag" runat="server" Visible="false"></asp:Label>
            <asp:Label ID="txtmsw" runat="server" Visible="false"></asp:Label>
            <asp:Label ID="txtww" runat="server" Visible="false"></asp:Label>
            <asp:Label ID="txtcoal" runat="server" Visible="false"></asp:Label>
            <asp:Label ID="txtoil" runat="server" Visible="false"></asp:Label>
            <asp:Label ID="txtoth" runat="server" Visible="false"></asp:Label>
            <h2>
                Your Comments</h2>
            <p>
                <strong>
                    <asp:Label ID="expertise" runat="server"></asp:Label></strong></p>
            
            <asp:Button ID="btnBack" runat="server" Text="Back" Visible="false" CssClass="btn btn-outline-danger"></asp:Button>
            <asp:Button ID="btnSubmit" runat="server" Text="Confirm"  CssClass="btn btn-primary"></asp:Button>
        </asp:Panel>
        <asp:Panel ID="diverror" runat="server" Visible="false">
            <h2>
                A problem occurred</h2>
            <p>
                Thank you for trying to submit the Contact Us form. Unfortunately, an error occurred while saving your information. An administrator has been notified about the issue. 
            </p>
            <p>
                For immediate assistance, please email <a href="mailto:secretariat@globalmethane.org&subject=Contact Us">
                    secretariat@globalmethane.org</a>.</p>
            <p>
                &nbsp;</p>
        </asp:Panel>
       
        
 </div>
	</section>
	<asp:Label runat="server" ID ="lblMemo" Visible="false"></asp:Label>
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
