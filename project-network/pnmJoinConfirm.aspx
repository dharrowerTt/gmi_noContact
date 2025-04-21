<%@ Page Language="vb" ContentType="text/html" ResponseEncoding="UTF-8" CodeBehind="pnmJoinConfirm.aspx.vb" AutoEventWireup="false" Inherits="M2M_Redesign.pnmJoinConfirm" %>

<% @ Import Namespace="System.IO" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
    <head>
        <title>Confirmation | Project Network | Global Methane Initiative</title>
     <!-- #include virtual="/includes/include_head.html" -->
</head>
<body>
    <!-- #include virtual="/includes/header.html" -->

	    <form id="form1" runat="server">
	 <section class="py-5 gmi-light-blue">
        <div class="container">
            <div class="row">
                <div class="col-sm-4 text-center">
					<img class="logoimg" src="/assets/images/gmipnNew.png" style="min-width:150px;max-width:250px;width:95%;margin-bottom:25px;">
				</div>
                <div class="col-sm-8">
                    <p><a href="index.aspx">
                        <small class="text-muted text">
                            <i class="fa fa-arrow-left" aria-hidden="true"></i> 
                            Project Network
                        </small>
                        </a></p>
                    <h1>Join the Partnership</h1>
     </div>
                </div>
            </div>
    </section>

	<section class="py-5 bg-white">
		<div class="container">
        
      

<asp:Panel ID="divsuccess" runat="server" Visible="true">
 <h2>Confirmation</h2>
<p>Thank you for joining GMI’s  Project Network. We look forward to your participation and your contributions to facilitating methane capture and use projects.</p>
<p>As a Project Network Member, you will receive communications about upcoming news and events, resources, and industry best practices. Visit GMI’s website to discover more about GMI, access methane-specific tools and resources, and learn how our Partner countries are addressing methane challenges.</p>
<p>We look forward to collaborating with you to achieve the goals of  the GMI. Please <a href="mailto:secretariat@globalmethane.org">contact us</a> if you have any questions or need assistance.</p>
        </asp:Panel>

      	
        <asp:Panel ID="diverror" runat="server" Visible="false">
        <h2>A problem occurred</h2>
<p>Thank you for submitting your request to join the Project Network. Unfortunately, an error occurred in saving your information. An administrator has been notified about the issue.
</p>

<p>In order to complete your request to join, please download <a href="/documents/ppnma.pdf">
                this agreement</a> (PDF, 2 pp, 268 KB) and email a  copy to 
             
<a href="mailto:secretariat@globalmethane.org&subject=Join the GMI Project Network">secretariat@globalmethane.org</a>.</p>

<p>We look forward to collaborating with you to achieve the goals of  the 
Initiative. Please do not hesitate to contact us at 
<a href="mailto:secretariat@globalmethane.org&subject=GMI Project Network">secretariat@globalmethane.org</a> if you have 
any questions regarding the Initiative.</p>
        </asp:Panel>
        </div>
    	
	    
       
        </form>
    		<!-- #include virtual="/includes/footer_scripts.aspx" -->
	</body>
</html>
