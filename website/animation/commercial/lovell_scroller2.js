if(window.Event && document.captureEvents)
	document.captureEvents(Event.MOUSEMOVE);
	
document.onmousemove = getMouseMovingPos;

var total_images = 15;
var arrMap = [ 0,8,1,3,4,5,6,7,2,9,10,12,13,14,17 ];

var in_zone = false;

var mouse_x;
var mouse_y;

var locationX;
var locationY;

var max_table_right = 1120;
var max_table_left = 0;

var image_table_position = 0;

var redbox = '<img src="../images/red_thumb.png" width="60" height="60" border="0" />';


var bulb_glow = '<img src="../images/bulb.gif" border="0" />';
var bulb_static = '<img src="../images/static_bulb.gif" border="0" />';


var tooltip = document.getElementById("tooltip");
var slide_data = document.getElementById("slide_data");

var preview = document.getElementById("mid_section");
var top_bar = document.getElementById("top_section");
var image_table = document.getElementById("image_table");
var text_div = document.getElementById("text_div");


var share_email = document.getElementById("share_email");
var share_facebook = document.getElementById("share_facebook");
var share_twitter = document.getElementById("share_twitter");
var share_delicious = document.getElementById("share_delicious");
var share_stumbleupon = document.getElementById("share_stumbleupon");
var share_digg = document.getElementById("share_digg");

var CURRENT_URL = "http://www.studionyc.com/animation/commercial2.php";

adjustSharedLinks();


var image_cells = new Array(total_images);
var image_preview = new Array(total_images);
var slide_text = new Array("Tribeca Film Institute Trailer", "SSK: Chevy Volt","Leflein Research: Greenfish","Concept Ad: Tropical Crush","Concept Ad: E-Trade","The Studio: Holiday Greeting","VFX: Colgate","VFX: Colgate","Concept Ad: Chevy Volt","DraftFCB: Gerber Treatment","Concept Ad: Allstate","Johnson and Johnson: Concerta","DraftFCB: Gerber Treatment","MPC Global Connect: Srina Tea","Walton Isaacson - 'Success Academy'");


 function getMouseMovingPos(e)
 {
	if (!e)
	var e = window.event||window.Event;
	
	if('undefined'!=typeof e.pageX)
	{
		mouse_x = e.pageX;
		mouse_y = e.pageY;
	}
	else
	{
		mouse_x = e.clientX + document.body.scrollLeft;
		mouse_y = e.clientY + document.body.scrollTop;
	}
 }



function inZone(state)
{
	in_zone = state;
	checkBounderies();
}




for (i = 0; i < (total_images ); i++)
{
	image_cells[i] = document.getElementById(i);
	thidx = arrMap[i];
	image_cells[i].style.backgroundImage =  "url(commercial/thumbs/red_preview_" + thidx + ".png)";
	image_preview[i] = '<div id="preview_div" style="background-image:url(commercial/' + thidx + '.png); height:281px; width:480px; overflow:hidden;" align="center"  onclick="setVideo(\'commercial\')"><table width="100%" height="100%" border="0" cellspacing="0" cellpadding="0">  <tr> <td align="center" valign="middle"></td>  </tr></table></div>';
	
}






function getDetails()
{
		locationX = mouse_x - (top_bar.offsetLeft);
	
		if ((locationX > 300) && (image_table_position < max_table_right))
			rotateRight();
			
		if ((locationX < 123) && (image_table_position > max_table_left))
			rotateLeft();	
}



function rotateRight()
{
	if (locationX > 360)
	{
		if ((image_table_position + 10) < max_table_right)
			image_table.style.right = (image_table_position + 10) + "px";
	}
	else
	{
		if ((image_table_position + 5) < max_table_right)
			image_table.style.right = (image_table_position + 5) + "px";
	}
}


function rotateLeft()
{
	if (locationX < 60)
	{
		if ((image_table_position - 8) > max_table_left)
			image_table.style.right = (image_table_position - 10) + "px";
	}
	else
	{
		if ((image_table_position - 4) > max_table_left)
			image_table.style.right = (image_table_position - 5) + "px";
	}
}



