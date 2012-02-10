<?php require("../codes/header.php"); require("../codes/body.php"); ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" manifest="../cache.manifest">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>The Studio</title>
<meta name="keywords" content="design, animation, visual effects, based in New York, high-end, commercials, post production, music video, digital effects, special effects, showreel, production, editing, animatics, cinematics, postproduction, digital, mobile, web design, 3-D, 2-D, motion graphics" />
<meta name="description" content="The STUDIO is an design animation and visual effects company based in New York which specializes in high-end storyboards, animatics, cinematics, animation, editing, and production" />
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
</head>

<body>
<!-- -->
<img src="../images/images_template_extended_v2.png" width="900" height="549" style="position:absolute; left: 14px; top: 36px; z-index:1"  />

<div id="top_section" style="height: 60px; width: 419px; position:absolute; top: 61px; left: 344px; z-index:2; overflow:hidden;"  onmouseover="inZone(true)" onmouseout="inZone(false)">
  <img src="../images/bar.png" width="2" height="60" border="0" style="position:absolute;z-index:3;" />


<table border="0" cellspacing="0" cellpadding="0" id="image_table" style="position:relative; right:0px; cursor:pointer;" onmouseout="checkBounderies()">
    <tr>
      <td><img src="../images/bar.png" width="2" border="0" /></td>
      <td><div id="1" class="imageSlideThumbs" onclick="previewImage(this)"></div></td>
      <td><img src="../images/bar.png" width="2" border="0" /></td>
      <td><div id="2" class="imageSlideThumbs" onclick="previewImage(this)"></div></td>
      <td><img src="../images/bar.png" width="2" border="0" /></td>
      <td><div id="3" class="imageSlideThumbs" onclick="previewImage(this)"></div></td>
      <td><img src="../images/bar.png" width="2" border="0" /></td>
      <td><div id="4" class="imageSlideThumbs" onclick="previewImage(this)"></div></td>
      <td><img src="../images/bar.png" width="2" border="0" /></td>
      <td><div id="5" class="imageSlideThumbs" onclick="previewImage(this)"></div></td>
      <td><img src="../images/bar.png" width="2" border="0" /></td>
      <td><div id="6" class="imageSlideThumbs" onclick="previewImage(this)"></div></td>
      <td><img src="../images/bar.png" width="2" border="0" /></td>
      <td><div id="7" class="imageSlideThumbs" onclick="previewImage(this)"></div></td>
      <td><img src="../images/bar.png" width="2" border="0" /></td>
      <td><div id="8" class="imageSlideThumbs" onclick="previewImage(this)"></div></td>
      <td><img src="../images/bar.png" width="2" border="0" /></td>
      <td><div id="9" class="imageSlideThumbs" onclick="previewImage(this)"></div></td>
      <td><img src="../images/bar.png" width="2" border="0" /></td>
      <td><div id="10" class="imageSlideThumbs" onclick="previewImage(this)"></div></td>
      <td><img src="../images/bar.png" width="2" border="0" /></td>
      <td><div id="11" class="imageSlideThumbs" onclick="previewImage(this)"></div></td>
      <td><img src="../images/bar.png" width="2" border="0" /></td>
      <td><div id="12" class="imageSlideThumbs" onclick="previewImage(this)"></div></td>
      <td><img src="../images/bar.png" width="2" border="0" /></td>
    </tr>
  </table> 



</div>





<div id="mid_section" style="height: 334px; width: 456px; position:absolute; top: 123px; left: 321px; z-index:2">
 
<table width="100%" height="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td align="center" valign="middle" id="preview"><img src="images/1.png" alt=" " width="428" height="305" border="0" /></td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
</table>
</div>






<div id="down_section" style="position:absolute; width: 440px; height: 90px; left: 339px; top: 482px; z-index:3; overflow:hidden;">

	<div style="position:absolute; z-index:4; left: 411px; top: 10px;" onmouseover="TextDivMoveDirection('up')" onmouseout="TextDivMoveDirection(''); text_scroll_speed=2;" onclick="text_scroll_speed +=2"><img src="../images/scroll_arrow_up.png" alt=" Scroll Up " width="18" height="14" border="0" onmouseout="swapEffect(this, '../images/scroll_arrow_up.png')" onmouseover="swapEffect(this, '../images/scroll_arrow_up_colored.png')"/></div>
  <div style="position:absolute; z-index:4; left: 412px; top: 69px;" onmouseover="TextDivMoveDirection('down')" onmouseout="TextDivMoveDirection(''); text_scroll_speed=2" onclick="text_scroll_speed +=2"><img src="../images/scroll_arrow_down.png" alt=" Scroll Up " width="18" height="13" border="0" onmouseout="swapEffect(this, '../images/scroll_arrow_down.png')" onmouseover="swapEffect(this, '../images/scroll arrow_down_colored.png')"/></div>
  <img src="../images/scroll_brown_bar.png" width="2" height="52" border="0" style="position:absolute; z-index:3; left: 419px; top: 20px;" />
