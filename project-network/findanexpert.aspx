<%@ Page Language="VB" AutoEventWireup="false" Inherits="M2M_Redesign.project_network_findanexpert" Codebehind="findanexpert.aspx.vb" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Project Network | Global Methane Initiative</title>
     <!-- #include virtual="/includes/include_head.html" -->
    <style>
label {display:block;}
div.filterbox {
  background-color: #fafafa;
  width: 100%;
  height: 340px;
  overflow-y: scroll;
  border: 2px solid #3198C8;
  padding:3px;
  border-radius:6px;
}

div.colfloat {
}

tr {vertical-align:top;}
td {vertical-align:top;}
</style>
</head>
<body>
    <!-- #include virtual="/includes/header.html" -->
    <!-- Page Content -->
<section class="py-5 gmi-light-blue">
    <div class="container">
        <div class="row">
            <div class="col-sm-8 vertSplitter">
	            <h1>Find an Expert</h1>
				<p>
                    Chris will write some nice text to go here.
                </p>
            </div>
			<div class="col-sm-4">
				<!--<div class="border border-secondary bg-white px-0">
					<div class="py-1 text-center bg-dark text-white"><strong>On this page</strong></div>
                            <ul class="list-group py-2">
                                <li id="phupcomingevents" runat="server" visible="false" class="list-group-item noborder nobackground py-1"><a href="#upcomingevents">Upcoming Events</a></li>
                                <li class="list-group-item noborder nobackground py-1"><a href="#recentevents">Recent Events</a></li>
                                <li class="list-group-item noborder nobackground py-1"><a href="#subcommittee">Coal Mines Subcommittee</a></li>
                                <li class="list-group-item noborder nobackground py-1"><a href="#challenge">Global Methane Challenge Stories</a></li>
								<li class="list-group-item noborder nobackground py-1"><a href="#connect">Connect, Contribute, and Stay in Touch</a></li>
                                <li class="list-group-item noborder nobackground py-1"><a href="#resources">Recent Resources</a></li>
                            </ul>
				</div>-->
            </div>
        </div>
    </div>
</section>

<section class="py-5 bg-white" id="upcomingevents" runat="server">
    <div class="container">
        
        
        <div class="row py-2">
           
            <div class="col col1">
                <div class="colfloat">
<h4>Category</h4>
<div id="category" class="filterbox">
<label for="Association"><input type="checkbox" name="category" value="Association" id="Association" /> Association</label>
<label for="Contractor"><input type="checkbox" name="category" value="Contractor" id="Contractor" /> Contractor</label>
<label for="Financial Institution"><input type="checkbox" name="category" value="Financial Institution" id="Financial Institution" /> Financial Institution</label>
<label for="Government"><input type="checkbox" name="category" value="Government" id="Government" /> Government</label>
<label for="International"><input type="checkbox" name="category" value="International" id="International" /> International</label>
<label for="NGO"><input type="checkbox" name="category" value="NGO" id="NGO" /> NGO</label>
<label for="Private Sector"><input type="checkbox" name="category" value="Private Sector" id="Private Sector" /> Private Sector</label>
<label for="Research"><input type="checkbox" name="category" value="Research" id="Research" /> Research</label>
<label for="University"><input type="checkbox" name="category" value="University" id="University" /> University</label>
<label for="Other"><input type="checkbox" name="category" value="Other" id="Other" /> Other</label>
</div>
<button id="clearcategory1"  class="usa-button usa-button--base clear margin-top-1 margin-bottom-2 text-center" name="category">Clear Category</button>
</div>
            </div>     
            <div class="col col2">
                <div class="colfloat">