function checkBounderies()
{
	if (image_table_position > max_table_right)	
	{
		image_table_position = max_table_right;
		image_table.style.right = max_table_right + "px";
	}
		
	if (image_table_position < max_table_left)	
	{
		image_table_position = max_table_left;
		image_table.style.right = max_table_left + "px";
	}
		
		
	//////////////////////////////////////////////////////	
	// BULBS	
	////////////////////////////////////////////////////
	
	// Right Side
	if ((image_table_position + 40) > max_table_right)
	{
		if (right_top_bulb.innerHTML != bulb_static)
			right_top_bulb.innerHTML = bulb_static;
	} else {
		if (right_top_bulb.innerHTML != bulb_glow)
			right_top_bulb.innerHTML = bulb_glow;	
	}
	

	// Left Side
	if ((image_table_position - 40) < max_table_left)
	{
		if (left_top_bulb.innerHTML != bulb_static)
			left_top_bulb.innerHTML = bulb_static;
	} else {
		if (left_top_bulb.innerHTML != bulb_glow)
			left_top_bulb.innerHTML = bulb_glow;	
	}
		
	
}




function coverWithRed()
{
	for (i = 0; i < (total_images); i++)
	{
		image_cells[i].innerHTML = '&nbsp;';
		rthidx = arrMap[i];
		if (image_cells[i].style.backgroundImage == "")
			image_cells[i].style.backgroundImage =  "url(commercial/thumbs/red_preview_" + rthidx + ".png)";
	}
}




function previewImage(theObject)
{
	try
	{
		PauseTheVideo();
	}
	catch(err)
	{
	  //Handle errors here
	}
	
	video_controls.style.visibility = "hidden";
	coverWithRed();
	theObject.style.backgroundImage = "";

	//theObject.innerHTML = '<img src="commercial/thumbs/preview_' + theObject.id + '.png" width="107" height="60" border="0" />';
	//video_sector.innerHTML = image_preview[theObject.id];
	//current_slide = theObject.id;
	
	i = theObject.id.toString();
	thidx = arrMap[i];
	theObject.innerHTML = '<img src="commercial/thumbs/preview_' + thidx + '.png" width="107" height="60" border="0" />';
	video_sector.innerHTML = image_preview[i];
	current_slide = thidx;

	slide_data.innerHTML = slide_text[i];
	adjustSharedLinks();
}



function previewImageBySlide(slide_number)
{
	try
	{
		PauseTheVideo();
	}
	catch(err)
	{
	  //Handle errors here
	}

	thidx = arrMap[slide_number];

	//alert('pibs' + slide_number);	
	video_controls.style.visibility = "hidden";
	coverWithRed();
	var theObject = document.getElementById(slide_number);
	theObject.style.backgroundImage = "";
	theObject.innerHTML = '<img src="commercial/thumbs/preview_' + thidx + '.png" width="107" height="60" border="0" />';
	video_sector.innerHTML = image_preview[slide_number];
	current_slide = thidx;
	slide_data.innerHTML = slide_text[slide_number];
	adjustSharedLinks();
}




function checker()
{
	if (in_zone)
	{
		image_table_position =  parseInt(image_table.style.right.replace("px", ""));
		getDetails();
		checkBounderies();
	}
	
	
	window.setTimeout("checker()", 100);	
}

checker();





function ToolTip(theTip)
{
	tooltip.innerHTML = theTip;	
	adjustSharedLinks();
}




function adjustSharedLinks()
{
	share_email.href = 'mailto:.com?subject=Animation Character Development&body=' + CURRENT_URL + "?slide=" + current_slide;
	share_facebook.href = 'https://www.facebook.com/sharer.php?u=' + CURRENT_URL + "?slide=" + current_slide;
	share_twitter.href = 'https://twitter.com/share?url=' + CURRENT_URL + "?slide=" + current_slide;
	share_delicious.href = 'https://secure.delicious.com/login?jump=' + CURRENT_URL + "?slide=" + current_slide;
	share_stumbleupon.href = 'http://www.stumbleupon.com/submit?url=' + CURRENT_URL + "?slide=" + current_slide;
	share_digg.href = 'http://digg.com/submit?url=' + CURRENT_URL + "?slide=" + current_slide;	
}
