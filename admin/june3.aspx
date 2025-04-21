<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="june3.aspx.vb" Inherits="M2M_Redesign.june3" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<html>
<head runat="server">
    <title>Admin | June 3 Event Registrations</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.24/css/jquery.dataTables.css">




    <script language="JavaScript" type="text/javascript" src="date.js"></script>
    <script type="text/javascript" language="JavaScript">
        <!--
    //var cal = new CalendarPopup();
    function validateDataEntry() {
        return true;
    }

    function validateFieldValue() {
        if (validateDataEntry()) {
            return true;
        } else {
            return false;
        }
    }
    -->
    </script>

    <style>
        body {
            background: #D2E9EE;
        }

        .container {
            background: #fafafa;
        }

        .row {
            border-bottom: 2px solid #cacaca;
            padding-bottom: 20px;
            margin-bottom: 20px;
        }

        .radiostyle {
            height: auto;
        }

            .radiostyle label {
                margin-left: 3px !important;
                margin-right: 10px !important;
            }
            .card-text span{
                font-weight:bold;
            }
            #mapdiv {
    max-width: 100%;
}

            .show {display: block;}
.hide {display: none;}
.countrylist {height: 300px; overflow:hidden;   transition: all 0.5s ease;}
.countrylist.changeHeight {height: auto;}
           
#mapdiv {
  width: 100%;
  height: 500px;
  max-width:100%;
  background-color:#454a58;
}

.button{
    border:0;
    background:#bdc3c7;
}

/* Style the tab */
.tab {
  overflow: hidden;
  border: 1px solid white;
  background-color: #75b758;
  color:white;
}

/* Style the buttons that are used to open the tab content */
.tab button {
  background-color: inherit;
  float: left;
  border: none;
  outline: none;
  cursor: pointer;
  padding: 14px 16px;
  transition: 0.3s;
}

/* Change background color of buttons on hover */
.tab button:hover {
  background-color: #ddd;
}

/* Create an active/current tablink class */
.tab button.active {
  background-color: #51873a;
  color:white;
}

/* Style the tab content */
.tabcontent {
  display: none;
  padding: 6px 12px;
  border: 1px solid #fcfcfc;
  border-top: none;
  background:#6ab04c;
}

.tabcontent {
  animation: fadeEffect 1s; /* Fading effect takes 1 second */
}

/* Go from zero to full opacity */
@keyframes fadeEffect {
  from {opacity: 0;}
  to {opacity: 1;}
}

.clear{
    background-color:#ee5253!important;
    font-weight:bold;
    color:white;
    display:none;
}
    </style>
</head>
<body onload="chockCookie()">
    <form runat="server">
        <div id="cover"></div>
        <div class="container">
          


            <h3>A Call to Action on Methane - Admin Dashboard</h3>
            <hr />
            <div class="row">
                <div class="col-md-3">
                    <h4>Details</h4>
                    <div class="card" style="width: 18rem;">
  <div class="card-body">
    <h5 class="card-title">Total Registrants</h5>
    <p class="card-text">There are currently <span id="regNum"></span> registrants for event.</p>

  </div>
</div>

                   <div class="card" style="width: 18rem;">
  <div class="card-body">

    <h5 class="card-title">Registrants by Country</h5>
                  <button class="button">
  <span class="show">Show More</span>
  <span class="hide">Show Fewer</span>
</button>
    <p class="card-text countrylist">  <%= CountryCount  %></p>

  </div>
</div>

                </div>
             
                                   <div class="col-md-9">
                                        <h4>Countries represented at the event</h4>
                   <div id="mapdiv" style="max-width: 100%; height: 450px;"></div>
               </div>
             
            </div>
            <div class="row" style="background:#6ab04c">
                <h4>Table Filters</h4>
                <div class="col-md-12">

                    <div class="tab">
  <button class="tablinks" onclick="openTab(event, 'OrgType')" id="defaultOpen">Filter Organization Type</button>
  <button class="tablinks" onclick="openTab(event, 'Country')">Filter Country</button>
  <button class="tablinks clear" id="resetbtn">Reset All Filters</button>
</div>

<!-- Tab content -->
<div id="OrgType" class="tabcontent">
                    <select id="table-filter">
<option value="">All</option>
	<option> National government</option>
	<option>Local, regional or other government organization</option>
	<option>Financial institution </option>
	<option>Multilateral organization </option>
	<option>Non-government organization </option>
    <option>Press/Media</option>
	<option>Academia </option>
	<option>Private sector </option>
	<option>Other</option>

</select>
</div>

<div id="Country" class="tabcontent">
                    <select id="table-filter2">
<option value="">All</option>
 <%= CountryFilter  %>
</select>
</div>



 

                </div>

            </div>
           <div class="row">
               <div class="col-md-12">

	        	
                                  <asp:GridView ID="gvComms" runat="server" AutoGenerateColumns="false">
    <Columns>
        <asp:BoundField DataField="fName" HeaderText="Name (sorted by Last Name)"  />
        <asp:BoundField DataField="lName" HeaderText="Last Name"  />
        <asp:BoundField DataField="organization" HeaderText="Organization"  />
        <asp:BoundField DataField="orgType" HeaderText="Organization Type"  />
        <asp:BoundField DataField="country" HeaderText="Country"  />
    </Columns>
