<%@ Page Title="Events and Resources Tracking" Language="vb" MasterPageFile="~/management/MasterPage.master" AutoEventWireup="false" CodeBehind="events-resources.aspx.vb" Inherits="M2M_Redesign.events_resources" %>

<asp:Content ID="Content1" ContentPlaceHolderID="PageTitle" runat="server">
    Events and Resources Tracking
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <form runat="server">
        <style>
            .eventStyle{
                background:rgba(54, 162, 235, 0.6);
            }
            .resourceStyle{
                background:rgba(75, 192, 192, 0.6);
            }
        </style>
        <h1>Events and Resources Metrics</h1>
        <p>The following information is visit data for the events and resources listed on the GMI site. Data recording in this way <strong>began October 26, 2024</strong>. For data before then, please check Google Analytics. Updates to this page will include filtering by GMI sectors, and exporting data.</p>
        <h2 id="lblDateRange">Current Date Range: <%= Date.Today.AddDays(-(Date.Today.DayOfWeek - DayOfWeek.Sunday)).ToString("dddd, MMMM d, yyyy") %> to <%= Date.Today.ToString("dddd, MMMM d, yyyy") %></h2>
        
        <div class="row mb-4">
            <div class="col-md-12">
                <asp:Label ID="lblError" runat="server" CssClass="text-danger"></asp:Label>
            </div>
            <div class="col-md-4">
                <asp:TextBox ID="txtStartDate" runat="server" TextMode="Date" CssClass="form-control" />
            </div>
            <div class="col-md-4">
                <asp:TextBox ID="txtEndDate" runat="server" TextMode="Date" CssClass="form-control" />
            </div>
            <div class="col-md-4">
            <asp:Button ID="btnUpdate" runat="server" Text="Update" CssClass="btn btn-primary" OnClick="btnUpdate_Click" />
                </div>
        </div>

        <div class="row mb-4">
    <!-- Events Chart Column -->
    <div class="col-md-6">
        <div class="card">
            <div class="card-header text-center eventStyle">
                <h5>Events Views</h5>
            </div>
            <div class="card-body">
                <canvas id="eventsChart"></canvas>
            </div>
        </div>
    </div>

    <!-- Resources Chart Column -->
    <div class="col-md-6 ">
        <div class="card">
            <div class="card-header text-center resourceStyle">
                <h5>Resources Views</h5>
            </div>
            <div class="card-body">
                <canvas id="resourcesChart"></canvas>
            </div>
        </div>
    </div>
</div>
        <div class="row mb-4">
        <div class="col-md-6 mb-3 ">
    <label for="sectorFilter" style="color:rgba(54, 162, 235, 1);font-weight:bold;">Filter Events by Sector:</label>
    <select id="sectorFilter" class="form-control">
        <option value="">All Sectors</option>
        <option value="biogas">Biogas</option>
        <option value="agri">Agriculture</option>
        <option value="msw">Municipal Solid Waste</option>
        <option value="ww">Wastewater</option>
        <option value="coal">Coal Mines</option>
        <option value="oilngas">Oil & Gas</option>
        <option value="steer">Steering Committee</option>
    </select>
</div>
                    <div class="col-md-6 mb-3 ">
    <label for="sectorFilter2" style="color:rgba(75, 192, 192, 1);font-weight:bold">Filter Resources by Sector:</label>
    <select id="sectorFilter2" class="form-control">
        <option value="">All Sectors</option>
        <option value="1">Agriculture</option>
        <option value="3">Biogas</option>
        <option value="4">Coal Mines</option>
        <option value="5">Municipal Solid Waste</option>
        <option value="6">Oil & Gas</option>
        <option value="7">Steering</option>
        <option value="8">Waste Water</option>
        <option value="9">Multi</option>
    </select>
