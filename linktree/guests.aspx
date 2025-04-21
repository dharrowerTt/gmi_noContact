<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="guests.aspx.vb" Inherits="M2M_Redesign.guests" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>


                                                            <asp:GridView ID="conList" runat="server" AutoGenerateColumns="false">
    <Columns>
        <asp:BoundField DataField="connectionID" HeaderText="ConnectionID" />
        <asp:BoundField DataField="firstname" HeaderText="First Name" />
        <asp:BoundField DataField="lastname" HeaderText="Last Name"  />
        <asp:BoundField DataField="connection" HeaderText="Email"  />
        <asp:BoundField DataField="note" HeaderText="Note"  />
        
    </Columns>
</asp:GridView>


                                                   <asp:GridView ID="gvComms" runat="server" AutoGenerateColumns="false">
    <Columns>
        <asp:BoundField DataField="email" HeaderText="Email" />
        <asp:BoundField DataField="GMIRegID" HeaderText="GMIRegID"  />
        <asp:BoundField DataField="firstName" HeaderText="firstName"  />
        <asp:BoundField DataField="lastName" HeaderText="lastName"  />
        <asp:BoundField DataField="affiliation" HeaderText="Affiliation" />
        <asp:BoundField DataField="country" HeaderText="Country" />
    </Columns>
</asp:GridView>
        </div>
    </form>
</body>
</html>
