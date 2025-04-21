<%@ Page Language="vb" AutoEventWireup="false" Codebehind="partners.vb" Inherits="partnersCommoncode" %>

<% @ Import Namespace="System.IO" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
    <head>
        <title>Brazil | Global Methane Initiative</title>
        <!-- #include virtual="../includes/header.aspx" -->
   
	<asp:Literal ID=countryName Runat="server" Text="Brazil" Visible="False"></asp:Literal>
	
        	<div id="breadcrumbs"><a href="../index.aspx">Home</a> &raquo; <a href="index.aspx">Partner Countries</a> &raquo; <span id="lastcrumb">Brazil</span></div>
        	<div id="countryleft">
           	<h1>Brazil <img src="/images/flag_brazil.gif" alt="Brazilian flag" /></h1>
           		<img src="/images/map_brazil.gif" alt="map of Brazil" usemap="#brazilmap" class="noborder" />
                <map name="brazilmap" id="brazilmap">
                    <area shape="rect" coords="82,38,102,68" href="../projects/index.aspx?geoFocus=brazil" alt="" />
                    <area shape="rect" coords="121,77,142,110" href="../projects/index.aspx?geoFocus=brazil" alt="" />
                    <area shape="rect" coords="152,47,173,79" href="../projects/index.aspx?geoFocus=brazil" alt="" />
                  <area shape="rect" coords="160,100,182,130" href="../projects/index.aspx?geoFocus=brazil" alt="" />
                </map>
                <div id="countrybox">
					<span class="rounded"><span class="rounded1"></span><span class="rounded2"></span><span class="rounded3"></span><span class="rounded4"></span><span class="rounded5"></span></span>
					<p xml:lang="es">Com base nos dados da EPA Global  emiss&otilde;es antropog&eacute;nicas de gases com efeito de estufa n&atilde;o-CO<sub>2</sub> relat&oacute;rio, em 2005, o Brasil &eacute; estimado das emiss&otilde;es antropog&eacute;nicas de metano 4. Classificado no mundo. Embora gado s&atilde;o o pa&iacute;s da maior fonte de emiss&otilde;es de metano, cerca de 7 por cento de suas emiss&otilde;es antropog&eacute;nicas de metano-28,91  MMTCO<sub>2</sub>E-prov&ecirc;m da agricultura (estrume de gest&atilde;o), aterros sanit&aacute;rios, e de g&aacute;s natural e &oacute;leo de sistemas.</p>
					<span class="rounded"><span class="rounded5"></span><span class="rounded4"></span><span class="rounded3"></span><span class="rounded2"></span><span class="rounded1"></span></span>
                </div><!--end countrybox div-->
                <p>Based on data in EPA's Global Anthropogenic Emissions of Non-CO<sub>2</sub> Greenhouse Gases report, in 2005, Brazil's estimated anthropogenic methane emissions ranked 4<sup>th</sup> in the world. While cattle are the country's largest source of methane emissions, approximately 7 percent of its anthropogenic methane emissions&mdash;28.91 MMTCO<sub>2</sub>E&mdash;come from <a href="../agriculture/index.aspx">agriculture (manure management)</a>, <a href="../landfills/index.aspx">municipal solid waste</a>, and <a href="../oil-gas/index.aspx">natural gas and oil systems</a>.</p>
                <h2>Sector Committee Activities</h2>
                    <div class="accordion">
                        <h3>Agriculture</h3>
                            <ul class="acclist">
                                <li><a href="countryCommittee.aspx?country=brazil&sector=agri">Country committee members</a></li>
                                <li><a href="../projects/index.aspx?geoFocus=brazil&sector=agri">Projects in Brazil</a></li>
                              	<li><a href="../documents/ag_cap_brazil.pdf">Country action plan</a> (PDF, 16 pp, 188 KB)</li>
                                <li><a href="../documents/partners_brazil_ag_update.pdf">Country update presentations</a> (PDF, 7 pp, 135 KB), last updated at 22 April 2008 subcommittee meeting  in Morelia, Mexico</li>
                                <li><strong>Proceedings from GMI events in Brazil</strong>
                                	<ul>
                                        <asp:Placeholder id="ph1" runat="server">						
										</asp:Placeholder>
                                    </ul></li>
                            </ul>
                        <h3>Coal Mines</h3>
                            <ul class="acclist">
                                <li><a href="countryCommittee.aspx?country=brazil&sector=coal">Country committee members</a></li>
                                <li><a href="../projects/index.aspx?geoFocus=brazil&sector=coal">Projects in Brazil</a></li>
                                <li><strong>Proceedings from GMI events in Brazil</strong>
                                    <ul>
                                        <asp:Placeholder id="ph2" runat="server">						
										</asp:Placeholder>
                                    </ul></li>
                            </ul>
                        <h3>Municipal Solid Waste</h3>
                            <ul class="acclist">
                                <li><a href="countryCommittee.aspx?country=brazil&sector=landfill">Country committee members</a></li>
                                <li><a href="../projects/index.aspx?geoFocus=brazil">Projects in Brazil</a></li>
                                <li><a href="../documents/landfills_cap_brazil.pdf">Country action plan</a> (PDF, 57 pp, 2.4 MB)</li>
                                <li><a href="../documents/events_land_20090127_subcom_brazil.pdf">Country update presentations</a> (PDF, 23 pp, 2.6 MB), last updated at 27-29 January 2009 subcommittee meeting in Monterrey, Mexico</li>
                                <li><strong>Proceedings from GMI events in Brazil</strong>
                                    <ul>
                                        <asp:Placeholder id="ph3" runat="server">						
										</asp:Placeholder>
                                    </ul></li>
                            </ul>
                        <h3>Oil &amp; Gas</h3>
                            <ul class="acclist">
                                <li><a href="countryCommittee.aspx?country=brazil&sector=oilngas">Country committee members</a></li>
                                <li><a href="../projects/index.aspx?geoFocus=brazil&sector=oilngas">Projects in Brazil</a></li>
                                <li><strong>Proceedings from GMI events in Brazil</strong>
                                    <ul>
                                        <asp:Placeholder id="ph4" runat="server">						
										</asp:Placeholder>
                                    </ul></li>
                            </ul>
                        <h3>Steering</h3>
                            <ul class="acclist">
                                <li><a href="countryCommittee.aspx?geoFocus=brazil&sector=steer">Country committee members</a></li>
                                <li><strong>Proceedings from GMI events in Brazil</strong>
                                    <ul>
                                        <asp:Placeholder id="ph5" runat="server">						
										</asp:Placeholder>
                                    </ul></li>
                            </ul><br class="clear" />
                    </div>
            </div><!--end countryleft div-->
            <div id="countryright">
            	<!--<div id="countryhighlights">
                	<h3>Country Highlights</h3>
                        <ul>
                        	<li>Landfills in Brazil have an estimated generation rate of 300 to 578 million cubic meters per year, capable of providing 60 to 144 MW of electricity.<br />
                            <a href="#" class="moreinfo">[More Info]</a></li>
                            <li>Brazil has two landfill to gas energy projects in Sao Paulo.<br />
                            <a href="#" class="moreinfo">[More Info]</a></li>
                        </ul>
                </div>--><!--end countryhighlights-->
                <!--<div id="countryhighlightsbottom"></div>-->
                <ul id="rightlist">
                    <li><a href="countryPartners.aspx?country=brazil">Project Network Members in Brazil</a></li>
                    <!--<li><a href="#">Success Stories in Brazil</a></li>-->
                    <li><a href="../projects/index.aspx?geoFocus=brazil">Projects in Brazil</a></li>
                    <li><a href="../spanish.aspx">Resources in Spanish</a></li>
                </ul>
                <!--<div id="resourcestop"></div>
                <div id="resourcesbox">
                	<h4>Resources</h4>
                    <ul>
                    	<li><a href="#">Funding opportunities for projects in Brazil</a></li>
                    </ul>
                </div>
                <div id="resourcesbottom"></div>-->
            </div><!--end countryright div-->
      	</div><!--end maincontentarea div-->
        <div id="sidebar">
<!-- #include virtual="../includes/sidenav.aspx" -->
        </div><!--end sidebar div--><br class="clear" />
        
<!-- #include virtual="../includes/footer.aspx" -->
    	</div><!--end container div-->
	</body>
</html>
