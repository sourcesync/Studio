
// By: Saimon Lovell
// ----------------------------------------

var load_images = new Array();
var load_success = 0;
var load_fails = 0;
var load_index = 0;

// Starting from 1
var total_slides = 6;



load_images[load_index++] = "director/1.png";
load_images[load_index++] = "director/2.png";
load_images[load_index++] = "director/3.png";
load_images[load_index++] = "director/4.png";
load_images[load_index++] = "director/5.png";

load_images[load_index++] = "director/6.png";
	
	
load_images[load_index++] = "director/thumbs/preview_1.png";
load_images[load_index++] = "director/thumbs/preview_2.png";
load_images[load_index++] = "director/thumbs/preview_3.png";
load_images[load_index++] = "director/thumbs/preview_4.png";
load_images[load_index++] = "director/thumbs/preview_5.png";

load_images[load_index++] = "director/thumbs/preview_6.png";

	
	
	
	function loadReady()
	{

		var slide = getVariable("slide");
		
		
		if (slide == null)
		{
			previewImageBySlide(1);
		} else {
		
			if (!isNaN(slide))
				if ((slide > 0) && ( slide < 7))
				{
					previewImageBySlide(slide);
							
					checkBounderies();
				} else previewImageBySlide(1);
			
		}
		
		
		

	}



	for (var n = 0; n < load_images.length; n++)
	{
		var img = $('<img />');
		$(img).bind({
			load: function() 
			{
				load_success++;
			},
			error: function() 
			{
				load_fails++;
			}
		});
		
		$(img).attr('src', load_images[n]);	
	}




function waitFinish()
{
	
	if ((load_success + load_fails) == load_images.length)
	{
		if ((load_fails == 1) && (debug_mode))
			alert("Warning!! Failed to load a image");
		
		if ((load_fails > 1) && (debug_mode))
			alert("Warning!! Failed to load " + load_fails + " images");
			
		if(typeof window.loadReady == 'function')		
	  		loadReady();
	}
	else	
		window.setTimeout("waitFinish()", 500);
}

waitFinish();



