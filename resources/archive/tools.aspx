<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="tools.aspx.vb" Inherits="globalmethane2020.tools_index" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
    <title>Methane International  [Archive] | Global Methane Initiative</title>
    <style>
       
        .demoHeaders
        {
            margin-top: 2em;
        }
        #dialog-link
        {
            padding: .4em 1em .4em 20px;
            text-decoration: none;
            position: relative;
        }
        #dialog-link span.ui-icon
        {
            margin: 0 5px 0 0;
            position: absolute;
            left: .2em;
            top: 50%;
            margin-top: -8px;
        }
        #icons
        {
            margin: 0;
            padding: 0;
        }
        #icons li
        {
            margin: 2px;
            position: relative;
            padding: 4px 0;
            cursor: pointer;
            float: left;
            list-style: none;
        }
        #icons span.ui-icon
        {
            float: left;
            margin: 0 4px;
        }
        .fakewindowcontain .ui-widget-overlay
        {
            position: absolute;
        }
        select
        {
            width: 200px;
        }
    </style>
	<!-- #include virtual="/includes/header.aspx" -->
    
        <form id="form1" runat="server">
    
        <section class="py-5 gmi-light-blue">        <div class="container">    <div class="row">    <div class="col-sm-12">
            <div id="breadcrumbs">
                <a href="/index.aspx">Home</a> &raquo; <a href="/tools-resources/resources.aspx">Tools & Resources</a> &raquo; <a href="/resources/archive/index.aspx">Archive</a> &raquo; 
                &raquo; <span id="lastcrumb">Tools</span></div>
                            <!-- #include virtual="archive.htm" -->
            <h1>Tools</h1>
            <p>
                The Global Methane Initiative (GMI) provides models, methane emissions calculators,
                videos, and a variety of other tools for the sectors. Partners, subcommittee delegates,
                and Project Network members are encouraged to links to other useful resources and
                tools. Submit the resources as e-mail attachments to the Administrative Support
                Group.</p>
            <!-- Tabs -->
            <div id="tabs">
                <ul class="graytabs">
                    <li><a href="#t1">Agriculture</a></li>
                    <li><a href="#t2">Coal</a></li>
                    <li><a href="#t3">Municipal Solid Waste</a></li>
                    <li><a href="#t4">Oil & Gas</a></li>
                    <li><a href="#t5">Wastewater</a></li>
                </ul>
                <div id="t1">
                    <h2>
                        Agriculture Tools</h2>
                    <asp:Literal ID="agTools" runat="server"></asp:Literal>
                    
                </div>
                <div id="t2">
                    <h2>
                        Coal Mine Tools</h2>
                    <asp:Literal ID="coalTools" runat="server"></asp:Literal>
                    
                </div>
                <div id="t3">
                    <h2>
                        MSW Tools</h2>
                    <asp:Literal ID="mswTools" runat="server"></asp:Literal>
                    
                </div>
                <div id="t4">
                    <h2>
                        Oil & Gas Tools</h2>
                    <asp:Literal ID="oilngasTools" runat="server"></asp:Literal>
                    
                </div>
                <div id="t5">
                    <h2>
                        Wastewater Tools</h2>
                    <asp:Literal ID="wwTools" runat="server"></asp:Literal>
                    
                </div>
            </div>
            
            
        <script>

            $("#tabs").tabs();

            // Hover states on the static widgets
            $("#dialog-link, #icons li").hover(
	            function () {
	                $(this).addClass("ui-state-hover");
	            },
	            function () {
	                $(this).removeClass("ui-state-hover");
	            }
            );

	        $('.open-tab').click(function (event) {
	            var index = $("selector-of-clicked-tab").index();
	            $('#tabs').tabs("option", "active", index);
	        });
        </script>
        </div>
        <!--end maincontentarea div-->
        <div id="rightcontentarea">
            <img src="/images/toolsres_photo.jpg" alt="Tools and Resources" width=100% />
        </div>
        <!--end rightcontentarea div-->
        
        <!-- #include virtual="/includes/footer_scripts.aspx" -->
 </body>
    </form>

</html>