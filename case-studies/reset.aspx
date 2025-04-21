<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="reset.aspx.vb" Inherits="M2M_Redesign.reset" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Reset Password</title>
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
        <asp:Label ID="lblMessage" runat="server" Text="" ForeColor="Red"></asp:Label>
        <asp:Panel ID="pnlResetPassword" runat="server">
            <h2>Reset Password</h2>
            <asp:Label ID="lblResetUsername" runat="server" Text="Username:"></asp:Label>
            <asp:TextBox ID="txtResetUsername" runat="server"></asp:TextBox>
            <asp:Label ID="lblNewPassword" runat="server" Text="New Password:"></asp:Label>
            <asp:TextBox ID="txtNewPassword" runat="server" TextMode="Password"></asp:TextBox>
            <asp:Button ID="btnResetPassword" runat="server" Text="Reset Password" OnClick="btnResetPassword_Click" />
        </asp:Panel>
    </div>
</body>
</html>
