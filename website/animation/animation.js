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
		absolute_shift = -2;

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
	linkArrays["film"].style.top = (210 + absolute_shift) + "px";
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
	linkArrays["studio"].style.top = (251 + absolute_shift) + "px";
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
	linkArrays["about"].style.top = (292 + absolute_shift) + "px";
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
	linkArrays["contact"].style.top = (328 + absolute_shift) + "px";
	linkArrays["contact"].style.left = menu_left + "px";
	linkArrays["contact"].style.visibility = "hidden";
	document.body.appendChild(linkArrays["contact"]);	
	
	
	//////////////////////////////////////////////////////////////////////
	// SUB LINK
	
	sub_linkArray["shorts"] = document.createElement("img");
	sub_linkArray["shorts"].setAttribute("src", "../images/links/unselected/sub_links/1.gif");
	sub_linkArray["shorts"].setAttribute("height", "28");
	sub_linkArray["shorts"].setAttribute("width", "227");
	sub_linkArray["shorts"].style.zIndex = 2;
	sub_linkArray["shorts"].setAttribute("alt", "");
	sub_linkArray["shorts"].style.position = "absolute";
	sub_linkArray["shorts"].style.top = (151 + absolute_shift) + "px";
	sub_linkArray["shorts"].style.left = sub_menu_left + "px";
	sub_linkArray["shorts"].style.visibility = "hidden";
	document.body.appendChild(sub_linkArray["shorts"]);	
	
	
	sub_linkArray["commercial"] = document.createElement("img");
	sub_linkArray["commercial"].setAttribute("src", "../images/links/unselected/sub_links/2.gif");
	sub_linkArray["commercial"].setAttribute("height", "28");
	sub_linkArray["commercial"].setAttribute("width", "227");
	sub_linkArray["commercial"].style.zIndex = 2;
	sub_linkArray["commercial"].setAttribute("alt", "");
	sub_linkArray["commercial"].style.position = "absolute";
	sub_linkArray["commercial"].style.top = (169 + absolute_shift) + "px";
	sub_linkArray["commercial"].style.left = sub_menu_left + "px";
	sub_linkArray["commercial"].style.visibility = "hidden";
	document.body.appendChild(sub_linkArray["commercial"]);	


	///////////////////////////////////
	// SELECTED SUB LINKS
	selected_link["shorts"] = document.createElement("img");
	selected_link["shorts"].setAttribute("src", "../images/links/selected/sub_links/1.gif");
	selected_link["shorts"].setAttribute("height", "28");
	selected_link["shorts"].setAttribute("width", "227");
	selected_link["shorts"].style.zIndex = 2;
	selected_link["shorts"].setAttribute("alt", "");
	selected_link["shorts"].style.position = "absolute";
	selected_link["shorts"].style.top = (151 + absolute_shift) + "px";
	selected_link["shorts"].style.left = sub_menu_left + "px";
	selected_link["shorts"].style.visibility = "hidden";
	document.body.appendChild(selected_link["shorts"]);	
	
	
	selected_link["commercial"] = document.createElement("img");
	selected_link["commercial"].setAttribute("src", "../images/links/selected/sub_links/2.gif");
	selected_link["commercial"].setAttribute("height", "28");
	selected_link["commercial"].setAttribute("width", "227");
	selected_link["commercial"].style.zIndex = 2;
	selected_link["commercial"].setAttribute("alt", "");
	selected_link["commercial"].style.position = "absolute";
	selected_link["commercial"].style.top = (169 + absolute_shift) + "px";
	selected_link["commercial"].style.left = sub_menu_left + "px";
	selected_link["commercial"].style.visibility = "hidden";
	document.body.appendChild(selected_link["commercial"]);

	
	
	
	

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
		social.style.position = "relative";
		social.style.left = "-55px";
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
