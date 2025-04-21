<%@ Page Language="VB" AutoEventWireup="false" Inherits="M2M_Redesign.contact_us_form" Codebehind="index.aspx.vb" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Contact Us | Global Methane Initiative</title>
     <!-- #include virtual="/includes/include_head.html" -->
</head>
<body>
    <!-- #include virtual="/includes/header.html" -->
    <form id="pn_index_form" runat="server">
    <div>
	<!-- Page Content -->
<section class="py-5 gmi-light-blue">
        <div class="container">
			<h1>Contact Us</h1>
            <p>This contact form has been temporarily disabled. Updated contact details will be provided soon. Thank you for your interest in the Global Methane Initiative.</p>
            

		</div>
	</section>
        <!--
	<section class="py-5 bg-white">
		<div class="container">
            <asp:Label ID="lblTopErrorMsg" runat="server" ForeColor="Red" BackColor="White" Visible="False" Height="8px" Width="280px">* Required</asp:Label>
			<h2>Your Information:</h2>
            
            <p><label for="name">
                                 Name:
                                <span class="required">*</span>
                            </label></p>
                            <p> <asp:TextBox ID="name" runat="server" MaxLength="80" CssClass="textfield" style="width: 100%;">
                            </asp:TextBox>
             <asp:Label ID="lblErrorOrg" runat="server" Width="150px" Height="8px" Visible="False" BackColor="White" ForeColor="Red">* Required</asp:Label></p>
            <p><label for="organization">
                                Organization:
                                <span class="required">*</span>
                            </label></p> 
                           <p> <asp:TextBox ID="organization" runat="server" MaxLength="100" CssClass="textfield" style="width: 100%;">
                            </asp:TextBox>
                            <asp:Label ID="lblErrororganization" runat="server" style="width: 150px; height: 8px;" Visible="False" BackColor="White"
                                ForeColor="Red">* Required</asp:Label></p>
             <p><label for="email">
                                Email:
                                <span class="required">*</span>
                            </label></p>
<p>                             <asp:TextBox ID="email" runat="server" MaxLength="50" CssClass="textfield" style="width: 100%;">
                            </asp:TextBox>
                            <asp:Label ID="lblErrorEmail" runat="server" style="width: 150px; height: 8px;" Visible="False" BackColor="White" ForeColor="Red">* Required</asp:Label></p>
<p>            <label for="telephone">
                                        Telephone:
                                        <span class="required">*</span>
                                    </label></p>
                                   <p><asp:TextBox ID="telephone" runat="server" MaxLength="20" CssClass="textfield" style="width: 100%;">
                            </asp:TextBox>
                            <asp:Label ID="lblErrorTelephone" runat="server" style="width: 150px; height: 8px;" Visible="False" BackColor="White" ForeColor="Red">* Required</asp:Label></p>
                               

		</div>
	</section>
	<section class="py-5">
		<div class="container">
			<h2>Area of Interest:</h2>
            <p>
                                Please select sector(s) of interest. 
                                <span class="required">*</span>
                                <br><small>(Select all that apply)</small>
			<div class="row">
				<div class="col-sm-3">
					
                            
                                

                                <p>
                                    <asp:CheckBox ID="aoi_biogas" value="ag" runat="server">
                                </asp:CheckBox>
                                    Biogas</p>
                                <p>
                                    &nbsp;&nbsp;&nbsp; <asp:CheckBox ID="aoi_agriculture" value="ag" runat="server">
                                </asp:CheckBox>
                                    Agriculture</p>
                                <p>
                                    &nbsp;&nbsp;&nbsp; <asp:CheckBox ID="aoi_landfill" value="land" runat="server">
                                </asp:CheckBox>
                                    Municipal Solid Waste</p>
                                <p>
                                    &nbsp;&nbsp;&nbsp; <asp:CheckBox ID="aoi_wastewater" value="ww" runat="server">
                                </asp:CheckBox>
                                    Municipal Wastewater</p>
                                </div>
                <div class="col-sm-3">
                                <p>
                                    <asp:CheckBox ID="aoi_coal" value="coal" runat="server">
                                </asp:CheckBox>
                                    Coal Mines</p>
                     </div>
                <div class="col-sm-3">
                                <p>
                                      <asp:CheckBox ID="aoi_oilngas" value="ong" runat="server">
                                </asp:CheckBox>
                                    Oil and Gas Systems</p>
                     </div>
                <div class="col-sm-3">
                                <p>
                                     <asp:CheckBox ID="aoi_other" value="other" runat="server">
                                </asp:CheckBox>
                                    Other:
                                     <asp:TextBox ID="aoiDesc" runat="server" Width="184px" MaxLength="100">
                                </asp:TextBox>
                                    

                                </p>

		</div>
	</section>
	<section class="py-5 bg-white">
		<div class="container">
			<h2>Your Comments:</h2>
           <asp:Label ID="lblErrorExpertise" runat="server" ForeColor="Red" BackColor="White" Visible="False" Height="8px" Width="380px"></asp:Label>
                        <textarea id="expertise" name="expertise" style="width: 95%; height: 80px;" runat="server"></textarea>
                    <p class="text-center">
                         <asp:Literal ID="diverror2" runat="server"></asp:Literal>
                         <asp:LinkButton ID="btnSubmit" runat="server" cssClass="btn btn-primary">Submit</asp:LinkButton>
                        <asp:LinkButton ID="btnReset" cssClass="btn btn-danger" OnClientClick="return confirm('Are you sure you want to reset the form? All information will be deleted.');" runat="server">Reset
                        </asp:LinkButton>
                    </p>
			
		</div>
	</section> -->

                   
<br>
<br>
<br>

		
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