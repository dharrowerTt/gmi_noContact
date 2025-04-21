<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="delegates.aspx.vb" Inherits="M2M_Redesign.delegates1" %>

<!doctype html>
<html lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!--#include file="../_register/googleAnalytics.html"-->

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

    <title>GMI - Admin</title>

    <link rel="stylesheet" type="text/css" href="../../_register/css/addon.css">
    <link rel="stylesheet" type="text/css" href="../../_register/css/formstyles.css">
    <link rel="stylesheet" type="text/css" href="css/controlpanel.css">

    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <link href="/scripts/yadcf-master/jquery.datatables.yadcf.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="https://cdn.datatables.net/1.10.16/css/jquery.dataTables.min.css" type="text/css" />

    <style>
        #cover{
            top:0;
            width:100vw;
            height:100vh;
            background:white;
            position:absolute;
            z-index:999999999999999999999;
        }
        tr.group,
        tr.group:hover {
            background-color: #3092c0 !important;
            font-weight: bold;
        }

        .dt-buttons {
            text-align: right;
            float: right;
            margin-left: 30px;
        }

        #list_filter {
            float: right;
        }

        .odd {
            background-color: #fafafc !important;
        }

        #list{
            width:100%!important;
        }
    </style>

</head>
<body onload="checkCookie()"> 
    <div id="cover"></div>
    <!--#include file="include/header.html"-->

    <div class="container-fluid" style="margin-top: 3.5rem;">
        <div class="row">
        </div>

    <div class="row">
        <div class="col-md-12">

            <div>

                <b>Subcommittee:</b>  <select id="mySector">
        <option value="">--Show All--</option>
        <option value="biogas">Biogas Subcommittee</option>
        <option value="agriculture">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Agriculture Technical Group</option>
        <option value="MSW">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;MSW Technical Group</option>
        <option value="wastewater">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Wastewater Technical Group</option>
        <option value="coal">Coal Subcommittee</option>
        <option value="oil">Oil & Gas Subcommittee</option>
        <option value="steering">Steering Committee</option>
    </select>

                <asp:Literal ID="LitCommittee" runat="server"></asp:Literal>


            </div>

        </div>
    </div>

    </div>
    <!-- /container -->

    </main>

    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
      <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

    <!-- DataTable -->
     <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>

<!-- new scripts for the copy/download -->
                 <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/buttons/1.5.6/js/dataTables.buttons.min.js"></script>
                 <script type="text/javascript" charset="utf8" src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
                 <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/buttons/1.5.6/js/buttons.html5.min.js"></script>


 <!-- script  type="text/javascript" src="/scripts/yadcf-master/jquery.dataTables.yadcf.js"></script -->
    <script type="text/javascript">
        $(document).ready(function () {
            var table = $('#list').DataTable({
                "columnDefs": [{
                        "visible": false,
                        "targets": 5
                    },
                    {
                        "orderable": false,
                        "targets": '_all'
                    }
                ],

                "order": [
                    [5, 'asc']
                ],
                "drawCallback": function (settings) {
                    var api = this.api();
                    var rows = api.rows({
                        page: 'current'
                    }).nodes();
                    var last = null;

                    api.column(5, {
                        page: 'current'
                    }).data().each(function (group, i) {
                        if (last !== group) {
                            $(rows).eq(i).before(
                                '<tr class="group"><td colspan="7">' + group +
                                '</td></tr>'
                            );

                            last = group;
                        }
                    });
                },
                initComplete: function () {
                    this.api().columns([3, 4, 5, 6, 7]).every(function () {
                        var column = this;
                        var select = $('<br><select><option value=""></option></select>')
                            .appendTo($(column.header()))
                            .on('change', function () {
                                var val = $.fn.dataTable.util.escapeRegex(
                                    $(this).val()
                                );

                                column
                                    .search(val ? '^' + val + '$' : '', true, false)
                                    .draw();
                            });

                        column.data().unique().sort().each(function (d, j) {
                            select.append('<option value="' + d + '">' + d +
                                '</option>')
                        });
                    });
                },
                "lengthMenu": [
                    [10, 25, 50, 100, -1],
                    [10, 25, 50, 100, "All"]
                ],
                iDisplayLength: 10,
                dom: 'Blfrtip',
                scrollX: true,
                buttons: [
                    'copyHtml5',
                    'excelHtml5'
                ]
            });

            $('#mySector').on('change', function () {
                table.columns(5).search(this.value).draw();
            });

            function getURLParameter(name) {
                return decodeURIComponent((new RegExp('[?|&]' + name + '=' + '([^&;]+?)(&|#|;|$)').exec(location
                    .search) || [, ""])[1].replace(/\+/g, '%20')) || null
            }

            var val = getURLParameter('sector');
            if (val > "") {
            $('#mySector').val(val);
            table.columns(5).search(val).draw();
            }
            var val = getURLParameter('country');
            if (val > "") {
            $('#mySector').val(val);
            table.columns(2).search(val).draw();
            }
        });

    </script>

    <script type="text/javascript" language="javascript" class="init">
        // Order by the grouping
        $('#list tbody').on('click', 'tr.group', function () {
            var currentOrder = table.order()[0];
            if (currentOrder[0] === 2 && currentOrder[1] === 'asc') {
                table.order([2, 'desc']).draw();
            } else {
                table.order([2, 'asc']).draw();
            }
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
                window.location.href = "index.aspx";
            }
        }

        function deleteCookie() {
            document.cookie = "username=; expires=Thu, 01 Jan 1970 00:00:00 UTC; path=/;";
            window.location.href = "index.aspx";
        }


    </script>
</body>
</html>