</div>
            </div>

        <!-- Events and Resources Tables -->
        <div class="row">
            <div class="col-md-6 ">
                <table id="eventsTable" class="display">
                    <thead>
                        <tr>
                            <th>Name</th>
                            <th>Count</th>
                            <th>LookUpID</th>
                            <th>Sectors</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% For Each row As System.Data.DataRow In eventsData.Rows %>
                            <tr>
                                <td><%= row("Name") %></td>
                                <td><%= row("Count") %></td>
                                <td><%= row("lookupID") %></td>
                                <td><%= row("Sectors") %></td>
                            </tr>
                        <% Next %>
                    </tbody>
                </table>
            </div>
            <div class="col-md-6 ">
                <table id="resourcesTable" class="display">
                    <thead>
                        <tr>
                            <th>Name</th>
                            <th>Count</th>
                            <th>LookUpID</th>
                            <th>Sectors</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% For Each row As System.Data.DataRow In resourcesData.Rows %>
                            <tr>
                                <td><%= row("Name") %></td>
                                <td><%= row("Count") %></td>
                                <td><%= row("lookupID") %></td>
                                <td><%= row("sectorIDs") %></td>
                            </tr>
                        <% Next %>
                    </tbody>
                </table>
            </div>
        </div>
    </form>

    <!-- Include jQuery and DataTables JS and CSS -->
    <link rel="stylesheet" href="https://cdn.datatables.net/1.11.5/css/jquery.dataTables.min.css">
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js"></script>

    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>



    <script>
        $(document).ready(function () {
            // Initialize DataTables for events and resources
            var eventsTable = $('#eventsTable').DataTable({
                "order": [[1, "desc"]],
                "pageLength": 10,
                "columnDefs": [
                    {
                        "targets": 2, // Hide lookupID column
                        "visible": false,
                        "searchable": false
                    },
                    {
                        "targets": 3,
                        "visible": false
                    },
                    {
                        // Clickable links in Name column
                        "targets": 0,
                        "render": function (data, type, row) {
                            var lookupID = row[2]; // Assuming lookupID is in third column
                            return `<a href="https://globalmethane.org/events/details.aspx?eventid=${lookupID}" target="_blank">${data}</a>`;
                        }
                    }
                ]
            });

            var resourcesTable = $('#resourcesTable').DataTable({
                "order": [[1, "desc"]],
                "pageLength": 10,
                "columnDefs": [
                    {
                        "targets": 2, // Hide lookupID column
                        "visible": false,
                        "searchable": false
                    },
                    {
                        "targets": 3,
                        "visible": false
                    },
                    {
                        // Clickable links in Name column
                        "targets": 0,
                        "render": function (data, type, row) {
                            var lookupID = row[2]; // Assuming lookupID is in third column
                            return `<a href="https://globalmethane.org/resources/details.aspx?resourceid=${lookupID}" target="_blank">${data}</a>`;
                        }
                    }
                ]
            });

            // Function to initialize charts with custom colors
            function initializeChart(elementId, label, bgColor, borderColor) {
                return new Chart(document.getElementById(elementId).getContext('2d'), {
                    type: 'bar',
                    data: {
                        labels: [],
                        datasets: [{
                            label: label,
                            backgroundColor: bgColor,
                            borderColor: borderColor,
                            borderWidth: 1,
                            data: []
                        }]
                    },
                    options: {
                        responsive: true,
                        scales: {
                            x: {
                                display: false // Hide x-axis labels
                            },
                            y: {
                                beginAtZero: true
                            }
                        },
                        plugins: {
                            tooltip: {
                                callbacks: {
                                    title: function (tooltipItems) {
                                        return tooltipItems[0].label;
                                    }
                                }
                            }
                        }
                    }
                });
            }

            // Initialize Events and Resources Charts with distinct colors
            var eventsChart = initializeChart('eventsChart', 'Page Views', 'rgba(54, 162, 235, 0.6)', 'rgba(54, 162, 235, 1)');
            var resourcesChart = initializeChart('resourcesChart', 'Page Views', 'rgba(75, 192, 192, 0.6)', 'rgba(75, 192, 192, 1)');

            // Function to update chart with DataTable data
            function updateChartFromTable(dataTable, chart) {
                var labels = [];
                var data = [];

                // Loop through visible rows
                dataTable.rows({ search: 'applied', page: 'current' }).every(function () {
                    var rowData = this.data();
                    labels.push(rowData[0]); // Name
                    data.push(rowData[1]);   // Count
                });

                // Update chart data
                chart.data.labels = labels;
                chart.data.datasets[0].data = data;
                chart.update();
            }

            // Bind update function to DataTable draw events
            eventsTable.on('draw', function () {
                updateChartFromTable(eventsTable, eventsChart);
            });

            resourcesTable.on('draw', function () {
                updateChartFromTable(resourcesTable, resourcesChart);
            });

            // Initial chart update
            updateChartFromTable(eventsTable, eventsChart);
            updateChartFromTable(resourcesTable, resourcesChart);

            // Sync end date with start date on change
            $('#<%= txtStartDate.ClientID %>').on('change', function () {
            $('#<%= txtEndDate.ClientID %>').val($(this).val());
        });

        // Sector Filter Logic
        $('#sectorFilter').on('change', function () {
            var selectedSector = $(this).val();
            if (selectedSector) {
                eventsTable.column(3).search(selectedSector, true, false).draw();
            } else {
                eventsTable.column(3).search('').draw(); // Clear filter when "All Sectors" is selected
            }
        });

            // Sector Filter Logic
            $('#sectorFilter2').on('change', function () {
                var selectedSector2 = $(this).val();
                if (selectedSector2) {
                    resourcesTable.column(3).search(selectedSector2, true, false).draw();
                } else {
                    resourcesTable.column(3).search('').draw(); // Clear filter when "All Sectors" is selected
                }
            });
    });
    </script>




</asp:Content>
