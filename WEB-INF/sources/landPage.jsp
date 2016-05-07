<%@page import="java.sql.*,
 javax.sql.*,
 java.io.IOException,
 javax.servlet.http.*,
 javax.servlet.*,
 java.util.*,
 SQLClasses.*"
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<HTML>
	<HEAD>
  		<link rel="stylesheet" type="text/css" href="mystyle.css">
  		<TITLE>Home Page</TITLE>
	</HEAD>
	<td>
	<CENTER>
	<BODY>
		<H1 align="center">Welcome USER!</H1>
	<FORM ACTION="/fabflix/customer/search"
      METHOD="get">
    <INPUT TYPE="SUBMIT" VALUE="Search"></INPUT></FORM>OR<FORM ACTION="/fabflix/customer/browse"
      METHOD="get">
    <INPUT TYPE="SUBMIT" VALUE="Browse"></INPUT>
</FORM>
<FORM ACTION="/fabflix/customer/checkout"
      METHOD="get">
    <INPUT ID = "checkOut" TYPE="SUBMIT" VALUE="Checkout"></INPUT>
</FORM>
</CENTER>
</td>
</BODY>
</HTML>
