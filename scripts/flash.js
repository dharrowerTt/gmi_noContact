$(document).ready(function() { //begin jquery



//Flash map
$('#flashmap').flash({
		swf: 'flash/map.swf',
		width: 789,
		height: 397,
		params: {
            wmode: 'transparent'
        }

	});

$('#flashmap2').flash({
		swf: '../flash/map.swf',
		width: 789,
		height: 397,
		params: {
            wmode: 'transparent'
        }

	});

}); //end jquery
