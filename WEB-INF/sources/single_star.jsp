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
  		<link rel="stylesheet" type="text/css" href="mystyle.css">
  		<TITLE>Single Star Page</TITLE>
	</HEAD>

	<BODY BGCOLOR="CCCCCC">
	<%@include file="verify.jsp"%>
	<H1 align="center">Good Results Buddy WOO!</H1><br>
	<% SingleStar star = new SingleStar();
	Integer id = 907007;
	star = SingleStar.getSingleStarAttributes(id);
	// System.out.println("this email" + customer.email); 
	%>
	<H2 align="center">User Name from Session: <%=star.first_name%></H2>
</BODY>

</HTML>