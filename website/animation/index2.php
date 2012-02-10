<?php require("../codes/header.php"); require("../codes/body.php"); ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" manifest="../cache.manifest">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>The Studio</title>
<meta name="keywords" content="design, animation, visual effects, based in New York, high-end, commercials, post production, music video, digital effects, special effects, showreel, production, editing, animatics, cinematics, postproduction, digital, mobile, web design and more." />
<meta name="description" content="Animation by The STUDIO for high-end storyboards and includes animatics, cinematics, 3-D, motion graphics, and editing" />
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

<link type="text/css" href="../css/smoothness/jquery-ui-1.8.12.custom.css" rel="stylesheet" />	

<script language="javascript" src="../scripts/jquery.js"></script>
<script language="javascript" src="../scripts/jquery-ui.js"></script>

<script src="shorts/mediaelement-and-player.min.js"></script>
<script src="shorts/mediaelement.js"></script>
<link rel="stylesheet" href="shorts/mediaelementplayer.css" />

<link rel="stylesheet" type="text/css" href="../scripts/common.css" />

</head>

<body>
<!-- -->
<img src="../images/video_template_with_bar.png" width="879" height="517" style="position:absolute; left: 14px; top: 36px; z-index:1"  />

<div id="top_section" style="height: 59px; width: 480px; position:absolute; top: 61px; left: 345px; z-index:2; overflow:hidden;"  onmouseover="inZone(true)" onmouseout="inZone(false)">
  <img src="../images/bar.png" width="2" height="60" border="0" style="position:absolute;z-index:3;" />
<table width="1163" height="100%" border="0" cellspacing="0" cellpadding="0" id="image_table" style="position:relative; right:0px; cursor:pointer;" onmouseout="checkBounderies()">
    <tr>
      <td width="2px"><img src="../images/bar.png" width="2" border="0" /></td>
      <td width="107px" id="0" onclick="previewImage(this)">&nbsp;</td>
      <td width="2px"><img src="../images/bar.png" width="2" border="0" /></td>
      <td width="107px" id="1" onclick="previewImage(this)">&nbsp;</td>
      <td width="2px"><img src="../images/bar.png" width="2" border="0" /></td>
      <td width="107px" id="2" onclick="previewImage(this)">&nbsp;</td>
      <td width="2px"><img src="../images/bar.png" width="2" border="0" /></td>
      <td width="107px" id="3" onclick="previewImage(this)">&nbsp;</td>
      <td width="2px"><img src="../images/bar.png" width="2" border="0" /></td>
      <td width="107px" id="4" onclick="previewImage(this)">&nbsp;</td>
      <td width="2px"><img src="../images/bar.png" width="2" border="0" /></td>
      <td width="107px" id="5" onclick="previewImage(this)">&nbsp;</td>
      <td width="2px"><img src="../images/bar.png" width="2" border="0" /></td>
      <td width="107px" id="6" onclick="previewImage(this)">&nbsp;</td>
      <td width="2px"><img src="../images/bar.png" width="2" border="0" /></td>
      <td width="107px" id="7" onclick="previewImage(this)">&nbsp;</td>
      <td width="2px"><img src="../images/bar.png" width="2" border="0" /></td>
      <td width="107px" id="8" onclick="previewImage(this)">&nbsp;</td>
      <td width="2px"><img src="../images/bar.png" width="2" border="0" /></td>
      <td width="107px" id="9" onclick="previewImage(this)">&nbsp;</td>
      <td width="2px"><img src="../images/bar.png" width="2" border="0" /></td>
      <td width="107px" id="10" onclick="previewImage(this)">&nbsp;</td>
      <td width="2px"><img src="../images/bar.png" width="2" border="0" /></td>
    </tr>
  </table> 


</div>



<div id="loading_div" style="position:absolute; left: 512px; top: 214px; z-index:5;"><img src="../images/loading_blackborder.gif" width="150" height="150" alt=" LOADING ... " /></div>


<div id="mid_section" style="height: 334px; width: 536px; position:absolute; top: 123px; left: 321px; z-index:2">
 
