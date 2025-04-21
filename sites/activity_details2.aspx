<%@ Page Language="VB" AutoEventWireup="false" Inherits="M2M_Redesign.sites_activity_details2" Codebehind="activity_details2.aspx.vb" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Activity Details  |  Methane Sites and Activities  | Global Methane Initiative</title>
     <!-- #include virtual="/includes/include_head.html" -->
</head>
<body>
    <!-- #include virtual="/includes/header.html" -->
    <form id="form1" runat="server">
    <div>
	<!-- Page Content -->
    <section class="py-5 gmi-light-blue">
        <div class="container">

            <p><a href="index.aspx">
                <small class="text-muted text">
                    <i class="fa fa-arrow-left" aria-hidden="true"></i> 
                    Map of Methane Sites
                </small>
                </a></p>
                    <h1>
                        La Duquesa Landfill 
                    </h1>
			
			<div class="row">
				<div class="col-sm-6">
					<p><strong>Site Profile</strong></p>
					<table id="sitesummary" class="table table-sm">
						<tbody>
                          <tr>
                              <th class="text-right">Sector:</th>
                              <td>Biogas; MSW</td>
                          </tr>
                          <tr>
                              <th class="text-right">Type:</th>
                              <td>Landfill</td>
                          </tr>
                          <tr>
                              <th class="text-right">Location:</th>
                              <td>Santo Domingo, Dominican Republic</td>
                          </tr>
                          <tr>
                              <th class="text-right">GMI Site?</th>
                              <td>No</td>
                          </tr>
                          <tr>
                              <th class="text-right">&nbsp;</th>
                              <td><a href="details.aspx" role="button" class="btn btn-primary">View Site Details <i class="fa fa-arrow-circle-down"></i></a></td>
                          </tr>
						</tbody>
					</table>
					
				</div>
				<div class="col-sm-6">
					<p><strong>Site Activities</strong></p>
					<table id="listofactivities" class="table table-sm">
						<thead>
							<tr>
								<th>Type</th>
								<th>Name</th>
								<th>&nbsp;</th>
							</tr>
						</thead>
						<tbody>
                          <tr>
                              <td>Project</td>
                              <td>LF DO La Duquesa Landfill CDM Project #1</td>
							  <td><a href="activity_details2.aspx" role="button" class="btn btn-primary">Details <i class="fa fa-arrow-circle-down"></i></a></td>
                          </tr>
                          <tr>
                              <td>Project</td>
                              <td>LF DO La Duquesa Landfill CDM Project #2</td>
							  <td><a href="activity_details.aspx" role="button" class="btn btn-primary">Details <i class="fa fa-arrow-circle-down"></i></a></td>
                          </tr>
						</tbody>
					</table>
					
				</div>
			</div>
                    
		</div>
	</section>
	<section class="py-2 border-top border-primary">
		<div class="container">
			<h2 class="text-center">Details: LF DO La Duquesa Landfill CDM Project #1</h2>
		</div>
	</section>
	<section class="py-5 bg-white">
		<div class="container">
			<h3 class="py-3">General Activity Infomation</h3>
					<table id="detail1" class="table">
						<tbody>
                          <tr>
                              <td class="gmi-light-blue-cell text-right w-25">Sectors:</td>
                              <td>MSW</td>
                          </tr>
                          <tr>
                              <td class="gmi-light-blue-cell text-right w-25">Activity Type:</td>
                              <td>Project</td>
                          </tr>
                          <tr>
                              <td class="gmi-light-blue-cell text-right w-25">Status:</td>
                              <td>On-Going</td>
                          </tr>
                          <tr>
                              <td class="gmi-light-blue-cell text-right w-25">GMI funded:</td>
                              <td>No</td>
                          </tr>
                          <tr>
                              <td class="gmi-light-blue-cell text-right w-25">Description:</td>
                              <td>&nbsp;</td>
                          </tr>
                          <tr>
                              <td class="gmi-light-blue-cell text-right w-25">Activity Year(s):</td>
                              <td>2008-</td>
                          </tr>
                          <tr>
                              <td class="gmi-light-blue-cell text-right w-25">Project Lifetime:</td>
                              <td>&nbsp;</td>
                          </tr>
                          <tr>
                              <td class="gmi-light-blue-cell text-right w-25">Project End Use Type:</td>
                              <td>Open Flare</td>
                          </tr>
						</tbody>
					</table>

			
		</div>
	</section>

	
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

	
    <script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0/dist/Chart.min.js" type="text/javascript"></script>
	<script>
		new Chart(document.getElementById('wasteData'), {
				type: 'pie', 
				data: {
					labels: ['Food Waste', 'Wood Waste', 'Paper/Textile Waste', 'Unknown' ], 
					datasets: [{ 
						data: [46.6, 2.4, 22, 29], 
						label: 'Waste Characteristics (Percentage, of weight)', 
						fill: true, 
						borderColor: '#ffffff',
						backgroundColor: [ 'rgba( 48,145,192,1)',  'rgba( 81,166,207,1)',  'rgba( 14,126,180,1)',  'rgba( 48,145,192,.5)']
					}]
				},
				options: {title: {display:true, text: 'Waste Characteristics (Percentage, of weight)'} }
		});
	</script>

</body>

</html>