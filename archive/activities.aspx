<%@ Page Language="VB" AutoEventWireup="false" Inherits="M2M_Redesign.activities" Codebehind="activities.aspx.vb" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>List of GMI Activities | Global Methane Initiative</title>
     <!-- #include virtual="/includes/include_head.html" -->
</head>
<body>
    <!-- #include virtual="/includes/header.html" -->
    <form id="activities_form" runat="server">
    <div>
    <!-- Page Content -->
    <section class="py-5 gmi-light-blue">
        <div class="container">
            <div class="row">
                <div class="col-sm-7 vertSplitter">
                    <h1>List of GMI Activities</h1>
                    <asp:Literal ID="litTitle" runat="server"></asp:Literal>
                   <p>
                        Industries targeted by GMI for strategic efforts to reduce emissions account for more than 50% of the world's methane emissions. The table below lists activities where GMI and our Partners have worked to reduce barriers to the recovery and use of methane as a clean energy source.  </p>
<p>Click on the name of the activity to view more information and learn about other GMI activities that have been conducted at the same site. Use the keyword search and dropdown filters to find activities by name, sector, country/region, or type. </p>

                    </div>
                <div class="col-sm-5"><br /><br />
					<p><strong>Explore the Map of Methane Sites </strong></p>
                        <p>The activities listed below are presented visually on GMI&rsquo;s Map of Methane Sites. Use the map to see sites by geographic area.  </p>
                    <p><a href="index.aspx" role="button" class="btn btn-outline-primary">Map of Methane Sites</a></p>

                </div>
                
            </div>

        </div>
        
        
    </section>
    <section class="py-2">
		<div class="container">
			
			<div class="row">
				<div class="col-8">

                        <div class="input-group mb-3">
                          <input type="text" id="myInputTextField" style="width:90%;" class="form-control" placeholder="enter keyword" aria-label="Keyword" aria-describedby="myInputTextFieldicon">
                          <div class="input-group-append">
                            <span class="input-group-text" id="myInputTextFieldicon"><i class="fa fa-search" aria-hidden="true"></i></span>
                          </div>
                        </div>
				</div>
				<div class="col-4 text-right">
					<!-- disabled 11/30 to simplify page
					<button class="btn btn-danger btn-sm" id="clearFilters"><i class="fa fa-filter" aria-hidden="true"></i> Clear All Filters</button>
					-->
					
				</div>
			</div>
		</div>


		<!-- disabled 11/30 to simplify page
		<div class="container">
			
                    <table class="table table-sm">
                        <thead class="thead-dark">
                            <tr>
                                <th style="width:45%;"><strong>I am looking for activities related to:</strong></th>
                                <th style="width:10%;">&nbsp;</th>
                                <th style="width:45%;">
									<strong>Show:</strong>
								</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>
                                    Conducting methane emissions assessments
                                </td>
                                <td class="text-secondary"><i class="fa fa-chevron-right" aria-hidden="true"></i></td>
                                <td class="text-nowrap">
                                    <input class="column_filterT" type="checkbox" name="topiccheck" value="Measurement Study"> Measurement Studies<br>
                                    <input class="column_filterT" type="checkbox" name="topiccheck" value="Study"> Pre-feasibility Studies<br />
                                    <input class="column_filterT" type="checkbox" name="topiccheck" value="Study Tour"> Scoping Mission<br />
                                    <input class="column_filterT" type="checkbox" name="topiccheck" value="Tool/Model"> Tools and Models<br />
                                    <input class="column_filterT" type="checkbox" name="topiccheck" value="Report or Publication"> Reports and Publications<br />
                                </td>
                            </tr>
                            <tr style="border-top:2px solid #fff;">
                                <td>
                                    Capacity building and information sharing

                               </td>
                                <td class="text-secondary"><i class="fa fa-chevron-right" aria-hidden="true"></i></td>
                                <td class="text-nowrap">
                                    <input class="column_filterT" type="checkbox" name="topiccheck" value="Policy Analysis/Consultation"> Policy Analysis/Consultation<br>
                                    <input class="column_filterT" type="checkbox" name="topiccheck" value="Workshop/Training"> Workshop/Training<br />
                                    <input class="column_filterT" type="checkbox" name="topiccheck" value="Manual"> Manuals
                                </td>
                            </tr>
                            <tr style="border-top:2px solid #fff;">
                                <td>
                                    Building strategic partnerships around the world
                                </td>
                                <td class="text-secondary"><i class="fa fa-chevron-right" aria-hidden="true"></i></td>
                                <td class="text-nowrap">
                                    <input class="column_filterT" type="checkbox" name="topiccheck" value="Conferences"> Conferences<br />
                                    <input class="column_filterT" type="checkbox" name="topiccheck" value="Presentation"> Presentations<br />
                                    <input class="column_filterT" type="checkbox" name="topiccheck" value="Site Visit"> Site Visits<br />
                                    <input class="column_filterT" type="checkbox" name="topiccheck" value="Steering Meeting"> Steering Committee<br />
                                    <input class="column_filterT" type="checkbox" name="topiccheck" value="Subcommittee Meeting"> Subcommittees

                                </td>
                            </tr>
                            <tr style="border-top:2px solid #fff;">
                                <td>
                                    Information sharing and public outreach
                                </td>
                                <td class="text-secondary"><i class="fa fa-chevron-right" aria-hidden="true"></i></td>
                                <td class="text-nowrap">
                                    <input class="column_filterT" type="checkbox" name="topiccheck" value="Website or Other Outreach"> Websites and Other Outreach<br />
                                    <input class="column_filterT" type="checkbox" name="topiccheck" value="Other Outreach"> Social Media and Other Outreach
                                    
                                </td>
                            </tr>
                           
						</tbody>
                    </table>
					
		</div>
		-->

    </section>
    <section class="py-2">
	

		<div class="container">

			
			
			<div class="row">

           
				
				
				<div class="col-sm-3">

                              		<small id="sectorChoose">
		                                  <strong>Sector</strong><br>
		                                  <select name="Select1" class="column_filter" id="col7_filterSector" data-column="8" style="width:95%;">
		                                      <option value="">All</option>
		                                      <option value="biogas">Biogas</option>
		                                      <option value="agri">&nbsp;&nbsp;Agriculture</option>
		                                      <option value="msw">&nbsp;&nbsp;Municipal Solid Waste</option>
		                                      <option value="ww">&nbsp;&nbsp;Wastewater</option>
 		                                      <option value="coal">Coal</option>
							<!-- disabled 11/30 because there are no oil and gas sites
 		                                        <option value="oilngas">Oil & Gas</option>
 		                                        -->
		                                      <option value="steer">Steering</option>
                                  		</select>
                              		</small>
                		</div>
					  
						  
				<div class="col-sm-3">
                              		<small id="countryChoose">
		                                  <strong>Country/Region</strong><br>
                                  <select name="Select2" class="column_filterC" id="col7_filterCountry" data-column="8" style="width:95%;">
                                      <option value="">All</option>
									  <optgroup label="Countries">
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
                                      <option value="Uruguay">Uruguay</option>
                                      <option value="United Kingdom">United Kingdom</option>
                                      <option value="United States">United States</option>
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

				<div class="col-sm-2">
                              		<small id="typeChoose">
		                                  <strong>Type</strong><br>
	                                  <select name="typeselect" class="column_filterType" id="col6_filterType" data-column="6" style="width:95%;">
	                                      <option value="">All</option>
	                                      <option value="Meeting">Meeting</option>
	                                      <option value="Project">Project</option>
	                                      <option value="Study">Study</option>
	                                      <option value="Study Tour">Study Tour</option>
	                                      <option value="Technical Assistance/Outreach">Technical Assistance/Outreach</option>
	                                      <option value="Workshop/Training">Workshop/Training</option>
                                          <option value="GMC Action">GMC Action</option>
                                          <option value="Other">Other</option>
										</select>
									</small>
             			</div>


				<!--diabled year filter 11/30 because some rows do not have a year identified
				<div class="col-sm-2">
                              		<small id="yearChoose">
		                                  <strong>Years</strong><br>
                                          <select name="min" class="column_filterYear" id="min">
                                              <option value="2004">2004</option>
                                              <option value="2005">2005</option>
                                              <option value="2006">2006</option>
                                              <option value="2007">2007</option>
                                              <option value="2008">2008</option>
                                              <option value="2009">2009</option>
                                              <option value="2010">2010</option>
                                              <option value="2011">2011</option>
                                              <option value="2012">2012</option>
                                              <option value="2013">2013</option>
                                              <option value="2014">2014</option>
                                              <option value="2015">2015</option>
                                              <option value="2016">2016</option>
                                              <option value="2017">2017</option>
                                              <option value="2018">2018</option>
                                              <option value="2019">2019</option>
                                              <option value="2020">2020</option>
                                          </select>-<select name="max" class="column_filterYear" id="max">
                                              <option value="2020">2020</option>
                                              <option value="2019">2019</option>
                                              <option value="2018">2018</option>
                                              <option value="2017">2017</option>
                                              <option value="2016">2016</option>
                                              <option value="2015">2015</option>
                                              <option value="2014">2014</option>
                                              <option value="2013">2013</option>
                                              <option value="2012">2012</option>
                                              <option value="2011">2011</option>
                                              <option value="2010">2010</option>
                                              <option value="2009">2009</option>
                                              <option value="2008">2008</option>
                                              <option value="2007">2007</option>
                                              <option value="2006">2006</option>
                                              <option value="2005">2005</option>
                                              <option value="2004">2004</option>
                                          </select>
										
	                              </small>					
				</div>
				-->

             </div>
		</div>

	</section>