<table width="100%" height="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td align="center" valign="middle" id="video_sector" style="cursor:pointer;">
    
     <?php if (!$is_ie)	{	?>
    <video id="theVideo" width="480" height="282" poster="shorts/1.png" controls="controls" preload="auto">
        <!-- MP4 for Safari, IE9, iPhone, iPad, Android, and Windows Phone 7 -->
        <source type="video/mp4" src="shorts/sd/0.mp4video.mp4" />
        <!-- Ogg/Vorbis for older Firefox and Opera versions -->
        <source type="video/ogg" src="shorts/sd/0.theora.ogv" />
        <!-- Optional: Add subtitles for each language -->
        <!-- Flash fallback for non-HTML5 browsers without JavaScript -->	
        <object width="480" height="282" type="application/x-shockwave-flash" data="shorts/flashmediaelement.swf">
            <param name="movie" value="shorts/flashmediaelement.swf" />
            <param name="flashvars" value="controls=true&poster=shorts/1.png&file=shorts/sd/0.mp4video.mp4" />
            <!-- Image as a last resort -->
            <img src="shorts/1.png" width="480" height="282" title="No video playback capabilities. Please get Google Chrome" />
        </object>
    </video>
    
    <?php } else { ?>
    
    <div onclick="reloadAgain()" style=" height:282px; width:480px;">
        <object id="wmp" height="282" width="480" classid="clsid:6BF52A52-394A-11d3-B153-00C04F79FAA6" type="application/x-oleobject">
       		<param name="autostart" value="true">
   		  	<param name="uimode" value="none">
			<param name="url" value="shorts/sd/0.wmv">
       		<param name="sendplaystatechangeevents" value="true">
    	</object>
  </div>
  		
    
    <?php } ?>
    
    </td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td align="center">&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
</table>
</div>






<div id="down_section" style="position:absolute; width: 497px; height: 148px; left: 320px; top: 460px; z-index:3; overflow:hidden;" align="right">
<table width="100%" border="0" cellspacing="2" cellpadding="2">
  <tr>
    <td colspan="3" align="right" id="slide_data">'Snow Globe'</td>
    </tr>
  <tr>
    <td width="16%" height="32">&nbsp;</td>
    <td width="36%">&nbsp;</td>
    <td width="48%">&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;<img src="../images/share.png" alt=" [SHARE] " width="40" height="26" border="0" onclick="triggerSocial()" id="thesharebutton" /></td>
    <td colspan="2" align="left">    
      
      <table width="100" border="0" cellspacing="2" cellpadding="2" id="social" style="opacity:0.0;filter:alpha(opacity=0);visibility:hidden; position:relative;">
        <tr>
          <td width="50"><a id="share_email" href="mailto:.com?subject=Animation Shorts&body=Studio Shorts: http://studionyc.com/animation/index.php"><img src="../images/mini/email.png" width="16" height="16" border="0" onmouseover="swapEffect(this, '../images/mini/email_colored.png');ToolTip('E-Mail')" onmouseout="swapEffect(this, '../images/mini/email.png');ToolTip('&nbsp;')"/></a></td>
          <td width="50"><a id="share_facebook" href="https://www.facebook.com/sharer.php?u=http://studionyc.com/animation/index.php" target="_blank"><img src="../images/mini/facebook.png" width="16" height="16" border="0" onmouseover="swapEffect(this, '../images/mini/facebook_colored.png');ToolTip('Facebook')" onmouseout="swapEffect(this, '../images/mini/facebook.png');ToolTip('&nbsp;')"/></a></td>
          <td width="50"><a id="share_twitter" href="https://twitter.com/share?url=http://studionyc.com/animation/index.php" target="_blank"><img src="../images/mini/twitter.png" width="16" height="16" border="0" onmouseover="swapEffect(this, '../images/mini/twitter_colored.png');ToolTip('Twitter')" onmouseout="swapEffect(this, '../images/mini/twitter.png');ToolTip('&nbsp;')"/></a></td>
          <td width="50"><a id="share_delicious" href="https://secure.delicious.com/login?jump=http://studionyc.com/animation/index.php" target="_blank"><img src="../images/mini/delicious.png" width="16" height="16" border="0" onmouseover="swapEffect(this, '../images/mini/delicious_colored.png');ToolTip('Delicious')" onmouseout="swapEffect(this, '../images/mini/delicious.png');ToolTip('&nbsp;')"/></a></td>
          <td width="50"><a id="share_stumbleupon" href="http://www.stumbleupon.com/submit?url=http://studionyc.com/animation/index.php" target="_blank"><img src="../images/mini/stumbleupon.png" width="16" height="16" border="0" onmouseover="swapEffect(this, '../images/mini/stumbleupon_colored.png');ToolTip('StumbleUpon')" onmouseout="swapEffect(this, '../images/mini/stumbleupon.png');ToolTip('&nbsp;')"/></a></td>
          <td width="50"><a href="http://www.blogger.com/home" target="_blank"><img src="../images/mini/blogger.png" width="16" height="16" border="0" onmouseover="swapEffect(this, '../images/mini/blogger_colored.png');ToolTip('Blogger')" onmouseout="swapEffect(this, '../images/mini/blogger.png');ToolTip('&nbsp;')"/></a></td>
          <td width="50"><a id="share_digg" href="http://digg.com/submit?url=http://studionyc.com/animation/index.php" target="_blank"><img src="../images/mini/digg.png" width="16" height="16" border="0" onmouseover="swapEffect(this, '../images/mini/digg_colored.png');ToolTip('Digg')" onmouseout="swapEffect(this, '../images/mini/digg.png');ToolTip('&nbsp;')"/></a></td>
          <td width="56"><a id="share_technorati" href="http://technorati.com/" target="_blank"><img src="../images/mini/technorati.png" width="16" height="16" border="0" onmouseover="swapEffect(this, '../images/mini/technorati_colored.png');ToolTip('Technorati')" onmouseout="swapEffect(this, '../images/mini/technorati.png');ToolTip('&nbsp;')"/></a></td>
          </tr>
        </table>
      
      
      </td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td colspan="2" id="tooltip" style="color:#666">&nbsp;</td>
  </tr>
