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
		<TITLE>Add Movie</TITLE>
	</HEAD>
<BODY>
	<CENTER>
		<H1>Great Job Clicking Add Movie, Dude!</H1>
		<%
			ArrayList<String> msg = (ArrayList<String>)request.getAttribute("message_list");
			for(String line : msg)
		{
		%>
				<%=line%><br>
		<%	}
		%>
	<FORM action="/project4/employee/main" method=GET align=center>
		<INPUT style="height: 2em; width: 25em" TYPE="submit" VALUE="Return To Main Page">
	</FORM>
</BODY>
</CENTER>
</HTML>