<section class="py-5 bg-white" id="activityListArea">
        <div class="container"> 

			
			<div class="loading" style="background:white;color:#0B7AC0;position:absolute;left:0%;top0%;width:100%;height:100%;text-align:center;z-index:999;">
				<i class="fa fa-spinner fa-spin" style="font-size:48px"></i>
			</div>
			

<a href="#" id="toggleCard" class="btn btn-dark btn-lg float-left" role="button"><i class="fa fa-th-large" aria-hidden="true" id="displayIcon"></i> <span id="viewTottgleText">Switch to Card View</span></a>
<asp:Placeholder id="phActivityList" runat="server" Visible="false"></asp:Placeholder>	
            <div id="allactivities" runat="server" visible="false"><!-- #include virtual="/sites/all_activities.html" --></div>
            <div id="coalactivities" runat="server" visible="false"><!-- #include virtual="/sites/coal_activities.html" --></div>
                        <div id="biogasactivities" runat="server" visible="false"><!-- #include virtual="/sites/biogas_activities.html" --></div>
                        <div id="oilgasactivities" runat="server" visible="false"><!-- #include virtual="/sites/oil_activities.html" --></div>
            <asp:LinkButton ID="reloadActivities" runat="server" Click="reload_click" />
                        		
		
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


	<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.21/js/jquery.dataTables.js"></script>
	<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/colreorder/1.5.2/js/dataTables.colReorder.min.js"></script>	


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
        window.onscroll = function () {
            scrollFunction()
        };

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




     <script>

         function filterColumnsAll() {

             var searchSector = document.getElementById("col7_filterSector");
             var searchSectorValue = searchSector.options[searchSector.selectedIndex].value;

             var searchCountry = document.getElementById("col7_filterCountry");
             var searchCountryValue = searchCountry.options[searchCountry.selectedIndex].value;
			 
             var searchStringValue = "";

             
			 //is a sector selected?
			 if(searchSectorValue != "") {searchStringValue = searchSectorValue;}

             //is a country selected
			 if(searchCountryValue != "") {
                    if(searchStringValue != "") {
                        searchStringValue = searchStringValue + ' ' + searchCountryValue;
                    } else {
                        searchStringValue = searchCountryValue;
                }
             }



             $('#table').DataTable().column(8).search(
                  searchStringValue,
              ).draw();


          }


         function filterTopicsAll() {

             var topiccheckboxes = document.getElementsByName('topiccheck');
             var topicCheckboxValues = "xxx";
             for (var checkbox of topiccheckboxes) {
                  if (checkbox.checked)
                    topicCheckboxValues = checkbox.value + '|' + topicCheckboxValues;
             };
			 
			 if (topicCheckboxValues != "xxx") {
				 $('#table').DataTable().column(8).search(topicCheckboxValues, true, false ).draw();
			 }
			 else {
				 $('#table').DataTable().column(8).search("", true, false ).draw();
			 }

          }		 
		 
    </script>


