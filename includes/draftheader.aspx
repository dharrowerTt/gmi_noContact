<!-- BEGIN header -->
<!-- all pages -->
<!-- Google Tag Manager -->
<script>    (function (w, d, s, l, i) {
        w[l] = w[l] || []; w[l].push({ 'gtm.start':
new Date().getTime(), event: 'gtm.js'
        }); var f = d.getElementsByTagName(s)[0],
j = d.createElement(s), dl = l != 'dataLayer' ? '&l=' + l : ''; j.async = true; j.src =
'https://www.googletagmanager.com/gtm.js?id=' + i + dl; f.parentNode.insertBefore(j, f);
    })(window, document, 'script', 'dataLayer', 'GTM-WM2LZW5');</script>
<!-- End Google Tag Manager -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="/styles/desktoplayout.css" type="text/css"
    media="only screen and (min-width:1025px)" />
<link rel="stylesheet" href="/styles/handheldlayout.css"
    media="only screen and (max-width:1024px)" />
<link rel="stylesheet" href="/styles/mobilelayout.css" type="text/css"
    media="only screen and (max-device-width:480px)" />
<!--<link rel="stylesheet" href="styles/printlayout.css" type="text/css" media="print" />-->
<style type="text/css" media="all">
    @import url(/styles/common.css);
    @import url(/styles/inner.css);
    @import url(/styles/calendar.css);
    @import url(/styles/jquery-ui.css);
    @import url(/styles/gsc.css);
    @import url(/styles/jquery.fancybox-1.3.1.css);
    @import url(/styles/home.css);
    @import url(/styles/search.css);
    @import url(/styles/form.css);
    @import url(/styles/resourcelayouts.css);
    @media print {
        .ui-tabs-nav {
            display: none !important;
        }

    }
</style>
<!--[if IE 6]><style type="text/css">@import url(/styles/ie6.css);</style><![endif]-->
<!--[if IE 7]><style type="text/css">@import url(/styles/ie7.css);</style><![endif]-->
<!--[if IE 8]><style type="text/css">@import url(/styles/ie8.css);</style><![endif]-->
<link rel="stylesheet" type="text/css" href="https://www.google.com/cse/style/look/default.css" />
<link rel="stylesheet" type="text/css" href="/styles/printlayout.css" media="print">
<link rel="stylesheet" type="text/css" href="http://fonts.googleapis.com/css?family=Pontano+Sans">
<link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Palanquin+Dark">
</head>
<body>
<!-- Google Tag Manager (noscript) -->
<noscript><iframe src="https://www.googletagmanager.com/ns.html?id=GTM-WM2LZW5"
height="0" width="0" style="display:none;visibility:hidden"></iframe></noscript>
<!-- End Google Tag Manager (noscript) -->
<!--<div style="padding:10px;margin:0px;text-align:center;font-size:14pt;color:white;background-color:#464637;text-align:center;border-bottom:10px solid #54CBF5;">
    This site is for testing purposes. Please note that load times may be slower than expected and many links to documents and resources will not work.
</div>-->

<!-- global scripts -->

    <script type="text/javascript" src="/scripts/GACode.js" async></script>
    <!-- this is for jQuery  -->
    <script type="text/javascript" src="/scripts/jquery.min.js"></script>
    <script type="text/javascript" src="/scripts/jquery.popupoverlay.js"></script>
    <!<script type="text/javascript" src="/scripts/scripts.js"></script>

<!-- this is for the google search -->
<script src="https://www.google.com/jsapi"></script>
<script type="text/javascript">
    function parseQueryFromUrl() {
        var queryParamName = "q";
        var search = window.location.search.substr(1);
        var parts = search.split('&');
        for (var i = 0; i < parts.length; i++) {
            var keyvaluepair = parts[i].split('=');
            if (decodeURIComponent(keyvaluepair[0]) == queryParamName) {
                return decodeURIComponent(keyvaluepair[1].replace(/\+/g, ' '));
            }
        }
        return '';
    }

    google.load('search', '1', { language: 'en' });
    google.setOnLoadCallback(function () {
        var customSearchOptions = {};
        var customSearchControl = new google.search.CustomSearchControl(
              '003308039692091974043:qaknzcsdyy4', customSearchOptions);
        customSearchControl.setResultSetSize(google.search.Search.FILTERED_CSE_RESULTSET);
        var options = new google.search.DrawOptions();
        options.enableSearchResultsOnly();
        customSearchControl.draw('cse', options);
        var queryFromUrl = parseQueryFromUrl();
        if (queryFromUrl) {
            customSearchControl.execute(queryFromUrl);
        }
    }, true);
</script>
<!-- this is for the translate dropdown -->
<script type="text/javascript">
    function googleTranslateElementInit() {
        new google.translate.TranslateElement({ pageLanguage: 'en', layout: google.translate.TranslateElement.InlineLayout.SIMPLE }, 'google_translate_element');
    }
</script>
<script type="text/javascript" src="//translate.google.com/translate_a/element.js?cb=googleTranslateElementInit"></script>
<script>
		function changeGoogleStyles() {
			if(($goog = $('.goog-te-menu-frame').contents().find('body')).length) {
				var stylesHtml = '<style>'+
					'.goog-te-menu2 {'+
						'max-width:100% !important;'+
						'overflow:scroll !important;'+
						'box-sizing:border-box !important;'+
						'height:auto !important;'+
					'}'+
				'</style>';
				$goog.prepend(stylesHtml);
				if (($goog = $('.gsc-results-wrapper-overlay').contents().find('body')).length) {
				    var stylesHtml = '<style>' +
					'.gsc-results-wrapper-overlay {' +
						'-webkit-box-shaddow: none !important;' +
						'box-shadow:none !important;' +
						'padding:0px !important;' +
						'width:100% !important;' +
					'}' +
				'</style>';
				    $goog.prepend(stylesHtml);
				} else {
				    setTimeout(changeGoogleStyles, 50);
				}
			}  else {
				setTimeout(changeGoogleStyles, 50);
			}
		}
		changeGoogleStyles();
		</script>
