<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="controlpanel.aspx.vb" Inherits="M2M_Redesign.controlpanel" %>

<!doctype html>
<html lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!--#include file="../_register/googleAnalytics.html"-->

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <script src="https://use.fontawesome.com/f40f14ac2c.js"></script>
    <title>GMI - Admin</title>

    <link rel="stylesheet" type="text/css" href="../../_register/css/addon.css">
    <link rel="stylesheet" type="text/css" href="../../_register/css/formstyles.css">
    <link rel="stylesheet" type="text/css" href="css/controlpanel.css">
    <script src="//cdn.jsdelivr.net/npm/sweetalert2@8"></script>
    <style>


        .ui-icon-volume-off.ui-icon-filter {
            -ms-transform: rotate(270deg);
            -webkit-transform: rotate(270deg);
            transform: rotate(270deg);
        }

        tbody tr:hover {
            background-color: #f0f0f0 !important;
        }


     td:nth-child(1) {
      text-transform: capitalize;}
td:nth-child(2) {
      text-transform: capitalize;}
td:nth-child(3) {
      text-transform: capitalize;}
td:nth-child(5) {
      text-transform: capitalize;}
td:nth-child(6) {
      text-transform: capitalize;}

.redClass{  
    background-color:#fab1a0!important;
    }

 tbody tr.redClass:hover{
    background-color:#e17055;
}
    </style>

                <script src="https://www.amcharts.com/lib/3/ammap.js" type="text/javascript"></script>
<script src="https://www.amcharts.com/lib/3/maps/js/worldHigh.js" type="text/javascript"></script>
<script src="https://www.amcharts.com/lib/3/themes/dark.js" type="text/javascript"></script>

