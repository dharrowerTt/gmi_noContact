<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="resources.aspx.vb" Inherits="M2M_Redesign.resources1" %>




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
            #Bar4,
        #Bar3,
        #Bar2,
        #Bar1 {
            display: none;
        }

            #KPI1 th{
                display:none;
            }

            #KPI1{
                color: #5a5c69!important;
    font-weight: 700!important;
    margin-bottom: 0!important;
    font-size: 1.25rem;
    border: none;
            }
            #KPI1 tr td{
    border: none;
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
            <li class="nav-item active">
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
                                                Count of Resources</div>
                                                                    <asp:GridView ID="KPI1" runat="server" AutoGenerateColumns="false">
                            <Columns>
                                <asp:BoundField DataField="totalResources" HeaderText="total resources" />
                            </Columns>
                        </asp:GridView>
                                        </div>
                                        <div class="col-auto">
                                            <i class="fas fa-file-alt fa-2x text-gray-300"></i>
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
                    <div class="row">
                        <div class="col-xl-3 col-md-6 mb-4">
                                                   <asp:GridView ID="Bar1" runat="server" AutoGenerateColumns="false">
                            <Columns>
                                <asp:BoundField DataField="resourceCategory" HeaderText="category" />
                                <asp:BoundField DataField="numResources" HeaderText="Count" />
                            </Columns>
                        </asp:GridView>
                            <div id="chartDivCategory1" style="max-width: 740px;height: 400px;margin: 0px auto;"></div>
    
                        </div>
                        <div class="col-xl-3 col-md-6 mb-4">
                                                    <asp:GridView ID="Bar2" runat="server" AutoGenerateColumns="false">
                            <Columns>
                                <asp:BoundField DataField="resourceCategory" HeaderText="category" />
                                <asp:BoundField DataField="numResources" HeaderText="Count" />
                            </Columns>
                        </asp:GridView>
                             <div id="chartDivCategory2" style="max-width: 740px;height: 400px;margin: 0px auto;"></div>
                        </div>
                        <div class="col-xl-3 col-md-6 mb-4">
                                                           <asp:GridView ID="Bar3" runat="server" AutoGenerateColumns="false">
                                    <Columns>
                                        <asp:BoundField DataField="sector" HeaderText="Sector" />
                                        <asp:BoundField DataField="numResources" HeaderText="Count" />
                                    </Columns>
                                </asp:GridView>
                             <div id="chartDivSector" style="max-width: 740px;height: 400px;margin: 0px auto;"></div>
                        </div>
                        <div class="col-xl-3 col-md-6 mb-4">
                                                            <asp:GridView ID="Bar4" runat="server" AutoGenerateColumns="false">
                                    <Columns>
                                        <asp:BoundField DataField="language" HeaderText="Language" />
                                        <asp:BoundField DataField="numResources" HeaderText="Count" />
                                    </Columns>
                                </asp:GridView>
                             <div id="chartDivLanguage" style="max-width: 740px;height: 400px;margin: 0px auto;"></div>
                        </div>
                    </div>

                    <!-- Content Row -->

                                        <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">Resource List</h6>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <asp:GridView ID="Table1" runat="server" AutoGenerateColumns="false">
                                    <Columns>
                                        <asp:BoundField DataField="resourceName" HeaderText="Name" />
                                        <asp:BoundField DataField="resourceYear" HeaderText="Year" />
                                        <asp:BoundField DataField="resourceCategory" HeaderText="Category" />
                                        <asp:BoundField DataField="languageValue" HeaderText="Language" />
                                        <asp:BoundField DataField="sectors" HeaderText="Sectors" />
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
        <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://cdn.datatables.net/1.13.7/css/jquery.dataTables.css" />

        <script src="https://cdn.datatables.net/1.13.7/js/jquery.dataTables.js"></script>
        <script src="https://code.highcharts.com/highcharts.js"></script>
        <script src="https://code.jscharting.com/latest/jscharting.js"></script>

        <script>
            $(document).ready(function () {
                $('#Table1').DataTable();
            });
        </script>

        <script type="text/javascript">
            var options = {
                debug: true,
                type: 'column',
                title_title_label_text: 'Take HTML and Chart it.',
                defauldefaultPoint_label_visible: true
            };

            JSC.ready().then(function () {
                options.series = getData('Bar4');
                new JSC.Chart('chartDivLanguage', options);

                options.series = getData('Bar3');
                new JSC.Chart('chartDivSector', options);

                options.series = getData('Bar2');
                new JSC.Chart('chartDivCategory2', options);

                options.series = getData('Bar1');
                new JSC.Chart('chartDivCategory1', options);
            });

            function getData(tableId) {
                var series = {
                    points: []
                };

                var rowItems = document.querySelectorAll('#' + tableId + ' tbody tr');

                for (var i = 0; i < rowItems.length; i++) {
                    var rowItem = rowItems[i];
                    var tds = rowItem.children;

                    if (tds[1].innerText.length === 0) {
                        series.name = tds[0].innerText;
                    } else {
                        var point = [tds[0].innerText, parseInt(tds[1].innerText)];
                        series.points.push(point);
                    }
                }

                return [series];
            }
        </script>
        </form>
</body>

</html>