<%@ Page Language="vb" AutoEventWireup="false" Codebehind="index_old.aspx.vb" Inherits="M2MTracking.sector_steer_details" %>

<% @ Import Namespace="System.IO" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
    <head>
        <title>Steering | Global Methane Initiative</title>
        <!-- #include virtual="../includes/header.aspx" -->
    </head>
	<body>
	<ul class="hide">
		<li><a href="#maincontentarea" title="Skip Navigation (AccessKey+1)" accesskey="1">Skip Navigation</a></li>
	</ul>
    <div id="container">
        <!-- #include virtual="../includes/mainnav.aspx" -->
        <div id="maincontentarea">
        	<div id="sectorsteerimage" class="sectorimage">
                <h1>Steering</h1>
                    <!--<div id="bkgdopacity">
                    <p>The primary sources of methane emissions from agriculture are livestock enteric fermentation, livestock waste management, rice cultivation, and agricultural waste burning. Of these, livestock waste management offers the most viable, near-term opportunities for methane recovery and utilization.</p>
                    </div>end bkgdopacity div-->
            </div><!--end sectoragimage div-->
          <div id="sectorleft">
                <ul id="sectorbuttons">
                    <li id="sectorcommitteemembers"><a href="../partners/countryCommittees.aspx?sector=steer">Committee Members</a></li>
                    <li id="sectorfactsheets"><a href="../tools-resources/factsheets.aspx">Fact Sheets</a></li>
                    <li id="sectortools"><a href="../tools-resources/tools.aspx">Tools</a></li>
                </ul>
                <!--<h2>Country Action Plans</h2>
                <ul class="sectorcountrylist">
                	<li><a href="#">Argentina</a></li>
                    <li><a href="#">Australia</a></li>
                    <li><a href="#">Brazil</a></li>
                    <li><a href="#">Canada</a></li>
                    <li><a href="#">China</a></li>
                    <li><a href="#">India</a></li>
                </ul>
                <ul class="sectorcountrylist">
                    <li><a href="#">Italy</a></li>
                    <li><a href="#">Japan</a></li>
                    <li><a href="#">Mexico</a></li>
                    <li><a href="#">Poland</a></li>
                    <li><a href="#">United Kingdom</a></li>
                    <li><a href="#">United States</a></li>
                </ul><br class="clear" />-->
                <h2>Global Methane Initiative Steering Events</h2>
                	<asp:Placeholder id="ph1" runat="server">						
					</asp:Placeholder>
            	<!--<ul id="sectorevents">
                	<li><span class="date">22 April, 2008</span><br />
                    <a href="#">Subcommittee Meeting</a><br />
                    <strong>Morelia, M&eacute;xico</strong></li>
                    <li><span class="date">17 May, 2007</span><br />
                    <a href="#">Subcommittee Meeting</a><br />
                    <strong>Buenos Aires, Argentina</strong></li>
                    <li><span class="date">22 April, 2008</span><br />
                    <a href="#">Subcommittee Meeting</a><br />
                    <strong>Morelia, M&eacute;xico</strong></li>
                    <li><span class="date">22 April, 2008</span><br />
                    <a href="#">Subcommittee Meeting</a><br />
                    <strong>Morelia, M&eacute;xico</strong></li>
              </ul>-->
              <a href="../news-events/event_yearlistview.aspx?year=&sector=steer" id="moresteerevents">More Steering Events</a>
            </div><!--end sectorleft div-->
            <div id="sectorright">

