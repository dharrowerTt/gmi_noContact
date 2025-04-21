<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="fileUpload_temp.aspx.vb" Inherits="M2M_Redesign.WebForm1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="FileUploadTempForm" runat="server">
    <div>
    
    <asp:FileUpload ID="resourceLink" runat="server" />
    <hr />
    <asp:Button ID="btnUpload" Text="Upload" runat="server" OnClick="UploadFile" />
    <br />
    <asp:Label ID="lblMessage" ForeColor="Green" runat="server" />

    <label for="txtResourceSize">File Size:</label><asp:TextBox ID="txtResourceSize" runat="server" ReadOnly=true ></asp:TextBox></br>
    <label for="txtREsourcePages">Page Count:</label><asp:TextBox ID="txtResourcePages" runat="server" ReadOnly=true  ></asp:TextBox></br>
    <label for="txtResourceType">File Type:</label><asp:TextBox ID="txtResourceType" runat="server" ReadOnly=true  ></asp:TextBox></br>
    <label for="txtFileType">File Type:</label><asp:TextBox ID="txtFileType" runat="server" ReadOnly=true  ></asp:TextBox></br>
    <label for="txtResourceLink">File path:</label><asp:TextBox ID="txtResourceLink" runat="server" ReadOnly=true ></asp:TextBox></br>
    </div>
    </form>
</body>
</html>
