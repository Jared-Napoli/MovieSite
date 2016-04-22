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
	<%
		//request.getSession().setAttribute("username", request.getParameter("username"));
		//request.getSession().setAttribute("password", request.getParameter("password"));
	%>
	<td>
	<%@include file="verify.jsp"%>
	<CENTER>
	<BODY>
		<H1 align="center">Welcome USER!</H1>
	<FORM ACTION="/fabflix/search"
      METHOD="get">
    <INPUT TYPE="SUBMIT" VALUE="Search"></INPUT></FORM>OR<FORM ACTION="/fabflix/browse"
      METHOD="get">
    <INPUT TYPE="SUBMIT" VALUE="Browse"></INPUT>
</FORM>
<FORM ACTION="/fabflix/Cart"
      METHOD="get">
    <INPUT ID = "checkOut" TYPE="SUBMIT" VALUE="Checkout"></INPUT>
</FORM>
</CENTER>
</td>
</BODY>
</HTML>