<div id="text_div" style="position:relative; width:400px; top: 0px; left:0px">
  
  There are 23 of us - directors, artists, designers, animators, programmers and visual-effects artisans collaborating on projects for screens and pages everywhere. <br />
<br />
Our mission is to help grow our clients' businesses by bringing strategic vision, artistry, imagination, delight, and clarity to the world of communication.


</div>

</div>



<?php bulbs("images_template_extended_v2", "../images"); ?>


<table width="1240" border="0" cellspacing="0" cellpadding="0" style="position:absolute">
      <tr>
        <td width="529" align="left" valign="top"><a href="../reel.php" target="_self"><img src="../images/icon.png" alt="LOGO" border="0" class="logo" /></a></td>
        <td width="105" valign="middle">&nbsp;</td>
        <td width="586" align="right" valign="top">
        <table width="300" border="0" cellspacing="2" cellpadding="2">
          <tr>               
            <td width="303">                 <div class="ui-widget">
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
          <td><a href="../animation/index.php" target="_self" onmouseover="animate_link('animation')" onmouseout="hide_link_animation('animation', 75)"><img src="../images/animation.png" width="256" height="31" border="0" /></a></td>
        </tr>
        <tr>
          <td><a href="../film/index.php" target="_self" onmouseover="animate_link('film')" onmouseout="hide_link_animation('film', 75)"><img src="../images/film.png" width="256" height="37" border="0"  /></a></td>
        </tr>
        <tr>
          <td><a href="../studio/index.php" target="_self" onmouseover="animate_link('studio')" onmouseout="hide_link_animation('studio', 75)"><img src="../images/the_studio.png" width="256" height="33" border="0"  /></a></td>
        </tr>
        <tr>
          <td><img src="../images/about_us.png" width="256" height="35" border="0"  /></td>
        </tr>
	<!--
        <tr>
          <td><table width="100%" border="0" cellspacing="2" cellpadding="2">
            <tr>
              <td width="6%">&nbsp;</td>
              <td width="94%"><a href="community.php" target="_self" onmouseover="animate_sub_link('community')" onmouseout="hide_sub_link_animation('community', 75)"><img src="../images/community.png" alt="" width="250" height="17" border="0" /></a></td>
            </tr>
          </table></td>
        </tr>
	-->
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

<table width="1240" border="0" cellspacing="1" cellpadding="1" style="position:absolute; top: 739px; left: 9px;">
      <tr>
        <td width="305" align="left"><table width="133" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td height="111" align="center"><a href="community.php" target="_self"><img src="../images/big_frameface_aboutus.png" width="225" height="233" border="0"/></a></td>
          </tr>
          <tr>
            <td align="center" id="community">&nbsp; </td>
          </tr>
          <tr>
            <td align="center"><a href="http://www.facebook.com/STUDIONYC" target="_blank"><img src="../images/facebook.png" alt=" Facebook " width="32" height="32" border="0" onmouseover="this.src='../images/facebook_colored.png';community.innerHTML='Facebook';" onmouseout="this.src='../images/facebook.png';community.innerHTML='&nbsp;';" title=" Visit us on Facebook " /></a>&nbsp;<a href="http://twitter.com/thestudionyc" target="_blank"><img src="../images/twitter.png" alt=" Twitter " width="32" height="32" border="0" onmouseover="this.src='../images/twitter_colored.png';community.innerHTML='Twitter';" onmouseout="this.src='../images/twitter.png';community.innerHTML='&nbsp;';" title=" Tweet us... "/></a>&nbsp;<a href="http://www.vimeo.com/thestudionyc" target="_blank"><img src="../images/v.png" alt=" Vimeo " width="32" height="32" border="0" onmouseover="this.src='../images/v_colored.png';community.innerHTML='Vimeo';" onmouseout="this.src='../images/v.png';community.innerHTML='&nbsp;';" title=" Visit us on Vimeo "/></a></td>
          </tr>
        </table></td>
        <td width="834" align="left" valign="bottom"> <font size="-12" face="Arial, Helvetica, sans-serif"> &copy; 2011 The Studio | 12 West 27th Street, New York, NY 10001 | Phone: 212. 661.1363 | Fax: 212.661.1607 | Email:  <a href="mailto:info@studionyc.com">info@studionyc.com</a></font></td>
        <td width="91" align="center" valign="bottom">&nbsp;</td>
      </tr>
    </table>
    
    <div style="position:absolute; z-index:3; color:#F00; left: 338px; top: 454px; font-size:small">[About Us]</div>
</body>
<script language="javascript" type="text/javascript" src="../scripts/common.js"></script>
<script language="javascript" type="text/javascript" src="about2.js"></script>
<script language="javascript" type="text/javascript">
	animate_selected_sub_link('about');	
</script>

<script language="javascript" src="lovell_scroller.js"></script>
</html>
