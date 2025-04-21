// JavaScript Document
$(document).ready(function(){
	
	
/*for nav leaf on page*/
// Get rid of "http://"
loc = location.href.substring(7);

// Get rid of domain name
loc = loc.substring(loc.lastIndexOf("/")+1);

// Get rid of fragment identifier
var i = loc.indexOf("#");
//var hash = loc.substring(i, loc.length);
if (i > -1) loc = loc.substring(0, i);

loc = loc.replace(/[^a-z0-9\s]/gi, '.');
// Highlight navigator links to this page
$("nav ul li a[href='" + loc + "']").parent().addClass('on');


// accordion
/*$(".accordion ul").hide();
    //	$(".accordion h3#reportsdiv").addClass("active");
    //	$(".accordion h3#reportsdiv+div").slideDown("slow");
    $(".accordion p").click(function () {
        $(this).next("ul").slideDown("slow").siblings("ul").slideUp("slow");
        $(this).addClass("active");
        $(this).siblings("p").removeClass("active");
    });*/
	
//$(".accordion").each(function () {
//        var $accordion = $(this),
//		$h3 = $accordion.find('p');

//        $accordion.find('ul').hide();
//		$accordion.find('ul li ul').show();

//        if ($('.accordion p').length === 1) {
//            $accordion.find('ul').show();
//        } else {
//            $accordion.find('ul').hide();
//			$accordion.find('ul li ul').show();
//        };
//        
//		$h3.click(function () {
//            var $this = $(this);

//            if ($this.is('.active')) {
//                $this.removeClass('active').next('ul').slideUp('slow');
//            }
//            else {
//                $this.addClass('active').next('ul').slideDown('slow')
//					 	.end()
//			 		.end()
//            }

//            return false;
//        });

//    });	
//	

	
	
	
});