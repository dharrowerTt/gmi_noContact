<style>
    #search_form{
        margin-left:20px;
    }

    #searchfield{
        width:80%;
    }
</style>
<!-- this is for the google search -->
<%--<script src="https://www.google.com/jsapi"></script>--%>
<script type="text/javascript">

    (function () {
        var cx = '004024884282218175901:agfr5asy4x8';
        var gcse = document.createElement('script'); gcse.type = 'text/javascript'; gcse.async = true;
        gcse.src = (document.location.protocol == 'https:' ? 'https:' : 'http:') +
        '//www.google.com/cse/cse.js?cx=' + cx;
        var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(gcse, s);
    })();
    </script>
<!--
//      CAN GO IN ABOVE SCRIPT!!
//    function parseQueryFromUrl() {
//        var queryParamName = "q";
//        var search = window.location.search.substr(1);
//        var parts = search.split('&');
//        for (var i = 0; i < parts.length; i++) {
//            var keyvaluepair = parts[i].split('=');
//            if (decodeURIComponent(keyvaluepair[0]) == queryParamName) {
//                return decodeURIComponent(keyvaluepair[1].replace(/\+/g, ' '));
//            }
//        }
//        return '';
//    }

//    google.load('search', '1', { language: 'en' });
//    google.setOnLoadCallback(function () {
//        var customSearchOptions = {};
//        var customSearchControl = new google.search.CustomSearchControl(
//              '004024884282218175901:agfr5asy4x8', customSearchOptions);
//        customSearchControl.setResultSetSize(google.search.Search.FILTERED_CSE_RESULTSET);
//        var options = new google.search.DrawOptions();
//        options.enableSearchResultsOnly();
//        customSearchControl.draw('cse', options);
//        var queryFromUrl = parseQueryFromUrl();
//        if (queryFromUrl) {
//            customSearchControl.execute(queryFromUrl);
//        }
//    }, true);
-->


<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9] ->
           <script src="/scripts/dropmenu/html5shiv.min.js" async="async"></script>
           <script src="/scripts/dropmenu/respond.min.js" async="async"></script>
        <![endif]-->
<!-- END -- THIS IS FOR THE DROWNDOWN MENUS -->







                <form id="search_form" method="post" action="/advancedSearch.aspx">
                    <input type="hidden" name="cx" value="003308039692091974043:qaknzcsdyy4" />
                    <input type="hidden" name="sitesearch" value="globalmethane.org" />
                    <input type="hidden" name="cof" value="FORID:11;NB:1" />
                    <input type="text" id="searchfield" placeholder="Search by keyword" name="q" value="" /><input type="submit" id="topsearchbutton" value="Search" alt="Search" title="Search" />
                    <!--<input id="topsearchbutton" type="image" src="/images/searchbutton.png" alt="Search" title="Search" />-->
                </form>
     
            
       
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