<!-- END -- this is for the translate dropdown -->
<!-- THIS IS FOR THE DROWNDOWN MENUS -->
    <script type="text/javascript" src="/scripts/dropmenu/jquery.smartmenus.js"></script>
<!-- SmartMenus jQuery init -->
<script type="text/javascript">
    $(function () {
        $('#main-menu').smartmenus({
            subMenusSubOffsetX: 1,
            subMenusSubOffsetY: -8
        });
    });
</script>
<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
           <script src="/scripts/dropmenu/html5shiv.min.js" async="async"></script>
           <script src="/scripts/dropmenu/respond.min.js" async="async"></script>
        <![endif]-->
<!-- END -- THIS IS FOR THE DROWNDOWN MENUS -->

<!-- this is for the overlays -->
		  <script>
          function openNav() {
              document.getElementById("myNav").style.height = "100%";
          }
          
          function closeNav() {
              document.getElementById("myNav").style.height = "0%";
          }
          </script>
        <!-- end soverlays scripts -->


        <!-- this is for the search filter -->
          <script type="text/javascript" src="/scripts/jquery-ui.js" async></script>
          <script>
          $(function() {
            $( "#dateafter" ).datepicker();
            $( "#datebefore" ).datepicker();
          });
          </script>
        <!-- end search filter scripts -->
        
<!-- end global scripts -->

    <ul class="hide">
        <li><a href="#maincontentarea" title="Skip Navigation (AccessKey+1)" accesskey="1">Skip
            Navigation</a></li>
    </ul>
    <div id="container">

        <div id="toplogoarea">
			<!-- begin top content: logo, translate, searches, social media links -->
            <%--<img id="openoverlayxx" onclick="openNav()" src="/images/navmenu.png" alt="Open menu" title="Open menu" />--%>
            <div id="openoverlay" onclick="openNav()">Menu &#9776;</div>
            
            <div id="topgmilogo">
	            <a href="/index.aspx" title="Home"><img src="/images/gmi.gif" alt="Global Methane Initiative logo" id="topgmilogoimage" /></a>
            </div>
            
			<div id="banner-social-media">
                <div id="google_translate_element"></div>
                <a runat="server" href="/announcements.aspx"><img src="/images/smicons/announcementssmall.png" alt="GMI Announcements" title="GMI Announcements" /></a>
                <a target="_blank" href="https://twitter.com/GlobalMethane"><img src="/images/smicons/tw1small.png" alt="Twitter" title="Follow GMI on Twitter" /></a>
                <a target="_blank" href="https://www.youtube.com/channel/UC0wmNVURWg9oAJnp3IA1gvA"><img src="/images/smicons/yt1small.png" alt="YouTube" title="Visit the GMI YouTube Channel" /></a>
                <a target="_blank" href="https://www.facebook.com/pages/Global-Methane-Initiative-GMI/124605893144"><img src="/images/smicons/fb1small.png" alt="Facebook" title="Visit the GMI Facebook page" /></a>
                <a target="_blank" href="http://www.linkedin.com/groups?trk=prof-groups-membership-name&goback=%2Enpv_51708924_*1_*1_*1_*1_*1_*1_*1_*1_*1_*1_*1_*1_*1_*1_*1_*1_*1_*1_*1_*1_*1_*1_*1_*1_*1_*1_*1_*1_*1_*1_*1_*1_*1_nav*4responsive*4tab*4profile_*1&gid=4364745"><img src="/images/smicons/li1small.png" alt="LinkedIn" title="Visit the GMI LinkedIn page" /></a>
                <a target="_blank" href="http://globalmethane.wordpress.com"><img src="/images/smicons/blog1small.png" alt="Methane International Blog" title="Visit the Methane International Blog" /></a>
                <form id="search_form" method="post" action="/advancedSearch.aspx">
                    <input type="hidden" name="cx" value="003308039692091974043:qaknzcsdyy4" />
                    <input type="hidden" name="sitesearch" value="globalmethane.org" />
                    <input type="hidden" name="cof" value="FORID:11;NB:1" />
                    <input type="text" id="searchfield" placeholder="Search by keyword" name="q" value="" /><input type="submit" id="topsearchbutton" value="Search" alt="Search" title="Search" />
                    <!--<input id="topsearchbutton" type="image" src="/images/searchbutton.png" alt="Search" title="Search" />-->
                </form>
            </div>
            
            
            <div class="clear"></div>
            <!-- <br style="clear:both;" /> -->

			<!-- end top content: logo, translate, searches, social media links -->
          </div>  
          <div style="background:#e1e1e1;width:100%;height:50px;text-align:center;font-weight:bold;vertical-align:middle;"><p>DRAFT - Preview only</p></div>

        <br style="clear:both;" />

        <!-- redirect search if empty -->
        <script>
            $('#search_form').submit(function () {
                var x = $('#searchfield').val();
                console.log('Search term:' + x);
                if (x == null || x == "") {
                    $(this).attr('action', "/advancedSearch.aspx");
                }
            }); 
        </script>
        <!-- end -->
        <!-- END dropdown navigation -->
        <!-- END header -->
