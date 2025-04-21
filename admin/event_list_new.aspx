<%@ Page Title="" Language="vb" AutoEventWireup="false" CodeBehind="event_list_new.aspx.vb" Inherits="M2M_Redesign.event_list" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
    <head>
        <title>Admin | Event List</title>
        <!-- #include virtual="/includes/header.aspx" -->
    </head>
	<body>
	<ul class="hide">
		<li><a href="#maincontentarea" title="Skip Navigation (AccessKey+1)" accesskey="1">Skip Navigation</a></li>
	</ul>
    
        
        <div id="maincontentarea">
        <div id="breadcrumbs"><a href="../index.aspx">Home</a> &raquo; <span id="breadcrumbs"><a href="index.aspx">Administration Module</a></span> &raquo; <span id="lastcrumb">Event List</span> &raquo; <span id="Span1"><a href="login.aspx">Logout</a></span></div>
        <h1>Event List</h1>	
        <form id="eventlist" runat="server">
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
              <asp:BoundField DataField="sectors" HeaderText="Sector" SortExpression="sectors" />
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
</div><!--end maincontentarea div-->
        

        
        

<!-- #include virtual="../includes/footer.aspx" -->
    	
	</body>
</html>

