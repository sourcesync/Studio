 /* This source file is proprietary property of Saimon Lovell. Copyright &copy; Fordevelop.com [04/27/2011]
 
	* Author: Simon Lovell
	* Copyright: 2011 Simon Lovell
	* Date: 04/27/2011
	* Updated: 5/6/2011
 */ 






//////////////////////////////////////////////////////////////////////////////////////////////////////////
// Search List
var search_data = new Array();
var search_cell = new Array();

var image_post_load = document.createElement("img");
var imageLoadingGif = '<img src="../../images/loading.gif" alt=" Loading " width="150" height="150" border="0" />';
var redbox = '<img src="../../images/red_thumb.png" width="64" height="64" border="0" />';


// NOTE:
// search_data.push(new Array("<where to go>", "<key word>", "<key word>"));

// 
//search_data.push(new Array("", ""));



// Sarah
search_data.push(new Array("http://studionyc.com/studio/artists/sarah.php", "Sarah Chalek",  "Sarah", "Chalek", "picture", "image", "images", "pictures", "art"));

// Andrew
search_data.push(new Array("http://studionyc.com/studio/artists/andrew.php", "Andrew Reid", "Andrew", "Reid"));

// John H
search_data.push(new Array("http://studionyc.com/studio/artists/john_h.php", "John Holmes", "Holmes"));

// Kurt
search_data.push(new Array("http://studionyc.com/studio/artists/kurt.php", "Kurt Komoda", "Kurt", "Komoda"));

// David
search_data.push(new Array("http://studionyc.com/studio/artists/david.php", "David Lee", "David", "Lee"));

// Adrian
search_data.push(new Array("http://studionyc.com/studio/artists/adrian.php", "Adrian Mateescu", "Adrian", "Mateescu"));

// Anthony
search_data.push(new Array("http://studionyc.com/studio/artists/anthony.php", "Anthony Marte", "Marte", "Anthony"));

// Alyssa
// gw - 2/2012 - removed
//search_data.push(new Array("http://studionyc.com/studio/artists/alyssa.php", "Alyssa Bermudez", "Alyssa", "Bermudez"));

// John Suarez
//gw - 10/4/2011 - removed
//search_data.push(new Array("http://studionyc.com/studio/artists/john_s.php", "John Suarez", "Suarez", "John"));
//gw
//gw - added matt...
search_data.push(new Array("http://studionyc.com/studio/artists/matt.php", "Matt Buck", "Buck", "Matt"));

// 
search_data.push(new Array("http://studionyc.com/studio/artists/philomena.php", "Philomena Marano", "Philomena", "Marano"));




// Reel
search_data.push(new Array("http://studionyc.com/reel.php", "reel", "Reel 2011"));

// Animation
search_data.push(new Array("http://studionyc.com/animation/index.php", "animation", "shorts"));

// Commercial
search_data.push(new Array("http://studionyc.com/animation/commercial.php", "commercial", "Leflein Research: Greenfish", "Leflein Research", "Greenfish", "Chevy Volt", "Chevy", "Tropical Crush", "E-Trade", "etrade", "Holiday Greeting", "Holiday", "Colgate", "Gerber Treatment", "Allstate", "Oreo", "Concerta", "Gerber Treatment", "Gerber", "Srina Tea", "Tea", "Srina", "Tropical"));

// Film 
search_data.push(new Array("http://studionyc.com/film/index.php", "film", "flim", "film reel 2011"));

// DP
search_data.push(new Array("http://studionyc.com/film/dp.php", "dp", "kristina nikolova", "dp reel", "kristina", "nikolova", "FAITH, LOVE AND WHISKEY", "faith", "LOVE AND WHISKEY"));

// Director
search_data.push(new Array("http://studionyc.com/film/director.php", "director", "'Steenbeckstory'   Dir. Marie Dvorakova", "dp reel"));

// About us
search_data.push(new Array("http://studionyc.com/about/index.php", "about", "staff", "employee", "directors", "artists", "designers", "animators", "programmers",  "visual-effects artisans"));

// Community
search_data.push(new Array("http://studionyc.com/about/community.php", "community", "MAILING LIST", "email updates", "join", "Register", "look at this", "website"));

