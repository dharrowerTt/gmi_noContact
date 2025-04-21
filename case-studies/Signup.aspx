<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Signup.aspx.vb" Inherits="M2M_Redesign.Signup1" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Sign Up</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f0f0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        #formContainer {
            background-color: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 300px;
            text-align: center;
        }
        h2 {
            margin-top: 0;
        }
        label, input {
            display: block;
            width: 100%;
            margin: 10px 0;
        }
        input[type="text"], input[type="password"] {
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
        }
        input[type="submit"] {
            background-color: #28a745;
            color: #fff;
            border: none;
            border-radius: 5px;
            padding: 10px;
            cursor: pointer;
        }
        input[type="submit"]:hover {
            background-color: #218838;
        }
    </style>
</head>
<body>
    <div id="formContainer">
        <form runat="server">
        <asp:Label ID="lblMessage" runat="server" Text="" ForeColor="Red"></asp:Label>
        <h2>Sign Up</h2>
        <asp:Label ID="lblUsername" runat="server" Text="Username:"></asp:Label>
        <asp:TextBox ID="txtUsername" runat="server"></asp:TextBox>
        <asp:Label ID="lblPassword" runat="server" Text="Password:"></asp:Label>
        <asp:TextBox ID="txtPassword" runat="server" TextMode="Password"></asp:TextBox>
        <asp:Label ID="lblSignupCode" runat="server" Text="Signup Code:"></asp:Label>
        <asp:TextBox ID="txtSignupCode" runat="server"></asp:TextBox>
        <asp:Button ID="btnSignUp" runat="server" Text="Sign Up" OnClick="btnSignUp_Click" />
        <br />
        <asp:HyperLink ID="hlLogin" runat="server" NavigateUrl="login.aspx">Already have an account? Login</asp:HyperLink>
            </form>
    </div>
</body>
</html>
