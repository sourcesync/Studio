	var social_done = false;
	var social = document.getElementById("social");
	var thesharebutton = document.getElementById("thesharebutton");
	

	var linkArrays = new Array();	
	var sub_linkArray = new Array();
	var selected_link = new Array();
	
	var menu_left = 22;
	var sub_menu_left = 44;
	
	
	var absolute_shift = 0;
	
	if (os_detected == "mac")
		absolute_shift = 0;


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
	linkArrays["film"].style.top = (170 + absolute_shift) + "px";
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
	linkArrays["studio"].style.top = (256 + absolute_shift) + "px";
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
	linkArrays["about"].style.top = (296 + absolute_shift) + "px";
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
	linkArrays["contact"].style.top = (332 + absolute_shift) + "px";
	linkArrays["contact"].style.left = menu_left + "px";
	linkArrays["contact"].style.visibility = "hidden";
	document.body.appendChild(linkArrays["contact"]);	
	
	
	//////////////////////////////////////////////////////////////////////
	// SUB LINK
	
	sub_linkArray["director"] = document.createElement("img");
	sub_linkArray["director"].setAttribute("src", "../images/links/unselected/sub_links/1.gif");
	sub_linkArray["director"].setAttribute("height", "28");
	sub_linkArray["director"].setAttribute("width", "227");
	sub_linkArray["director"].style.zIndex = 2;
	sub_linkArray["director"].setAttribute("alt", "");
	sub_linkArray["director"].style.position = "absolute";
	sub_linkArray["director"].style.top = (196 + absolute_shift) + "px";
	sub_linkArray["director"].style.left = sub_menu_left + "px";
	sub_linkArray["director"].style.visibility = "hidden";
	document.body.appendChild(sub_linkArray["director"]);	
	
	
	sub_linkArray["dp"] = document.createElement("img");
	sub_linkArray["dp"].setAttribute("src", "../images/links/unselected/sub_links/2.gif");
	sub_linkArray["dp"].setAttribute("height", "28");
	sub_linkArray["dp"].setAttribute("width", "227");
	sub_linkArray["dp"].style.zIndex = 2;
	sub_linkArray["dp"].setAttribute("alt", "");
	sub_linkArray["dp"].style.position = "absolute";
	sub_linkArray["dp"].style.top = (213 + absolute_shift) + "px";
	sub_linkArray["dp"].style.left = sub_menu_left + "px";
	sub_linkArray["dp"].style.visibility = "hidden";
	document.body.appendChild(sub_linkArray["dp"]);	


	///////////////////////////////////
	// SELECTED SUB LINKS
	
	selected_link["film"] = document.createElement("img");
	selected_link["film"].setAttribute("src", "../images/links/selected/1.gif");
	selected_link["film"].setAttribute("height", "28");
	selected_link["film"].setAttribute("width", "250");
	selected_link["film"].style.zIndex = 2;
	selected_link["film"].setAttribute("alt", "");
	selected_link["film"].style.position = "absolute";
	selected_link["film"].style.top = (172 + absolute_shift) + "px";
	selected_link["film"].style.left = menu_left + "px";
	selected_link["film"].style.visibility = "hidden";
	document.body.appendChild(selected_link["film"]);	
	
	
	selected_link["director"] = document.createElement("img");
	selected_link["director"].setAttribute("src", "../images/links/selected/sub_links/1.gif");
	selected_link["director"].setAttribute("height", "28");
	selected_link["director"].setAttribute("width", "227");
	selected_link["director"].style.zIndex = 2;
	selected_link["director"].setAttribute("alt", "");
	selected_link["director"].style.position = "absolute";
	selected_link["director"].style.top = (196 + absolute_shift) + "px";
	selected_link["director"].style.left = sub_menu_left + "px";
	selected_link["director"].style.visibility = "hidden";
	document.body.appendChild(selected_link["director"]);	
	
	
	selected_link["dp"] = document.createElement("img");
	selected_link["dp"].setAttribute("src", "../images/links/selected/sub_links/2.gif");
	selected_link["dp"].setAttribute("height", "28");
	selected_link["dp"].setAttribute("width", "227");
	selected_link["dp"].style.zIndex = 2;
	selected_link["dp"].setAttribute("alt", "");
	selected_link["dp"].style.position = "absolute";
	selected_link["dp"].style.top = (213 + absolute_shift) + "px";
	selected_link["dp"].style.left = sub_menu_left + "px";
	selected_link["dp"].style.visibility = "hidden";
	document.body.appendChild(selected_link["dp"]);

	
	
	
	

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


//////////////////////////////////////////////////////


function animate_selected(linkObject)
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
		social.style.position = "relative";
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
