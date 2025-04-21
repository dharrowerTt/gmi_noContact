<%@ Page Language="vb" CodeBehind="projects.aspx.vb" MaintainScrollPositionOnPostback="true" AutoEventWireup="false" Inherits="M2M_Redesign.ProjectsIndex" %>

<% @ Import Namespace="System.IO" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
    <head>
        <title>Projects | Global Methane Initiative</title>
        <meta http-equiv="Refresh" content="3;url=../activities/oilandgasarchive.aspx">
        <!-- #include virtual="../includes/header.aspx" -->
  
        <div id="maincontentarea" class="fullwidth">
        	<div id="breadcrumbs"><a href="../index.aspx">Home</a> &raquo; <span id="lastcrumb">Projects</span></div>
        	
            	<h1>Projects</h1>
<%--                
                <p>Partners and Project Network members seeking technical support, financial support or consultation are invited to add project ideas and activities to this database. Before submitting ideas we encourage you to browse information on each sector to better understand the goals and priorities of the Initiative.</p>
                <a href="submit.aspx" id="submitaproject">Submit a Project</a>
                <ul>
                	<li><a href="index.aspx?expo=newdelhi">2010 New Delhi Expo Projects</a></li>
                	<li><a href="index.aspx?expo=beijing">2007 Beijing Expo Projects</a></li>
                </ul>
--%>                    
           
          <div id="projectstable" visible="false">
           	<form id="Form1" method="post" runat="server" visible="false">
           		  <p>Filter by
           			<asp:DropDownList id="ddlSector" width="150" runat="server">
						<asp:ListItem Value="">Sector</asp:ListItem>
						<asp:ListItem Value="agri">Agriculture</asp:ListItem>
						<asp:ListItem Value="coal">Coal Mine</asp:ListItem>
						<asp:ListItem Value="landfill">Municipal Solid Waste</asp:ListItem>
						<asp:ListItem Value="oilngas">Oil and Gas</asp:ListItem>
						<asp:ListItem Value="steering">Steering</asp:ListItem>
                        <asp:ListItem Value="msw">MSW</asp:ListItem>
					</asp:DropDownList>
           		             		   
           			<asp:DropDownList id="ddlGeoFocus" width="150" runat="server">
					</asp:DropDownList>

           			<asp:DropDownList id="ddlStage" width="150" runat="server">
						<asp:ListItem Value="">Project Stage</asp:ListItem>
						<asp:ListItem Value="idea">Idea</asp:ListItem>
						<asp:ListItem Value="planned">Planned</asp:ListItem>
						<asp:ListItem Value="ongoing">Ongoing</asp:ListItem>
						<asp:ListItem Value="completed">Completed</asp:ListItem>
						<asp:ListItem Value="unknown">Unknown</asp:ListItem>
					</asp:DropDownList>

<%--           		
                    <asp:DropDownList id="ddlExpo" width="150" runat="server">
						<asp:ListItem Value="">Select Expo Type</asp:ListItem>
						<asp:ListItem Value="newdelhi">New Delhi</asp:ListItem>
						<asp:ListItem Value="beijing">Beijing</asp:ListItem>
					</asp:DropDownList>
--%>                
                    <span style="padding:0px 0px 0px 20px" ></span>
                    <asp:ImageButton ID="goButton" Runat="server" ImageUrl="/images/go.gif" alt="Go"></asp:ImageButton></p>
              </form>
              <table id="projectstable2" visible="false">
             
                  <tbody>
                  <asp:Literal ID="litProjects" runat="server" Visible="false"></asp:Literal>
                  </tbody>
            </table>
            </div><!--end projectstable div-->
            <p>This page has moved. The new URL is: <a href="/activities/oilandgasarchive.aspx">www.globalmethane.org/activities/oilandgasarchive.aspx</a></p>
        <p>You will be redirected to the new address shortly. If you are not redirected, please click on the link above!</p>
      	</div><!--end maincontentarea div-->
       

<!-- #include virtual="../includes/footer.aspx" -->
    
	</body>
</html>
