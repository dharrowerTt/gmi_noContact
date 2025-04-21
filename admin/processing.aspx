<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="processing.aspx.vb" Inherits="M2M_Redesign.processing" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
  <asp:FileUpload ID="FileUpload1" runat="server" />
<asp:Button Text="Upload" OnClick="Upload" runat="server" />

      <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" AllowPaging="true"
    OnPageIndexChanging="OnPageIndexChanging" PageSize="10">
    <Columns>
        <asp:BoundField ItemStyle-Width="150px" DataField="Resourceid" HeaderText="Resource ID" />
        <asp:BoundField ItemStyle-Width="150px" DataField="ResourceName" HeaderText="Resource Name" />
    </Columns>
</asp:GridView>
    </form>
</body>
</html>
