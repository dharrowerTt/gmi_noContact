<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="member-home.aspx.vb" Inherits="M2M_Redesign.member_home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Project Network Members App | Dashboard</title>
    <!-- #include virtual="/includes/include_head.html" -->
    <style>
        body {
            background-color: #E9E6EE;
        }

        .dashboard-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 10px 0;
        }

            .dashboard-header h1 {
                font-size: 1.5rem;
            }

        hr {
            border: 1px solid #333;
            margin-bottom: 20px;
        }

        .tabs {
            margin-top: 20px;
        }

            .tabs .nav {
                list-style: none;
                padding: 0;
                display: flex;
                border-bottom: 2px solid #746a93;
                margin-bottom: 0;
            }

                .tabs .nav li {
                    margin-right: 10px;
                    padding: 10px 15px;
                    border: 1px solid #ccc;
                    background-color: #B9B1D8;
                    cursor: pointer;
                }

                    .tabs .nav li.active {
                        background-color: #746a93;
                        color: #fff;
                        border-bottom: none;
                    }

                    .tabs .nav li.disabled {
                        background-color: #d3d3d3;
                        color: #777;
                        cursor: not-allowed;
                    }

        .tab-content {
            background-color: #fff;
            padding: 20px;
            border: 1px solid #ccc;
            border-top: 5px solid #746a93;
        }

        .table-content {
            width: 100%;
            border-collapse: collapse;
        }

            .table-content td {
                padding: 10px;
                border-bottom: 1px solid #ccc;
                vertical-align: top;
            }

                .table-content td:first-child {
                    font-weight: bold;
                    width: 30%;
                    text-align: right;
                }
        /* Style for DataTables */
        .dataTables_wrapper {
            width: 100%;
            margin: 20px 0;
        }

        table {
            width: 100%;
            margin-bottom: 20px;
            border-collapse: collapse;
        }

        th, td {
            padding: 10px;
            border: 1px solid #ccc;
            text-align: left;
        }

        .pill {
            display: inline-block;
            background-color: gold;
            color: black;
            padding: 3px 10px;
            border-radius: 15px;
            font-size: 12px;
            margin-left: 10px;
        }

            .pill i {
                margin-right: 5px;
            }

.country-table {
    width: 100%;
    border-collapse: collapse;
    margin: 20px 0;
}

.country-table th, .country-table td {
    padding: 12px 15px;
    border: 1px solid #ddd;
    text-align: left;
}

.country-table th {
    background-color: #746a93;
    color: white;
}

.country-table tr:nth-child(even) {
    background-color: #f9f9f9;
}

.activity-table {
    width: 100%;
    border-collapse: collapse;
    margin: 20px 0;
}

.activity-table th, .country-table td {
    padding: 12px 15px;
    border: 1px solid #ddd;
    text-align: left;
}

.activity-table th {
    background-color: #746a93;
    color: white;
}

.activity-table tr:nth-child(even) {
    background-color: #f9f9f9;
}

.edit-link {
    color: #746a93;
    text-decoration: none;
}

.edit-link:hover {
    text-decoration: underline;
}

    </style>

    <link rel="stylesheet" href="https://cdn.datatables.net/1.11.5/css/jquery.dataTables.min.css">
    <link rel="stylesheet" href="https://cdn.datatables.net/buttons/2.2.2/css/buttons.dataTables.min.css">
