<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="index.aspx.vb" Inherits="M2M_Redesign.index110" %>

<!doctype html>
<html lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!--#include file="../_register/googleAnalytics.html"-->

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

    <title>Global Methane Forum 2020</title>
    <link rel="stylesheet" type="text/css" href="../_register/css/addon.css">
    <link rel="stylesheet" type="text/css" href="../_register/css/formstyles.css">
    <link rel="stylesheet" type="text/css" href="eventcss/eventstyles.css">

    <link rel="stylesheet" type="text/css" href="include/animate.css">
    <script src="https://use.fontawesome.com/f40f14ac2c.js"></script>
            <script src="https://www.amcharts.com/lib/3/ammap.js" type="text/javascript"></script>
<script src="https://www.amcharts.com/lib/3/maps/js/worldHigh.js" type="text/javascript"></script>
<script src="https://www.amcharts.com/lib/3/themes/dark.js" type="text/javascript"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
    <meta name="theme-color" content="#0d5d84" />
</head>
<body>
     <div id="page-container">
   <div id="content-wrap">
    <!--#include file="include/header.html"-->

    <div class="container" style="margin-top: 3.5rem;">
        <!-- Example row of columns -->
        <div class="row">
            <div class="col-md-8">

                  <!--#include file="content/home.html"-->

            </div>
            <div class="col-md-4 order-first order-md-last">

                <form id="form1" runat="server">

                    <fieldset>
                        <legend>Register</legend>
                        <!--<label for="emailaddress">Enter your email to begin</label><br>
                        <asp:TextBox runat="server" type="email" name="emailaddress" ID="emailaddress" class="inputfull" value="" required />
-->Regretfully, the Global Methane Forum 2020 did not take place as scheduled in March in Geneva, due to public health concerns related to the coronavirus.<br><br>
We appreciate the strong interest and support for this event, and we apologize for any inconvenience.  
<br><br>It is our intent to reschedule the Global Methane Forum to take place in 2021; we will keep you updated.
                    </fieldset>
                    <div class="centerbutton">

                       <!-- <asp:Button ID="Button1" runat="server" Text="Register" />-->
                    </div>
                </form>
            </div>
        </div>
        <!--<div class="row">
            <div class="col-md-12">
                      <h4>
                See Which Countries Will Be Represented at the Forum</h4>
                <p>As with previous events, we anticipate hundreds of stakeholders to attend from numerous countries. The map below highlights the countries that are currently represented by registered participants. <a href="register.aspx">Register today</a>!</p>
                <div id="mapdiv" style="width: 100%; height: 450px;"></div>

            </div>
        </div>-->
        <!--#include file="content/homeExtended.html"-->

    </div>
    <!-- /container -->
 
       </div>
    <!--#include file="include/footer.html"-->
         </div>
    <script>
        var element = document.getElementById("homeLink");
        element.classList.add("active");
        


    </script>

    <script type="text/javascript">


var map = AmCharts.makeChart("mapdiv",{
type: "map",
theme: "dark",
projection: "mercator",
panEventsEnabled : false,
backgroundColor: "#30336b",
backgroundAlpha: 1,
zoomOnDoubleClick: false,
zoomControl: {
   homeButtonEnabled: false,
   zoomControlEnabled: false,
   zoomOnDoubleClick: false
},
dataProvider : {
map : "worldHigh",
getAreasFromMap : true,
areas :
[

<%= PlaceHolder1 %>
{
    'id': 'US',
    'showAsSelected': true
}
]
},
areasSettings : {
autoZoom : false,
color: "#6ab04c",
colorSolid : "#84ADE9",
selectedColor: "#f9ca24",
outlineColor : "#666666",
rollOverColor: "#badc58",
rollOverOutlineColor: "#6ab04c"
},
legend: {
    "width": "100%",
    "marginRight": 27,
    "marginLeft": 27,
    "equalWidths": false,
    "backgroundAlpha": 0,
    "backgroundColor": "#FFFFFF",
    "borderColor": "#ffffff",
    "borderAlpha": 0,
    "top": 00,
    
    "left": 0,
    "horizontalGap": 10,
    "data": [ {
      "title": "Registered to attend",
      "color": "#f9ca24"
    }]
  },
});

Swal.fire({
  title: 'Alert!',
  html: '<span style="color:#232323">Regretfully, the Global Methane Forum 2020 did not take place as scheduled in March in Geneva, due to public health concerns related to the coronavirus. <br><br>We appreciate the strong interest and support for this event, and we apologize for any inconvenience.<br><br>It is our intent to reschedule the Global Methane Forum to take place in 2021; we will keep you updated. </span>',
  icon: 'warning',
  background: '#fafafa',
  confirmButtonText: 'Okay'
})
</script>

    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</body>
</html>

