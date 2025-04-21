// JavaScript Document

function feedwind_show_widget_iframe(params, html) {
    params['rss_feed_frame_width'] = params['rss_feed_frame_width'] ? params['rss_feed_frame_width'] : 180;
    params['rss_feed_frame_height'] = params['rss_feed_frame_height'] ? params['rss_feed_frame_height'] : 500;

    var iframe_width = params['rss_feed_frame_width'];
    var iframe_height = params['rss_feed_frame_height'];

    if (params['rss_feed_border'] != 'off' && !params['rss_feed_css_url']) {
        iframe_width = iframe_width.match(/^\d+%$/) ? iframe_width : parseInt(params['rss_feed_frame_width']) + 2;
        iframe_height = iframe_height.match(/^\d+%$/) ? iframe_height : parseInt(params['rss_feed_frame_height']) + 2;
    }

    if (params['responsive'] == 'on') {
        iframe_width = '100%';
    }

    var scroll_flag = params['rss_feed_item_description_tag'] == 'on_scrollbar' ? 'auto' : 'no';
    scroll_flag = params['autoscroll'] == 'on' ? 'no' : scroll_flag;

    var iframe_height_attr = ' height="' + iframe_height + '" ';
    var iframe_id_attr = '';
    if ('frame_height_by_article' in params && parseInt(params['frame_height_by_article']) != 'NaN' && parseInt(params['frame_height_by_article']) > 0 ) {
      var date = new Date();
      var iframe_id = 'feedwind_' + Math.floor(Math.random()*1000) + date.getTime();
      params['iframe_id'] = iframe_id;
      iframe_id_attr = ' id="' + iframe_id + '" ';
      iframe_height_attr = '';

      function receiveSize(e) {
        if (e.origin === "http://feed.mikle.com" || e.origin === "https://feed.mikle.com") {
          var datas = e.data.split('|');
          if (document.getElementById(datas[0])) {
            document.getElementById(datas[0]).style.height = datas[1];
          }
        }
      }
      if (window.addEventListener) {
        window.addEventListener("message", receiveSize, false);
      } else if (window.attachEvent) {
        window.attachEvent("onmessage", receiveSize, false);
      }
    }

    var url = ('https:' == document.location.protocol ? 'https://' : 'http://') + 'feed.mikle.com/widget/?';
    for (var key in params) {
        if (params[key]) {
            url += key + '=' + encodeURIComponent(params[key]) + '&';
        }
    }

    var iframe = '<iframe ' + iframe_id_attr + iframe_height_attr + ' width="' + iframe_width + '" src="' + url + '" scrolling="' + scroll_flag
        + '" name="rss_feed_frame" marginwidth="0" marginheight="0" vspace="0" hspace="0" frameborder="0"></iframe>';

    if (html) {
        return iframe;
    } else {
        document.write(iframe);
    }
}

