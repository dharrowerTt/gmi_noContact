<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="methane-emissions-data.aspx.vb" Inherits="M2M_Redesign.methane_emissions_data" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Global Methane Initiative</title>

     <!-- #include virtual="/includes/include_head.html" -->

    <style>
        .gmi-light-orange{
            display:none;
        }
    </style>
</head>
<body>
    <!-- #include virtual="/includes/header.html" -->
    
    <!-- Page Content -->
    <section class="py-5 gmi-light-blue">
        <div class="container">
			<div class="row">
				<div class="col-sm-8">
                    <h1>
						Methane Emissions Data
					</h1>
                    <p>
						Use the tool below to explore methane emissions measurements and projections throughout the world.  Visualizations reflect the industry sectors supported by GMI:  biogas, coal mines, and oil & gas.
					</p>
					<p>These data were extracted from the U.S. Environmental Protection Agency (U.S. EPA) report, <em><a href="https://www.epa.gov/global-mitigation-non-co2-greenhouse-gases">Global Non-CO<sub>2</sub> Greenhouse Gas Emission Projections & Mitigation Potential: 2015-2050</a></em>. Additional data are available from the U.S EPA’s <a href="https://cfpub.epa.gov/ghgdata/nonco2/">Non-CO<sub>2</sub> Greenhouse Gas Data Tool</a>.</p>
					
				</div>
				<div class="col-sm-4">
					<div class="border border-secondary bg-white px-0">
						<div class="py-1 text-center bg-dark text-white"><strong>Help and Data</strong></div>
                                <ul class="list-group py-2">
                                    <li class="list-group-item noborder nobackground py-1"><a href="#help">Using this tool</a></li>
                                    <li class="list-group-item noborder nobackground py-1"><a href="#about">About the data</a></li>
									<li class="list-group-item noborder nobackground py-1"><a href="gmi-methane-data-epa.xlsx" download>Download the methane data</a></li>
                                </ul>
					</div>

				</div>
			</div>
		</div>
	</section>
	<section class="py-5 bg-white">
		<div class="container">
                    <h2 id="q1">Global Methane Emissions and Projections</h2>
			<p>All values are presented in million metric tons of carbon dioxide equivalent (MMTCO<sub>2</sub>e).</p>
				<div class="videoWrapper">
                    <iframe width="1024" height="612" src="https://app.powerbi.com/view?r=eyJrIjoiMzg5ODcyZmMtYWVhOC00NjVmLThiNDItOGEyOGY0MDYxMjVkIiwidCI6ImE0MGZlNGJhLWFiYzctNDhmZS04NzkyLWI0Mzg4OTkzNjQwMCIsImMiOjZ9&pageName=ReportSection" frameborder="0" allowFullScreen="true"></iframe>
				</div>
		</div>
	</section>
	<section class="py-5">
		<div class="container">

				<h2 id="help">Help Using this Tool</h2>
			<p>There are 6 different visualizations in the tool.  Each visualization provides selection and filtering tools that allow you to change the display.</p>
			<ol>
				<li>Shows total methane emissions for the selected country(ies) and years, grouped by sector.</li>
				<li>Shows total methane emissions in the Biogas Sector for the selected country(ies) and years.</li>
				<li>Shows total methane emissions in the Coal Mines Sector for the selected country(ies) and years.</li>
				<li>Shows total methane emissions in the Oil & Gas Sector for the selected country(ies) and years.</li>
				<li>Provides global map with pie charts to illustrate the types and amounts of methane emissions.</li>
				<li>Provides access to data that can be filtered by sector, country, and year.</li>
			</ol>


		</div>
	</section>
	<section class="py-5 bg-white">
		<div class="container">

		  <h2 id="about">About the Data</h2>
                        <p>The data represent projected global emissions of methane through 2050 for industry sectors.  The source data are organized into eight fields, as shown below.  The table below shows which fields were processed to align the source data to the industry sectors supported by GMI (Biogas, Coal Mines, and Oil &amp; Gas).</p>
                        <table class="table table-nonfluid">
							<thead>
                          <tr>
                            <th>Field</th>
                            <th>Values</th>
                            <th>Processing for GMI</th>
                          </tr>
							</thead>
							<tbody>
                          <tr>
                            <td>Country</td>
                            <td>195 countries</td>
                            <td>Flagged GMI Partner Countries</td>
                          </tr>
                          <tr>
                            <td>Sector</td>
                            <td>See mapping below</td>
                            <td>--</td>
                          </tr>
                          <tr>
                            <td>Source</td>
                            <td>See mapping below</td>
                            <td>Mapped to GMI Sector</td>
                          </tr>
                          <tr>
                            <td>Subsource</td>
                            <td>See mapping below</td>
                            <td>Mapped to GMI Category</td>
                          </tr>
                          <tr>
                            <td>Gas</p></td>
                            <td>CH<sub>4</sub>, HFCs, N<sub>2</sub>O, NF<sub>3</sub>, PFCs, SF<sub>6</sub></td>
                            <td>Only CH<sub>4</sub> included</td>
                          </tr>
                          <tr>
                            <td>Year</p></td>
                            <td>Numeric (1990 – 2050)</td>
                            <td>--</td>
                          </tr>
                          <tr>
                            <td>Unit</td>
                            <td>MMTCO2e</td>
                            <td>--</td>
                          </tr>
                          <tr>
                            <td>Value</td>
                            <td>Numeric</td>
                            <td>--</td>
                          </tr>
							</tbody>
                        </table>
                        <h3>Mapping of Sectors and Categories</h3>
                        <p>The table below shows how the U.S. EPA's Sector, Source, and  Subsource fields were mapped to GMI sectors and categories.</p>
                        <table class="table table-nonfluid">
							<thead>
                          <tr>
                            <th colspan="3">U.S. EPA Report Source</th>
                            <th colspan="2">GMI</th>
                          </tr>
                          <tr>
                            <td><strong>Sector</strong></td>
                            <td><strong>Source</strong></td>
                            <td><strong>Subsource</strong></td>
                            <td><strong>GMI Sector</strong></td>
                            <td><strong>Category</strong></td>
                          </tr>							
							</thead>
							<tbody>
                          <tr>
                            <td>Agriculture</td>
                            <td>Livestock</td>
                            <td>Manure</td>
                            <td>Biogas</td>
                            <td>Manure Management</td>
                          </tr>
                          <tr>
                            <td>Waste</td>
                            <td>Landfills</td>
                            <td>MSW</td>
                            <td>Biogas</td>
                            <td>Municipal Solid Waste</td>
                          </tr>
                          <tr>
                            <td>Waste</td>
                            <td>Wastewater</td>
                            <td>Rural</td>
                            <td>Biogas</td>
                            <td>Wastewater</td>
                          </tr>
                          <tr>
                            <td>Waste</td>
                            <td>Wastewater</td>
                            <td>Urban</td>
                            <td>Biogas</td>
                            <td>Wastewater</td>
                          </tr>
                          <tr>
                            <td>Energy</td>
                            <td>Coal</td>
                            <td>Surface</td>
                            <td>Coal Mines</td>
                            <td>Surface</td>
                          </tr>
                          <tr>
                            <td>Energy</td>
                            <td>Coal</td>
                            <td>Under</td>
                            <td>Coal Mines</td>
                            <td>Underground</td>
                          </tr>
                          <tr>
                            <td>Energy</td>
                            <td>NGO</td>
                            <td>Gas Product</td>
                            <td>Oil &amp; Gas</td>
                            <td>Oil &amp; Gas</td>
                          </tr>
                          <tr>
                            <td>Energy</td>
                            <td>NGO</td>
                            <td>Gas TSD</td>
                            <td>Oil &amp; Gas</td>
                            <td>Oil &amp; Gas</td>
                          </tr>
                          <tr>
                            <td>Energy</td>
                            <td>NGO</td>
                            <td>Oil Product</td>
                            <td>Oil &amp; Gas</td>
                            <td>Oil &amp; Gas</td>
                          </tr>
                          <tr>
                            <td>Energy</td>
                            <td>NGO</td>
                            <td>Oil Refining</td>
                            <td>Oil &amp; Gas</td>
                            <td>Oil &amp; Gas</td>
                          </tr>
                          <tr class="bg-light">
                            <td>Agriculture</td>
                            <td>Livestock</td>
                            <td>Enteric</td>
                            <td>Other (non-GMI)</td>
                            <td>Agriculture: Livestock, Enteric</td>
                          </tr>
                          <tr class="bg-light">
                            <td>Agriculture</td>
                            <td>OtherAg</td>
                            <td></td>
                            <td>Other (non-GMI)</td>
                            <td>Agriculture: Other</td>
                          </tr>
                          <tr class="bg-light">
                            <td>Agriculture</td>
                            <td>Rice</td>
                            <td></td>
                            <td>Other (non-GMI)</td>
                            <td>Agriculture: Rice</td>
                          </tr>
                          <tr class="bg-light">
                            <td>Energy</td>
                            <td>Combustion</td>
                            <td>Biomass</td>
                            <td>Other (non-GMI)</td>
                            <td>Energy: Combustion, Biomass</td>
                          </tr>
                          <tr class="bg-light">
                            <td>Energy</td>
                            <td>Combustion</td>
                            <td>StatMob</td>
                            <td>Other (non-GMI)</td>
                            <td>Energy: Combustion, StatMob</td>
                          </tr>
                          <tr class="bg-light">
                            <td>Energy</td>
                            <td>OtherEnergy</td>
                            <td></td>
                            <td>Other (non-GMI)</td>
                            <td>Energy: Other</td>
                          </tr>
                          <tr class="bg-light">
                            <td>Industrial Processes</td>
                            <td>OtherIPPU</td>
                            <td></td>
                            <td>Other (non-GMI)</td>
                            <td>Industrial Processes and Product Use</td>
                          </tr>
                          <tr class="bg-light">
                            <td>Waste</td>
                            <td>Landfills</td>
                            <td>Industrial</td>
                            <td>Other (non-GMI)</td>
                            <td>Waste: Landfills, Industrial</td>
                          </tr>
                          <tr class="bg-light">
                            <td>Waste</td>
                            <td>OtherWaste</td>
                            <td></td>
                            <td>Other (non-GMI)</td>
                            <td>Waste: Other</td>
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
</body>

</html>