<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<HTML>
<HEAD>
	<link rel="stylesheet" type="text/css" href="../mystyle.css">
 	<TITLE>Checkout Info Page</TITLE>
</HEAD>
<div align="right"><%@include file="quickSearch.jsp"%></div>
<CENTER>
<BODY BGCOLOR="#cccccc">
	<div style="color:black; font-family: Verdana; font-size: 22px; padding:10px;">
	<H1 align="center">You Are Checking Out</H1>
	</div>
	<FORM action="/fabflix/customer/main" method=GET align=center>
		<INPUT style="color: #FFFFFF; font-family: Verdana; font-weight: bold; font-size: 14px; background-color: #808080" TYPE="submit" VALUE="Return To Main Page">
	</FORM>
	<div style="font-family: Verdana; font-weight: bold; font-size: 14px; padding:10px;">
	<FORM ACTION="/fabflix/customer/checkout/process" METHOD="post">
		First Name: <INPUT TYPE="TEXT" style="font-family: Verdana; font-size: 14px;" NAME="first_name">
		<br>
		Last Name: <INPUT TYPE="TEXT" style="font-family: Verdana; font-size: 14px;" NAME="last_name">
		<br>
		Card Number: <INPUT TYPE="TEXT" style="font-family: Verdana; font-size: 14px;" NAME="cc_number">
		<br><BR>
		<INPUT TYPE="SUBMIT" style="color: #FFFFFF; font-family: Verdana; font-weight: bold; font-size: 14px; background-color: #808080" VALUE="Search"><br>
	</FORM>
</div>
</BODY>
</CENTER>
</HTML>