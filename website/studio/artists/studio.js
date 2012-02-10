	var social_done = false;
	var social = document.getElementById("social");
	var thesharebutton = document.getElementById("thesharebutton");

	var linkArrays = new Array();	
	var sub_linkArray = new Array();
	var sub_sub_linkArray = new Array();

	var selected_link = new Array();
	

	var menu_left = 22;
	var sub_menu_left = 44;
	var sub_sub_menu_left = 64;


	/////////////////////////////////////////////////////////////////////////////////////
	// MAIN LINKS
	
	linkArrays["reel"] = document.createElement("img");
	linkArrays["reel"].setAttribute("src", "../../images/links/unselected/1.gif");
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
	linkArrays["animation"].setAttribute("src", "../../images/links/unselected/2.gif");
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
	linkArrays["film"].setAttribute("src", "../../images/links/unselected/3.gif");
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
	linkArrays["studio"].setAttribute("src", "../../images/links/unselected/4.gif");
	linkArrays["studio"].setAttribute("height", "28");
	linkArrays["studio"].setAttribute("width", "250");
	linkArrays["studio"].style.zIndex = 2;
	linkArrays["studio"].setAttribute("alt", "");
	linkArrays["studio"].style.position = "absolute";
	linkArrays["studio"].style.top = (211 + absolute_shift) + "px";
	linkArrays["studio"].style.left = menu_left + "px";
	linkArrays["studio"].style.visibility = "hidden";
	document.body.appendChild(linkArrays["studio"]);
	
	
	linkArrays["about"] = document.createElement("img");
	linkArrays["about"].setAttribute("src", "../../images/links/unselected/5.gif");
	linkArrays["about"].setAttribute("height", "28");
	linkArrays["about"].setAttribute("width", "250");
	linkArrays["about"].style.zIndex = 2;
	linkArrays["about"].setAttribute("alt", "");
	linkArrays["about"].style.position = "absolute";
	// gw moved down...
	//if (is_mac)
	//	linkArrays["about"].style.top = (563 + absolute_shift) + "px";
	//else
	//	linkArrays["about"].style.top = (570 + absolute_shift) + "px";
	if (is_mac)
		linkArrays["about"].style.top = (563 + absolute_shift) + "px";
	else
		linkArrays["about"].style.top = (570 + absolute_shift) + "px";
	linkArrays["about"].style.left = menu_left + "px";
	linkArrays["about"].style.visibility = "hidden";
	document.body.appendChild(linkArrays["about"]);	
	
	
	linkArrays["contact"] = document.createElement("img");
	linkArrays["contact"].setAttribute("src", "../../images/links/unselected/6.gif");
	linkArrays["contact"].setAttribute("height", "28");
	linkArrays["contact"].setAttribute("width", "250");
	linkArrays["contact"].style.zIndex = 2;
	linkArrays["contact"].setAttribute("alt", "");
	linkArrays["contact"].style.position = "absolute";
	// gw moved down...
	//if (is_mac)
	//	linkArrays["contact"].style.top = (598 + absolute_shift) + "px";
	//else
	//	linkArrays["contact"].style.top = (606 + absolute_shift) + "px";
	if (is_mac)
		linkArrays["contact"].style.top = (598 + absolute_shift) + "px";
	else
		linkArrays["contact"].style.top = (606 + absolute_shift) + "px";
	linkArrays["contact"].style.left = menu_left + "px";
	linkArrays["contact"].style.visibility = "hidden";
	document.body.appendChild(linkArrays["contact"]);	
	
	
		//////////////////////////////////////////////////////////////////////
		// SUB LINKS
		
		sub_linkArray["artists"] = document.createElement("img");
		sub_linkArray["artists"].setAttribute("src", "../../images/links/unselected/sub_links/1.gif");
		sub_linkArray["artists"].setAttribute("height", "28");
		sub_linkArray["artists"].setAttribute("width", "227");
		sub_linkArray["artists"].style.zIndex = 2;
		sub_linkArray["artists"].setAttribute("alt", "");
		sub_linkArray["artists"].style.position = "absolute";
		sub_linkArray["artists"].style.top = (233 + absolute_shift) + "px";
		sub_linkArray["artists"].style.left = sub_menu_left + "px";
		sub_linkArray["artists"].style.visibility = "hidden";
		document.body.appendChild(sub_linkArray["artists"]);		
	
	
			//////////////////////////////////////////////////////////////////////
			// SUB SUB LINKS (ARTISTS)
			
			sub_sub_linkArray["sarah"] = document.createElement("img");
			sub_sub_linkArray["sarah"].setAttribute("src", "../../images/links/unselected/sub_sub_links/1.gif");
			sub_sub_linkArray["sarah"].setAttribute("height", "28");
			sub_sub_linkArray["sarah"].setAttribute("width", "205");
			sub_sub_linkArray["sarah"].style.zIndex = 2;
			sub_sub_linkArray["sarah"].setAttribute("alt", "");
			sub_sub_linkArray["sarah"].style.position = "absolute";
			if (is_mac)
				sub_sub_linkArray["sarah"].style.top = (255 + absolute_shift) + "px";
			else
				sub_sub_linkArray["sarah"].style.top = (257 + absolute_shift) + "px";
			sub_sub_linkArray["sarah"].style.left = sub_sub_menu_left + "px";
			sub_sub_linkArray["sarah"].style.visibility = "hidden";
			document.body.appendChild(sub_sub_linkArray["sarah"]);
			
			
			sub_sub_linkArray["andrew"] = document.createElement("img");
			sub_sub_linkArray["andrew"].setAttribute("src", "../../images/links/unselected/sub_sub_links/2.gif");
			sub_sub_linkArray["andrew"].setAttribute("height", "28");
			sub_sub_linkArray["andrew"].setAttribute("width", "205");
			sub_sub_linkArray["andrew"].style.zIndex = 2;
			sub_sub_linkArray["andrew"].setAttribute("alt", "");
			sub_sub_linkArray["andrew"].style.position = "absolute";
			if (is_mac)
				sub_sub_linkArray["andrew"].style.top = (275 + absolute_shift) + "px";
			else
				sub_sub_linkArray["andrew"].style.top = (277 + absolute_shift) + "px";
			sub_sub_linkArray["andrew"].style.left = sub_sub_menu_left + "px";
			sub_sub_linkArray["andrew"].style.visibility = "hidden";
			document.body.appendChild(sub_sub_linkArray["andrew"]);
			
			
			sub_sub_linkArray["john_h"] = document.createElement("img");
			sub_sub_linkArray["john_h"].setAttribute("src", "../../images/links/unselected/sub_sub_links/3.gif");
			sub_sub_linkArray["john_h"].setAttribute("height", "28");
			sub_sub_linkArray["john_h"].setAttribute("width", "205");
			sub_sub_linkArray["john_h"].style.zIndex = 2;
			sub_sub_linkArray["john_h"].setAttribute("alt", "");
			sub_sub_linkArray["john_h"].style.position = "absolute";
			if (is_mac)
				sub_sub_linkArray["john_h"].style.top = (294 + absolute_shift) + "px";
			else
				sub_sub_linkArray["john_h"].style.top = (296 + absolute_shift) + "px";
			sub_sub_linkArray["john_h"].style.left = sub_sub_menu_left + "px";
			sub_sub_linkArray["john_h"].style.visibility = "hidden";
			document.body.appendChild(sub_sub_linkArray["john_h"]);
			
			
			sub_sub_linkArray["kurt"] = document.createElement("img");
			sub_sub_linkArray["kurt"].setAttribute("src", "../../images/links/unselected/sub_sub_links/4.gif");
			sub_sub_linkArray["kurt"].setAttribute("height", "28");
			sub_sub_linkArray["kurt"].setAttribute("width", "205");
			sub_sub_linkArray["kurt"].style.zIndex = 2;
			sub_sub_linkArray["kurt"].setAttribute("alt", "");
			sub_sub_linkArray["kurt"].style.position = "absolute";
			if (is_mac)
				sub_sub_linkArray["kurt"].style.top = (315 + absolute_shift) + "px";
			else
				sub_sub_linkArray["kurt"].style.top = (318 + absolute_shift) + "px";
			sub_sub_linkArray["kurt"].style.left = sub_sub_menu_left + "px";
			sub_sub_linkArray["kurt"].style.visibility = "hidden";
			document.body.appendChild(sub_sub_linkArray["kurt"]);
			
			
			sub_sub_linkArray["david"] = document.createElement("img");
			sub_sub_linkArray["david"].setAttribute("src", "../../images/links/unselected/sub_sub_links/5.gif");
			sub_sub_linkArray["david"].setAttribute("height", "28");
			sub_sub_linkArray["david"].setAttribute("width", "205");
			sub_sub_linkArray["david"].style.zIndex = 2;
			sub_sub_linkArray["david"].setAttribute("alt", "");
			sub_sub_linkArray["david"].style.position = "absolute";
			if (is_mac)
				sub_sub_linkArray["david"].style.top = (334 + absolute_shift) + "px";
			else
				sub_sub_linkArray["david"].style.top = (338 + absolute_shift) + "px";
			sub_sub_linkArray["david"].style.left = sub_sub_menu_left + "px";
			sub_sub_linkArray["david"].style.visibility = "hidden";
			document.body.appendChild(sub_sub_linkArray["david"]);	
			
			
			sub_sub_linkArray["adrian"] = document.createElement("img");
			sub_sub_linkArray["adrian"].setAttribute("src", "../../images/links/unselected/sub_sub_links/6.gif");
			sub_sub_linkArray["adrian"].setAttribute("height", "28");
			sub_sub_linkArray["adrian"].setAttribute("width", "205");
			sub_sub_linkArray["adrian"].style.zIndex = 2;
			sub_sub_linkArray["adrian"].setAttribute("alt", "");
			sub_sub_linkArray["adrian"].style.position = "absolute";
			if (is_mac)
				sub_sub_linkArray["adrian"].style.top = (352 + absolute_shift) + "px";
			else
				sub_sub_linkArray["adrian"].style.top = (358 + absolute_shift) + "px";
			sub_sub_linkArray["adrian"].style.left = sub_sub_menu_left + "px";
			sub_sub_linkArray["adrian"].style.visibility = "hidden";
			document.body.appendChild(sub_sub_linkArray["adrian"]);		
			
			
			sub_sub_linkArray["anthony"] = document.createElement("img");
			sub_sub_linkArray["anthony"].setAttribute("src", "../../images/links/unselected/sub_sub_links/7.gif");
			sub_sub_linkArray["anthony"].setAttribute("height", "28");
			sub_sub_linkArray["anthony"].setAttribute("width", "205");
			sub_sub_linkArray["anthony"].style.zIndex = 2;
			sub_sub_linkArray["anthony"].setAttribute("alt", "");
			sub_sub_linkArray["anthony"].style.position = "absolute";
			if (is_mac)
				sub_sub_linkArray["anthony"].style.top = (371 + absolute_shift) + "px";
			else
				sub_sub_linkArray["anthony"].style.top = (378 + absolute_shift) + "px";
			sub_sub_linkArray["anthony"].style.left = sub_sub_menu_left + "px";
			sub_sub_linkArray["anthony"].style.visibility = "hidden";
			document.body.appendChild(sub_sub_linkArray["anthony"]);
		
			/*	
			sub_sub_linkArray["alyssa"] = document.createElement("img");
			sub_sub_linkArray["alyssa"].setAttribute("src", "../../images/links/unselected/sub_sub_links/8.gif");
			sub_sub_linkArray["alyssa"].setAttribute("height", "28");
			sub_sub_linkArray["alyssa"].setAttribute("width", "205");
			sub_sub_linkArray["alyssa"].style.zIndex = 2;
			sub_sub_linkArray["alyssa"].setAttribute("alt", "");
			sub_sub_linkArray["alyssa"].style.position = "absolute";
			if (is_mac)
				sub_sub_linkArray["alyssa"].style.top = (390 + absolute_shift) + "px";
			else
				sub_sub_linkArray["alyssa"].style.top = (397 + absolute_shift) + "px";
			sub_sub_linkArray["alyssa"].style.left = sub_sub_menu_left + "px";
			sub_sub_linkArray["alyssa"].style.visibility = "hidden";
			document.body.appendChild(sub_sub_linkArray["alyssa"]);		
			*/
	
			/* gw - 10/4/2011 - removed	
			sub_sub_linkArray["john_s"] = document.createElement("img");
			sub_sub_linkArray["john_s"].setAttribute("src", "../../images/links/unselected/sub_sub_links/9.gif");
			sub_sub_linkArray["john_s"].setAttribute("height", "28");
			sub_sub_linkArray["john_s"].setAttribute("width", "205");
			sub_sub_linkArray["john_s"].style.zIndex = 2;
			sub_sub_linkArray["john_s"].setAttribute("alt", "");
			sub_sub_linkArray["john_s"].style.position = "absolute";
			if (is_mac)
				sub_sub_linkArray["john_s"].style.top = (410 + absolute_shift) + "px";
			else
				sub_sub_linkArray["john_s"].style.top = (417 + absolute_shift) + "px";
			sub_sub_linkArray["john_s"].style.left = sub_sub_menu_left + "px";
			sub_sub_linkArray["john_s"].style.visibility = "hidden";
			document.body.appendChild(sub_sub_linkArray["john_s"]);		
			*/								

			/* gw - 10/5/2011 - added matt */
			sub_sub_linkArray["matt"] = document.createElement("img");
			sub_sub_linkArray["matt"].setAttribute("src", "../../images/links/unselected/sub_sub_links/9.gif");
			sub_sub_linkArray["matt"].setAttribute("height", "28");
			sub_sub_linkArray["matt"].setAttribute("width", "205");
			sub_sub_linkArray["matt"].style.zIndex = 2;
			sub_sub_linkArray["matt"].setAttribute("alt", "");
			sub_sub_linkArray["matt"].style.position = "absolute";
			if (is_mac)
				sub_sub_linkArray["matt"].style.top = (390 + absolute_shift) + "px";
			else
				sub_sub_linkArray["matt"].style.top = (397 + absolute_shift) + "px";
			sub_sub_linkArray["matt"].style.left = sub_sub_menu_left + "px";
			sub_sub_linkArray["matt"].style.visibility = "hidden";
			document.body.appendChild(sub_sub_linkArray["matt"]);		
			
			/* gw - 10/5/2011 - added michael */	
			sub_sub_linkArray["michael"] = document.createElement("img");
			sub_sub_linkArray["michael"].setAttribute("src", "../../images/links/unselected/sub_sub_links/9.gif");
			sub_sub_linkArray["michael"].setAttribute("height", "28");
			sub_sub_linkArray["michael"].setAttribute("width", "205");
			sub_sub_linkArray["michael"].style.zIndex = 2;
			sub_sub_linkArray["michael"].setAttribute("alt", "");
			sub_sub_linkArray["michael"].style.position = "absolute";
			if (is_mac)
				sub_sub_linkArray["michael"].style.top = (410 + absolute_shift) + "px";
			else
				sub_sub_linkArray["michael"].style.top = (417 + absolute_shift) + "px";
			sub_sub_linkArray["michael"].style.left = sub_sub_menu_left + "px";
			sub_sub_linkArray["michael"].style.visibility = "hidden";
			document.body.appendChild(sub_sub_linkArray["michael"]);		
	
			sub_sub_linkArray["philomena"] = document.createElement("img");
			sub_sub_linkArray["philomena"].setAttribute("src", "../../images/links/unselected/sub_sub_links/10.gif");
			sub_sub_linkArray["philomena"].setAttribute("height", "28");
			sub_sub_linkArray["philomena"].setAttribute("width", "205");
			sub_sub_linkArray["philomena"].style.zIndex = 2;
			sub_sub_linkArray["philomena"].setAttribute("alt", "");
			sub_sub_linkArray["philomena"].style.position = "absolute";
			// gw moved down	
			//if (is_mac)
			//	sub_sub_linkArray["philomena"].style.top = (430 + absolute_shift) + "px";
			//else
			//	sub_sub_linkArray["philomena"].style.top = (438 + absolute_shift) + "px";
			if (is_mac)
				sub_sub_linkArray["philomena"].style.top = (430 + absolute_shift) + "px";
			else
				sub_sub_linkArray["philomena"].style.top = (438 + absolute_shift) + "px";
			sub_sub_linkArray["philomena"].style.left = sub_sub_menu_left + "px";
			sub_sub_linkArray["philomena"].style.visibility = "hidden";
			document.body.appendChild(sub_sub_linkArray["philomena"]);																			
	
		//////////////////////////////////////////////////////////////////////
		// SUB LINKS
		
		sub_linkArray["character_development"] = document.createElement("img");
		sub_linkArray["character_development"].setAttribute("src", "../../images/links/unselected/sub_links/1.gif");
		sub_linkArray["character_development"].setAttribute("height", "28");
		sub_linkArray["character_development"].setAttribute("width", "227");
		sub_linkArray["character_development"].style.zIndex = 2;
		sub_linkArray["character_development"].setAttribute("alt", "");
		sub_linkArray["character_development"].style.position = "absolute";
		// gw moved down
		//if (is_mac)
		//	sub_linkArray["character_development"].style.top = (454 + absolute_shift) + "px";
		//else
		//	sub_linkArray["character_development"].style.top = (461 + absolute_shift) + "px";
		if (is_mac)
			sub_linkArray["character_development"].style.top = (451 + absolute_shift) + "px";
		else
			sub_linkArray["character_development"].style.top = (458 + absolute_shift) + "px";
		sub_linkArray["character_development"].style.left = sub_menu_left + "px";
		sub_linkArray["character_development"].style.visibility = "hidden";
		document.body.appendChild(sub_linkArray["character_development"]);	
		
		
		sub_linkArray["animatics_cinematics"] = document.createElement("img");
		sub_linkArray["animatics_cinematics"].setAttribute("src", "../../images/links/unselected/sub_links/2.gif");
		sub_linkArray["animatics_cinematics"].setAttribute("height", "28");
		sub_linkArray["animatics_cinematics"].setAttribute("width", "227");
		sub_linkArray["animatics_cinematics"].style.zIndex = 2;
		sub_linkArray["animatics_cinematics"].setAttribute("alt", "");
		sub_linkArray["animatics_cinematics"].style.position = "absolute";
		// gw moved down
		//if (is_mac)
		//	sub_linkArray["animatics_cinematics"].style.top = (474 + absolute_shift) + "px";
		//else
		//	sub_linkArray["animatics_cinematics"].style.top = (482 + absolute_shift) + "px";
		if (is_mac)
			sub_linkArray["animatics_cinematics"].style.top = (474 + absolute_shift) + "px";
		else
			sub_linkArray["animatics_cinematics"].style.top = (482 + absolute_shift) + "px";
		sub_linkArray["animatics_cinematics"].style.left = sub_menu_left + "px";
		sub_linkArray["animatics_cinematics"].style.visibility = "hidden";
		document.body.appendChild(sub_linkArray["animatics_cinematics"]);	
		
		
		sub_linkArray["technical_medical"] = document.createElement("img");
		sub_linkArray["technical_medical"].setAttribute("src", "../../images/links/unselected/sub_links/3.gif");
		sub_linkArray["technical_medical"].setAttribute("height", "28");
		sub_linkArray["technical_medical"].setAttribute("width", "227");
		sub_linkArray["technical_medical"].style.zIndex = 2;
		sub_linkArray["technical_medical"].setAttribute("alt", "");
		sub_linkArray["technical_medical"].style.position = "absolute";
		// gw moved down
		//if (is_mac)
		//	sub_linkArray["technical_medical"].style.top = (495 + absolute_shift) + "px";
		//else
		//	sub_linkArray["technical_medical"].style.top = (502 + absolute_shift) + "px";
		if (is_mac)
			sub_linkArray["technical_medical"].style.top = (495 + absolute_shift) + "px";
		else
			sub_linkArray["technical_medical"].style.top = (502 + absolute_shift) + "px";
		sub_linkArray["technical_medical"].style.left = sub_menu_left + "px";
		sub_linkArray["technical_medical"].style.visibility = "hidden";
		document.body.appendChild(sub_linkArray["technical_medical"]);				
		
	
		sub_linkArray["design"] = document.createElement("img");
		sub_linkArray["design"].setAttribute("src", "../../images/links/unselected/sub_links/4.gif");
		sub_linkArray["design"].setAttribute("height", "28");
		sub_linkArray["design"].setAttribute("width", "227");
		sub_linkArray["design"].style.zIndex = 2;
		sub_linkArray["design"].setAttribute("alt", "");
		sub_linkArray["design"].style.position = "absolute";
		// gw moved down
		//if (is_mac)
		//	sub_linkArray["design"].style.top = (518 + absolute_shift) + "px";
		//else
		//	sub_linkArray["design"].style.top = (524 + absolute_shift) + "px";
		if (is_mac)
			sub_linkArray["design"].style.top = (518 + absolute_shift) + "px";
		else
			sub_linkArray["design"].style.top = (524 + absolute_shift) + "px";
		sub_linkArray["design"].style.left = sub_menu_left + "px";
		sub_linkArray["design"].style.visibility = "hidden";
		document.body.appendChild(sub_linkArray["design"]);	


	
	
	////////////////////////////////////////////////////////////////////////////
	/////// SELECTED SUB SUB LINK
			selected_link["sarah"] = document.createElement("img");
			selected_link["sarah"].setAttribute("src", "../../images/links/selected/sub_sub_links/1.gif");
			selected_link["sarah"].setAttribute("height", "28");
			selected_link["sarah"].setAttribute("width", "205");
			selected_link["sarah"].style.zIndex = 2;
			selected_link["sarah"].setAttribute("alt", "");
			selected_link["sarah"].style.position = "absolute";
			if (is_mac)
				selected_link["sarah"].style.top = (255 + absolute_shift) + "px";
			else
				selected_link["sarah"].style.top = (257 + absolute_shift) + "px";
			selected_link["sarah"].style.left = sub_sub_menu_left + "px";
			selected_link["sarah"].style.visibility = "hidden";
			document.body.appendChild(selected_link["sarah"]);
			
			
			selected_link["andrew"] = document.createElement("img");
			selected_link["andrew"].setAttribute("src", "../../images/links/selected/sub_sub_links/2.gif");
			selected_link["andrew"].setAttribute("height", "28");
			selected_link["andrew"].setAttribute("width", "205");
			selected_link["andrew"].style.zIndex = 2;
			selected_link["andrew"].setAttribute("alt", "");
			selected_link["andrew"].style.position = "absolute";
			if (is_mac)
				selected_link["andrew"].style.top = (275 + absolute_shift) + "px";
			else
				selected_link["andrew"].style.top = (277 + absolute_shift) + "px";
			selected_link["andrew"].style.left = sub_sub_menu_left + "px";
			selected_link["andrew"].style.visibility = "hidden";
			document.body.appendChild(selected_link["andrew"]);
			
			
			selected_link["john_h"] = document.createElement("img");
			selected_link["john_h"].setAttribute("src", "../../images/links/selected/sub_sub_links/3.gif");
			selected_link["john_h"].setAttribute("height", "28");
			selected_link["john_h"].setAttribute("width", "205");
			selected_link["john_h"].style.zIndex = 2;
			selected_link["john_h"].setAttribute("alt", "");
			selected_link["john_h"].style.position = "absolute";
			if (is_mac)
				selected_link["john_h"].style.top = (294 + absolute_shift) + "px";
			else
				selected_link["john_h"].style.top = (296 + absolute_shift) + "px";
			selected_link["john_h"].style.left = sub_sub_menu_left + "px";
			selected_link["john_h"].style.visibility = "hidden";
			document.body.appendChild(selected_link["john_h"]);
			
			
			selected_link["kurt"] = document.createElement("img");
			selected_link["kurt"].setAttribute("src", "../../images/links/selected/sub_sub_links/4.gif");
			selected_link["kurt"].setAttribute("height", "28");
			selected_link["kurt"].setAttribute("width", "205");
			selected_link["kurt"].style.zIndex = 2;
			selected_link["kurt"].setAttribute("alt", "");
			selected_link["kurt"].style.position = "absolute";
			if (is_mac)
				selected_link["kurt"].style.top = (315 + absolute_shift) + "px";
			else
				selected_link["kurt"].style.top = (318 + absolute_shift) + "px";
			selected_link["kurt"].style.left = sub_sub_menu_left + "px";
			selected_link["kurt"].style.visibility = "hidden";
			document.body.appendChild(selected_link["kurt"]);
			
			
			selected_link["david"] = document.createElement("img");
			selected_link["david"].setAttribute("src", "../../images/links/selected/sub_sub_links/5.gif");
			selected_link["david"].setAttribute("height", "28");
			selected_link["david"].setAttribute("width", "205");
			selected_link["david"].style.zIndex = 2;
			selected_link["david"].setAttribute("alt", "");
			selected_link["david"].style.position = "absolute";
			if (is_mac)
				selected_link["david"].style.top = (334 + absolute_shift) + "px";
			else
				selected_link["david"].style.top = (338 + absolute_shift) + "px";
			selected_link["david"].style.left = sub_sub_menu_left + "px";
			selected_link["david"].style.visibility = "hidden";
			document.body.appendChild(selected_link["david"]);	
			
			
			selected_link["adrian"] = document.createElement("img");
			selected_link["adrian"].setAttribute("src", "../../images/links/selected/sub_sub_links/6.gif");
			selected_link["adrian"].setAttribute("height", "28");
			selected_link["adrian"].setAttribute("width", "205");
			selected_link["adrian"].style.zIndex = 2;
			selected_link["adrian"].setAttribute("alt", "");
			selected_link["adrian"].style.position = "absolute";
			if (is_mac)
				selected_link["adrian"].style.top = (352 + absolute_shift) + "px";
			else
				selected_link["adrian"].style.top = (358 + absolute_shift) + "px";
			selected_link["adrian"].style.left = sub_sub_menu_left + "px";
			selected_link["adrian"].style.visibility = "hidden";
			document.body.appendChild(selected_link["adrian"]);		
			
			
			selected_link["anthony"] = document.createElement("img");
			selected_link["anthony"].setAttribute("src", "../../images/links/selected/sub_links/7.gif");
			selected_link["anthony"].setAttribute("height", "28");
			selected_link["anthony"].setAttribute("width", "205");
			selected_link["anthony"].style.zIndex = 2;
			selected_link["anthony"].setAttribute("alt", "");
			selected_link["anthony"].style.position = "absolute";
			if (is_mac)
				selected_link["anthony"].style.top = (371 + absolute_shift) + "px";
			else
				selected_link["anthony"].style.top = (378 + absolute_shift) + "px";
			selected_link["anthony"].style.left = sub_sub_menu_left + "px";
			selected_link["anthony"].style.visibility = "hidden";
			document.body.appendChild(selected_link["anthony"]);
			
			/*	
			selected_link["alyssa"] = document.createElement("img");
			selected_link["alyssa"].setAttribute("src", "../../images/links/selected/sub_links/8.gif");
			selected_link["alyssa"].setAttribute("height", "28");
			selected_link["alyssa"].setAttribute("width", "205");
			selected_link["alyssa"].style.zIndex = 2;
			selected_link["alyssa"].setAttribute("alt", "");
			selected_link["alyssa"].style.position = "absolute";
			if (is_mac)
				selected_link["alyssa"].style.top = (390 + absolute_shift) + "px";
			else
				selected_link["alyssa"].style.top = (397 + absolute_shift) + "px";
			selected_link["alyssa"].style.left = sub_sub_menu_left + "px";
			selected_link["alyssa"].style.visibility = "hidden";
			document.body.appendChild(selected_link["alyssa"]);		
			*/
	
			/* gw - 10/4/2011 - removed	
			selected_link["john_s"] = document.createElement("img");
			selected_link["john_s"].setAttribute("src", "../../images/links/selected/sub_links/9.gif");
			selected_link["john_s"].setAttribute("height", "28");
			selected_link["john_s"].setAttribute("width", "205");
			selected_link["john_s"].style.zIndex = 2;
			selected_link["john_s"].setAttribute("alt", "");
			selected_link["john_s"].style.position = "absolute";
			if (is_mac)
				selected_link["john_s"].style.top = (410 + absolute_shift) + "px";
			else
				selected_link["john_s"].style.top = (417 + absolute_shift) + "px";
			selected_link["john_s"].style.left = sub_sub_menu_left + "px";
			selected_link["john_s"].style.visibility = "hidden";
			document.body.appendChild(selected_link["john_s"]);		
			*/											
			
			/* gw 10/5/2011 added */														
			selected_link["matt"] = document.createElement("img");
			selected_link["matt"].setAttribute("src", "../../images/links/selected/sub_links/9.gif");
			selected_link["matt"].setAttribute("height", "28");
			selected_link["matt"].setAttribute("width", "205");
			selected_link["matt"].style.zIndex = 2;
			selected_link["matt"].setAttribute("alt", "");
			selected_link["matt"].style.position = "absolute";
			if (is_mac)
				selected_link["matt"].style.top = (390 + absolute_shift) + "px";
			else
				selected_link["matt"].style.top = (397 + absolute_shift) + "px";
			selected_link["matt"].style.left = sub_sub_menu_left + "px";
			selected_link["matt"].style.visibility = "hidden";
			document.body.appendChild(selected_link["matt"]);
		
			/* gw 10/6/2011 added */	
			selected_link["michael"] = document.createElement("img");
			selected_link["michael"].setAttribute("src", "../../images/links/selected/sub_links/10.gif");
			selected_link["michael"].setAttribute("height", "28");
			selected_link["michael"].setAttribute("width", "205");
			selected_link["michael"].style.zIndex = 2;
			selected_link["michael"].setAttribute("alt", "");
			selected_link["michael"].style.position = "absolute";
			if (is_mac)
				selected_link["michael"].style.top = (410 + absolute_shift) + "px";
			else
				selected_link["michael"].style.top = (417 + absolute_shift) + "px";
			selected_link["michael"].style.left = sub_sub_menu_left + "px";
			selected_link["michael"].style.visibility = "hidden";
			document.body.appendChild(selected_link["michael"]);							
		
			selected_link["philomena"] = document.createElement("img");
			selected_link["philomena"].setAttribute("src", "../../images/links/selected/sub_links/10.gif");
			selected_link["philomena"].setAttribute("height", "28");
			selected_link["philomena"].setAttribute("width", "205");
			selected_link["philomena"].style.zIndex = 2;
			selected_link["philomena"].setAttribute("alt", "");
			selected_link["philomena"].style.position = "absolute";
			// gw moved down...
			//if (is_mac)
			//	selected_link["philomena"].style.top = (430 + absolute_shift) + "px";
			//else
			//	selected_link["philomena"].style.top = (438 + absolute_shift) + "px";
			if (is_mac)
				selected_link["philomena"].style.top = (430 + absolute_shift) + "px";
			else
				selected_link["philomena"].style.top = (438 + absolute_shift) + "px";
			selected_link["philomena"].style.left = sub_sub_menu_left + "px";
			selected_link["philomena"].style.visibility = "hidden";
			document.body.appendChild(selected_link["philomena"]);							
	
	
	

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

/////////////////////////////////////////////////////

//////////////////////////////////////////////////////

function animate_sub_sub_link(linkObject)
{
	sub_sub_linkArray[linkObject].setAttribute("src", sub_sub_linkArray[linkObject].getAttribute("src"));
	sub_sub_linkArray[linkObject].style.opacity = 1;
	sub_sub_linkArray[linkObject].style.filter =  "alpha(opacity=100)";
	sub_sub_linkArray[linkObject].style.visibility = "visible";
}



function hide_sub_sub_link_animation(linkObject, percentage)
{
	percentage -= 25;
	
		sub_sub_linkArray[linkObject].style.opacity = percentage / 100;
		sub_sub_linkArray[linkObject].style.filter =  "alpha(opacity=" + percentage + ")";
		
	
	if (percentage > 0)
		setTimeout("hide_sub_sub_link_animation('" + linkObject + "', " + percentage + ");", 100);	
}

/////////////////////////////////////////////////////


function animate_selected_sub_sub_link(linkObject)
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


