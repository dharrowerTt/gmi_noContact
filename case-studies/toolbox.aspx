<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Toolbox.aspx.vb" Inherits="M2M_Redesign.Toolbox" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Toolbox</title>
    <link href="https://cdn.datatables.net/1.11.3/css/jquery.dataTables.min.css" rel="stylesheet" />
    <link href="https://cdn.datatables.net/1.11.3/css/dataTables.bootstrap4.min.css" rel="stylesheet" />
    <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
    <script src="https://cdn.datatables.net/1.11.3/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.11.3/js/dataTables.bootstrap4.min.js"></script>
    <script>
        $(document).ready(function () {
            $('#submissionsTable').DataTable();
        });

        function updateStatus(id) {
            var status = $('#statusDropdown_' + id).val();
            $.ajax({
                type: "POST",
                url: "Toolbox.aspx/UpdateStatus",
                data: JSON.stringify({ id: id, status: status }),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    alert('Status updated successfully');
                },
                error: function (response) {
                    alert('Error updating status');
                }
            });
        }
    </script>
</head>
<body>
    <form id="form1" runat="server" class="container">
        <table id="submissionsTable" class="table table-striped">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Title</th>
                    <th>Submitter Name</th>
                    <th>Date Submitted</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <asp:Repeater ID="rptSubmissions" runat="server">
                    <ItemTemplate>
                        <tr>
                            <td><%# Eval("ID") %></td>
                            <td><a href='<%# Eval("ID", "/case-studies/details.aspx?id={0}") %>'><%# Eval("csTitle") %></a></td>
                            <td><%# Eval("SubmitterName") %></td>
                            <td><%# Eval("DateSubmitted", "{0:yyyy-MM-dd}") %></td>
                            <td>
                                <a href='<%# Eval("ID", "edit.aspx?id={0}") %>' class="btn btn-primary">Edit</a>
                                <select id="statusDropdown_<%# Eval("ID") %>" class="form-control" style="display:inline-block; width:auto;">
                                    <option value="submitted" <%# IIf(Eval("Status").ToString() = "submitted", "selected", "") %>>Submitted</option>
                                    <option value="awaiting approval" <%# IIf(Eval("Status").ToString() = "awaiting approval", "selected", "") %>>Awaiting Approval</option>
                                    <option value="published" <%# IIf(Eval("Status").ToString() = "published", "selected", "") %>>Published</option>
                                </select>
                                <button type="button" class="btn btn-success" onclick="updateStatus(<%# Eval("ID") %>)">Update</button>
                            </td>
                        </tr>
                    </ItemTemplate>
                </asp:Repeater>
            </tbody>
        </table>
    </form>
</body>
</html>
