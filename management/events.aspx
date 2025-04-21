<%@ Page Title="Events" Language="vb" AutoEventWireup="false" CodeBehind="events.aspx.vb" Inherits="M2M_Redesign.events" MasterPageFile="~/management/MasterPage.master" %>
<%@ Import Namespace="System.Data" %>
<asp:Content ID="Content1" ContentPlaceHolderID="PageTitle" runat="server">
    Events List
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h1>Events List</h1>

    <!-- Include jQuery -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

    <!-- Include DataTables CSS and JS -->
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.11.5/css/jquery.dataTables.min.css">
    <script src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js"></script>

    <!-- Include Font Awesome for icons -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">

    <form runat="server">
        <asp:Button ID="btnAddNewEvent" runat="server" Text="Add New Event" CssClass="btn btn-success mb-3" OnClick="btnAddNewEvent_Click" />
    </form>

    <div class="table-responsive">
        <table id="eventsTable" class="table table-bordered table-striped">
            <thead>
                <tr>
                    <th>Name</th>
                    <th>Sectors</th>
                    <th>Start Date</th>
                                    <th>
                    Status
                    <select id="filterStatus" class="form-control">
                        <option value="">All</option>
                    </select>
                </th>
                    <th>
                        Last Modified By
                        <select id="filterModifiedBy" class="form-control">
                            <option value="">All</option>
                        </select>
                    </th>
                    <th>Edit</th>
                </tr>
            </thead>
            <tbody>
                <% For Each row As DataRow In eventsData.Rows %>
                <tr>
                    <td>
                        <a href="https://www.globalmethane.org/events/details.aspx?eventid=<%= row("eventId") %>" target="_blank">
                            <%= row("name") %>
                        </a>
                        <button class="btn btn-link btn-sm" onclick="copyToClipboard('<%= "https://www.globalmethane.org/events/details.aspx?eventid=" & row("eventId") %>')">
                            <i class="fas fa-link"></i> Copy
                        </button>
                    </td>
                    <td><%= GetFullSectorName(row("sectors").ToString()) %></td>
                    <td><%= Convert.ToDateTime(row("startDate")).ToString("yyyy-MM-dd") %></td>
                    <td><%= row("eventstatus") %></td>
                    <td><%= row("lastModifiedByEmail") %></td>
                    <td>
                        <a href="event_management.aspx?eventId=<%= row("eventId") %>" class="btn btn-primary">Edit</a>
                    </td>
                </tr>
                <% Next %>
            </tbody>
        </table>
    </div>

    <script>
        $(document).ready(function () {
            // Initialize DataTable
            var table = $('#eventsTable').DataTable({
                "paging": true,
                "searching": true,
                "order": [[2, "desc"]], // Default sort by Start Date
                "columnDefs": [
                    { "targets": [3, 4], "orderable": false } // Disable sorting for Status and Last Modified By
                ]
            });

            // Populate 'Status' dropdown
            var statusColumnIndex = 3;
            var statusDropdown = $('#filterStatus');

            table.column(statusColumnIndex).data().unique().sort().each(function (d) {
                if (d) { // Only add non-empty values
                    statusDropdown.append(`<option value="${d}">${d}</option>`);
                }
            });

            // Filter table when Status dropdown changes
            statusDropdown.on('change', function () {
                var value = $(this).val();
                table.column(statusColumnIndex).search(value).draw();
            });

            // Populate 'Last Modified By' dropdown
            var modifiedByColumnIndex = 4;
            var modifiedByDropdown = $('#filterModifiedBy');

            table.column(modifiedByColumnIndex).data().unique().sort().each(function (d) {
                if (d) { // Only add non-empty values
                    modifiedByDropdown.append(`<option value="${d}">${d}</option>`);
                }
            });

            // Filter table when Last Modified By dropdown changes
            modifiedByDropdown.on('change', function () {
                var value = $(this).val();
                table.column(modifiedByColumnIndex).search(value).draw();
            });
        });

        function copyToClipboard(url) {
            var tempInput = document.createElement("input");
            tempInput.value = url;
            document.body.appendChild(tempInput);
            tempInput.select();
            document.execCommand('copy');
            document.body.removeChild(tempInput);
            alert("URL copied to clipboard!");
        }
    </script>
</asp:Content>
