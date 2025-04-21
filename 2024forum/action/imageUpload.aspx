<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="imageUpload.aspx.vb" Inherits="M2M_Redesign.imageUpload" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:FileUpload ID="FileUpload1" runat="server" />
            <asp:TextBox ID="caption" runat="server"></asp:TextBox>
            <asp:Button ID="btnUpload" Text="Upload" runat="server" OnClick="UploadFile" />
            <hr />
            <asp:Image ID="Image1" runat="server" Width="100" />
        </div>
    </form>
</body>
</html>
