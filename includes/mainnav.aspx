<%  

    Dim M2Mpath0 As String
    Dim M2Mpath05 As String
    Dim M2Mpath1 As String
    Dim M2Mpath2 As String
    Dim M2Mpath3 As String
    Dim M2Mpath4 As String
    Dim M2Mpath5 As String
    Dim M2Mpath6 As String
    Dim M2Mpath7 As String
    Dim NavState05 As String = vbEmpty
    Dim NavState1 As String = vbEmpty
    Dim NavState2 As String = vbEmpty
    Dim NavState3 As String = vbEmpty
    Dim NavState4 As String = vbEmpty
    Dim NavState5 As String = vbEmpty
    Dim NavState6 As String = vbEmpty
    Dim NavState7 As String = vbEmpty

    M2Mpath0 = Request.ServerVariables("url")
    M2Mpath05 = InStrRev(M2Mpath0, ".org/index")
    M2Mpath1 = InStrRev(M2Mpath0,"/participate/")
    M2Mpath2 = InStrRev(M2Mpath0,"/partners/")
    M2Mpath3 = InStrRev(M2Mpath0, "/project-network/")
    M2Mpath4 = InStrRev(M2Mpath0, "/sites/")
    M2Mpath5 = InStrRev(M2Mpath0, "/activities/")
    M2Mpath6 = InStrRev(M2Mpath0, "/tools-resources/")
    M2Mpath7 = InStrRev(M2Mpath0, "/news-events/")

    If M2Mpath05 Then
        NavState05 = " class=""on"""
    ElseIf M2Mpath1 Then
        NavState1 = " class=""on"""
    ElseIf M2Mpath2 Then
        NavState2 = " class=""on"""
    ElseIf M2Mpath3 Then
        NavState3 = " class=""on"""
    ElseIf M2Mpath4 Then
        NavState4 = " class=""on"""
    ElseIf M2Mpath5 Then
        NavState5 = " class=""on"""
    ElseIf M2Mpath6 Then
        NavState6 = " class=""on"""
    ElseIf M2Mpath7 Then
        NavState7 = " class=""on"""
    End If

%>
<div id="banner">
	<a href="../index.aspx" title="Home" id="logo"><img src="/images/gmi.gif" alt="Global Methane Initiative logo" /></a>
	<form id="search_form" method="get" action="../advancedSearch.aspx">
		<ul>
            <li><a href="../asg.aspx" title="Contact Us">Contact Us</a></li>
            <li> <a href="../about/index.aspx" title="About the Partnership">About the Initiative</a></li>
            <li><a href="../about/methane.aspx" title="About Methane">About Methane</a></li>
            <li id="searchbox">
            	<input type="hidden" name="cx" value="003308039692091974043:qaknzcsdyy4" />
                <input type="hidden" name="sitesearch" value="globalmethane.org" />
                <input type="hidden" name="cof" value="FORID:11;NB:1" />
                <input type="text" id="searchfield" placeholder="Search" name="q" value="" style="margin: 2px; line-height: 1.7em; padding-left: 5px;"/>
                <input type="image" src="/images/header-search.png" id="gobuttontop" alt="Search" title="Search" />
            </li>
        </ul>
    </form>
</div><!--end banner div-->
<ul id="mainnav">
    
    <li id="home"><a href="/index.aspx" title="Home" <%=NavState05%>>Home</a></li>
	<li id="howtopart"><a href="../participate/index.aspx" title="How to Participate" <%=NavState1%>>How to Participate</a></li>
    <li id="partcountries"><a href="../partners/index.aspx" title="Partner Countries" <%=NavState2%>>Partner Countries</a></li>
    <li id="projnetwork"><a href="../project-network/index.aspx" title="Project Network" <%=NavState3%>>Project Network</a></li>
    <li id="sites"><a href="../sites/index.aspx" title="Sites" <%=NavState4%>>Sites</a></li>
    <li id="projects"><a href="../activities/advancedSearch.aspx" title="Activities" <%=NavState5%>>Activities</a></li>
    <li id="tollres"><a href="../tools-resources/index_new.aspx" title="Tools &amp; Resources" <%=NavState6%>>Tools &amp; Resources</a></li>
    <li id="newsevents"><a href="../news-events/event_yearlistview.aspx" title="News &amp; Events" <%=NavState7%>>News &amp; Events</a></li>
    <li id="emailbutton"><a href="mailto:asg&#64;globalmethane.org?subject=Global Methane Initiative" title="E-mail"></a></li>
    <li id="rss"><a href="../rss.xml" title="RSS"></a></li>
    <li id="share"><script type="text/javascript">var addthis_pub="methanetomarkets";</script><a href="https://www.addthis.com/bookmark.php?v=20" onmouseover="return addthis_open(this, '', '[URL]', '[TITLE]')" onmouseout="addthis_close()" onclick="return addthis_sendto()" title="Share"></a><script type="text/javascript" src="https://s7.addthis.com/js/200/addthis_widget.js"></script></li>
</ul>