<script>
/* Custom filtering function which will search data in column four between two values */
$.fn.dataTable.ext.search.push(
    function( settings, data, dataIndex ) {
        var min = parseInt( $('#min').val(), 10 );
        var max = parseInt( $('#max').val(), 10 );
        var year = parseFloat( data[2] ) || 0; // use data for the year column
 
		if (min > max) {
			alert('You have selected an invalid range.');
			document.getElementById("min").selectedIndex = "0";
			return false;
		}

		if ( ( isNaN( min ) && isNaN( max ) ) ||
             ( isNaN( min ) && year <= max ) ||
             ( min <= year   && isNaN( max ) ) ||
             ( min <= year   && year <= max ) )
        {
            return true;
        }
        return false;
    }
);
 
$(document).ready(function() {
    var table = $('#table').DataTable();
     
    // Event listener to the two range filtering inputs to redraw on input
    $('#min, #max').on('change', function () {
        table.draw();
    } );
} );
	
$(document).ready(function() {
  $('#clearFilters').click(function(){

	  document.getElementById("myInputTextField").value = "";
	  document.getElementById("col7_filterSector").selectedIndex = 0;
	  document.getElementById("col7_filterCountry").selectedIndex = 0;

	  document.getElementById("col6_filterType").selectedIndex = 0;
	  document.getElementById("min").selectedIndex = 0;
	  document.getElementById("max").selectedIndex = 0;
	  
	  var inputs = document.querySelectorAll('.column_filterT'); 
        for (var i = 0; i < inputs.length; i++) { 
            inputs[i].checked = false; 
        }
	  
	  var table = $('#table').DataTable();
	  table
 		.search( '' )
 		.columns().search( '' )
 		.draw();
  });

});	
</script>

			<script>

                  var otable = $('#table').DataTable({
                      pageLength: 12,
					  
                      "lengthChange": false,
                      "order": [
                          [2, "desc"],[1, 'asc']
                      ],
					  dom: 'itp',
					  columnDefs: [
                          {
                              "title": "",
                              'targets': [0],
                              'searchable': false,
                              'orderable': false,
                              'render': function (data, type, full, meta) {
                                  if (data === "") {
									  return '<img src="../images/doc_thumbs/image-not-available.png" style="width:100%;" />';
								  }
								  else {
									return '<img src="' + data + '" style="width:100%;" />';  
								  }
                              },
						      "width": "15%"
                          },

						  {
                              "render": function (data, type, row) {

                                  return '<a href="' + row[4] + '">' + data + ' </a>';

//				11/30, removed display of tags
//                                  return '<a href="' + row[4] + '">' + data + ' </a>' +
//									  '<div class="resdesc">' + row[5] + '</div>';
                              },
                              "title": "Activity",
                              "targets": [1],
						      "width": "60%"
                          },

                          {
							  "render": function (data, type, row) {

                                  if (data === "?") {
									  return '';
								  }
                                  else if (data === "??") {
									  return '';
								  }
								  else {
									return row[2];  
								  }

//				11/30, removed button and added condition to display blanks where the year is unknown
//                                  return row[2] + 
//                                     '<div class="resbutton"><a href="/sites/activity_details.aspx?a=' + row[3] + '" role="button" class="btn btn-outline-secondary btn-sm" target="_blank">View Details</a></div>';

                              },
                              "title": "Year",
                              "targets": [2],
						      "width": "15%"

						  },
                          {
                              "title": "Type",
                              "targets": [6],
						      "visible": false
                          },
                          
                          {
                              "targets": [3, 4, 5],
                              "visible": false,
                              "searchable": false
                          },
                          {
                              "targets": [7],
                              "visible": false,
							  "searchable": true
                          },
                          {
                              "targets": [8],
                              "visible": false,
							  "searchable": true
                          }


                      ],

					  "initComplete": function( settings, json ) {
						$('div.loading').remove();
					}


                  });




                  $('.column_filter').on('change', function () {
                      filterColumnsAll();
                  });

                  $('.column_filterC').on('change', function () {
                      filterColumnsAll();
                  });

                  $('.column_filterT').on('change', function () {
					  filterTopicsAll();
                  });

                  $('.column_filterType').on('change', function () {
					//alert('filtering on type for ' + this.value);
					otable 
						.columns( 6 )
						.search( this.value )
						.draw();
                  });
				 
                  $('.column_filter2').on('change', function () {
                      filterColumn2($(this).val());
                  });

				
				
                  $('#myInputTextField').keyup(function(){
                        otable.search($(this).val()).draw() ;
                  })
				

                  $("#toggleCard").click(function () {
                      $("#table").toggleClass("card");

					  var x1 = document.getElementById("viewTottgleText");
                      if (x1.innerHTML === "Switch to Card View") {
						  x1.innerHTML = "Switch to List View";
						  $("#toggleCard").removeClass(" btn-primary");
						  $("#toggleCard").addClass(" btn-outline-primary");	
						  $("#displayIcon").removeClass("fa fa-th-large");
						  $("#displayIcon").addClass("fa fa-bars");
						  $("#activityListArea").removeClass(" bg-white");
                      } else {
                          x1.innerHTML = "Switch to Card View";
						  $("#toggleCard").removeClass(" btn-outline-primary");
						  $("#toggleCard").addClass(" btn-primary");	
						  $("#displayIcon").removeClass("fa fa-bars");
						  $("#displayIcon").addClass("fa fa-th-large");
						  $("#activityListArea").addClass(" bg-white");
                      }	
                  });

			

                  $.urlParam = function (name) {
                      var results = new RegExp('[\?&]' + name + '=([^&#]*)')
                          .exec(window.location.search);

                      return (results !== null) ? results[1] || 0 : false;
                  }



              </script>			









