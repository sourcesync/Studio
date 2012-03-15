if(window.Event && document.captureEvents)
	document.captureEvents(Event.MOUSEMOVE);
	
document.onmousemove = getMouseMovingPos;

//var total_images = 10;
//var arrMap = [ 1,2,3,4,5,6,7,8,9,10 ];

var total_images = 2;
var arrMap = [ 100,101 ];
var in_zone = false;

var mouse_x;
var mouse_y;

var locationX;
var locationY;

var max_table_right = 0;
//var max_table_right = 555;
var max_table_left = 0;


var left_txt = document.getElementById("left_txt");
var right_txt = document.getElementById("right_txt");

var popup_box = document.getElementById("popup_box");
var popup_box_text = document.getElementById("popup_box_text");
var max_scroll_down = 100;
var text_scroll_speed = 4;
var text_scroll_direction = "";


var image_table_position = 0;

var redbox = '<img src="../images/red_thumb.png" width="60" height="60" border="0" />';

var bulb_glow = '<img src="../images/bulb.gif" border="0" />';
var bulb_static = '<img src="../images/static_bulb.gif" border="0" />';


var tooltip = document.getElementById("tooltip");

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

var CURRENT_URL = "http://www.thenycstudio.com/film/spots2.php";

adjustSharedLinks();

var image_cells = new Array(total_images);
var image_preview = new Array(total_images);

var slide_title = new Array();
var slide_text = new Array();
var slide_info = new Array();
var slide_max_scroll = new Array();


//slide_title.push(" ");
//slide_text.push(" ");
//slide_info.push(" ");
//slide_max_scroll.push(0);

