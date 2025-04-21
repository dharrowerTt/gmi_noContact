<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="seedocs.aspx.vb" Inherits="M2M_Redesign.seedocs" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" EmptyDataText = "No files uploaded">
    <Columns>
        <asp:BoundField DataField="Text" HeaderText="File Name" />
        
     
        
        
    </Columns>
</asp:GridView>
    </div>
    </form>
</body>
</html>
