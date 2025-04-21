<%@ Page Title="Forgot Password" Language="vb" MasterPageFile="~/management/MasterPage.master" AutoEventWireup="false" CodeBehind="forgot-password.aspx.vb" Inherits="M2M_Redesign.forgot_password" %>

<asp:Content ID="Content1" ContentPlaceHolderID="PageTitle" runat="server">
    Forgot Password
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <form runat="server">
        <h1>Forgot Password</h1>
        <asp:Label ID="lblError" runat="server" CssClass="text-danger"></asp:Label>

        <!-- MultiView to toggle between requesting code and entering reset information -->
        <asp:MultiView ID="mvForgotPassword" runat="server" ActiveViewIndex="0">
            <!-- View 0: Request Reset Code -->
            <asp:View ID="ViewRequestCode" runat="server">
                <div class="mb-3">
                    <asp:Label ID="lblEmail" runat="server" Text="Enter your email address:" AssociatedControlID="txtEmail"></asp:Label>
                    <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" TextMode="Email"></asp:TextBox>
                </div>
                <asp:Button ID="btnSendCode" runat="server" Text="Send Reset Code" CssClass="btn btn-primary" OnClick="btnSendCode_Click" />
            </asp:View>

            <!-- View 1: Enter Reset Code and New Password -->
            <asp:View ID="ViewEnterCode" runat="server">
                <div class="mb-3">
                    <asp:Label ID="lblEmailLocked" runat="server" Text="Email address:" AssociatedControlID="txtEmailLocked"></asp:Label>
                    <asp:TextBox ID="txtEmailLocked" runat="server" CssClass="form-control" ReadOnly="True"></asp:TextBox>
                </div>
                <div class="mb-3">
                    <asp:Label ID="lblResetCode" runat="server" Text="Enter the reset code:" AssociatedControlID="txtResetCode"></asp:Label>
                    <asp:TextBox ID="txtResetCode" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="mb-3">
                    <asp:Label ID="lblNewPassword" runat="server" Text="New Password:" AssociatedControlID="txtNewPassword"></asp:Label>
                    <asp:TextBox ID="txtNewPassword" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
                    <small>Password must meet the standard requirements.</small>
                </div>
                <asp:Button ID="btnResetPassword" runat="server" Text="Reset Password" CssClass="btn btn-success" OnClick="btnResetPassword_Click" />
            </asp:View>
        </asp:MultiView>
    </form>
</asp:Content>
