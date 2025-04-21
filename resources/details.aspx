<%@ Page Language="VB" AutoEventWireup="false" Inherits="M2M_Redesign.resources_details" Codebehind="details.aspx.vb" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Resource Details | Global Methane Initiative</title>
     <!-- #include virtual="/includes/include_head.html" -->
</head>
<body>
    <!-- #include virtual="/includes/header.html" -->
    <form id="resource_details_form" runat="server">
    <div>
	<!-- Page Content -->
    <section class="py-5 gmi-light-blue">
        <div class="container">

			<div class="row">
				<div class="col-sm-3">
                    <asp:Literal ID="LitResourceFeatureImage" runat="server" />
                    <p><a href="index.aspx">
                <small class="text-muted text">
                    <i class="fa fa-arrow-left" aria-hidden="true"></i> 
                    List of Resources
                </small>
                </a></p>
				</div>
				<div class="col-sm-9">
                     
                    <h1>
                        <asp:Literal ID="LitResourceName" runat="server" />
                    </h1>
                    <asp:Literal ID="LitResourceLink" runat="server" />
                </div>
    
                </div>
            <div class="row">
                    <div class="col-sm-12">
					<div class="videowrapper" id="videowrapper" runat="server">
                    <div id="videoWrp" runat="server">
        <iframe runat="server" id="resourceFileFrame" width = '100%' frameborder='0' visible="false" >

                              </iframe>
        
        
  
<asp:Placeholder id="videoPlaceholder" runat="server"></asp:Placeholder>
                
					
                    </div>
                </div>
                    
                   
				</div>
                
                
			</div>
		</div>
	</section>

	<section class="py-5 bg-white">
		<div class="container">
			<div class="row">
				<div class="col-md-3">
					<table id="resourcesummary" class="table table-sm">
						<tbody>
                            <asp:Placeholder id="phresourceDetails" runat="server"></asp:Placeholder>
						</tbody>
					</table>
                    <hr />
                                  <asp:Placeholder id="rightSidebar" runat="server"></asp:Placeholder>
				</div>
				<div class="col-md-9">                    
                    <asp:Placeholder id="phresourceDescription" runat="server"></asp:Placeholder>
                    <asp:Literal ID="litResourceOptionNumber" runat="server" visible="false"/>
                    <div style="margin-top:40px; width:100%;"/>&nbsp;</div>
                     <asp:Placeholder ID="phEventList" runat="server" />
                 <div style="margin-top:40px; width:100%;">&nbsp;</div>
                    <asp:Placeholder id="phRelatedResources" runat="server"></asp:Placeholder>
				</div>


                
			</div>
            <div class="row">
                <div class="col-sm-3">

                </div>
                <div class="col-sm-9">
     
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