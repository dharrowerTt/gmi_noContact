var map;
var markers;
var options;
var markerCluster;

function initialize() {


    var center = new google.maps.LatLng(49.2690111, 31.2158289);

var options = {    'zoom': 6,
    'minzoom': 4,
    'maxZoom': 10,
    'center': center,
  'mapTypeId': google.maps.MapTypeId.ROADMAP,
  'scaleControl': true
};

    map = new google.maps.Map(document.getElementById("map_canvas"), options);

    filterFeatures();

}

function selectAllFeatures() {
    if (document.getElementById("mapform").elements["CK_SA"].checked) {
        document.getElementById("mapform").elements["CK_Ag"].checked = true;
        document.getElementById("mapform").elements["CK_Coal"].checked = true;
        document.getElementById("mapform").elements["CK_MSW"].checked = true;
        document.getElementById("mapform").elements["CK_Oil"].checked = true;
         document.getElementById("mapform").elements["CK_Wat"].checked = true;
    }
    else {
        document.getElementById("mapform").elements["CK_Ag"].checked = false;
        document.getElementById("mapform").elements["CK_Coal"].checked = false;
        document.getElementById("mapform").elements["CK_MSW"].checked = false;
        document.getElementById("mapform").elements["CK_Oil"].checked = false;
         document.getElementById("mapform").elements["CK_Wat"].checked = false;
    }
    filterFeatures();
}

function filterFeatures(){

try{
  markerCluster.clearMarkers();
}

catch (err){

}

markers = [];

for (var i = 0; i < data.photos.length; i++) {
  

  if (document.getElementById("mapform").elements["CK_MSW"].checked) {
   if (data.photos[i].Sector=='MSW') {
        var latLng = new google.maps.LatLng(data.photos[i].lat, data.photos[i].lng);
        var iconUrl;
        switch (data.photos[i].Sector) {
          case 'MSW':
          iconUrl = "/images/MSWicon.png";
          break;
        }
      
    if ((document.getElementById("mapform").elements["GmiSiteYEScheckbox"].checked) && (data.photos[i].GMISite=='Yes'))
    {
      addMarker(map,latLng, iconUrl, i);
    }
    
    if ((document.getElementById("mapform").elements["GmiSiteNOcheckbox"].checked) && (data.photos[i].GMISite=='No'))
    {
      addMarker(map,latLng, iconUrl, i);
    }
    
     if ((document.getElementById("mapform").elements["GmiSiteNOcheckbox"].checked==false) &&(document.getElementById("mapform").elements["GmiSiteYEScheckbox"].checked==false))
    {
      addMarker(map,latLng, iconUrl, i);
    }
   }
  }
    
  if (document.getElementById("mapform").elements["CK_Ag"].checked) {
    if (data.photos[i].Sector=='Agriculture') {
        var latLng = new google.maps.LatLng(data.photos[i].lat,
        data.photos[i].lng);
        var iconUrl;
        switch (data.photos[i].Sector) {
           case 'Agriculture':
               iconUrl = "/images/Agricultureicon.png";
           break;
        }
      
    if ((document.getElementById("mapform").elements["GmiSiteYEScheckbox"].checked) && (data.photos[i].GMISite=='Yes'))
    {
      addMarker(map,latLng, iconUrl, i);
    }
    
    if ((document.getElementById("mapform").elements["GmiSiteNOcheckbox"].checked) && (data.photos[i].GMISite=='No'))
    {
      addMarker(map,latLng, iconUrl, i);
    }
    
    if ((document.getElementById("mapform").elements["GmiSiteNOcheckbox"].checked==false) &&(document.getElementById("mapform").elements["GmiSiteYEScheckbox"].checked==false))
    {
      addMarker(map,latLng, iconUrl, i);
    }
   }
  }

  if (document.getElementById("mapform").elements["CK_Coal"].checked) {
   if (data.photos[i].Sector=='Coal Mines') {
    var latLng = new google.maps.LatLng(data.photos[i].lat,
        data.photos[i].lng);
      var iconUrl;
      switch (data.photos[i].Sector) {
      case 'Coal Mines':
          iconUrl = "/images/Coalicon.png";
          break;
      
        }
      
    if ((document.getElementById("mapform").elements["GmiSiteYEScheckbox"].checked) && (data.photos[i].GMISite=='Yes'))
    
    
    {
    addMarker(map,latLng, iconUrl, i);
    }
    
    if ((document.getElementById("mapform").elements["GmiSiteNOcheckbox"].checked) && (data.photos[i].GMISite=='No'))
    
    
    {
    addMarker(map,latLng, iconUrl, i);
    }
    
     if ((document.getElementById("mapform").elements["GmiSiteNOcheckbox"].checked==false) &&(document.getElementById("mapform").elements["GmiSiteYEScheckbox"].checked==false))
    
    
    {
    addMarker(map,latLng, iconUrl, i);
    }
   }
  }

  if (document.getElementById("mapform").elements["CK_Oil"].checked) {
   if (data.photos[i].Sector=='Oil & Gas') {
    var latLng = new google.maps.LatLng(data.photos[i].lat,
        data.photos[i].lng);
       var iconUrl;
      switch (data.photos[i].Sector) {
      case 'Oil & Gas':
          iconUrl = "/images/OilGasicon.png";
          break;
      
        }
      
    if ((document.getElementById("mapform").elements["GmiSiteYEScheckbox"].checked) && (data.photos[i].GMISite=='Yes'))
    
    
    {
    addMarker(map,latLng, iconUrl, i);
    }
    
    if ((document.getElementById("mapform").elements["GmiSiteNOcheckbox"].checked) && (data.photos[i].GMISite=='No'))
    
    
    {
    addMarker(map,latLng, iconUrl, i);
    }
    
     if ((document.getElementById("mapform").elements["GmiSiteNOcheckbox"].checked==false) &&(document.getElementById("mapform").elements["GmiSiteYEScheckbox"].checked==false))
    
    
    {
    addMarker(map,latLng, iconUrl, i);
    }
   }
  }
    
  if ( document.getElementById("mapform").elements["CK_Wat"].checked) {
   if (data.photos[i].Sector=='Wastewater') {
    var latLng = new google.maps.LatLng(data.photos[i].lat,
        data.photos[i].lng);
       var iconUrl;
      switch (data.photos[i].Sector) {
      case 'Wastewater':
          iconUrl = "/images/WasteWatericon.png";
          break;
      
       }
      
    if ((document.getElementById("mapform").elements["GmiSiteYEScheckbox"].checked) && (data.photos[i].GMISite=='Yes'))
    
    
      {
      addMarker(map,latLng, iconUrl, i);
      }
    
    if ((document.getElementById("mapform").elements["GmiSiteNOcheckbox"].checked) && (data.photos[i].GMISite=='No'))
    
    
      {
      addMarker(map,latLng, iconUrl, i);
      }
      
     if ((document.getElementById("mapform").elements["GmiSiteNOcheckbox"].checked==false) &&(document.getElementById("mapform").elements["GmiSiteYEScheckbox"].checked==false))
      {
        addMarker(map,latLng, iconUrl, i);
      }
    }
  }
 }

 renderFeatures();
}

