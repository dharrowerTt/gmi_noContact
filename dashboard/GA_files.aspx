<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="GA_files.aspx.vb" Inherits="M2M_Redesign.GA_files" %>
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
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/brands.min.css" integrity="sha512-8RxmFOVaKQe/xtg6lbscU9DU0IRhURWEuiI0tXevv+lXbAHfkpamD4VKFQRto9WgfOJDwOZ74c/s9Yesv3VvIQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
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
                <li class="nav-item">
                    <a class="nav-link" href="mailChimp.aspx">
                        <i class="fas fa-fw fa-envelope"></i>
                        <span>Mailing List</span></a>
                </li>
                <li class="nav-item active">
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

   
                                <form id="form1" runat="server">
        <div>
            <h2>List of Uploaded Files</h2>
            <asp:Repeater ID="FilesRepeater" runat="server">
                <HeaderTemplate>
                    <ul>
                </HeaderTemplate>
                <ItemTemplate>
                    <li><a href='<%# Eval("FileUrl") %>' target="_blank"><%# Eval("FileName") %></a> - <%# Eval("UploadDate") %></li>
                </ItemTemplate>
                <FooterTemplate>
                    </ul>
                </FooterTemplate>
            </asp:Repeater>
        </div>
    </form>


                        </div>

                        <!-- Content Row -->



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

    
</body>

</html>
