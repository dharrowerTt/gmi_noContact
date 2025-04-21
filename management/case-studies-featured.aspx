<%@ Page Title="Manage Featured Case Studies" Language="vb" AutoEventWireup="false" MasterPageFile="~/management/MasterPage.master" CodeBehind="case-studies-featured.aspx.vb" Inherits="M2M_Redesign.case_studies_featured" %>

<asp:Content ID="Content1" ContentPlaceHolderID="PageTitle" runat="server">
    Manage Featured Case Studies
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <form id="form1" runat="server">


        <!-- Case Studies GridView with DataTables Integration -->
<asp:GridView ID="gvCaseStudies" runat="server" AutoGenerateColumns="False" CssClass="display table table-striped" DataKeyNames="ID" OnPreRender="gvCaseStudies_PreRender">
    <Columns>
        <asp:BoundField DataField="csTitle" HeaderText="Case Study Name" SortExpression="csTitle" />
        
        
        <asp:TemplateField HeaderText="Featured">
            <HeaderTemplate>
                <div>
                    Featured
                    <select id="filterFeatured" class="form-select" style="width: 100%; margin-top: 5px;">
                        <option value="">All</option>
                        <option value="featured">Featured Only</option>
                        <option value="not-featured">Not Featured</option>
                    </select>
                </div>
            </HeaderTemplate>
            <ItemTemplate>
                <asp:CheckBox ID="cbFeatured" runat="server" Checked='<%# Convert.ToBoolean(Eval("isFeatured")) %>' AutoPostBack="true" OnCheckedChanged="cbFeatured_CheckedChanged" />
            </ItemTemplate>
        </asp:TemplateField>

        <asp:TemplateField HeaderText="Date Added" SortExpression="dateAdded">
            <ItemTemplate>
                <%# If(Eval("dateAdded") IsNot DBNull.Value, Eval("dateAdded", "{0:yyyy-MM-dd}"), "Not Featured") %>
            </ItemTemplate>
        </asp:TemplateField>
    </Columns>
</asp:GridView>

    </form>

    <!-- DataTables CSS and JS -->
    <link rel="stylesheet" href="https://cdn.datatables.net/1.11.5/css/jquery.dataTables.min.css">
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js"></script>


    <!-- Initialize DataTables with Filtering and Sorting -->
<script>
    $(document).ready(function () {
        // Initialize DataTables with Date Added column sorted on load
        var table = $('#<%= gvCaseStudies.ClientID %>').DataTable({
            "paging": true,
            "searching": true,
            "ordering": true,
            "order": [[2, 'asc']], // Sort by Date Added column on load
            "columnDefs": [
                { "orderable": false, "targets": 1 } // Disable sorting on the Featured column
            ]
        });

        // Filter by Featured Status using dropdown in the header
        $('#filterFeatured').on('change', function () {
            var filterValue = $(this).val();

            if (filterValue === "featured") {
                // Show only rows where Date Added has a value
                table.column(2).search('^(?!Not Featured$).+', true, false).draw();
            } else if (filterValue === "not-featured") {
                // Show only rows where Date Added is "Not Featured"
                table.column(2).search('^Not Featured$', true, false).draw();
            } else {
                // Show all rows
                table.column(2).search('').draw();
            }
        });
    });
</script>

</asp:Content>
