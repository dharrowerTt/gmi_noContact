<%@ Page Language="VB" AutoEventWireup="false" Inherits="M2M_Redesign.events_index" Codebehind="index.aspx.vb" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Events | Global Methane Initiative</title>
     <!-- #include virtual="/includes/include_head.html" -->
    <style>.detailspara {
            max-height:100px; overflow:hidden;margin-bottom:10px;
			-webkit-mask-image: linear-gradient(to bottom, black 50%, transparent 100%);
    mask-image: linear-gradient(to bottom, black 50%, transparent 100%);
        }
.detailspar p:after {
content: "\f067";


}


    </style>
</head>
<body>
    <!-- #include virtual="/includes/header.html" -->
    <form id="events_index_form" runat="server">
    <div>
	<!-- Page Content -->
    <section class="py-5 gmi-light-blue">
        <div class="container">
            <h1>Events</h1>
			<div class="row py-3">
				<div class="col-sm-8">
					<p>GMI sponsors and participates in events throughout the year. As a benefit to our partners and stakeholders, this page also highlights events that are not directly affiliated with GMI.</p>
					<p>View a list of upcoming events below, followed by a list of past events. Click on an event to view more details and access meeting materials and proceedings.</p>
					<p><strong>Want to list something here?</strong><br>
					Use the <a href="/contact-us/index.aspx">Contact Us</a> form to request that an event be listed on this page.</p>
				</div>
				<div class="col-sm-4">
					<div class="border border-secondary bg-white px-0">
                            <div class="py-1 text-center bg-dark text-white"><strong>Event Links</strong></div>
                            <ul class="list-group py-2">
                                <li class="list-group-item noborder nobackground py-1"><a href="#upcoming">Upcoming Events</a></li>
                                <li class="list-group-item noborder nobackground py-1"><a href="#recent">Recent Events</a></li>
                                <li class="list-group-item noborder nobackground py-1"><a href="past_events.aspx">All Past Events</a></li>
								<li class="list-group-item noborder nobackground py-1"><a href="http://eepurl.com/ggwT3T">Join the GMI mailing list</a></li>
                            </ul>
                        </div>
				</div>
			</div>
		</div>
	</section>
	<section class="py-5 bg-white">
		<div class="container">
			<h2 id="upcoming">Upcoming Events</h2>
				  	<asp:PlaceHolder ID="phUpcomingEvents" runat="server"></asp:PlaceHolder>
           

			
			
		</div>
	</section>
	<section class="py-5">
		<div class="container">
			<h2 id="recent">Recent Events</h2>


				<asp:PlaceHolder ID="phRecentEvents" runat="server"></asp:PlaceHolder>

             <a href = 'past_events.aspx' class='btn btn-outline-primary' runat="server" onclick="reload_click">View All Past Events</a>

           
		</div>
	</section>
        <section class="py-5" runat="server" visible="false" id="draftevents">
		<div class="container">
			<h2>Draft Events</h2>
            <table id='draftevents' class='table hover'><thead>
               <tr><th>Event Image</th><th>Name</th><th>Date</th><th>Location</th><th>Sector</th><th>Link</th></tr>
</thead>
				<asp:PlaceHolder ID="phDraftEvents" runat="server"></asp:PlaceHolder>
                </table>
           
		</div>
	</section>
	</form>
	<!-- #include virtual="/includes/footer_scripts.aspx" -->
</body>

</html>
