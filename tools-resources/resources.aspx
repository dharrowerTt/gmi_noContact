<%@ Page Language="VB" ContentType="text/html" ResponseEncoding="utf-8" CodeBehind="resources.aspx.vb"
    Inherits="globalmethane2020.resources" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
    <title>Tools &amp; Resources | Global Methane Initiative</title>
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" />
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <link rel="stylesheet" href="/styles/horizontal.css">
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
        rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN"
        crossorigin="anonymous">
    <script src="../js/vendor/modernizr.js"></script>
    <!-- #include virtual="/includes/header.html" -->
    <style>
        #cover{
            background:white;
            position: absolute;
            height:100%;
            width:100%;
            top:0;
            left:0;
            right:0;
            bottom:0;
        }
    </style>
    <div id="cover"></div>
    <script>
        window.location.href = "../resources/index.aspx";
    </script>
    <form id="resources_filteredForm" runat="server">
    <div id="maincontentarea" class="fullwidth">
        <div id="breadcrumbs">
            <a href="../index.aspx">Home</a> &raquo; <a href="index.aspx">Tools and Resources</a>
            &raquo; <span id="lastcrumb">
                <asp:Literal ID="LitLastBreadcrumb" runat="server" /></span></div>
        <h1>
            Tools and Resources</h1>
        <h2>
            Featured Tools and Resources</h2>
        <div class="wrap">
            <button class="slidenav prev">
                <i class="fa fa-angle-left"></i>
            </button>
            <button class="slidenav next">
                <i class="fa fa-angle-right"></i>
            </button>
            <div class="newresourceframe" id="centered">
                <ul class="clearfix">
                   <asp:PlaceHolder ID ="PHfeaturedresources" runat="server"></asp:PlaceHolder>
                </ul>
            </div>
            <div class="scrollbar">
                <div class="handle">
                    <div class="mousearea">
                    </div>
                </div>
            </div>
            <%--<div class="controls center">
				<button class="btn prev"><i class="icon-chevron-left"></i> prev</button>
				<button class="btn next">next <i class="icon-chevron-right"></i></button>
			</div>--%>
        </div>
        <%--<div class="recentListquad">--%>
        </ul>
        <%--</div>--%>
        <%--    <asp:Repeater ID="Results1" runat="server">
    <itemTemplate>
<dl><dt><a href='resource_details.aspx?r=<%# Eval("id") %>'><img src='<%# Eval("imgURL") %>'></a></dt><dd><%# Eval("year")%> &bull;&nbsp;<%# Eval("linktext") %></dd></dl>
</itemTemplate>

    </asp:Repeater>--%>
        <%--</div>--%>
        <div class="thirtythreefloatleft">
            <h3 style="margin-top: 30px; margin-bottom: 0px; padding-bottom: 0px; color: white;
                background: #2F335F; clear: both;">
                <img src="/images/smicons/findresourcesq.png" style="width: 50px !important; vertical-align: middle;
                    margin-right: 10px;" />Explore by Topic</h3>
            <ul>
                <asp:repeater id="topicRepeater" runat="server">
                    <itemtemplate>
          <li><a href='resources_filtered.aspx?t=<%# DataBinder.Eval(Container.DataItem, "topicid") %>'><%# DataBinder.Eval(Container.DataItem, "topic") %></a></li>
          
          
   

       </itemtemplate>
                </asp:repeater>
            </ul>
        </div>
        <div class="thirtythreefloatleft">
            <!-- start parent repeater -->
            <h3 style="margin-top: 30px; margin-bottom: 0px; padding-bottom: 0px; color: white;
                background: #2F335F; clear: both;">
                <img src="/images/smicons/findresourcesq.png" style="width: 50px !important; vertical-align: middle;
                    margin-right: 10px;" />Explore by Sector</h3>
            <ul>
                <asp:repeater id="sectorRepeater" runat="server" onitemDataBound="sectorItemDataBound">
                    <itemtemplate>
          <asp:Literal ID="litSector" runat="server"></asp:Literal>
          
          
   

       </itemtemplate>
                </asp:repeater>
            </ul>
            <!-- end parent repeater -->
        </div>
        <div class="thirtythreefloatleft">
            <!-- start parent repeater -->
            <h3 style="margin-top: 30px; margin-bottom: 0px; padding-bottom: 0px; color: white;
                background: #2F335F; clear: both;">
                <img src="/images/smicons/findresourcesq.png" style="width: 50px !important; vertical-align: middle;
                    margin-right: 10px;" />Explore by Country</h3>
            <ul>
                <asp:repeater id="countryRepeater" runat="server" onitemDataBound="countryItemDataBound">
                    <itemtemplate>
          <asp:Literal ID="litCountry" runat="server"></asp:Literal>
          
          
   

       </itemtemplate>
                </asp:repeater>
            </ul>
            <!-- end parent repeater -->
        </div>
        <asp:Button runat="server" Text="Browse" PostBackUrl="/tools-resources/resources_filtered.aspx" />
    </div>
    <!-- #include virtual="../includes/footer_scripts.aspx" -->
    <%--</div><!---end container--->--%>
    <!-- Scripts -->
    <script src="/scripts/sly/sly.min.js"></script>
    <script src="/scripts/sly/horizontal.js"></script>
    </body>
    </form>
</html>
