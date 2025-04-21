<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="photoAdd.aspx.vb" Inherits="M2M_Redesign.photoAdd" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Upload File</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <label for="ddlType">Select Type:</label>
            <asp:DropDownList ID="ddlType" runat="server">
                <asp:ListItem Value="Resource">Resource</asp:ListItem>
                <asp:ListItem Value="Event">Event</asp:ListItem>
            </asp:DropDownList>
            <br />
            <label for="txtID">ID:</label>
            <asp:TextBox ID="txtID" runat="server"></asp:TextBox>
            <br />
            <label for="fileUpload">Upload File:</label>
            <asp:FileUpload ID="fileUpload" runat="server" />
            <br />
            <asp:Button ID="btnUpload" runat="server" Text="Upload" OnClick="btnUpload_Click" />
            <br />
            <asp:Label ID="lblMessage" runat="server" Text="" ForeColor="Red"></asp:Label>
        </div>
    </form>
</body>
</html>