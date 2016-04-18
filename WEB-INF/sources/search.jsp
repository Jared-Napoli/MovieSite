<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<HTML>
<HEAD>
	<link rel="stylesheet" type="text/css" href="mystyle.css">
 	<TITLE>Search Page</TITLE>
</HEAD>
<%@include file="verify.jsp"%>
<BODY BGCOLOR="#FDF5E6">
	<H1 align="center">Good Search Buddy WOOO!</H1>
	<FORM ACTION="/fabflix/search/result" METHOD="get">
		Title: <INPUT TYPE="TEXT" NAME="title">
		<br>
		Year: <INPUT TYPE="TEXT" NAME="year">
		<br>
		Director: <INPUT TYPE="TEXT" NAME="director">
		<br>
		Star's First Name: <INPUT TYPE="TEXT" NAME="a_first_name">
		<br>
		Star's Last Name: <INPUT TYPE="TEXT" NAME="a_last_name">
		<CENTER>
			<INPUT TYPE="SUBMIT" VALUE="Search">
		</CENTER>
	</FORM>
</BODY>
</HTML>
