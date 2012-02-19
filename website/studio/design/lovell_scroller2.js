var max_table_right = 1700;
var max_table_left = 0;
//var total_images = 19;
var total_images = 32;
var current_slide = -1;
var image_path = "design/";

redbox = '<img src="../images/red_thumb.png" width="64" height="64" border="0" />';
imageLoadingGif = '<img src="../images/loading.gif" alt=" Loading " width="300" height="300" border="0" />';

CURRENT_URL += "studio/design.php";


if(window.Event && document.captureEvents)
	document.captureEvents(Event.MOUSEMOVE);
	
document.onmousemove = getMouseMovingPos;

var in_zone = false;

var mouse_x;
var mouse_y;

var locationX;
var locationY;

//total_images++;
var image_processed = new Array(total_images);
var image_table_position = 0;

var bulb_glow = '<img src="../images/bulb.gif" border="0" />';
var bulb_static = '<img src="../images/static_bulb.gif" border="0" />';

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

var arrMap = new Array(1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32);
	
//"Museum Shop Identity, Designer: Mariana Pariani", 

var slide_text = new Array(
	"Logo/ Hang Tag, Designer: Andrew Reid", //1 //2
	"Martini Poster, Art & Design: Andrew Reid", //2 //5
	"Package Design Srina Tea, Designer: Ray Behar", //3 //10
	"Srina Website Homepage, Designer: Ray Behar", //4 //11
	"Glenfiddich, Momentum WW, Art & Design: Andrew Reid", //5 //15
	"Exodus, Art & Design: Andrew Reid", //6 //17
	"Goulue Logo & Signage, Art & Design: Andrew Reid", //7 //18
	"Srina Logotype Concept, Designer: Ray Behar", //8 //19
	"Srina Label Design", //9
	"Lenox Lounge Site Installation",//10
	"Lenox Lounge Site Installation",//11
	"Lenox Lounge Product Line",//12
	"Belle Glade Library-Etched Glass Design, Andrew Reid", //13
	"Belle Glade Library-Etched Glass Design, Andrew Reid", //14
	"Lenox Lounge Website", //15
	"ABC Infographic", //16
	"ABC Infographic", //17
	"ABC Infographic", //18
	"Self Promotional TShirts", //19
	"Self Promotional TShirts", //20
	"The Global Fund Presentation", //21
	"The Global Fund Presenation", //22
	"Ford Foundation Presentation", //23
	"Ford Foundation Presentation", //24
	"Outten and Golden Webdesign- Ray Behar", //25
	"Room Dividers and Screens- Andrew Reid", //26
	"Room Dividers and Screens- Andrew Reid", //27
	"Room Dividers and Screens- Andrew Reid", //28
	"Site Installation- Red Rocks Amphitheater- Andrew Reid", //29
	"Victory Garden Fence Designs- Andrew Reid", //30
	"Starbucks Cross Platform Marketing", //31
	"Starbucks Cross Platform Marketing" //32
	);
			
/*
	"Essen Corporate Identity, Designer: Mariana Pariani", "Essen Corporate Identity, Designer: Mariana Pariani", "Martini Poster, Art &amp; Design: Andrew Reid", "Carlos Gardel Museum, Designer: Mariana Pariani", "Carlos Gardel Museum, Designer: Mariana Pariani", "Fashion Edition 2010, Designer: Mariana Pariani", "Fashion Edition 2010, Designer: Mariana Pariani", "Package Design Srina Tea, Designer: Ray Behar", "Srina Website Homepage, Designer: Ray Behar", "In Room Brochure, Faena Hotel, Designer: Mariana Pariani", "In Room Brochure, Faena Hotel, Designer: Mariana Pariani", "Identity, Museums of Buenos Aires, Designer: Mariana Pariani", "Glenfiddich, Momentum WW, Art &amp; Design: Andrew Reid", "Identity System for the Museums of Buenos Aires, Mariana Pariani", "Exodus , Art &amp; Design: Andrew Reid", "Goulue Logo &amp; Signage, Art &amp; Design: Andrew Reid", "Srina Logotype Concept, Designer: Ray Behar");
*/

///////////////////////////////////////////////////////////////////
// LOADING

//for (i = 1; i < total_images; i++)
for (i = 0; i < total_images; i++)
{
	thidx = arrMap[i];
	$("#" + i).css("background-image", "url(" + image_path + "thumbs/preview_" + thidx + ".png)");
	image_processed[i] = false;
}

ProcessData();

///////////////////////////////////////////////////////////////////
// TABLE PROCESS

function ProcessData()
{
	//for (i = 1; i < total_images; i++)
	for (i = 0; i < total_images; i++)
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
	i = theObject.id;
	if (current_slide != theObject.id)
	{
		$("#" + current_slide).html(redbox);
		current_slide = theObject.id;
		thidx = arrMap[current_slide];
		$("#" + current_slide).html("");
		$("#preview").html(imageLoadingGif);
		
		if (image_processed[current_slide])
			if ( thidx<10 )
				$("#preview").html('<img src="' + image_path + '0' + thidx + '.png" alt=" Loading " width="428" height="305" border="0" />');
			else
				$("#preview").html('<img src="' + image_path + thidx + '.png" alt=" Loading " width="428" height="305" border="0" />');
		else
		{
			if ( thidx<10 )
				image_post_load.src = image_path + '0' + thidx + '.png';
			else
				image_post_load.src = image_path + thidx + '.png';
			$(image_post_load).load(function() 
			{
				if ( thidx<10 )
					$("#preview").html('<img src="' + image_path + '0' + thidx + '.png" alt=" Loading " width="428" height="305" border="0" />');
				else
					$("#preview").html('<img src="' + image_path + thidx + '.png" alt=" Loading " width="428" height="305" border="0" />');
				image_processed[current_slide] = true;
			});
			
			
			$(image_post_load).error(function() 
			{
   				$("#preview").html('<img src="artists/images/error.png" alt=" Sorry Missing or Corrupted File " width="428" height="305" border="0" />');
  			})


		}
		current_slide = i;	
		txt = slide_text[i];
		$("#slide_data").html(txt);
		adjustSharedLinks();
	}
}


// initial text...
$("#0").html("");
txt = slide_text[0];
$("#slide_data").html(txt);


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
	share_email.href = 'mailto:.com?subject=Character Development&body=' + CURRENT_URL + "?slide=" + current_slide;
	share_facebook.href = 'https://www.facebook.com/sharer.php?u=' + CURRENT_URL + "?slide=" + current_slide;
	share_twitter.href = 'https://twitter.com/share?url=' + CURRENT_URL + "?slide=" + current_slide;
	share_delicious.href = 'https://secure.delicious.com/login?jump=' + CURRENT_URL + "?slide=" + current_slide;
	share_stumbleupon.href = 'http://www.stumbleupon.com/submit?url=' + CURRENT_URL + "?slide=" + current_slide;
	share_digg.href = 'http://digg.com/submit?url=' + CURRENT_URL + "?slide=" + current_slide;	
}