<h4>Sectors</h4>
<div id="sectors" class="filterbox">
<label for="Biogas"><input type="checkbox" name="sectors" value="Biogas" id="Biogas" /> Biogas</label>
<label for="Biogas: Agriculture"><input type="checkbox" name="sectors" value="Biogas: Agriculture" id="Biogas: Agriculture" /> Biogas: Agriculture</label>
<label for="Biogas: MSW"><input type="checkbox" name="sectors" value="Biogas: MSW" id="Biogas: MSW" /> Biogas: MSW</label>
<label for="Biogas: Wastewater"><input type="checkbox" name="sectors" value="Biogas: Wastewater" id="Biogas: Wastewater" /> Biogas: Wastewater</label>
<label for="Coal Mines"><input type="checkbox" name="sectors" value="Coal Mines" id="Coal Mines" /> Coal Mines</label>
<label for="Oil & Gas"><input type="checkbox" name="sectors" value="Oil & Gas" id="Oil & Gas" /> Oil & Gas</label>
</div>
<button id="clearcategory2"  class="usa-button usa-button--base clear margin-top-1 margin-bottom-2 text-center" name="sectors">Clear Sectors</button>
</div>
            </div>     
            <div class="col col3">
                <div class="colfloat">
<h4>Partnership-wide</h4>
<div class="filterbox">
<label for="Partnership-wide"><input type="checkbox" name="geographic" value="Partnership-wide" id="Partnership-wide" /> Partnership-wide</label>
</div>
                     <button id="clearcategory3"  class="usa-button usa-button--base clear margin-top-1 margin-bottom-2 text-center" name="geographic">Clear Geography</button>
</div>
            </div>     
            <div class="col col4">
                <div class="colfloat">
<h4>Regions</h4>
<div class="filterbox">
<label for="Africa"><input type="checkbox" name="geographic" value="Africa" id="Africa" /> Africa</label>
<label for="Europe"><input type="checkbox" name="geographic" value="Europe" id="Europe" /> Europe</label>
<label for="Middle East"><input type="checkbox" name="geographic" value="Middle East" id="Middle East" /> Middle East</label>
<label for="Asia"><input type="checkbox" name="geographic" value="Asia" id="Asia" /> Asia</label>
<label for="Australia/Oceania"><input type="checkbox" name="geographic" value="Australia/Oceania" id="Australia/Oceania" /> Australia/Oceania</label>
<label for="North America"><input type="checkbox" name="geographic" value="North America" id="North America" /> North America</label>
<label for="Latin America"><input type="checkbox" name="geographic" value="Latin America" id="Latin America" /> Latin America</label>
<label for="South America"><input type="checkbox" name="geographic" value="South America" id="South America" /> South America</label>

</div>
                   
</div>
            </div>     
            <div class="col col5"><div class="colfloat">
