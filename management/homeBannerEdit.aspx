<%@ Page Title="Edit Home Page Banner" Language="vb" AutoEventWireup="false" MasterPageFile="~/management/MasterPage.master" CodeBehind="homeBannerEdit.aspx.vb" Inherits="M2M_Redesign.homeBannerEdit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="PageTitle" runat="server">
    Edit Home Page Banner
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <form runat="server">
        <h2 id="pageTitle">Add/Edit Home Page Banner</h2>
        
        <asp:HiddenField ID="hfBannerId" runat="server" />
            <div class="mb-3">
    <label class="form-label">Banner Name</label>
    <asp:TextBox ID="txtBannerName" runat="server" CssClass="form-control" required></asp:TextBox>
</div>

        <!-- Main Banner Text -->
        <div class="mb-3">
            <label class="form-label">Main Banner Text</label>
            <asp:TextBox ID="txtMainText" runat="server" CssClass="form-control" required></asp:TextBox>
        </div>

        <!-- Secondary Banner Text -->
        <div class="mb-3">
            <label class="form-label">Secondary Banner Text</label>
            <asp:TextBox ID="txtSubText" runat="server" CssClass="form-control"></asp:TextBox>
        </div>

        <!-- Button Text -->
        <div class="mb-3">
            <label class="form-label">Button Text</label>
            <asp:TextBox ID="txtButtonText" runat="server" CssClass="form-control"></asp:TextBox>
        </div>

        <!-- Button Destination -->
        <div class="mb-3">
            <label class="form-label">Button Destination</label>
            <asp:TextBox ID="txtButtonDestination" runat="server" CssClass="form-control"></asp:TextBox>
        </div>

        <!-- Banner Style Selection -->
        <div class="mb-3">
            <label class="form-label">Banner Style</label>
            <asp:DropDownList ID="ddlBannerStyle" runat="server" CssClass="form-select" AutoPostBack="True" OnSelectedIndexChanged="ddlBannerStyle_SelectedIndexChanged">
                <asp:ListItem Text="Colors" Value="Colors"></asp:ListItem>
                <asp:ListItem Text="Image" Value="Image"></asp:ListItem>
            </asp:DropDownList>
        </div>

        <!-- Image Upload Section (Visible when Image is selected) -->
        <div class="mb-3" id="imageSection" runat="server" visible="false">
            <label class="form-label">Image File</label>
            <asp:FileUpload ID="fuImage" runat="server" CssClass="form-control" />
            <small class="text-muted">Recommended size: 1600x600px. PNG or JPG.</small>

            <label class="form-label mt-2">Alt Text (Description for Screen Readers)</label>
            <asp:TextBox ID="txtAltText" runat="server" CssClass="form-control"></asp:TextBox>
        </div>

        <!-- Gradient Selection Section (Visible when Colors is selected) -->
        <div class="mb-3" id="gradientSection" runat="server" visible="true">
            <label class="form-label">Choose a Gradient</label>
            <div class="d-flex flex-wrap">
                <asp:RadioButtonList ID="rbGradients" runat="server" CssClass="form-check">
                    <asp:ListItem Value="linear-gradient(to right, #ff9a9e, #fad0c4)">Pink Sunset</asp:ListItem>
                    <asp:ListItem Value="linear-gradient(to right, #a1c4fd, #c2e9fb)">Blue Sky</asp:ListItem>
                    <asp:ListItem Value="linear-gradient(to right, #ffecd2, #fcb69f)">Warm Peach</asp:ListItem>
                    <asp:ListItem Value="linear-gradient(to right, #d4fc79, #96e6a1)">Green Oasis</asp:ListItem>
                    <asp:ListItem Value="linear-gradient(to right, #8ec5fc, #e0c3fc)">Purple Dream</asp:ListItem>
                </asp:RadioButtonList>
            </div>
        </div>

        <!-- Save Button -->
        <div class="mt-3">
            <asp:Button ID="btnSave" runat="server" CssClass="btn btn-success" Text="Save Banner" OnClick="btnSave_Click" />
            <a href="bannerAdmin.aspx" class="btn btn-secondary">Cancel</a>
        </div>
            </form>
    </div>
</asp:Content>
