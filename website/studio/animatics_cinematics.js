

var stage = document.createElement('div');
stage.style.height = "100%";
stage.style.width = "100%";
stage.style.zIndex = 6;
stage.style.position = "absolute";
stage.style.left = "0px";
stage.style.top = "0px";
stage.style.backgroundColor = "#000000";
stage.style.color = "white";
stage.style.opacity = 0.0;
stage.style.filter =  "alpha(opacity=0)";
stage.style.visibility = "hidden";


var html_data = '<table width="100%" height="100%" border="0" cellspacing="0" cellpadding="0">  <tr>    <td width="5%">&nbsp;</td>    <td width="90%">&nbsp;</td>    <td width="5%" valign="top" style="color:#FFFFFF;cursor:pointer;" onClick="hideHD()"><br />[CLOSE] &nbsp;</td>  </tr>  <tr>    <td>&nbsp;</td>    <td align="center" valign="middle" style="color:#FFF" id="hd_video"></td><td>&nbsp;</td>  </tr>  <tr>    <td>&nbsp;</td>    <td>&nbsp;</td>    <td>&nbsp;</td>  </tr></table>';


document.body.appendChild(stage);


function showHD()
{

//	current_slide	
//  generateVideoCode(path, slide, width, height)

	stage.style.visibility = "visible";
	stage.innerHTML = html_data;
	
	document.getElementById("hd_video").innerHTML = '<img src="../images/loading.gif" alt=" Loading " width="180" height="180" border="0" />';
	fadeToBlack(0);
}


function hideHD()
{
	stage.style.visibility = "hidden";
	stage.innerHTML = "";
}


function fadeToBlack(percentage)
{
	percentage +=5;

	stage.style.opacity = percentage / 100;
	stage.style.filter =  "alpha(opacity=" + percentage + ")";
	
	if ((os_detected == "mac") && (browser_detected == "safari"))
	{
		if (percentage < 101)
			window.setTimeout("fadeToBlack(" + percentage + ")", 50);
		else
			document.getElementById("hd_video").innerHTML = generateVideoCode("http://10.0.12.191/TheStudio/studio/animatics_cinematics", current_slide, 960, 540);
		
	} 
		else 
	{
		if (percentage < 90)
			window.setTimeout("fadeToBlack(" + percentage + ")", 50);
		else
			document.getElementById("hd_video").innerHTML = generateVideoCode("http://10.0.12.191/TheStudio/studio/animatics_cinematics", current_slide, 960, 540);
	}
	

}


