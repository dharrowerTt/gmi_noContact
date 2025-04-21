var map = AmCharts.makeChart("chartdiv", {
        "type": "map",
        "theme": "light",
        "dataProvider": {
            "map": "worldHigh",
            "zoomLevel": 2,
            "zoomLongitude": 0,
            "zoomLatitude": 15,
            "areas": [

        { "title": "<img src='images/flag_albania.gif'><br />Albania", "id": "AL", "color": "#006600", "customData": "", "groupId": "", "url": "partners/partner.aspx?c=albania", "urltarget": "_blank" },
        { "title": "<img src='images/flag_argentina.gif'><br />Argentina", "id": "AR", "color": "#006600", "customData": "", "groupId": "", "url": "partners/partner.aspx?c=argentina", "urltarget": "_blank" },
        { "title": "<img src='images/flag_australia.gif'><br />Australia", "id": "AU", "color": "#006600", "customData": "", "groupId": "", "url": "partners/partner.aspx?c=australia", "urltarget": "_blank" },
        { "title": "<img src='images/flag_brazil.gif'><br />Brazil", "id": "BR", "color": "#006600", "customData": "", "groupId": "", "url": "partners/partner.aspx?c=brazil", "urltarget": "_blank" },
        { "title": "<img src='images/flag_bulgaria.gif'><br />Bulgaria", "id": "BG", "color": "#006600", "customData": "", "groupId": "", "url": "partners/partner.aspx?c=bulgaria", "urltarget": "_blank" },
        { "title": "<img src='images/flag_canada.gif'><br />Canada", "id": "CA", "color": "#006600", "customData": "", "groupId": "", "url": "partners/partner.aspx?c=canada", "urltarget": "_blank" },
        { "title": "<img src='images/flag_chile.gif'><br />Chile", "id": "CL", "color": "#006600", "customData": "", "groupId": "", "url": "partners/partner.aspx?c=chile", "urltarget": "_blank" },
        { "title": "<img src='images/flag_china.gif'><br />China", "id": "CN", "color": "#006600", "customData": "", "groupId": "", "url": "partners/partner.aspx?c=china", "urltarget": "_blank" },
        { "title": "<img src='images/flag_colombia.gif'><br />Colombia", "id": "CO", "color": "#006600", "customData": "", "groupId": "", "url": "partners/partner.aspx?c=colombia", "urltarget": "_blank" },
        { "title": "<img src='images/flag_ci.gif'><br />Côte d'Ivoire", "id": "CI", "color": "#006600", "customData": "", "groupId": "", "url": "partners/partner.aspx?c=coted'ivoire", "urltarget": "_blank" },
        { "title": "<img src='images/flag_dr.gif'><br />Dominican Republic", "id": "DO", "color": "#006600", "customData": "", "groupId": "", "url": "partners/partner.aspx?c=dom_rep", "urltarget": "_blank" },
        { "title": "<img src='images/flag_ecuador.gif'><br />Ecuador", "id": "EC", "color": "#006600", "customData": "", "groupId": "", "url": "partners/partner.aspx?c=ecuador", "urltarget": "_blank" },
        { "title": "<img src='images/flag_ethiopia.gif'><br />Ethiopia", "id": "ET", "color": "#006600", "customData": "", "groupId": "", "url": "partners/partner.aspx?c=ethiopia", "urltarget": "_blank" },
        { "title": "<img src='images/flag_finland.gif'><br />Finland", "id": "FI", "color": "#006600", "customData": "", "groupId": "", "url": "partners/partner.aspx?c=finland", "urltarget": "_blank" },
        { "title": "<img src='images/flag_georgia.gif'><br />Georgia", "id": "GE", "color": "#006600", "customData": "", "groupId": "", "url": "partners/partner.aspx?c=georgia", "urltarget": "_blank" },
        { "title": "<img src='images/flag_germany.gif'><br />Germany", "id": "DE", "color": "#006600", "customData": "", "groupId": "", "url": "partners/partner.aspx?c=germany", "urltarget": "_blank" },
        { "title": "<img src='images/flag_ghana.gif'><br />Ghana", "id": "GH", "color": "#006600", "customData": "", "groupId": "", "url": "partners/partner.aspx?c=ghana", "urltarget": "_blank" },
        { "title": "<img src='images/flag_india.gif'><br />India", "id": "IN", "color": "#006600", "customData": "", "groupId": "", "url": "partners/partner.aspx?c=india", "urltarget": "_blank" },
        { "title": "<img src='images/flag_indonesia.gif'><br />Indonesia", "id": "ID", "color": "#006600", "customData": "", "groupId": "", "url": "partners/partner.aspx?c=indonesia", "urltarget": "_blank" },
        { "title": "<img src='images/flag_italy.gif'><br />Italy", "id": "IT", "color": "#006600", "customData": "", "groupId": "", "url": "partners/partner.aspx?c=italy", "urltarget": "_blank" },
        { "title": "<img src='images/flag_japan.gif'><br />Japan", "id": "JP", "color": "#006600", "customData": "", "groupId": "", "url": "partners/partner.aspx?c=japan", "urltarget": "_blank" },
        { "title": "<img src='images/flag_jordan.gif'><br />Jordan", "id": "JO", "color": "#006600", "customData": "", "groupId": "", "url": "partners/partner.aspx?c=jordan", "urltarget": "_blank" },
        { "title": "<img src='images/flag_kazakhstan.gif'><br />Kazakhstan", "id": "KZ", "color": "#006600", "customData": "", "groupId": "", "url": "partners/partner.aspx?c=kazakhstan", "urltarget": "_blank" },
        { "title": "<img src='images/flag_mexico.gif'><br />Mexico", "id": "MX", "color": "#006600", "customData": "", "groupId": "", "url": "partners/partner.aspx?c=mexico", "urltarget": "_blank" },
        { "title": "<img src='images/flag_mongolia.gif'><br />Mongolia", "id": "MN", "color": "#006600", "customData": "", "groupId": "", "url": "partners/partner.aspx?c=mongolia", "urltarget": "_blank" },
        { "title": "<img src='images/flag_nicaragua.gif'><br />Nicaragua", "id": "NI", "color": "#006600", "customData": "", "groupId": "", "url": "partners/partner.aspx?c=nicaragua", "urltarget": "_blank" },
        { "title": "<img src='images/flag_nigeria.gif'><br />Nigeria", "id": "NG", "color": "#006600", "customData": "", "groupId": "", "url": "partners/partner.aspx?c=nigeria", "urltarget": "_blank" },
        { "title": "<img src='images/flag_norway.gif'><br />Norway", "id": "NO", "color": "#006600", "customData": "", "groupId": "", "url": "partners/partner.aspx?c=norway", "urltarget": "_blank" },
        { "title": "<img src='images/flag_pakistan.gif'><br />Pakistan", "id": "PK", "color": "#006600", "customData": "", "groupId": "", "url": "partners/partner.aspx?c=pakistan", "urltarget": "_blank" },
        { "title": "<img src='images/flag_peru.gif'><br />Peru", "id": "PE", "color": "#006600", "customData": "", "groupId": "", "url": "partners/partner.aspx?c=peru", "urltarget": "_blank" },
        { "title": "<img src='images/flag_philippines.gif'><br />Philippines", "id": "PH", "color": "#006600", "customData": "", "groupId": "", "url": "partners/partner.aspx?c=philippines", "urltarget": "_blank" },
        { "title": "<img src='images/flag_poland.gif'><br />Poland", "id": "PL", "color": "#006600", "customData": "", "groupId": "", "url": "partners/partner.aspx?c=poland", "urltarget": "_blank" },
        { "title": "<img src='images/flag_korea.gif'><br />Republic of Korea", "id": "KR", "color": "#006600", "customData": "", "groupId": "", "url": "partners/partner.aspx?c=korea", "urltarget": "_blank" },
        { "title": "<img src='images/flag_serbia.gif'><br />Republic of Serbia", "id": "RS", "color": "#006600", "customData": "", "groupId": "", "url": "partners/partner.aspx?c=serbia", "urltarget": "_blank" },
        { "title": "<img src='images/flag_russia.gif'><br />Russia", "id": "RU", "color": "#006600", "customData": "", "groupId": "", "url": "partners/partner.aspx?c=russia", "urltarget": "_blank" },
        { "title": "<img src='images/flag_saudi_arabia.gif'><br />Saudi Arabia", "id": "SA", "color": "#006600", "customData": "", "groupId": "", "url": "partners/partner.aspx?c=saudiarabia", "urltarget": "_blank" },
        { "title": "<img src='images/flag_srilanka.gif'><br />Sri Lanka", "id": "LK", "color": "#006600", "customData": "", "groupId": "", "url": "partners/partner.aspx?c=srilanka", "urltarget": "_blank" },
        { "title": "<img src='images/flag_thailand.gif'><br />Thailand", "id": "TH", "color": "#006600", "customData": "", "groupId": "", "url": "partners/partner.aspx?c=thailand", "urltarget": "_blank" },
        { "title": "<img src='images/flag_turkey.gif'><br />Turkey", "id": "TR", "color": "#006600", "customData": "", "groupId": "", "url": "partners/partner.aspx?c=turkey", "urltarget": "_blank" },
        { "title": "<img src='images/flag_ukraine.gif'><br />Ukraine", "id": "UA", "color": "#006600", "customData": "", "groupId": "", "url": "partners/partner.aspx?c=ukraine", "urltarget": "_blank" },
        { "title": "<img src='images/flag_uk.gif'><br />United Kingdom", "id": "GB", "color": "#006600", "customData": "", "groupId": "", "url": "partners/partner.aspx?c=uk", "urltarget": "_blank" },
        { "title": "<img src='images/flag_us.gif'><br />United States", "id": "US", "color": "#006600", "customData": "", "groupId": "", "url": "partners/partner.aspx?c=us", "urltarget": "_blank" },
        { "title": "<img src='images/flag_vietnam.gif'><br />Vietnam", "id": "VN", "color": "#006600", "customData": "", "groupId": "", "url": "partners/partner.aspx?c=vietnam", "urltarget": "_blank" }

            ]
        },

        "areasSettings": {
            "rollOverOutlineColor": "#FFFFFF",
            "rollOverColor": "#006AB6",
            "alpha": 1,
            "unlistedAreasAlpha": 0.2,
            /*"balloonText": "[[title]] joined EU at [[customData]]"*/
            "balloonText": "[[title]]"
        },


        "legend": {
            "width": "200",
            "marginRight": 27,
            "marginLeft": 27,
            "equalWidths": false,
            "backgroundAlpha": 0.5,
            "backgroundColor": "#FFFFFF",
            "borderColor": "#ffffff",
            "borderAlpha": 1,
            "top": 270,
            "left": 0,
            "horizontalGap": 10,
            "data": [
            {
                "title": "GMI Partner Countries",
                "color": "#006600"
            }]
        },
        "export": {
            "enabled": true
        }

    });