<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="search.aspx.vb" Inherits="M2M_Redesign.search" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Project Network | Global Methane Initiative</title>
    <!-- #include virtual="/includes/include_head.html" -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
</head>
<body>
    <!-- #include virtual="/includes/header.html" -->
    <!-- Page Content -->
    <section class="py-5 gmi-light-blue" style="background: #B9B1D8">
        <div class="container">
            <div class="row">
                <div class="col-sm-3">
                    <img class="logoimg" src="/assets/images/gmipn2.svg" style="width: 95%; margin-botton: 25px;">
                </div>

                <div class="col-sm-6">
                    <h1>Project Network Members: Find an Expert</h1>
                    <p>Connect with Project Network members to access experience and expertise crucial to advancing global methane reduction projects worldwide.</p>
                    <p>Details are based on profiles maintained by Project Network members. A star (icon) indicates that the profile has been updated recently. 
                        Project Network members are encouraged to update their profiles to ensures that GMI Partner Countries, the World Bank, and other funding organizations can readily 
                        identify experts to support effective methane mitigation. Please <a href="https://globalmethane.org/project-network/member-setup.aspx">set up your account</a> or <a href="globalmethane.org/project-network/member-login.aspx">log in</a> and renew your information. This ensures that GMI Partner Countries, the World Bank, and other funding organizations can readily identify experts to support effective methane mitigation.

                        <p><strong>Not yet a Project Network member?</strong> <a href="join.aspx">Join us today</a> to become part of this global network of methane mitigation professionals.</p>
                </div>
                <div class="col-sm-3">
                    <div class="border border-secondary bg-white px-0">
                        <div class="py-1 text-center bg-dark text-white"><strong>Get Involved</strong></div>
                        <ul class="list-group py-2">
                            <li class="list-group-item noborder nobackground py-1"><a href="index.aspx">Project Network Home</a></li>
                            <li class="list-group-item noborder nobackground py-1"><a href="join.aspx">Join Now</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <form id="form1" runat="server">
        <section class="py-5 bg-white" id="upcomingevents" runat="server">

            <!-- Filter Section with Titles -->
            <div id="filters" class="container">
                <style>
                    #filters .form-select option {
                        white-space: normal;
                    }

                    #filters .form-select {
                        max-width: 20vw; /* Adjust the width as needed */
                        height: 150px;
                    }

                    .form-label {
                        font-weight: bold;
                    }

                    #BetaMode {
                        display: none;
                    }
                </style>
                <div id="BetaMode">
                    <div class="row">
                        <div class="col-auto mb-3">
                            <label for="filterType" class="form-label">Filter by Type:</label><br />
                            <select id="filterType" class="filter form-select" multiple></select>
                        </div>
                        <div class="col-auto mb-3">
                            <label for="filterActivities" class="form-label">Filter by Activities:</label><br />
                            <select id="filterActivities" class="filter form-select" multiple></select>
                        </div>
                        <div class="col-auto mb-3">
                            <label for="filterCountries" class="form-label">Filter by Countries:</label><br />
                            <select id="filterCountries" class="filter form-select" multiple></select>
                        </div>
                        <div class="col-auto mb-3">
                            <label for="filterSectors" class="form-label">Filter by Sub-Sectors:</label><br />
                            <select id="filterSectors" class="filter form-select" multiple></select>
                        </div>
                    </div>



                    <div class="container">
                        <!-- Filter Description -->
                        <div class="alert alert-primary" role="alert">


                            <div id="filterDescription">Showing all Project Network organizations.</div>
                        </div>

                    </div>
                </div>

                <asp:Literal ID="litOrganizationTable" runat="server"></asp:Literal>
        </section>

        <!-- jQuery first, then Popper.js, then Bootstrap JS -->

        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.11.5/css/jquery.dataTables.min.css" />
        <script src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js"></script>

        <!-- #include virtual="/includes/footer.html" -->
        <script>

            // Function to get URL parameters
            function getUrlParameter(name) {
                const urlParams = new URLSearchParams(window.location.search);
                return urlParams.get(name);
            }

            // Check for 'e' parameter
            document.addEventListener("DOMContentLoaded", function () {
                const betaModeDiv = document.getElementById('BetaMode');
                const paramValue = getUrlParameter('e');

                // Show the div if 'e' is 'BetaMode'
                if (paramValue.toLowerCase() === 'betamode') {
                    betaModeDiv.style.display = 'block';
                }
            });


            $(document).ready(function () {
                // Initialize DataTable with child row for summary
                var table = $('#orgTable').DataTable({
                    "destroy": true,
                    "searching": true,
                    "order": [[8, 'desc'], [1, 'asc']],
                    "columnDefs": [
                        { "orderable": false, "targets": 0 } // Disable sorting on the expand column
                    ]
                });

                // Toggle child row and icon for summary
                $('#orgTable tbody').on('click', 'td.details-control', function () {
                    var tr = $(this).closest('tr');
                    var row = table.row(tr);

                    if (row.child.isShown()) {
                        // Close the row
                        row.child.hide();
                        tr.find('i').toggleClass('bi-chevron-down bi-chevron-right');
                        tr.removeClass('shown');
                    } else {
                        // Open the row with summary content
                        var summary = row.data()[7]; // Summary column data
                        row.child(`<div class="child-row-summary">${summary}</div>`).show();
                        tr.find('i').toggleClass('bi-chevron-right bi-chevron-down');
                        tr.addClass('shown');
                    }
                });

                // Populate multi-select dropdowns with options
                function populateDropdown(dropdown, options) {
                    $(dropdown).empty().append('<option value="">All</option>');
                    options.forEach(option => {
                        $(dropdown).append(`<option value="${option}">${option}</option>`);
                    });
                }

                populateDropdown('#filterType', types);
                populateDropdown('#filterActivities', activities);
                populateDropdown('#filterCountries', countries);
                populateDropdown('#filterSectors', sectors);

                // Filter table based on selected options with OR/AND logic
                $('.filter').on('change', function () {
                    filterTable();
                    updateFilterDropdowns();
                    updateFilterDescription();
                });

                // Filter the table based on selected options
                function filterTable() {
                    let selectedTypes = $('#filterType').val() || [];
                    let selectedActivities = $('#filterActivities').val() || [];
                    let selectedCountries = $('#filterCountries').val() || [];
                    let selectedSectors = $('#filterSectors').val() || [];

                    // Create regular expressions to match selected values (OR within each filter, AND across filters)
                    let typeRegex = selectedTypes.length > 0 ? selectedTypes.join('|') : '';
                    let activitiesRegex = selectedActivities.length > 0 ? selectedActivities.join('|') : '';
                    let countriesRegex = selectedCountries.length > 0 ? selectedCountries.join('|') : '';
                    let sectorsRegex = selectedSectors.length > 0 ? selectedSectors.join('|') : '';

                    // Apply the regex filters to each column
                    table.column(2).search(typeRegex, true, false);      // Type column
                    table.column(4).search(activitiesRegex, true, false); // Activities column
                    table.column(5).search(countriesRegex, true, false);  // Countries column
                    table.column(6).search(sectorsRegex, true, false);    // Sectors column

                    // Redraw the table with the applied filters
                    table.draw();
                }

                // Update dropdown options to disable those with zero matches based on visible rows
                function updateFilterDropdowns() {
                    let filteredData = table.rows({ filter: 'applied' }).data();

                    let availableTypes = new Set();
                    let availableActivities = new Set();
                    let availableCountries = new Set();
                    let availableSectors = new Set();

                    filteredData.each(function (row) {
                        availableTypes.add(row[2]);
                        row[4].split('|').forEach(item => availableActivities.add(item.trim()));
                        row[5].split('|').forEach(item => availableCountries.add(item.trim()));
                        row[6].split('|').forEach(item => availableSectors.add(item.trim()));
                    });

                    $('#filterType option').each(function () {
                        $(this).prop('disabled', $(this).val() && !availableTypes.has($(this).val()));
                    });
                    $('#filterActivities option').each(function () {
                        $(this).prop('disabled', $(this).val() && !availableActivities.has($(this).val()));
                    });
                    $('#filterCountries option').each(function () {
                        $(this).prop('disabled', $(this).val() && !availableCountries.has($(this).val()));
                    });
                    $('#filterSectors option').each(function () {
                        $(this).prop('disabled', $(this).val() && !availableSectors.has($(this).val()));
                    });
                }

                // Update the filter description based on selected options
                function updateFilterDescription() {
                    var typeText = $('#filterType').val().join(', ') || "any type";
                    var activitiesText = $('#filterActivities').val().join(', ') || "any activities";
                    var countriesText = $('#filterCountries').val().join(', ') || "any countries";
                    var sectorsText = $('#filterSectors').val().join(', ') || "any sectors";

                    $('#filterDescription').text(`Showing Project Network organizations that are ${typeText} and are involved in ${activitiesText} in the ${sectorsText} space in ${countriesText}`);
                }

                // Initialize filter description and dropdown options on load
                updateFilterDescription();
                updateFilterDropdowns();
            });
        </script>



    </form>
</body>
</html>

