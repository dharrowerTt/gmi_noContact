<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="approve.aspx.vb" Inherits="M2M_Redesign.approve1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
    img {
    image-orientation: from-image;
}
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:TextBox ID="fName" Width="500px"  runat="server"></asp:TextBox><br />
        <asp:TextBox ID="lName" Width="500px" runat="server"></asp:TextBox><br />
        <asp:TextBox ID="speakerBioHolder" Width="500px" TextMode="MultiLine" Height="150px" runat="server"></asp:TextBox><br />
     <asp:Image ID="Image1" runat="server"  Width = "200" /><br />
        <asp:Button ID="Button1" runat="server" Text="Approve" /><br />
          <asp:Label ID="lblMessage" ForeColor="Green" runat="server" />
    </div>
    </form>
</body>
</html>
