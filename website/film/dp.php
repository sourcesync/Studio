<?php require("../codes/header.php"); require("../codes/body.php"); ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" manifest="../cache.manifest">
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

<link rel="stylesheet" type="text/css" href="../scripts/common.css" />

<link type="text/css" href="../css/smoothness/jquery-ui-1.8.12.custom.css" rel="stylesheet" />	

<script language="javascript" src="../scripts/jquery.js"></script>
<script language="javascript" src="../scripts/jquery-ui.js"></script>

<script src="dp/mediaelement-and-player.min.js"></script>
<script src="dp/mediaelement.js"></script>
<link rel="stylesheet" href="dp/mediaelementplayer.css" />



</head>

<body>
<!-- -->
<img src="../images/video_template.png" width="879" height="517" style="position:absolute; left: 14px; top: 36px; z-index:1" />

<div id="top_section" style="height: 61px; width: 520px; position:absolute; top: 61px; left: 321px; z-index:2"> &nbsp;&nbsp;&nbsp;<img src="../images/orange_bar.png" width="122" height="60" border="0" /></div>

<div id="loading_div" style="position:absolute; left: 512px; top: 214px; z-index:5; visibility:hidden" onclick="PlayTheVideo()"><img src="../images/loading_blackborder.gif" width="150" height="150" alt=" LOADING ... " /></div>

<div id="mid_section" style="height: 336px; width: 517px; position:absolute; top: 148px; left: 337px; z-index:2">


	<div style="background-image:url(dp/poster.jpg); height:282px; width:480px; background-repeat:no-repeat;" onclick="imageClickAction()">
    

        <video id="theVideo" width="480" height="282" poster="dp/poster.jpg" controls="controls" preload="auto" style="visibility:hidden">
            <!-- MP4 for Safari, IE9, iPhone, iPad, Android, and Windows Phone 7 -->
            <source type="video/mp4" src="dp/sd/1.mp4" />
            <!-- Ogg/Vorbis for older Firefox and Opera versions -->
            <source type="video/ogg" src="dp/sd/1.ogv" />

            <source type="video/wmv" src="dp/sd/1.wmv" />
            <!-- Optional: Add subtitles for each language -->
            <!-- Flash fallback for non-HTML5 browsers without JavaScript -->	
            <object width="480" height="282" type="application/x-shockwave-flash" data="dp/flashmediaelement.swf">
                <param name="movie" value="dp/flashmediaelement.swf" />
                <param name="flashvars" value="controls=true&poster=dp/poster.jpg&file=dp/sd/1.mp4" />
                <!-- Image as a last resort -->
                <img src="dp/poster.jpg" width="480" height="282" title="No video playback capabilities. Get Google Chrome" />
            </object>
        </video>
        
    	
    </div>
 	
 
 
 </div>






