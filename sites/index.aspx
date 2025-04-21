<%@ Page Language="VB" AutoEventWireup="false" Inherits="M2M_Redesign.sites_index" Codebehind="index.aspx.vb" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Methane Sites and Activities | Global Methane Initiative</title>
     <!-- #include virtual="/includes/include_head.html" -->
    <style>
        #hide {height:0px;display:none;}

    </style>
</head>
<body>
    <!-- #include virtual="/includes/header.html" -->
    <form id="sites_index_form" runat="server">
    <div>
	<!-- Page Content -->
    <section class="py-5 gmi-light-blue">
        <div class="container">
            
			<div class="row">
				<div class="col-sm-7">
                    <h1>Methane Sites and Activities</h1>
					<p>Industries targeted by GMI for strategic efforts to reduce emissions account for more than 50% of the world’s methane emissions. The map below shows locations where GMI and our Partners have worked to reduce barriers to the recovery and use of methane as a clean energy source. Please note that this map shows only activities tracked by GMI; the map does not represent all methane-related sites in the world. The information is updated weekly from the latest GMI project database.</p>
                    <a href="activities.aspx" role="button" class="btn btn-outline-primary">View List of Activities</a>
				</div>
				<div class="col-sm-5">
					<div class="border border-secondary bg-white px-0">
						<div class="py-1 text-center bg-dark text-white"><strong>Notice</strong></div>
                             <p class="py-3 px-3">GMI cannot guarantee the validity of the data. The placement of map icons is approximate, so the zoom-in feature is limited to avoid misrepresentations. <a href="contactus.html">Contact us</a> if you have more accurate information about the location of a project or site.</p>
					</div>
				</div>

			</div>
		</div>
	</section>
	<section class="py-5 bg-white">
		<div class="container">
            <asp:Button ID="btnDownload" runat="server" Text="Download Current Data"  class="btn btn-primary float-right" />
			<%--<a id="btnExportToExcelnoFloat" class="btn btn-primary float-right" href="#">Download Current Data</a><br />--%>
            <br />
&nbsp;<h2 id="activities">Map of Methane Sites
            </h2>


			<iframe width="100%" height="600px" src="https://tt-mmi.maps.arcgis.com/apps/webappviewer/index.html?id=8102159050d94c0bb7f55a9e9d527359"></iframe>
 			<p class="text-center"><img src="/assets/images/map_icon_ag.png" alt="Agriculture" style="width:25px;" /> Agriculture&nbsp;&nbsp;  
            <img src="/assets/images/map_icon_coal.png" alt="Coal" style="width:25px;"/> Coal Mines&nbsp;&nbsp;  
            <img src="/assets/images/map_icon_msw.png" alt="Municipal Solid Wastes" style="width:25px;"/> Municipal Solid Waste&nbsp;&nbsp;  
            <img src="/assets/images/map_icon_oilandgas.png" alt="Oil and Gas" style="width:25px;"/> Oil &amp;Gas &nbsp;&nbsp;  
            <img src="/assets/images/map_icon_ww.png" alt="Wastewater" style="width:25px;"/> Wastewater &nbsp;&nbsp;</p>

			<p>Click on a site to learn more. Tips for using the map features are provided below. Some features may be easier to use when you <a target="_blank" href="https://tt-mmi.maps.arcgis.com/apps/webappviewer/index.html?id=8102159050d94c0bb7f55a9e9d527359">open the larger version of the map</a>.</p>

		</div>
	</section>
	<section class="py-5">
		<div class="container">

			<h2 id="tools">How to Use this Map</h2>
			<p>Click and drag (or swipe) to navigate and click the icons to view more information. The following tools will help you refine the display, search for a site, download information, or print the map.</p>
               <table class="table">
					<tr>
						<td><img src="/assets/images/map__03.png" style="width:28px;"/></td>
						<td><strong>Zoom In</strong></td>
						<td>Click to zoom in (closer view).</td>
					</tr>
					<tr>
						<td><img src="/assets/images/map__04.png" style="width:28px;"/></td>
						<td><strong>Zoom Out</strong></td>
						<td>Click to zoom out (wider view).</td>
					</tr>
					<tr>
						<td><img src="/assets/images/map__05.png" style="width:28px;"/></td>
						<td><strong>Home</strong></td>
						<td>Click to return to the default view. </td>
					</tr>
					<tr>
						<td><img src="/assets/images/map__06.png" style="width:28px;"/></td>
						<td><strong>My Location</strong></td>
						<td>Click to zoom to your current location. Your location will be shown on the map as a blue dot. </td>
					</tr>
					<tr>
						<td><img src="/assets/images/map__07.png" style="width:28px;"/></td>
						<td><strong>Previous extent</strong></td>
						<td>Click to go back through map views.</td>
					</tr>
					<tr>
						<td><img src="/assets/images/map__08.png" style="width:28px;"/></td>
						<td><strong>Next extent</strong></td>
						<td>Click to go forward through map views.</td>
					</tr>
					<tr>
						<td><img src="/assets/images/map__09.png" style="width:28px;"/></td>
						<td><strong>Search</strong></td>
						<td>Search for geographic places across the globe (for example, a city name).</td>
					</tr>
					<tr>
						<td><img src="/assets/images/map__10.png" style="width:28px;"/></td>
						<td><strong>Layer List</strong></td>
						<td>Use this tool to determine which points are shown on the map.  Click on the ellipses icon (…) to control the order of the layers, set the transparency for each layer, and view the data for a layer in the Attribute Table.</td>
					</tr>
					<tr>
						<td><img src="/assets/images/map__12.png" style="width:28px;"/></td>
						<td><strong>Legend</strong></td>
						<td>Describes the points that are shown on the map.</td>
					</tr>
					<tr>
						<td><img src="/assets/images/map__14.png" style="width:28px;"/></td>
						<td><strong>Basemap gallery</strong></td>
						<td>Select the map to use as the background (for example, a street map or topographical map).</td>
					</tr>
					<tr>
						<td><img src="/assets/images/map__16.png" style="width:28px;"/></td>
						<td><strong>Query</strong></td>
						<td>This tool allows you to search for sites by Site Name, City, or Country.  On the “Tasks” pane, click a task and then enter your search criteria.  You can find exact matches using the “IS” field or search by keyword using the “CONTAINS” field.  Click the “Apply” button to  load the results.  The results will be displayed as a list within the Query dialog, and will be highlighted on the map.  From the “Results” pane, you can also perform several featured actions by clicking on the ellipsis icon, such as exporting the results to a comma separated list that can be opened in Excel.</td>
					</tr>
					<tr>
						<td><img src="/assets/images/map__18.png" style="width:28px;"/></td>
						<td><strong>Print</strong></td>
						<td>Use this tool to print the map that you see on the screen.  You can print to portable documents format (PDF) or several other formats.</td>
					</tr>
					<tr>
						<td><img src="/assets/images/attribute.png" style="width:28px;"/></td>
						<td><strong>Open&nbsp;Attributes Table </strong></td>
						<td>The attributes table presents the data in a spreadsheet format.  You can select a point in the table, then zoom to the location on the map.</td>
				   </tr>
				</table>
            <div id="hide">
                            <asp:GridView id="ExportSites" visible="true" runat="server" autogeneratecolumns="True" allowsorting="false"
                    allowpaging="false">
                </asp:GridView>
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
