if(window.Event && document.captureEvents)
	document.captureEvents(Event.MOUSEMOVE);
	
document.onmousemove = getMouseMovingPos;

var video_sector = document.getElementById("video_sector");

var total_images = 8;
var in_zone = false;

var mouse_x;
var mouse_y;

var locationX;
var locationY;

var max_table_right = 395;
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

var CURRENT_URL = "http://www.studionyc.com/animation/index.php";

adjustSharedLinks();


var image_cells = new Array(total_images);
var image_preview = new Array(total_images);
var slide_text = new Array("", "'Snow Globe', Story by Todd Eisner", "'Love Sentence',  Story by Todd Eisner", "'Airhead', Story by Todd Eisner", "'Rocks', Story by Victor DeRespinis", "'Take Me There', Proposal: Philomena Marano", "Bizzywater: Story by Victor DeRespinis, Michael Vicari", "'Loves Me, Loves Me Knot' - Story by Alyssa Bermudez", "'Engard', Story by Victor Derespinis");


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




for (i = 1; i < (total_images + 1); i++)
{
	image_cells[i] = document.getElementById(i);
	image_cells[i].style.backgroundImage =  "url(shorts/thumbs/red_preview_" + i + ".png)";
	image_preview[i] = '<div id="preview_div" style="background-image:url(shorts/' + i + '.png); height:281px; width:480px; overflow:hidden;" align="center" onclick="setVideo(\'shorts\')"><table width="100%" height="100%" border="0" cellspacing="0" cellpadding="0">  <tr> <td align="center" valign="middle"><img src="../images/play.png" width="50" height="50" border="0"/></td>  </tr></table></div>';
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
	for (i = 1; i < (total_images + 1); i++)
	{
		image_cells[i].innerHTML = '&nbsp;';
		if (image_cells[i].style.backgroundImage == "")
			image_cells[i].style.backgroundImage =  "url(shorts/thumbs/red_preview_" + i + ".png)";
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
	loading_div.style.visibility = "hidden";
	
	coverWithRed();
	theObject.style.backgroundImage = "";
	theObject.innerHTML = '<img src="shorts/thumbs/preview_' + theObject.id + '.png" width="107" height="60" border="0" />';
	video_sector.innerHTML = image_preview[theObject.id];
	current_slide = theObject.id;
	slide_data.innerHTML = slide_text[current_slide];
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
	
	video_controls.style.visibility = "hidden";
	loading_div.style.visibility = "hidden";
	
	coverWithRed();
	var theObject = document.getElementById(slide_number);
	theObject.style.backgroundImage = "";
	theObject.innerHTML = '<img src="shorts/thumbs/preview_' + slide_number + '.png" width="107" height="60" border="0" />';
	video_sector.innerHTML = image_preview[slide_number];
	current_slide = slide_number;
	slide_data.innerHTML = slide_text[current_slide];
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
	share_email.href = 'mailto:.com?subject=Animation Shorts&body=' + CURRENT_URL + "?slide=" + current_slide;
	share_facebook.href = 'https://www.facebook.com/sharer.php?u=' + CURRENT_URL + "?slide=" + current_slide;
	share_twitter.href = 'https://twitter.com/share?url=' + CURRENT_URL + "?slide=" + current_slide;
	share_delicious.href = 'https://secure.delicious.com/login?jump=' + CURRENT_URL + "?slide=" + current_slide;
	share_stumbleupon.href = 'http://www.stumbleupon.com/submit?url=' + CURRENT_URL + "?slide=" + current_slide;
	share_digg.href = 'http://digg.com/submit?url=' + CURRENT_URL + "?slide=" + current_slide;	
}