// Contact
search_data.push(new Array("http://studionyc.com/contact/index.php", "contact", "who", "call", "email", "e-mail", "fax", "tel", "mary", "nittolo", "Mary Nittolo", "president", "founder", "Gary Giambalvo", "giambalvo", "garry", "Executive Producer", "Executive", "Producer", "studio", "studionyc.com", "address", "location", "located", "661-1363", "661-1607", "wbenc"));



// Studio
search_data.push(new Array("http://studionyc.com/studio/index.php", "studio", "the studio", "workspace"));


// character development
search_data.push(new Array("http://localhost/TheStudio/studio/character_development.php", "character", "character development", "Flyboys", "The Captain and The Baron from 'Flyboys'", "Fred from 'Snowglobe'", "Fred", "Snowglobe", "Villain from 'Watch Out'", "Villain", "Watch Out", "Billy B", "Billy", "Airhead", "Bessie & Toro", "Bessie", "Toro", "Sleepus Interruptus for Nition Design", "Nition", "Nition Design", "Sleepus Interruptus", "Sleepus", "The Sleep Maestro for Nition Design", "Bather", "Farmer John from Gerber Treatment", "Farmer John", "Gerber Treatment", "Chunky Chips for Chips Ahoy", "Chips", "Chips Ahoy", "cookies", "BinderMan for UPS", "BinderMan", "UPS", "Dhani from 'Landscape Dance'", "Landscape Dance", "Dhani", "Octopus for Mountain Dew", "Octopus", "Mountain Dew", "Cobra", "Wheat Dancers for Wheat Thins", "Wheat Dancers", "Wheat Thins", "Wheat", "George from 'George & Liz'", "George", "Liz"));

// animatics cinematics
search_data.push(new Array("http://studionyc.com/studio/animatics_cinematics.php", "Animatics / Cinematics", "Animatics", "Cinematics", "Animatics Cinematics"));

// technical medical
search_data.push(new Array("http://studionyc.com/studio/technical_medical.php", "Technical/Medical", "Technical", "Medical", "Technical Medical"));

// design
search_data.push(new Array("http://studionyc.com/studio/design.php", "design", "Museum Shop Identity, Designer: Mariana Pariani", "Museum Shop Identity", "Museum", "Mariana Pariani", "Pariani", "Logo/ Hang Tag", "Hang Tag", "Essen", "Martini", "Carlos Gardel", "Carlos", "Gardel", "Fashion", "Ray Behar", "Behar", "Ray", "Brochure", "Faena", "hotel", "Glenfiddich", "Momentum", "Reid", "Glenfiddich, Momentum WW, Art & Design: Andrew Reid", "Exodus", "Goulue"));



// Facebook
search_data.push(new Array("http://www.facebook.com/STUDIONYC", "facebook", "social", "face"));

// Twitter
search_data.push(new Array("http://twitter.com/thestudionyc", "twitter", "twit", "twat", "share"));

