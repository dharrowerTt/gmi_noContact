<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="temp.aspx.vb" Inherits="M2M_Redesign.temp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<!-- BEGIN header -->
<!-- all pages -->
<link rel="stylesheet" href="<%#ResolveClientUrl("~/styles/desktoplayout.css")%>" type="text/css"
    media="only screen and (min-width:1080px)" />
<link rel="stylesheet" href="<%#ResolveClientUrl("~/styles/handheldlayout.css")%>"
    media="only screen and (max-width:1079px)" />
<link rel="stylesheet" href="<%#ResolveClientUrl("~/styles/mobilelayout.css")%>" type="text/css"
    media="only screen and (max-device-width:480px)" />
<!--<link rel="stylesheet" href="styles/printlayout.css" type="text/css" media="print" />-->
<style type="text/css" media="all">
    @import url(/styles/common.css);
    @import url(/styles/inner.css);
    @import url(/styles/calendar.css);
    @import url(/styles/jquery-ui.css);
    @import url(/styles/gsc.css);
    @import url(/styles/jquery.fancybox-1.3.1.css);
    @import url(/styles/home.css);
    @media print
    {
        .ui-tabs-nav
        {
            display: none !important;
        }
</style>
<!--[if IE 6]><style type="text/css">@import url(/styles/ie6.css);</style><![endif]-->
<!--[if IE 7]><style type="text/css">@import url(/styles/ie7.css);</style><![endif]-->
<!--[if IE 8]><style type="text/css">@import url(/styles/ie8.css);</style><![endif]-->
<link rel="stylesheet" type="text/css" href="https://www.google.com/cse/style/look/default.css" />

</head>
<body>
    <form id="form1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <h1>Event List</h1>

    <b>Choose the Event Location:<br />
    </b>
    &nbsp;<asp:DropDownList ID="EventLocationsDropDown" 
        DataSourceID="EventLocations" AutoPostBack="True"
      DataTextField="countryname" runat="server" />
    <br />
    <asp:ObjectDataSource ID="EventLocations" runat="server" 
        SelectMethod="getEventLocations" TypeName="M2M_Redesign.DAL">
    </asp:ObjectDataSource>
    <br />
    <table>
      <tr>
        <td valign="top">
          <asp:GridView ID="EventGridView" AllowSorting="True" AllowPaging="True" runat="server"
            DataSourceID="EventsbyCountry" DataKeyNames="eventid" CssClass="grid"
            AutoGenerateColumns="False" Width="100%">
            <Columns>
              <asp:CommandField ShowSelectButton="True" />
              <asp:BoundField DataField="eventid" HeaderText="EventID" ReadOnly="True" SortExpression="eventid" />
              <asp:BoundField DataField="name" HeaderText="Name" SortExpression="name" />
              <asp:BoundField DataField="year" HeaderText="Year" SortExpression="year" />
              <asp:BoundField DataField="sectorid" HeaderText="Sector" SortExpression="sectorid" />
            </Columns>
          </asp:GridView>
            <asp:ObjectDataSource ID="EventsbyCountry" runat="server" 
                SelectMethod="getEventsbyCountry" TypeName="M2M_Redesign.DAL">
                <SelectParameters>
                    <asp:ControlParameter ControlID="EventLocationsDropDown" Name="countryname" 
                        PropertyName="SelectedValue" Type="String" />
                </SelectParameters>
            </asp:ObjectDataSource>
        </td>
        </tr>
        <tr>
        <td valign="top">
          <asp:DetailsView AutoGenerateRows="False" DataKeyNames="eventID" DataSourceID="EventDetails"
            HeaderText="Event Details" ID="EventDetailsView" runat="server" CssClass="grid">
            <Fields>
              <asp:BoundField DataField="eventid" HeaderText="eventid" ReadOnly="True" SortExpression="eventid" Visible="false"/>
              <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                <asp:TemplateField HeaderText="Location" SortExpression="city">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("City") %>'></asp:TextBox>
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("CountryName") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("City") %>'></asp:TextBox>
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("CountryName") %>'></asp:TextBox>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("City") %>'></asp:Label>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("CountryName") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Event Dates" SortExpression="startdate">
                    <EditItemTemplate>
                     <asp:Calendar  ID="stardatecalendar" CssClass="calendar" Caption="Start Date" runat="server" SelectedDate='<%# Bind("startdate") %>'></asp:Calendar>                      <asp:Calendar ID="enddatecalendar" runat="server" Caption="End Date" CssClass="calendar" SelectedDate='<%# Bind("enddate") %>' CellPadding="1"></asp:Calendar>
                        
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:Calendar  ID="stardatecalendarinsert" Caption="Start Date" CssClass="calendar" runat="server" SelectedDate='<%# Bind("startdate") %>'></asp:Calendar>                        <asp:Calendar ID="enddatecalendarinsert" runat="server" Caption="End Date" CssClass="calendar" SelectedDate='<%# Bind("enddate") %>'></asp:Calendar>
                        
                    </InsertItemTemplate>
                    <ItemTemplate>
                        From: <asp:Label ID="Label3" runat="server" Text='<%# Bind("startdate") %>'></asp:Label>
                        To:
                        <asp:Label ID="Label4" runat="server" Text='<%# Bind("enddate") %>'></asp:Label>

                    </ItemTemplate>
                </asp:TemplateField>
              <asp:BoundField DataField="sponsored" HeaderText="Sponsored" SortExpression="sponsored" />
              <asp:BoundField DataField="related" HeaderText="GMI-Related" SortExpression="related" />
              <asp:BoundField DataField="subcommittee" HeaderText="Subcommittee-Related" SortExpression="subcommittee" />
                <asp:TemplateField HeaderText="Details">
                    <EditItemTemplate>
                        <ajaxToolkit:HtmlEditorExtender ID="details1extender" runat="server" TargetControlID="details1" DisplaySourceTab="true">
                        </ajaxToolkit:HtmlEditorExtender>
                        <asp:TextBox ID="details1" runat="server"  text='<%# Bind("details") %>' multiline=True></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                       <%-- <ajaxToolkit:HtmlEditorExtender ID="details2extender" runat="server" TargetControlID="details2" DisplaySourceTab="true">
                        </ajaxToolkit:HtmlEditorExtender>--%>
                        <asp:TextBox ID="details2" runat="server" text='<%# Bind("details") %>' multiline=True ></asp:TextBox></asp:textarea>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <div id="caledit">
                        <asp:Literal ID="Literal1" runat="server" Text='<%# Bind("details") %>'></asp:Literal>
                        </div>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:CommandField CancelImageUrl="~/images/ic_back.png" 
                    EditImageUrl="/images/ic_edit.png" NewImageUrl="/images/ic_add.png" 
                    ShowEditButton="True" CausesValidation="False">
                <ControlStyle CssClass="clean" />
                </asp:CommandField>
                <asp:CommandField ShowInsertButton="True" />
                <asp:CommandField ShowDeleteButton="True" />
            </Fields>
          </asp:DetailsView>
            <asp:ObjectDataSource ID="EventDetails" runat="server" 
                SelectMethod="getEventDetailsbyID" UpdateMethod="updateEventDetailsbyID" TypeName="M2M_Redesign.DAL">
                <SelectParameters>
                    <asp:ControlParameter ControlID="EventGridView" Name="eventID" 
                        PropertyName="SelectedValue" Type="String" />
                </SelectParameters>
            </asp:ObjectDataSource>
        </td>
      </tr>
    </table>
    <br />
  </form>
</body>
</html>
