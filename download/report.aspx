<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="report.aspx.vb" Inherits="M2M_Redesign.report" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Download Data Reports</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
    <link href="//cdn.datatables.net/1.13.3/css/jquery.dataTables.min.css" rel="stylesheet" />
    <link href="https://cdn.datatables.net/searchpanes/2.1.2/css/searchPanes.dataTables.min.css" />
    <link href="https://cdn.datatables.net/select/1.6.2/css/select.dataTables.min.css" />
    <style>
        .highlight{
           background-color: #f6fcc7;        }
        .fullCircle
{
  width: 20px;
  height:20px;
  bordeR: 1px solid;
  border-radius: 50%;
  float:left;
  margin-right:20px;
  }
    </style>
</head>

<body>
    <form id="form1" runat="server">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <h1>Download Data</h1>
                    <p>Click on the table headings to sort the data and update the chart display. Click the <em>Export to Excel</em> button to download the source data, which includes the email addresses and intended uses specified by the user.</p>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                <asp:PlaceHolder ID="PlaceHolder1" runat="server" />
                </div>
                <div class="col-md-12">
                    <div class="fullCircle highlight">
    </div> Denotes a download where the form was Skipped, or not filled in entirely.
                </div>
            </div>
            
        </div>
    </form>


    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
    <script src="//cdn.datatables.net/1.13.3/js/jquery.dataTables.min.js"></script>
  <script src="https://cdn.datatables.net/buttons/2.3.6/js/dataTables.buttons.min.js"></script>
    <script src="https://cdn.datatables.net/select/1.6.2/js/dataTables.select.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/pdfmake.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/vfs_fonts.js"></script>
<script src="https://cdn.datatables.net/buttons/2.3.6/js/buttons.html5.min.js"></script>
<script src="https://cdn.datatables.net/buttons/2.3.6/js/buttons.print.min.js"></script>
    <script src="https://code.highcharts.com/highcharts.js"></script>
    

    <script>
        $(document).ready(function () {

            var table = $('#downloads').DataTable(
                {
                    "createdRow": function (row, data, dataIndex) {
                        console.log(data[1]);
                        if (data[1] == "Skipped"|| data[1].length < 1) {
                            
                         //   $(row).find("td").eq(0).addClass('highlight');
                         //   $(row).addClass('highlight');
                            $(row).children().each(function (index, td) {
                                $(this).addClass('highlight');
                            });
                        }
                    },
                    dom: 'Bfrtip',

                    buttons: [
                        { extend: 'excel', text: 'Export to Excel' }
                    ],
                paging: true,
                ordering: true,
                    searching: true,

                    bInfo: true,
                    searchPanes: {
                        controls: false
                    },
                order: [[0, 'asc']],
                columnDefs: [
                    { visible: false, targets: [3,6] },
                ],
            });
    

        // Create the chart with initial data
        var container = $('<div/>').insertBefore(table.table().container());

        var chart = Highcharts.chart(container[0], {
            chart: {
                type: 'pie',
            },
            title: {
                text: 'Downloads of Each Resource',
            },
            series: [
                {
                    data: chartData(table),
                },
            ],
        });

        // On each draw, update the data in the chart
        table.on('draw', function () {
            chart.series[0].setData(chartData(table));
        });

        function chartData(table) {
            var counts = {};

            // Count the number of entries for each position
            table
                .column(0, { search: 'applied' })
                .data()
                .each(function (val) {
                    if (counts[val]) {
                        counts[val] += 1;
                    } else {
                        counts[val] = 1;
                    }
                });

            // And map it to the format highcharts uses
            return $.map(counts, function (val, key) {
                return {
                    name: key,
                    y: val,
                };
            });
            }


        });
    </script>
</body>
</html>