// Vimeo
search_data.push(new Array("http://www.vimeo.com/thestudionyc", "vimeo", "vimo"));


		var availableTags = [
			"Animatics","Animatics Cinematics","Airhead","address", "animators","artists","about","Allstate","animation", "Anthony", "Alyssa Bermudez", "Alyssa","Anthony Marte","Adrian","Adrian Mateescu","Andrew","Andrew Reid", "Animatics / Cinematics",
			
			"Bermudez","Billy B", "Billy", "Bessie & Toro", "Bessie","Bather","BinderMan for UPS", "BinderMan", "Behar","Brochure",
			
			"Cinematics","Chalek","commercial","Chevy Volt", "Chevy","Colgate","Concerta","community", "contact","call","character development","Dhani from 'Landscape Dance'","Chunky Chips for Chips Ahoy", "Chips", "Chips Ahoy", "cookies","Cobra","Carlos Gardel", "Carlos", "character",
			
			"David Lee","dp","dp reel","director","dp reel", "directors", "designers",  "David",  "Dhani","design",
			
			"etrade","employee", "email updates","email", "e-mail","Executive Producer","Executive","E-Trade","Essen", "Exodus",
			
			"fax","FAITH, LOVE AND WHISKEY","faith", "founder","Flyboys","Fred from 'Snowglobe'","Fred", "Farmer John","Fashion", "Faena",  "facebook",
			
			"Greenfish","Gerber Treatment", "Gerber Treatment","Gerber","Gary Giambalvo","giambalvo","garry", "Gerber Treatment", "George from 'George & Liz'", "George", "Gardel", "Glenfiddich", "Goulue",
			
			"Holiday Greeting", "Holmes", "Holiday","Hang Tag","hotel",
			
			"John Holmes","John Suarez", "John",  "join", 
			
			"Kurt Komoda","Kurt", "Komoda","kristina nikolova", "kristina",
			
			"Lee","Leflein Research: Greenfish", "Leflein Research", "LOVE AND WHISKEY", "look at this", "location", "located", "Landscape Dance","Liz", "Logo/ Hang Tag",
			
			"Mateescu", "Marte","Marano", "MAILING LIST","mary", "Mary Nittolo", "Mountain Dew","Medical", "Museum Shop Identity", "Museum", "Mariana Pariani","Martini", "Momentum",
			
			"nikolova","nittolo", "Nition", "Nition Design",
			 
			"Oreo","Octopus for Mountain Dew", "Octopus",
			
			"Philomena Marano","Philomena","programmers","president", "Producer","Pariani",

			"Reid", "reel",  "Register","Ray Behar","Ray", "Reid",
			
			"Sarah Chalek",  "Sarah", "Suarez", "shorts", "Srina Tea","Srina",  "staff", "studio", "studionyc.com","Snowglobe", "Sleepus Interruptus", "Sleepus", "social", "share",
			
			"Tropical Crush",  "Tea", "Tropical","tel", "Toro", "Technical/Medical", "Technical", "Technical Medical","twitter",
			
			"UPS",
			 
			"visual-effects artisans",    "Villain from 'Watch Out'", "Villain", "vimeo",
			 
			"website", "who",     "wbenc", "Watch Out", "Wheat Dancers", "Wheat Thins", "Wheat",
           "661-1363", "661-1607",               
		];
		
		
		
		// Don't use search for certain pages
		var found_page = window.location.toString().lastIndexOf("/contact/index.php");
		if (found_page == -1)	found_page = window.location.toString().lastIndexOf("/about/community.php");

		
		if (found_page == -1)
		{
			$( "#search_input" ).autocomplete({	source: availableTags, select: function() {selected_search(false);} });
		
			function selected_search(search_now)
			{
				if (search_input.value != "")
				{
					if (!search_now)
						setTimeout("selected_search(true)", 200);
					else
						searchIt();	
				}
			}			
		}


//////////////////////////////////////////////////////////////////////////////////////////////////////

var debug_mode = true;
var in_search_mode = false;


if (document.getElementById("video_controls"))
	var video_controls = document.getElementById("video_controls");
	
if (document.getElementById("loading_div"))
	var loading_div = document.getElementById("loading_div");	
	
if (document.getElementById("video_sector"))
	var video_sector = document.getElementById("video_sector");
	
if (document.getElementById("popup_box"))
	var popup_box = document.getElementById("popup_box");
	
if (document.getElementById("popup_box_text"))
	var popup_box_text = document.getElementById("popup_box_text");
	

			

var top_section = document.getElementById("top_section");
var mid_section = document.getElementById("mid_section");
var down_section = document.getElementById("down_section");

var right_top_bulb = document.getElementById("right_top_bulb");
var left_top_bulb = document.getElementById("left_top_bulb");

var community = document.getElementById("community");

var root_path = "http://studionyc.com/";
CURRENT_URL = root_path;

var browser_detected = "";
var browser_version = "-1";
var absolute_shift = 0;

var current_slide = 1;

var is_mac = false;
var is_linux = false;
var is_safari = false;
var os_detected = navigator.platform;

if (os_detected.toLowerCase().indexOf("linux") != -1)
{
	os_detected = "linux";
	is_linux = true;
}


if (os_detected.toLowerCase().indexOf("win") != -1)
	os_detected = "windows";


if (os_detected.substr(0, 3) == "Mac")
{
	is_mac = true;
	os_detected = "mac";
}