</table>


</div>







<?php bulbs("video_template_with_bar", "../images"); ?>



<table width="1240" border="0" cellspacing="0" cellpadding="0" style="position:absolute">
      <tr>
        <td width="529" align="left" valign="top"><a href="../reel.php" target="_self"><img src="../images/icon.png" alt="LOGO" border="0" class="logo" /></a></td>
        <td width="105" valign="middle">&nbsp;</td>
        <td width="586" align="right" valign="top">
        <table width="300" border="0" cellspacing="2" cellpadding="2">
          <tr>
            <td width="303">                <div class="ui-widget">
                    <label for="search_input"></label>
                    <input type="text" id="search_input" style="visibility:hidden" size="32" maxlength="64" onkeyup="activeSearch(event)"  x-webkit-speech>
                </div></td>
            <td width="47"><img src="http://studionyc.com/images/search.png" alt=" SEARCH " width="47" height="18" border="0" onclick="searchNow()" /></td>
            <td width="30"><img src="http://studionyc.com/images/x_grey.png" alt="X" name="close_x" width="30" height="22" border="0" id="close_x" style="visibility:hidden" onclick="searchClose()" onmouseover="this.src='http://studionyc.com/images/x_white.png'" onmouseout="this.src='http://studionyc.com/images/x_grey.png'" title=" Close Search " /></td>
          </tr>
        </table>
        
        </td>
  </tr>
</table>
    
    
<br /><br /><br />
  
    
      <table width="300" border="0" cellspacing="2" cellpadding="2" style="z-index:5; position:absolute; left: 17px; top: 65px;">
        <tr>
          <td width="94%"><a href="../reel.php" target="_self" onmouseover="animate_link('reel')" onmouseout="hide_link_animation('reel', 0)"><img src="../images/reel.png" width="256" height="34" border="0" /></a></td>
        </tr>
        <tr>
          <td><img src="../images/animation.png" width="256" height="31" border="0" /></td>
        </tr>
        <tr>
          <td><table width="100%" border="0" cellspacing="1" cellpadding="0">
            <tr>
              <td width="6%">&nbsp;</td>
              <td width="94%"><img src="../images/shorts.png" width="250" height="14" border="0" /></td>
            </tr>
            <tr>
              <td>&nbsp;</td>
              <td><a href="commercial2.php" target="_self" onmouseover="animate_sub_link('commercial')" onmouseout="hide_sub_link_animation('commercial', 75)"><img src="../images/commercial.png" width="250" height="14" border="0" /></a></td>
            </tr>
          </table></td>
        </tr>
        <tr>
          <td><a href="../film/index.php" target="_self" onmouseover="animate_link('film')" onmouseout="hide_link_animation('film', 75)"><img src="../images/film.png" width="256" height="37" border="0"  /></a></td>
        </tr>
        <tr>
          <td><a href="../studio/index.php" target="_self" onmouseover="animate_link('studio')" onmouseout="hide_link_animation('studio', 0)"><img src="../images/the_studio.png" width="256" height="33" border="0"/></a></td>
        </tr>
        <tr>
          <td><a href="../about/index.php" target="_self" onmouseover="animate_link('about')" onmouseout="hide_link_animation('about', 75)"><img src="../images/about_us.png" width="256" height="35" border="0"  /></a></td>
        </tr>
        <tr>
          <td><a href="../contact/index.php" target="_self" onmouseover="animate_link('contact')" onmouseout="hide_link_animation('contact', 75)"><img src="../images/contact.png" width="256" height="30" border="0" /></a></td>
        </tr>
        <tr>
          <td>&nbsp;</td>
        </tr>
        <tr>
          <td><a href="http://www.interdubs.com/r/thestudio/" target="_self"><img src="../images/client_login.png" alt=" client login " width="70" height="28" border="0" title=" client login " /></a></td>
        </tr>
        <tr>
          <td>&nbsp;</td>
        </tr>
  </table>


