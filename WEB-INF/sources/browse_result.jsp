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
	<TITLE>Result Page</TITLE>
</HEAD>
<BODY BGCOLOR="cccccc">
	<H1 align="center">Good Browse Results Buddy WOO!</H1><br>
	<%@include file="verify.jsp"%>
	<% Customer customer = new Customer();
	customer = (Customer)request.getSession().getAttribute("customer");
	// System.out.println("this email" + customer.email); 
	%>
	<H2 align="center">User Name from Session: <%=customer.email%></H2>
</BODY>
</HTML>