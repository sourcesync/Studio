<?php require("codes/header.php"); require("codes/body.php"); ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" manifest="cache.manifest">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>The Studio</title>
<meta name="keywords" content="storyboards, testing, advertising agency, marketing, design, animation, visual effects, based in New York, high-end, commercials, post production, music video, digital effects, special effects, showreel, production, editing, animatics, cinematics, postproduction, digital, mobile, web design, 3-D, 2-D, motion graphics" />
<meta name="description" content="The STUDIO is an design animation and visual effects company based in New York which specializes in high-end storyboards, animatics, cinematics, animation, editing, and production." />
<meta name="distribution" content="global"/>
<meta name="copyright" content="&copy; 2011 The Studio" />
<meta http-equiv="content-language" content="en-US" />
<meta name="author" content="Saimon Lovell" />
<meta name="robots" content="all" /> 
<meta name="reply-to" content="info@studionyc.com">
<meta name="rating" content="14 years">
<meta name="zipcode" content="10001" >
<meta name="address" content="12 West 27th Street" />
<meta name="city" content="NY" />
<meta name="state" content="NY" />

<link type="text/css" href="css/smoothness/jquery-ui-1.8.12.custom.css" rel="stylesheet" />	

<script language="javascript" src="scripts/jquery.js"></script>
<script language="javascript" src="scripts/jquery-ui.js"></script>
<script language="javascript" src="reel/mediaelement-and-player.min.js"></script>
<script language="javascript" src="reel/mediaelement.js"></script>
<link rel="stylesheet" href="reel/mediaelementplayer.css" />

<link rel="stylesheet" type="text/css" href="scripts/common.css" />

</head>

<body>
<!-- -->
<img src="images/video_template.png" width="879" height="517" style="position:absolute; left: 14px; top: 36px; z-index:1" />

<div id="top_section" style="height: 61px; width: 520px; position:absolute; top: 61px; left: 321px; z-index:2"> &nbsp;&nbsp;&nbsp;<img src="images/orange_bar.png" width="122" height="60" border="0" /></div>



<div id="loading_div" style="position:absolute; left: 502px; top: 212px; z-index:5;"><img src="images/loading_blackborder.gif" width="150" height="150" alt=" LOADING ... " /></div>

       
<div id="video_controls" style="position:absolute; left: 831px; top: 233px; width:20px; z-index:4;  height: 70px; visibility:hidden;">
<table width="20" border="0" cellspacing="2" cellpadding="2">
  <tr>
    <td><img src="images/begin_black.png" alt=" Start All Over " width="20" height="20" border="0" style="cursor:pointer;" onmouseover="this.src='images/begin_red.png'" onmouseout="this.src='images/begin_black.png'" onclick="RewindTheVideo()"/></td>
  </tr>
  <tr>
    <td><img src="images/play_black.png" alt=" Play " width="20" height="20" border="0" style="cursor:pointer;" onmouseover="this.src='images/play_color.png'" onmouseout="this.src='images/play_black.png'" onclick="PlayTheVideo()"/></td>
  </tr>
  <tr>
    <td><img src="images/pause.png" alt=" Pause " width="20" height="20" border="0" style="cursor:pointer;" onmouseover="this.src='images/pause_red.png'" onmouseout="this.src='images/pause.png'" onclick="PauseTheVideo()" /></td>
  </tr>
</table>
</div>
  
  


<div id="mid_section" style="height: 336px; width: 517px; position:absolute; top: 148px; left: 337px; z-index:2">

	
	<div style="height:282px; width:480px; background-image:url(reel/reel.png);" onclick="PauseTheVideo()">
    
    <?php if (!$is_ie)	{	?>
    <video id="theVideo" width="480" height="282" poster="reel/reel.png" controls="controls" preload="auto" autoplay onclick="PlayPause()" >
        <!-- MP4 for Safari, IE9, iPhone, iPad, Android, and Windows Phone 7 -->
        <source type="video/mp4" src="reel/reel.mp4" />
        <!-- WebM/VP8 for Firefox4, Opera, and Chrome -->
        <source type="video/ogg" src="reel/reel.ogv" />
        <!-- Optional: Add subtitles for each language -->
        <!-- Flash fallback for non-HTML5 browsers without JavaScript -->	
        <object width="480" height="282" type="application/x-shockwave-flash" data="reel/flashmediaelement.swf">
            <param name="movie" value="reel/flashmediaelement.swf" />
            <param name="flashvars" value="controls=true&poster=reel/reel.png&file=reel/reel.mp4" />
            <!-- Image as a last resort -->
            <img src="reel.png" width="480" height="282" title="No video playback capabilities" />
        </object>
    </video>
    
    <?php } else { ?>
    
    <div onclick="reloadAgain()" style=" height:282px; width:480px;">
        <object id="wmp" height="282" width="480" classid="clsid:6BF52A52-394A-11d3-B153-00C04F79FAA6" type="application/x-oleobject">
       		<param name="autostart" value="true">
   		  	<param name="uimode" value="none">
			<param name="url" value="reel/reel.wmv">
       		<param name="sendplaystatechangeevents" value="true">
    	</object>
  </div>
  		
    
    <?php } ?>
    
    </div>
 	
 
 
 </div>






