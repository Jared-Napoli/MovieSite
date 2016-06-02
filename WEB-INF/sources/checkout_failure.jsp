<%@page import="java.sql.*,
 javax.sql.*,
 java.io.IOException,
 javax.servlet.http.*,
 javax.servlet.*,
 java.util.*"
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<%@page import="SQLClasses.*"%>

<HTML>
	<HEAD>
	<link rel="stylesheet" type="text/css" href="../mystyle.css">
		<TITLE>Checkout Failed</TITLE>
	</HEAD>
	<div align="right"><%@include file="quickSearch.jsp"%></div>
<BODY bgcolor = "cccccc">
	<CENTER>
		<div style="color:black; font-family: Verdana; font-size: 22px; padding:10px;">
		<H1>Oops, Failed to Checkout!</H1>
	</div>
	<FORM action="/project4/customer/checkout/info" method=GET align=center>
		<INPUT style="color: #FFFFFF; font-family: Verdana; font-weight: bold; font-size: 14px; background-color: #808080" TYPE="submit" VALUE="Retry">
	</FORM>
	<FORM action="/project4/customer/main" method=GET align=center>
		<INPUT style="color: #FFFFFF; font-family: Verdana; font-weight: bold; font-size: 14px; background-color: #808080" TYPE="submit" VALUE="Return To Main Page">
	</FORM>
</BODY>
</CENTER>
</HTML>