<%@ Page Language="VB" AutoEventWireup="false" Inherits="M2M_Redesign.recommend" Codebehind="recommend.aspx.vb" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Recommend a Resource | Global Methane Initiative</title>
     <!-- #include virtual="/includes/include_head.html" -->
</head>
<body>
    <!-- #include virtual="/includes/header.html" -->
    <form id="recommend_index_form" runat="server">
    <div>
	<!-- Page Content -->


	<section class="py-5 gmi-light-blue">
        <div class="container">
			<h1>Recommend a Resource</h1>
                    <p>GMI invites you to recommend a new resource to be included in our library.  Use the form below to submit a recommendation for resources that address issues applicable to GMI, such as:</p>
                    <ul>
                        <li>Reports, publications, presentations, and videoa about methane mitigation strategies or policies</li>
                        <li>Country- or region-specific accomplishments related to methane mitigation</li>
                        <li>Methane mitigation studies and data</li>
                        <li>Tools that can be used to advance methane projects, including assessments, calculators, models, case studies, and best practice guidance</li>
                        <li>Training resources such as classroom materials, online courses, or tutorials</li>
                        <li>Resources in multiple languages</li>
                    </ul>
                    <p>Recommendations will be reviewed by the GMI Secretariat. If your recommendation is accepted, the Secretariat will follow up to obtain additional details.</p>
					<p><strong>Thank you for your recommendations.</strong></p>
            <asp:Label ID="lblTopErrorMsg" runat="server" Height="8px" Visible="False"  ForeColor="Red">Some of the information entered was not quite right. Please take a look below at the required fields.</asp:Label>
		</div>
	</section>
	<section class="py-5 bg-white">
		<div class="container">
			<h2>Your Information:</h2>
            
           <p> <label for="name">
                                 Name:
                                <span class="required">*</span>
                            </label></p>
                           <p> <asp:TextBox ID="name" runat="server" MaxLength="80" CssClass="textfield" style="width: 100%;">
                            </asp:TextBox></p>
             <asp:Label ID="lblErrorName" runat="server" Width="150px" Height="8px" Visible="False" BackColor="White" ForeColor="Red">* Required</asp:Label><br />
             <p><label for="organization">
                                Organization:
                                <span class="required">*</span>
                            </label></p>
                            <p><asp:TextBox ID="organization" runat="server" MaxLength="100" CssClass="textfield" style="width: 100%;">
                            </asp:TextBox></p>
                            <p><asp:Label ID="lblErrororganization" runat="server" style="width: 150px; height: 8px;" Visible="False" BackColor="White"
                                ForeColor="Red">* Required</asp:Label></p>
             <p><label for="email">
                                Email:
                                <span class="required">*</span>
                            </label></p>
                             <p><asp:TextBox ID="email" runat="server" MaxLength="50" CssClass="textfield" style="width: 100%;">
                            </asp:TextBox></p>
                            <asp:Label ID="lblErrorEmail" runat="server" style="width: 150px; height: 8px;" Visible="False" BackColor="White" ForeColor="Red">* Required</asp:Label>
            <p><label for="telephone">
                                        Telephone:
                                        
                                    </label></p>
                                  <p> <asp:TextBox ID="telephone" runat="server" MaxLength="20" CssClass="textfield" style="width: 100%;">
                            </asp:TextBox></p>
                               

		</div>
	</section>
	<section class="py-5">
		<div class="container">
			<h2>Recommend a Resource</h2>
             <p><label for="title">
                                Title:
                                <span class="required">*</span>
                            </label></p>
                            <p><asp:TextBox ID="title" runat="server" MaxLength="100" CssClass="textfield" style="width: 100%;">
                            </asp:TextBox></p>
                            <asp:Label ID="lblErrorTitle" runat="server" style="width: 150px; height: 8px;" Visible="False" 
                                ForeColor="Red">* Required</asp:Label>
             <p><label for="link">
                                Link:
                                <span class="required">*</span>
                            </label></p>
            <p>Provide a web link for the resource, if available. If not available online, the Secretariat will coordinate with you to obtain any approved resources.</p>
            <p>                <asp:TextBox ID="link" runat="server" MaxLength="100" CssClass="textfield" style="width: 100%;">
                            </asp:TextBox></p>
                            <asp:Label ID="lblErrorLink" runat="server" style="width: 150px; height: 8px;" Visible="False" 
                                ForeColor="Red">* Required</asp:Label>

	 <p><label for="recommendation">
                                Recommendation:
                                <span class="required">*</span>
                            </label></p>
            <p>Provide a description of the resource.</p>
           <asp:Label ID="lblErrorRecommendation" runat="server" ForeColor="Red"  Visible="False" Height="8px" Width="380px"></asp:Label>
                        <textarea id="recommendation" name="recommendation" style="width: 95%; height: 80px;" runat="server"></textarea>
                    <p class="text-center">
                         <asp:Literal ID="diverror2" runat="server"></asp:Literal>
                         <asp:LinkButton ID="btnSubmit" runat="server" cssClass="btn btn-primary">Submit</asp:LinkButton>
                        <asp:LinkButton ID="btnReset" cssClass="btn btn-danger" OnClientClick="return confirm('Are you sure you want to reset the form? All information will be deleted.');" runat="server">Reset
                        </asp:LinkButton>
                    </p>
			<asp:Label ID="lblMemo" runat="server" ForeColor="Red" BackColor="White" Visible="False" Height="8px" Width="380px"></asp:Label>
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