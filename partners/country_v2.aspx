<%@ Page Language="vb" AutoEventWireup="false" MasterPageFile="~/includes/OneColMasterPage.master" enableEventValidation = false async="true" MaintainScrollPositionOnPostback="true" CodeBehind="country_v2.aspx.vb" Inherits="M2M_Redesign.country_v2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContentPlaceholder" runat="server">
    <style type="text/css" media="all">
        @import url(/styles/search.css);
        #searchfield {visibility:hidden;height:0;overflow:hidden;}
        #topsearchbutton {visibility:hidden;height:0;overflow:hidden;}
        #search_form {visibility:hidden;height:0;overflow:hidden;}
        .grid th {border-top: 4px solid #0298D7;}
    </style>
 <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  
   
    
<div id="filtersbox">
    <div class="searchfiltercontentarea checkboxlist">
        
    <asp:panel id="pnlCategory" runat="server" visible="false">
    <asp:checkboxList ID="categoryFilter" runat="server" AutoPostBack="true" OnSelectedIndexChanged="category_selected">
        <asp:ListItem  Value="Activity" Text="Activities" ></asp:ListItem>
        <asp:ListItem  Value="Resource" Text="Resources" ></asp:ListItem>
        <asp:ListItem  Value="Event" Text="Events" ></asp:ListItem>
        <asp:ListItem  Value="Partner" Text="Project Network" ></asp:ListItem>
    </asp:CheckBoxList>
    <asp:Literal id="LitExportSQL" visible="false" runat="server"></asp:Literal>
    </asp:panel>
    </div>
</div>

    
    <asp:Panel runat="server" cssClass="activetab" id="tab7">
        <asp:LinkButton ID="ActionPlansLink" runat="server">Committee Activities</asp:LinkButton></asp:Panel>
        <asp:Panel runat="server" cssClass="activetab" id="tab8">
        <asp:LinkButton ID="SubcommitteeLink" runat="server">Subcommittee Members</asp:LinkButton></asp:Panel>
        <asp:Panel runat="server" cssClass="tablink" id="tab1">
        <asp:LinkButton ID="ActivitiesLink" runat="server">Projects & Activities <asp:Label id="LitactivityCount" runat="server"  cssclass="smLabel" /></asp:LinkButton></asp:Panel>
        <asp:Panel runat="server" cssClass="tablink" id="tab2">
        <asp:LinkButton ID="ToolsResourcesLink" runat="server">Resources <asp:Label id="LitresourcesCount" runat="server"  cssclass="smLabel" /> </asp:LinkButton></asp:Panel><asp:Panel runat="server" cssClass="tablink" id="tab3">
        <asp:LinkButton ID="EventLink" runat="server">Events <asp:Label id="LiteventCount" runat="server" cssclass="smLabel"  /> </asp:LinkButton></asp:Panel><asp:Panel runat="server" cssClass="tablink" id="tab5">
        <asp:LinkButton ID="MembersLink" runat="server">Project Network <asp:Label id="LitpartnerCount" runat="server"  cssclass="smLabel" /></asp:LinkButton></asp:Panel>
    <asp:Panel runat="server" cssClass="exportTab" style="float:right;">
        <asp:LinkButton id="btnExportToExcel" runat="server" onclick="btnExportToExcel_click" cssclass="selecteditem" Tooltip="Click to download current list to Microsoft Excel"><img src="/images/excel_icon.gif" alt="Excel Download" style="height:13px;"/> Export This Tab</asp:LinkButton></asp:Panel>
    <div>
        
    
<asp:GridView ID="SearchResults" runat="server" AllowPaging="True" 
    AutoGenerateColumns="False" EmptyDataText="There are no results matching the search criteria."
    OnPageIndexChanging="OnPageIndexChanging" PageSize="25" 
    CssClass="grid" OnSorting="SortRecords" AllowSorting="True" >
    <Columns> 
        <asp:TemplateField HeaderText="Name" SortExpression="LinkText" itemSTyle-Width="30%" >
            <itemTemplate>
            <a href='<%# Eval("Link") %>'>
                                <%# Eval("LinkText")%></a>
            </itemTemplate>
            </asp:TemplateField>
        
        <asp:BoundField DataField="Year" HeaderText="Year" ItemStyle-Width="10%" sortexpression = "year"/>
        <asp:BoundField DataField="type" HeaderText="Type" ItemStyle-Width="15%" sortExpression = "type" />
        <asp:BoundField DataField="language" HeaderText="Language" ItemStyle-Width="15%" sortExpression = "language" />
        <asp:BoundField DataField="sectors" HeaderText="Sector(s)" ItemStyle-Width="30%" sortExpression = "sectors" />
    </Columns>


</asp:GridView>

<div style="width:0;height:0;overflow:hidden;">
<asp:GridView id="searchExport" runat="server" autogeneratecolumns="True" allowsorting="false" allowpaging="false" ></asp:GridView>
    </div>
</div><div class="clear"></div>
<br /><br />
</asp:Content>


