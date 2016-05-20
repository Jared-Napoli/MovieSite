<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<HTML>
<HEAD>
	<link rel="stylesheet" type="text/css" href="../mystyle.css">
 	<TITLE>Search Page</TITLE>

</HEAD>
<div align="right"><%@include file="quickSearch.jsp"%></div>

<BODY>
	<div style="color:black; padding:8px; font-family: Verdana; font-weight: bold; font-size: 22px;">
		<H1 align="center">Search Fabflix</H1>
	</div>
	<FORM action="/fabflix/customer/main" method=GET align=center>
		<INPUT TYPE="submit" style="color: #FFFFFF; font-family: Verdana; font-weight: bold; font-size: 14px; background-color: #808080" VALUE="Return To Main Page">
	</FORM>
	<div style="color:black; font-family: Verdana; font-weight: bold; font-size: 22px; padding:10px;">
	<FORM ACTION="/fabflix/customer/search/result" METHOD="get">
		Title: <INPUT TYPE="TEXT" style="font-family: Verdana; font-size: 14px;" NAME="title">
		<br>
		Year: <INPUT TYPE="TEXT" style="font-family: Verdana; font-size: 14px;" NAME="year">
		<br>
		Director: <INPUT TYPE="TEXT" style="font-family: Verdana; font-size: 14px;" NAME="director">
		<br>
		Star's First Name: <INPUT TYPE="TEXT" style="font-family: Verdana; font-size: 14px;" NAME="a_first_name">
		<br>
		Star's Last Name: <INPUT TYPE="TEXT" style="font-family: Verdana; font-size: 14px;" NAME="a_last_name">
	</div>
		<INPUT TYPE="HIDDEN" NAME="orderBy" VALUE="title">
		<INPUT TYPE="HIDDEN" NAME="direction" VALUE="ASC">
		<INPUT TYPE="HIDDEN" NAME="numResults" VALUE="10">
		<INPUT TYPE="HIDDEN" NAME="currResult" VALUE="0">
		<INPUT TYPE="HIDDEN" NAME="totalResults" VALUE="0"><br>
		<CENTER>
		<INPUT TYPE="SUBMIT" style="color: #FFFFFF; font-family: Verdana; font-weight: bold; font-size: 14px; background-color: #808080" VALUE="Search"><br>
	</FORM>
			<br>
			<FORM ACTION="/fabflix/customer/checkout" METHOD="get">
    		<INPUT ID = "checkOut" style="color: #FFFFFF; font-family: Verdana; font-weight: bold; font-size: 14px; background-color: #808080" TYPE="SUBMIT" VALUE="Checkout"></INPUT>
			</FORM>
		</CENTER>
</BODY>
</HTML>