function addMarker(map,latLng, iconURL, i) {


    if (data.photos[i].Country == "Ukraine")
        {

  var marker = new google.maps.Marker({
    position: latLng,
    map:map,
    icon: iconURL
  });
   
  var Content = "<div >" +
                   "<p>"+ "Site: " + data.photos[i].Site+"</p>" +
                   "<p>"+ "Sector: " + data.photos[i].Sector+"</p>" +
                   "<p>"+ "GMI Site: " + data.photos[i].GMISite+"</p>" +
                   "<p>"+ "City/Country: " + data.photos[i].CityCountry+"</p>" +
                   "<a href=\"" + data.photos[i].URL + data.photos[i].SiteID + "\" target=\"_blank\">View Detailed Information</a>"+
                  "</div>";

  google.maps.event.addListener(marker,'click', function() {

  if (typeof infowindow != 'undefined') {
    infowindow.close();
  }

  infowindow = new google.maps.InfoWindow({
    Content: Content,
    maxWidth: 300
  });

  infowindow.open(map,marker);

  });

  markers.push(marker);
    }
}

function renderFeatures(){

  var mcOptions = {styles:[{
    height:53,
    url: "/images/m1.png",
    width:53
  }]};

  markerCluster = new MarkerClusterer(map, markers, mcOptions);
}

google.maps.event.addDomListener(window, 'load', initialize);

var infowindow = new google.maps.InfoWindow({});