<div id="down_section" style="background-image:url(images/textbar_video.png); background-repeat:no-repeat; position:absolute; width: 540px; height: 100px; left: 321px; top: 459px; z-index:2">
  <table width="494" border="0" cellspacing="2" cellpadding="2">
    <tr>
      <td width="101" align="center">&nbsp;</td>
      <td width="390" align="right"><font color="#FF0000">Reel 2011 </font></td>
    </tr>
    <tr>
      <td height="30" align="center">&nbsp;</td>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td><img src="images/share.png" alt=" [SHARE] " width="40" height="26" border="0" onclick="triggerSocial()" id="thesharebutton" /></td>
      <td>
      <marquee id="share_slide" direction="right" behavior="slide" scrollamount="0" width="180px">
      <table width="100" border="0" cellspacing="2" cellpadding="2" id="social" style="opacity:0.0;filter:alpha(opacity=0);visibility:hidden; position:relative">
        <tr>
          <td width="50"><a href="mailto:info@studionyc.com?subject=Studio Reel&body=Check out this reel: http://www.studionyc.com/reel.php"><img src="images/mini/email.png" width="16" height="16" border="0" onmouseover="swapEffect(this, 'images/mini/email_colored.png');ToolTip('E-Mail')" onmouseout="swapEffect(this, 'images/mini/email.png');ToolTip('&nbsp;')"/></a></td>
          <td width="50"><a href="https://www.facebook.com/sharer.php?u=http://studionyc.com/reel.php" target="_blank"><img src="images/mini/facebook.png" width="16" height="16" border="0" onmouseover="swapEffect(this, 'images/mini/facebook_colored.png');ToolTip('Facebook')" onmouseout="swapEffect(this, 'images/mini/facebook.png');ToolTip('&nbsp;')"/></a></td>
          <td width="50"><a href="https://twitter.com/share?url=http://studionyc.com/reel.php" target="_blank"><img src="images/mini/twitter.png" width="16" height="16" border="0" onmouseover="swapEffect(this, 'images/mini/twitter_colored.png');ToolTip('Twitter')" onmouseout="swapEffect(this, 'images/mini/twitter.png');ToolTip('&nbsp;')"/></a></td>
          <td width="50"><a href="https://secure.delicious.com/login?jump=http://www.studionyc.com/reel.php" target="_blank"><img src="images/mini/delicious.png" width="16" height="16" border="0" onmouseover="swapEffect(this, 'images/mini/delicious_colored.png');ToolTip('Delicious')" onmouseout="swapEffect(this, 'images/mini/delicious.png');ToolTip('&nbsp;')"/></a></td>
          <td width="50"><a href="http://www.stumbleupon.com/submit?url=http://studionyc.com/reel.php" target="_blank"><img src="images/mini/stumbleupon.png" width="16" height="16" border="0" onmouseover="swapEffect(this, 'images/mini/stumbleupon_colored.png');ToolTip('StumbleUpon')" onmouseout="swapEffect(this, 'images/mini/stumbleupon.png');ToolTip('&nbsp;')"/></a></td>
          <td width="50"><a href="http://www.blogger.com/home" target="_blank"><img src="images/mini/blogger.png" width="16" height="16" border="0" onmouseover="swapEffect(this, 'images/mini/blogger_colored.png');ToolTip('Blogger')" onmouseout="swapEffect(this, 'images/mini/blogger.png');ToolTip('&nbsp;')"/></a></td>
          <td width="50"><a href="http://digg.com/submit?url=http://studionyc.com/reel.php" target="_blank"><img src="images/mini/digg.png" width="16" height="16" border="0" onmouseover="swapEffect(this, 'images/mini/digg_colored.png');ToolTip('Digg')" onmouseout="swapEffect(this, 'images/mini/digg.png');ToolTip('&nbsp;')"/></a></td>
          <td width="56"><a href="http://technorati.com/" target="_blank"><img src="images/mini/technorati.png" width="16" height="16" border="0" onmouseover="swapEffect(this, 'images/mini/technorati_colored.png');ToolTip('Technorati')" onmouseout="swapEffect(this, 'images/mini/technorati.png');ToolTip('&nbsp;')"/></a></td>
        </tr>
      </table>
      </marquee>
      
      </td>
    </tr>
    <tr>
      <td colspan="2"><table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td width="2%">&nbsp;</td>
          <td width="33%" align="center" id="tooltip">&nbsp;</td>
          <td width="65%">&nbsp;</td>
        </tr>
      </table></td>
    </tr>
  </table>
