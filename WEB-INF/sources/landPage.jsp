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
  		<link rel="stylesheet" type="text/css" href="../mystyle.css">
      <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
      <script src="//code.jquery.com/jquery-1.10.2.js"></script>
      <link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
      <script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>

  		<TITLE>Home Page</TITLE>
	</HEAD>
  <div align="right"><%@include file="quickSearch.jsp"%></div>
	<td>
	<CENTER>
	<BODY>
    <div style="color:black; font-family: Verdana; font-size: 22px; padding:10px;">
		  <H1 align="center">Welcome USER!</H1>
  </div>
	<FORM ACTION="/fabflix/customer/search"
      METHOD="get">
    <INPUT TYPE="SUBMIT" style="color: #FFFFFF; font-family: Verdana; font-weight: bold; font-size: 14px; background-color: #808080" VALUE="Search"></INPUT>
  </FORM>
    <FORM ACTION="/fabflix/customer/browse" METHOD="get">
    <INPUT TYPE="SUBMIT" style="color: #FFFFFF; font-family: Verdana; font-weight: bold; font-size: 14px; background-color: #808080" VALUE="Browse">
    </INPUT>
</FORM>
<FORM ACTION="/fabflix/customer/checkout"
      METHOD="get">
    <INPUT ID = "checkOut" TYPE="SUBMIT" style="color: #FFFFFF; font-family: Verdana; font-weight: bold; font-size: 14px; background-color: #808080" VALUE="Checkout"></INPUT>
</FORM>
</CENTER>
</td>
</BODY>
</HTML>
