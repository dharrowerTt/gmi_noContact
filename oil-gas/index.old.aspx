<%@ Page Language="vb" AutoEventWireup="false" Codebehind="index.old.aspx.vb" Inherits="M2MTracking.sector_oilngas_details" %>

<% @ Import Namespace="System.IO" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
    <head>
        <title>Oil &amp; Gas Systems | Global Methane Initiative</title>
        <!-- #include virtual="../includes/header.aspx" -->
    </head>
	<body>
	<ul class="hide">
		<li><a href="#maincontentarea" title="Skip Navigation (AccessKey+1)" accesskey="1">Skip Navigation</a></li>
	</ul>
    <div id="container">
        <!-- #include virtual="../includes/mainnav.aspx" -->
        <div id="maincontentarea">
        	<div id="sectoroilimage" class="sectorimage">
                <h1>Oil &amp; Gas Systems</h1>
                    <div id="bkgdopacity">
                    <p>Methane emissions from oil and natural gas systems are primarily the result of normal operations and system disruptions. These emissions can be cost-effectively reduced by upgrading technologies or equipment, and by improving operations. The Global Methane Initiative  facilitates cooperative mitigation activities that result in bringing more gas to markets.</p>
                    </div><!--end bkgdopacity div-->
            </div><!--end sectoragimage div-->
          <div id="sectorleft">
                <ul id="sectorbuttons">
                    <li id="sectorcommitteemembers"><a href="../partners/countryCommittees.aspx?sector=oil">Committee Members</a></li>
                    <li id="sectorfactsheets"><a href="../tools-resources/factsheets.aspx#m2moilgasfs">Fact Sheets</a></li>
                    <li id="sectortools"><a href="../tools-resources/tools.aspx#four">Tools</a></li>
                </ul>
                <h2 id="actionplans">Partner Sector Action Plans</h2>
                <ul class="sectorcountrylist">
                	<li><a href="../documents/oilgas_cap_australia.pdf">Australia</a> (PDF, 3 pp, 62 KB)</li>
                    <li><a href="../documents/oilgas_cap_canada.pdf">Canada</a> (PDF, 8 pp, 166 KB)</li>
                    <li><a href="../documents/PASh_V5_Aprobado_508.pdf">Colombia</a> (PDF, 11 pp, 532 KB)</li>
                    <li><a href="../documents/oilgas_cap_italy.pdf">Italy</a> (PDF, 17 pp, 1 MB)</li>
                    <li><a href="../documents/EC_GMI_reduction_actions.pdf#Page=14">European Commission</a> (PDF, 15 pp, 257 KB)</li>              
                </ul>
                <ul class="sectorcountrylist">
                    <li><a href="../documents/oilgas_cap_mexico.pdf">Mexico</a> (PDF, 28 pp, 1.8 MB)</li>
                    <li><a href="../documents/oilgas_cap_russia.pdf">Russia</a> (PDF, 1 pp, 75 KB)</li>
                    <li><a href="../documents/oilgas_cap_uk.pdf">United Kingdom</a> (PDF, 1 pp, 97 KB)</li>
                    <li><a href="../documents/oilgas_cap_us.pdf">United States</a> (PDF, 4 pp, 170 KB)</li>
                </ul><br class="clear" />
                <p>The GMI Steering Committee approved revised <a href="../documents/GMI_PartnerSectorActionPlansAppendix_REV_June2013.pdf">Partner Sector Action Plans – Suggested Elements</a> (PDF,  3 pp, 139 KB) in July 2013. Country representatives are encouraged to use this guidance in updating existing plans or in developing new plans. Please submit revised or new plans to the <a href="mailto:asg@globalmethane.org">Administrative Support Group</a> for inclusion on this page.</p>
            <h2>Global Methane Initiative Oil &amp; Gas Events</h2>
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
              <a href="../news-events/event_yearlistview.aspx?year=&sector=oilngas" id="moreoilngasevents">More Oil &amp; Gas Events</a>
            </div><!--end sectorleft div-->
            <div id="sectorright">
            	<!--<div id="sectorhighlights">
                	<h3>Sector Highlights</h3>
                    <ul>
                    	<li>Save the Date: <a href="#">WasteTech 2009</a> 26 - 27 May 2009</li>
                    </ul>
                    <div id="sectorhighlightsbottom"></div>
                </div>--><!--end sectorhighlights div-->