</head>
<body>
    <!-- #include virtual="/includes/header.html" -->
    <form id="form1" runat="server">
        <section class="py-5 bg-white" style="background: #E9E6EE!important;">
            <div class="container">
                <div class="row">
                    <div class="col-sm-12">
                        <!-- Dashboard Header -->
                        <div class="dashboard-header">
                            <h1>Project Network Members App</h1>
                            <asp:Label ID="lblUserDetails" runat="server" CssClass="text-right"></asp:Label>
                        </div>
                        <hr />
                        <!-- Profile Header -->
                        <h2>Profile for
                            <asp:Label ID="lblOrgName" runat="server"></asp:Label></h2>

                        <!-- Tabs -->
                        <div class="tabs">
                            <ul class="nav">
                                <li id="generalTab" class="active" onclick="showTab('general')">General</li>
                                <li id="contactsTab" onclick="showTab('contacts')">Contacts</li>
                                <li id="sectorsTab" onclick="showTab('sectors')">Sectors</li>
                                <li id="activitiesTab" onclick="showTab('activities')">Activities</li>
                                <li id="countriesTab" onclick="showTab('countries')">Countries</li>
                                <li id="updateLogTab" onclick="showTab('updateLog')">Update Log</li>
                            </ul>

                            <!-- Tab Content: General -->
                            <div id="generalTabContent" class="tab-content">
                                <a href="edit-org.aspx">Edit your organization's data.</a>
                                <table class="table-content">
                                    <tr>
                                        <td>Type</td>
                                        <td>
                                            <asp:Label ID="lblType" runat="server"></asp:Label></td>
                                    </tr>
                                    <tr>
                                        <td>Website</td>
                                        <td>
                                            <asp:Label ID="lblWebsite" runat="server"></asp:Label></td>
                                    </tr>
                                    <tr>
                                        <td>Headquarters</td>
                                        <td>
                                            <asp:Label ID="lblHeadquarters" runat="server"></asp:Label></td>
                                    </tr>
                                    <tr>
                                        <td>Description of Services</td>
                                        <td>
                                            <asp:Label ID="lblDescription" runat="server"></asp:Label></td>
                                    </tr>
                                </table>
                            </div>

                            <!-- Tab Content: Contacts (no "Organization Contacts" header) -->
                            <div id="contactsTabContent" class="tab-content" style="display: none;">
                                <a href="edit-user.aspx">Edit your own profile.</a>
                                <table id="contactsTable" class="display">
                                    <thead>
                                        <tr>
                                            <th>Name</th>
                                            <th>Title</th>
                                            <th>Email</th>
                                            <th>Phone</th>
                                            <th>Updated</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <!-- Dynamic rows will be added here by code-behind -->
                                    </tbody>
                                </table>
                            </div>
                            <!-- Tab Content: Sectors -->
                            <div id="sectorsTabContent" class="tab-content" style="display: none;">
                                <h2>Sector Experience</h2>
                                <a href="edit-sectors.aspx">Edit this sector information.</a>
                                <div id="sectorList">
                                    <!-- The hierarchical list will be injected here -->
                                    <asp:Label ID="litSectors" runat="server"></asp:Label>
                                </div>
                            </div>
                            <!-- Tab Content: Countries -->
                            <div id="countriesTabContent" class="tab-content" style="display: none;">
                                <h2>Country Experience</h2>
                                <a href="edit-countries.aspx">Add country information.</a>
                                <div id="countriesList">
                                    <!-- The hierarchical list will be injected here -->
                                    <asp:Label ID="litCountriesList" runat="server"></asp:Label>
                                </div>
                            </div>
                           <!-- Tab Content: Activities -->
                            <div id="activitiesTabContent" class="tab-content" style="display: none;">
                                <h2>Activity Experience</h2>
                                <a href="edit-activities.aspx">Add activity information.</a>
                                <div id="activitiesList">
                                    <!-- The hierarchical list will be injected here -->
                                    <asp:Label ID="litActivitiesList" runat="server"></asp:Label>
                                </div>
                            </div>
                            <!-- Tab Content: Update Log -->
                            <div id="updateLogTabContent" class="tab-content" style="display: none;">
                                <h2>Update Log</h2>
                                <div id="updateLogList">
                                    <!-- Update log entries will be inserted here -->
                                    <asp:Label ID="litUpdateLog" runat="server"></asp:Label>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
            </div>
        </section>
        <!-- jQuery first, then Popper.js, then Bootstrap JS -->
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
        <!-- #include virtual="/includes/footer.html" -->

        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js"></script>
        <script src="https://cdn.datatables.net/buttons/2.2.2/js/dataTables.buttons.min.js"></script>
        <script src="https://cdn.datatables.net/buttons/2.2.2/js/buttons.html5.min.js"></script>
        <script src="https://cdn.datatables.net/buttons/2.2.2/js/buttons.flash.min.js"></script>
        <script src="https://cdn.datatables.net/buttons/2.2.2/js/buttons.print.min.js"></script>

        <script>
            $(document).ready(function () {
                $('#contactsTable').DataTable({
                    dom: 'Bfrtip',
                    buttons: [
                        {
                            extend: 'copyHtml5',
                            text: 'Copy to Clipboard'
                        },
                        {
                            extend: 'excelHtml5',
                            text: 'Export to Excel'
                        }
                    ]
                });
            });

            // Function to handle showing and hiding tab content
            function showTab(tabId) {
                // Hide all tab contents
                $('.tab-content').hide();

                // Remove 'active' class from all tabs
                $('.tabs ul li').removeClass('active');

                // Show the selected tab content and add the 'active' class to the selected tab
                $('#' + tabId + 'TabContent').show();
                $('#' + tabId + 'Tab').addClass('active');
            }

            // Initialize by showing the General tab
            $(document).ready(function () {
                showTab('general');
            });
        </script>

        <script>
            // Function to handle showing and hiding tab content
            function showTab(tabId) {
                // Hide all tab contents
                $('.tab-content').hide();

                // Remove 'active' class from all tabs
                $('.tabs ul li').removeClass('active');

                // Show the selected tab content and add the 'active' class to the selected tab
                $('#' + tabId + 'TabContent').show();
                $('#' + tabId + 'Tab').addClass('active');
            }

            // Function to get URL parameter
            function getUrlParameter(name) {
                name = name.replace(/[\[]/, '\\[').replace(/[\]]/, '\\]');
                var regex = new RegExp('[\\?&]' + name + '=([^&#]*)');
                var results = regex.exec(window.location.search);
                return results === null ? '' : decodeURIComponent(results[1].replace(/\+/g, ' '));
            }

            // Initialize by showing the correct tab based on URL parameter or default to 'general'
            $(document).ready(function () {
                var page = getUrlParameter('page');
                switch (page) {
                    case 'country':
                        showTab('countries');
                        break;
                    case 'activity':
                        showTab('activities');
                        break;
                    case 'user':
                        showTab('contacts');
                        break;
                    case 'sector':
                        showTab('sectors');
                        break;
                    default:
                        showTab('general'); // Default to the general tab if no 'page' parameter is present
                        break;
                }
            });
        </script>

    </form>
</body>
</html>
