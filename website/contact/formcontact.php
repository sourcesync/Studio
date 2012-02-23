<?php

$field_name = $_POST['cf_name'];
$field_email = $_POST['cf_email'];
$field_phone = $_POST['cf_phone'];
$field_message = $_POST['cf_message'];
$field_test = $_POST['cf_test'];

$mail_to = 'support@studionyc.com';
$subject = 'Message from a site visitor ' . $field_name;

$body_message = 'From: '.$field_name."\n";
$body_message .= 'E-mail: '.$field_email."\n";
$body_message .= 'Message: '.$field_message;

$headers = "From: $cf_email\r\n";
$headers .= "Reply-To: $cf_email\r\n";

if ( (empty($field_message)) ) { ?>
	<script language="javascript" type="text/javascript">
		alert('The comment field was empty or invalid, Please try again.');
		window.location = '/contact/support.php';
	</script>
<?php
}

else
{
//$mail_status = mail($mail_to, $subject, $body_message, $headers);

include_once("Mail.php"); 
$to =  "support@studionyc.com";
$subject = "Support Email From " . $field_email;
$body = "Name:" . $field_name . "\nEmail: " . $field_email . "\nPhone: " . $field_phone . "\nComment:" . $field_message;
//$body = "Name: " . $field_name . "\nEmail:  " . $field_email . "\nPhone:  " . $field_phone . "\nComment:" . $field_message;
$mail_status = mail($to, $subject, $body); 

if ($mail_status) { ?>
	<script language="javascript" type="text/javascript">
		// Print a message
		alert('Thank you for the message. We will contact you shortly.');
		// Redirect to some page of the site. You can also specify full URL, e.g. http://template-help.com
		window.location = '/contact/support.php';
	</script>
<?php
}

else { ?>
	<script language="javascript" type="text/javascript">
		// Print a message
		alert('Message failed. Please, send an email to gordon@template-help.com');
		// Redirect to some page of the site. You can also specify full URL, e.g. http://template-help.com
		window.location = '/contact/support.php';
	</script>
<?php
}
}
?>
