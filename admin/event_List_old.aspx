<%@ Page Language="vb" AutoEventWireup="false" Codebehind="event_List_old.aspx.vb" Inherits="M2M_Redesign.event_List" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
	<head>
		<title>Admin > Event List</title>
		<link media="screen" href="admin.css" type="text/css" rel="stylesheet"/>
	</head>
    <body>	
	    <div id="topnav"><a href="#content"><img height="1" alt="skip navigation" src="images/skip-nav.gif" width="10" border="0"/></a>
            <a class="topnavstyle" href="index.aspx">Home</a><span class="lowernavstyle">•</span><a class="topnavstyle" href="login.aspx">Logout</a>
        </div>
	    <div id="container">
		    <a id="logo" href="index.aspx"></a>
		    <table cellspacing="0" cellpadding="0" border="0">
			    <tr>
				    <td>					        
				    <div id="leftsideinner">
					    <div id="admin-title" class="title-admin">Administration Module</div>
		                <form id="Form1" method="post" runat="server">								
							<h1>List of Events</h1>							
							<p>Select column name to sort.</p>								
							<asp:Placeholder id="ph1" runat="server"></asp:Placeholder>  
                        </form>
                    </div>
			        </td>
		        </tr>
	        </table>
	    </div>							
    </body>
</html>