<video controls poster="../images/mmm_video_oilandgas_med.jpg" width="330" height="190" controls="controls">
<source src="../documents/OilandGas_FNL_subtitles.mp4" type="video/mp4" />
<a href="tools-resources/video_oil_and_gas.aspx"><img width="330" height="190" src="../images/mmm_video_oilandgas_med.jpg" alt="Methane mitigation matters in the oil and gas sector" title="Methane mitigation matters in the oil and gas sector" /></a>
</video>
<p>This Methane Mitigation Matters video provides an overview of the oil and gas sector. <a href="../resources/video.aspx">View more videos &raquo;</a></p>

                    <ul id="rightlist">
                        <li><a href="../documents/og-statement-of-purpose.pdf">Subcommittee Statement of Purpose</a><br />(PDF, 5 pp, 409 KB)</li>
                    	<li><a href="../documents/oilgas_action_plan_091405.pdf">Oil &amp; Gas Subcommittee Action Plan</a><br />
                    	(PDF, 4 pp, 116 KB)</li>
                        <li><a href="../project-network/pnmList.aspx?sector=oilngas">Oil &amp; Gas Project Network Members</a></li>
                        <li><a href="../activities/indexact2.aspx?sector=oilngas">Oil &amp; Gas Projects</a></li>
                        <li><a href="../tools-resources/oilngas_techproceeds.aspx">Technical Presentations from Global Methane Initiative Events</a></li>
                        <li><a href="../tools-resources/oilngas_addresources.aspx">Additional Resources</a></li>
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
                        <li><a href="../news-events/mi35.aspx#three">Subcommittee Updates (October 2014)</a></li>
                        <li><a href="../news-events/mi34.aspx#three">Subcommittee Updates (June 2014)</a></li>
                        <li><a href="../news-events/mi33.aspx#three">Subcommittee Updates (February 2014)</a></li>
                        <li><a href="../news-events/mi32.aspx#four">Subcommittee Updates (September 2013)</a></li>
                        <li><a href="../news-events/mi31.aspx#two">Committee Updates (May 2013)</a></li>
                        <li><a href="../news-events/mi30.aspx#four">Subcommittee Updates (March 2013)</a></li>
                        <li><a href="../news-events/mi29.aspx#three">Subcommittee Updates (November 2012)</a></li>
                        <li><a href="../news-events/mi28.aspx#three">Subcommittee Update (June 2012)</a></li>
                        <li><a href="../news-events/mi27.aspx#three">Subcommittee Update (February 2012)</a></li>
                        <li><a href="../news-events/mi26.aspx#one">Partnership-Wide Meeting a Success! (November 2011)</a></li>
                        <li><a href="../news-events/mi24.aspx#one">Subcommittee Updates (June 2011)</a></li>
                        <li><a href="../news-events/mi22.aspx#two">Subcommittees Met in November (January 2011)</a></li>
                        <li><a href="../news-events/mi19.aspx#four">Recent Developments (May 2010)</a></li>
                        <li><a href="../news-events/mi18.aspx#four">Sector Updates (April 2010)</a></li>
                        <li><a href="../news-events/mi15.aspx#three">Subcommittees Prepare for Expo and More (November 2009)</a></li>
                        <li><a href="../news-events/mi14.aspx#four">Subcommittee Meetings to Convene in September and October (August 2009)</a></li>
                        <li><a href="../news-events/mi13.aspx#four">Upcoming Subcommittee Meetings (June 2009)</a></li>
                    </ul>
                </div>

                <!--<div id="additionalresources">
                	<h3>Additional Resources</h3>
                    <ul>
                    	<li><a href="../documents/oilgas_canada_reduced_emiss_prog.pdf">Alberta Canada's Successful Program to Reduced Methane Emissions and Increase Conservation: Flaring and Venting Regulations Overview and Web Links</a> (PDF, 5 pp, 204 KB)</li>
                        <li>U.S. Environmental Protection Agency's <a href="http://epa.gov/gasstar/tools/index.html">Natural Gas STAR Program</a> <a href="/exitdisclaimer.aspx"><img src="../images/exit.gif" alt="Exiting Global Methane Initiative" /></a> guidance to in identifying and prioritizing cost-effective ways to reduce methane emissions from oil and natural gas operations.</li> 
                  </ul>
                  <p><a href="../tools-resources/addresources.aspx" class="moreinfo">[More Info]</a></p>
                </div>--><!--end additionalresources div-->
            </div><!--end sectorright div-->
      	</div><!--end maincontentarea div-->
        <div id="sidebar">
<!-- #include virtual="../includes/sidenav.aspx" -->
        </div><!--end sidebar div--><br class="clear" />
        

<!-- #include virtual="../includes/footer.aspx" -->
    	</div><!--end container div-->
	</body>
</html>