/*
// 1
slide_title.push("'Steenbeckstory'");
slide_text.push('Dir. Marie Dvorakova');
slide_info.push("Born in the Czech Republic, Marie is a graduate of the renowned Prague Film School, FAMU. Following that, she pursued her Master's in Film Directing at the Tisch School of the Arts, NYU. Her narrative/documentary short films were screened and received awards at different film festivals worldwide. <br /> Marie is the recipient of the 16th Annual Student Filmmaker Award by the Director's Guild of America.  She is the 2011 Spike Lee Production Fund Award recipient. <br />Her work was shortlisted at the AICP Show in New York and at the Cannes 2010 Young Directors Award Show. She was awarded the World Bronze Medal at the 2010 International Advertising Awards in Shanghai, as well as 1st Prize at the 2010 Porsche Awards. She was featured in Shoot Magazine as a 2010 New Director To Watch in the ''New Director's Showcase''.");
slide_max_scroll.push(180);


// 2
slide_title.push("'Greenfish'");
slide_text.push('Dir. Marie Dvorakova');
slide_info.push("Born in the Czech Republic, Marie is a graduate of the renowned Prague Film School, FAMU. Following that, she pursued her Master's in Film Directing at the Tisch School of the Arts, NYU. Her narrative/documentary short films were screened and received awards at different film festivals worldwide. <br /> Marie is the recipient of the 16th Annual Student Filmmaker Award by the Director's Guild of America.  She is the 2011 Spike Lee Production Fund Award recipient. <br />Her work was shortlisted at the AICP Show in New York and at the Cannes 2010 Young Directors Award Show. She was awarded the World Bronze Medal at the 2010 International Advertising Awards in Shanghai, as well as 1st Prize at the 2010 Porsche Awards. She was featured in Shoot Magazine as a 2010 New Director To Watch in the ''New Director's Showcase''.");
slide_max_scroll.push(180);


// 3
slide_title.push("'The Bead' trailer");
slide_text.push('Dir. Marie Dvorakova');
slide_info.push("Born in the Czech Republic, Marie is a graduate of the renowned Prague Film School, FAMU. Following that, she pursued her Master's in Film Directing at the Tisch School of the Arts, NYU. Her narrative/documentary short films were screened and received awards at different film festivals worldwide. <br /> Marie is the recipient of the 16th Annual Student Filmmaker Award by the Director's Guild of America.  She is the 2011 Spike Lee Production Fund Award recipient. <br />Her work was shortlisted at the AICP Show in New York and at the Cannes 2010 Young Directors Award Show. She was awarded the World Bronze Medal at the 2010 International Advertising Awards in Shanghai, as well as 1st Prize at the 2010 Porsche Awards. She was featured in Shoot Magazine as a 2010 New Director To Watch in the ''New Director's Showcase''.");
slide_max_scroll.push(180);


// 4
slide_title.push("'Jarmila is Home for Good!' trailer");
slide_text.push('Dir. Marie Dvorakova');
slide_info.push("Born in the Czech Republic, Marie is a graduate of the renowned Prague Film School, FAMU. Following that, she pursued her Master's in Film Directing at the Tisch School of the Arts, NYU. Her narrative/documentary short films were screened and received awards at different film festivals worldwide. <br /> Marie is the recipient of the 16th Annual Student Filmmaker Award by the Director's Guild of America.  She is the 2011 Spike Lee Production Fund Award recipient. <br />Her work was shortlisted at the AICP Show in New York and at the Cannes 2010 Young Directors Award Show. She was awarded the World Bronze Medal at the 2010 International Advertising Awards in Shanghai, as well as 1st Prize at the 2010 Porsche Awards. She was featured in Shoot Magazine as a 2010 New Director To Watch in the ''New Director's Showcase''.");
slide_max_scroll.push(180);


// 5
slide_title.push("'Waiting for Widor' trailer");
slide_text.push('Dir. Marie Dvorakova');
slide_info.push("Born in the Czech Republic, Marie is a graduate of the renowned Prague Film School, FAMU. Following that, she pursued her Master's in Film Directing at the Tisch School of the Arts, NYU. Her narrative/documentary short films were screened and received awards at different film festivals worldwide. <br /> Marie is the recipient of the 16th Annual Student Filmmaker Award by the Director's Guild of America.  She is the 2011 Spike Lee Production Fund Award recipient. <br />Her work was shortlisted at the AICP Show in New York and at the Cannes 2010 Young Directors Award Show. She was awarded the World Bronze Medal at the 2010 International Advertising Awards in Shanghai, as well as 1st Prize at the 2010 Porsche Awards. She was featured in Shoot Magazine as a 2010 New Director To Watch in the ''New Director's Showcase''.");
slide_max_scroll.push(180);


// 6
slide_title.push("'The Wife of Opitz' trailer");
slide_text.push('Dir. Marie Dvorakova');
slide_info.push("Born in the Czech Republic, Marie is a graduate of the renowned Prague Film School, FAMU. Following that, she pursued her Master's in Film Directing at the Tisch School of the Arts, NYU. Her narrative/documentary short films were screened and received awards at different film festivals worldwide. <br /> Marie is the recipient of the 16th Annual Student Filmmaker Award by the Director's Guild of America.  She is the 2011 Spike Lee Production Fund Award recipient. <br />Her work was shortlisted at the AICP Show in New York and at the Cannes 2010 Young Directors Award Show. She was awarded the World Bronze Medal at the 2010 International Advertising Awards in Shanghai, as well as 1st Prize at the 2010 Porsche Awards. She was featured in Shoot Magazine as a 2010 New Director To Watch in the ''New Director's Showcase''.");
slide_max_scroll.push(180);
*/

// 0
slide_title.push("Axe - 'Steps'");
slide_text.push("Walton Isaacson"); //'Eriq Wities');
slide_info.push("Walton Isaacson- Axe - 'Steps'");
slide_max_scroll.push(180);

