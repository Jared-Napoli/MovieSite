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
  		<TITLE>Employee Main Page</TITLE>
	</HEAD>
	<td>
	<CENTER>
	<BODY>
		<H1 align="center">Welcome Loyal Employee!</H1>
    <br>
    <h2>Insert a Star:</h2>
    <br>
        <FORM ACTION="/fabflix/employee/insert_star" METHOD="get">
    Star's Name: <INPUT TYPE="TEXT" NAME="star_name">
    <br>
    <INPUT TYPE="SUBMIT" VALUE="Insert Star"><br>
  </FORM>
  </td>
</BODY>
</HTML>