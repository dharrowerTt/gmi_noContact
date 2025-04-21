<%@ Page Language="vb" AutoEventWireup="false" Codebehind="event_List.aspx.vb" Inherits="M2M_Redesign.event_List_old" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
    <head>
        <title>Admin | Event List</title>


    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">

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
        body{
            background:#D2E9EE;
        }
        .container{
            background:#fafafa;
        }
        .row{
            border-bottom:2px solid #cacaca;
            padding-bottom:20px;
            margin-bottom:20px;
        }
            .radiostyle {
      height: auto;
    }

    .radiostyle label {
        margin-left: 3px !important;
        margin-right: 10px !important;
    }
    </style>
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.24/css/jquery.dataTables.css">
    </head>
	<body onload="checkCookie()">
            <div id="cover"></div>
    <div class="container">
         <!-- #include virtual="nav.html" -->
            <div id="maincontentarea">
                <div class="row">
                    <div class="col-md-12">
                        <h3>Event List</h3>
                        <asp:Placeholder id="ph1" runat="server"></asp:Placeholder> 
                    </div>
                </div>
                </div>
            </div>
        
        <script
  src="https://code.jquery.com/jquery-3.6.0.js"
  integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
  crossorigin="anonymous"></script>
        <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.24/js/jquery.dataTables.js"></script>
        
        <script>
        $(document).ready(function () {
            $('#resourcelist').DataTable({
                "columnDefs": [
                    {
                        "targets": [2],
                        "visible": false
                    },
                    {
                        "targets": [3],
                        "visible": false
                    }
                ]
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
        


    	
	</body>
</html>


