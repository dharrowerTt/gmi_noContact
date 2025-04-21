var Begin = new Date();
var Start = Begin.getTime();
//code to attach trackevent code block for document downloads/external links/mailto links  
$(document).ready(function () {
    // Creating custom :external selector
    $.expr[':'].external = function (obj) {
        return !obj.href.match(/^javascript/) && (obj.hostname != location.hostname) && !obj.href.match(/^mailto\:\?/);
    };

    // Add 'external' CSS class to all external links
    $('a:external').addClass('external');
    $('a.external').bind('click', function () {
        var obcat = this.href.match(/^mailto\:/);
        var targeturl = this.href;
        if (obcat) {
            targeturl = targeturl.replace('mailto:', '');
            var End = new Date(); var Stop = End.getTime(); var timeElapse = Math.round((Stop - Start) / 1000);
            _gaq.push(['_trackEvent', 'Emails', 'Click-Event', targeturl, timeElapse, true]);
        } else {
            var targetname = this.text;
            var targetpath = (this.pathname.charAt(0) == "/") ? this.pathname : "/" + this.pathname;
            if (this.search && this.pathname.indexOf(this.search) == -1) targetpath += this.search;
            if (this.hostname != location.host) targetpath = this.hostname + targetpath;
            var isDoc = this.href.match(/\.(?:doc|eps|jpg|png|svg|xls|ppt|pdf|xls|zip|txt|vsd|vxd|js|css|rar|exe|wma|mov|avi|wmv|mp3)($|\&|\?)/);
            if (isDoc) {
                var End = new Date(); var Stop = End.getTime(); var timeElapse = Math.round((Stop - Start) / 1000);
                _gaq.push(['_trackEvent', 'Documents', 'Click-Event', targetpath, timeElapse, true]);
            } else {
                var End = new Date(); var Stop = End.getTime(); var timeElapse = Math.round((Stop - Start) / 1000);
                _gaq.push(['_trackEvent', 'Outbound', targeturl, document.location.href, timeElapse, true]);
            }
        }
    });

    $('a').bind('click', function () {
        var targetname = this.text;
        var targetpath = (this.pathname.charAt(0) == "/") ? this.pathname : "/" + this.pathname;
        if (this.search && this.pathname.indexOf(this.search) == -1) targetpath += this.search;
        if (this.hostname != location.host) targetpath = this.hostname + targetpath;
        var isDoc = this.href.match(/\.(?:doc|docx|eps|jpg|png|svg|xls|ppt|pptx|pdf|xls|xlsx|zip|txt|vsd|vxd|js|css|rar|exe|wma|mov|avi|wmv|mp3)($|\&|\?)/);
        if (isDoc) {
            var End = new Date(); var Stop = End.getTime(); var timeElapse = Math.round((Stop - Start) / 1000);
            _gaq.push(['_trackEvent', 'Documents', 'Click-Event', targetpath, timeElapse, true]);
        }
    });
});