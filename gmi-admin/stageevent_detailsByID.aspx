<%@ Page Language="vb" AutoEventWireup="false" Codebehind="stageevent_detailsByID.aspx.vb" Inherits="M2M_Redesign.stageevent_detailsByID" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
    <head>
        <title>News &amp; Events | Global Methane Initiative</title>
		<!-- #include virtual="../includes/draftheader.aspx" -->

			<div id="maincontentarea">
				<div id="breadcrumbs"><a href="../index.aspx">Home</a> &raquo; <a href="index.aspx">Administration Module</a> &raquo; <a href="event_list.aspx">Event List</a> &raquo; <span id="lastcrumb"><asp:Literal ID="LitLastBreadcrumb" runat="server" /></span></div>
				<h1><asp:Literal ID="LitEventName" runat="server" /></h1>
					<asp:Literal ID="LitEventFeatureImage" runat="server" />
                    <asp:Literal ID="Edit" runat="server" />
                <asp:Placeholder id="ph1" runat="server"></asp:Placeholder>
					<asp:Placeholder id="phRelatedEvents" runat="server"></asp:Placeholder>
				
				
			</div> <!--end maincontentarea div-->
			<div id="rightcontentarea">
				<asp:Placeholder ID="phResources" runat="server" />
            	
               
			</div> <!--end rightcontentarea div-->
			
			<!-- #include virtual="../includes/footer.aspx" -->
		
	</body>
</html>