<br /><br /><br /><br /><br /><br /><br />

    <?php include("../codes/footer.php"); ?>
<div id="video_controls" style="position:absolute; left: 831px; top: 233px; width:20px; z-index:4;  height: 70px; visibility:hidden;">
  <table width="20" border="0" cellspacing="2" cellpadding="2">
      <tr>
        <td><img src="../images/begin_black.png" alt=" Start All Over " width="20" height="20" border="0" style="cursor:pointer;" onmouseover="this.src='../images/begin_red.png'" onmouseout="this.src='../images/begin_black.png'" onclick="RewindTheVideo()"/></td>
      </tr>
      <tr>
        <td><img src="../images/play_black.png" alt=" Play " width="20" height="20" border="0" style="cursor:pointer;" onmouseover="this.src='../images/play_color.png'" onmouseout="this.src='../images/play_black.png'" onclick="PlayTheVideo()"/></td>
      </tr>
      <tr>
        <td><img src="../images/pause.png" alt=" Pause " width="20" height="20" border="0" style="cursor:pointer;" onmouseover="this.src='../images/pause_red.png'" onmouseout="this.src='../images/pause.png'" onclick="PauseTheVideo()" /></td>
      </tr>
    </table>
    </div>
  
  
  
  
  
  

  
  
  
  
  
  
  
  
    
</body>
<script language="javascript" type="text/javascript" src="../scripts/common.js"></script>
<script language="javascript" type="text/javascript" src="animation.js"></script>

<?php if (!$is_ie)	{	?>
<script language="javascript" type="text/javascript" src="../scripts/video2.js"></script>
<script language="javascript" type="text/javascript">

	animate_selected_sub_link('shorts');
	video_controls.style.visibility = "visible";	
	
	
function videoReady()
{
	video_controls.style.visibility = "visible";
	video_is_paused = false;
	loading_div.style.visibility = "hidden";
}

	

function videoEnded()
{
	video_is_paused = true;
	previewImageBySlide(current_slide);
	loading_div.style.visibility = "hidden";
}
	
</script>
    <?php } else { ?>
    
  <script language="javascript" type="text/javascript">

	animate_selected_sub_link('shorts');

	var player;
	
    onload=function() 
	{
      player = document.getElementById("wmp");
      player.URL = "shorts/sd/0.wmv";
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


	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// SD
	
	function setVideo(directory)
	{
		loading_div.style.visibility = "false";
		video_sector.innerHTML = loadVideo(directory, current_slide, 480, 282);
	
		video_controls.style.visibility = "visible";
		window.setTimeout("document.getElementById('wmp').controls.play()", 500);
	}
	
	
	function loadVideo(pageFolder, fileNumber, width, height)
	{
		var ret = '<object id="wmp" height="282" width="480" classid="clsid:6BF52A52-394A-11d3-B153-00C04F79FAA6" type="application/x-oleobject">' + 
       		'<param name="autostart" value="true">' +
   		  	'<param name="uimode" value="none">' +
			'<param name="url" value="' + pageFolder + '/sd/' + fileNumber + '.wmv">' +
       		'<param name="sendplaystatechangeevents" value="true">' +
    	'</object>';
	   
	   return ret;
	}


  </script>
  
  <script for="wmp" event="PlayStateChange(newState)">
    handler.call(this, "playstatechange", newState);
  </script>

    
    <?php } ?>
    
<script language="javascript" src="shorts/lovell_scroller2.js"></script>
<script language="javascript" src="shorts/post_video_load2.js"></script>
<script language="javascript" src="shorts/shorts.js"></script>
</html>
