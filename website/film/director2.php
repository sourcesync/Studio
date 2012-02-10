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

<script src="director/mediaelement-and-player.min.js"></script>
<script src="director/mediaelement.js"></script>
<link rel="stylesheet" href="director/mediaelementplayer.css" />

<link rel="stylesheet" type="text/css" href="../scripts/common.css" />

</head>

<body>
<!-- -->
<img src="../images/video_template_with_bar.png" width="879" height="517" style="position:absolute; left: 14px; top: 36px; z-index:1"  />

<div id="top_section" style="height: 59px; width: 480px; position:absolute; top: 61px; left: 345px; z-index:2; overflow:hidden;"  onmouseover="inZone(true)" onmouseout="inZone(false)">
  <img src="../images/bar.png" width="2" height="60" border="0" style="position:absolute;z-index:3;" />
<table width="440" height="100%" border="0" cellspacing="0" cellpadding="0" id="image_table" style="position:relative; right:0px; cursor:pointer;" onmouseout="checkBounderies()">
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
    </tr>
  </table> 


</div>



<div id="loading_div" style="position:absolute; left: 512px; top: 214px; z-index:5; visibility:hidden"><img src="../images/loading_blackborder.gif" width="150" height="150" alt=" LOADING ... " /></div>


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
    
            
    <video id="theVideo" width="480" height="282" poster="director/1.png" controls="controls" preload="auto" onclick="RewindTheVideo('commercial')">
        <!-- MP4 for Safari, IE9, iPhone, iPad, Android, and Windows Phone 7 -->
        <source type="video/mp4" src="director/sd/1.mp4video.mp4" />
        <!-- Ogg/Vorbis for older Firefox and Opera versions -->
        <source type="video/ogg" src="director/sd/1.theora.ogv" />
        <!-- Optional: Add subtitles for each language -->
        <!-- Flash fallback for non-HTML5 browsers without JavaScript -->	
        <object width="480" height="282" type="application/x-shockwave-flash" data="director/flashmediaelement.swf">
            <param name="movie" value="director/flashmediaelement.swf" />
            <param name="flashvars" value="controls=true&poster=director/1.png&file=director/sd/1.mp4video.mp4" />
            <!-- Image as a last resort -->
            <img src="director/1.png" width="480" height="282" title="No video playback capabilities. Please get Google Chrome" />
        </object>
    </video>
    
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






<div id="down_section" style="position:absolute; width: 502px; height: 148px; left: 320px; top: 460px; z-index:3; overflow:hidden;" align="right">
<table width="100%" border="0" cellspacing="2" cellpadding="2" style="z-index:4">
  <tr>
    <td colspan="3">
    
  <table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="59%" id="left_txt">&nbsp;</td>
    <td width="2%">&nbsp;</td>
    <td width="34%" align="right" id="right_txt">&nbsp;</td>
    <td width="5%">&nbsp;</td>
  </tr>
</table>

    
    </td>
    </tr>
  <tr>
    <td width="16%" height="32"><img src="../images/plus_red.png" border="0" style="position:relative; top:-29px; left:472px" onclick="popup_box.style.visibility='visible'" onmouseover="this.src='../images/plus_brightred.png'" onmouseout="this.src='../images/plus_red.png'" /></td>
    <td width="36%">&nbsp;</td>
    <td width="48%">&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;<img src="../images/share.png" alt=" [SHARE] " width="40" height="26" border="0" onclick="triggerSocial()" id="thesharebutton" /></td>
    <td colspan="2" align="left">    
      
      <table width="100" border="0" cellspacing="2" cellpadding="2" id="social" style="opacity:0.0;filter:alpha(opacity=0);visibility:hidden; position:relative;">
        <tr>
          <td width="50"><a id="share_email" href="mailto:.com?subject=Director&body=Check out this reel: http://www.studionyc.com/film/director.php"><img src="../images/mini/email.png" width="16" height="16" border="0" onmouseover="swapEffect(this, '../images/mini/email_colored.png');ToolTip('E-Mail')" onmouseout="swapEffect(this, '../images/mini/email.png');ToolTip('&nbsp;')"/></a></td>
          <td width="50"><a id="share_facebook" href="https://www.facebook.com/sharer.php?u=http://www.studionyc.com/film/director.php" target="_blank"><img src="../images/mini/facebook.png" width="16" height="16" border="0" onmouseover="swapEffect(this, '../images/mini/facebook_colored.png');ToolTip('Facebook')" onmouseout="swapEffect(this, '../images/mini/facebook.png');ToolTip('&nbsp;')"/></a></td>
          <td width="50"><a id="share_twitter" href="https://twitter.com/share?url=http://www.studionyc.com/film/director.php" target="_blank"><img src="../images/mini/twitter.png" width="16" height="16" border="0" onmouseover="swapEffect(this, '../images/mini/twitter_colored.png');ToolTip('Twitter')" onmouseout="swapEffect(this, '../images/mini/twitter.png');ToolTip('&nbsp;')"/></a></td>
          <td width="50"><a id="share_delicious" href="https://secure.delicious.com/login?jump=http://www.studionyc.com/film/director.php" target="_blank"><img src="../images/mini/delicious.png" width="16" height="16" border="0" onmouseover="swapEffect(this, '../images/mini/delicious_colored.png');ToolTip('Delicious')" onmouseout="swapEffect(this, '../images/mini/delicious.png');ToolTip('&nbsp;')"/></a></td>
          <td width="50"><a id="share_stumbleupon" href="http://www.stumbleupon.com/submit?url=http://www.studionyc.com/film/director.php" target="_blank"><img src="../images/mini/stumbleupon.png" width="16" height="16" border="0" onmouseover="swapEffect(this, '../images/mini/stumbleupon_colored.png');ToolTip('StumbleUpon')" onmouseout="swapEffect(this, '../images/mini/stumbleupon.png');ToolTip('&nbsp;')"/></a></td>
          <td width="50"><a href="http://www.blogger.com/home" target="_blank"><img src="../images/mini/blogger.png" width="16" height="16" border="0" onmouseover="swapEffect(this, '../images/mini/blogger_colored.png');ToolTip('Blogger')" onmouseout="swapEffect(this, '../images/mini/blogger.png');ToolTip('&nbsp;')"/></a></td>
          <td width="50"><a id="share_digg" href="http://digg.com/submit?url=http://www.studionyc.com/film/director.php" target="_blank"><img src="../images/mini/digg.png" width="16" height="16" border="0" onmouseover="swapEffect(this, '../images/mini/digg_colored.png');ToolTip('Digg')" onmouseout="swapEffect(this, '../images/mini/digg.png');ToolTip('&nbsp;')"/></a></td>
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



