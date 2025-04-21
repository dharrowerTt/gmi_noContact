<%@ Page CodeBehind="login.aspx.vb" Language="vb" AutoEventWireup="false" Inherits="M2M_Redesign.login" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
    <head>
        <title>Admin | Event List</title>
        <!-- #include virtual="../includes/header.aspx" -->
    </head>
	<body>
	<ul class="hide">
		<li><a href="#maincontentarea" title="Skip Navigation (AccessKey+1)" accesskey="1">Skip Navigation</a></li>
	</ul>
    
        
        <div id="maincontentarea">
        <div id="breadcrumbs"><a href="../index.aspx">Home</a> &raquo; <span id="breadcrumbs"><a href="index.aspx">Administration Module</a></span> &raquo; <span id="lastcrumb">Login</span> </div>
        <form id="loginform" runat="server">
<h1>Login</h1>
<table>
<tr>
<td><h3>
												<label for="User id">User ID</label></h3>
										</td>
										<td colspan="3">
											<asp:TextBox id="userID" runat="server" tabIndex="1" width="100px" MaxLength="12"></asp:TextBox>
										</td>
									</tr>
									<tr align="left">
										<td align="right"><div align="left">
												<h3><label for="Password">Password</label></h3>
											</div>
										</td>
										<td colspan="3">
											<asp:TextBox id="userPwd" runat="server" TextMode="Password" tabIndex="2" width="100px" MaxLength="12"></asp:TextBox>
										</td>
									</tr>
								</table>
								<p>&nbsp;</p>
								<p>
									<!--<a href="index.htm"><img src="images/submit2.gif" width="59" height="24" border="0"></a></p>-->
									<asp:Button id="Button1" runat="server" Text="Login" CssClass="bodybuttons" CommandName="CheckLogin" tabIndex="3"></asp:Button></p>
			</form>
            </div><!--end maincontentarea div-->
        

        
        

<!-- #include virtual="../includes/footer.aspx" -->
    	
	</body>
</html>