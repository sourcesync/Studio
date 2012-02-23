<?php require("../codes/header.php"); require("../codes/body.php"); ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" manifest="../cache.manifest">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>The Studio</title>
<meta name="keywords" content="design, animation, visual effects, based in New York, high-end, commercials, post production, music video, digital effects, special effects, showreel, production, editing, animatics, cinematics, postproduction, digital, mobile, web design, and more." />
<meta name="description" content="Contact The STUDIO via phone fax and/or email. We specialize in high-end storyboards, animatics, cinematics, animation, editing, and production" />
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

<img src="../images/contact_template.png" width="919" height="517" style="position:absolute; left: 14px; top: 36px; z-index:1"/>

<div id="mid_section" style="height: 369px; width: 1012px; position:absolute; top: 61px; left: 320px; z-index:3; overflow:hidden">


    <div style="width:680px; position: relative; top:61px; left:25px; z-index:3">
        Hello there!  Glad you dropped by- We are here to help you!<br />
        Fill out the form and let us know the trouble you are experiencing.<br />
        We will handle all support requests as soon as we can.<br />
        <br />
        <br />
        <br />
	<form action="/contact/formcontact.php" method="post" >
		<table>
		<tr><td>Name<td></td><td><input size="70" type="text" name="cf_name" /></td></tr>
		<tr><td>Email<td></td><td><input size="70" type="text" name="cf_email" /></td></tr>
		<tr><td>Phone<td></td><td><input size="70" type="text" name="cf_phone" /></td></tr>
		<tr><td>Comments<td></td><td><textarea style="resize:none;" cols="50" name="cf_message" ></textarea></td></tr>
		<tr><td></td><td><input type="hidden" name="cf_test" value="EEnglish"></td></tr>
		</table>
		<br/>
		<br/>
		<INPUT type="submit" name="submit" value="Submit">
		<INPUT type="reset" name="reset" value="Reset">
		<br/>
	</form>	
    </div>

</div>

<!--
<div id="mid_section" style="height: 369px; width: 612px; position:absolute; top: 61px; left: 320px; z-index:3; overflow:hidden">

	<div style="position:relative; top:10px; left:0px;"><img src="../images/contact_the_studio.png" width="445" height="35" alt="CONTACT THE STUDIO!" /></div>

	<div style="width:180px; position: relative; top:25px; left:25px; z-index:3">
    	12 West 27th Street<br />
      	11th Floor<br />
      	New York, NY 10001<br />
      	<br />
        P: [212] 661-1363<br />
        F: [212] 661-1607
    </div>
	
    
    <div style="width:200px; position:relative; top:-60px; left:400px;z-index:5">
    	<font color="#CC0000">Mary Nittolo</font><br />
		Founder &amp; President<br />
        <a href="mailto:mary@studionyc.com">mary@studionyc.com</a><br />
		<br />
		
        <font color="#CC0000">Gary Giambalvo</font><br />
		Executive Producer<br />
        <a href="mailto:gary@studionyc.com">gary@studionyc.com</a><br />
		<br />
        
        <a href="mailto:submissions@studionyc.com">submissions@studionyc.com</a>
   	  
  </div>

	<div style="position:absolute; top:45px; left:30px">
    <img src="../images/broadway_sign.png" width="500" height="321"/></div>


</div>
-->

<?php bulbs("contact_template", "../images"); ?>

<table width="1240" border="0" cellspacing="0" cellpadding="0" style="position:absolute">
      <tr>
        <td width="529" align="left" valign="top"><a href="../reel.php" target="_self"><img src="../images/icon.png" alt="LOGO" border="0" class="logo" /></a></td>
        <td width="105" valign="middle">&nbsp;</td>
        <td width="586" align="right" valign="top">
        <table width="300" border="0" cellspacing="2" cellpadding="2">
          <tr>
            <td width="303">                
            	<div class="ui-widget">
                    <label for="search_input"></label>
                    <input type="text" id="search_input" style="visibility:hidden;" size="32" maxlength="64" onkeyup="activeSearch(event)"  x-webkit-speech>
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
          <td><a href="../about/index.php" target="_self" onmouseover="animate_link('about')" onmouseout="hide_link_animation('about', 75)"><img src="../images/about_us.png" width="256" height="35" border="0"  /></a></td>
        </tr>
        <tr>
          <td><img src="../images/contact.png" width="256" height="30" border="0" /></td>
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
            <td height="111" align="center"><a href="../about/community.php" target="_self"><img src="../images/big_frameface_aboutus.png" alt=" Community " width="225" height="233" border="0" onmouseover="community.innerHTML = 'Community';" onmouseout="community.innerHTML = '&nbsp;';" /></a></td>
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



<div style="position:absolute; left:334px; top:445px; z-index:4;">
<img src="../images/wbenc.png" alt=" WBENC " /></div>

</body>
<script language="javascript" type="text/javascript" src="../scripts/common.js"></script>
<script language="javascript" type="text/javascript" src="contact.js"></script>
    
<script language="javascript" type="text/javascript">
	animate_selected_sub_link('contact');
</script>
</html>
