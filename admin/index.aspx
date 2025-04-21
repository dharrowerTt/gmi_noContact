<%@ Page CodeBehind="index.aspx.vb" Language="vb" AutoEventWireup="false" Inherits="M2M_Redesign.admin_index" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8"/>
        <title>Admin | Administration Module</title>
        <!-- #include virtual="../includes/header.aspx" -->
    </head>
	<body onload="checkCookie()">
            <div id="cover"></div>
	<ul class="hide">
		<li><a href="#maincontentarea" title="Skip Navigation (AccessKey+1)" accesskey="1">Skip Navigation</a></li>
	</ul>
    
        
        <div id="maincontentarea" style="background:white;">
        <h1>Administration Module</h1>							
        <p>Main Menu:</p>
							<ul><li>List of Events
                            <ul><li><a href="/admin/event_list.aspx?draft=true">Draft Events</a></li>
                            <li><a href="/admin/event_list.aspx?draft=false">Published Events</a></li></ul></li>
                           <%-- <li><a href="event_List_new.aspx">List of Events (New Page)</a></li>--%>
    						       <li>     <a href="event_create.aspx?mode=N">Add a New Event</a>
					            </li>
                                <li><a href="resource_List.aspx">List of Tools and Resources</a></li>
                                <li><a href="resource_create.aspx">Add a New Tool/Resource</a></li>
                                <li><a href="docReview.aspx">List of Downloaded Attachments</a></li>
                                <li><a href="lgdocReview.aspx">List of Downloaded Large Attachments</a></li>
                                </ul>
      	</div><!--end maincontentarea div-->
        

            <script type="text/javascript">


            function setCookie(cname, cvalue, exdays) {
                var d = new Date();
                d.setTime(d.getTime() + (exdays * 24 * 60 * 60 * 1000));
                var expires = "expires=" + d.toUTCString();
                document.cookie = "username" + "=" + cvalue + ";" + expires + ";path=/";
            }

        function getCookie(cname) {
            var name = cname + "=";
            var ca = document.cookie.split(';');
            for (var i = 0; i < ca.length; i++) {
                var c = ca[i];
                while (c.charAt(0) == ' ') {
                    c = c.substring(1);
                }
                if (c.indexOf(name) == 0) {
                    return c.substring(name.length, c.length);
                }
            }
            return "";
        }

        function checkCookie() {
            var user = getCookie("username");
            if (user != "") {
                document.getElementById("cover").style.display = "none";
            } else {
                window.location.href = "/gmi-admin/index.aspx";
            }
        }

        function deleteCookie() {
            document.cookie = "username=; expires=Thu, 01 Jan 1970 00:00:00 UTC; path=/;";
            window.location.href = "/gmi-admin/index.aspx";
        }


            </script>
        

    	
	</body>
</html>