<%@ Page Title="Resource Management" Language="vb" AutoEventWireup="false" MasterPageFile="~/management/MasterPage.master" CodeBehind="resource_management.aspx.vb" Inherits="M2M_Redesign.resource_management" %>
<%@ Import Namespace="System.Data" %>

<asp:Content ID="Content1" ContentPlaceHolderID="PageTitle" runat="server">
    Manage Resource
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Resource Management</h2>
    <p class="text-muted">
        Use this form to edit or create a resource. Required fields are marked with <span class="text-danger">*</span>.
    </p>

    <form runat="server">

        <!-- General Information -->
        <fieldset>
            <legend>General Information</legend>
            <div class="form-group">
                <label for="resourceName">Resource Name <span class="text-danger">*</span></label>
                <asp:TextBox ID="txtResourceName" runat="server" CssClass="form-control" MaxLength="255"></asp:TextBox>
                <small class="form-text text-muted">Enter the name of the resource.</small>
            </div>
            <div class="form-group">
                <label for="status">Status <span class="text-danger">*</span></label>
                <asp:RadioButtonList ID="rblStatus" runat="server" CssClass="form-check">
                    <asp:ListItem Text="Draft" Value="Draft"></asp:ListItem>
                    <asp:ListItem Text="Final" Value="Final"></asp:ListItem>
                </asp:RadioButtonList>
                <small class="form-text text-muted">Select the status of the resource.</small>
            </div>
        </fieldset>

        <!-- Sectors -->
        <fieldset>
            <legend>Sectors</legend>
            <div class="form-group">
                <label for="sector">Sectors</label>
                <asp:ListBox ID="lstSectors" runat="server" CssClass="form-control" SelectionMode="Multiple"></asp:ListBox>
                <small class="form-text text-muted">Select one or more sectors this resource is associated with.</small>
            </div>
        </fieldset>

        <!-- Resource Details -->
        <fieldset>
            <legend>Details</legend>
            <div class="form-group">
                <label for="resourcePages">Resource Pages</label>
                <asp:TextBox ID="txtResourcePages" runat="server" CssClass="form-control" MaxLength="10"></asp:TextBox>
                <small class="form-text text-muted">Enter the number of pages in the resource.</small>
            </div>
            <div class="form-group">
                <label for="author">Author <span class="text-danger">*</span></label>
                <asp:TextBox ID="txtAuthor" runat="server" CssClass="form-control" MaxLength="255"></asp:TextBox>
                <small class="form-text text-muted">Enter the author of the resource.</small>
            </div>
            <div class="form-group">
                <label for="shortName">Short Name <span class="text-danger">*</span></label>
                <asp:TextBox ID="txtShortName" runat="server" CssClass="form-control" MaxLength="255"></asp:TextBox>
                <small class="form-text text-muted">Enter a short name for the resource.</small>
            </div>
        </fieldset>

        <!-- Buttons -->
        <div class="form-group">
            <asp:Button ID="btnSave" runat="server" Text="Save" CssClass="btn btn-primary" OnClick="btnSave_Click" />
            <asp:Button ID="btnCancel" runat="server" Text="Cancel" CssClass="btn btn-secondary" OnClientClick="window.location.href='resources.aspx'; return false;" />
        </div>
    </form>

</asp:Content>