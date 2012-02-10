
var load_index = 0;

var load_images = new Array();
load_images[load_index++] = "commercial/thumbs/preview_" + (load_index + 1) + ".png";
load_images[load_index++] = "commercial/thumbs/preview_" + (load_index + 1) + ".png";
load_images[load_index++] = "commercial/thumbs/preview_" + (load_index + 1) + ".png";
load_images[load_index++] = "commercial/thumbs/preview_" + (load_index + 1) + ".png";
load_images[load_index++] = "commercial/thumbs/preview_" + (load_index + 1) + ".png";

load_images[load_index++] = "commercial/thumbs/preview_" + (load_index + 1) + ".png";
load_images[load_index++] = "commercial/thumbs/preview_" + (load_index + 1) + ".png";
load_images[load_index++] = "commercial/thumbs/preview_" + (load_index + 1) + ".png";
load_images[load_index++] = "commercial/thumbs/preview_" + (load_index + 1) + ".png";
load_images[load_index++] = "commercial/thumbs/preview_" + (load_index + 1) + ".png";

load_images[load_index++] = "commercial/thumbs/preview_" + (load_index + 1) + ".png";
load_images[load_index++] = "commercial/thumbs/preview_" + (load_index + 1) + ".png";
load_images[load_index++] = "commercial/thumbs/preview_" + (load_index + 1) + ".png";
load_images[load_index++] = "commercial/thumbs/preview_" + (load_index + 1) + ".png";

load_images[load_index++] = "../images/play.png";
load_images[load_index++] = "../images/loading_video.gif";







var slide = getVariable("slide");

//alert('postslide' + slide);

if (slide == null)
{
	previewImageBySlide(0);
} else {

	if (!isNaN(slide))
		if ((slide > 0) && ( slide < load_index))
		{
			previewImageBySlide(slide);
		
			if ((slide > 4) && (slide < (total_images - 3)))
					image_table.style.right = (slide * 80) + "px";

				// Next last slides
			if (slide > (total_images - 4))
					image_table.style.right = max_table_right + "px"
					
			checkBounderies();
			
			current_slide = slide;
			
		} else { previewImageBySlide(1); current_slide = 1; }
	
}


for (i = 0; i < load_index; i++)
{
	if (load_images[i] != "")
			document.createElement("img").src = load_images[i];
} 


slide_data.innerHTML = slide_text[0];