<div id="down_section" style="background-image:url(../images/textbar_video.png); background-repeat:no-repeat; position:absolute; width: 540px; height: 100px; left: 321px; top: 459px; z-index:2">
  <table width="494" border="0" cellspacing="2" cellpadding="2">
    <tr>
      <td colspan="2">
      
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="42%" id="left_txt">DP Reel 2011</td>
                <td width="2%">&nbsp;</td>
                <td width="51%" align="right" id="right_txt">Kristina Nikolova </td>
                <td width="5%">&nbsp;</td>
              </tr>
            </table>
      
      </td>
    </tr>
    <tr>
      <td width="101" height="30" align="center"><img src="../images/plus_red.png" border="0" style="position:absolute; top:2px; left:466px" onclick="popup_box.style.visibility='visible';" onmouseover="this.src='../images/plus_brightred.png'" onmouseout="this.src='../images/plus_red.png'" /></td>
      <td width="390">&nbsp;</td>
    </tr>
    <tr>
      <td><img src="../images/share.png" alt=" [SHARE] " width="40" height="26" border="0" onclick="triggerSocial()" id="thesharebutton" /></td>
      <td>
      <marquee id="share_slide" direction="right" behavior="slide" scrollamount="0" width="180px">
      <table width="100" border="0" cellspacing="2" cellpadding="2" id="social" style="opacity:0.0;filter:alpha(opacity=0);visibility:hidden; position:relative">
        <tr>
          <td width="50"><a href="mailto:info@studionyc.com?subject=DP&body=DP http://www.studionyc.com/film/dp.php"><img src="../images/mini/email.png" width="16" height="16" border="0" onmouseover="swapEffect(this, '../images/mini/email_colored.png');ToolTip('E-Mail')" onmouseout="swapEffect(this, '../images/mini/email.png');ToolTip('&nbsp;')"/></a></td>
          <td width="50"><a href="https://www.facebook.com/sharer.php?u=http://www.studionyc.com/film/dp.php" target="_blank"><img src="../images/mini/facebook.png" width="16" height="16" border="0" onmouseover="swapEffect(this, '../images/mini/facebook_colored.png');ToolTip('Facebook')" onmouseout="swapEffect(this, '../images/mini/facebook.png');ToolTip('&nbsp;')"/></a></td>
          <td width="50"><a href="https://twitter.com/share?url=http://www.studionyc.com/film/dp.php" target="_blank"><img src="../images/mini/twitter.png" width="16" height="16" border="0" onmouseover="swapEffect(this, '../images/mini/twitter_colored.png');ToolTip('Twitter')" onmouseout="swapEffect(this, '../images/mini/twitter.png');ToolTip('&nbsp;')"/></a></td>
          <td width="50"><a href="https://secure.delicious.com/login?jump=http://www.studionyc.com/film/dp.php" target="_blank"><img src="../images/mini/delicious.png" width="16" height="16" border="0" onmouseover="swapEffect(this, '../images/mini/delicious_colored.png');ToolTip('Delicious')" onmouseout="swapEffect(this, '../images/mini/delicious.png');ToolTip('&nbsp;')"/></a></td>
          <td width="50"><a href="http://www.stumbleupon.com/submit?url=http://www.studionyc.com/film/dp.php" target="_blank"><img src="../images/mini/stumbleupon.png" width="16" height="16" border="0" onmouseover="swapEffect(this, '../images/mini/stumbleupon_colored.png');ToolTip('StumbleUpon')" onmouseout="swapEffect(this, '../images/mini/stumbleupon.png');ToolTip('&nbsp;')"/></a></td>
          <td width="50"><a href="http://www.blogger.com/home" target="_blank"><img src="../images/mini/blogger.png" width="16" height="16" border="0" onmouseover="swapEffect(this, '../images/mini/blogger_colored.png');ToolTip('Blogger')" onmouseout="swapEffect(this, '../images/mini/blogger.png');ToolTip('&nbsp;')"/></a></td>
          <td width="50"><a href="http://digg.com/submit?url=http://www.studionyc.com/film/dp.php" target="_blank"><img src="../images/mini/digg.png" width="16" height="16" border="0" onmouseover="swapEffect(this, '../images/mini/digg_colored.png');ToolTip('Digg')" onmouseout="swapEffect(this, '../images/mini/digg.png');ToolTip('&nbsp;')"/></a></td>
          <td width="56"><a href="http://technorati.com/" target="_blank"><img src="../images/mini/technorati.png" width="16" height="16" border="0" onmouseover="swapEffect(this, '../images/mini/technorati_colored.png');ToolTip('Technorati')" onmouseout="swapEffect(this, '../images/mini/technorati.png');ToolTip('&nbsp;')"/></a></td>
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


<?php bulbs("video_template", "../images"); ?>


