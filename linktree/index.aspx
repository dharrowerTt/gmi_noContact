<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="index.aspx.vb" Inherits="M2M_Redesign.index21" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Link Tree | Global Methane Initiative</title>
       <!-- #include virtual="/includes/include_head.html" -->
    <script>
function setCookie(cname,cvalue,exdays) {
  const d = new Date();
  d.setTime(d.getTime() + (exdays*24*60*60*1000));
  let expires = "expires=" + d.toUTCString();
  document.cookie = cname + "=" + cvalue + ";" + expires + ";path=/";
}

function getCookie(cname) {
  let name = cname + "=";
  let decodedCookie = decodeURIComponent(document.cookie);
  let ca = decodedCookie.split(';');
  for(let i = 0; i < ca.length; i++) {
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

        .btn-info{
            background:rgba(250,250,250,.7);
            border-radius:12px;
            color:#424242;
        }
        body {
	background: linear-gradient(-45deg, #bde4f2, #edf9fd, #23a6d5, #23d5ab);
	background-size: 400% 400%;
	animation: gradient 15s ease infinite;
	height: 100vh;
}

@keyframes gradient {
	0% {
		background-position: 0% 50%;
	}
	50% {
		background-position: 100% 50%;
	}
	100% {
		background-position: 0% 50%;
	}
}

    </style>
</head>
<body onload="checkCookie()">
    <form id="form1" runat="server">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-md-12">
                    <img src="../2024forum/img/card-horizontal-600.png" style="max-width:100%;text-align:center;  margin:auto;display: block;border:1px solid black;"/>
                    </div>
            </div>
            <div class="row justify-content-center">
                <div class="col-md-12" style="text-align:center;">
                    Hi <%= visitorName  %>! 
                </div>
                <div class="col-md-12">
                    <a class="btn btn-info btn-lg btn-block m-2" href="#" id="agendaLink">Review Agenda</a>
                </div>
                <div class="col-md-12">
                     <a class="btn btn-info btn-lg btn-block m-2" href="connections.aspx?id=<%= visitorID  %>">Make Connections</a>
                </div>
                <div class="col-md-12">
                     <a class="btn btn-info btn-lg btn-block m-2" href="feedback.aspx?id=<%= visitorID  %>">Provide Session Feedback</a>
                </div>
                <div class="col-md-12">
                     <a class="btn btn-info btn-lg btn-block m-2" href="photos.aspx?id=<%= visitorID  %>">Submit Photos</a>
                </div>
                <div class="col-md-12">
                     <a class="btn btn-info btn-lg btn-block m-2" href="https://forms.office.com/Pages/DesignPageV2.aspx?subpage=design&token=2463cbdf7b1c4c55a4fb65a4a68bd841&wdlor=cD8B70A01-E6F5-4F61-BC54-8F3163DAE134&id=uuQPpMer_kiHkrQ4iZNkAOHm6AdDWoNOmsvV4WobLu9UOU9DWVE0M0ZJQlpVVlNBU09FVEVBREdHRy4u&topview=Preview" target="_blank">Evaluate the Forum</a>
                </div>
                <div class="col-md-12">
                     <a class="btn btn-primary btn-lg btn-block m-2" href="https://www.globalmethane.org/2024forum" target="_blank">Explore the Forum Website</a>
                </div>
            </div>
        </div>
    </form>

            <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
        integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous">
    </script>

    <script>

        function MyFunction() {
            const todayVar = new Date();
            const date1 = todayVar.getDate();

            if (date1 === 18) {
                window.location.href = 'https://www.epa.gov/gmi/2024-global-methane-forum-agenda#monday';
            } else if (date1 === 19) {
                window.location.href = 'https://www.epa.gov/gmi/2024-global-methane-forum-agenda#tuesday';
            } else if (date1 === 20) {
                window.location.href = 'https://www.epa.gov/gmi/2024-global-methane-forum-agenda#wednesday';
            } else if (date1 === 21) {
                window.location.href = 'https://www.epa.gov/gmi/2024-global-methane-forum-agenda#thursday';
            } else {
                window.location.href = 'https://www.epa.gov/gmi/2024-global-methane-forum-agenda';
            }
        }

        $('#agendaLink').click(function () { MyFunction(); return false; });


       
    </script>
</body>
</html>
