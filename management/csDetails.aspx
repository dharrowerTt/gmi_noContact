<%@ Page Title="Case Study Details" Language="vb" AutoEventWireup="false" MasterPageFile="~/management/MasterPage.master" CodeBehind="csDetails.aspx.vb" Inherits="M2M_Redesign.csDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="PageTitle" runat="server">
    Case Study Details
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <form runat="server">
    <div class="container mt-3">
        <div class="card">
            <div class="card-header">
                <h4><%= proposedTitle %></h4>
            </div>
            <div class="card-body">
                <div class="mb-3">
                    <label for="workingFolder" class="form-label">Working Folder</label>
                    <asp:TextBox ID="txtWorkingFolder" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="mb-3">
                    <label for="finalWordFile" class="form-label">Final Word File</label>
                    <asp:TextBox ID="txtFinalWordFile" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="mb-3">
                    <label for="notes" class="form-label">Notes</label>
                    <asp:TextBox ID="txtNotes" runat="server" TextMode="MultiLine" Rows="5" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="d-flex justify-content-between">
                    <asp:Button ID="btnSave" runat="server" Text="Save" CssClass="btn btn-primary" OnClick="btnSave_Click" />
                    <asp:Button ID="btnCancel" runat="server" Text="Cancel" CssClass="btn btn-secondary" PostBackUrl="case-studies.aspx" />
                </div>
            </div>
        </div>
    </div>
</form>

</asp:Content>
