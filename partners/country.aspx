<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="country.aspx.vb" Inherits="globalmethane2020.country" %>

<%@ Import Namespace="System.IO" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>
        <asp:Literal ID="LitPageTitle" runat="server"></asp:Literal>
        | Global Methane Initiative</title>
    <!-- #include virtual="/includes/include_head.html" -->
     <meta http-equiv="Refresh" content="3;url=../partners/detail.aspx?c=<%# Eval("objid")%>">
     
    
   
   
      <body>
	<ul class="hide">
		<li><a href="#maincontentarea" title="Skip Navigation (AccessKey+1)" accesskey="1">Skip Navigation</a></li>
	</ul>
    <!-- #include virtual="/includes/header.html" -->
        

        <p>This page has moved. The new URL is: <a href="/partners/detail.aspx?c=<%# Eval("objid")%>"">www.globalmethane.org/partners/detail.aspx?c=<%# Eval("objid")%>"</a></p>
        <p>You will be redirected to the new address shortly. If you are not redirected, please click on the link above!</p>
</body>
</html>
        
