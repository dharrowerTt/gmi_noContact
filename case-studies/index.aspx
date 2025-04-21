<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="index.aspx.vb" Inherits="M2M_Redesign.index13" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Case Study Library</title>
    <!-- Ensure jQuery is loaded first -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <!-- Include DataTables CSS -->
    <link rel="stylesheet" href="https://cdn.datatables.net/1.13.4/css/jquery.dataTables.min.css" />
    <!-- Include DataTables JS -->
    <script src="https://cdn.datatables.net/1.13.4/js/jquery.dataTables.min.js"></script>

    <script type="text/javascript">
        $(document).ready(function () {
            $('#gvCaseStudies').DataTable({
                "autoWidth": false,
                "paging": true,
                "searching": true,
                "ordering": true,
                "info": true
            });
        });
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <!-- Manually define a header row -->
            <table id="gvCaseStudies" class="display" cellspacing="0" width="100%">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Thumbnail</th>
                        <th>Title</th>
                        <th>Source</th>
                        <th>Location</th>
                        <th>Summary</th>
                        <th>URL</th>
                        <th>Start Date</th>
                        <th>GMI Sectors</th>
                        <th>Topics</th>
                        <th>Country Applicability</th>
                    </tr>
                </thead>
                <tbody>
                    <asp:Repeater ID="gvCaseStudies" runat="server">
                        <ItemTemplate>
                            <tr>
                                <td><%# Eval("id") %></td>
                                <td><img src='<%# "thumbs/" & Eval("thumbnail") %>' alt="Thumbnail" style="width: 100px; height: auto;" /></td>
                                <td><%# Eval("csTitle") %></td>
                                <td><%# Eval("source") %></td>
                                <td><%# Eval("csLocation") %></td>
                                <td><%# Eval("briefSummary") %></td>
                                <td><a href='<%# Eval("url") %>' target="_blank"><%# Eval("url") %></a></td>
                                <td><%# If(IsDBNull(Eval("startDate")), "N/A", Convert.ToDateTime(Eval("startDate")).ToString("yyyy-MM-dd")) %></td>
                                <td><%# Eval("gmiSectors") %></td>
                                <td><%# Eval("topics") %></td>
                                <td><%# Eval("countryApplicability") %></td>
                            </tr>
                        </ItemTemplate>
                    </asp:Repeater>
                </tbody>
            </table>
        </div>
    </form>
</body>
</html>