<?php bulbs("video_template_active", "../images"); ?>



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
              <td width="93%"><img src="../images/director.png" width="200" height="14" border="0" /></td>
            </tr>
            <tr>
              <td>&nbsp;</td>
              <td><a href="dp2.php" target="_self" onmouseover="animate_sub_link('dp')" onmouseout="hide_sub_link_animation('dp', 75)"><img src="../images/dp.png" width="200" height="16" border="0" /></a></td>
            </tr>
            <tr>
              <td>&nbsp;</td>
              <td><a href="spots2.php" target="_self" onmouseover="animate_sub_link('spots')" onmouseout="hide_sub_link_animation('spots', 75)"><img src="../images/spots_6.png" width="139" height="16" border="0" /></a></td>
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

    <?php include("../codes/footer.php"); ?>
<div id="video_controls" style="position:absolute; left: 831px; top: 233px; width:24px; z-index:4; visibility:hidden; height: 101px;">
    <img src="../images/begin_black.png" alt=" Start All Over " width="20" height="20" border="0" style="cursor:pointer;" onmouseover="this.src='../images/begin_red.png'" onmouseout="this.src='../images/begin_black.png'" onclick="videoCurrentTime(0)"/>&nbsp;
    <img src="../images/play_black.png" alt=" Play " width="20" height="20" border="0" style="cursor:pointer;" onmouseover="this.src='../images/play_color.png'" onmouseout="this.src='../images/play_black.png'" onclick="PlayTheVideo()"/>&nbsp;
    <img src="../images/pause.png" alt=" Pause " width="20" height="20" border="0" style="cursor:pointer;" onmouseover="this.src='../images/pause_red.png'" onmouseout="this.src='../images/pause.png'" onclick="PauseTheVideo()" />
  </div>  
  
  
  
  
  

  
  
  <div id="popup_box" align="center" style="position:absolute; height:154px; width:456px; z-index:8; background-image:url(../images/biobox.png); left: 772px; top: 385px; visibility:hidden">
  
  
     <img src="../images/scroll_arrow_up_white.png" alt="UP" width="18" height="14" border="0" onmouseout="this.src = '../images/scroll_arrow_up_white.png'; TextDivMoveDirection(''); text_scroll_speed=4;" onmouseover="this.src='../images/scroll_arrow_up_colored.png';TextDivMoveDirection('up')" style="position:relative; left: 207px; top: 46px;" onclick="text_scroll_speed +=4" />
    
<img src="../images/scroll_arrow_down_white.png" alt=" DOWN " width="18" height="13" border="0" onmouseout="this.src='../images/scroll_arrow_down_white.png';TextDivMoveDirection(''); text_scroll_speed=4" onmouseover="this.src='../images/scroll arrow_down_colored.png';TextDivMoveDirection('down')" style="position:relative; left: 182px; top: 120px;" onclick="text_scroll_speed +=4" /> 

	<div align="left" style="position:relative; color:#FFF; width:388px; height:120px; top:0px; left:-14px; overflow:hidden">
		<div id="popup_box_text" align="left" style="position:relative; top:0px; left:0px;">Born in the Czech Republic, Marie is a graduate of the renowned Prague Film School, FAMU. Following that, she pursued her Master's in Film Directing at the Tisch School of the Arts, NYU. Her narrative/documentary short films were screened and received awards at different film festivals worldwide. <br /> Marie is the recipient of the 16th Annual Student Filmmaker Award by the Director's Guild of America.  She is the 2011 Spike Lee Production Fund Award recipient. <br />Her work was shortlisted at the AICP Show in New York and at the Cannes 2010 Young Directors Award Show. She was awarded the World Bronze Medal at the 2010 International Advertising Awards in Shanghai, as well as 1st Prize at the 2010 Porsche Awards. She was featured in Shoot Magazine as a 2010 New Director To Watch in the ''New Director's Showcase''.</div>
	</div>
    
  <img src="../images/scroll_white_short.png" border="0" style="position:relative; top:-82px; left:195px;"/><br />
 
 <img src="../images/close.gif" border="0" style="position:relative; top:-190px; left:195px;" onmouseover="this.src='../images/close_mouse_over.gif'" onmouseout="this.src='../images/close.gif'" onclick="popup_box.style.visibility='hidden';"/>
        
  </div>
  
  
  
  
  
    
</body>
<script language="javascript" type="text/javascript" src="../scripts/common.js"></script>
<script language="javascript" type="text/javascript" src="film2.js"></script>
<script language="javascript" type="text/javascript" src="../scripts/video.js"></script>
    
<script language="javascript" type="text/javascript">
	animate_selected('director');
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

<script language="javascript" src="director/lovell_scroller2.js"></script>
<script language="javascript" src="director/post_video_load2.js"></script>
<script language="javascript" src="director/director.js"></script>
</html>
