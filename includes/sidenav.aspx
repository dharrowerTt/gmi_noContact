<%

    Dim M2Mpath10 As String
    Dim M2Mpath11 As String
    Dim M2Mpath12 As String
    Dim M2Mpath13 As String
    Dim M2Mpath14 As String
    Dim M2Mpath15 As String
    Dim M2Mpath16 As String
    Dim NavState11 As String = vbEmpty
    Dim NavState12 As String = vbEmpty
    Dim NavState13 As String = vbEmpty
    Dim NavState14 As String = vbEmpty
    Dim NavState15 As String = vbEmpty
    Dim NavState16 As String = vbEmpty

    M2Mpath10 = Request.ServerVariables("Url") & "?" & Request.QueryString.ToString
    M2Mpath11 = InStrRev(M2Mpath10, "agri")
    M2Mpath12 = InStrRev(M2Mpath10, "coal")
    M2Mpath13 = InStrRev(M2Mpath10, "msw")
    M2Mpath14 = InStrRev(M2Mpath10, "oil")
    M2Mpath15 = InStrRev(M2Mpath10, "steer")
    M2Mpath16 = InStrRev(M2Mpath10, "ww")

If M2Mpath11 then
	NavState11 = " class=""on"""
ElseIf M2Mpath12 then
	NavState12 = " class=""on"""
ElseIf M2Mpath13 then
	NavState13 = " class=""on"""
ElseIf M2Mpath14 then
	NavState14 = " class=""on"""
ElseIf M2Mpath15 then
	NavState15 = " class=""on"""
ElseIf M2Mpath16 then
	NavState16 = " class=""on"""
End If

%>

<ul id="sidenav">
	<li id="agnav"><a href="<%= Session("myPath") %>/sectors/index.aspx?sector=agri" title="Agriculture" <%=NavState11%>>Agriculture</a></li>
    <li id="coalnav"><a href="<%= Session("myPath") %>/sectors/index.aspx?sector=coal" title="Coal Mines" <%=NavState12%>>Coal Mines</a></li>
    <li id="landnav"><a href="<%= Session("myPath") %>/sectors/index.aspx?sector=msw" title="Landfills" <%=NavState13%>>Municipal Solid Waste</a></li>
    <li id="oilnav"><a href="<%= Session("myPath") %>/sectors/index.aspx?sector=oilngas" title="Oil &amp; Gas" <%=NavState14%>>Oil &amp; Gas Systems</a></li>
    <li id="wwnav"><a href="<%= Session("myPath") %>/sectors/index.aspx?sector=ww" title="Wastewater" <%=NavState16%>>Wastewater</a></li>
    <li id="steernav"><a href="<%= Session("myPath") %>/sectors/index.aspx?sector=steer" title="Steering" <%=NavState15%>>Steering</a></li>
</ul>
<div id="translatebox">
	<h5>Translate this page</h5>
	<p>Global Methane Initiative provides fact sheets and links to resources in <a href="<%= Session("myPath") %>/chinese.aspx">Chinese</a>, <a href="<%= Session("myPath") %>/russian.aspx">Russian</a>, and <a href="<%= Session("myPath") %>/spanish.aspx">Spanish</a>.</p>
	<form action="/">
        <%--<fieldset>
        	<p>Translate this page to:
            <select onchange="doTranslate(this.form.langdrop.options[this.form.langdrop.selectedIndex].value)" name="langdrop">
            	<option value="">Select Language</option>
            	<option value="en|ar" xml:lang="ar" title="Arabic">العربية</option>
                <option value="en|bg" xml:lang="bg" title="Bulgarian">български</option>
                <option value="en|ca" xml:lang="ca" title="Catalan">català</option>
                <option value="en|cs" xml:lang="cs" title="Czech">česky</option>
                <option value="en|da" xml:lang="da" title="Danish">Dansk</option>
                <option value="en|de" xml:lang="de" title="German">Deutsch</option>
                <option value="en|el" xml:lang="el" title="Greek">Ελληνικά</option>
                <option value="en|es" xml:lang="es" title="Spanish">Español</option>
                <option value="en|fi" xml:lang="fi" title="Finnish">suomi</option>
                <option value="en|fr" xml:lang="fr" title="French">Français</option>
                <option value="en|hi" xml:lang="hi" title="Hindi">हिन्दी</option>
                <option value="en|hr" xml:lang="hr" title="Croatian">hrvatski</option>
                <option value="en|id" xml:lang="id" title="Indonesian">Indonesia</option>
                <option value="en|it" xml:lang="it" title="Italian">Italiano</option>
                <option value="en|iw" xml:lang="iw" title="Hebrew">עברית</option>
                <option value="en|ja" xml:lang="ja" title="Japanese">日本語</option>
                <option value="en|ko" xml:lang="ko" title="Korean">한국어</option>
                <option value="en|lt" xml:lang="lt" title="Lithuanian">Lietuvių</option>
                <option value="en|lv" xml:lang="lv" title="Latvian">latviešu</option>
                <option value="en|nl" xml:lang="nl" title="Dutch">Nederlands</option>
                <option value="en|no" xml:lang="no" title="Norwegian">norsk</option>
                <option value="en|pl" xml:lang="pl" title="Polish">Polski</option>
                <option value="en|pt" xml:lang="pt" title="Portuguese">Português</option>
                <option value="en|ro" xml:lang="ro" title="Romanian">Română</option>
                <option value="en|ru" xml:lang="ru" title="Russian">Русский</option>
                <option value="en|sk" xml:lang="sk" title="Slovak">slovenčina</option>
                <option value="en|sl" xml:lang="sl" title="Slovenian">slovenščina</option>
                <option value="en|sr" xml:lang="sr" title="Serbian">српски</option>
                <option value="en|sv" xml:lang="sv" title="Swedish">Svenska</option>
                <option value="en|tl" xml:lang="tl" title="Filipino">Filipino</option>
                <option value="en|uk" xml:lang="uk" title="Ukrainian">українська</option>
                <option value="en|vi" xml:lang="vi" title="Vietnamese">Tiếng Việt</option>
                <option value="en|zh-CN" xml:lang="zh-CN" title="Chinese (Simplified)">中文 (简体)</option>
                <option value="en|zh-TW" xml:lang="zh-TW" title="Chinese (Traditional)">中文 (繁體)</option>
            </select>
             </p>
             </fieldset>--%>
      <div id="google_translate_element"></div><script type="text/javascript">
                                                   function googleTranslateElementInit() {
                                                       new google.translate.TranslateElement({ pageLanguage: 'en', layout: google.translate.TranslateElement.InlineLayout.SIMPLE }, 'google_translate_element');
                                                   }
</script><script type="text/javascript" src="//translate.google.com/translate_a/element.js?cb=googleTranslateElementInit"></script>
    
       
    </form>
<div id="translatebottom"></div>
</div><!--end translatebox div-->