var cookies_enabled = navigator.cookieEnabled;
var agent = navigator.userAgent.toString();

// Browser Detect (consider ie as primary since over 50% still is ie)
if (/Firefox[\/\s](\d+\.\d+)/.test(agent))  {	browser_detected = "firefox";	browser_version = getFireFoxVersion(); }
if (/MSIE[\/\s](\d+\.\d+)/.test(agent))		{	browser_detected = "ie";		browser_version = getInternetExplorerVersion(); }
if (/Safari[\/\s](\d+\.\d+)/.test(agent))	{	browser_detected = "safari";	is_safari = true;	browser_version = getSafariVersion(); }
if (/Opera[\/\s](\d+\.\d+)/.test(agent))	{	browser_detected = "opera";		browser_version = getOperaVersion(); }
if (/Chrome[\/\s](\d+\.\d+)/.test(agent))	{	browser_detected = "chrome";	browser_version = getChromeVersion(); }

		
///////////////////////////////////////////////////////////

function swapEffect(theObject, newFileSrc)
{
	theObject.src = newFileSrc;	
}


function goto(theUrl)
{
	document.location = theUrl;	
}


function getVariable( name )
{
  name = name.replace(/[\[]/,"\\\[").replace(/[\]]/,"\\\]");
  var regexS = "[\\?&]"+name+"=([^&#]*)";
  var regex = new RegExp( regexS );
  var results = regex.exec( window.location.href );
  if( results == null )
    return null;
  else
    return results[1];
}



// Returns the version of Internet Explorer or a -1
// (indicating the use of another browser).
function getInternetExplorerVersion()
{
  var rv = -1; // Return value assumes failure.
  if (navigator.appName == 'Microsoft Internet Explorer')
  {
    var ua = navigator.userAgent;
    var re  = new RegExp("MSIE ([0-9]{1,}[\.0-9]{0,})");
    if (re.exec(ua) != null)
      rv = parseFloat( RegExp.$1 );
  }
  return rv;
}


function getFireFoxVersion()
{
	var ret = navigator.userAgent;
	ret = ret.substr(ret.lastIndexOf("/") + 1);
	return ret;
}


function getSafariVersion()
{
	var ret = navigator.userAgent;
	ret = ret.substr(ret.lastIndexOf("/") + 1);
	return ret;
}


function getChromeVersion()
{
	var ret = navigator.userAgent;
	ret = ret.substr(ret.lastIndexOf("Chrome"));
	ret = ret.substr(ret.indexOf("/") + 1);
	ret = ret.substr(ret.indexOf(" "));
	ret = ret.substr(ret.indexOf("/") + 1);
	return ret;
}
 
 
function getOperaVersion()
{
	var ret = navigator.userAgent;
	ret = ret.substr(ret.lastIndexOf("/") + 1);
	return ret;
} 





////////////////////////////////
// Search Codes

var search_input = document.getElementById("search_input");
var close_x = document.getElementById("close_x");

function searchNow()
{
	if (!in_search_mode)
	{
		in_search_mode = true;
		search_input.style.visibility = "visible";
		close_x.style.visibility = "visible";
	} else searchIt();
	
}



function activeSearch(theObject)
{
	// Enter
	if (theObject.keyCode == 13)
		searchIt();

	if ((theObject.keyCode == 91) || (theObject.keyCode == 92))
		searchClose();
}




function searchIt()
{
	var info = search_input.value;
	
	if (info != "")
	{
		var info2 = info.replace(" ", "").toLowerCase();

		var new_location = "http://www.google.com/search?q=" + info + "&sitesearch=studionyc.com";
		
		for (var i = 0; i < search_data.length; i++)
		{

			for (var j = 1; j < search_data[i].length; j++)
				if ( info2 == search_data[i][j].replace(" ", "").toLowerCase() )
				{
					new_location = search_data[i][0];
					break;
				}
		}
		
		window.location = new_location;
	}
	else
		searchClose()
}




function searchClose()
{
		in_search_mode = false;
		search_input.style.visibility = "hidden";
		close_x.style.visibility = "hidden";
}





if (browser_detected == "ie")
	alert("This website does not function well in Internet Explorer\nPlease use Chrome, FireFox, Safari or Opera browser");