</div>



<?php bulbs("video_template", "images"); ?>

<table width="1240" border="0" cellspacing="0" cellpadding="0" style="position:absolute">
      <tr>
        <td width="529" align="left" valign="top"><img src="images/icon.png" alt=" ICON " border="0" class="logo" title="" /></td>
        <td width="105" valign="middle">&nbsp;</td>
        <td width="586" align="right" valign="top">
        <table width="300" border="0" cellspacing="2" cellpadding="2">
          <tr>
            <td width="303">
                <div class="ui-widget">
                    <label for="search_input"></label>
                    <input type="text" id="search_input" style="visibility:hidden" size="32" maxlength="64" onkeyup="activeSearch(event)">
                </div>
            </td>
            <td width="47"><img src="http://studionyc.com/images/search.png" alt=" SEARCH " width="47" height="18" border="0" onclick="searchNow()" title="Click here to start search" /></td>
            <td width="30"><img src="http://studionyc.com/images/x_grey.png" alt="X" name="close_x" width="30" height="22" border="0" id="close_x" style="visibility:hidden" onclick="searchClose()" onmouseover="this.src='http://studionyc.com/images/x_white.png'" onmouseout="this.src='http://studionyc.com/images/x_grey.png'" title=" Close Search " /></td>
          </tr>
        </table>
        </td>
  </tr>
</table>
    
    
<br /><br /><br />
  
    
      <table width="300" border="0" cellspacing="2" cellpadding="2" style="z-index:5; position:absolute; left: 17px; top: 65px;">
        <tr>
          <td width="94%"><img src="images/reel.png" width="256" height="34" border="0" alt="reel" title="" /></td>
        </tr>
        <tr>
          <td><a href="animation/index2.php" target="_self" onmouseover="animate_link('animation')" onmouseout="hide_link_animation('animation', 0)"><img src="images/animation.png" width="256" height="31" border="0" alt="animation" title="" /></a></td>
        </tr>
        <tr>
          <td><a href="film/index.php" target="_self" onmouseover="animate_link('film')" onmouseout="hide_link_animation('film', 0)"><img src="images/film.png" width="256" height="37" border="0" alt="film" title="" /></a></td>
        </tr>
        <tr>
          <td><a href="studio/index.php" target="_self" onmouseover="animate_link('studio')" onmouseout="hide_link_animation('studio', 0)"><img src="images/the_studio.png" width="256" height="33" border="0" alt="the studio" title=""  /></a></td>
        </tr>
        <tr>
          <td><a href="about/index.php" target="_self" onmouseover="animate_link('about')" onmouseout="hide_link_animation('about', 0)"><img src="images/about_us.png" width="256" height="35" border="0" alt="about us" title=""  /></a></td>
        </tr>
        <tr>
          <td><a href="contact/index.php" target="_self" onmouseover="animate_link('contact')" onmouseout="hide_link_animation('contact', 0)"><img src="images/contact.png" width="256" height="30" border="0" alt="contact" title="" /></a></td>
        </tr>
        <tr>
          <td>&nbsp;</td>
        </tr>
        <tr>
          <td><a href="http://www.interdubs.com/r/thestudio/" target="_self"><img src="images/client_login.png" alt=" client login " width="70" height="28" border="0" title="" /></a></td>
        </tr>
        <tr>
          <td>&nbsp;</td>
        </tr>
  </table>




<br /><br /><br /><br /><br /><br /><br />
<?php include("codes/footer.php"); ?>
</body>
<script language="javascript" type="text/javascript" src="scripts/common.js"></script>
<script language="javascript" type="text/javascript" src="scripts/reel/reel.js"></script>


