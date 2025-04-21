<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="index.aspx.vb" Inherits="M2M_Redesign.index22" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
     <title>Coal Mine Methane (CMM) Mitigation Technology Provider Directory</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.datatables.net/2.0.1/css/dataTables.dataTables.css" />
    <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.3/css/select2.min.css">
    <style>
        table tbody td {
  vertical-align: top;
}
    </style>
     <!-- #include virtual="/includes/include_head.html" -->
</head>
<body>
    <!-- #include virtual="/includes/header.html" -->
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <h1>Coal Mine Methane (CMM) Mitigation Technology Provider Directory</h1>
                <hr>
                <p>EPA is providing this directory to share information about Coal Mine Methane (CMM) technology providers and services that can facilitate methane emission reduction activities. </p>


<p><strong>Add Your Company:</strong>  If you would like to add your company to the directory, <em style="color:#aa3333">[insert instructions]</em>. </p>

<p><strong>Instructions: </strong>

<ul><li>Filter the table by Company/Provider Name, Specialty/Service, CMM End Use, or Office Location by selecting options from the dropdown menu under each heading </li>

<li>Use the Search box to find results by keyword </li>

<li>Click the table headers to sort columns </li>
</ul>
</p>
            </div>
        </div>
        <div class="row">
            
            <div class="col-md-3"><span id="name"></span></div>
            <div class="col-md-3"><span id="service"></span></div>
            <div class="col-md-3"><span id="enduse"></span></div>
            <div class="col-md-3"><span id="location"></span></div>
        </div>
        <div class="row">
            <div class="col-md-12">
    <table id="CMM" class="stripe">
        <thead><tr><th></th><th>Company Name</th><th>Speciality/Service</th><th>End Use</th><th>Office Location</th></tr></thead><tbody>
         
        </tbody></table>
    </div>
    </div>
    </div>        
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
    <script src="https://cdn.datatables.net/2.0.1/js/dataTables.js"></script>
    <script type="text/javascript" charset="utf-8"  src="https://cdn.datatables.net/buttons/1.5.6/js/dataTables.buttons.min.js"></script>
    <script type="text/javascript" language="javascript" src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/vfs_fonts.js"></script>
	<script type="text/javascript" language="javascript" src="https://cdn.datatables.net/buttons/1.5.6/js/buttons.html5.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/yadcf/0.9.4/jquery.dataTables.yadcf.js" integrity="sha256-j83V52uLomZxGL9GIZ7eyiv32ntFn7Kr6WQSfz3mvRs=" crossorigin="anonymous"></script>
    <script type="text/javascript" language="javascript" src="https://cdn.datatables.net/responsive/2.2.3/js/dataTables.responsive.min.js"> </script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.3/js/select2.min.js"></script>
    
    <script>
        // Formatting function for row details - modify as you need
        function format(d) {
            // `d` is the original data object for the row
            return (
                '<h5>Details</h5><a href="' + d.Website + '">visit website</a><br>' + d.Description + '<br><strong>Point of Contact:</strong> <a href="mailto:' + d.POCEmail + '">' + d.POCName + '</a><br>' + d.POCAddress + '<br><strong>Example Projects: </strong>' + d.ExampleProjects
            );
        }

        let table = new DataTable('#CMM', {
            ajax: 'data.txt',
            columns: [
                {
                    className: 'dt-control',
                    orderable: false,
                    data: null,
                    defaultContent: ''
                },
                { data: 'Company Name' },
                { data: 'Speciality/Service' },
                { data: 'End Use' },
                { data: 'Office Location' }
            ],
            order: [[1, 'asc']],
            initComplete: function () {
                var table = this;

                this.api().columns(1).every(function () {
                    var column = this;
                    var select = $('<select class="select2 form-control" multiple="multiple"><option value="">Select All</option></select>')
                        .appendTo($('#name').empty().append('<label><strong>Filter by Company Name:</strong></label>'))
                        .on('change', function () {
                            var selectedValues = $(this).val();

                            if (selectedValues) {
                                // Use regex to match any of the selected values
                                var joinedValues = selectedValues.join('|');
                                column.search(joinedValues, true, false).draw();
                            } else {
                                // If no values selected, clear the filter
                                column.search('').draw();
                            }
                        });

                    // Populate the options
                    column.data().unique().sort().each(function (d, j) {
                        select.append('<option value="' + d + '">' + d + '</option>');
                    });

                    // Initialize Select2
                    select.select2();
                });

                // Filter by Service
                this.api().columns(2).every(function () {
                    var column = this;
                    var select = $('<select class="form-control" multiple="multiple"><option value="">Select All</option></select>')
                        .appendTo($('#service').empty().append('<label><strong>Filter by Speciality/Service:</strong></label>'))
                        .on('change', function () {
                            var selectedValues = $(this).val();

                            if (selectedValues) {
                                var joinedValues = selectedValues.join('|');
                                column.search(joinedValues, true, false).draw();
                            } else {
                                column.search('').draw();
                            }
                        });

                    // Create unique options
                    var uniqueOptions = [];
                    column.data().each(function (d) {
                        var values = d.split(";");
                        values.forEach(function (value) {
                            value = value.trim();
                            if (uniqueOptions.indexOf(value) === -1) {
                                uniqueOptions.push(value);
                                select.append('<option value="' + value + '">' + value + '</option>');
                            }
                        });
                    });

                    select.select2();
                });
                // Filter by Service
                this.api().columns(3).every(function () {
                    var column = this;
                    var select = $('<select class="form-control" multiple="multiple"><option value="">Select All</option></select>')
                        .appendTo($('#enduse').empty().append('<label><strong>Filter by End Use:</strong></label>'))
                        .on('change', function () {
                            var selectedValues = $(this).val();

                            if (selectedValues) {
                                var joinedValues = selectedValues.join('|');
                                column.search(joinedValues, true, false).draw();
                            } else {
                                column.search('').draw();
                            }
                        });

                    // Create unique options
                    var uniqueOptions = [];
                    column.data().each(function (d) {
                        var values = d.split(";");
                        values.forEach(function (value) {
                            value = value.trim();
                            if (uniqueOptions.indexOf(value) === -1) {
                                uniqueOptions.push(value);
                                select.append('<option value="' + value + '">' + value + '</option>');
                            }
                        });
                    });

                    select.select2();
                });
                // Filter by Location
                this.api().columns(4).every(function () {
                    var column = this;
                    var select = $('<select class="form-control" multiple="multiple"><option value="">Select All</option></select>')
                        .appendTo($('#location').empty().append('<label><strong>Filter by Location:</strong></label>'))
                        .on('change', function () {
                            var selectedValues = $(this).val();

                            if (selectedValues) {
                                var joinedValues = selectedValues.join('|');
                                column.search(joinedValues, true, false).draw();
                            } else {
                                column.search('').draw();
                            }
                        });

                    // Create unique options
                    var uniqueOptions = [];
                    column.data().each(function (d) {
                        var values = d.split(";");
                        values.forEach(function (value) {
                            value = value.trim();
                            if (uniqueOptions.indexOf(value) === -1) {
                                uniqueOptions.push(value);
                                select.append('<option value="' + value + '">' + value + '</option>');
                            }
                        });
                    });

                    select.select2();
                });

            }
        });








        // Add event listener for opening and closing details
        table.on('click', 'td.dt-control', function (e) {
            let tr = e.target.closest('tr');
            let row = table.row(tr);

            if (row.child.isShown()) {
                // This row is already open - close it
                row.child.hide();
            }
            else {
                // Open this row
                row.child(format(row.data())).show();
            }
        });
    </script>




</body>

</html>