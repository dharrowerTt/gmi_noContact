<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="agenda.aspx.vb" Inherits="M2M_Redesign.agenda2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Link Tree - Agenda | Global Methane Initiative</title>
       <!-- #include virtual="/includes/include_head.html" -->
    <script>
        function setCookie(cname, cvalue, exdays) {
            const d = new Date();
            d.setTime(d.getTime() + (exdays * 24 * 60 * 60 * 1000));
            let expires = "expires=" + d.toUTCString();
            document.cookie = cname + "=" + cvalue + ";" + expires + ";path=/";
        }

        function getCookie(cname) {
            let name = cname + "=";
            let decodedCookie = decodeURIComponent(document.cookie);
            let ca = decodedCookie.split(';');
            for (let i = 0; i < ca.length; i++) {
                let c = ca[i];
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
            let user = getCookie("userid");
            if (user != "") {
                console.log("Welcome again " + user);
            } else {

                function getQueryVariable(variable) {
                    var query = window.location.search.substring(1);
                    var vars = query.split("&");
                    for (var i = 0; i < vars.length; i++) {
                        var pair = vars[i].split("=");
                        if (pair[0] == variable) { return pair[1]; }
                    }
                    return (false);
                }

                user = getQueryVariable("id");

                if (user != "" && user != null) {
                    setCookie("userid", user, 30);
                } else {
                    window.location.href = "http://www.globalmethane.org/2024forum";
                }
            }
        }
    </script>
    <style>
        body {
    padding-top: 5rem;
}
    </style>
    <script src="../2024forum/js/daypilot/daypilot-all.min.js"></script>
</head>
<body onload="checkCookie()">
    <nav class="navbar navbar-expand-md navbar-dark bg-dark fixed-top">
        <div class="container">
      <a class="navbar-brand" href="index.aspx">Home</a>
      <a class="navbar-toggler" data-toggle="collapse" data-target="#navbarsExampleDefault" aria-controls="navbarsExampleDefault" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </a>

      <div class="collapse navbar-collapse" id="navbarsExampleDefault">
          
        <ul class="navbar-nav mr-auto">
            <li class="nav-item active">
            <a class="nav-link" href="agenda.aspx">Review Agenda <span class="sr-only">(current)</span></a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="connections.aspx">Make Connections </a>
          </li>
            <li class="nav-item">
            <a class="nav-link" href="feedback.aspx">Session Feedback</a>
          </li>
            <li class="nav-item">
            <a class="nav-link" href="photos.aspx">Submit Photos</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="https://forms.office.com/Pages/DesignPageV2.aspx?subpage=design&token=2463cbdf7b1c4c55a4fb65a4a68bd841&wdlor=cD8B70A01-E6F5-4F61-BC54-8F3163DAE134&id=uuQPpMer_kiHkrQ4iZNkAOHm6AdDWoNOmsvV4WobLu9UOU9DWVE0M0ZJQlpVVlNBU09FVEVBREdHRy4u&topview=Preview" target="_blank">Evaluate the Forum</a>
          </li>
        </ul>
              </div>
      </div>
    </nav>
    <form id="form1" runat="server">
        <div>
<div class="container">
    <div class="row">
        <div class="col-md-12">
    <h2>Today's Agenda</h2>
             <div id="dp"></div>
    </div>
    </div>
    </div>

             <script>
                 const dp = new DayPilot.Calendar("dp", {

                     locale: "en-gb",
                     viewType: "WorkWeek",
                     headerDateFormat: "dddd (d MMMM)",
                     timeRangeSelectedHandling: "Disabled",
                     cellDuration: 15,
                     cellHeight: 25,
                     eventMoveHandling: "Disabled",
                     eventResizeHandling: "Disabled",
                     heightSpec: "BusinessHoursNoScroll",
                 });

                 dp.viewType = "Days";
                 dp.showCurrentTime = true;
                 dp.days = 1;
                 dp.businessBeginsHour = 9;
                 dp.businessEndsHour = 20;
                 dp.useEventBoxes = "Never";
                 dp.eventArrangement = "SideBySide";
                 dp.startDate = "2024-03-18";
                 dp.events.list = [{
                     "id": 66,
                     "start": "2024-03-18T16:40:00",
                     "end": "2024-03-18T16:55:00",
                     "text": "Break",
                     "backColor": "#cacaca",
                     "barColor": "#565656"
                 }, {
                     "id": 67,
                     "start": "2024-03-19T16:20:00",
                     "end": "2024-03-19T16:35:00",
                     "text": "Break",
                     "backColor": "#cacaca",
                     "barColor": "#565656"
                 }, {
                     "id": 68,
                     "start": "2024-03-20T16:40:00",
                     "end": "2024-03-20T16:55:00",
                     "text": "Break",
                     "backColor": "#cacaca",
                     "barColor": "#565656"
                 }, {
                     "id": 63,
                     "start": "2024-03-18T13:00:00",
                     "end": "2024-03-18T14:00:00",
                     "text": "Break",
                     "backColor": "#cacaca",
                     "barColor": "#565656"
                 }, {
                     "id": 64,
                     "start": "2024-03-19T13:00:00",
                     "end": "2024-03-19T14:00:00",
                     "text": "Break",
                     "backColor": "#cacaca",
                     "barColor": "#565656"
                 }, {
                     "id": 65,
                     "start": "2024-03-20T13:00:00",
                     "end": "2024-03-20T14:00:00",
                     "text": "Break",
                     "backColor": "#cacaca",
                     "barColor": "#565656"
                 }, {
                     "id": 163,
                     "start": "2024-03-18T14:00:00",
                     "end": "2024-03-18T15:00:00",
                     "text": "Informal Networking: Free-form meeting and discussion space",
                     "backColor": "#DDA7D9",
                     "barColor": "#A03E99"
                 }, {
                     "id": 164,
                     "start": "2024-03-19T14:00:00",
                     "end": "2024-03-19T15:00:00",
                     "text": "Informal Networking: Free-form meeting and discussion space",
                     "backColor": "#DDA7D9",
                     "barColor": "#A03E99"
                 }, {
                     "id": 165,
                     "start": "2024-03-20T14:00:00",
                     "end": "2024-03-20T15:00:00",
                     "text": "Informal Networking: Free-form meeting and discussion space",
                     "backColor": "#DDA7D9",
                     "barColor": "#A03E99"
                 }, {
                     "id": 62,
                     "start": "2024-03-20T11:30:00",
                     "end": "2024-03-20T11:50:00",
                     "text": "Break",
                     "backColor": "#cacaca",
                     "barColor": "#565656"
                 }, {
                     "id": 61,
                     "start": "2024-03-19T11:30:00",
                     "end": "2024-03-19T11:50:00",
                     "text": "Break",
                     "backColor": "#cacaca",
                     "barColor": "#565656"
                 }, {
                     "id": 1,
                     "start": "2024-03-18T11:30:00",
                     "end": "2024-03-18T11:50:00",
                     "text": "Break",
                     "backColor": "#cacaca",
                     "barColor": "#565656"
                 }, {
                     "id": 2,
                     "start": "2024-03-18T10:00:00",
                     "end": "2024-03-18T13:00:00",
                     "text": "19th Session of the UNECE Group of Experts on Coal Mine Methane and Just Transition (CMMJT) Meeting",
                     "backColor": "#d9e1f2",
                     "barColor": "#5a6884"
                 }, {
                     "id": 3,
                     "start": "2024-03-18T10:00:00",
                     "end": "2024-03-18T11:30:00",
                     "text": "GMI Steering Committee Meeting (invite only) (hybrid meeting)",
                     "backColor": "#fff2cc",
                     "barColor": "#9a8543",
                     "type": "GMI"
                 }, {
                     "id": 6,
                     "start": "2024-03-18T11:50:00",
                     "end": "2024-03-18T13:00:00",
                     "text": "GMI Steering Committee Meeting (invite only) (hybrid meeting)",
                     "backColor": "#fff2cc",
                     "barColor": "#9a8543",
                     "type": "GMI"
                 }, {
                     "id": 8,
                     "start": "2024-03-18T15:00:00",
                     "end": "2024-03-18T16:40:00",
                     "text": "Coal Joint Technical Session (Palais - Tempus)",
                     "backColor": "#f9a1b2",
                     "barColor": "#6D071A",
                     "type": "GMI"
                 }, {
                     "id": 9,
                     "start": "2024-03-18T15:00:00",
                     "end": "2024-03-18T16:40:00",
                     "text": "GMI Steering Committee Meeting (invite only) (hybrid meeting)",
                     "backColor": "#fff2cc",
                     "barColor": "#9a8543",
                     "type": "GMI"
                 }, {
                     "id": 10,
                     "start": "2024-03-18T15:00:00",
                     "end": "2024-03-18T16:40:00",
                     "text": "Biogas Joint Technical Session (hybrid meeting) (CICG - Salle 4)",
                     "backColor": "#c6e0b4",
                     "barColor": "#2e7e56",
                     "type": "GMI"
                 }, {
                     "id": 12,
                     "start": "2024-03-18T16:55:00",
                     "end": "2024-03-18T18:00:00",
                     "text": "Coal Joint Technical Session (Palais - Tempus)",
                     "backColor": "#f9a1b2",
                     "barColor": "#6D071A",
                     "type": "GMI"
                 }, {
                     "id": 13,
                     "start": "2024-03-18T16:55:00",
                     "end": "2024-03-18T18:00:00",
                     "text": "GMI Steering Committee Meeting (invite only) (hybrid meeting)",
                     "backColor": "#fff2cc",
                     "barColor": "#9a8543",
                     "type": "GMI"
                 }, {
                     "id": 14,
                     "start": "2024-03-18T16:55:00",
                     "end": "2024-03-18T18:00:00",
                     "text": "Biogas Joint Technical Session (hybrid meeting) (CICG - Salle 4)",
                     "backColor": "#c6e0b4",
                     "barColor": "#2e7e56",
                     "type": "GMI"
                 }, {
                     "id": 15,
                     "start": "2024-03-18T18:30:00",
                     "end": "2024-03-18T20:00:00",
                     "text": "Welcome Reception & Methane Action Showcase Sponsored by the Global Methane Hub (Serpent Bar - Palais)",
                     "backColor": "#ffd966",
                     "barColor": "#ac8200"
                 }, {
                     "id": 19,
                     "start": "2024-03-19T18:30:00",
                     "end": "2024-03-19T20:00:00",
                     "text": "Networking Reception & Methane Action Showcase Sponsored by the Global Methane Hub (Serpent Bar - Palais)",
                     "backColor": "#ffd966",
                     "barColor": "#ac8200"
                 }, {
                     "id": 20,
                     "start": "2024-03-21T10:00:00",
                     "end": "2024-03-21T18:00:00",
                     "text": "11th Session of the UNECE Group of Experts on Gas",
                     "html": "11th Session of the UNECE Group of Experts on Gas<br><i>This UNECE session will be focused on the role of gases in building a resilient energy system and activities of the Hydrogen Task Force; methane will not be explicitly addressed. All are welcome to attend.</i>",

                     "backColor": "#ced4da",
                     "barColor": "#495057"
                 }, {
                     "id": 21,
                     "start": "2024-03-19T10:00:00",
                     "end": "2024-03-19T11:30:00",
                     "text": "Keynote Session: A Global Call to Mobilize Methane Action (livestreamed) (Plenary Session) (Full Day Location: Palais - Tempus)",
                     "backColor": "#95bfe7",
                     "barColor": "#2972b6",
                     "type": "GMI"
                 }, {
                     "id": 22,
                     "start": "2024-03-19T15:00:00",
                     "end": "2024-03-19T15:40:00",
                     "text": "The Importance of Industry to Mobilizing Methane Action (livestreamed) (Plenary Session)",
                     "backColor": "#95bfe7",
                     "barColor": "#2972b6",
                     "type": "GMI"
                 }, {
                     "id": 23,
                     "start": "2024-03-19T15:40:00",
                     "end": "2024-03-19T16:20:00",
                     "text": "The Value of Data as a Driver to Mobilize Methane Action (livestreamed) (Plenary Session)",
                     "backColor": "#95bfe7",
                     "barColor": "#2972b6",
                     "type": "GMI"
                 }, {
                     "id": 24,
                     "start": "2024-03-19T16:35:00",
                     "end": "2024-03-19T17:15:00",
                     "text": "Catalyzing Finance to Mobilize Methane Action (livestreamed) (Plenary Session)",
                     "backColor": "#95bfe7",
                     "barColor": "#2972b6",
                     "type": "GMI"
                 }, {
                     "id": 25,
                     "start": "2024-03-19T11:50:00",
                     "end": "2024-03-19T13:00:00",
                     "text": "Governments as Vital Drivers to Mobilize Methane Action (livestreamed) (Plenary Session)",
                     "backColor": "#95bfe7",
                     "barColor": "#2972b6",
                     "type": "GMI"
                 }, {
                     "id": 27,
                     "start": "2024-03-19T17:15:00",
                     "end": "2024-03-19T18:00:00",
                     "text": "Succeeding Locally to Mobilize Methane Action (livestreamed) (Plenary Session)",
                     "backColor": "#95bfe7",
                     "barColor": "#2972b6",
                     "type": "GMI"
                 }, {
                     "id": 29,
                     "start": "2024-03-20T10:00:00",
                     "end": "2024-03-20T11:30:00",
                     "text": "Oil & Gas Joint Technical Session (Palais - Tempus)",
                     "backColor": "#bcbbd9",
                     "barColor": "#464379",
                     "type": "GMI"
                 }, {
                     "id": 30,
                     "start": "2024-03-20T10:00:00",
                     "end": "2024-03-20T11:30:00",
                     "text": "Biogas Joint Technical Session (hybrid meeting) (CICG - Salle 4)",
                     "backColor": "#c6e0b4",
                     "barColor": "#2e7e56",
                     "type": "GMI"
                 }, {
                     "id": 31,
                     "start": "2024-03-20T10:00:00",
                     "end": "2024-03-20T11:30:00",
                     "text": "Coal Joint Technical Session (CICG - Salle 3)",
                     "backColor": "#f9a1b2",
                     "barColor": "#6D071A",
                     "type": "GMI"
                 }, {
                     "id": 32,
                     "start": "2024-03-20T11:50:00",
                     "end": "2024-03-20T13:00:00",
                     "text": "Oil & Gas Joint Technical Session (Palais - Tempus)",
                     "backColor": "#bcbbd9",
                     "barColor": "#464379",
                     "type": "GMI"
                 }, {
                     "id": 33,
                     "start": "2024-03-20T11:50:00",
                     "end": "2024-03-20T13:00:00",
                     "text": "Biogas Joint Technical Session (hybrid meeting) (CICG - Salle 4)",
                     "backColor": "#c6e0b4",
                     "barColor": "#2e7e56",
                     "type": "GMI"
                 }, {
                     "id": 34,
                     "start": "2024-03-20T11:50:00",
                     "end": "2024-03-20T13:00:00",
                     "text": "Coal Joint Technical Session (CICG - Salle 3)",
                     "backColor": "#f9a1b2",
                     "barColor": "#6D071A",
                     "type": "GMI"
                 }, {
                     "id": 35,
                     "start": "2024-03-20T15:00:00",
                     "end": "2024-03-20T16:40:00",
                     "text": "Oil & Gas Joint Technical Session (Palais - Tempus)",
                     "backColor": "#bcbbd9",
                     "barColor": "#464379",
                     "type": "GMI"
                 }, {
                     "id": 36,
                     "start": "2024-03-20T15:00:00",
                     "end": "2024-03-20T16:40:00",
                     "text": "Biogas Joint Technical Session (hybrid meeting) (CICG - Salle 4)",
                     "backColor": "#c6e0b4",
                     "barColor": "#2e7e56",
                     "type": "GMI"
                 }, {
                     "id": 37,
                     "start": "2024-03-20T15:00:00",
                     "end": "2024-03-20T16:40:00",
                     "text": "Coal Joint Technical Session (CICG - Salle 3)",
                     "backColor": "#f9a1b2",
                     "barColor": "#6D071A",
                     "type": "GMI"
                 }, {
                     "id": 38,
                     "start": "2024-03-20T16:55:00",
                     "end": "2024-03-20T18:00:00",
                     "text": "Oil & Gas Joint Technical Session (Palais - Tempus)",
                     "backColor": "#bcbbd9",
                     "barColor": "#464379",
                     "type": "GMI"
                 }, {
                     "id": 39,
                     "start": "2024-03-20T16:55:00",
                     "end": "2024-03-20T18:00:00",
                     "text": "Biogas Joint Technical Session (hybrid meeting) (CICG - Salle 4)",
                     "backColor": "#c6e0b4",
                     "barColor": "#2e7e56",
                     "type": "GMI"
                 }, {
                     "id": 40,
                     "start": "2024-03-20T16:55:00",
                     "end": "2024-03-20T18:00:00",
                     "text": "Coal Joint Technical Session (CICG - Salle 3)",
                     "backColor": "#f9a1b2",
                     "barColor": "#6D071A",
                     "type": "GMI"
                 }];
                 dp.onBeforeTimeHeaderRender = function (args) {
                     if (args.header.level === 1) {
                         var dayOfWeek = args.header.start.getDayOfWeek();
                         if (dayOfWeek === 1) {
                             args.header.backColor = "#4472c4";
                             args.header.cssClass = "weekend_header";
                         }
                         if (dayOfWeek === 2) {
                             args.header.backColor = "#ff0000";
                             args.header.cssClass = "weekend_header";
                         }
                     }
                 }
                 dp.onEventFilter = function (args) {
                     if (args.filter !== "hideUNECEevents") {
                         console.log('hider');
                         // display only events that contain the specified text, case insensitive
                         if (args.e.text().toUpperCase().indexOf(args.filter.toUpperCase()) === -1) {
                             args.visible = false;
                         }

                     } else {
                         console.log('no hider');

                         if (args.e.data.type !== "GMI") {
                             args.visible = false;
                         }

                     }
                 };
                 dp.init();
                 $("#filter").keyup(function () {
                     var query = $(this).val();
                     dp.events.filter(query);
                 });

                 $("#clear").click(function () {
                     $("#filter").val("");
                     dp.events.filter(null);
                     return false;
                 });

                 $("#gmiOnlybutton").click(function () {
                     var query = "hideUNECEevents";
                     dp.events.filter(query);
                 });
                 $("#unecebutton").click(function () {
                     var query = "UNECE";
                     dp.events.filter(query);
                 });
                 $("#unecebutton").click(function () {
                     var query = "gmi";
                     dp.events.filter(query);
                 });
                 $("#biogasbutton").click(function () {
                     var query = "Biogas";
                     dp.events.filter(query);
                 });
                 $("#coalbutton").click(function () {
                     var query = "Coal Joint";
                     dp.events.filter(query);
                 });
                 $("#oilandgasbutton").click(function () {
                     var query = "Oil & Gas";
                     dp.events.filter(query);
                 });
                 $("#keynotebutton").click(function () {
                     var query = "Plenary";
                     dp.events.filter(query);
                 });


                 $("#daySelect").change(function () {

                     if (this.value == "all") {
                         dp.startDate = "2024-03-18";
                         dp.days = 4;
                         dp.update();
                     } else if (this.value == "mon") {
                         dp.startDate = "2024-03-18";
                         dp.days = 1;
                         dp.update();
                     } else if (this.value == "tue") {
                         dp.startDate = "2024-03-19";
                         dp.days = 1;
                         dp.update();
                     } else if (this.value == "wed") {
                         dp.startDate = "2024-03-20";
                         dp.days = 1;
                         dp.update();
                     } else if (this.value == "thu") {
                         dp.startDate = "2024-03-21";
                         dp.days = 1;
                         dp.update();
                     }
                 });




                 $("#filter").keyup(function () {
                     var query = $(this).val();
                     dp.events.filter(query);
                 });

                 $("#clearDays").click(function () {
                     dp.startDate = "2024-03-18";
                     dp.days = 4;
                     dp.update();
                     $("#daySelect").val(0);
                 });

                 $("#clear").click(function () {
                     $("#filter").val("");
                     dp.events.filter(null);
                     return false;
                 });

                 $("#gmibutton").click(function () {
                     var query = "GMI";
                     dp.events.filter(query);
                 });
                 $("#unecebutton").click(function () {
                     var query = "UNECE";
                     dp.events.filter(query);
                 });
                 $("#biogasbutton").click(function () {
                     var query = "Biogas";
                     dp.events.filter(query);
                 });
                 $("#coalbutton").click(function () {
                     var query = "Coal";
                     dp.events.filter(query);
                 });
                 $("#oilandgasbutton").click(function () {
                     var query = "Oil & Gas";
                     dp.events.filter(query);
                 });
                 $("#keynotebutton").click(function () {
                     var query = "Plenary";
                     dp.events.filter(query);
                 });
             </script>


        </div>
    </form>
</body>
</html>
