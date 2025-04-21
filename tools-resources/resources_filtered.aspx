<%@ Page Language="VB" ContentType="text/html" ResponseEncoding="utf-8" CodeBehind="resources_filtered.aspx.vb" Inherits="globalmethane2020.resources_filtered" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
    <head>
        <title>Tools &amp; Resources | Global Methane Initiative</title>
         <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" />
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
 s

        <!-- #include virtual="/includes/header.html" -->
        <form id="resources_filteredForm" runat="server">
<div id="maincontentarea">				<div id="breadcrumbs"><a href="../index.aspx">Home</a> &raquo; <a href="index_new.aspx">Tools and Resources</a> &raquo; <span id="lastcrumb">

    <asp:Literal ID="LitBreadcrumb" runat="server"></asp:Literal>
    </span></div>


  
<h1><asp:Literal ID="litTitle" runat="server" /> 
       </h1>
    



    <asp:Panel runat="server" id="pnlSearchCriteria" visible="false">
        <p>
        <asp:Literal ID="LitSearchCriteria" runat="server" Visible="false" />
        <asp:Button id="btnClearSearch" runat="server" visible="false" onclick="btnClearSearch_click" text="Clear" />
        
        </p>
        
    </asp:Panel>
    
    
    
        
        



    <asp:Label runat="server" ID="srcStr" Text="" Visible="false"></asp:Label>
    
   <asp:Literal ID="results1head" runat="server" ></asp:Literal>
<div class="recentListquad">
<asp:PlaceHolder ID ="PHfeaturedresources" runat="server"></asp:PlaceHolder>
</div>

<!-- start parent repeater -->
<div class="resourcelist">
<p style="clear:both;">Jump to: &nbsp;
<asp:repeater id="topicLinksRepeater" runat="server">
    <itemtemplate>
    <a href="#<%# Replace(DataBinder.Eval(Container.DataItem,"topic")," ","") %>"><%# DataBinder.Eval(Container.DataItem,"topic") %></a> &nbsp;| 
    </itemtemplate>
</asp:repeater>
</p>
    <asp:repeater id="parentRepeater" runat="server" onitemdatabound="parent_itemDataBound">
            <itemtemplate>
            <%----%>
          <h2 id="<%# Replace(DataBinder.Eval(Container.DataItem,"topic")," ","") %>" style="clear:both;"><%# DataBinder.Eval(Container.DataItem,"topic") %></h2>
          
          
          <!-- start child repeater -->
              <asp:repeater id="childRepeater" runat="server">

                 <itemtemplate>
                   <dl><a href='resource_details.aspx?r=<%# Eval("id") %>'><dt><img src='<%# Eval("imgURL") %>'></dt><dd><%# Eval("linktext") %></dd></a></dl><br style="clear:both;" />
                 </itemtemplate>
              </asp:repeater>
          <!-- end child repeater -->
          <a href="#breadcrumbs">&mdash; Back to the top &mdash;</a><br>
       </itemtemplate>
    </asp:repeater>
    
<!-- end parent repeater -->

</div>


</div>
<div id="rightcontentarea">
<div id="rightfiltersbox">
    <div class="rightsearchfiltertitlearea">Filters</div> 
    <div class="rightsearchfiltercontentarea checkboxlist">
        
        <asp:Panel id="pnltopicFilter" runat="server" visible="true">
    <div class="rightsearchfilterfloatleft">
        <div class="searchfiltercategory">Topic</div>
        <div class="searchfilterelements">
            <asp:CheckBoxList ID="chktopicFilter" runat="server" AutoPostBack="True" 
            OnSelectedIndexChanged="topic_selected" DataSourceID="dsTopicCheckboxList" 
            DataTextField="topic" DataValueField="topicID">
            </asp:CheckBoxList>
            
            
        </div>
    </div>
    </asp:Panel>
    <asp:Panel id="pnlSectorFilter" runat="server">
    <div class="rightsearchfilterfloatleft">
        <div class="searchfiltercategory">Sector</div>
        <div class="searchfilterelements">
        <asp:CheckBoxList ID="chksectorFilter" runat="server" AutoPostBack="True" 
            OnSelectedIndexChanged="sector_selected" DataSourceID="dsSectorCheckboxList" 
            DataTextField="sector" DataValueField="sectorabbr">
        </asp:CheckBoxList>
        </div>
    </div>
    </asp:Panel>

    
    
    <asp:Panel id="pnlRegionFilter" runat="server">
    <div class="rightsearchfilterfloatleft">
        <div class="searchfiltercategory">Region</div>
        <div class="searchfilterelements">
        <asp:CheckBoxList ID="chkregionFilter" runat="server" AutoPostBack="True" 
            OnSelectedIndexChanged="region_selected" DataSourceID="dsRegionCheckboxList" 
            DataTextField="region" DataValueField="region">
        </asp:CheckBoxList>
        </div>
    </div>
    </asp:Panel>

    <asp:Panel id="pnlCountryFilter" runat="server" visible="false">
    <div class="rightsearchfilterfloatleft">
        <div class="searchfiltercategory">Country</div>
        <div class="searchfilterelements">
        <asp:CheckBoxList ID="countryFilter" runat="server" AutoPostBack="True" 
            OnSelectedIndexChanged="country_selected" DataSourceID="dsCountryCheckboxList" 
            DataTextField="country" DataValueField="countryid">
        </asp:CheckBoxList>
        </div>
    </div>
    </asp:Panel>

   
    
    <asp:ObjectDataSource ID="dsTopicCheckboxList" runat="server" SelectMethod="SearchTopicListByCategory"
        TypeName="globalmethane2020.clsSearchDAO">

    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="dsCountryCheckboxList" runat="server" SelectMethod="SearchCountryListbyMultipleRegion"
        TypeName="globalmethane2020.clsSearchDAO">
        <SelectParameters>
            <asp:Parameter Name="regionFilterChng" Type="String" />
        </SelectParameters>
    </asp:ObjectDataSource>

    <asp:ObjectDataSource ID="dsRegionCheckboxList" runat="server" SelectMethod="SearchRegionList"
        TypeName="globalmethane2020.clsSearchDAO">
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="dsSectorCheckboxList" runat="server" SelectMethod="SearchSectorList"
        TypeName="globalmethane2020.clsSearchDAO">
    </asp:ObjectDataSource>

        <div class="clear"></div>
        
    </div>
</div>
</div>
<!-- #include virtual="../includes/footer_scripts.aspx" -->

<%# Eval("year")%>
 </body>
        </form>


</html>



 
