<%@ Page Language="VB" ContentType="text/html" ResponseEncoding="utf-8" %>

<% @ Import Namespace="System.IO" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
    <head>
        <title>Infographic | About Methane | Global Methane Initiative</title>
        <script src="../scripts/jquery.tools.min.js" type="text/javascript"></script>
        <!-- #include virtual="../includes/header.aspx" -->

<style type="text/css">
.infographic-slideshow {
	width: 100%;
	margin: 0;	
    text-align:center;
}
.infographic {width: 100%; margin: 0; padding: 0px; }
img.infoimage {border:2px solid #e1e1e1;border-radius: 15px;width:95%;}

#infographic-nav {float:left; left:6px; top:10px; margin:0 25px 0 0; z-index:999;} /* top:-23px; */
#infographic-nav a{background:#e1e1e1; font-size:12pt; font-weight:bold;text-decoration:none;margin:0 4px 0 0;padding:2px 8px 2px 8px;border:1px solid #e1e1e1;border-radius: 5px;}
#infographic-nav a.activeSlide {background:#80BC30;border:1px solid #80BC30; color:white;border-radius: 5px;}
#infographic-nav a:focus, #infographic-nav a:hover{background:#0f5ba6;outline:none;text-decoration:none;color:#fff;border:1px solid white;border-radius: 5px;}

#prevnext-nav {float:left; left:6px; top:10px; margin-bottom:0px; margin-right:20px; z-index:999;} /* top:-23px; */
#prevnext-nav a{background:#e1e1e1; font-size:12pt; font-weight:bold;text-decoration:none;margin:0 4px 0 0;padding:2px 8px 2px 8px;border:1px solid #e1e1e1;border-radius: 5px;}
#prevnext-nav a.activeSlide {background:#80BC30;border:1px solid #80BC30; color:white;border-radius: 5px;}
#prevnext-nav a:focus, #prevnext-nav a:hover{background:#0f5ba6;outline:none;text-decoration:none;color:#fff;border:1px solid white;border-radius: 5px;}
</style>

<script type="text/javascript" src="../scripts/jquery.cycle.all.js"></script>
<script type="text/javascript" src="../scripts/jquery.easing.1.3.js"></script>
<script type="text/javascript">
$(document).ready(function() {
    $('.infographic').after('<div id="prevnext-nav" class="nav"><a id="prev1" href="#">Prev</a><a id="next1" href="#">Next</a></div><div id="infographic-nav" class="nav"></div>');
    $('.infographic').cycle({
		fx:     'scrollHorz', 
	    prev:   '#prev1', 
	    next:   '#next1',
		//fx: 'turnLeft', // choose your transition type, ex: fade, scrollUp, shuffle, etc...
		//easing: 'easeOutBack',
		timeout: 3500, //12000
		pause: true,
		pager:  '#infographic-nav'
	});
  // Pause cycle on click
    $('.nav a').click(function(){ $('.infographic').cycle('pause'); });
});
</script>

    
        <section class="py-5 gmi-light-blue">        <div class="container">    <div class="row">    <div class="col-sm-12">
        	<div id="breadcrumbs"><a href="../index.aspx">Home</a> &raquo; <a href="index.aspx">About the Initiative</a> &raquo; <span id="lastcrumb">Infographic</span></div>
              <h1>GMI Accomplishments Infographic</h1>
<!--<iframe src="infographic/story.html" width="720" height="540" style="padding:0px;margin:0px;border:0px;"></iframe>-->

				<div class="infographic-slideshow">
                  <div class="infographic">
                  	<img class="infoimage" src="../images/infographic_1_begin.png" alt="Over a decade of reducing methane emissions around the globe" />
                    <img class="infoimage" src="../images/infographic_2_partners.png" alt="GMI Partners help reduce methane emissions and encourage recovery and use of methane as an energy source" />
                    <img class="infoimage" src="../images/infographic_3_methane_matters.png" alt="Methane matters" />
                    <img class="infoimage" src="../images/infographic_4_sectors.png" alt="GMI-target sectors will account for more than 5,000 MMTCO2E of total global manmade methane emissions by 2020" />
                    <img class="infoimage" src="../images/infographic_5_gmi_work.png" alt="GMI's work since 2004" />
                    <img class="infoimage" src="../images/infographic_6_accomplishments.png" alt="Accomplishments" />
                    <img class="infoimage" src="../images/infographic_7_benefits.png" alt="Benefits" />
                    <img class="infoimage" src="../images/infographic_8_equivalencies.png" alt="Equivalencies of benefits" />
                    </div>
                  </div>
                  
<map name="m_infographic_9_learn_more" id="m_infographic_9_learn_more">
<area shape="rect" coords="439,296,682,480" href="../sites/index.aspx" alt="Explore Methane Sites" />
<area shape="rect" coords="40,296,379,480" href="../partners/index.aspx" alt="Learn more about GMI Partner Countries" />
<area shape="rect" coords="488,92,650,269" href="../project-network/index.aspx" alt="Join the Project Network" />
<area shape="rect" coords="288,103,448,269" href="https://twitter.com/GlobalMethane" alt="Follow GMI on Twitter" />
<area shape="rect" coords="97,103,242,269" href="http://globalmethane.wordpress.com/" alt="Follow Methane International - The GMI Blog" />
</map>


        </div>   </div>  </div> </section>
	<div id="rightcontentarea">
    	<h3>Printer-Friendly Version</h3>
        <p><a href="../documents/infographic.pdf">View as printer-friendly document</a> (PDF, 4 pp, 3.5 MB)</p>

        <br /><br />
        <h3>Learn More and Get Involved</h3>
        <p><a href="http://globalmethane.wordpress.com/">Follow Methane International - the GMI Blog</a></p>
        <p><a href="https://twitter.com/GlobalMethane">Follow GMI on Twitter @GlobalMethane</a></p>
        <p><a href="../project-network/index.aspx">Join the Project Network</a></p>
        <p><a href="../partners/index.aspx">Learn about Partner Countries</a></p>
        <p><a href="../sites/index.aspx">Explore Methane Sites</a></p>

    </div>

<!-- #include virtual="../includes/footer_scripts.aspx" -->
</body>
</html>    	
