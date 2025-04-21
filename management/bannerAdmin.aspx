<%@ Page Title="Home Page Banner Admin" Language="vb" AutoEventWireup="false" MasterPageFile="~/management/MasterPage.master" CodeBehind="bannerAdmin.aspx.vb" Inherits="M2M_Redesign.bannerAdmin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="PageTitle" runat="server">
    Home Page Banner Admin
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <form runat="server">
    <div class="container">
        <h2>Manage Home Page Banners</h2>
        <a href="homeBannerEdit.aspx" class="btn btn-primary mb-3">Add a New Banner</a>

        <asp:GridView ID="gvBanners" runat="server" AutoGenerateColumns="False" CssClass="table table-striped" DataKeyNames="id">
            <Columns>
                <asp:BoundField DataField="bannerName" HeaderText="Banner Name" />
                <asp:BoundField DataField="setDate" HeaderText="Set Date" DataFormatString="{0:yyyy-MM-dd}" />
                
                <asp:TemplateField HeaderText="Active">
                    <ItemTemplate>
                        <asp:CheckBox ID="chkActive" runat="server" Checked='<%# Convert.ToBoolean(Eval("active")) %>' AutoPostBack="True" OnCheckedChanged="chkActive_CheckedChanged" />
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Position">
                    <ItemTemplate>
                        <asp:DropDownList ID="ddlPosition" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlPosition_SelectedIndexChanged" Enabled='<%# Convert.ToBoolean(Eval("active")) %>'>
                        </asp:DropDownList>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Actions">
                    <ItemTemplate>
                        <a href='<%# "homeBannerEdit.aspx?id=" & Eval("id") %>' class="btn btn-warning btn-sm">Edit</a>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>

        <h3 class="mt-4">Carousel Preview</h3>
        <iframe src="bannerPreview.aspx" width="100%" height="400px" style="border: 1px solid #ccc;"></iframe>
    </div>
    </form>
</asp:Content>
