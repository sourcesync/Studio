var max_scroll_down = -45;

var bulb_glow = '<img src="../images/bulb.gif" border="0" />';
var bulb_static = '<img src="../images/static_bulb.gif" border="0" />';

var text_scroll_direction = "";
var text_scroll_speed = 2;

var text_div = document.getElementById("text_div");


function checker()
{
	if (text_scroll_direction != '')
		scrollText();
	
	window.setTimeout("checker()", 100);	
}

checker();




function TextDivMoveDirection(new_direction)
{
	text_scroll_direction = new_direction;
}



function scrollText()
{

	if (text_scroll_direction != "")
	{
		
		var y = text_div.style.top.replace("px", "");
		
		
		if ((text_scroll_direction == 'up') && (y < 0))
		{
			text_div.style.top = (parseInt(y) + text_scroll_speed) + "px";
		} 
		
		
		if ((text_scroll_direction == 'down') && (y > max_scroll_down))
		{
			
			text_div.style.top = (parseInt(y) - text_scroll_speed) + "px";
		}
		
	}	
}


