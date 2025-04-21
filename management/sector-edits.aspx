<%@ Register Assembly="FreeTextBox" Namespace="FreeTextBoxControls" TagPrefix="FTB" %>
<%@ Page Language="vb" AutoEventWireup="false" MasterPageFile="~/management/MasterPage.master" CodeBehind="sector-edits.aspx.vb" Inherits="M2M_Redesign.sector_edits" ValidateRequest="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="PageTitle" runat="server">
    Sector Home Page Edits
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h1>Sector Home Page Edits</h1>
    <p>Select a sector, and then a section of the sector home page to edit.<br /><strong>It is strongly encouraged you use both the <em>Design</em> and <em>HTML</em> views in unison to make changes.</strong></p>
    <div class="alert alert-danger">
        <strong>Warning:</strong> Changes made here will affect the live site immediately. There is no undo or rollback.
    </div>

    <form runat="server">
        <div class="form-group">
            <label for="ddlSector">Select Sector:</label>
            <asp:DropDownList ID="ddlSector" runat="server" CssClass="form-control" AutoPostBack="true"
                OnSelectedIndexChanged="ddlSector_SelectedIndexChanged">
                <asp:ListItem Text="Select a Sector" Value="" />
                <asp:ListItem Text="Biogas" Value="biogas" />
                <asp:ListItem Text="Coal" Value="coal" />
                <asp:ListItem Text="Oil & Gas" Value="oil-gas" />
            </asp:DropDownList>
        </div>

        <div class="form-group">
            <label for="ddlSubOption">Select Section:</label>
            <asp:DropDownList ID="ddlSubOption" runat="server" CssClass="form-control" AutoPostBack="true"
                OnSelectedIndexChanged="ddlSubOption_SelectedIndexChanged">
            </asp:DropDownList>
        </div>

        <asp:Panel ID="pnlEditor" runat="server" Visible="False">
            <FTB:FreeTextBox ID="ftbEditor" runat="server" Width="100%" Height="600px">

            </FTB:FreeTextBox>
            <asp:Button ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click" CssClass="btn btn-primary" />
            <asp:Button ID="btnCancel" runat="server" Text="Cancel" OnClick="btnCancel_Click" CssClass="btn btn-secondary" />
        </asp:Panel>
    </form>

    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

    <script>
        function applyBootstrapToFTB() {
            var editorFrame = document.getElementById('<%= ftbEditor.ClientID %>_designEditor');

            if (editorFrame) {
                var editorDoc = editorFrame.contentDocument || editorFrame.contentWindow.document;

                // Create and inject Bootstrap stylesheet
                var bootstrapLink = document.createElement("link");
                bootstrapLink.rel = "stylesheet";
                bootstrapLink.href = "https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css";
                editorDoc.head.appendChild(bootstrapLink);
            }
        }

        // Wait for the FreeTextBox iframe to load, then apply Bootstrap styles
        window.onload = function () {
            setTimeout(applyBootstrapToFTB, 1000);
        };
</script>

</asp:Content>
