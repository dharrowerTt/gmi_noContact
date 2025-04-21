<%@ Page Language="VB" AutoEventWireup="false" Inherits="M2M_Redesign.resources_index" Codebehind="index.aspx.vb" %>

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
                        This library contains more than 2,000 resources, including reports, presentations, fact sheets, and
                        calculators. These resources span the lifetime of GMI and projects and events from around the world.
						Use the search box and filters below to find resources.</p>

                    </div>
                <div class="col-sm-5">
					<div class="border border-secondary bg-white px-0">
						<div class="py-1 text-center bg-dark text-white"><strong>Recommend a Resource</strong></div>
						
				  		<p class="py-2 px-3">Would you like to recommend a resource for this library. The Secretariat will review your recommendation.
						<br><br>
				  		<a href="recommend.aspx" role="button" class="btn btn-outline-primary">Recommend a resource</a></p>

					</div>

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
                    <button class="btn btn-secondary" type="button" id="showFilters" data-toggle="collapse" data-target="#filterArea" aria-expanded="false" aria-controls="collapseExample"><i class="fa fa-filter" aria-hidden="true"></i> Filters</button>
				</div>
			</div>
		</div>

        <div class="container collapse bg-white border py-3 p-3" id="filterArea">
			<div class="alert alert-secondary" role="alert" id="filterInstructions">Select criteria below to filter the list of resources. Press the <strong>CTRL</strong> key to select multiple options within a category.</div>
			<div class="row no-gutters">
				                <div class="col-sm-3">
                                         <strong>Sector</strong><br>
                                         <select multiple name="Select1" class="column_filter" id="col8_filterSector" data-column="8" style="height:200px;width:95%;">
                                            <!--<option value="">All</option>-->
		                                      <option value="Biogas">Biogas</option>
		                                      <option value="Agriculture">&nbsp;&nbsp;Agriculture</option>
		                                      <option value="Municipal Solid Waste">&nbsp;&nbsp;Municipal Solid Waste</option>
		                                      <option value="Wastewater">&nbsp;&nbsp;Wastewater</option>
 		                                      <option value="Coal Mines">Coal</option>
		                                      <option value="Oil & Gas">Oil & Gas</option>
		                                      <option value="Steering">Steering</option>
		                                     <!--<option value="Multiple">Multiple</option>-->
                                  		</select>
                		</div>				  
				<div class="col-sm-3">
                    <strong>Topic</strong><br>
                    <select multiple name="topiccheck" class="column_filter" id="col9_filterTopic" data-column="9" style="height:200px;width:95%;">
                      <!--<option value="">All</option>-->
                      <option value="Best Practices">Best Practices</option>
                      <option value="Feasibility Studies">Pre- and Full Feasibility Studies</option>
                      <option value="Methane Reduction Strategies">Methane Reduction Strategies</option>
                    <option value ="Calculators and Models">Calculators and Models</option>
                      <option value="Technologies">Technologies</option>
                      <option value="Research">Research</option>
                      <option value="Policy">Policy</option>
                      <option value="Funding">Funding</option>
                      <option value="Energy">Energy</option>
                      <option value="Collaboration">GMI Collaboration Efforts</option>
                      <option value="Country Updates">Country Updates</option>
                      <option value="Sector Updates">Sector Updates</option>
                    </select>
              </div>
              <div class="col-sm-2">
		                                  <strong>Country/Region</strong><br>
                                          <select multiple name="Select2" class="column_filterC" id="col10_filterCountry" data-column="8" style="height:200px;width:95%;">
                                            <!--<option value="">All</option>-->
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
             			</div>
                         <div class="col-sm-2">
                            <strong>Type</strong><br>
                           <select multiple name="Select4" class="column_filterType" id="col11_filterType" data-column="8" style="height:200px;width:95%;">
                               <!--<option value="">All</option>-->
                               <option value="Fact Sheet">Fact Sheets</option>
                               <option value="Meeting">Meeting Materials</option>
                               <option value="Document">Reports & Document</option>
                               <option value="Presentation">Presentations</option>
                              <!-- <option value="Calculator">Calculator</option> -->
                               <option value="Tool/Model">Tool/Model</option>
                               <option value="Video">Videos</option>
                             </select>
                      </div>

				<div class="col-sm-2">
		                                  <strong>Language</strong><br>
                                          <select name="Select3" class="column_filterLanguage" id="col7_filterLanguage" data-column="7">
	                                      <option value="">All</option>
	                                      <option value="English">English</option>
	                                      <option value="Chinese">Chinese</option>
	                                      <option value="French">French</option>
	                                      <option value="German">German</option>
	                                      <option value="Mongolian">Mongolian</option>
	                                      <option value="Portuguese">Portuguese</option>
	                                      <option value="Russian">Russian</option>
	                                      <option value="Spanish">Spanish</option>
	                                      <option value="Thai">Thai</option>
	                                      <option value="Ukranian">Ukrainian</option>
                                    </select>
                                    <br><br>
                                    <strong>Format</strong><br>
                                      <select name="resformat" class="column_format" id="col6_format" data-column="6">
                                          <option value="">All</option>
                                          <option value="PDF">PDF</option>
                                          <option value="Excel">Excel</option>
                                          <option value="Website">Website</option>
                                        </select>
                                </div>			
                            </div>
                                <hr>
                                <p class="text-center">
                                  <button type="button" class="btn btn-primary btn" id="applyFilters"><i class="fa fa-arrow-circle-down" aria-hidden="true"></i> Apply Filters</button>
                                  <button type="button" class="btn btn-danger btn" id="clearFilters"><i class="fa fa-times" aria-hidden="true"></i> Clear Filters</button>
                                </p>
                            </div>
                    
                        </section>
                    
                    <section class="py-2 bg-white" id="filterDisplayArea">
                            <div class="container"> 

                                <div class="alert alert-primary invisible" role="alert" id="filtersApplied"></div>
                    
                                
                                <div class="row">
                                    <div class='col-9'>
                                        Showing resources from 
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
                                              <option value="2021">2021</option>
                                            </select>
                                          through 
                                          <select name="max" class="column_filterYear" id="max">
                                            <option value="2021">2021</option>
                                              <option value="2020">2020</option>
                                              <option value="2019">2019</option>
                                              <option value="2018">2018</option>
                                              <option value="2017">2017</option>id="resourceListArea"
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
                                        </div>
                 
		
				</div>

             </div>
		</div>

	</section>

