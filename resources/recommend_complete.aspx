<%@ Page Language="vb" ContentType="text/html" ResponseEncoding="UTF-8" CodeBehind="recommend_complete.aspx.vb" AutoEventWireup="false" Inherits="M2M_Redesign.recommend_complete" %>

<% @ Import Namespace="System.IO" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
    <head>
        <title>Recommend a Resource | Global Methane Initiative</title>
     <!-- #include virtual="/includes/include_head.html" -->
</head>
<body>
    <!-- #include virtual="/includes/header.html" -->

	    <form id="form1" runat="server">
	 <section class="py-5 gmi-light-blue">
        <div class="container">
            <div class="row">
                
                <div class="col-sm-8">
                    <p><a href="index.aspx">
                        <small class="text-muted text">
                            <i class="fa fa-arrow-left" aria-hidden="true"></i> 
                            Resources
                        </small>
                        </a></p>
                    <h3>Recommend a Resource</h3>
                    <h1>Success!</h1>
     </div>
                </div>
            </div>
    </section>

	<section class="py-5 bg-white">
		<div class="container">
        
      

<asp:Panel ID="divsuccess" runat="server" Visible="true">
 
<p>Your recommendation has been received. A member of the GMI team will respond to your submission as soon as possible. </p>
        </asp:Panel>

      	
        <asp:Panel ID="diverror" runat="server" Visible="false">
        <h2>A problem occurred</h2>
<p>Thank you for your request. Unfortuately, a problem occurred while saving your information. An administrator has been notified about the issue.
For immediate assistance, please email             
<a href="mailto:secretariat@globalmethane.org&subject=Contact Us">secretariat@globalmethane.org</a> with questions or concerns.</p>


        </asp:Panel>
        </div>
    	
	    
       
        </form>
    			<!-- #include virtual="/includes/footer_scripts.aspx" -->
	</body>
</html>