<h4>Countries</h4>
<div class="filterbox">
<label for="Argentina"><input type="checkbox" name="geographic" value="Argentina" id="Argentina" /> Argentina</label>
<label for="Australia"><input type="checkbox" name="geographic" value="Australia" id="Australia" /> Australia</label>
<label for="Austria"><input type="checkbox" name="geographic" value="Austria" id="Austria" /> Austria</label>
<label for="Belgium"><input type="checkbox" name="geographic" value="Belgium" id="Belgium" /> Belgium</label>
<label for="Brazil"><input type="checkbox" name="geographic" value="Brazil" id="Brazil" /> Brazil</label>
<label for="Bulgaria"><input type="checkbox" name="geographic" value="Bulgaria" id="Bulgaria" /> Bulgaria</label>
<label for="Cambodia"><input type="checkbox" name="geographic" value="Cambodia" id="Cambodia" /> Cambodia</label>
<label for="Cameroon"><input type="checkbox" name="geographic" value="Cameroon" id="Cameroon" /> Cameroon</label>
<label for="Canada"><input type="checkbox" name="geographic" value="Canada" id="Canada" /> Canada</label>
<label for="Chile"><input type="checkbox" name="geographic" value="Chile" id="Chile" /> Chile</label>
<label for="China"><input type="checkbox" name="geographic" value="China" id="China" /> China</label>
<label for="Colombia"><input type="checkbox" name="geographic" value="Colombia" id="Colombia" /> Colombia</label>
<label for="Dominican Republic"><input type="checkbox" name="geographic" value="Dominican Republic" id="Dominican Republic" /> Dominican Republic</label>
<label for="Ecuador"><input type="checkbox" name="geographic" value="Ecuador" id="Ecuador" /> Ecuador</label>
<label for="Ethiopia"><input type="checkbox" name="geographic" value="Ethiopia" id="Ethiopia" /> Ethiopia</label>
<label for="European Commission"><input type="checkbox" name="geographic" value="European Commission" id="European Commission" /> European Commission</label>
<label for="Finland"><input type="checkbox" name="geographic" value="Finland" id="Finland" /> Finland</label>
<label for="France"><input type="checkbox" name="geographic" value="France" id="France" /> France</label>
<label for="Georgia"><input type="checkbox" name="geographic" value="Georgia" id="Georgia" /> Georgia</label>
<label for="Germany"><input type="checkbox" name="geographic" value="Germany" id="Germany" /> Germany</label>
<label for="Ghana"><input type="checkbox" name="geographic" value="Ghana" id="Ghana" /> Ghana</label>
<label for="Greece"><input type="checkbox" name="geographic" value="Greece" id="Greece" /> Greece</label>
<label for="Hungary"><input type="checkbox" name="geographic" value="Hungary" id="Hungary" /> Hungary</label>
<label for="Iceland"><input type="checkbox" name="geographic" value="Iceland" id="Iceland" /> Iceland</label>
<label for="India"><input type="checkbox" name="geographic" value="India" id="India" /> India</label>
<label for="Indonesia"><input type="checkbox" name="geographic" value="Indonesia" id="Indonesia" /> Indonesia</label>
<label for="Iran"><input type="checkbox" name="geographic" value="Iran" id="Iran" /> Iran</label>
<label for="Israel"><input type="checkbox" name="geographic" value="Israel" id="Israel" /> Israel</label>
<label for="Italy"><input type="checkbox" name="geographic" value="Italy" id="Italy" /> Italy</label>
<label for="Japan"><input type="checkbox" name="geographic" value="Japan" id="Japan" /> Japan</label>
<label for="Jordan"><input type="checkbox" name="geographic" value="Jordan" id="Jordan" /> Jordan</label>
<label for="Kazakhstan"><input type="checkbox" name="geographic" value="Kazakhstan" id="Kazakhstan" /> Kazakhstan</label>
<label for="Kenya"><input type="checkbox" name="geographic" value="Kenya" id="Kenya" /> Kenya</label>
<label for="Malaysia"><input type="checkbox" name="geographic" value="Malaysia" id="Malaysia" /> Malaysia</label>
<label for="Mexico"><input type="checkbox" name="geographic" value="Mexico" id="Mexico" /> Mexico</label>
<label for="Mongolia"><input type="checkbox" name="geographic" value="Mongolia" id="Mongolia" /> Mongolia</label>
<label for="Nepal"><input type="checkbox" name="geographic" value="Nepal" id="Nepal" /> Nepal</label>
<label for="Netherlands"><input type="checkbox" name="geographic" value="Netherlands" id="Netherlands" /> Netherlands</label>
<label for="Nicaragua"><input type="checkbox" name="geographic" value="Nicaragua" id="Nicaragua" /> Nicaragua</label>
<label for="Nigeria"><input type="checkbox" name="geographic" value="Nigeria" id="Nigeria" /> Nigeria</label>
<label for="Norway"><input type="checkbox" name="geographic" value="Norway" id="Norway" /> Norway</label>
<label for="Pakistan"><input type="checkbox" name="geographic" value="Pakistan" id="Pakistan" /> Pakistan</label>
<label for="Panama"><input type="checkbox" name="geographic" value="Panama" id="Panama" /> Panama</label>
<label for="Peru"><input type="checkbox" name="geographic" value="Peru" id="Peru" /> Peru</label>
<label for="Philippines"><input type="checkbox" name="geographic" value="Philippines" id="Philippines" /> Philippines</label>
<label for="Poland"><input type="checkbox" name="geographic" value="Poland" id="Poland" /> Poland</label>
<label for="Republic of Korea (South Korea)"><input type="checkbox" name="geographic" value="Republic of Korea (South Korea)" id="Republic of Korea (South Korea)" /> Republic of Korea (South Korea)</label>
<label for="Romania"><input type="checkbox" name="geographic" value="Romania" id="Romania" /> Romania</label>
<label for="Russia"><input type="checkbox" name="geographic" value="Russia" id="Russia" /> Russia</label>
<label for="Rwanda"><input type="checkbox" name="geographic" value="Rwanda" id="Rwanda" /> Rwanda</label>
<label for="Serbia"><input type="checkbox" name="geographic" value="Serbia" id="Serbia" /> Serbia</label>
<label for="Singapore"><input type="checkbox" name="geographic" value="Singapore" id="Singapore" /> Singapore</label>
<label for="South Africa"><input type="checkbox" name="geographic" value="South Africa" id="South Africa" /> South Africa</label>
<label for="Sweden"><input type="checkbox" name="geographic" value="Sweden" id="Sweden" /> Sweden</label>
<label for="Switzerland"><input type="checkbox" name="geographic" value="Switzerland" id="Switzerland" /> Switzerland</label>
<label for="Taiwan"><input type="checkbox" name="geographic" value="Taiwan" id="Taiwan" /> Taiwan</label>
<label for="Thailand"><input type="checkbox" name="geographic" value="Thailand" id="Thailand" /> Thailand</label>
<label for="Turkey"><input type="checkbox" name="geographic" value="Turkey" id="Turkey" /> Turkey</label>
<label for="Ukraine"><input type="checkbox" name="geographic" value="Ukraine" id="Ukraine" /> Ukraine</label>
<label for="United Kingdom"><input type="checkbox" name="geographic" value="United Kingdom" id="United Kingdom" /> United Kingdom</label>
<label for="United States"><input type="checkbox" name="geographic" value="United States" id="United States" /> United States</label>
<label for="Vietnam"><input type="checkbox" name="geographic" value="Vietnam" id="Vietnam" /> Vietnam</label>
</div>
</div></div>     


               
        </div>
        <div class="row py-2">