<video controls poster="../images/mmm_video_climatechange_med.jpg" width="330" height="190" controls="controls">
<source src="../documents/Module01_FNL_wSubtitles.mp4" type="video/mp4" />
<a href="tools-resources/video_climate_change.aspx"><img width="330" height="190" src="../images/mmm_video_climatechange_med.jpg" alt="The role of methane in climate change" title="The role of methane in climate change" /></a>
</video>
<p>This Methane Mitigation Matters video explains the role of methane in climate change. <a href="../resources/video.aspx">View more videos &raquo;</a></p>


            <ul id="rightlist">
                        <li><a href="../tools-resources/steering_techproceeds.aspx">Technical Presentations from Global Methane Initiative Events</a></li>
                        <!--<li><a href="../tools-resources/steering_addresources.aspx">Additional Resources</a></li>-->
                    </ul>

				<br class="clear" />
                <div id="milistsectorbox">
                	<h4><a target="_blank" href="http://globalmethane.wordpress.com"><img src="../images/thumb_GMIblog_clear.png" title="GMI blog" style="width:32px;margin-right:5px;float:left;" /></a>Methane International</h4>
                    <ul>
                    	<li><a target="_blank" href="http://globalmethane.wordpress.com">View the current blog</a> for timely and topical information related to methane mitigation</li>
                        <li><a target="_blank" href="https://globalmethane.wordpress.com/mi-article-submission/">Submit an article or news to share</a></li>
                    </ul>
                    <p>&nbsp;&nbsp;&nbsp;<strong><em>Past Articles</em></strong></p>
                    <ul>
                        <li><a href="../news-events/mi33.aspx#five">News from the Climate and Clean Air Coalition (February 2014)</a></li>
                        <li><a href="../news-events/mi32.aspx#four">Subcommittee Updates (September 2013)</a></li>
                        <li><a href="../news-events/mi32.aspx#one">Thank You GMI Steering Chair Gina McCarthy! Welcome New Steering Chair Janet McCabe! (September 2013)</a></li>
                        <li><a href="../news-events/mi31.aspx#two">Committee Updates (May 2013)</a></li>
                        <li><a href="../news-events/mi30.aspx#one">See You at Methane Expo 2013! (March 2013)</a></li>
                        <li><a href="../news-events/mi29.aspx#one">Register Now for Methane Expo 2013 (November 2012)</a></li>
                        <li><a href="../news-events/mi28.aspx#four">CCAC on a Fast Track (June 2012)</a></li>
                        <li><a href="../news-events/mi28.aspx#one">Methane Expo 2013: Call for Abstracts (June 2012)</a></li>
                        <li><a href="../news-events/mi27.aspx#eight">Recent Developments and Resources (February 2012)</a></li>
                        <li><a href="../news-events/mi27.aspx#five">GMI Holds Side Event at COP17 (February 2012)</a></li>
                        <li><a href="../news-events/mi27.aspx#two">2013 Expo Planning Underway! (February 2012)</a></li>
                        <li><a href="../news-events/mi26.aspx#four">GMI Outreach (November 2011)</a></li>
                        <li><a href="../news-events/mi26.aspx#one">Partnership-Wide Meeting a Success! (November 2011)</a></li>
                        <li><a href="../news-events/mi25.aspx#eight">Upcoming Outreach Activities (August 2011)</a></li>
                        <li><a href="../news-events/mi25.aspx#one">See You in Krakow! (August 2011)</a></li>
                        <li><a href="../news-events/mi24.aspx#eight">Recent Developments and Resources (June 2011)</a></li>
                        <li><a href="../news-events/mi24.aspx#four">Moving Forward with GMI Partner Action Plans (June 2011)</a></li>
                        <li><a href="../news-events/mi24.aspx#seven">Upcoming Outreach Activities (June 2011)</a></li>
                        <li><a href="../news-events/mi24.aspx#six">GMI Outreach (June 2011)</a></li>
                        <li><a href="../news-events/mi23.aspx#eight">GMI Hosts LFG Workshop in Serbia (April 2011)</a></li>
                        <li><a href="../news-events/mi23.aspx#eleven">Upcoming Outreach Activities (April 2011)</a></li>
                        <li><a href="../news-events/mi23.aspx#one">Administrative Support Group Welcomes Monica Shimamura (April 2011)</a></li>
                        <li><a href="../news-events/mi23.aspx#six">GMI Hits the Skies (April 2011)</a></li>
                        <li><a href="../news-events/mi23.aspx#three">Upcoming Subcommittee Meetings (April 2011)</a></li>
                        <li><a href="../news-events/mi22.aspx#five">16th Conference of the Parties Convenes in Mexico (January 2011)</a></li>
                        <li><a href="../news-events/mi22.aspx#four">Organizations are in the Spotlight (January 2011)</a></li>
                        <li><a href="../news-events/mi22.aspx#one">A New Look for the Global Methane Initiative (January 2011)</a></li>
                        <li><a href="../news-events/mi21.aspx#five">Reminder: Upcoming Methane to Markets Subcommittee Meetings (October 2010)</a></li>
                        <li><a href="../news-events/mi21.aspx#three">Project Network Membership Continues to Grow (October 2010)</a></li>
                        <li><a href="../news-events/mi21.aspx#two">Steering Committee Welcomes New Partner Countries and Approves Terms of Reference (October 2010)</a></li>
                        <li><a href="../news-events/mi20.aspx#one">Save the Date for the Next Ministerial Meeting (August 2010)</a></li>
                        <li><a href="../news-events/mi20.aspx#six">Upcoming Methane to Markets Subcommittee Meetings (August 2010)</a></li>
                        <li><a href="../news-events/mi19.aspx#four">Recent Developments (May 2010)</a></li>
                        <li><a href="../news-events/mi18.aspx#one">Methane to Markets Partnership Expo a Great Success! (April 2010)</a></li>
                        <li><a href="../news-events/mi18.aspx#two">New Directions for the Partnership (April 2010)</a></li>
                        <li><a href="../news-events/mi17.aspx#four">Achievements Reported in First Partnership Accomplishments Report (February 2010)</a></li>
                        <li><a href="../news-events/mi17.aspx#one">Important Late-Breaking Expo Developments (February 2010)</a></li>
                        <li><a href="../news-events/mi16.aspx#one">What is the Expo? (January 2010)</a></li>
                        <li><a href="../news-events/mi16.aspx#two">2010 Methane to Markets Partnership Expo Agenda Now Online (January 2010)</a></li>
                        <li><a href="../news-events/mi15.aspx#nine">Partnership Accomplishments Report Forthcoming! (November 2009)</a></li>
                        <li><a href="../news-events/mi15.aspx#one">Sooner Than You Think...Register Now for the 2010 Partnership Expo (November 2009)</a></li>
                        <li><a href="../news-events/mi15.aspx#seven">Methane to Markets Redesigns Web Site (November 2009)</a></li>
                        <li><a href="../news-events/mi15.aspx#six">Climate Action Releases Coal Mine Methane Protocol (November 2009)</a></li>
                        <li><a href="../news-events/mi15.aspx#ten">Countdown to COP 15&mdash;Help Methane to Markets Have a Presence! (November 2009)</a></li>
                        <li><a href="../news-events/mi15.aspx#two">New Chair and Partners Tackle Partnership Matters in Washington, D.C. (November 2009)</a></li>
                        <li><a href="../news-events/mi14.aspx#eight">News and Announcements (August 2009)</a></li>
                        <li><a href="../news-events/mi14.aspx#one">Registration for the 2010 Partnership Expo in India to Open Soon (August 2009)</a></li>
                        <li><a href="../news-events/mi14.aspx#seven">Methane to Markets at Copenhagen for COP15 (August 2009)</a></li>
                        <li><a href="../news-events/mi14.aspx#two">Welcome Gina McCarthy, New Steering Committee Chair (August 2009)</a></li>
                        <li><a href="../news-events/mi13.aspx#one">Dates Set for 2010 Partnership Expo in India (June 2009)</a></li>
                        <li><a href="../news-events/mi13.aspx#seven">Coming Soon: The First Partnership-Wide Accomplishments Report (June 2009)</a></li>
                        <li><a href="../news-events/mi13.aspx#six">Get in the Spotlight! (June 2009)</a></li>
                        <li><a href="../news-events/mi13.aspx#three">Steering Committee Meeting to Discuss Future of Methane to Markets (June 2009)</a></li>
                        <li><a href="../news-events/mi13.aspx#two">New, Redesigned Web Site Is On Its Way (June 2009)</a></li>
                    </ul>
                </div>
            	<!--<div id="sectorhighlights">
                	<h3>Highlights</h3>
                    <ul>
                    	<li>Save the Date: <a href="#">WasteTech 2009</a> 26 - 27 May 2009</li>
                    </ul>
                    <div id="sectorhighlightsbottom"></div>
                </div>--><!--end sectorhighlights div-->
            </div><!--end sectorright div-->
      	</div><!--end maincontentarea div-->
        <div id="sidebar">
<!-- #include virtual="../includes/sidenav.aspx" -->
        </div><!--end sidebar div--><br class="clear" />
        

<!-- #include virtual="../includes/footer.aspx" -->
    	</div><!--end container div-->
	</body>
</html>
