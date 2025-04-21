<%@ Page Language="vb" ContentType="text/html" ResponseEncoding="UTF-8" CodeBehind="partnerProfile.aspx.vb" AutoEventWireup="false" Inherits="M2M_Redesign.partnerProfile" %>

<% @ Import Namespace="System.IO" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
    <head>
        <title> | Global Methane Initiative</title>
        <!-- #include virtual="../includes/header.aspx" -->
    
        <div id="maincontentarea">
		<div id="breadcrumbs"><a href="../index.aspx">Home</a> &raquo; <a href="index.aspx">PARTNER COUNTRIES</a> &raquo; <span id="lastcrumb">PROJECT Detail</span></div>
        	<div id="projnetdetail">
          			<h1><asp:Literal ID="name" runat="server"></asp:Literal></h1>
                    <asp:Literal ID="LitList" runat="server" Visible="false"></asp:Literal>
                        <dl>
                        	<dt class="firstdlitem">Type of Organization</dt>
                            	<dd class="firstdlitem"><asp:Literal ID="tocPublic"  runat="server"></asp:Literal></dd>
                            <dt>Description of Services</dt>
                            	<dd><p><asp:Literal ID="expertise" runat="server"></asp:Literal></p></dd>
                            <dt>Area of Interest</dt>
                            	<dd><asp:Literal ID="AOI" runat="server"></asp:Literal></dd>
                            <dt>Web Site</dt>
                            	<dd><p><asp:Literal ID="website" runat="server"></asp:Literal></p></dd>
                            <dt>Contacts</dt>
                            	<dd>
                                <asp:Literal ID="lblContacts" runat="server"></asp:Literal>
                                <p><em>To add a new contact, go to the <a href="#">join page</a> and add a contact for your organization.</em></p></dd>
                        </dl><br class="clear" />
                        <p id="shareyourstory"><a href="#">SHARE your success story</a></p>
           		</div><!--end projnetdetail div-->
      	</div><!--end maincontentarea div-->
        <div id="rightcontentarea">

        </div><!--end rightcontentarea div-->
        
<!-- #include virtual="../includes/footer.aspx" -->
</body>
</html>    	