<script>
var getUrlParameter = function getUrlParameter(sParam) {
    var sPageURL = window.location.search.substring(1),
        sURLVariables = sPageURL.split('&'),
        sParameterName,
        i;

    for (i = 0; i < sURLVariables.length; i++) {
        sParameterName = sURLVariables[i].split('=');

        if (sParameterName[0] === sParam) {
            return sParameterName[1] === undefined ? true : decodeURIComponent(sParameterName[1]);
        }
    }
};

	
	
//tests the url for a type of activities based on the filter option values
$( document ).ready(function () {
		var typeNumber = getUrlParameter("type");
		var e = document.getElementById("col6_filterType");
		e.selectedIndex = typeNumber;
		var searchTypeText = e.options[e.selectedIndex].value;

		var tagsearchvalue = "";
	
		var sectorValue = getUrlParameter("sector");
		if (typeof sectorValue === 'undefined' || sectorValue === null) {
			document.getElementById('col7_filterSector').selectedIndex = 0;
			var sectorValue = "";
		} else {
			document.getElementById('col7_filterSector').value = sectorValue;
			tagsearchvalue = tagsearchvalue + ' ' + sectorValue
		};

		var countryValue = getUrlParameter("country");
		if (typeof countryValue === 'undefined' || countryValue === null) {
			document.getElementById('col7_filterCountry').selectedIndex = 0;
			var countryValue = "";
		} else {
			document.getElementById('col7_filterCountry').value = countryValue;
			tagsearchvalue = tagsearchvalue + ' ' + countryValue
		};
	
		var table = $('#table').DataTable();
        table 
            .columns( 6 )
            .search( searchTypeText )
			.columns( 8 )
			.search(tagsearchvalue)
            .draw();

});
	

</script></body>

</html>
