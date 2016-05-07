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
		<TITLE>Meta Data</TITLE>
	</HEAD>
<BODY>
	<CENTER>
		<H1>Got Your Meta Data Right Here</H1>
			<%
				ArrayList<String> md = (ArrayList<String>)request.getAttribute("meta_data");
				for(String line : md)
				{
			%>
					<%=line%><br>
			<%	}
			%>
	<FORM action="/fabflix/employee/main" method=GET align=center>
		<INPUT style="height: 2em; width: 25em" TYPE="submit" VALUE="Return To Main Page">
	</FORM>
</BODY>
</CENTER>
</HTML>