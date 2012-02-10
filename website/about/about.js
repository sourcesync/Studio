	var social_done = false;
	var social = document.getElementById("social");
	var thesharebutton = document.getElementById("thesharebutton");

	var linkArrays = new Array("reel", "animation", "film", "studio", "about", "contact");	
	
	var sub_linkArray = new Array("community");
	var selected_link = new Array("about", "community");
	

	var menu_left = 22;
	var sub_menu_left = 44;
	var sub_sub_menu_left = 64;


	/////////////////////////////////////////////////////////////////////////////////////
	// MAIN LINKS
	
	linkArrays["reel"] = document.createElement("img");
	linkArrays["reel"].setAttribute("src", "../images/links/unselected/1.gif");
	linkArrays["reel"].setAttribute("height", "28");
	linkArrays["reel"].setAttribute("width", "250");
	linkArrays["reel"].style.zIndex = 2;
	linkArrays["reel"].setAttribute("alt", "");
	linkArrays["reel"].style.position = "absolute";
	linkArrays["reel"].style.top = (93 + absolute_shift) + "px";
	linkArrays["reel"].style.left = menu_left + "px";
	linkArrays["reel"].style.visibility = "hidden";
	document.body.appendChild(linkArrays["reel"]);
	
	
	linkArrays["animation"] = document.createElement("img");
	linkArrays["animation"].setAttribute("src", "../images/links/unselected/2.gif");
	linkArrays["animation"].setAttribute("height", "28");
	linkArrays["animation"].setAttribute("width", "250");
	linkArrays["animation"].style.zIndex = 2;
	linkArrays["animation"].setAttribute("alt", "");
	linkArrays["animation"].style.position = "absolute";
 	linkArrays["animation"].style.top = (128 + absolute_shift) + "px";	
	linkArrays["animation"].style.left = menu_left + "px";
	linkArrays["animation"].style.visibility = "hidden";
	document.body.appendChild(linkArrays["animation"]);
		
		
	linkArrays["film"] = document.createElement("img");
	linkArrays["film"].setAttribute("src", "../images/links/unselected/3.gif");
	linkArrays["film"].setAttribute("height", "28");
	linkArrays["film"].setAttribute("width", "250");
	linkArrays["film"].style.zIndex = 2;
	linkArrays["film"].setAttribute("alt", "");
	linkArrays["film"].style.position = "absolute";
	linkArrays["film"].style.top = (171 + absolute_shift) + "px";
	linkArrays["film"].style.left = menu_left + "px";
	linkArrays["film"].style.visibility = "hidden";
	document.body.appendChild(linkArrays["film"]);
	
	
	linkArrays["studio"] = document.createElement("img");
	linkArrays["studio"].setAttribute("src", "../images/links/unselected/4.gif");
	linkArrays["studio"].setAttribute("height", "28");
	linkArrays["studio"].setAttribute("width", "250");
	linkArrays["studio"].style.zIndex = 2;
	linkArrays["studio"].setAttribute("alt", "");
	linkArrays["studio"].style.position = "absolute";
	linkArrays["studio"].style.top = (210 + absolute_shift) + "px";
	linkArrays["studio"].style.left = menu_left + "px";
	linkArrays["studio"].style.visibility = "hidden";
	document.body.appendChild(linkArrays["studio"]);
	
	
	linkArrays["about"] = document.createElement("img");
	linkArrays["about"].setAttribute("src", "../images/links/unselected/5.gif");
	linkArrays["about"].setAttribute("height", "28");
	linkArrays["about"].setAttribute("width", "250");
	linkArrays["about"].style.zIndex = 2;
	linkArrays["about"].setAttribute("alt", "");
	linkArrays["about"].style.position = "absolute";
	linkArrays["about"].style.top = (252 + absolute_shift) + "px";
	linkArrays["about"].style.left = menu_left + "px";
	linkArrays["about"].style.visibility = "hidden";
	document.body.appendChild(linkArrays["about"]);	
	
	
	linkArrays["contact"] = document.createElement("img");
	linkArrays["contact"].setAttribute("src", "../images/links/unselected/6.gif");
	linkArrays["contact"].setAttribute("height", "28");
	linkArrays["contact"].setAttribute("width", "250");
	linkArrays["contact"].style.zIndex = 2;
	linkArrays["contact"].setAttribute("alt", "");
	linkArrays["contact"].style.position = "absolute";
	linkArrays["contact"].style.top = (320 + absolute_shift) + "px";
	linkArrays["contact"].style.left = menu_left + "px";
	linkArrays["contact"].style.visibility = "hidden";
	document.body.appendChild(linkArrays["contact"]);	
	
	
		//////////////////////////////////////////////////////////////////////
		// SUB LINKS
		
		sub_linkArray["community"] = document.createElement("img");
		sub_linkArray["community"].setAttribute("src", "../images/links/unselected/sub_links/1.gif");
		sub_linkArray["community"].setAttribute("height", "28");
		sub_linkArray["community"].setAttribute("width", "227");
		sub_linkArray["community"].style.zIndex = 2;
		sub_linkArray["community"].setAttribute("alt", "");
		sub_linkArray["community"].style.position = "absolute";
		sub_linkArray["community"].style.top = (276 + absolute_shift) + "px";
		sub_linkArray["community"].style.left = sub_menu_left + "px";
		sub_linkArray["community"].style.visibility = "hidden";
		document.body.appendChild(sub_linkArray["community"]);		
	
	
	////////////////////////////////////////////////////////////////////////////
	/////// SELECTED SUB SUB LINK
			selected_link["community"] = document.createElement("img");
			selected_link["community"].setAttribute("src", "../images/links/selected/sub_links/1.gif");
			selected_link["community"].setAttribute("height", "28");
			selected_link["community"].setAttribute("width", "227");
			selected_link["community"].style.zIndex = 2;
			selected_link["community"].setAttribute("alt", "");
			selected_link["community"].style.position = "absolute";
			selected_link["community"].style.top = (276 + absolute_shift) + "px";
			selected_link["community"].style.left = sub_menu_left + "px";
			selected_link["community"].style.visibility = "hidden";
			document.body.appendChild(selected_link["community"]);
			

			selected_link["about"] = document.createElement("img");
			selected_link["about"].setAttribute("src", "../images/links/selected/2.gif");
			selected_link["about"].setAttribute("height", "28");
			selected_link["about"].setAttribute("width", "250");
			selected_link["about"].style.zIndex = 2;
			selected_link["about"].setAttribute("alt", "");
			selected_link["about"].style.position = "absolute";
			selected_link["about"].style.top = (252 + absolute_shift) + "px";
			selected_link["about"].style.left = menu_left + "px";
			selected_link["about"].style.visibility = "hidden";
			document.body.appendChild(selected_link["about"]);	
			
	
	

