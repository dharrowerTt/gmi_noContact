<%@ Page Language="VB" ContentType="text/html" ResponseEncoding="utf-8" CodeBehind="admin.aspx.vb"
    Inherits="M2M_Redesign.admin" %>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta name="description" content="Vali is a responsive and free admin theme built with Bootstrap 4, SASS and PUG.js. It's fully customizable and modular.">
    <!-- Twitter meta-->
    <meta property="twitter:card" content="summary_large_image">
    <meta property="twitter:site" content="@pratikborsadiya">
    <meta property="twitter:creator" content="@pratikborsadiya">
    <!-- Open Graph Meta-->
    <meta property="og:type" content="website">
    <meta property="og:site_name" content="Vali Admin">
    <meta property="og:title" content="Vali - Free Bootstrap 4 admin theme">
    <meta property="og:url" content="http://pratikborsadiya.in/blog/vali-admin">
    <meta property="og:image" content="http://pratikborsadiya.in/blog/vali-admin/hero-social.png">
    <meta property="og:description" content="Vali is a responsive and free admin theme built with Bootstrap 4, SASS and PUG.js. It's fully customizable and modular.">
    <title>GMC Admin</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Main CSS-->
    <link rel="stylesheet" type="text/css" href="css/main.css">
    <!-- Font-icon css-->
    <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
.fa-cogs:hover{
cursor: not-allowed;
}
</style>
  </head>
  <body class="app sidebar-mini rtl">
    <!-- Navbar-->
    <header class="app-header"><img src="../images/gmclogo_white.svg" height="40px" style="padding-top:4px;" />
      <!-- Sidebar toggle button--><a class="app-sidebar__toggle" href="#" data-toggle="sidebar" aria-label="Hide Sidebar"></a>
      <!-- Navbar Right Menu-->
      <ul class="app-nav">
        <!-- User Menu-->
       <!-- <li class="dropdown"><a class="app-nav__item" href="#" data-toggle="dropdown" aria-label="Open Profile Menu"><i class="fa fa-sign-out fa-lg"></i></a>
        </li>-->
      </ul>
    </header>
    <!-- Sidebar menu-->
    <div class="app-sidebar__overlay" data-toggle="sidebar"></div>
    <aside class="app-sidebar">
      <ul class="app-menu">
        <li><a class="app-menu__item active" href="admin.aspx"><i class="app-menu__icon fa fa-dashboard"></i><span class="app-menu__label">Overview</span></a></li>

      <!--  <li><a class="app-menu__item" href="charts.html"><i class="app-menu__icon fa fa-pie-chart"></i><span class="app-menu__label">Charts</span></a></li>-->
      </ul>
    </aside>
    <main class="app-content">
      <div class="app-title">
        <div>
          <h1>Overview</h1>
          <p>Submissions to the Global Methane Challenge.</p>
        </div>
      </div>
      <div class="row">
        <!--<div class="col-md-6">
          <div class="tile">
            <h3 class="tile-title">Monthly Sales</h3>
            <div class="embed-responsive embed-responsive-16by9">
                <div id="embed-api-auth-container"></div>
                <div id="chart-container"></div>
                <div id="view-selector-container"></div>
            </div>
          </div>
        </div>-->
        <div class="col-md-12">
          <div class="tile">
            <div class="tile-body">
              <table class="table table-hover table-bordered" id="sampleTable">
                <thead>
                  <tr>
                          <th>
                           Name
                          </th>
                          <th>
                            Job Title - Company
                          </th>
                          <th>
                            GMI Relationship
                          </th>
                          <th>
                            Commitment
                          </th>
                          <th>
                            Administration.
                          </th>
                            </tr>
                </thead>
                <tbody>
                 <asp:repeater id="countryRepeater" runat="server" onitemDataBound="countryItemDataBound">
                    <itemtemplate>
          <asp:Literal ID="litCountry" runat="server"></asp:Literal>
                 </itemtemplate>
                </asp:repeater>
                      </tbody>
                  </table>
                  </div>
          </div>
        </div>
      </div>


                        <asp:repeater id="Repeater1" runat="server" onitemDataBound="moreDetailsDataBound">
                    <itemtemplate>
          <asp:Literal ID="moreDetails" runat="server"></asp:Literal>
                 </itemtemplate>
                </asp:repeater>


    </main>
    <!-- Essential javascripts for application to work-->
    <script src="js/jquery-3.2.1.min.js"></script>
    <script src="js/popper.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/main.js"></script>
    <!-- The javascript plugin to display page loading on top-->
    <script src="js/plugins/pace.min.js"></script>
    <!-- Page specific javascripts-->
        <!-- Data table plugin-->
        <script type="text/javascript" src="js/plugins/jquery.dataTables.min.js"></script>
        <script type="text/javascript" src="js/plugins/dataTables.bootstrap.min.js"></script>
        <script type="text/javascript">$('#sampleTable').DataTable();</script>
    <script type="text/javascript" src="js/plugins/chart.js"></script>

   
  </body>
</html>