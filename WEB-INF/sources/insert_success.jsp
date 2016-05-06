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
		<TITLE>Insert Success</TITLE>
	</HEAD>
<BODY>
	<CENTER>
		<H1>Successfully Inserted, Bitch!</H1>
	<FORM action="/fabflix/employee/main" method=GET align=center>
		<INPUT style="height: 2em; width: 25em" TYPE="submit" VALUE="Return To Main Page">
	</FORM>
</BODY>
</CENTER>
</HTML>