function animate_link(linkObject)
{
	linkArrays[linkObject].setAttribute("src", linkArrays[linkObject].getAttribute("src"));
	linkArrays[linkObject].style.opacity = 1;
	linkArrays[linkObject].style.filter =  "alpha(opacity=100)";
	linkArrays[linkObject].style.visibility = "visible";
}



function hide_link_animation(linkObject, percentage)
{
	percentage -= 25;
	
		linkArrays[linkObject].style.opacity = percentage / 100;
		linkArrays[linkObject].style.filter =  "alpha(opacity=" + percentage + ")";
		
	
	if (percentage > 0)
		setTimeout("hide_link_animation('" + linkObject + "', " + percentage + ");", 100);	
}



//////////////////////////////////////////////////////

function animate_sub_link(linkObject)
{
	sub_linkArray[linkObject].setAttribute("src", sub_linkArray[linkObject].getAttribute("src"));
	sub_linkArray[linkObject].style.opacity = 1;
	sub_linkArray[linkObject].style.filter =  "alpha(opacity=100)";
	sub_linkArray[linkObject].style.visibility = "visible";
}



function hide_sub_link_animation(linkObject, percentage)
{
	percentage -= 25;
	
		sub_linkArray[linkObject].style.opacity = percentage / 100;
		sub_linkArray[linkObject].style.filter =  "alpha(opacity=" + percentage + ")";
		
	
	if (percentage > 0)
		setTimeout("hide_sub_link_animation('" + linkObject + "', " + percentage + ");", 100);	
}



///////////////////////////////////////////////////////////////////////////////////////////////////////////



function animate_selected_sub_link(linkObject)
{
	selected_link[linkObject].setAttribute("src", selected_link[linkObject].getAttribute("src"));
	selected_link[linkObject].style.opacity = 1;
	selected_link[linkObject].style.filter =  "alpha(opacity=100)";
	selected_link[linkObject].style.visibility = "visible";
}



/////////////////////////////////////////////////////

function triggerSocial()
{
	if (!social_done)
	{
		thesharebutton.style.visibility  = "hidden";
		social_done = true;	
		social.style.left = "-60px";
		social.style.visibility = "visible";
		showSocial(0);
	}
}



function showSocial(counter)
{

	counter += 3;
	
		social.style.opacity = counter / 100;
		social.style.filter =  "alpha(opacity=" + counter + ")";

	if (counter < 100)
		setTimeout("showSocial(" + counter + ");", 50);	
}


