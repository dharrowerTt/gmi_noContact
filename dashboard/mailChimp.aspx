<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="mailChimp.aspx.vb" Inherits="M2M_Redesign.mailChimp" %>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>GMI Dashboard</title>

    <!-- Custom fonts for this template-->
    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.datatables.net/1.13.6/css/jquery.dataTables.css" />
    <!-- Custom styles for this template-->
    <link href="css/sb-admin-2.min.css" rel="stylesheet">
    <style>
        .container-fluid {
            margin-top: 20px;
        }
    </style>
</head>


<body id="page-top">
    <form id="form2" runat="server">
        <!-- Page Wrapper -->
        <div id="wrapper">

            <!-- Sidebar -->
            <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

                <!-- Sidebar - Brand -->
                <a class="sidebar-brand d-flex align-items-center justify-content-center" href="index.html">

                    <div class="sidebar-brand-text mx-3">GMI Dashboard</div>
                </a>

                <!-- Divider -->
                <hr class="sidebar-divider my-0">

                <!-- Nav Item - Dashboard -->
                <li class="nav-item">
                    <a class="nav-link" href="index.aspx">

                        <i class="fas fa-fw fa-globe-americas"></i>
                        <span>Partner Countries</span></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="projectNetwork.aspx">
                        <i class="fas fa-fw fa-building"></i>
                        <span>PN Membership</span></a>
                </li>
                <li class="nav-item">
                   <a class="nav-link" href="resources.aspx">
                        <i class="fas fa-fw fa-file-alt"></i>
                        <span>Resources</span></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="emissions.aspx">
                        <i class="fas fa-fw fa-angle-double-down"></i>
                        <span>Emission Reduction</span></a>
                </li>
                <li class="nav-item active">
                    <a class="nav-link" href="mailChimp.aspx">
                        <i class="fas fa-fw fa-envelope"></i>
                        <span>Mailing List</span></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="socialMedia.aspx">
                        <i class="fas fa-fw fa-thumbs-up"></i>
                        <span>Social Media Engagement</span></a>
                </li>
                <!-- Divider -->
                <hr class="sidebar-divider">
            </ul>
            <!-- End of Sidebar -->

            <!-- Content Wrapper -->
            <div id="content-wrapper" class="d-flex flex-column">

                <!-- Main Content -->
                <div id="content">



                    <!-- Begin Page Content -->
                    <div class="container-fluid">

                        <!-- Page Heading -->
                        <div class="d-sm-flex align-items-center justify-content-between mb-4">
                            <h1 class="h3 mb-0 text-gray-800">Dashboard</h1>
                        </div>

                        <!-- Content Row -->
                        <div class="row">

                            <!-- Earnings (Monthly) Card Example -->
                            <div class="col-xl-2 col-md-6 mb-4">
                                <div class="card border-left-primary shadow h-100 py-2">
                                    <div class="card-body">
                                        <div class="row no-gutters align-items-center">
                                            <div class="col mr-2">
                                                <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">
                                                    Count of Subscribers
                                                </div>
                                                <div class="h5 mb-0 font-weight-bold text-gray-800"><%= snapshotSubs  %> (<%= snapshotSubsPrev  %>)</div>
                                            </div>
                                            <div class="col-auto">
                                                <i class="fas fa-plus-square fa-2x text-gray-300"></i>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>



                            <!-- Earnings (Monthly) Card Example -->
                            <div class="col-xl-2 col-md-6 mb-4">
                                <div class="card border-left-primary shadow h-100 py-2">
                                    <div class="card-body">
                                        <div class="row no-gutters align-items-center">
                                            <div class="col mr-2">
                                                <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">
                                                    Count of Contacts
                                                </div>
                                                <div class="h5 mb-0 font-weight-bold text-gray-800"><%= snapshotContacts  %> (<%= snapshotContactsPrev  %>)</div>
                                            </div>
                                            <div class="col-auto">
                                                <i class="fas fa-users fa-2x text-gray-300"></i>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- Pending Requests Card Example -->
                            <div class="col-xl-2 col-md-6 mb-4">
                                <div class="card border-left-primary shadow h-100 py-2">
                                    <div class="card-body">
                                        <div class="row no-gutters align-items-center">
                                            <div class="col mr-2">
                                                <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">
                                                    Average Open Rate (monthly change)
                                                </div>
                                                <div class="h5 mb-0 font-weight-bold text-gray-800"><%= openRate  %> (<%= openRatePrev  %>)</div>
                                            </div>
                                            <div class="col-auto">
                                                <i class="fas fa-envelope-open fa-2x text-gray-300"></i>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- Pending Requests Card Example -->
                            <div class="col-xl-2 col-md-6 mb-4">
                                <div class="card border-left-primary shadow h-100 py-2">
                                    <div class="card-body">
                                        <div class="row no-gutters align-items-center">
                                            <div class="col mr-2">
                                                <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">
                                                     Average Click Rate (monthly change)
                                                </div>
                                                <div class="h5 mb-0 font-weight-bold text-gray-800"><%= clickRate  %> (<%= clickRatePrev  %>)</div>
                                            </div>
                                            <div class="col-auto">
                                                <i class="fas fa-mouse-pointer fa-2x text-gray-300"></i>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- Pending Requests Card Example -->
                            <div class="col-xl-2 col-md-6 mb-4">
                                <div class="card border-left-primary shadow h-100 py-2">
                                    <div class="card-body">
                                        <div class="row no-gutters align-items-center">
                                            <div class="col mr-2">
                                                <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">
                                                    Average Bounce Rate (monthly change)
                                                </div>
                                                <div class="h5 mb-0 font-weight-bold text-gray-800"><%= bounceRate  %> (<%= bounceRatePrev  %>)</div>
                                            </div>
                                            <div class="col-auto">
                                                <i class="fas fa-exclamation fa-2x text-gray-300"></i>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- Pending Requests Card Example -->
                            <div class="col-xl-2 col-md-6 mb-4">
                                <div class="card border-left-primary shadow h-100 py-2">
                                    <div class="card-body">
                                        <div class="row no-gutters align-items-center">
                                            <div class="col mr-2">
                                                <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">
                                                   Average Unsubscribe Rate (monthly change)
                                                </div>
                                                <div class="h5 mb-0 font-weight-bold text-gray-800"><%= unsubRate  %> (<%= unsubRatePrev  %>)</div>
                                            </div>
                                            <div class="col-auto">
                                                <i class="fas fa-minus-square fa-2x text-gray-300"></i>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Content Row -->

                        <!-- DataTales Example -->
                        <div class="card shadow mb-4">
                            <div class="card-header py-3">
                                <h6 class="m-0 font-weight-bold text-primary">Recent Communications</h6>
                            </div>
                            <div class="card-body">
                                <div class="table-responsive">
                                    <asp:GridView ID="gvComms" runat="server" AutoGenerateColumns="false">
                                        <Columns>
                                            <asp:BoundField DataField="dateofSend" HeaderText="Date Sent" />
                                            <asp:BoundField DataField="subjectLine" HeaderText="Subject Line" />
                                            <asp:BoundField DataField="msgURl" HeaderText="URL" />
                                            <asp:BoundField DataField="areaOfInterest" HeaderText="Area of Interest" />
                                            <asp:BoundField DataField="language" HeaderText="Language" />
                                        </Columns>
                                    </asp:GridView>
                                </div>
                            </div>
                        </div>

                    </div>
                    <!-- /.container-fluid -->

                </div>
                <!-- End of Main Content -->

                <!-- Footer -->
                <footer class="sticky-footer bg-white">
                    <div class="container my-auto">
                        <div class="copyright text-center my-auto">
                        </div>
                    </div>
                </footer>
                <!-- End of Footer -->

            </div>
            <!-- End of Content Wrapper -->

        </div>
        <!-- End of Page Wrapper -->

        <!-- Scroll to Top Button-->
        <a class="scroll-to-top rounded" href="#page-top">
            <i class="fas fa-angle-up"></i>
        </a>


        <!-- Bootstrap core JavaScript-->
        <script src="vendor/jquery/jquery.min.js"></script>
        <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

        <!-- Core plugin JavaScript-->
        <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

        <!-- Custom scripts for all pages-->
        <script src="js/sb-admin-2.min.js"></script>

        <!-- Page level plugins -->
        <script src="vendor/chart.js/Chart.min.js"></script>

        <!-- Page level custom scripts -->
        <script src="js/demo/chart-area-demo.js"></script>
        <script src="js/demo/chart-pie-demo.js"></script>
        <link rel="stylesheet" href="https://cdn.datatables.net/1.13.7/css/jquery.dataTables.css" />

        <script src="https://cdn.datatables.net/1.13.7/js/jquery.dataTables.js"></script>
        <script src="https://code.highcharts.com/highcharts.js"></script>
        <script src="https://code.jscharting.com/latest/jscharting.js"></script>

        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.css">
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/buttons/1.5.6/css/buttons.dataTables.min.css" />
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/responsive/2.2.3/css/responsive.dataTables.min.css" />


        <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.js"></script>
        <script type="text/javascript" charset="utf-8" src="https://cdn.datatables.net/buttons/1.5.6/js/dataTables.buttons.min.js"></script>
        <script type="text/javascript" language="javascript" src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/vfs_fonts.js"></script>
        <script type="text/javascript" language="javascript" src="https://cdn.datatables.net/buttons/1.5.6/js/buttons.html5.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/yadcf/0.9.4/jquery.dataTables.yadcf.js" integrity="sha256-j83V52uLomZxGL9GIZ7eyiv32ntFn7Kr6WQSfz3mvRs=" crossorigin="anonymous"></script>
        <script type="text/javascript" language="javascript" src="https://cdn.datatables.net/responsive/2.2.3/js/dataTables.responsive.min.js"> </script>


        <script>
            $(document).ready(function () {
                var Commstable = $('#gvComms').DataTable({
                    orderCellsTop: true,
                    "order": [[0, "desc"]],
                    columnDefs: [
                        {
                            "render": function (data, type, row) {
                                return '<a href="email.aspx?c=' + row[2] + '">' + row[1] + ' </a>';
                            },
                            "title": "Message",
                            "targets": [1]
                        },
                        {
                            "targets": [3, 4],
                            "sortable": false
                        },
                        {
                            "targets": [2],
                            "visible": false
                        }],
                    initComplete: function () {

                        this.api().columns([3, 4]).every(function () {
                            var column = this;
                            var select = $('<select><option value="">' + $(this.header()).text() + '</option></select>')
                                .appendTo($(column.header()).empty())
                                .on('change', function () {
                                    var val = $.fn.dataTable.util.escapeRegex(
                                        $(this).val()
                                    );

                                    column
                                        .search(val ? '^' + val + '$' : '', true, false)
                                        .draw();
                                });

                            column.data().unique().sort().each(function (d, j) {
                                select.append('<option value="' + d + '">' + d + '</option>')
                            });
                        });
                    }
                });

            });





        </script>
    </form>
</body>

</html>
