<%@ Page Title="Resources" Language="vb" AutoEventWireup="false" MasterPageFile="~/management/MasterPage.master" CodeBehind="resources.aspx.vb" Inherits="M2M_Redesign.resources" %>
<%@ Import Namespace="System.Data" %>

<asp:Content ID="Content1" ContentPlaceHolderID="PageTitle" runat="server">
    Resources List
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h1>Resources List</h1>

    <!-- Include jQuery -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

    <!-- Include DataTables CSS and JS -->
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.11.5/css/jquery.dataTables.min.css">
    <script src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js"></script>

    <!-- Include Font Awesome for icons -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">

    <form runat="server">
        <asp:Button ID="btnAddNewResource" runat="server" Text="Add New Resource" CssClass="btn btn-success mb-3" OnClick="btnAddNewResource_Click" />
    </form>

    <div class="table-responsive">
        <table id="resourcesTable" class="table table-bordered table-striped">
            <thead>
                <tr>
                    <th>Name</th>
                    <th>Sectors</th>
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
                <% For Each row As DataRow In resourcesData.Rows %>
                <tr>
                    <td>
                        <a href="<%= row("resourceLink") %>" target="_blank">
                            <%= row("resourceName") %>
                        </a>
                    </td>
                    <td><%= GetFullSectorName(row("sectors").ToString()) %></td>
                    <td><%= row("status") %></td>
                    <td><%= row("lastModifiedByEmail") %></td>
                    <td>
                        <a href="resource_management.aspx?resourceid=<%= row("resourceid") %>" class="btn btn-primary">Edit</a>
                    </td>
                </tr>
                <% Next %>
            </tbody>
        </table>
    </div>

    <script>
        $(document).ready(function () {
            // Initialize DataTable
            var table = $('#resourcesTable').DataTable({
                "paging": true,
                "searching": true,
                "order": [[0, "asc"]], // Default sort by Name
                "columnDefs": [
                    { "targets": [2, 3], "orderable": false } // Disable sorting for Status and Last Modified By
                ]
            });

            // Populate 'Status' dropdown
            var statusColumnIndex = 2;
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
            var modifiedByColumnIndex = 3;
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
