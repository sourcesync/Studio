 /* This source file is proprietary property of Saimon Lovell. Copyright &copy; Fordevelop.com [04/27/2011]
 
	* Author: Simon Lovell
	* Copyright: 2011 Simon Lovell
	* Date: 04/27/2011
	* Updated: 
 */ 
 

var video_is_paused = true;

//video_sector

function RewindTheVideo(directory)
{
	setVideo(directory);
}


function PlayTheVideo()
{
	var theVideo = document.getElementById("theVideo");	
	theVideo.play();
	video_is_paused = false;
}


function PauseTheVideo()
{
	var theVideo = document.getElementById("theVideo");	
	theVideo.pause();
	video_is_paused = true;
}


function PlayPause()
{
	if (video_is_paused)
		PlayTheVideo();
	else 
		PauseTheVideo();
}


function videoCurrentTime(seconds)
{
	var theVideo = document.getElementById("theVideo");	
	theVideo.setCurrentTime(seconds)	
}



function setVideoEvents()
{
	PauseTheVideo();
	MediaElement('theVideo', {success: function(me) {
	me.addEventListener('loadeddata', function() { if(typeof window.videoReady == 'function') videoReady(); }, false);
	me.addEventListener('ended', function() { if(typeof window.videoEnded == 'function') videoEnded(); }, false);
	document.getElementById('theVideo')['onclick'] = function() {		if (me.paused)			me.play();		else			me.pause();		};
}});	
}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// SD

function setVideo(directory)
{
	loading_div.style.visibility = "false";
	video_sector.innerHTML = loadVideo(directory, current_slide, 480, 282);

	window.setTimeout("setVideoEvents()", 100);

	video_controls.style.visibility = "visible";
	window.setTimeout("PlayTheVideo()", 500);
}


function loadVideo(pageFolder, fileNumber, width, height)
{
	var ret = '<video id="theVideo" width="' + width + '" height="' + height + '" poster="' + pageFolder + '/mth/' + fileNumber + '.png" controls="controls" preload="auto" autoplay onclick="PlayPause()">' +
        '<source type="video/mp4" src="' + pageFolder + '/sd2/' + fileNumber + '.mp4video.mp4" />' +
        '<source type="video/webm" src="' + pageFolder + '/sd2/' + fileNumber + '.webmvp8.webm" />' + 
        '<source type="video/ogg" src="' + pageFolder + '/sd2/' + fileNumber + '.theora.ogv" />' + 

        '<object width="' + width + '" height="' + height + '" type="application/x-shockwave-flash" data="' + pageFolder + '/flashmediaelement.swf">' + 
            '<param name="movie" value="' + pageFolder + '/flashmediaelement.swf" />' +
            '<param name="flashvars" value="controls=true&poster=' + pageFolder + '/' + fileNumber + '.png&file=' + pageFolder + '/sd2/' + fileNumber + '.mp4video.mp4" />' +
            '<img src="' + pageFolder + '/' + fileNumber + '.png" width="' + width + '" height="' + height + '" title="No video playback capabilities detected. Use Google Chrome" />' +
        '</object>' +
   '</video>';
   
   return ret;
}



	MediaElement('theVideo', {success: function(me) {
	me.addEventListener('loadeddata', function() { if(typeof window.videoReady == 'function') videoReady(); }, false);
	me.addEventListener('ended', function() { if(typeof window.videoEnded == 'function') videoEnded(); }, false);
	document.getElementById('theVideo')['onclick'] = function() {		if (me.paused)			me.play();		else			me.pause();		};
}});


//////////////////////////////////////////////////////////////
//////// HD
//////////////////

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
document.body.appendChild(stage);


var html_data = '<table width="100%" height="100%" border="0" cellspacing="0" cellpadding="0">  <tr>    <td width="5%">&nbsp;</td>    <td width="90%">&nbsp;</td>    <td width="5%" valign="top" style="color:#FFFFFF;cursor:pointer;" onClick="hideHD()"><br />[CLOSE] &nbsp;</td>  </tr>  <tr>    <td>&nbsp;</td>    <td align="center" valign="middle" id="hd_video"></td><td>&nbsp;</td>  </tr>  <tr>    <td>&nbsp;</td>    <td align="center" valign="top" id="hd_load_status" style="color:#FFF">&nbsp;</td>    <td>&nbsp;</td>  </tr></table>';

