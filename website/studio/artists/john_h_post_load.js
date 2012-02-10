// By: Saimon Lovell
// ----------------------------------------

var load_images = new Array();
var load_success = 0;
var load_fails = 0;
var load_index = 0;

// Starting from 1
var total_slides = 19;



load_images[load_index++] = "images/john_holmes/1.png";
load_images[load_index++] = "images/john_holmes/2.png";
load_images[load_index++] = "images/john_holmes/3.png";
load_images[load_index++] = "images/john_holmes/4.png";
load_images[load_index++] = "images/john_holmes/5.png";

load_images[load_index++] = "images/john_holmes/6.png";
load_images[load_index++] = "images/john_holmes/7.png";
load_images[load_index++] = "images/john_holmes/8.png";
load_images[load_index++] = "images/john_holmes/9.png";
load_images[load_index++] = "images/john_holmes/10.png";


load_images[load_index++] = "images/john_holmes/11.png";
load_images[load_index++] = "images/john_holmes/12.png";
load_images[load_index++] = "images/john_holmes/13.png";
load_images[load_index++] = "images/john_holmes/14.png";
load_images[load_index++] = "images/john_holmes/15.png";

load_images[load_index++] = "images/john_holmes/16.png";
load_images[load_index++] = "images/john_holmes/17.png";
load_images[load_index++] = "images/john_holmes/18.png";
load_images[load_index++] = "images/john_holmes/19.png";
load_images[load_index++] = "images/john_holmes/20.png";




load_images[load_index++] = "images/john_holmes/thumbs/preview_1.png";
load_images[load_index++] = "images/john_holmes/thumbs/preview_2.png";
load_images[load_index++] = "images/john_holmes/thumbs/preview_3.png";
load_images[load_index++] = "images/john_holmes/thumbs/preview_4.png";
load_images[load_index++] = "images/john_holmes/thumbs/preview_5.png";

load_images[load_index++] = "images/john_holmes/thumbs/preview_6.png";
load_images[load_index++] = "images/john_holmes/thumbs/preview_7.png";
load_images[load_index++] = "images/john_holmes/thumbs/preview_8.png";
load_images[load_index++] = "images/john_holmes/thumbs/preview_9.png";
load_images[load_index++] = "images/john_holmes/thumbs/preview_10.png";


load_images[load_index++] = "images/john_holmes/thumbs/preview_11.png";
load_images[load_index++] = "images/john_holmes/thumbs/preview_12.png";
load_images[load_index++] = "images/john_holmes/thumbs/preview_13.png";
load_images[load_index++] = "images/john_holmes/thumbs/preview_14.png";
load_images[load_index++] = "images/john_holmes/thumbs/preview_15.png";

load_images[load_index++] = "images/john_holmes/thumbs/preview_16.png";
load_images[load_index++] = "images/john_holmes/thumbs/preview_17.png";
load_images[load_index++] = "images/john_holmes/thumbs/preview_18.png";
load_images[load_index++] = "images/john_holmes/thumbs/preview_19.png";
load_images[load_index++] = "images/john_holmes/thumbs/preview_20.png";


	
	
	
	function loadReady()
	{
		var slide = getVariable("slide");

		if (slide != null)
		{
			
			if (!isNaN(slide))
			{
				slide = parseInt(slide);
				
				if (slide > total_slides)
					slide = total_slides - 1;
					
				current_slide = slide;	
				
				preview.innerHTML = '<img src="' + load_images[slide - 1] + '" border="0"/>';
				document.getElementById(slide).innerHTML = '<img src="' + load_images[parseInt(slide) + parseInt(total_slides)] + '" border="0"/>';	
			
				
				if ((slide > 7) && (slide < (total_slides - 3)))
					image_table.style.right = parseInt((parseInt(slide) * 52)) + "px";

				// Next last slides
				if (slide > (total_slides - 3))
					image_table.style.right = max_table_right + "px"
					
				checkBounderies();
					
				
			} else {
				preview.innerHTML = '<img src="' + load_images[0] + '" border="0"/>';
				document.getElementById("1").innerHTML = '<img src="' + load_images[total_slides + 1] + '" border="0"/>';
				

			}
		} else {
			
				preview.innerHTML = '<img src="' + load_images[0] + '" border="0"/>';
				document.getElementById("1").innerHTML = '<img src="' + load_images[total_slides + 1] + '" border="0"/>';
				
					
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