</asp:GridView>
               </div>

           </div>
            <div class="row"><hr /></div>
            <div class="row">
                                                  <asp:GridView ID="gvCommsQuestions" runat="server" AutoGenerateColumns="false">
    <Columns>
        <asp:BoundField DataField="question" HeaderText="Name"  />
        <asp:BoundField DataField="email" HeaderText="Email Address"  />
        <asp:BoundField DataField="panelist" HeaderText="Panelist?"  />
        <asp:BoundField DataField="status" HeaderText="Registered?"  />
        
    </Columns>
</asp:GridView>
            </div>

        </div>
    </form>

    <script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
    <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.24/js/jquery.dataTables.js"></script>

        <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/buttons/1.5.6/js/dataTables.buttons.min.js"></script>
    <script type="text/javascript" charset="utf8" src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
    <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/buttons/1.5.6/js/buttons.html5.min.js"></script>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/yadcf/0.9.4/jquery.dataTables.yadcf.min.js" integrity="sha512-WQDeHtbJgUPNqiWyZN0pLuJrVU8kE7LOsQ8FCbdabl0kk0yfRrE/l9lFpn6xQ1mIj5OtGuvIMC19Fd07oEb2+A==" crossorigin="anonymous"></script>

<script src="//cdn.amcharts.com/lib/4/core.js"></script>
<script src="//cdn.amcharts.com/lib/4/maps.js"></script>
<script src="//cdn.amcharts.com/lib/4/geodata/worldLow.js"></script>
    <script src="https://cdn.amcharts.com/lib/4/themes/animated.js"></script>

    <script type="text/javascript">
        document.getElementById("defaultOpen").click();
        function openTab(evt, cityName) {
            event.preventDefault();
            // Declare all variables
            var i, tabcontent, tablinks;

            // Get all elements with class="tabcontent" and hide them
            tabcontent = document.getElementsByClassName("tabcontent");
            for (i = 0; i < tabcontent.length; i++) {
                tabcontent[i].style.display = "none";
            }

            // Get all elements with class="tablinks" and remove the class "active"
            tablinks = document.getElementsByClassName("tablinks");
            for (i = 0; i < tablinks.length; i++) {
                tablinks[i].className = tablinks[i].className.replace(" active", "");
            }

            // Show the current tab, and add an "active" class to the button that opened the tab
            document.getElementById(cityName).style.display = "block";
            evt.currentTarget.className += " active";
        }
/**
 * ---------------------------------------
 * This demo was created using amCharts 4.
 *
 * For more information visit:
 * https://www.amcharts.com/
 *
 * Documentation is available at:
 * https://www.amcharts.com/docs/v4/
 * ---------------------------------------
 */

