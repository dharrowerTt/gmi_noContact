<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="map.aspx.vb" Inherits="globalmethane2020.map" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
        <style>
      /* Always set the map height explicitly to define the size of the div
       * element that contains the map. */
      #map {
        height: 100%;
      }
      /* Optional: Makes the sample page fill the window. */
      html, body {
        height: 100%;
        margin: 0;
        padding: 0;
      }
    </style>
<body>



<script type="text/javascript">

</script>

    <div id="map"></div>
    <script>
      var map;
      function initMap() {

              var markers = [

<asp:Repeater runat="server"> </asp:Repeater>


<asp:Repeater ID="rptMarkers" runat="server">
<ItemTemplate> 
            {
            "title": '<%# Eval("Name") %>',
            "lat": '<%# Eval("Latitude") %>',
                "lng": '<%# Eval("Longitude") %>',
                "link": '<%# Eval("Id") %>'
        }
</ItemTemplate>
<SeparatorTemplate>
    ,
</SeparatorTemplate>
</asp:Repeater>
];

var infoWindow = new google.maps.InfoWindow();
        map = new google.maps.Map(document.getElementById('map'), {
            center: {lat: 51.477928, lng: -0.001545},
          zoom: 5
        });
        for (i = 0; i < markers.length; i++) {
            var data = markers[i]
            var myLatlng = new google.maps.LatLng(data.lat, data.lng);
            var marker = new google.maps.Marker({
                position: myLatlng,
                map: map,
                title: data.title
            });

            (function (marker, data) {
                google.maps.event.addListener(marker, "click", function (e) {
                    infoWindow.setContent(data.title + '<br><a href="https://www.globalmethane.org/activities/siteDetails.aspx?myObjID='+ data.link +'">Visit Site</a>');
                    infoWindow.open(map, marker);
                });
            })(marker, data);
        }
    }
</script>
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBWyfPVz6O4YZyiXd-TewNlfw2Hm4uPwo4&callback=initMap"
    async defer></script>

</body>
</html>
