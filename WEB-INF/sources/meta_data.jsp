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
	<div align="right"><%@include file="quickSearch.jsp"%></div>
<BODY>
	<div style="font-family: Verdana; font-weight: bold; font-size: 14px; padding:10px;">
	<CENTER>
		<div style="font-family: Verdana; font-weight: bold; font-size: 22px; padding:10px;">
		<H1>Got Your Meta Data Right Here</H1>
			<%
				ArrayList<String> md = (ArrayList<String>)request.getAttribute("meta_data");
				for(String line : md)
				{
			%>
					<%=line%><br>
			<%	}
			%>
	<FORM action="/project4/employee/main" method=GET align=center>
		<INPUT style="color: #FFFFFF; font-family: Verdana; font-weight: bold; font-size: 14px; background-color: #808080" TYPE="submit" VALUE="Return To Main Page">
	</FORM>
</BODY>
</div>
</div>
</CENTER>
</HTML>