(function(){
    var a = window;
    if (a.rss_feed_url && typeof(a.rss_feed_url) == 'string') {
        old_snippet();
    }
    
    function undef_to_nullstr(v) {
        return (v ? v : '');
    }
    
    function old_snippet() {
        var params = {
            rss_feed_url: undef_to_nullstr(a.rss_feed_url),
            rss_feed_frame_width: undef_to_nullstr(a.rss_feed_frame_width),
            rss_feed_frame_height: undef_to_nullstr(a.rss_feed_frame_height),
            rss_feed_target: undef_to_nullstr(a.rss_feed_target),
            rss_feed_font: undef_to_nullstr(a.rss_feed_font),
            rss_feed_font_size: undef_to_nullstr(a.rss_feed_font_size),
            rss_feed_border: undef_to_nullstr(a.rss_feed_border),
            responsive: undef_to_nullstr(a.responsive),
            rss_feed_css_url: (a.rss_feed_css_url == 'http://' ? '' : undef_to_nullstr(a.rss_feed_css_url)),
            text_align: undef_to_nullstr(a.text_align),
            corner: undef_to_nullstr(a.corner),
            autoscroll: undef_to_nullstr(a.autoscroll),
            scrolldirection: undef_to_nullstr(a.scrolldirection),
            scrollstep: undef_to_nullstr(a.scrollstep),
            mcspeed: undef_to_nullstr(a.mcspeed),
            sort: undef_to_nullstr(a.sort),
            rss_feed_title: undef_to_nullstr(a.rss_feed_title),
            rss_feed_title_sentence: undef_to_nullstr(a.rss_feed_title_sentence),
            rss_feed_title_link: (a.rss_feed_title_link == 'http://' ? '' : undef_to_nullstr(a.rss_feed_title_link)),
            rss_feed_title_bgcolor: undef_to_nullstr(a.rss_feed_title_bgcolor),
            rss_feed_title_color: undef_to_nullstr(a.rss_feed_title_color),
            rss_feed_title_bgimage: (a.rss_feed_title_bgimage == 'http://' ? '' : undef_to_nullstr(a.rss_feed_title_bgimage)),
            rss_feed_item_bgcolor: undef_to_nullstr(a.rss_feed_item_bgcolor),
            rss_feed_item_bgimage: (a.rss_feed_item_bgimage == 'http://' ? '' : undef_to_nullstr(a.rss_feed_item_bgimage)),
            rss_feed_item_title_length: undef_to_nullstr(a.rss_feed_item_title_length),
            rss_feed_item_title_color: undef_to_nullstr(a.rss_feed_item_title_color),
            rss_feed_item_border_bottom: undef_to_nullstr(a.rss_feed_item_border_bottom),
            rss_feed_item_description: undef_to_nullstr(a.rss_feed_item_description),
            rss_feed_item_description_length: undef_to_nullstr(a.rss_feed_item_description_length),
            rss_feed_item_description_color: undef_to_nullstr(a.rss_feed_item_description_color),
            rss_feed_item_date: undef_to_nullstr(a.rss_feed_item_date),
            rss_feed_timezone: undef_to_nullstr(a.rss_feed_timezone),
            datetime_format: undef_to_nullstr(a.datetime_format),
            rss_feed_item_description_tag: undef_to_nullstr(a.rss_feed_item_description_tag),
            rss_feed_item_description_image_scaling: undef_to_nullstr(a.rss_feed_item_description_image_scaling),
            rss_feed_item_podcast: undef_to_nullstr(a.rss_feed_item_podcast)
        };
    
        feedwind_show_widget_iframe(params);
        
        a.rss_feed_url = '';
        a.rss_feed_frame_width = '';
        a.rss_feed_frame_height = '';
        a.rss_feed_target = '';
        a.rss_feed_font = '';
        a.rss_feed_font_size = '';
        a.rss_feed_border = '';
        a.responsive = '';
        a.rss_feed_css_url = '';
        a.text_align = '';
        a.corner = '';
        a.scrollbar = '';
        a.autoscroll = '';
        a.scrolldirection = '';
        a.scrollstep = '';
        a.mcspeed = '';
        a.sort = '';
        a.rss_feed_title = '';
        a.rss_feed_title_sentence = '';
        a.rss_feed_title_link = '';
        a.rss_feed_title_bgcolor = '';
        a.rss_feed_title_color = '';
        a.rss_feed_title_bgimage = '';
        a.rss_feed_item_bgcolor = '';
        a.rss_feed_item_bgimage = '';
        a.rss_feed_item_title_length = '';
        a.rss_feed_item_title_color = '';
        a.rss_feed_item_border_bottom = '';
        a.rss_feed_item_description = '';
        a.rss_feed_item_description_length = '';
        a.rss_feed_item_description_color = '';
        a.rss_feed_item_date = '';
        a.rss_feed_timezone = '';
        a.datetime_format = '';
        a.rss_feed_item_description_tag = '';
        a.rss_feed_item_description_image_scaling = '';
        a.rss_feed_item_podcast = '';
    }
})()