<%@ Page Language="vb" AutoEventWireup="false" Codebehind="global-map.aspx.vb"  Inherits="M2M_Redesign.indexForSites" %>

<% @ Import Namespace="System.IO" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
    <head>
        <title>GMI Map of Methane Sites | Global Methane Initiative</title>
        <!-- #include virtual="../includes/header.aspx" -->
    
        <div id="maincontentarea">
            <div id="breadcrumbs">
                <a href="http://www.globalmethane.org">Home</a> » <span id="lastcrumb">GMI Map of Methane Sites</span>
            </div>

            <h1>GMI Map of Methane Sites</h1>
            <div id='map_canvas' style =" width:101%;height:500px;"></div>

<form name="frm" id="frm">
  <table class="tablebord" width="100%" cellspacing="0" cellpadding="0" border="1" style="margin-left:0px; font-size:11px; border-color:transparent;">
  <tbody>
  <tr style="height:10px;font:9.5pt;"><td colspan="3"><b>Note:</b>  The site locations shown on the map are approximate. To avoid misrepresentations, the “zoom in” feature is limited.</td>
  </tr>
  <tr style="height:35px;">

  <td style="border:none;"> <strong> Map Key: </strong></td>
      <td style="border:none; ">
  <input type="checkbox" checked="checked" name="CK_SA" value="SelectAll" onclick="selectAllFeatures()" /> Select All</td>
  <td style="border:none;">
  <img alt= "Red Icon" src="/images/Agricultureicon.png"/> 
  <input type="checkbox" checked="checked" name="CK_Ag" value="Agriculture" onclick="filterFeatures()"/> Agriculture </td>
  <td style="border:none;">
  <img alt= "Red Icon" src="/images/Coalicon.png"/>
  <input type="checkbox" checked="checked" name="CK_Coal" value="Coal Mines" onclick="filterFeatures()"/> Coal Mines</td>
  <td style="border:none;">
  <img alt= "Red Icon" src="/images/MSWicon.png"/>
  <input type="checkbox"checked="checked"  name="CK_MSW" value="MSW" onclick="filterFeatures()"/> MSW &nbsp;&nbsp;&nbsp;&nbsp;</td>
  <td style="border:none;"><img alt= "Red Icon" src="/images/OilGasicon.png"/>
   <input type="checkbox" checked="checked" name="CK_Oil" value="Oil & Gas" onclick="filterFeatures()"/> Oil & Gas&nbsp;&nbsp;&nbsp;&nbsp; </td>
  <td style="border:none;"><img alt= "Red Icon" src="/images/WasteWatericon.png"/><input type="checkbox" checked="checked" name="CK_Wat" value="Wastewater" onclick="filterFeatures()"/> Wastewater  </td>
          </tr>
  <tr style="height:35px;">
      <td style="border:none;"><strong>Site Type</strong>:</td>
      <td style="border:none; padding-left:0px;"><input type="checkbox" checked="checked"  name="GmiSiteYEScheckbox" value="Yes" onclick="filterFeatures()"/> GMI Sites</td>
       <td style="border:none;  padding-left:28px;"><input type="checkbox" checked="checked"  name="GmiSiteNOcheckbox" value="No" onclick="filterFeatures()"/> Non-GMI Sites </td>

  </tr>
  </tbody>
  </table>
</form>

    


    <p>The Global Methane Initiative (GMI) sites map shows locations worldwide of potential or completed methane projects.</p>

    <h3 >How to use this map</h3>
            <ul>
                <li>Use the check boxes to view sites by sector(s).</li>
                <li>Click a cluster of sites (i.e., numbered circles) to zoom to a region.</li>
                <li>Click an individual site to view a summary.</li>
                <li>For more site details click on the highlighted link.</li>
                <li>Download all the <a href="../documents/GMI-Sites-Map-Data.xls">sites data</a> (Excel, 395 KB), current as of May 27, 2014.</li>
            </ul>
            
            <p style="clear:both;">The site icon locations on the map are approximations based on the geo-location information that GMI has on file. Please <a href="https://www.globalmethane.org/activities/actContact.aspx">contact GMI</a> if you have more accurate information so that we may update our records.</p>
                        	
      	</div><!--end maincontentarea div-->
        <div id="rightcontentarea">
        	<div style="padding-left:15px; padding-right:10px;">
            	<h3 >About this map</h3>
            	<ul>
                	<li>GMI sites are facilities at which methane abatement, recovery, and/or use projects have been identified or completed.</li>
                	<li>Non-GMI sites are locations of potential or existing projects that are not GMI supported.</li>
                	<li>This map is updated periodically. It does not represent all methane-related sites in the world, and GMI cannot guarantee the validity of the data.</li>
            	</ul>
        	</div>
			<p id="adddata"><img src="/images/activity_qmark.gif" alt="" id="qmark2" class=""> <a href="../activities/actContact.aspx"><strong>ADD YOUR DATA &gt;&gt;</strong></a></p>
        	
        </div><!--end rightcontentarea div-->        


       <script type="text/javascript" src="https://maps.google.com/maps/api/js?sensor=false"></script>
   <!--  <script type="text/javascript" src="http://www.bbcasecompetition.org/files/theme/markerclusterer1.js"></script>
    <script type="text/javascript" src="http://www.bbcasecompetition.org/files/theme/testdata05282014.js"></script>
    <script type="text/javascript" src="http://www.bbcasecompetition.org/files/theme/map.js"></script>-->
    <script type="text/javascript" src="map.js"></script>
    <script type="text/javascript" src="/scripts/GMIMapdata.js"></script>
    <script type="text/javascript" src="markerclusterer1.js"></script>
<!-- #include virtual="../includes/footer.aspx" -->
    	

	
