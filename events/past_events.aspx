<%@ Page Language="VB" AutoEventWireup="false" Inherits="M2M_Redesign.past_events" Codebehind="past_events.aspx.vb" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Past Events | Global Methane Initiative</title>
     <!-- #include virtual="/includes/include_head.html" -->
</head>
<body>
    <!-- #include virtual="/includes/header.html" -->
    <form id="events_index_form" runat="server">
    <div>
	<!-- Page Content -->
    <section class="py-5 gmi-light-blue">
        <div class="container">
            <h1>Past Events</h1>
			<div class="row py-3">
				<div class="col-sm-8">
					<p>GMI sponsors and participates in events throughout the year. View a list of past events below. Click on an event to view more details and access meeting materials and proceedings.</p>
					
				</div>
				
			</div>
		</div>
	</section>
	
	<section class="py-5 bg-white">
		<div class="container">
			<div class="row">
			<div class="col-sm-6">
	                    	<small id="sectorChoose">
	                          <strong>Sector</strong><br>
	                          <select name="Select1" class="column_filter" id="col4_filterSector" data-column="4" style="width:95%;">
	                              <option value="">All</option>
	                              <option value="Biogas">Biogas</option>
	                              <option value="Agriculture">&nbsp;&nbsp;Agriculture</option>
	                              <option value="MSW">&nbsp;&nbsp;Municipal Solid Waste</option>
	                              <option value="Wastewater">&nbsp;&nbsp;Wastewater</option>
	                              <option value="Coal Mines">Coal</option>
	                              <option value="Oil">Oil & Gas</option>
	                              <option value="Steering">Steering</option>
	                        </select>
	                    	</small>
	                </div>
			<div class="col-sm-6">
	                     <small id="locationChoose">
		                   <strong>Location</strong><br>
                                  <select name="Select2" class="column_filterC" id="col3_filterLocation" data-column="3" style="width:95%;">
                                      <option value="">All</option>
									  <option value="Online">Online</option>
									  <option value="Virtual">Virtual Meeting</option>
									  <option value="Webinar">Webinar</option>
									  <optgroup label="Countries">
                                      <option value="Angola">Angola</option>
                                      <option value="Argentina">Argentina</option>
                                      <option value="Australia">Australia</option>
                                      <option value="Belgium">Belgium</option>
                                      <option value="Bolivia">Bolivia</option>
                                      <option value="Brazil">Brazil</option>
                                      <option value="Bulgaria">Bulgaria</option>
                                      <option value="Canada">Canada</option>
                                      <option value="Chile">Chile</option>
                                      <option value="China">China</option>
                                      <option value="Colombia">Colombia</option>
                                      <option value="Costa Rica">Costa Rica</option>
                                      <option value="Denmark">Denmark</option>
                                      <option value="Dominican Republic">Dominican Republic</option>
                                      <option value="Ecuador">Ecuador</option>
                                      <option value="Ethiopia">Ethiopia</option>
                                      <option value="European Commission">European Commission</option>
									  <option value="Finland">Finland</option>
                                      <option value="France">France</option>
                                      <option value="Gabon">Gabon</option>
                                      <option value="Germany">Germany</option>
                                      <option value="Ghana">Ghana</option>
                                      <option value="India">India</option>
                                      <option value="Indonesia">Indonesia</option>
                                      <option value="Ireland">Ireland</option>
                                      <option value="Italy">Italy</option>
                                      <option value="Japan">Japan</option>
                                      <option value="Kazakhstan">Kazakhstan</option>
                                      <option value="Mexico">Mexico</option>
                                      <option value="Moldova">Moldova</option>
                                      <option value="Mongolia">Mongolia</option>
                                      <option value="Nepal">Nepal</option>
                                      <option value="Netherlands">Netherlands</option>
                                      <option value="New Zealand">New Zealand</option>
                                      <option value="Nicaragua">Nicaragua</option>
                                      <option value="Nigeria">Nigeria</option>
                                      <option value="Norway">Norway</option>
                                      <option value="Pakistan">Pakistan</option>
                                      <option value="Peru">Peru</option>
                                      <option value="Philippines">Philippines</option>
                                      <option value="Poland">Poland</option>
                                      <option value="Portugal">Portugal</option>
                                      <option value="Republic of Korea">Republic of Korea</option>
                                      <option value="Russia">Russia</option>
                                      <option value="Saudi Arabia">Saudi Arabia</option>
                                      <option value="Serbia">Serbia</option>
                                      <option value="South Africa">South Africa</option>
                                      <option value="Sri Lanka">Sri Lanka</option>
                                      <option value="Sweden">Sweden</option>
                                      <option value="Switzerland">Switzerland</option>
                                      <option value="Thailand">Thailand</option>
                                      <option value="Turkey">Turkey</option>
                                      <option value="Ukraine">Ukraine</option>
                                      <option value="United Kingdom">United Kingdom</option>
                                      <option value="United States">United States</option>
                                      <option value="Uruguay">Uruguay</option>
                                      <option value="Vietnam">Vietnam</option>
										  </optgroup>
									  <optgroup label="Regions">
                                      <option value="Africa">Africa</option>
                                      <option value="Asia">Asia</option>
                                      <option value="Central America">Central America</option>
                                      <option value="Europe">Europe</option>
										  </optgroup>
								  </select>
                              		</small>
          		</div>

	             </div>
		</div>		

		<div class="container">
            <!-- #include virtual="/events/all_past_events.html" -->
          
            
		</div>
	</section>
      
	</form>
	<!-- #include virtual="/includes/footer_scripts.aspx" -->


	<script
  src="https://code.jquery.com/jquery-3.5.1.min.js"
  integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
  crossorigin="anonymous"></script>
	<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.22/css/jquery.dataTables.css">
  
<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.22/js/jquery.dataTables.js"></script>

	<script type="text/javascript" charset="utf8" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.8.4/moment.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/moment-range/4.0.2/moment-range.js" integrity="sha512-XKgbGNDruQ4Mgxt7026+YZFOqHY6RsLRrnUJ5SVcbWMibG46pPAC97TJBlgs83N/fqPTR0M89SWYOku6fQPgyw==" crossorigin="anonymous"></script>

	<script>
//		$(document).ready(function () {
//            $.fn.dataTable.moment('D MMMM YYYY');
//            $('#recentevents').DataTable();
//        });
    </script>

    <script>

         function filterColumnsSector() {

             var searchSector = document.getElementById("col4_filterSector");
             var searchSectorValue = searchSector.options[searchSector.selectedIndex].value;

             $('#recentevents').DataTable().column(4).search(
                  searchSectorValue,
              ).draw();

          }

         function filterColumnsLocation() {

             var searchLocation = document.getElementById("col3_filterLocation");
             var searchLocationValue = searchLocation.options[searchLocation.selectedIndex].value;
			 
             $('#recentevents').DataTable().column(3).search(
                  searchLocationValue,
              ).draw();

          }
		 
    </script>	
	<script>
	    $(document).ready(function () {
			//$.fn.dataTable.moment('D MMMM YYYY');
			$('#recentevents').DataTable({
				"lengthMenu": [
                    [10, 25, 50, 100, -1],
                    [10, 25, 50, 100, "All"]
                ],
                iDisplayLength: 25,
                dom: 'lfrBtip',
                scrollX: true,
			});
        });

		$('.column_filter').on('change', function () {
                      filterColumnsSector();
                  });

        $('.column_filterC').on('change', function () {
                      filterColumnsLocation();
                  });
	</script>

</body>

</html>
