<%@ Page Title="Communications" Language="vb" AutoEventWireup="false" MasterPageFile="~/management/MasterPage.master" CodeBehind="comms.aspx.vb" Inherits="M2M_Redesign.comms" %>

<asp:Content ID="Content1" ContentPlaceHolderID="PageTitle" runat="server">
    Recent Communications Metrics
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <!-- Header and Add New Data Button -->
    <h1>Recent Communications Metrics</h1>
    <button type="button" class="btn btn-primary mb-4" onclick="window.location.href='manage-comms.aspx'">Add New Mailing List Data</button>
    
    <!-- Canvas for Chart (Positioned Above the Table) -->
    <canvas id="snapshotChart" style="width:100%; max-height:400px; margin-bottom: 20px;"></canvas>
    
    <!-- Communications Table -->
    <table id="commsTable" class="display table table-striped" style="width:100%">
        <thead>
            <tr>
                <th>Subject Line</th>
                <th>Area of Interest</th>
                <th style="white-space: nowrap;">Date Sent</th> <!-- Prevent line breaks in Date Sent -->
                <th>Subscribers</th>
                <th>Open Rate</th>
                <th>Click Rate</th>
                <th>Newsletter</th>
                <th>Actions</th> <!-- Actions column for buttons -->
            </tr>
        </thead>
        <tbody>
            <asp:Repeater ID="repeaterComms" runat="server">
                <ItemTemplate>
                    <tr>
                        <td><%# Eval("subjectLine") %></td>
                        <td><%# Eval("areaOfInterest") %></td>
                        <td><%# Eval("dateSent", "{0:yyyy-MM-dd}") %></td>
                        <td><%# String.Format("{0:N0}", Eval("snapshotSubs")) %></td> <!-- Comma-separated Subscribers -->
                        <td>
                            <span style='<%# GetColorForOpenRate(Convert.ToDouble(Eval("openRate"))) %>'>
                                <%# String.Format("{0:F2}", Eval("openRate")) %> %
                            </span>
                        </td>
                        <td>
                            <span style='<%# GetColorForClickRate(Convert.ToDouble(Eval("clickRate"))) %>'>
                                <%# String.Format("{0:F2}", Eval("clickRate")) %> %
                            </span>
                        </td>
                        <td><%# If(IsDBNull(Eval("newsletter")), "", If(Convert.ToBoolean(Eval("newsletter")), "Newsletter", "")) %></td>
                        <td>
                            <!-- Bootstrap-styled icon buttons with Font Awesome -->
                            <button class="btn btn-sm btn-primary" onclick="window.open('<%# Eval("msgURL") %>', '_blank')" title="View">
                                <i class="fas fa-eye"></i>
                            </button>
                            <button class="btn btn-sm btn-secondary" onclick="window.location.href='manage-comms.aspx?id=<%# Eval("commID") %>'" title="Edit">
                                <i class="fas fa-pencil-alt"></i>
                            </button>
                        </td>
                    </tr>
                </ItemTemplate>
            </asp:Repeater>
        </tbody>
    </table>

    <!-- Include DataTables, jQuery, Font Awesome, Bootstrap, and Chart.js -->
    <link rel="stylesheet" href="https://cdn.datatables.net/1.11.5/css/jquery.dataTables.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

    <script type="text/javascript">
        $(document).ready(function () {
            // Initialize DataTables with dropdown filters
            var table = $('#commsTable').DataTable({
                ordering: false, // Disable sorting
                pageLength: 10, // Example page length; adjust based on needs
                initComplete: function () {
                    // Area of Interest Filter
                    this.api().columns(1).every(function () {
                        var column = this;
                        var select = $('<select class="form-control form-control-sm"><option value="">All</option></select>')
                            .appendTo($(column.header()).empty())
                            .on('change', function () {
                                var val = $.fn.dataTable.util.escapeRegex($(this).val());
                                column.search(val ? '^' + val + '$' : '', true, false).draw();
                            });
                        column.data().unique().sort().each(function (d) {
                            select.append('<option value="' + d + '">' + d + '</option>')
                        });
                    });

                    // Newsletter Filter
                    this.api().columns(6).every(function () {
                        var column = this;
                        var select = $('<select class="form-control form-control-sm"><option value="">All</option><option value="Newsletter">Newsletter</option><option value="Not Newsletter">Not Newsletter</option></select>')
                            .appendTo($(column.header()).empty())
                            .on('change', function () {
                                var val = $(this).val();
                                column.search(val ? '^' + val + '$' : '', true, false).draw();
                            });
                    });
                }
            });

            // Reference to hold the chart instance
            var snapshotChart;

            // Function to initialize the chart with data
            function createSnapshotChart(labels, snapshotSubsData, openGuideData, clickGuideData, openRateData, clickRateData) {
                var ctx = document.getElementById('snapshotChart').getContext('2d');
                snapshotChart = new Chart(ctx, {
                    type: 'line',
                    data: {
                        labels: labels, // Date labels populated dynamically
                        datasets: [
                            {
                                label: 'Subscribers',
                                data: snapshotSubsData,
                                backgroundColor: 'rgba(173, 216, 230, 0.3)', // Subtle light blue for the background
                                borderColor: 'rgba(173, 216, 230, 0.5)',
                                fill: true,
                                pointRadius: 3,
                                borderWidth: 2,
                                tension: 0.3 // Smooth curve
                            },
                            {
                                label: 'Open Rate Guide (16%)',
                                data: openGuideData,
                                borderColor: 'rgba(0, 128, 0, 0.2)',
                                borderWidth: 1,
                                borderDash: [5, 5],
                                fill: false
                            },
                            {
                                label: 'Click Rate Guide (2%)',
                                data: clickGuideData,
                                borderColor: 'rgba(0, 0, 128, 0.2)',
                                borderWidth: 1,
                                borderDash: [5, 5],
                                fill: false
                            },
                            {
                                label: 'Open Rate',
                                data: openRateData,
                                borderColor: 'green',
                                backgroundColor: 'transparent',
                                borderWidth: 2,
                                pointRadius: 3,
                                fill: false,
                                tension: 0.3 // Smooth curve
                            },
                            {
                                label: 'Click Rate',
                                data: clickRateData,
                                borderColor: 'blue',
                                backgroundColor: 'transparent',
                                borderWidth: 2,
                                pointRadius: 3,
                                fill: false,
                                tension: 0.3 // Smooth curve
                            }
                        ]
                    },
                    options: {
                        scales: {
                            x: { title: { display: true, text: 'Date Sent' } },
                            y: { title: { display: true, text: 'Subscribers and Percentages' } }
                        },
                        plugins: {
                            tooltip: {
                                callbacks: {
                                    label: function (tooltipItem) {
                                        return table.row(tooltipItem.dataIndex).data()[0]; // Subject line only
                                    }
                                }
                            }
                        }
                    }
                });
            }

            // Function to update chart data based on visible rows in DataTable
            function updateChartData() {
                var labels = [];
                var snapshotSubsData = [];
                var openGuideData = [];
                var clickGuideData = [];
                var openRateData = [];
                var clickRateData = [];

                // Use only currently visible rows on the current page
                var pageInfo = table.page.info();
                var start = pageInfo.start; // Start index of the current page
                var end = pageInfo.end; // End index of the current page

                for (var i = start; i < end; i++) {
                    var data = table.row(i).data();
                    var snapshotSubs = parseInt(data[3].replace(/,/g, '')); // Parse comma-separated Subscribers

                    // Extract numeric value for Open Rate and Click Rate by removing non-numeric characters
                    var openRatePercent = parseFloat(data[4].replace(/[^\d.-]/g, ''));
                    var clickRatePercent = parseFloat(data[5].replace(/[^\d.-]/g, ''));

                    // Calculate Open and Click Rates as a percentage of snapshotSubs
                    var openRate = (openRatePercent / 100) * snapshotSubs;
                    var clickRate = (clickRatePercent / 100) * snapshotSubs;

                    labels.unshift(data[2]); // Date Sent (using unshift to reverse order)
                    snapshotSubsData.unshift(snapshotSubs);
                    openGuideData.unshift(snapshotSubs * 0.16); // 16% of Subscribers for Open Rate Guide
                    clickGuideData.unshift(snapshotSubs * 0.02); // 2% of Subscribers for Click Rate Guide
                    openRateData.unshift(openRate); // Calculated Open Rate as count
                    clickRateData.unshift(clickRate); // Calculated Click Rate as count
                }

                console.log("Chart Data:", { labels, snapshotSubsData, openGuideData, clickGuideData, openRateData, clickRateData });

                // Destroy the existing chart instance if it exists
                if (snapshotChart) {
                    snapshotChart.destroy();
                }

                // Recreate the chart with new data
                createSnapshotChart(labels, snapshotSubsData, openGuideData, clickGuideData, openRateData, clickRateData);
            }

            // Update chart data whenever the table is filtered or paginated
            table.on('draw', updateChartData);

            // Initial chart data load
            updateChartData();
        });
    </script>
</asp:Content>
