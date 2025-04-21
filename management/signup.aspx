<%@ Page Title="Sign Up" Language="vb" MasterPageFile="~/management/MasterPage.master" AutoEventWireup="false" CodeBehind="signup.aspx.vb" Inherits="M2M_Redesign.signup2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="PageTitle" runat="server">
    Sign Up
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <form runat="server">
        <h1>Create an Account</h1>
        
        <asp:Label ID="lblMessage" runat="server" CssClass="text-danger"></asp:Label>
        
        <div class="form-group">
            <label for="txtEmail">Email Address</label>
            <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" TextMode="Email" required="true" placeholder="Enter your email" />
            <asp:RegularExpressionValidator ID="emailValidator" runat="server" 
                ControlToValidate="txtEmail" 
                ValidationExpression="^[^@\s]+@[^@\s]+\.[^@\s]+$" 
                ErrorMessage="Invalid email format." 
                ForeColor="Red" />
        </div>
        
        <div class="form-group">
            <label for="txtPassword">Password</label>
            <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" TextMode="Password" placeholder="Enter a strong password" required="true" />
            <div id="passwordCriteria">
                <ul>
                    <li id="lengthCriteria">Minimum 8 characters</li>
                    <li id="uppercaseCriteria">At least one uppercase letter</li>
                    <li id="numberCriteria">At least one number</li>
                    <li id="specialCharCriteria">At least one special character (!@#$%^&amp;*)</li>
                </ul>
            </div>
        </div>

        <asp:Button ID="btnSignUp" runat="server" Text="Sign Up" CssClass="btn btn-primary" OnClick="btnSignUp_Click" />
    </form>

    <script>
        document.getElementById("txtPassword").addEventListener("input", function() {
            var password = this.value;
            document.getElementById("lengthCriteria").style.color = password.length >= 8 ? "green" : "red";
            document.getElementById("uppercaseCriteria").style.color = /[A-Z]/.test(password) ? "green" : "red";
            document.getElementById("numberCriteria").style.color = /[0-9]/.test(password) ? "green" : "red";
            document.getElementById("specialCharCriteria").style.color = /[!@#$%^&*]/.test(password) ? "green" : "red";
        });
    </script>
</asp:Content>