<table width="1240" border="0" cellspacing="0" cellpadding="0" style="position:absolute">
      <tr>
        <td width="529" align="left" valign="top"><a href="../reel.php" target="_self"><img src="../images/icon.png" alt="LOGO" border="0" class="logo" /></a></td>
        <td width="105" valign="middle">&nbsp;</td>
        <td width="586" align="right" valign="top">
        <table width="300" border="0" cellspacing="2" cellpadding="2">
          <tr>
            <td width="303">                <div class="ui-widget">
                    <label for="search_input"></label>
                    <input type="text" id="search_input" style="visibility:hidden" size="32" maxlength="64" onkeyup="activeSearch(event)" x-webkit-speech>
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
          <td><a href="../animation/index.php" target="_self" onmouseover="animate_link('animation')" onmouseout="hide_link_animation('animation', 0)"><img src="../images/animation.png" width="256" height="31" border="0" /></a></td>
        </tr>
        <tr>
          <td><a href="index.php" target="_self" onmouseover="animate_link('film')" onmouseout="hide_link_animation('film', 0)"><img src="../images/film.png" width="256" height="37" border="0"  /></a></td>
        </tr>
        <tr>
          <td><table width="100%" border="0" cellspacing="1" cellpadding="1">
            <tr>
              <td width="7%">&nbsp;</td>
              <td width="93%"><a href="director.php" target="_self" onmouseover="animate_sub_link('director')" onmouseout="hide_sub_link_animation('director', 75)"><img src="../images/director.png" width="200" height="14" border="0" /></a></td>
            </tr>
            <tr>
              <td>&nbsp;</td>
              <td><img src="../images/dp.png" width="200" height="16" border="0" /></td>
            </tr>
          </table></td>
        </tr>
        <tr>
          <td><a href="../studio/index.php" target="_self" onmouseover="animate_link('studio')" onmouseout="hide_link_animation('studio', 0)"><img src="../images/the_studio.png" width="256" height="33" border="0"  /></a></td>
        </tr>
        <tr>
          <td><a href="../about/index.php" target="_self" onmouseover="animate_link('about')" onmouseout="hide_link_animation('about', 0)"><img src="../images/about_us.png" width="256" height="35" border="0"  /></a></td>
        </tr>
        <tr>
          <td><a href="../contact/index.php" target="_self" onmouseover="animate_link('contact')" onmouseout="hide_link_animation('contact', 0)"><img src="../images/contact.png" width="256" height="30" border="0" /></a></td>
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
  
  
  
  
  
  
  <div id="popup_box" align="center" style="position:absolute; height:154px; width:456px; z-index:6; background-image:url(../images/biobox.png); left: 772px; top: 445px;visibility:hidden" >
  
  
     <img src="../images/scroll_arrow_up_white.png" alt="UP" width="18" height="14" border="0" onmouseout="this.src = '../images/scroll_arrow_up_white.png'; TextDivMoveDirection(''); text_scroll_speed=4;" onmouseover="this.src='../images/scroll_arrow_up_colored.png';TextDivMoveDirection('up')" style="position:relative; left: 207px; top: 46px;" onclick="text_scroll_speed +=4" />
    
<img src="../images/scroll_arrow_down_white.png" alt=" DOWN " width="18" height="13" border="0" onmouseout="this.src='../images/scroll_arrow_down_white.png';TextDivMoveDirection(''); text_scroll_speed=4" onmouseover="this.src='../images/scroll arrow_down_colored.png';TextDivMoveDirection('down')" style="position:relative; left: 182px; top: 116px;" onclick="text_scroll_speed +=4" /> 

	<div align="left" style="position:relative; color:#FFF; width:388px; height:120px; top:0px; left:-14px; overflow:hidden">
		<div id="popup_box_text" align="left" style="position:relative; top:0px; left:0px;">Born in Bulgaria, Kristina grew up in a family of prominent cinematographers. She started at age of 17 at the University of Chicago where she studied economics, but soon switched to a film major.  After graduation she drove to LA and started working as a second unit DP for thriller and action movies. Kristina was chosen to DP her first 35mm feature film ''GOOD BYE HELLO'' in 2003, the movie won best film awards in festivals in San Francisco, Boston, and NY. <br />Since then Kristina has shot numerous fiction and documentary features, shorts and commercials. She holds a master's from the prestigious film program at Tisch School of the Arts, NYU.<br />Kristina shot her first feature as a director FAITH, LOVE AND WHISKEY in 2010.</div>
	</div>
    
  <img src="../images/scroll_white_short.png" border="0" style="position:relative; top:-82px; left:195px;"/><br />
 
 <img src="../images/close.gif" border="0" style="position:relative; top:-190px; left:195px;" onmouseover="this.src='../images/close_mouse_over.gif'" onmouseout="this.src='../images/close.gif'" onclick="popup_box.style.visibility='hidden';"/>
        
  </div>
  

