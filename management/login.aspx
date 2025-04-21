<%@ Page Title="Login" Language="vb" MasterPageFile="~/management/MasterPage.master" AutoEventWireup="false" CodeBehind="login.aspx.vb" Inherits="M2M_Redesign.login1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="PageTitle" runat="server">
    Login
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <form runat="server">
    <div class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-md-6">
                <div class="card">
                    <div class="card-header text-center">
                        <h4>Login to Your Account</h4>
                    </div>
                    <div class="card-body">
                        <asp:Label ID="lblMessage" runat="server" CssClass="text-danger"></asp:Label>
                        <asp:TextBox ID="txtUsername" runat="server" CssClass="form-control" Placeholder="Username" />
                        <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control mt-3" TextMode="Password" Placeholder="Password" />
                        <asp:Button ID="btnLogin" runat="server" Text="Login" CssClass="btn btn-primary mt-3 w-100" OnClick="btnLogin_Click" />

                        <div class="mt-3 text-center">
                            <a href="signup.aspx">Don't have an account? Sign up</a><br />
                            <a href="forgot-password.aspx">Forgot password?</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>       
    </div>
        </form>
</asp:Content>