<!--
<fieldset><legend>Filter by Category</legend>
<div class="border border-base-light" id="category"> </div>
</fieldset><button aria-label="Clear Category filters" name="category">Clear</button>
-->

<!--
<hr>
<fieldset><legend>Filter by Sector</legend>
<div class="border border-base-light" id="sectors"> </div>
</fieldset><button aria-label="Clear Sectors filters" name="sectors">Clear</button>
-->

<!--
<hr>
<fieldset><legend>Filter by Geography</legend>
<div class="border border-base-light" id="geographic"> </div>
</fieldset><button aria-label="Clear Geography filters" name="geographic">Clear</button>
-->


            <br />
<h3>Project Network Members</h3>
<table  style="width:100%;" id="datatable">
<thead>
<tr>
<!--<th>Id</th>-->
<th>Name</th>
<th>Category</th>
<th>Sectors</th>
<th>Geography</th>
<th>Active Contacts</th>
<th>Expertise</th>
</tr>
</thead>
</table>








<link href="https://cdn.datatables.net/1.10.16/css/jquery.dataTables.min.css" rel="stylesheet" type="text/css" /> 
<script src="https://code.jquery.com/jquery-1.12.4.js" type="text/javascript"></script>
<script src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js" type="text/javascript"></script>


<script type="text/javascript">

// I placed the json file at this location only in order to try to make it available through a URL

fetch('pn_data.json')
  .then( async (response) => {
  // get json response
  let data = await response.json();
  if(response.status === 200){
    loadTable(data);
    loading.textContent = '';
    app.className = 'display-block'; 
  }
})
.catch((err) => {
//  loading.textContent = 'Error fetching data. Please try again later.'
//  loading.className = 'text-center text-secondary';
//  app.className = 'display-none'; 
});