<section class="py-5 bg-white" id="resourceListArea">
        <div class="container"> 

			
			<div class="loading" style="background:white;color:#0B7AC0;position:absolute;left:0%;top0%;width:100%;height:100%;text-align:center;z-index:999;">
				<i class="fa fa-spinner fa-spin" style="font-size:48px"></i>
			</div>
			

<a href="#" id="toggleCard" class="btn btn-dark btn-lg float-left" role="button"><i class="fa fa-th-large" aria-hidden="true" id="displayIcon"></i> <span id="viewTottgleText">Switch to Card View</span></a>
<asp:Placeholder id="phResourceList" runat="server" Visible="false"></asp:Placeholder>	
            <div id="allresources" runat="server" visible="false"><!-- #include virtual="/resources/all_resources.html" --></div>
            <div id="coalresources" runat="server" visible="false"><!-- #include virtual="/resources/coal_resources.html" --></div>
                        <div id="biogasresources" runat="server" visible="false"><!-- #include virtual="/resources/biogas_resources.html" --></div>
                        <div id="oilgasresources" runat="server" visible="false"><!-- #include virtual="/resources/oil_resources.html" --></div>
            <asp:LinkButton ID="reloadResources" runat="server" Click="reload_click" />
                        		
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

             var searchCountry = document.getElementById("col10_filterCountry");
             var searchCountryValue = searchCountry.options[searchCountry.selectedIndex].value;

             var searchStringValue = "";


             //is a sector selected?
             if (searchSectorValue != "") { searchStringValue = searchSectorValue; }

             //is a country selected
             if (searchCountryValue != "") {
                 if (searchStringValue != "") {
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
        function (settings, data, dataIndex) {
            var min = parseInt($('#min').val(), 10);
            var max = parseInt($('#max').val(), 10);
            var year = parseFloat(data[2]) || 0; // use data for the year column

            if (min > max) {
                alert('You have selected an invalid range.');
                document.getElementById("min").selectedIndex = "0";
                return false;
            }

            if ((isNaN(min) && isNaN(max)) ||
                (isNaN(min) && year <= max) ||
                (min <= year && isNaN(max)) ||
                (min <= year && year <= max)) {
                return true;
            }
            return false;
        }
    );

    $(document).ready(function () {
        var table = $('#table').DataTable();

        // Event listener to the two range filtering inputs to redraw on input
        $('#min, #max').on('change', function () {
            table.draw();
        });
    });

    $(document).ready(function () {
        $('#applyFilters').click(function () {

            var searchSectorValues = [];
            for (var option of document.getElementById("col8_filterSector").options) {
                if (option.selected) {
                    searchSectorValues.push(option.value);
                }
            }


            var searchTopicValues = [];
            for (var option of document.getElementById("col9_filterTopic").options) {
                if (option.selected) {
                    searchTopicValues.push(option.value);
                }
            }

            var searchCountryValues = [];
            for (var option of document.getElementById("col10_filterCountry").options) {
                if (option.selected) {
                    searchCountryValues.push(option.value);
                }
            }

            var searchLanguageValues = [];
            for (var option of document.getElementById("col7_filterLanguage").options) {
                if (option.selected) {
                    searchLanguageValues.push(option.value);
                }
            }

            var searchTypeValues = [];
            for (var option of document.getElementById("col11_filterType").options) {
                if (option.selected) {
                    searchTypeValues.push(option.value);
                }
            }

            var searchFormatValues = [];
            for (var option of document.getElementById("col6_format").options) {
                if (option.selected) {
                    searchFormatValues.push(option.value);
                }
            }

            var searchStringValueCol8 = searchSectorValues + '';
            searchstringCol8 = searchStringValueCol8.replace(/,/g, '|');

            var searchStringValueCol9 = searchTopicValues + '';
            searchstringCol9 = searchStringValueCol9.replace(/,/g, '|');

            var searchStringValueCol10 = searchCountryValues + '';
            searchstringCol10 = searchStringValueCol10.replace(/,/g, '|');

            var searchStringValueCol11 = searchTypeValues + '';
            searchstringCol11 = searchStringValueCol11.replace(/,/g, '|');

            //var filterSearchAlert = 'Col8 (Sector): ' + searchstringCol8 + ' \nCol 9 (Topic): ' + searchstringCol9 + ' \nCol 10 (Country): ' + searchstringCol10 + ' \nCol 11 (Type): ' + searchstringCol11;
            //alert(filterSearchAlert);



            var table = $('#table').DataTable();
            table
                .columns(6)
                .search(searchFormatValues)
                .columns(7)
                .search(searchLanguageValues)
                .columns(8)
                .search(searchstringCol8, true, false)
                .columns(9)
                .search(searchstringCol9, true, false)
                .columns(10)
                .search(searchstringCol10, true, false)
                .columns(11)
                .search(searchstringCol11, true, false)
                .draw();





            var alertstringCol8 = searchStringValueCol8.replace(/,/g, ' OR ');
            var alertstringCol9 = searchStringValueCol9.replace(/,/g, ' OR ');
            var alertstringCol10 = searchStringValueCol10.replace(/,/g, ' OR ');
            var alertstringCol11 = searchStringValueCol11.replace(/,/g, ' OR ');
            var filterAlert = "";
            if (alertstringCol8 != "") { filterAlert = 'Sector: ' + alertstringCol8 + '<br>'; }
            if (alertstringCol9 != "") {

                var alertstringCol9Mod = alertstringCol9.replace("Feasibility Studies", "Pre- and Full Feasibility Studies");

                filterAlert = filterAlert + 'Topic: ' + alertstringCol9Mod + '<br>';
            }
            if (alertstringCol10 != "") { filterAlert = filterAlert + 'Country: ' + alertstringCol10 + '<br>'; }
            if (alertstringCol11 != "") { filterAlert = filterAlert + 'Type: ' + alertstringCol11 + '<br>'; }
            if (searchLanguageValues != "") { filterAlert = filterAlert + 'Language: ' + searchLanguageValues + '<br>'; }
            if (searchFormatValues != "") { filterAlert = filterAlert + 'Format: ' + searchFormatValues; }


            if (filterAlert != "") {
                filterAlert = "<strong>Filters Applied:</strong><br>" + filterAlert;
                document.getElementById("filtersApplied").innerHTML = filterAlert;
                document.getElementById("filtersApplied").classList.remove("invisible");
                document.getElementById("filtersApplied").classList.add(" visible");
            } else {
                document.getElementById("filtersApplied").innerHTML = "No filters applied";
                document.getElementById("filtersApplied").classList.remove("visible");
                document.getElementById("filtersApplied").classList.add("invisible");
            }

        });
    });


    $(document).ready(function () {
        $('#clearFilters').click(function () {
            document.getElementById("col8_filterSector").selectedIndex = -1;
            document.getElementById("col9_filterTopic").selectedIndex = -1;
            document.getElementById("col10_filterCountry").selectedIndex = -1;
            document.getElementById("col7_filterLanguage").selectedIndex = 0;
            document.getElementById("col11_filterType").selectedIndex = -1;
            document.getElementById("col6_format").selectedIndex = 0;
            document.getElementById("min").selectedIndex = 0;
            document.getElementById("max").selectedIndex = 0;
            document.getElementById("filtersApplied").innerHTML = "No filters applied";
            document.getElementById("filtersApplied").classList.remove("visible");
            document.getElementById("filtersApplied").classList.add("invisible");
            var table = $('#table').DataTable();
            table
                .search('')
                .columns().search('')
                .draw();
        });
    });	
</script>

			<script>
                //creates the datatable
                var otable = $('#table').DataTable({
                    pageLength: 12,
                    "lengthChange": false,
                    "order": [
                        [2, "desc"], [1, 'asc']
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
                            "targets": [3],
                            "visible": false,
                            "searchable": false
                        },
                        {
                            "targets": [4],
                            "visible": false,
                            "searchable": false
                        },
                        {
                            "targets": [5],
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
                        },
                        {
                            "targets": [10],
                            "visible": false,
                            "searchable": true
                        },
                        {
                            "targets": [11],
                            "visible": false,
                            "searchable": true
                        }
                        ,
                        {
                            "targets": [12],
                            "visible": false,
                            "searchable": true
                        },
                        
                        {
                            "targets": [13],
                            "visible": false,
                            "searchable": true
                        }


                    ],

                    "initComplete": function (settings, json) {
                        $('div.loading').remove();
                    }


                });


                $('#myInputTextField').keyup(function () {
                    otable.search($(this).val()).draw();
                })


                $("#toggleCard").click(function () {
                    event.preventDefault();
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
    $(document).ready(function () {
        var typeValue = getUrlParameter("type");
        if (typeof typeValue === 'undefined' || typeValue === null) {
            document.getElementById('col11_filterType').selectedIndex = -1;
            var typeValue = "";
        } else {
            document.getElementById('col11_filterType').value = typeValue;
            tagsearchvalue = tagsearchvalue + ' ' + typeValue
        };

        var tagsearchvalue = "";

        var sectorValue = getUrlParameter("sector");
        if (typeof sectorValue === 'undefined' || sectorValue === null) {
            document.getElementById('col8_filterSector').selectedIndex = -1;
            var sectorValue = "";
        } else {

            var sectorValueLookup = "";
            switch (sectorValue) {
                case "biogas":
                    sectorValueLookup = "Biogas";
                    break;
                case "coal%20mines":
                    sectorValueLookup = "Coal";
                    break;
                case "Oil%20&%20Gas":
                    sectorValueLookup = "Oil & Gas";
                    break;
                case "coal mines":
                    sectorValueLookup = "Coal Mines";
                    break;
                case "Oil & Gas":
                    sectorValueLookup = "Oil & Gas";
                    break;
                case "Oil ":
                    sectorValueLookup = "Oil & Gas";
                    break;
                default:
                    sectorValueLookup = sectorValue;
            }

       
            document.getElementById('showFilters').click();
            document.getElementById("col8_filterSector").value = sectorValueLookup;
            document.getElementById('applyFilters').click();
            // document.getElementById('col8_filterSector').value = sectorValue;
            //sectorValuePL = sectorValue.replace(/%20/g, " ");
            //sectorValuePL = sectorValue.replace(" and ", " & ");
            //document.getElementById('col8_filterSector').value = sectorValuePL;
            //tagsearchvalue = tagsearchvalue + ' ' + sectorValue
        };

        var countryValue = getUrlParameter("country");
        if (typeof countryValue === 'undefined' || countryValue === null) {
            document.getElementById('col10_filterCountry').selectedIndex = -1;
            var countryValue = "";
        } else {
            document.getElementById('col10_filterCountry').value = countryValue;
            tagsearchvalue = tagsearchvalue + ' ' + countryValue
        };

        var table = $('#table').DataTable();
        table
            .columns(6)
            .search(searchTypeText)
            .columns(8)
            .search(tagsearchvalue)
            .draw();

    });


</script>
</body>

</html>
