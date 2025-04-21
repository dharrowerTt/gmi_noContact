<%@ Page Title="Add Project Network User" Language="vb" AutoEventWireup="false" MasterPageFile="~/management/MasterPage.master" CodeBehind="addPNuser.aspx.vb" Inherits="M2M_Redesign.addPNuser" %>
<asp:Content ID="Content1" ContentPlaceHolderID="PageTitle" runat="server">
    Add New User
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Add New User</h2>

    <!-- Link to Add New Organization -->
    <a href="addPNorg.aspx" class="btn btn-primary mb-3">Add New Organization</a>

    <form runat="server">
        <!-- Success Alert -->
        <asp:Panel ID="SuccessPanel" runat="server" CssClass="alert alert-success" Visible="false">
            <strong>Success!</strong> The user was added successfully.
        </asp:Panel>

        <asp:ValidationSummary ID="ValidationSummary1" runat="server" CssClass="text-danger" />

        <!-- Organization Dropdown -->
        <div class="mb-3">
            <asp:Label ID="LabelOrg" runat="server" Text="Organization" AssociatedControlID="ddlOrg" CssClass="form-label" />
            <asp:DropDownList ID="ddlOrg" runat="server" CssClass="form-control"></asp:DropDownList>
            <asp:RequiredFieldValidator ID="RequiredOrg" runat="server" ControlToValidate="ddlOrg" InitialValue="" ErrorMessage="Please select an organization." CssClass="text-danger" Display="Dynamic" />
        </div>

        <!-- Salesforce Contact ID Field -->
        <div class="mb-3">
            <asp:Label ID="LabelSfContactID" runat="server" Text="Salesforce Contact ID" AssociatedControlID="txtSfContactID" CssClass="form-label" />
            <asp:TextBox ID="txtSfContactID" runat="server" CssClass="form-control"></asp:TextBox>
        </div>

        <!-- Row for Salutation, First Name, Last Name, and Suffix -->
        <div class="row mb-3">
            <div class="col-2">
                <asp:Label ID="LabelSalutation" runat="server" Text="Salutation" AssociatedControlID="txtSalutation" CssClass="form-label" />
                <asp:TextBox ID="txtSalutation" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="col-4">
                <asp:Label ID="LabelFirstName" runat="server" Text="First Name" AssociatedControlID="txtFirstName" CssClass="form-label" />
                <asp:TextBox ID="txtFirstName" runat="server" CssClass="form-control" required="true"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFirstName" runat="server" ControlToValidate="txtFirstName" ErrorMessage="First name is required." CssClass="text-danger" Display="Dynamic" />
            </div>
            <div class="col-4">
                <asp:Label ID="LabelLastName" runat="server" Text="Last Name" AssociatedControlID="txtLastName" CssClass="form-label" />
                <asp:TextBox ID="txtLastName" runat="server" CssClass="form-control" required="true"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredLastName" runat="server" ControlToValidate="txtLastName" ErrorMessage="Last name is required." CssClass="text-danger" Display="Dynamic" />
            </div>
            <div class="col-2">
                <asp:Label ID="LabelSuffix" runat="server" Text="Suffix" AssociatedControlID="txtSuffix" CssClass="form-label" />
                <asp:TextBox ID="txtSuffix" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
        </div>

        <!-- Row for Title -->
        <div class="mb-3">
            <asp:Label ID="LabelTitle" runat="server" Text="Title" AssociatedControlID="txtTitle" CssClass="form-label" />
            <asp:TextBox ID="txtTitle" runat="server" CssClass="form-control"></asp:TextBox>
        </div>

        <!-- Row for Email and Phone -->
        <div class="row mb-3">
            <div class="col-8">
                <asp:Label ID="LabelEmail" runat="server" Text="Email" AssociatedControlID="txtEmail" CssClass="form-label" />
                <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" required="true"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredEmail" runat="server" ControlToValidate="txtEmail" ErrorMessage="Email is required." CssClass="text-danger" Display="Dynamic" />
            </div>
            <div class="col-4">
                <asp:Label ID="LabelPhone" runat="server" Text="Phone" AssociatedControlID="txtPhone" CssClass="form-label" />
                <asp:TextBox ID="txtPhone" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
        </div>

        <!-- Submit Button -->
        <asp:Button ID="btnSubmit" runat="server" CssClass="btn btn-primary mt-3" Text="Submit" OnClick="btnSubmit_Click" />
    </form>
</asp:Content>