function loadTable (data) {
  //Datatable

  var table = jQuery('#datatable').DataTable({
    data: data,
 aLengthMenu: [
      [10, 25, 50, 100, -1],
      [10, 25, 50, 100, "All"]
    ],
    columns: [
//    { data: null, //id
//	render: function(data) {
//		if (data.id !== null && data.id !== "") {
//			return (data.id);
//		}
//		else {
//			return ('');
//		}       
//	}
//      },
     { data: null, //name
	render: function(data) {
		if (data.name !== null && data.name !== "") {
			return ('<a href="https://www.globalmethane.org/project-network/details.aspx?ID=' + data.id + '" target="_blank">' + data.name + '</a>');  
		}
		else {
			return ('');
		}       
	}
      },
     { data: null, //organization_category
	render: function(data) {
		if (data.organization_category !== null && data.organization_category !== "") {
			return (data.organization_category);
		}
		else {
			return ('');
		}       
	}
      },
    { data: null, //sectors
	render: function(data) {
		if (data.sectors !== null && data.sectors !== "") {
			return (data.sectors);
		}
		else {
			return ('');
		}       
	}
      },
     { data: null, //geographic_interest
	render: function(data) {
		if (data.geographic_interest !== null && data.geographic_interest !== "") {
			return (data.geographic_interest);
		}
		else {
			return ('');
		}       
	}
      },
     { data: null, //activeContacts
	render: function(data) {
		if (data.activeContacts !== null && data.activeContacts !== "") {
			return (data.activeContacts);
		}
		else {
			return ('');
		}       
	}
      },
     { data: null, //expertise
	render: function(data) {
		if (data.expertise !== null && data.expertise !== "") {
			return (data.expertise);
		}
		else {
			return ('');
		}       
	}
      }
 ],

    initComplete: function() {

    //scroll for= mobile
    jQuery("#datatable").wrap("<div style='overflow:auto; width:100%;position:relative;'></div>");    

    //get data arrays for= filters
      const organization_categoryArr = data.map((d) => d.organization_category);

      //remove any empty/null values in array to prevent errors creating filters for= 
      const sectorsArrOriginal = data.map((d) => d.sectors).filter(function(el) {
        return el !== "" &&  el !== null;
      });

      //remove any empty/null values in array to prevent errors creating filters for= 
      const geographic_interestArrOriginal = data.map((d) => d.geographic_interest).filter(function(el) {
        return el !== "" &&  el !== null;
      });


      //convert semicolon deliminated strings in array to separate strings
      sectorsArr = sectorsArrOriginal.toString().split(';').filter((v) => v);
      geographic_interestArr = geographic_interestArrOriginal.toString().split(';').filter((v) => v);

      //convert comma deliminated strings in array to separate strings
      sectorsArr = sectorsArr.toString().split(',').filter((v) => v);
      geographic_interestArr = geographic_interestArr.toString().split(',').filter((v) => v);

//get unique values and sort
      const organization_categoryOpts = (organization_categoryArr.filter((v, i) => organization_categoryArr.indexOf(v) == i)).sort();
      const sectorsOpts = (sectorsArr.filter((v, i) => sectorsArr.indexOf(v) == i)).sort();
      const geographic_interestOpts = (geographic_interestArr.filter((v, i) => geographic_interestArr.indexOf(v) == i)).sort();

//create the checkbox filters
      //createFilter(organization_categoryOpts,'category');
      //createFilter(sectorsOpts,'sectors');
      //createFilter(geographic_interestOpts,'geographic');

 //build filter string with or (|) condition for= multiple column filter, search arguments: (input, regex, smart, caseInsen)
      const checkboxes = document.querySelectorAll('input[type="checkbox"]');
      for (let i = 0; i < checkboxes.length; i++) {
      checkboxes[i].addEventListener("change", function() {
      
      var category = jQuery('input:checkbox[name="category"]:checked').map(function() {
      return jQuery.fn.dataTable.util.escapeRegex(this.value);
      }).get().join('|');
      table.column(1).search(category, true, false).page(0).draw();

 var sectors = jQuery('input:checkbox[name="sectors"]:checked').map(function() {
      return jQuery.fn.dataTable.util.escapeRegex(this.value);
      }).get().join('|');
      table.column(2).search(sectors, true, false).page(0).draw();

      var geographic = jQuery('input:checkbox[name="geographic"]:checked').map(function() {
      return jQuery.fn.dataTable.util.escapeRegex(this.value);
      }).get().join('|');
      table.column(3).search(geographic, true, false).page(0).draw();

      });
    }

/*jQuery('#datatable_filter input').each(function () {
       jQuery(this).attr("placeholder", "Search...");
        jQuery(this).after('<svg class="icon usa-search__submit-icon" aria-hidden="true"><use href="/themes/epa_theme/images/sprite.artifact.svg#magnifying-glass"></use></svg>');
    });*/

  } //end initComplete
}); //end DataTable


//Function to create the filters
function createFilter(options,name) {
  for (let i = 0; i < options.length; i++) {
    let opt = options[i];
      let filter = document.getElementById(name); 
      let label = document.createElement("label");
      let checkbox = document.createElement("input");
      checkbox.type = 'checkbox';
      checkbox.name = name;
      checkbox.value = opt;
      checkbox.id = opt.replace(/[^A-Z0-9]+/ig, "");
      label.htmlfor = opt.replace(/[^A-Z0-9]+/ig, "");
      label.textContent = ' ' + opt;
      filter.appendChild(label);
      label.prepend(checkbox);    
  }
}

//Function to clear the filters
const clearButtons = document.querySelectorAll('button.usa-button--base');
for (let i = 0; i < clearButtons.length; i++) {
  clearButtons[i].addEventListener("click", function() {
    clearFilter(this.name);
  });
}
function clearFilter(name) {
  const items = document.getElementsByName(name);
    for (let i = 0; i < items.length; i++) {
      if (items[i].type == 'checkbox')
        items[i].checked = false;
    }
    //trigger change event on all
    var event = new Event('change');
    document.querySelector('input[type="checkbox"]').dispatchEvent(event);
}



} //end loadTable function