// Create map instance
var chart = am4core.create("mapdiv", am4maps.MapChart);

        // Set map definition
        chart.geodata = am4geodata_worldLow;


        // Set projection
        chart.projection = new am4maps.projections.Orthographic();
        chart.panBehavior = "rotateLongLat";
        chart.deltaLatitude = -20;
        chart.padding(20, 20, 20, 20);
        chart.zoomControl = new am4maps.ZoomControl();

        // limits vertical rotation
        chart.adapter.add("deltaLatitude", function (delatLatitude) {
            return am4core.math.fitToRange(delatLatitude, -90, 90);
        })


        // Create map polygon series
        var polygonSeries = chart.series.push(new am4maps.MapPolygonSeries());

        // Make map load polygon (like country names) data from GeoJSON
        polygonSeries.useGeodata = true;

        // Configure series
        var polygonTemplate = polygonSeries.mapPolygons.template;
        polygonTemplate.tooltipText = "{Popvalue}";
        polygonTemplate.fill = am4core.color("#74B266");

        // Create hover state and set alternative fill color
        var hs = polygonTemplate.states.create("hover");
        hs.properties.fill = am4core.color("#367B25");

        // Remove Antarctica
        polygonSeries.exclude = ["AQ"];

        // Add some data
        polygonSeries.data = [<%= CountryData  %>];



        // Bind "fill" property to "fill" key in data
        polygonTemplate.propertyFields.fill = "fill";
        //
        var graticuleSeries = chart.series.push(new am4maps.GraticuleSeries());
        graticuleSeries.mapLines.template.line.stroke = am4core.color("#ffffff");
        graticuleSeries.mapLines.template.line.strokeOpacity = 0.08;
        graticuleSeries.fitExtent = false;


        chart.backgroundSeries.mapPolygons.template.polygon.fillOpacity = 0.5;
        chart.backgroundSeries.mapPolygons.template.polygon.fill = am4core.color("#1B9CFC");

        // Create hover state and set alternative fill color
        var hs = polygonTemplate.states.create("hover");
        hs.properties.fill = chart.colors.getIndex(0).brighten(-0.5);

        let animation;
        setTimeout(function () {
            animation = chart.animate({ property: "deltaLongitude", to: 100000 }, 20000000);
        }, 3000)

        chart.seriesContainer.events.on("down", function () {
            if (animation) {
                animation.stop();
            }
        })

        let linkContainer = chart.createChild(am4core.Container);
        linkContainer.isMeasured = false;
        linkContainer.layout = "horizontal";
        linkContainer.x = am4core.percent(50);
        linkContainer.y = am4core.percent(90);
        linkContainer.horizontalCenter = "middle";

        let mercator = linkContainer.createChild(am4core.TextLink);
        mercator.text = "Mercator";
        mercator.margin(0, 0, 0, 0);
        mercator.events.on("hit", function () {
            chart.projection = new am4maps.projections.Mercator();
            animation.stop();
            graticuleSeries.hide();
            chart.backgroundSeries.hide();
            chart.panBehavior = "move";
            chart.zoomLevel = 10;
        })

        let orthographic = linkContainer.createChild(am4core.TextLink);
        orthographic.margin(10, 10, 10, 10);
        orthographic.text = "Orthographic";
        orthographic.events.on("hit", function () {
            chart.projection = new am4maps.projections.Orthographic();
            animation.start();
            graticuleSeries.show();
            chart.backgroundSeries.show();
            chart.panBehavior = "rotateLongLat";
        })
    </script>

    <script>
            $(document).ready(function () {
                var table = $('#gvComms').DataTable(
                    {
                        dom: 'Blfrtip',
                        buttons: [
                            'copyHtml5',
                            'excelHtml5'
                        ],
                        "aoColumns": [
                            { "aDataSort": [1, 0] },
                            null,
                            null,
                            null,
                            null,

                        ],
                        "columnDefs": [
                            {

                                "render": function (data, type, row) {
                                    return data + ' ' + row[1];
                                },
                                "targets": 0
                            },
                            { "visible": false, "targets": [1] },
                            {
                                'targets': [3],

                                'render': function (data, type, full, meta) {

                                    if (data == 'nationalGovernment') {
                                        var orgType = 'National Government';
                                    } else if (data == 'privateSector') {
                                        var orgType = 'Private Sector';
                                    } else if (data == 'academia') {
                                        var orgType = 'Academia';
                                    } else if (data == 'nongovernmentOrg') {
                                        var orgType = 'Non-Government Organization';
                                    } else if (data == 'otherGovernment') {
                                        var orgType = 'Other Government';
                                    } else if (data == 'other') {
                                        var orgType = 'Other';
                                    } else if (data == 'nationalGovernment') {
                                        var orgType = 'National Government';
                                    } else if (data == 'multilateralOrg') {
                                        var orgType = 'Multilateral Organization';
                                    } else if (data == 'financialInstitution') {
                                        var orgType = 'Financial Institution';
                                    } else if (data == 'pressmedia') {
                                        var orgType = 'Press/Media';
                                    } else if (data == 'undefined') {
                                        var orgType = '';
                                    } else {
                                        var orgType = '';
                                    }

                                    return orgType;
                                }
                            }
                        ]
                    }
                );
                
                var table2 = $('#gvCommsQuestions').DataTable();

                $('#table-filter').on('change', function () {
                    table.search(this.value).draw();
                    $('#resetbtn').show();
                });
                $('#table-filter2').on('change', function () {
                    table.search(this.value).draw();
                    $('#resetbtn').show();
                });


                var info = table.page.info();

                var location = document.getElementById("regNum");
                var text = document.createTextNode(info.recordsTotal);

                location.appendChild(text);


                $(".button").on("click", function () {
                    event.preventDefault();
                    $('.countrylist').toggleClass('changeHeight');
                    $('.button > *').toggleClass('show hide')
                });


            });
    </script>
    <script>


        function setCookie(cname, cvalue, exdays) {
            var d = new Date();
            d.setTime(d.getTime() + (exdays * 24 * 60 * 60 * 1000));
            var expires = "expires=" + d.toUTCString();
            document.cookie = "username" + "=" + cvalue + ";" + expires + ";path=/";
        }

        function getCookie(cname) {
            var name = cname + "=";
            var ca = document.cookie.split(';');
            for (var i = 0; i < ca.length; i++) {
                var c = ca[i];
                while (c.charAt(0) == ' ') {
                    c = c.substring(1);
                }
                if (c.indexOf(name) == 0) {
                    return c.substring(name.length, c.length);
                }
            }
            return "";
        }

        function checkCookie() {
            var user = getCookie("username");
            if (user != "") {
                document.getElementById("cover").style.display = "none";
            } else {
                window.location.href = "/gmi-admin/index.aspx";
            }
        }

        function deleteCookie() {
            document.cookie = "username=; expires=Thu, 01 Jan 1970 00:00:00 UTC; path=/;";
            window.location.href = "/gmi-admin/index.aspx";
        }


    </script>
    <script type="text/javascript">
        function confirmSubmission() {
            window.location.href = "comms_add.aspx";
        }
    </script>
</body>
</html>
