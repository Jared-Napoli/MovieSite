<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<HTML>
<HEAD>
	<link rel="stylesheet" type="text/css" href="mystyle.css">
 	<TITLE>Search Page</TITLE>
</HEAD>
<BODY BGCOLOR="#FDF5E6">
	<H1 align="center">Good Search Buddy WOOO!</H1>
	<FORM action="/fabflix/customer/main" method=GET align=center>
		<INPUT style="height: 2em; width: 25em" TYPE="submit" VALUE="Return To Main Page">
	</FORM>
	<FORM ACTION="/fabflix/customer/search/result" METHOD="get">
		Title: <INPUT TYPE="TEXT" NAME="title">
		<br>
		Year: <INPUT TYPE="TEXT" NAME="year">
		<br>
		Director: <INPUT TYPE="TEXT" NAME="director">
		<br>
		Star's First Name: <INPUT TYPE="TEXT" NAME="a_first_name">
		<br>
		Star's Last Name: <INPUT TYPE="TEXT" NAME="a_last_name">
		<INPUT TYPE="HIDDEN" NAME="orderBy" VALUE="title">
		<INPUT TYPE="HIDDEN" NAME="direction" VALUE="ASC">
		<INPUT TYPE="HIDDEN" NAME="numResults" VALUE="10">
		<INPUT TYPE="HIDDEN" NAME="currResult" VALUE="0">
		<INPUT TYPE="HIDDEN" NAME="totalResults" VALUE="0"><br>
		<CENTER>
		<INPUT TYPE="SUBMIT" VALUE="Search"><br>
	</FORM>
			<br>
			<FORM ACTION="/fabflix/customer/checkout" METHOD="get">
    		<INPUT ID = "checkOut" TYPE="SUBMIT" VALUE="Checkout"></INPUT>
			</FORM>
		</CENTER>
</BODY>
</HTML>