</script>       
           
        </div>

    </div>

</section>
        <script
  src="https://code.jquery.com/jquery-3.5.1.min.js"
  integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
  crossorigin="anonymous"></script>
<script type="text/javascript" language="javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
	<script type="text/javascript" language="javascript" src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/pdfmake.min.js"></script>
    
	<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.css">
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/buttons/1.5.6/css/buttons.dataTables.min.css" />
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/responsive/2.2.3/css/responsive.dataTables.min.css" />

	<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.js"></script>
    <script type="text/javascript" charset="utf-8"  src="https://cdn.datatables.net/buttons/1.5.6/js/dataTables.buttons.min.js"></script>
    <script type="text/javascript" language="javascript" src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/vfs_fonts.js"></script>
	<script type="text/javascript" language="javascript" src="https://cdn.datatables.net/buttons/1.5.6/js/buttons.html5.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/yadcf/0.9.4/jquery.dataTables.yadcf.js" integrity="sha256-j83V52uLomZxGL9GIZ7eyiv32ntFn7Kr6WQSfz3mvRs=" crossorigin="anonymous"></script>
    <script type="text/javascript" language="javascript" src="https://cdn.datatables.net/responsive/2.2.3/js/dataTables.responsive.min.js"> </script>
		
		
    <script>



        $(document).ready(function () {





            var table = $('#PNtable').DataTable({
                responsive: true,
                dom: 'Bfrtip',
                search: 'agriculture',
                buttons: [
                    'csvHtml5'

                ],
                "columns": [
                    { "width": "40%" },
                    { "width": "20%" },
                    { "width": "20%" },
                    { "width": "20%" }
                ]

            });

            yadcf.init(table, [{
                column_number: 1,
                column_data_type: "html",
                html_data_type: "text",
                filter_default_label: "All Areas",
                filter_reset_button_text: false,
                filter_container_id: "external_filter_interest"
            }, {
                column_number: 2,
                column_data_type: "html",
                html_data_type: "text",
                filter_default_label: "All Types",
                filter_reset_button_text: false,
                filter_container_id: "external_filter_orgtype"
            }, {
                column_number: 3,
                column_data_type: "html",
                html_data_type: "text",
                filter_default_label: "All Countries",
                filter_reset_button_text: false,
                filter_container_id: "external_filter_country"
            }]);


            $('#tableFilter').on('click', 'a', function () {
                event.preventDefault();
                $("#tableFilter a").removeClass("filterBold");
                $(this).addClass("filterBold");


                table
                    .columns(2)
                    .search($(this).text())
                    .draw();
            });

            $('#tableFilter').on('click', 'a.reset', function () {
                event.preventDefault();
                table
                    .search('')
                    .columns(2)
                    .search('')
                    .draw();
            });

            $(".rollup").hover(function () {
                if (!$('.eventhide').is(':visible')) {
                    $(".eventhide").slideUp("slow", function () {
                        // Animation complete.
                    });


                }
                if (!$('.sectorhide').is(':visible')) {
                    $(".sectorhide").slideUp("slow", function () {
                        // Animation complete.
                    });


                }

            });



            $(".sectorclick").click(function () {
                $(".sectorhide").slideDown("slow", function () {
                    // Animation complete.
                });
                $(".eventhide").hide();
                $(".subeventhide").hide();
            });

            $(".subeventclick").click(function () {
                $(".subeventhide").slideDown("slow", function () {
                    // Animation complete.
                });
                $(".sectorhide").hide();
                $(".eventhide").hide();
            });

            $(".eventclick").click(function () {
                $(".eventhide").slideDown("slow", function () {
                    // Animation complete.
                });
                $(".sectorhide").hide();
                $(".subeventhide").hide();
            });


            $('ul.dropdown-menu [data-toggle=dropdown]').on('click', function (event) {
                event.preventDefault();
                event.stopPropagation();
                $(this).parent().siblings().removeClass('open');
                $(this).parent().toggleClass('open');
            });

            // Add smooth scrolling to all links in navbar + footer link
            $(".navbar a, footer a[href='#home']").on('click', function (event) {
                // Make sure this.hash has a value before overriding default behavior
                if (this.hash !== "") {
                    // Prevent default anchor click behavior
                    event.preventDefault();

                    // Store hash
                    var hash = this.hash;

                    // Using jQuery's animate() method to add smooth page scroll
                    // The optional number (900) specifies the number of milliseconds it takes to scroll to the specified area
                    $('html, body').animate({
                        scrollTop: $(hash).offset().top
                    }, 900, function () {

                        // Add hash (#) to URL when done scrolling (default click behavior)
                        window.location.hash = hash;
                    });
                } // End if
            });

            $(window).scroll(function () {
                $(".slideanim").each(function () {
                    var pos = $(this).offset().top;

                    var winTop = $(window).scrollTop();
                    if (pos < winTop + 600) {
                        $(this).addClass("slide");
                    }
                });
            });
        })





        $("#clickme").click(function () {
            $(".hider").slideToggle("slow", function () {
                // Animation complete.
            });
        });





        var vid = document.getElementById("myVideo");



        $(window).scroll(function () {
            var y_scroll_pos = window.pageYOffset;
            var scroll_pos_test = 150;
            // set to whatever you want it to be

            if (y_scroll_pos > scroll_pos_test) {
                $("#smalllogo").slideDown("slow", function () {
                    // Animation complete.
                });
            } else {
                $("#smalllogo").slideUp("slow", function () {
                    // Animation complete.
                });
            }
        });
    </script>


    <!-- Optional JavaScript -->
<!-- jQuery first, then Popper.js, then Bootstrap JS -->

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
    window.onscroll = function () { scrollFunction() };

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
     <!-- #include virtual="/includes/footer.html" -->
</body>

</html>