<%@ Page Title="Manage Communications" Language="vb" AutoEventWireup="false" MasterPageFile="~/management/MasterPage.master" CodeBehind="manage-comms.aspx.vb" Inherits="M2M_Redesign.manage_comms" %>

<asp:Content ID="Content1" ContentPlaceHolderID="PageTitle" runat="server">
    Manage Communication
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h1>Manage Communication</h1>
    
    <asp:Panel ID="pnlManageComms" runat="server">
        <form id="commForm" runat="server">
            <!-- Subject Line -->
            <div class="form-group">
                <label for="txtSubjectLine">Subject Line</label>
                <asp:TextBox ID="txtSubjectLine" runat="server" CssClass="form-control" required="true"></asp:TextBox>
            </div>

            <!-- Message URL -->
            <div class="form-group">
                <label for="txtMsgURL">Message URL</label>
                <asp:TextBox ID="txtMsgURL" runat="server" CssClass="form-control" required="true"></asp:TextBox>
            </div>

            <!-- Area of Interest -->
            <div class="form-group">
                <label for="ddlAreaOfInterest">Area of Interest</label>
                <asp:DropDownList ID="ddlAreaOfInterest" runat="server" CssClass="form-control" required="true">
                    <asp:ListItem Value="Biogas">Biogas</asp:ListItem>
                    <asp:ListItem Value="Coal Mines">Coal Mines</asp:ListItem>
                    <asp:ListItem Value="Oil & Gas">Oil & Gas</asp:ListItem>
                    <asp:ListItem Value="General">General</asp:ListItem>
                    <asp:ListItem Value="Project Network">Project Network</asp:ListItem>
                </asp:DropDownList>
            </div>

            <!-- Language -->
            <div class="form-group">
                <label for="ddlLanguage">Language</label>
                <asp:DropDownList ID="ddlLanguage" runat="server" CssClass="form-control" required="true">
                    <asp:ListItem Value="English">English</asp:ListItem>
                    <asp:ListItem Value="French">French</asp:ListItem>
                    <asp:ListItem Value="Russian">Russian</asp:ListItem>
                    <asp:ListItem Value="Spanish">Spanish</asp:ListItem>
                </asp:DropDownList>
            </div>

            <!-- Date Sent -->
            <div class="form-group">
                <label for="txtDateSent">Date Sent</label>
                <asp:TextBox ID="txtDateSent" runat="server" CssClass="form-control" Text='<%# DateTime.Now.ToString("yyyy-MM-dd") %>' type="date" required="true"></asp:TextBox>
            </div>

            <!-- Snapshot Subscribers -->
            <div class="form-group">
                <label for="txtSnapshotSubs">Subscribers</label>
                <asp:TextBox ID="txtSnapshotSubs" runat="server" CssClass="form-control" type="number"></asp:TextBox>
            </div>

            <!-- Open Rate -->
            <div class="form-group">
                <label for="txtOpenRate">Open Rate (%)</label>
                <asp:TextBox ID="txtOpenRate" runat="server" CssClass="form-control" type="number" step="0.01"></asp:TextBox>
            </div>

            <!-- Click Rate -->
            <div class="form-group">
                <label for="txtClickRate">Click Rate (%)</label>
                <asp:TextBox ID="txtClickRate" runat="server" CssClass="form-control" type="number" step="0.01"></asp:TextBox>
            </div>

            <!-- Bounce Rate -->
            <div class="form-group">
                <label for="txtBounceRate">Bounce Rate (%)</label>
                <asp:TextBox ID="txtBounceRate" runat="server" CssClass="form-control" type="number" step="0.01"></asp:TextBox>
            </div>

            <!-- Unsub Rate -->
            <div class="form-group">
                <label for="txtUnsubRate">Unsubscribe Rate (%)</label>
                <asp:TextBox ID="txtUnsubRate" runat="server" CssClass="form-control" type="number" step="0.01"></asp:TextBox>
            </div>

            <!-- Newsletter Checkbox -->
            <div class="form-check">
                <asp:CheckBox ID="chkNewsletter" runat="server" CssClass="form-check-input" />
                <label class="form-check-label" for="chkNewsletter">Newsletter</label>
            </div>

            <!-- Thumbnail Upload -->
            <div class="form-group">
                <label for="fileThumbnail">Thumbnail</label>
                <asp:FileUpload ID="fileThumbnail" runat="server" CssClass="form-control-file" />
            </div>

            <!-- Save Button -->
            <asp:Button ID="btnSave" runat="server" Text="Save" CssClass="btn btn-primary" OnClick="SaveData" />
        </form>
    </asp:Panel>
</asp:Content>