</head>
<body >

    <script>
        function edited() {



            Swal.fire({
                title: 'Deleted',
                html: 'Registrant has been removed',
                type: 'success',
                confirmButtonText: 'Got it!'
            }).then((result) => {
                location.reload();
            })
        }

        function mailed() {



            Swal.fire({
                title: 'Reminder Sent!',
                html: 'Registrant has been reminded to finish registration',
                type: 'success',
                confirmButtonText: 'Got it!'
            }).then((result) => {
                location.reload();
            })
        }

    </script>

    <div id="cover"></div>
    <!--#include file="include/header.html"-->

    <div class="container-fluid" style="margin-top: 3.5rem;">
        <div class="row">
            <form runat="server">
                <div class="col-md-12">
                    Select an event: 
                <asp:DropDownList ID="eventID" runat="server">
                    <asp:ListItem Value="" Selected disabled>-- Select --</asp:ListItem>
                    <asp:ListItem Value="101">Biogas Subcommittee Meeting - October 2019</asp:ListItem>
                    <asp:ListItem Value="102">Coal Subcommittee Meeting - November 2019</asp:ListItem>
                    <asp:ListItem Value="105">Steering Committee Meeting - November 2019</asp:ListItem>
                    <asp:ListItem Value="110">Global Methane Forum - March 2020</asp:ListItem>
                </asp:DropDownList>
                    <asp:Button ID="Button1" runat="server" Text="View Registrants" />
            </form>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12">
            <h3 style="margin-top: 20px;"><%=EventTitle %></h3>
            <div>
                <asp:PlaceHolder ID="PlaceHolder1" runat="server" />
            </div>
            <div id="mapdiv" style="width: 100%; height: 450px;"></div>
            <br /><br />
                   <asp:PlaceHolder ID="PlaceHolder3" runat="server" />
        </div>
    </div>

    </div>
    <!-- /container -->

    </main>

    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js" integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo=" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js" integrity="sha256-VazP97ZCwtekAsvgPBSUwPFKdrwD3unUfSGVYrahUqU=" crossorigin="anonymous"></script>
    <!-- DataTable -->
    <link href="//ajax.googleapis.com/ajax/libs/jqueryui/1.11.1/themes/south-street/jquery-ui.min.css" rel="stylesheet" type="text/css" />
    <link href="//cdn.datatables.net/plug-ins/725b2a2115b/integration/jqueryui/dataTables.jqueryui.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.css">
    <script src="//cdnjs.cloudflare.com/ajax/libs/moment.js/2.11.2/moment.min.js"></script>
    <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.js"></script>
    <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/plug-ins/1.10.19/dataRender/datetime.js"></script>

    <script src="//cdn.datatables.net/colreorder/1.1.2/js/dataTables.colReorder.min.js"></script>
    <script src="//cdn.datatables.net/plug-ins/725b2a2115b/api/fnFilterClear.js"></script>

    <link rel="stylesheet" type="text/css" href="https://rawgithub.com/swisnl/jQuery-contextMenu/master/dist/jquery.contextMenu.min.css">
    <script type="text/javascript" src="https://rawgithub.com/swisnl/jQuery-contextMenu/master/dist/jquery.contextMenu.min.js"></script>

    <!-- new scripts for the copy/download -->
    <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/buttons/1.5.6/js/dataTables.buttons.min.js"></script>
    <script type="text/javascript" charset="utf8" src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
    <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/buttons/1.5.6/js/buttons.html5.min.js"></script>

    <script>
        $(document).ready(function () {
            var table = $('#table').DataTable({
                drawCallback: function () {
                    $.contextMenu({
                        selector: 'tbody tr td',
                        callback: function (key, options) {
                            var id = options.$trigger[0].parentElement.id;

                            var xhttp;
                            xhttp = new XMLHttpRequest();
                            switch (key) {
                                case 'edit':
                                    alert('edit Wins!');
                                    break;
                                case 'mail':
                                    xhttp.open("GET", "actions/mail.aspx?id=" + id, true);
                                    mailed();
                                    break;
                                case 'delete':
                                    xhttp.open("GET", "actions/delete.aspx?id=" + id, true);
                                    edited();
                                    break;
                            }
                            xhttp.send();

                        },
                        items: {
                            "mail": { name: "Email Reminder", icon: "fa-envelope" },
                            "delete": { name: "Delete", icon: "fa-times-circle" }
                        }
                    });
                },
                info: true,
                paging: true,
                lengthChange: true,
                fixedHeader: true,
                select: true,
                "createdRow": function( row, data, dataIndex){
                    if( data[2] ==  ``){
                        $(row).addClass('redClass');
                    }
                },
                columns: [, null, null, null, null, null, null,null,null],
                "columnDefs": [
            {
                "targets": [0],
                "visible": false,
                "searchable": false
            },
            {
                "targets": [3],
                "visible": true
            }
                ],
                "order": [],
                dom: 'Bfrtip',
                buttons: [
    'copyHtml5',
    'excelHtml5'
                ]
            });
            //retrieve id on right click
            $('#table tbody').on('click', 'tr', function () {
                var id = this.id;
                var index = $.inArray(id, selected);
                alert(id);
                alert(index);
                if (index === -1) {
                    selected.push(id);
                } else {
                    selected.splice(index, 0);
                }
                $(this).toggleClass('selected');
            });
        });


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
                window.location.href = "index.aspx";
            }
        }

        function deleteCookie() {
            document.cookie = "username=; expires=Thu, 01 Jan 1970 00:00:00 UTC; path=/;";
            window.location.href = "index.aspx";
        }


        function succeeded(msg) {
            alert("hi");
        }


    </script>

    <script type="text/javascript">


var map = AmCharts.makeChart("mapdiv",{
type: "map",
theme: "dark",
projection: "mercator",
panEventsEnabled : false,
backgroundColor: "#2c3e50",
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

<%= PlaceHolderCountries %>
{
    'id': 'US',
    'showAsSelected': true
}
]
},
areasSettings : {
autoZoom : false,
color: "#ecf0f1",
colorSolid: "#4e9525",
selectedColor: "#2ecc71",
outlineColor: "#7f8c8d",
rollOverColor: "#dde0e2",
rollOverOutlineColor: "#6ab04c"
}
});
</script>
</body>
</html>

