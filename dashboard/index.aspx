<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="index.aspx.vb" Inherits="M2M_Redesign.index17" %>
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
    <form id="form1" runat="server">
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
            <li class="nav-item active">
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
            <li class="nav-item">
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
                        <div class="col-xl-3 col-md-6 mb-4">
                            <div class="card border-left-primary shadow h-100 py-2">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">
                                                Count of Partner Countries</div>
                                            <div class="h5 mb-0 font-weight-bold text-gray-800"><%= countOfPN  %></div>
                                        </div>
                                        <div class="col-auto">
                                            <i class="fas fa-map-marked fa-2x text-gray-300"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>


                        <!-- Earnings (Monthly) Card Example -->
                        <div class="col-xl-3 col-md-6 mb-4">
                            
                        </div>

                        <!-- Pending Requests Card Example -->
                        <div class="col-xl-3 col-md-6 mb-4">
                            
                        </div>
                    </div>

                    <!-- Content Row -->

                                        <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">Partner Countries</h6>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                            <asp:GridView ID="PCTable" runat="server" AutoGenerateColumns="false">
                    <Columns>
                        <asp:BoundField DataField="countryName" HeaderText="Country Name" />
                        <asp:BoundField DataField="countryYearJoined" HeaderText="Year Joined" />
                        <asp:BoundField DataField="SteeringCommitteeMember" HeaderText="Steering Committee Member" />
                    </Columns>
                </asp:GridView>
                            </div>
                        </div>
                    </div>
                                        <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">Partner Country Delegates</h6>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                            <asp:GridView ID="dtable" runat="server" AutoGenerateColumns="false">
                    <Columns>
                        <asp:BoundField DataField="countryName" HeaderText="Country Name" />
                        <asp:BoundField DataField="FirstName" HeaderText="First Name" />
                        <asp:BoundField DataField="LastName" HeaderText="Last Name" />
                        <asp:BoundField DataField="email" HeaderText="Email" />
                        <asp:BoundField DataField="OrganizationName" HeaderText="Organization Name" />
                        <asp:BoundField DataField="committeeName" HeaderText="Committee Name" />
                        <asp:BoundField DataField="role" HeaderText="Role" />
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
    <script
  src="https://code.jquery.com/jquery-3.7.1.min.js"
  integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo="
  crossorigin="anonymous"></script>
    <script src="https://cdn.datatables.net/1.13.6/js/jquery.dataTables.js"></script>
    <script>
        $(document).ready(function () {
            $('#PCTable').DataTable({
                info: false,
                ordering: false,
                initComplete: function () {

                    this.api().columns([0, 1, 2]).every(function () {
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
            $('#dtable').DataTable({
                initComplete: function () {

                    this.api().columns([0, 5, 6]).every(function () {
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