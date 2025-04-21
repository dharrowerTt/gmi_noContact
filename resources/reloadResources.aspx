<%@ Page Language="VB" AutoEventWireup="false" Inherits="M2M_Redesign.reloadresources" Codebehind="reloadResources.aspx.vb" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Tools &amp; Resources | Global Methane Initiative</title>
     <!-- #include virtual="/includes/include_head.html" -->
</head>
<body>
    <!-- #include virtual="/includes/header.html" -->
    <form id="resources_index_form" runat="server">
    <div>
    <!-- Page Content -->
    <section class="py-5 gmi-light-blue">
        <div class="container">
            <div class="row">
                <div class="col-sm-7 vertSplitter">
                    <h1>Tools &amp; Resources</h1>
                    <asp:Literal ID="litTitle" runat="server"></asp:Literal>
                   <p>
                       Please wait while the list of resources loads below.</p>

                    </div>
                
                
            </div>

        </div>
        
        
    </section>
   
<section class="py-5 bg-white" id="resourceListArea">
        <div class="container"> 

			
			<div id="loading" runat="server" class="loading" style="background:white;color:#0B7AC0;position:absolute;left:0%;top0%;width:100%;height:100%;text-align:center;z-index:999;">
				<i class="fa fa-spinner fa-spin" style="font-size:48px"></i>
			</div>
			


<asp:Placeholder id="phResourceList" runat="server" Visible="false"></asp:Placeholder>	
            <div id="allresources" runat="server" visible="false"><!-- #include virtual="/resources/all_resources.html" --></div>
           

            
                        		
<!-- example row 
<tr><td class="gmi-light-resource">/assets/images/doc_thumbs/jpeg/event_biogas_517_2019Jul23_Developmentofbiogas.jpg</td><td>&#x412;&#x43E;&#x437;&#x43E;&#x431;&#x43D;&#x43E;&#x432;&#x43B;&#x44F;&#x435;&#x43C;&#x430;&#x44F; &#x44D;&#x43D;&#x435;&#x440;&#x433;&#x438;&#x44F; &#x434;&#x43B;&#x44F; &#x431;&#x438;&#x43E;&#x433;&#x430;&#x437;&#x430;</td><td>2019</td><td>4809</td><td>//globalmethane.org/documents/event_biogas_517_2019Jul23_Developmentofbiogas.pdf</td><td>Presentation from GMI’s participation in the Water Expo Central Asia 2019 held in Almaty, Kazakhstan in May 2019.</td><td>Presentation</td><td>Russian</td><td>biogas,ww,Kazakhstan,General Information</td></tr>
    -->


			
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

             var searchSector = document.getElementById("col8_filterSector");
             var searchSectorValue = searchSector.options[searchSector.selectedIndex].value;

             var searchCountry = document.getElementById("col8_filterCountry");
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
				 $('#table').DataTable().column(9).search(topicCheckboxValues, true, false ).draw();
			 }
			 else {
				 $('#table').DataTable().column(9).search("", true, false ).draw();
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
	  document.getElementById("col8_filterSector").selectedIndex = 0;
	  document.getElementById("col8_filterCountry").selectedIndex = 0;
	  document.getElementById("col7_filterLanguage").selectedIndex = 0;
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
                                      '<div class="resbutton"><a href="/resources/details.aspx?resourceid=' + row[3] + '" role="button" class="btn btn-outline-secondary btn-sm" target="_blank">View Details</a></div>';
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
                          },
                          {
                              "targets": [9],
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
						  $("#resourceListArea").removeClass(" bg-white");
                      } else {
                          x1.innerHTML = "Switch to Card View";
						  $("#toggleCard").removeClass(" btn-outline-primary");
						  $("#toggleCard").addClass(" btn-primary");	
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
	
		var sectorValue = getUrlParameter("sector");
		if (typeof sectorValue === 'undefined' || sectorValue === null) {
			document.getElementById('col8_filterSector').selectedIndex = 0;
			var sectorValue = "";
		} else {
			document.getElementById('col8_filterSector').value = sectorValue;
			tagsearchvalue = tagsearchvalue + ' ' + sectorValue
		};

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
	

</script></body>

</html>
