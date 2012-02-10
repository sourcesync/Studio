var max_table_right = 580;
var max_table_left = 0;
var total_images = 15;
var current_slide = 1;
var image_path = "images/matt_buck/";
CURRENT_URL += "studio/artists/matt.php";


if(window.Event && document.captureEvents)
	document.captureEvents(Event.MOUSEMOVE);
	
document.onmousemove = getMouseMovingPos;

var in_zone = false;

var mouse_x;
var mouse_y;

var locationX;
var locationY;

total_images++;
var image_processed = new Array(total_images);
var image_table_position = 0;

var bulb_glow = '<img src="../../images/bulb.gif" border="0" />';
var bulb_static = '<img src="../../images/static_bulb.gif" border="0" />';

var tooltip = document.getElementById("tooltip");


var top_bar = document.getElementById("top_section");
var image_table = document.getElementById("image_table");
var text_div = document.getElementById("text_div");


var share_email = document.getElementById("share_email");
var share_facebook = document.getElementById("share_facebook");
var share_twitter = document.getElementById("share_twitter");
var share_delicious = document.getElementById("share_delicious");
var share_stumbleupon = document.getElementById("share_stumbleupon");
var share_digg = document.getElementById("share_digg");

///////////////////////////////////////////////////////////////////
// LOADING

for (i = 1; i < total_images; i++)
{
	$("#" + i).css("background-image", "url(" + image_path + "thumbs/preview_" + i + ".jpg)");
	image_processed[i] = false;
}

ProcessData();

///////////////////////////////////////////////////////////////////
// TABLE PROCESS

function ProcessData()
{
	for (i = 1; i < total_images; i++)
	{
		if (current_slide == i)
			$("#" + i).html(imageLoadingGif);
		else
			$("#" + i).html(redbox);
	}
}




adjustSharedLinks();

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
		if ((image_table_position - 10) > max_table_left)
			image_table.style.right = (image_table_position - 10) + "px";
	}
	else
	{
		if ((image_table_position - 5) > max_table_left)
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
		
		
		
		
		
		
//////////////////////////////////////////////////////////	
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


////////////////////////////////////////////////////////////////////////////////////////////////
	// Events




function previewImage(theObject)
{
	if (current_slide != theObject.id)
	{
		$("#" + current_slide).html(redbox);
		current_slide = theObject.id;
		$("#" + current_slide).html("");
		$("#preview").html(imageLoadingGif);
		
		if (image_processed[current_slide])
			$("#preview").html('<img src="' + image_path + current_slide + '.png" alt=" Loading " width="428" height="305" border="0" />');
		else
		{
			image_post_load.src = image_path + current_slide + '.png';
			$(image_post_load).load(function() 
			{
				$("#preview").html('<img src="' + image_path + current_slide + '.png" alt=" Loading " width="428" height="305" border="0" />');
				image_processed[current_slide] = true;
			});
			
			
			$(image_post_load).error(function() 
			{
   				$("#preview").html('<img src="images/error.png" alt=" Sorry Missing or Corrupted File " width="428" height="305" border="0" />');
  			})


		}
		
		adjustSharedLinks();
	}
}






////////////////////////////////////////////////////////////////////////////////////////////////////
	// Timers


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





///////////////////////////////////////////////////////////////////////////////////////////////////
	// Other

function ToolTip(theTip)
{
	tooltip.innerHTML = theTip;	
	adjustSharedLinks();
}






function adjustSharedLinks()
{
	share_email.href = 'mailto:.com?subject=Artist Matt Buck&body=' + CURRENT_URL + "?slide=" + current_slide;
	share_facebook.href = 'https://www.facebook.com/sharer.php?u=' + CURRENT_URL + "?slide=" + current_slide;
	share_twitter.href = 'https://twitter.com/share?url=' + CURRENT_URL + "?slide=" + current_slide;
	share_delicious.href = 'https://secure.delicious.com/login?jump=' + CURRENT_URL + "?slide=" + current_slide;
	share_stumbleupon.href = 'http://www.stumbleupon.com/submit?url=' + CURRENT_URL + "?slide=" + current_slide;
	share_digg.href = 'http://digg.com/submit?url=' + CURRENT_URL + "?slide=" + current_slide;	
}

