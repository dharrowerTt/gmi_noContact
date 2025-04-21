<%@ Page Language="VB" AutoEventWireup="false" Inherits="M2M_Redesign.ww" Codebehind="ww.aspx.vb" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Wastewater Technical Group | Global Methane Initiative</title>
     <!-- #include virtual="/includes/include_head.html" -->
</head>
<body>
    <!-- #include virtual="/includes/header.html" -->
    <form id="ww_form" runat="server">
    <div>
     <!-- Page Content -->
	<section class="py-5 gmi-light-blue">
        <div class="container">
			<div class="row py-2">
				<div class="col-sm-8">
                    <h1>Municipal Wastewater Technical Group</h1>
					<p>The Municipal Wastewater Technical Group, including experts from government and the private sector, provides international leadership to mitigate global methane emissions through the abatement, recovery, and use of methane from municipal wastewater sources. The technical group works to identify needs, opportunities and priorities for project development globally as well as key barriers and strategies to overcome them. The technical group also facilitates investment and financing opportunities and other cooperative activities and projects that advance the abatement and recovery of methane and its use as an energy source.</p>
				</div>
                <div class="col-sm-4">
					<img src="../images/bkgd_sector_ww_banner3.jpg" style="width:100%;" />
					<p class="small">Methane is produced when the organic material in municipal wastewater decomposes anaerobically. Varying amounts of methane are emitted during the collection, handling, and treatment of wastewater depending on methods employed. A number of techniques can be employed to reduce or recover and use wastewater methane that can yield substantial energy, economic, environmental, air quality, and public health benefits.</p>
				</div>
			</div>


        </div>
        
        
    </section>

	<section class="py-5 bg-white">
		<div class="container" id="technicalgroup">

					<div class="row py-2">
                        <div class="col-sm-4">
							<h2>Co-chairs</h2>
                              <p><strong>Federico Grullon, Co-chair</strong><br>
                              National Council for Climate Change and Clean Development Mechanism (CDM)<br>
                              Dominican Republic</p>
                              <p><strong>Matt Hamilton, Co-chair</strong><br>
                              Environment and Climate Change Canada (ECCC)<br>
                              Canada</p>
						</div>
                        <div class="col-sm-4">
                              <h2>Members</h2>
                              <p>Representatives from 16 countries participate in the group.</p>
							  <p><a href="/delegates/index.aspx?sector=wastewater" role="button" class="btn btn-outline-primary">View Delegates</a></p>
							<p>This group is organized within the GMI Biogas Subcommittee.</p>
							<p><a href="index.aspx" role="button" class="btn btn-outline-primary">View Details</a></p>
						</div>
                        <div class="col-sm-4">
                              <h2>Resources</h2>
                              
	                        <p>Visit the Biogas page to view featured resources.</p>
                            <p><a href="index.aspx#tools" role="button" class="btn btn-outline-primary">Featured Biogas Resources</a></p>
            
                                          <p>Visit the GMI resource library to find tools, reports, presentations, and more related to mitigating methane emissions in the municipal wastewater sector.</p>
                                        <p><a href="/resources/index.aspx?sector=Wastewater" role="button" class="btn btn-outline-primary">View Wastewater Resources</a></p>
						</div>
                    </div>

		</div>
	</section>
 
	<section class="py-5">
		<div class="container">
			<h2 id="connect">Connect, Contribute, and Stay in Touch</h2>
			<div class="row">
              <div class="col-sm-4">
				<p><strong>Are you interested in collaborating with GMI's Municipal Wastewater Technical Group on methane mitigation projects?</strong></p>
				  <p>Use the contact us form to submit information about your potential opportunity or just let us know about your expertise.</p>
				  <p><a href="/contact-us/index.aspx" role="button" class="btn btn-outline-primary">Contact Us</a></p>
				</div>
				<div class="col-sm-4">
				<p><strong>Would you like to recommend a resource?</strong></p>
				  <p>Click the button below to recommend a resource that you would like to see featured on the GMI website. The Secretariat and members of the Biogas Subcommittee will review your recommendation.</p>
				  <p><a href="/resources/recommend.aspx" role="button" class="btn btn-outline-primary">Recommend a resource</a></p>
				</div>
				<div class="col-sm-4">
				<p><strong>Would you like to receive updates?</strong></p>
				  <p>Sign up on the GMI mailing list to receive communications from GMI by email. You can select your topics of interest.</p>
				  <p><a href="http://eepurl.com/ggwT3T" role="button" class="btn btn-outline-primary">Join the GMI mailing list</a></p>
				  <p><a href="/communications/index.aspx" role="button" class="btn btn-outline-primary">View recent communications</a></p>
				</div>
			</div>
				
			
		</div>
	</section>	



  	<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.21/js/jquery.dataTables.js"></script>
	<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/colreorder/1.5.2/js/dataTables.colReorder.min.js"></script>	


    <!-- #include virtual="/includes/footer_scripts.aspx" -->




     <script>

         function filterColumnsAll() {

             //var searchSector = document.getElementById("col8_filterSector");
             //var searchSectorValue = searchSector.options[searchSector.selectedIndex].value;

             var searchTopic = document.getElementById("col8_filterTopic");
             var searchTopicValue = searchTopic.options[searchTopic.selectedIndex].value;

             var searchCountry = document.getElementById("col8_filterCountry");
             var searchCountryValue = searchCountry.options[searchCountry.selectedIndex].value;

             var searchStringValue = "";

             //if(searchSectorValue != "") {searchStringValue = searchSectorValue;}

             if(searchTopicValue != "") {
                    if(searchStringValue != "") {
                        searchStringValue = searchStringValue + ' ' + searchTopicValue;
                    } else {
                        searchStringValue = searchTopicValue;
                }
             }

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
</script>

			<script>

                  var otable = $('#table').DataTable({
                      pageLength: 12,
					  
                      "lengthChange": false,
                      "order": [
                          [2, "desc"],[1, 'asc']
                      ],
					  columnDefs: [
                          {
                              "title": "",
                              'targets': [0],
                              'searchable': false,
                              'orderable': false,
                              'render': function (data, type, full, meta) {
                                  if (data === "") {
									  return '<img src="/assets/images/doc_thumbs/image-not-available.png" style="width:100%;" />';
								  }
								  else {
									return '<img src="' + data + '" style="width:100%;" />';  
								  }
                              },
						      "width": "15%"
                          },

						  {
                              "render": function (data, type, row) {
                                  return '<a href="' + row[4] + '">' + data + ' </a>' +
									  '<div class="resdesc">' + row[5] + '</div>';
                              },
                              "title": "Resource",
                              "targets": [1],
						      "width": "60%"
                          },

                          {
							  "render": function (data, type, row) {
                                  return row[2] + 
                                      '<div class="resbutton"><a href="https://globalmethane.org/tools-resources/resource_details.aspx?r=' + row[3] + '" role="button" class="btn btn-outline-secondary btn-sm" target="_blank">View Details</a></div>';
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
                              "title": "Language",
                              "targets": [7],
						      "visible": false
                          },
                          {
                              "targets": [3, 4, 5],
                              "visible": false,
                              "searchable": false
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
                      filterColumnsAll();
                  });

                  $('.column_filterLanguage').on('change', function () {
					//alert('filtering on language for ' + this.value);
					otable 
						.columns( 7 )
						.search( this.value )
						.draw();
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



                  $("#toggleCard").click(function () {
                      $("#table").toggleClass("card");

					  var x1 = document.getElementById("viewTottgleText");
                      if (x1.innerHTML === "Switch to Card View") {
						  x1.innerHTML = "Switch to List View";
						  $("#toggleCard").removeClass(" btn-dark");
						  $("#toggleCard").addClass(" btn-outline-dark");	
						  $("#displayIcon").removeClass("fa fa-th-large");
						  $("#displayIcon").addClass("fa fa-bars");
						  $("#resourceListArea").removeClass(" bg-white");
                      } else {
                          x1.innerHTML = "Switch to Card View";
						  $("#toggleCard").removeClass(" btn-outline-dark");
						  $("#toggleCard").addClass(" btn-dark");	
						  $("#displayIcon").removeClass("fa fa-bars");
						  $("#displayIcon").addClass("fa fa-th-large");
						  $("#resourceListArea").addClass(" bg-white");
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

	
	
//tests the url for a type of resources based on the filter option values
$( document ).ready(function () {
		var typeNumber = getUrlParameter("type");
		var e = document.getElementById("col6_filterType");
		e.selectedIndex = typeNumber;
		var searchTypeText = e.options[e.selectedIndex].value;

		var tagsearchvalue = "";
	
//		var sectorValue = getUrlParameter("sector");
//		if (typeof sectorValue === 'undefined' || sectorValue === null) {
//			document.getElementById('col8_filterSector').selectedIndex = 0;
//			var sectorValue = "";
//		} else {
//			document.getElementById('col8_filterSector').value = sectorValue;
//			tagsearchvalue = tagsearchvalue + ' ' + sectorValue
//		};

		var countryValue = getUrlParameter("country");
		if (typeof countryValue === 'undefined' || countryValue === null) {
			document.getElementById('col8_filterCountry').selectedIndex = 0;
			var countryValue = "";
		} else {
			document.getElementById('col8_filterCountry').value = countryValue;
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
	

</script></form></body>

</html>