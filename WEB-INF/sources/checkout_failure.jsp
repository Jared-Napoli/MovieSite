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
		<TITLE>Checkout Succeeded</TITLE>
	</HEAD>
<BODY>
	<CENTER>
		<H1>Checkout Failed, You Suck.</H1>
	<FORM action="/fabflix/customer/checkout/info" method=GET align=center>
		<INPUT style="height: 2em; width: 25em" TYPE="submit" VALUE="Retry">
	</FORM>
	<FORM action="/fabflix/customer/main" method=GET align=center>
		<INPUT style="height: 2em; width: 25em" TYPE="submit" VALUE="Return To Main Page">
	</FORM>
</BODY>
</CENTER>
</HTML>