<?php include("../codes/footer.php"); ?>
</body>
<script language="javascript" type="text/javascript" src="../scripts/common.js"></script>
<script language="javascript" type="text/javascript" src="film.js"></script>

<script language="javascript" type="text/javascript" src="../scripts/video.js"></script>

<script language="javascript" type="text/javascript">

var video_loaded = false;

function imageClickAction()
{
	if (!video_loaded)
	{
		$("#loading_div").css("visibility", "visible");
		$("#theVideo").css("visibility", "visible");
	} else
	{
		$("#theVideo").css("visibility", "visible");
		PlayTheVideo();	
	}
}


animate_selected('dp');

		video_is_paused = false;
		video_controls.style.visibility = "visible";
		
		
function videoReady()
{
	video_controls.style.visibility = "visible";
	video_is_paused = false;
	loading_div.style.visibility = "hidden";
	video_loaded = true;
}

	

function videoEnded()
{
	video_is_paused = true;
	video_controls.style.visibility = "hidden";
	mid_section.innerHTML = '<div id="preview_div" style="background-image:url(dp/poster.jpg); height:281px; width:480px; overflow:hidden;" align="center"  onclick="loadVideoAgain()"><table width="100%" height="100%" border="0" cellspacing="0" cellpadding="0">  <tr> <td align="center" valign="middle"><img src="../images/play.png" width="50" height="50" border="0/></td>  </tr></table></div>';
}


function loadVideoAgain()
{
	mid_section.innerHTML = '<div style="background-image:url(dp/poster.jpg); height:282px; width:480px">          <video id="theVideo" width="480" height="282" poster="dp/poster.jpg" controls="controls" autoplay preload="auto" onclick="PlayPause()" >            <!-- MP4 for Safari, IE9, iPhone, iPad, Android, and Windows Phone 7 -->            <source type="video/mp4" src="dp/sd/1.mp4" />            <!-- WebM/VP8 for Firefox4, Opera, and Chrome -->            <source type="video/webm" src="dp/sd/1.webm" />            <!-- Ogg/Vorbis for older Firefox and Opera versions -->            <source type="video/ogg" src="dp/sd/1.ogv" />            <!-- Optional: Add subtitles for each language -->            <!-- Flash fallback for non-HTML5 browsers without JavaScript -->	            <object width="480" height="282" type="application/x-shockwave-flash" data="dp/flashmediaelement.swf">                <param name="movie" value="dp/flashmediaelement.swf" />                <param name="flashvars" value="controls=true&poster=dp/poster.jpg&file=dp/sd/1.mp4" />                <!-- Image as a last resort -->                <img src="dp/poster.jpg" width="480" height="282" title="No video playback capabilities. Get Google Chrome" />            </object>        </video>';
	video_is_paused = false;
}


</script>



<script language="javascript" type="text/javascript">
var max_scroll_down = 160;
var text_scroll_speed = 4;
var text_scroll_direction = "";


function checker()
{
	if (text_scroll_direction != '')
		scrollText();
	
	window.setTimeout("checker()", 100);	
}

checker();




function TextDivMoveDirection(new_direction)
{
	text_scroll_direction = new_direction;
} 



function scrollText()
{
	
	if (text_scroll_direction != "")
	{
		
		var y = popup_box_text.style.top.replace("px", "");
		
		if ((text_scroll_direction == 'up') && (y < 0))
		{
			popup_box_text.style.top = (parseInt(y) + text_scroll_speed) + "px";
		} 
		
		
		if ((text_scroll_direction == 'down') && (y > (-1 * max_scroll_down)))
		{
			popup_box_text.style.top = (parseInt(y) - text_scroll_speed) + "px";
		}
		
	}	
}




</script>

</html>