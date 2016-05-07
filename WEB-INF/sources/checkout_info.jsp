<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<HTML>
<HEAD>
	<link rel="stylesheet" type="text/css" href="mystyle.css">
 	<TITLE>Checkout Info Page</TITLE>
</HEAD>
<BODY BGCOLOR="#FDF5E6">
	<H1 align="center">Good Checkout Pal!</H1>
	<FORM action="/fabflix/customer/main" method=GET align=center>
		<INPUT style="height: 2em; width: 25em" TYPE="submit" VALUE="Return To Main Page">
	</FORM>
	<FORM ACTION="/fabflix/customer/checkout/process" METHOD="post">
		First Name: <INPUT TYPE="TEXT" NAME="first_name">
		<br>
		Last Name: <INPUT TYPE="TEXT" NAME="last_name">
		<br>
		Card Number: <INPUT TYPE="TEXT" NAME="cc_number">
		<br>
		<INPUT TYPE="SUBMIT" VALUE="Search"><br>
	</FORM>
</BODY>
</HTML>