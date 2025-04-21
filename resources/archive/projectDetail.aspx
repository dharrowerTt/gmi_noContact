<%@ Page Language="vb" ContentType="text/html" ResponseEncoding="UTF-8" CodeBehind="projectDetail.aspx.vb" AutoEventWireup="false" Inherits="M2M_Redesign.projectsProjectDetail" %>
<% @ Import Namespace="System.IO" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
    <head>
        <title>Project Detail | Global Methane Initiative</title>
        <!-- #include virtual="/includes/header.aspx" -->
    
        <div id="maincontentarea">
        	<div id="breadcrumbs"><a href="/index.aspx">Home</a> &raquo; <a href="index.aspx">Projects</a> &raquo; <span id="lastcrumb"><asp:Literal ID="litBreadcrumb" runat="server"></asp:Literal> Project Detail</span></div>
        	
    <h2><asp:Literal ID="litProjName" runat="server"></asp:Literal></h2>
    <asp:Literal id="litErrorInfo" runat="server"></asp:Literal>
            
        <div id="projnetdetail" >
                	<dl>
                    	<dt class="firstdlitem">Stage</dt>
                        <dd class="firstdlitem"><asp:Literal ID="litStage" runat="server"></asp:Literal></dd>
                            <dt>Sector</dt>
                            	<dd><asp:Literal ID="lblSector" runat="server"></asp:Literal></dd>
                            <dt>Geographical Focus</dt>
                            	<dd><asp:Literal ID="geoFocus" runat="server"></asp:Literal><br />
                                <asp:Literal ID="locationDetail" runat="server"></asp:Literal></dd>
                            <dt>Location</dt>
                            	<dd><asp:Literal ID="litLocation" runat="server"></asp:Literal></dd>
                            <dt>Description of Project</dt>
                            	<dd><asp:Literal ID="Description" runat="server"></asp:Literal></dd>
                            <dt>Partner Countries included in or proposing this activity</dt>
                            	<dd><asp:Literal ID="lblPCo" runat="server"></asp:Literal></dd>
                            <dt>Instrumental Organizations</dt>
                            	<dd><asp:Literal ID="instrumentalOrgs" runat="server"></asp:Literal></dd>
                            	
                           <dt>Estimated lifetime of the project (years):</dt>
                            	<dd><asp:Literal ID="ghgYears" runat="server"></asp:Literal></dd>
                           
                            <dt>Emissions reductions:<br />
                            (MTCO2E)</dt>
                            	<dd><asp:Literal ID="ghgasreduction" runat="server"></asp:Literal>
                            	<asp:Literal ID="ghgFor" runat="server"></asp:Literal>
                            	</dd>
                            	
                            	
                            	
                            <dt>Results and Outcomes</dt>
                            	<dd><asp:Literal ID="litResults" runat="server"></asp:Literal></dd>
                            <dt>Additional Documentation</dt>
                            	<dd><asp:PlaceHolder runat="server" ID="phAttachments"></asp:PlaceHolder></dd>
                            <dt>Primary contact for this project or activity</dt>
                            	<dd><asp:Literal ID="lblPC" runat="server"></asp:Literal></dd>
                            <dt>Financial And In-Kind Support (U.S.&nbsp;$)</dt>
                            	<dd><asp:Literal ID="lblFIK" runat="server"></asp:Literal></dd>
                            <dt>Comments</dt>
                            	<dd><asp:Literal ID="Comments" runat="server"></asp:Literal></dd>
                            <dt>Expo</dt>
                            	<dd><asp:Literal ID="litExpo" runat="server"></asp:Literal></dd>
                        </dl><br class="clear" />
                        </div>
                    </div><!--end maincontentarea div-->
        <div id="rightcontentarea">

        </div><!--end rightcontentarea div-->
        
<!-- #include virtual="../includes/footer.aspx" -->
    	
	</body>
</html>