// 1
slide_title.push("Axe - 'Strange Science'");
slide_text.push('Walton Isaacson');
slide_info.push("Walton Isaacson- Axe - 'Strange Science'");
slide_max_scroll.push(180);


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
//for (i = 1; i < (total_images + 1); i++)
{
	image_cells[i] = document.getElementById(i);
	thidx = arrMap[i];
	image_cells[i].style.backgroundImage =  "url(spots/thumbs/red_preview_" + thidx + ".png)";
	image_preview[i] = '<div id="preview_div" style="background-image:url(spots/' + thidx + '.png); height:281px; width:480px; overflow:hidden;" align="center" onclick="setVideo(\'/film/film\')"><table width="100%" height="100%" border="0" cellspacing="0" cellpadding="0">  <tr> <td align="center" valign="middle"><img src="../images/play.png" width="50" height="50" border="0"/></td>  </tr></table></div>';
	
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
	//for (i = 1; i < (total_images + 1); i++)
	for (ii = 0; ii < (total_images ); ii++)
	{
		image_cells[ii].innerHTML = '&nbsp;';
		tthidx = arrMap[ii];
		if (image_cells[ii].style.backgroundImage == "")
			image_cells[ii].style.backgroundImage =  "url(spots/thumbs/red_preview_" + tthidx + ".png)";
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

        i = theObject.id.toString();
        thidx = arrMap[i];
	
	video_controls.style.visibility = "hidden";
	coverWithRed();
	theObject.style.backgroundImage = "";
	theObject.innerHTML = '<img src="spots/thumbs/preview_' + thidx + '.png" width="107" height="60" border="0" />';
	video_sector.innerHTML = image_preview[i];
	current_slide = thidx;
	adjustSharedLinks();
	
	//popup_box_text.style.top = "0px";
	popup_box_text.innerHTML = slide_info[i];
	max_scroll_down = slide_max_scroll[i];	
	
	left_txt.innerHTML = slide_title[i];
	right_txt.innerHTML = slide_text[i];

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
	coverWithRed();
	var theObject = document.getElementById(slide_number);
	theObject.style.backgroundImage = "";

	i = theObject.id.toString();
	thidx = arrMap[i];

	theObject.innerHTML = '<img src="spots/thumbs/preview_' + thidx + '.png" width="107" height="60" border="0" />';
	video_sector.innerHTML = image_preview[i];
	current_slide = thidx;
	adjustSharedLinks();
	
	popup_box_text.style.top = "0px";
	popup_box_text.innerHTML = slide_info[i];
	max_scroll_down = slide_max_scroll[i];
	
	left_txt.innerHTML = slide_title[i];
	right_txt.innerHTML = slide_text[i];
}




function checker()
{
	if (in_zone)
	{
		image_table_position =  parseInt(image_table.style.right.replace("px", ""));
		getDetails();
		checkBounderies();
	}
	
	
	if (text_scroll_direction != '')
		scrollText();
	
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
	share_email.href = 'mailto:.com?subject=Character Development&body=' + CURRENT_URL + "?slide=" + current_slide;
	share_facebook.href = 'https://www.facebook.com/sharer.php?u=' + CURRENT_URL + "?slide=" + current_slide;
	share_twitter.href = 'https://twitter.com/share?url=' + CURRENT_URL + "?slide=" + current_slide;
	share_delicious.href = 'https://secure.delicious.com/login?jump=' + CURRENT_URL + "?slide=" + current_slide;
	share_stumbleupon.href = 'http://www.stumbleupon.com/submit?url=' + CURRENT_URL + "?slide=" + current_slide;
	share_digg.href = 'http://digg.com/submit?url=' + CURRENT_URL + "?slide=" + current_slide;	
}





function TextDivMoveDirection(new_direction)
{
	text_scroll_direction = new_direction;
} 



function scrollText()
{
	
	if (text_scroll_direction != "")
	{
		
		var y = popup_box_text.style.top.replace("px", "");
		
		if ((text_scroll_direction == 'up') && (y < 0))
		{
			popup_box_text.style.top = (parseInt(y) + text_scroll_speed) + "px";
		} 
		
		
		if ((text_scroll_direction == 'down') && (y > (-1 * max_scroll_down)))
		{
			popup_box_text.style.top = (parseInt(y) - text_scroll_speed) + "px";
		}
		
	}	
}
