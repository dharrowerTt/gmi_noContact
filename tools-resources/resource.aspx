<%@ Page Language="VB" AutoEventWireup="false"  %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Resource | Details | Global Methane Initiative</title>
    <meta http-equiv="Refresh" content="3;url=../resources/detail.aspx?r=<%# Eval("objid")%>">
     <!-- #include virtual="/includes/include_head.html" -->
</head>
<body>
    <!-- #include virtual="/includes/header.html" -->
    <form id="redirect_form" runat="server">
    <div>

    
	<!-- Page Content -->
    <section class="py-5 gmi-light-blue">
        <div class="container">
			<div class="row">
				<div class="col-sm-12">
                    <h1>
                        Simple Redirect Page Template
                    </h1>
                    <p>This page has moved. The new URL is: <a href="/resources/detail.aspx?r=<%# Eval("objid")%>">www.globalmethane.org/resources/detail.aspx?r=<%# Eval("objid")%></a></p>
                    <p>You will be redirected to the new address shortly. If you are not redirected, please click on the link above!</p>
				</div>
			</div>
		</div>
	</section>



	



       <!-- #include virtual="/includes/footer.html" -->

	
	
	
	
</body>

</html>