<?php if (!$is_ie)	{	?>
<script language="javascript" type="text/javascript" src="scripts/video.js"></script>

<script language="javascript" type="text/javascript">
		animate_link('reel');
		
		video_is_ready = false;
		video_is_paused = false;
		video_controls.style.visibility = "visible";
		
				
function videoReady()
{
	PauseTheVideo();
	video_is_ready = true;
	setTimeout(function()
	{
		video_controls.style.visibility = "visible";
		video_is_paused = false;
		loading_div.style.visibility = "hidden";
		PlayTheVideo();		
	}, 3000);

}

// On failure backup
setTimeout(function()
{
	if (!video_is_ready)
	{
		video_controls.style.visibility = "visible";
		video_is_paused = false;
		loading_div.style.visibility = "hidden";
		PlayTheVideo();			
	}
}, 20000);

function videoEnded()
{
	video_is_paused = true;
	video_controls.style.visibility = "hidden";
	mid_section.innerHTML = '<div id="preview_div" style="background-image:url(reel/reel.png); height:281px; width:480px; overflow:hidden;" align="center"  onclick="loadVideoAgain()"><table width="100%" height="100%" border="0" cellspacing="0" cellpadding="0">  <tr> <td align="center" valign="middle"><img src="images/play.png" width="50" height="50" border="0/></td>  </tr></table></div>';
}


function loadVideoAgain()
{
	mid_section.innerHTML = '<video id="theVideo" width="480" height="282" poster="reel/reel.png" controls="controls" preload="auto" autoplay onclick="PlayPause()" >' +
            '<source type="video/mp4" src="reel/reel.mp4" />' +
           ' <source type="video/webm" src="reel/reel.webm" />' +
           ' <source type="video/ogg" src="reel/reel.ogv" />' +
           ' <object width="480" height="282" type="application/x-shockwave-flash" data="reel/flashmediaelement.swf">' +
               ' <param name="movie" value="reel/flashmediaelement.swf" />' + 
               ' <param name="flashvars" value="controls=true&poster=reel/reel.png&file=reel/reel.mp4" />' +
               '<img src="reel/reel.png" width="480" height="282" title="No video playback capabilities. Get Google Chrome" />' +
           '</object>' +
        '</video>';
	video_is_paused = false;
}

</script>
    <?php } else { ?>
    
  <script language="javascript" type="text/javascript">

	animate_link('reel');

	var player;
	
    onload=function() 
	{
      player = document.getElementById("wmp");
      player.URL = "reel/reel.wmv";
    };

    function eventTrigger(text) 
	{
		if ((text == "Stopped") || (text == "MediaEnded"))
			document.getElementById("wmp").style.visibility = "hidden";
			
		if (text == "Ready")
		{
			loading_div.style.visibility = "hidden";
			video_controls.style.visibility = "visible";
		}
		
    };

    function handler(type) 
	{
      	var a = arguments;
     	eventTrigger(PlayStates[a[1]]); 
    };

    // http://msdn.microsoft.com/en-us/library/bb249361(VS.85).aspx
    var PlayStates = {
       0: "Undefined", // Windows Media Player is in an undefined state.
       1: "Stopped", // Playback of the current media item is stopped.
       2: "Paused", // Playback of the current media item is paused. When a media item is paused, resuming playback begins from the same location.
       3: "Playing", // The current media item is playing.
       4: "ScanForward", // The current media item is fast forwarding.
       5: "ScanReverse", // The current media item is fast rewinding.
       6: "Buffering", // The current media item is getting additional data from the server.
       7: "Waiting", // Connection is established, but the server is not sending data. Waiting for session to begin.
       8: "MediaEnded", // Media item has completed playback.
       9: "Transitioning", // Preparing new media item.
      10: "Ready", // Ready to begin playing.
      11: "Reconnecting" // Reconnecting to stream.
    };


	function PlayTheVideo()
	{
		document.getElementById("wmp").controls.play();		
	}

	function PauseTheVideo()
	{
		document.getElementById("wmp").controls.pause();	
	}
	
	function RewindTheVideo()
	{
		document.getElementById("wmp").controls.stop();
		document.getElementById("wmp").controls.play();	
	}

	function reloadAgain()
	{
		document.getElementById("wmp").style.visibility = "visible";
		window.setTimeout("document.getElementById('wmp').controls.play()", 500);	
	}

  </script>
  
  <script for="wmp" event="PlayStateChange(newState)">
    handler.call(this, "playstatechange", newState);
  </script>

    
    <?php } ?>

</html>
