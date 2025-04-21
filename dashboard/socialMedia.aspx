<%@ Page Title="Social Media Dashboard" Language="vb" AutoEventWireup="false" MasterPageFile="~/management/MasterPage.master" CodeBehind="social-media.aspx.vb" Inherits="M2M_Redesign.social_media" %>
<asp:Content ID="Content1" ContentPlaceHolderID="PageTitle" runat="server">
    Social Media Dashboard
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <h2 class="my-4">Social Media Performance Overview</h2>

        <!-- Chart Section -->
        <div id="chart_div" class="mb-4" style="height: 500px;"></div>

        <!-- Filter for Platform -->
        <div class="mb-3">
            <label for="platformFilter" class="form-label">Filter by Platform:</label>
            <select id="platformFilter" class="form-select">
                <option value="">All</option>
                <option value="LinkedIn">LinkedIn</option>
                <option value="Facebook">Facebook</option>
                <option value="X">X</option>
            </select>
        </div>

        <!-- Table Section -->
        <table id="socialMediaTable" class="table table-striped table-bordered">
            <thead>
                <tr>
                    <th>Platform</th>
                    <th>Month</th>
                    <th>Followers</th>
                    <th>Posts</th>
                    <th>Engagement Rate (%)</th>
                </tr>
            </thead>
            <tbody>
                <%= TableRows %>
            </tbody>
        </table>
    </div>

    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.datatables.net/1.13.6/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.13.6/js/dataTables.bootstrap5.min.js"></script>

    <script>
        // Load Google Charts
        google.charts.load('current', { packages: ['corechart'] });
        google.charts.setOnLoadCallback(drawChart);

        function drawChart() {
            var data = google.visualization.arrayToDataTable([
                ['Month', 'LinkedIn', 'Facebook', 'X'],
                <%= ChartData %>
            ]);

            var options = {
                title: 'Follower Trends Over Time',
                curveType: 'function',
                legend: { position: 'bottom' },
                height: 500
            };

            var chart = new google.visualization.LineChart(document.getElementById('chart_div'));
            chart.draw(data, options);
        }

        // Initialize DataTable with platform filter
        $(document).ready(function () {
            var table = $('#socialMediaTable').DataTable({
                dom: 'lrtip', // Removes the search box
            });

            $('#platformFilter').on('change', function () {
                table.column(0).search(this.value).draw();
            });
        });
    </script>
</asp:Content>
