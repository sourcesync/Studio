<?php require("../codes/header.php"); require("../codes/body.php"); ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" manifest="../cache.manifest">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>The Studio</title>
<meta name="keywords" content="design, animation, visual effects, based in New York, high-end, commercials, post production, music video, digital effects, special effects, showreel, production, editing, animatics, cinematics, postproduction, digital, mobile, web design, 3-D, 2-D, motion graphics" />
<meta name="description" content="The STUDIO is an design, animation and visual effects company based in New York which specializes in high-end storyboards, animatics, cinematics, animation, editing, and production." />
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
<link rel="stylesheet" type="text/css" href="../scripts/common.css" />
</head>

<body>
<!-- -->
<div id="top_section" style="height: 61px; width: 520px; position:absolute; top: 61px; left: 321px; z-index:2"> &nbsp;&nbsp;&nbsp;<img src="../images/orange_bar.png" width="122" height="60" border="0" /></div>


<img src="../images/images_template_extended_v2.png" width="900" height="549" style="position:absolute; left: 14px; top: 36px; z-index:1"  />

<div style="position:absolute; left: 330px; top: 134px;">
	<img src="main/<?php print rand(1, 2); ?>.png" width="428" height="305" alt=" " />
</div>

<div id="down_section" style="position:absolute; width: 440px; height: 90px; left: 339px; top: 482px; z-index:3; overflow:hidden;">

  <div style="position:absolute; z-index:4; left: 411px; top: 9px;" onmouseover="TextDivMoveDirection('up')" onmouseout="TextDivMoveDirection(''); text_scroll_speed=2;" onclick="text_scroll_speed +=2"><img src="../images/scroll_arrow_up.png" alt=" Scroll Up " width="18" height="14" border="0" onmouseout="swapEffect(this, '../images/scroll_arrow_up.png')" onmouseover="swapEffect(this, '../images/scroll_arrow_up_colored.png')"/></div>
<div style="position:absolute; z-index:4; left: 412px; top: 69px;" onmouseover="TextDivMoveDirection('down')" onmouseout="TextDivMoveDirection(''); text_scroll_speed=2" onclick="text_scroll_speed +=2"><img src="../images/scroll_arrow_down.png" alt=" Scroll Up " width="18" height="13" border="0" onmouseout="swapEffect(this, '../images/scroll_arrow_down.png')" onmouseover="swapEffect(this, '../images/scroll arrow_down_colored.png')"/></div>


  <div id="text_div" style="position:relative; width:400px; top: 0px; left:0px">
    
   We believe in the studio both as concept and actual workspace… a space where art meets commerce.<br /><br />

Every day, our team of  illustrators, animators, directors, technologists, editors and vfx artisans come together to collaborate and experiment on projects for pages and screens everywhere.
  

  </div>

</div>
<img src="../images/scroll_brown_bar.png" style="position:absolute; z-index:4; left: 758px; top: 502px;" />

</div>


<?php bulbs("images_template_extended_v2", "../images"); ?>

<table width="1240" border="0" cellspacing="0" cellpadding="0" style="position:absolute">
      <tr>
        <td width="529" align="left" valign="top"><a href="../reel.php" target="_self"><img src="../images/icon.png" alt="LOGO" border="0" class="logo" /></a></td>
        <td width="105" valign="middle">&nbsp;</td>
        <td width="586" align="right" valign="top">
        
        <table width="300" border="0" cellspacing="2" cellpadding="2">
          <tr>
            <td width="303">                <div class="ui-widget">
                    <label for="search_input"></label>
                    <input type="text" id="search_input" style="visibility:hidden" size="32" maxlength="64" onkeyup="activeSearch(event)">
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
          <td><img src="../images/the_studio.png" width="256" height="33" border="0"  /></td>
        </tr>
        <tr>
          <td><table width="100%" border="0" cellspacing="2" cellpadding="1">
            <tr>
              <td width="6%">&nbsp;</td>
              <td width="94%"><a href="artists2/sarah.php" target="_self" onmouseover="animate_sub_link('artists')" onmouseout="hide_sub_link_animation('artists', 75)"><img src="../images/artists.png" width="250" height="15" border="0"/></a></td>
            </tr>
            <tr>
              <td>&nbsp;</td>
              <td><a href="character_development.php" target="_self" onmouseover="animate_sub_link('character_development')" onmouseout="hide_sub_link_animation('character_development', 75)"><img src="../images/character_development.png" width="250" height="17" border="0" /></a></td>
            </tr>
            <tr>
              <td>&nbsp;</td>
              <td><a href="animatics_cinematics.php" target="_self" onmouseover="animate_sub_link('animatics_cinematics')" onmouseout="hide_sub_link_animation('animatics_cinematics', 75)"><img src="../images/animatics_cinemantics.png" width="250" height="16" border="0" /></a></td>
            </tr>
            <tr>
              <td>&nbsp;</td>
              <td><a href="technical_medical.php" target="_self" onmouseover="animate_sub_link('technical_medical')" onmouseout="hide_sub_link_animation('technical_medical', 75)"><img src="../images/technical_medical.png" width="250" height="17" border="0" /></a></td>
            </tr>
            <tr>
              <td>&nbsp;</td>
              <td><a href="design.php" target="_self" onmouseover="animate_sub_link('design')" onmouseout="hide_sub_link_animation('design', 75)"><img src="../images/design.png" width="250" height="19" border="0" /></a></td>
            </tr>
          </table></td>
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
    
    
    <div style="position:absolute; z-index:3; color:#F00; left: 338px; top: 454px; font-size:small">[The Studio]</div>
</body>
<script language="javascript" type="text/javascript" src="../scripts/common.js"></script>
<script language="javascript" type="text/javascript" src="studio.js"></script>
    
<script language="javascript" type="text/javascript">
	animate_selected_sub_link('studio');
</script>

<script language="javascript" src="main/lovell_scroller.js"></script>
</html>
