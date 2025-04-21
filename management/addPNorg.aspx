<%@ Page Title="Add Project Network Organization"  Language="VB"  AutoEventWireup="false"  CodeBehind="addPNorg.aspx.vb" Inherits="M2M_Redesign.Management_addPNorg" MasterPageFile="~/management/MasterPage.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <h2>Add New Organization</h2>

    <!-- Success Alert -->
        <!-- Link to Add New Organization -->
    <a href="addPNuser.aspx" class="btn btn-primary mb-3">Add New Member Representative</a>
    <form runat="server">
    <asp:Panel ID="SuccessPanel" runat="server" CssClass="alert alert-success" Visible="false">
        <strong>Success!</strong> The organization was added successfully.
    </asp:Panel>
    
    <asp:ValidationSummary ID="ValidationSummary1" runat="server" CssClass="text-danger" />

    <asp:Panel ID="AddOrgPanel" runat="server" CssClass="form-group">
        <asp:Label ID="LabelSfOrgID" runat="server" Text="Salesforce Org ID" AssociatedControlID="txtSfOrgID" />
        <asp:TextBox ID="txtSfOrgID" runat="server" CssClass="form-control" MaxLength="100" required="true"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredSfOrgID" runat="server" ControlToValidate="txtSfOrgID" ErrorMessage="Salesforce Org ID is required." Display="Dynamic" CssClass="text-danger" />

        <asp:Label ID="LabelOrgName" runat="server" Text="Organization Name" AssociatedControlID="txtOrgName" />
        <asp:TextBox ID="txtOrgName" runat="server" CssClass="form-control" MaxLength="100" required="true"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredOrgName" runat="server" ControlToValidate="txtOrgName" ErrorMessage="Organization Name is required." Display="Dynamic" CssClass="text-danger" />

        <asp:Label ID="LabelOrgType" runat="server" Text="Organization Type" AssociatedControlID="ddlOrgType" />
        <asp:DropDownList ID="ddlOrgType" runat="server" CssClass="form-control">
            
        </asp:DropDownList>

        <asp:Label ID="LabelWebsite" runat="server" Text="Website" AssociatedControlID="txtWebsite" />
        <asp:TextBox ID="txtWebsite" runat="server" CssClass="form-control" MaxLength="255"></asp:TextBox>

        <asp:Label ID="LabelHeadquarters" runat="server" Text="Headquarters" AssociatedControlID="txtHeadquarters" />
        <asp:TextBox ID="txtHeadquarters" runat="server" CssClass="form-control" MaxLength="255"></asp:TextBox>

        <asp:Label ID="LabelOrgSummary" runat="server" Text="Organization Summary" AssociatedControlID="txtOrgSummary" />
        <asp:TextBox ID="txtOrgSummary" runat="server" TextMode="MultiLine" Rows="4" CssClass="form-control" MaxLength="500"></asp:TextBox>

        <asp:Button ID="btnSubmit" runat="server" CssClass="btn btn-primary mt-3" Text="Submit" OnClick="btnSubmit_Click" />
    </asp:Panel>
        </form></asp:Content>
