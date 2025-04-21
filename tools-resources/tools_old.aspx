<%@ Page Language="VB" ContentType="text/html" ResponseEncoding="utf-8" %>

<% @ Import Namespace="System.IO" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
    <head>
        <title>Tools | Global Methane Initiative</title>
        
        <style type="text/css">
             .accordion div { height:auto; }
         </style>
         
        <!-- #include virtual="../includes/header.aspx" -->

            <div id="maincontentarea">
                <div id="breadcrumbs">
                    <a href="../index.aspx">Home</a> &raquo; <a href="index.aspx">Tools &amp; Resources</a>
                    &raquo; <span id="lastcrumb">Tools</span></div>
                    <h1>
                        <img src="../images/toolsres_photo.jpg" alt="Tools and Resources" style="float: right;" />Tools</h1>
                    <%--<ul>
                            <li><a href="#one">Agriculture</a></li>
                            <li><a href="#two">Coal Mines</a></li>
                            <li><a href="#three">Municipal Solid Waste</a></li>

                            <li><a href="#four">Oil &amp; Gas</a></li>
                            <li><a href="#five">Wastewater</a></li>
                        </ul>--%>
                    <div id="TabbedPanels1" class="TabbedPanels">
                        <ul class="TabbedPanelsTabGroup">
                            <li class="TabbedPanelsTab" tabindex="0" style="margin: 0px 10px 0px 0px;">Agriculture</li>
                            <li class="TabbedPanelsTab" tabindex="0" style="margin: 0px 10px 0px 0px;">Coal</li>
                            <li class="TabbedPanelsTab" tabindex="0" style="margin: 0px 10px 0px 0px;">Municipal
                                Solid Waste</li>
                            <li class="TabbedPanelsTab" tabindex="0" style="margin: 0px 10px 0px 0px;">Oil & Gas</li>
                            <li class="TabbedPanelsTab" tabindex="0" style="margin: 0px 10px 0px 0px;">Wastewater</li>
                        </ul>
                        <div class="TabbedPanelsContentGroup">
                            <div class="TabbedPanelsContent">
                                <h2 id="agTools">
                                    Agriculture Tools</h2>
                                <asp:Literal ID="AgTools" runat="server"></asp:Literal>
                            </div>
                            <div class="TabbedPanelsContent">
                                <h2 id="coalTools">
                                    Coal Tools</h2>
                                <asp:Literal ID="CoalTools" runat="server"></asp:Literal>
                            </div>
                            <div class="TabbedPanelsContent">
                                <h2 id="mswTools">
                                    Municipal Solid Waste Tools</h2>
                                <asp:Literal ID="MSWTools" runat="server"></asp:Literal>
                            </div>
                            <div class="TabbedPanelsContent">
                                <h2 id="oilngasTools">
                                    Oil and Gas Tools</h2>
                                <asp:Literal ID="oilngasTools" runat="server"></asp:Literal>
                            </div>
                            <div class="TabbedPanelsContent">
                                <h2 id="wwTools">
                                    Wastewater Tools</h2>
                                <asp:Literal ID="wwTools" runat="server"></asp:Literal>
                            </div>
                        </div>
                    </div>
                    <p class="top">
                        <a href="#container">Top of page</a></p>
                <!--end toolsresleft div-->
                <!--<div id="toolsresright">
                
                <div id="recentaddedtools">
                	<h3>Recently Added Tools &amp; Resources</h3>
                        <ul>
                        	<li>Lorem ipsum dolor sit amet, consectet uer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolor e magna aliquam erat volutpat.<br />
                            <a href="#" class="moreinfo">[More Info]</a></li>
                        </ul>
                </div>-->
                <!--end recentaddedtools div-->
                <!--<div id="recentaddedtoolsbottom"></div>-->
                <!--</div>end toolsresright div-->
            </div>
            <!--end maincontentarea div-->
            <div id="rightcontentarea">
                
            </div>
            <!--end rightcontentarea div-->
            
            <!-- #include virtual="../includes/footer.aspx" -->
       
    </body>
</html>
