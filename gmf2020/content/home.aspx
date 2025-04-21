<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="home.aspx.vb" Inherits="M2M_Redesign.home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
        <script src="https://www.amcharts.com/lib/3/ammap.js" type="text/javascript"></script>
<script src="https://www.amcharts.com/lib/3/maps/js/worldHigh.js" type="text/javascript"></script>
<script src="https://www.amcharts.com/lib/3/themes/dark.js" type="text/javascript"></script>
</head>
<body>


<div id="mapdiv" style="width: 100%; height: 450px;"></div>



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
}
});
</script>
</body>
</html>
