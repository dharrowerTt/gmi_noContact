<%@ Page Title="Web Metrics" Language="vb" AutoEventWireup="false" MasterPageFile="~/management/MasterPage.master" CodeBehind="web-metrics.aspx.vb" Inherits="M2M_Redesign.web_metrics" %>
<asp:Content ID="Content1" ContentPlaceHolderID="PageTitle" runat="server">
    Web Metrics
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <h2 class="my-4">Web Metrics</h2>

        <!-- File Upload Form -->
        <form runat="server">
        <asp:Panel ID="UploadPanel" runat="server" Visible="False" CssClass="mb-4">
            <h4>Upload a File</h4>
            <asp:FileUpload ID="FileUploadControl" runat="server" CssClass="form-control mb-2" />
            <asp:Button ID="UploadButton" runat="server" Text="Upload" CssClass="btn btn-primary" OnClick="UploadButton_Click" />
        </asp:Panel>
            

        <!-- File List -->
<asp:Repeater ID="FilesRepeater" runat="server">
    <HeaderTemplate>
        <ul class="list-group">
    </HeaderTemplate>
    <ItemTemplate>
        <li class="list-group-item d-flex justify-content-between align-items-center">
            <a href='<%# Eval("FileUrl") %>' target="_blank"><%# Eval("FileName") %></a>
            <asp:Button ID="DeleteButton" runat="server" Text="Delete" CssClass="btn btn-danger btn-sm" CommandName="Delete" CommandArgument='<%# Eval("FileName") %>' />
        </li>
    </ItemTemplate>
    <FooterTemplate>
        </ul>
    </FooterTemplate>
</asp:Repeater>

<asp:Panel ID="Panel1" runat="server" CssClass="alert alert-info" Visible="False">
    No files found in the directory.
</asp:Panel>


<asp:Panel ID="NoFilesPanel" runat="server" CssClass="alert alert-info" Visible="False">
    No files found in the directory.
</asp:Panel>
            </form>

    </div>

    <script>
        document.addEventListener("DOMContentLoaded", function () {
            document.querySelectorAll(".delete-btn").forEach(function (button) {
                button.addEventListener("click", function () {
                    const fileName = this.getAttribute("data-file");
                    if (confirm("Are you sure you want to delete this file?")) {
                        fetch("web-metrics.aspx?deleteFile=" + encodeURIComponent(fileName), {
                            method: "POST"
                        }).then(response => {
                            if (response.ok) {
                                location.reload();
                            } else {
                                alert("Failed to delete the file.");
                            }
                        });
                    }
                });
            });
        });
    </script>
</asp:Content>
