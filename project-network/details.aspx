<%@ Page Language="VB" AutoEventWireup="false" Inherits="M2M_Redesign.project_network_details" Codebehind="details.aspx.vb" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Member Details | Project Network | Global Methane Initiative</title>
     <!-- #include virtual="/includes/include_head.html" -->
</head>
<body>
    <!-- #include virtual="/includes/header.html" -->
    <form id="pn_details" runat="server">
    <div>
	<!-- Page Content -->
    <section class="py-5 gmi-light-blue">
        <div class="container">
            <div class="row">
                <div class="col-sm-4 text-center">
					<img class="logoimg" src="/assets/images/gmipn2.svg" style="min-width:150px;max-width:250px;width:95%;margin-bottom:25px;">
				</div>
                <div class="col-sm-8">
                    <p><a href="member_list.aspx">
                        <small class="text-muted text">
                            <i class="fa fa-arrow-left" aria-hidden="true"></i> 
                            Project Network Members
                        </small>
                        </a></p>
                    <h1>
                        <asp:Literal ID="name" runat="server"></asp:Literal>
                    </h1>
					<p>To add a new contact for your organization or to update any of the information on this page, send an email to <a href="mailto:secretariat@globalmethane.org&subject=GMI Project Network Profile for Tetra Tech, Inc.">secretariat@globalmethane.org</a> with the name of your organization in the subject line.  Please identify in the email any information that should be updated.</p>
                </div>
            </div>
        </div>
    </section>

	<section class="py-5 bg-white">
		<div class="container">
            <div id="NewAlert"></div>
				<h2>Partner Profile</h2>
  				<table id="pnmdetails" class="table">
                     
						<tbody>
                          <tr>
                              <td class="gmi-light-blue-cell text-right w-25">Type of Organization:</td>
                              <%--<td>Contractor</td>--%>
                              <asp:Literal ID="orgType" runat="server"></asp:Literal>
                          </tr>
                          <tr>
                              <td class="gmi-light-blue-cell text-right w-25">Description of Services:</td>
                              <%--<td>Tetra Tech offers professional services for waste-to-energy project from concept through construction to operations. We conduct Conceptual Project Studies, Feasibility Studies, Economic Analysis, Engineering Analysis and Planning, Detailed Process and Design Engineering, Permitting Assistance, Design Build, and Construction Management Services. We work closely with the client throughout the project life cycle and provide the sensible and concise information necessary to make critical decisions. With over 1,300 employees and 300 offices nationwide and internationally, we have a full staff of engineers and scientists to meet the needs of our clients. We pride ourselves on utilizing veteran leadership and field teams to provide bioenergy services both locally and nationally.</td>--%>
                               <asp:Literal ID="expertise" runat="server"></asp:Literal>
                          </tr>
                          <tr>
                              <td class="gmi-light-blue-cell text-right w-25">Sector(s) of Interest:</td>
                              <%--<td>Agriculture; Coal Mines; MSW; Oil & Gas; Wastewater; Other; Biogas; All GMI Topics</td>--%>
                              <asp:Literal ID="AOI" runat="server"></asp:Literal>
                          </tr>
                          <tr>
                              <td class="gmi-light-blue-cell text-right w-25">Area(s) of Geographic Interest:</td>
                              <%--<td>Partnership-wide</td>--%>
                              <asp:Literal ID="AOGI" runat="server"></asp:Literal>
                          </tr>
                          <tr>
                              <td class="gmi-light-blue-cell text-right w-25">Web Site:</td>
                               <asp:Literal ID="website" runat="server"></asp:Literal>
                              <%--<td><a href='http://www.tetratech.com'>http://www.tetratech.com</a></td>--%>
                          </tr>
                          <tr>
                              <td class="gmi-light-blue-cell text-right w-25">Contacts:</td>
                              <td>
                               <asp:Literal ID="lblContacts" runat="server"></asp:Literal>
                                  </td>
                             <%-- <td>
							  	Franco, Miguel<br />Email: miguel.franco@tetratech.com<br />Phone: (703) 387-2117<br /><br />Harrower, Dougie<br />Email: dougie.harrower@tetratech.com<br />Phone: (703) 885-5473<br /><br />Jenkins, Kristen<br />Email: kristen.jenkins@tetratech.com<br />Phone: <br /><br />McGirl, Cathy<br />Email: cathy.mcgirl@tetratech.com<br />Phone: (703) 885-5510<br /><br />Oven, Mark<br />Email: mark.oven@tetratech.com<br />Phone: (703) 387-2138
							  </td>--%>
                          </tr>
						</tbody>
					</table>

		</div>
	</section>
			
			
			
			
			



		
		
	<button onclick="topFunction()" class="btn btn-dark btn-sm" id="btnToTop" title="Go to top"><i class="fa fa-chevron-up" aria-hidden="true"></i> Top</button>
		
	</form>
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