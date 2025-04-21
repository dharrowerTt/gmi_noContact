<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="photos.aspx.vb" Inherits="M2M_Redesign.photos" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Link Tree - Photo Upload | Global Methane Initiative</title>
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
            <li class="nav-item">
            <a class="nav-link" href="agenda.aspx">Review Agenda</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="connections.aspx">Make Connections</a>
          </li>
            <li class="nav-item">
            <a class="nav-link" href="feedback.aspx">Session Feedback </a>
          </li>
            <li class="nav-item active">
            <a class="nav-link" href="photos.aspx">Submit Photos <span class="sr-only">(current)</span></a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="https://forms.office.com/Pages/DesignPageV2.aspx?subpage=design&token=2463cbdf7b1c4c55a4fb65a4a68bd841&wdlor=cD8B70A01-E6F5-4F61-BC54-8F3163DAE134&id=uuQPpMer_kiHkrQ4iZNkAOHm6AdDWoNOmsvV4WobLu9UOU9DWVE0M0ZJQlpVVlNBU09FVEVBREdHRy4u&topview=Preview" target="_blank">Evaluate the Forum</a>
          </li>
        </ul>
              </div>
      </div>
    </nav>
    <form id="form1" runat="server">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-md-9">
                     <label for="fileUpload">Select a photo to upload</label>
                    <asp:FileUpload ID="fileUpload" runat="server" accept=".jpg,.png,.jpeg," />
                </div>
                <div class="col-md-9">
                     <label for="caption">Please caption your photo</label>
                     <asp:TextBox ID="caption" runat="server" cssClass="form-control"></asp:TextBox>
                </div>
                <div class="col-md-9">
                    <asp:Label ID="Label1" runat="server" Text=""></asp:Label><br />
                       <asp:Button ID="btnUpload" Text="Upload" runat="server" OnClick="UploadFile" />
            <hr />
            <asp:Image ID="Image1" runat="server" Width="100" />
                </div>
            </div>
        </div>
    </form>
<script
  src="https://code.jquery.com/jquery-3.7.1.min.js"
  integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo="
  crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
        integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous">
    </script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
        integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous">
    </script>

    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.css">
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/buttons/1.5.6/css/buttons.dataTables.min.css" />
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/responsive/2.2.3/css/responsive.dataTables.min.css" />


	<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.js"></script>
    <script type="text/javascript" charset="utf-8"  src="https://cdn.datatables.net/buttons/1.5.6/js/dataTables.buttons.min.js"></script>
    <script type="text/javascript" language="javascript" src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/vfs_fonts.js"></script>
	<script type="text/javascript" language="javascript" src="https://cdn.datatables.net/buttons/1.5.6/js/buttons.html5.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/yadcf/0.9.4/jquery.dataTables.yadcf.js" integrity="sha256-j83V52uLomZxGL9GIZ7eyiv32ntFn7Kr6WQSfz3mvRs=" crossorigin="anonymous"></script>
    <script type="text/javascript" language="javascript" src="https://cdn.datatables.net/responsive/2.2.3/js/dataTables.responsive.min.js"> </script>
    <script src="https://cdn.jsdelivr.net/npm/jquery.cookie@1.4.1/jquery.cookie.min.js"></script>
        <script type="text/javascript">

            function getQueryVariable(variable) {
                var query = window.location.search.substring(1);
                var vars = query.split("&");
                for (var i = 0; i < vars.length; i++) {
                    var pair = vars[i].split("=");
                    if (pair[0] == variable) { return pair[1]; }
                }
                return (false);
            }

            user = getQueryVariable("s");

            if (user.length > 4) {
                document.getElementById("alertBox").style.display = "block";


                window.setTimeout(function () {
                    $(".alert").fadeTo(500, 0).slideUp(500, function () {
                        $(this).remove();
                    });
                }, 4000);

            }


        </script>

        <script>
            window.onload = function () {
                function populateFormFields() {

                    const idValue = getCookie("userid");


                    document.getElementById('user').value = idValue || '';

                }

                populateFormFields(); // Call the function when the window is fully loaded
            };
        </script>
    
</body>
</html>
