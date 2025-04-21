<%@ Page Title="Edit Directory" Language="vb" AutoEventWireup="false" MasterPageFile="~/management/MasterPage.master" CodeBehind="edit-directory.aspx.vb" Inherits="M2M_Redesign.edit_directory" %>

<asp:Content ID="Content1" ContentPlaceHolderID="PageTitle" runat="server">
    Edit Directory
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <h1 class="mt-3">Edit Directory</h1>
        <p>Select a page from the list below to edit its content.</p>

<table class="table table-bordered table-striped">
    <thead>
        <tr>
            <th>Name</th>
            <th>Last Edited Date</th>
            <th>Last Edited By</th>
            <th>Action</th>
        </tr>
    </thead>
    <tbody id="tableBody" runat="server">
        <!-- Rows will be populated dynamically from the code-behind -->
    </tbody>
</table>

    </div>
</asp:Content>
