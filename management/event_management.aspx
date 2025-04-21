<%@ Page Title="Event Management" Language="vb" AutoEventWireup="false" CodeBehind="event_management.aspx.vb" Inherits="M2M_Redesign.event_management" MasterPageFile="~/management/MasterPage.master" ValidateRequest="false" %>

<%@ Register TagPrefix="FTB" Namespace="FreeTextBoxControls" Assembly="FreeTextBox" %>

<asp:Content ID="Content1" ContentPlaceHolderID="PageTitle" runat="server">
    Event Management
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h1>Event Management</h1>
      
    <asp:Label ID="lblError" runat="server" CssClass="text-danger" Visible="False"></asp:Label>

    <form runat="server">
        <asp:Button ID="btnEventList" runat="server" Text="Event List" CssClass="btn btn-success mb-3" OnClick="btnEventList_Click" />
        <!-- Event Basics Section -->
        <style>
            .form-group > label {
                font-weight: bold;
            }
            input[type="radio"] {
                margin-right: 5px;
            }
        </style>
        <h3>Event Basics</h3>
        <hr />
        <div id="successAlert" runat="server" class="alert alert-success alert-dismissible fade show" role="alert" visible="False">
            <asp:Label ID="lblSuccess" runat="server"></asp:Label>
            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
        </div>

        <div class="form-group">
            <label for="txtEventName">Event Name:</label>
            <asp:TextBox ID="txtEventName" runat="server" CssClass="form-control" MaxLength="255" required></asp:TextBox>
            <small class="form-text text-muted">Maximum length: 255 characters, including spaces.</small>
        </div>

        <div class="form-group">
            <label>Status:</label>
            <asp:RadioButtonList ID="rblStatus" runat="server">
                <asp:ListItem Text="Draft" Value="Draft" />
                <asp:ListItem Text="Final" Value="Final" />
            </asp:RadioButtonList>
            <small class="form-text text-muted">Draft: Event will not appear in event listings. Final: Event will appear in event listings.</small>
        </div>

        <div class="form-group">
            <label for="txtDescription">Event Description:</label>
            <FTB:FreeTextBox ID="txtDescription" runat="server" Width="100%" Height="200px" />
            <small class="form-text text-muted">Enter a brief description that will be displayed for this event.</small>
        </div>

        <!-- Event Location Section -->
        <h3>Event Location</h3>
        <hr />
        <div class="form-group">
            <label for="ddlCountry">Country:</label>
            <asp:DropDownList ID="ddlCountry" runat="server" CssClass="form-control" required></asp:DropDownList>
            <small class="form-text text-muted">Select the country where the event will take place.</small>
        </div>

        <div class="form-group">
            <label for="txtCity">City:</label>
            <asp:TextBox ID="txtCity" runat="server" CssClass="form-control"></asp:TextBox>
        </div>

        <div class="form-group">
            <label for="txtState">State/Province:</label>
            <asp:TextBox ID="txtState" runat="server" CssClass="form-control"></asp:TextBox>
        </div>

        <!-- Event Dates Section -->
        <h3>Event Dates</h3>
        <hr />
        <div class="form-group">
            <label for="txtStartDate">Start Date:</label>
            <asp:TextBox ID="txtStartDate" runat="server" CssClass="form-control" TextMode="Date" required></asp:TextBox>
        </div>

        <div class="form-group">
            <label for="txtEndDate">End Date:</label>
            <asp:TextBox ID="txtEndDate" runat="server" CssClass="form-control" TextMode="Date" required></asp:TextBox>
            <small class="form-text text-muted">End date must be on or after the start date.</small>
        </div>

        <!-- Organizer and Contact Information Section -->
        <h3>Organizer and Contact Information</h3>
        <hr />
        <div class="form-group">
            <label>Organizer Name:</label>
            <asp:TextBox ID="txtOrganizerName" runat="server" CssClass="form-control"></asp:TextBox>
        </div>

        <div class="form-group">
            <label>Organizer URL:</label>
            <asp:TextBox ID="txtOrganizerURL" runat="server" CssClass="form-control"></asp:TextBox>
            <small class="form-text text-muted">Provide the organizer's website for more details.</small>
        </div>

        <div class="form-group">
            <label>Point of Contact (POC) Name:</label>
            <asp:TextBox ID="txtPOCName" runat="server" CssClass="form-control"></asp:TextBox>
        </div>

        <div class="form-group">
            <label>POC Email:</label>
            <asp:TextBox ID="txtPOCEmail" runat="server" CssClass="form-control"></asp:TextBox>
        </div>

        <div class="form-group">
            <label>POC Phone:</label>
            <asp:TextBox ID="txtPOCPhone" runat="server" CssClass="form-control"></asp:TextBox>
        </div>

        <!-- Event Classification and Role Section -->
        <h3>Event Classification and Role</h3>
        <hr />
        <div class="form-group">
            <label>Sectors:</label>
            <asp:ListBox ID="ddlSector" runat="server" CssClass="form-control" SelectionMode="Multiple"></asp:ListBox>
            <small class="form-text text-muted">Use Ctrl+Click to select multiple sectors.</small>
        </div>

        <div class="form-group">
            <label>GMI Role:</label>
            <asp:RadioButtonList ID="rblGMIRole" runat="server">
                <asp:ListItem Text="Sponsored" Value="sponsored" />
                <asp:ListItem Text="Subcommittee" Value="subcommittee" />
                <asp:ListItem Text="GMI Related" Value="related" />
            </asp:RadioButtonList>
        </div>

        <!-- Event Links and Files Section -->
        <h3>Event Links and Files</h3>
        <hr />
        <div class="form-group">
            <label>Event Website:</label>
            <asp:TextBox ID="txtEventURL" runat="server" CssClass="form-control"></asp:TextBox>
            <small class="form-text text-muted">Provide a link to a website with additional event details.</small>
        </div>

        <div class="form-group">
            <label>Featured Photo:</label><br />
            <asp:Image ID="imgPhoto" runat="server" Visible="False" Width="50%" />
            <asp:FileUpload ID="fileFeaturedPhoto" runat="server" />
            <small class="form-text text-muted">Upload an image for the event. The image will be renamed automatically to ensure a unique filename.</small>
        </div>

        <asp:Button ID="btnSave" runat="server" Text="Save" CssClass="btn btn-primary mt-3" OnClick="btnSave_Click" />
    </form>
</asp:Content>
