<%@ Page Title="Edit Page" Language="vb" AutoEventWireup="false" MasterPageFile="~/management/MasterPage.master" CodeBehind="edit-page.aspx.vb" Inherits="M2M_Redesign.edit_page" %>
<%@ Register Assembly="FreeTextBox" Namespace="FreeTextBoxControls" TagPrefix="FTB" %>

<asp:Content ID="Content1" ContentPlaceHolderID="PageTitle" runat="server">
    Edit Page
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <div class="d-flex justify-content-between align-items-center">
            <h1 id="pageHeading" runat="server" class="mb-3">Page Name</h1>
            <a href="edit-directory.aspx" class="btn btn-outline-secondary">Cancel</a>
        </div>

        <!-- FreeTextBox Editor -->
        <asp:Panel ID="pnlEditor" runat="server" Visible="True">
            <FTB:FreeTextBox ID="ContentEditor" runat="server" Width="100%" Height="300px" />
            <asp:Button ID="SubmitButton" runat="server" CssClass="btn btn-success mt-3" Text="Submit Changes" OnClick="SubmitChanges_Click" />
        </asp:Panel>

        <hr />

        <!-- Preview iframe -->
        <div class="mt-4">
            <h3>Live Preview</h3>
            <iframe id="previewFrame" runat="server" width="100%" height="500px" frameborder="0"></iframe>

        </div>
    </div>
</asp:Content>
