<%@page import="java.sql.*,
 javax.sql.*,
 java.io.IOException,
 javax.servlet.http.*,
 javax.servlet.*"
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<%@page import="SQLClasses.Customer"%>

<HTML>
<HEAD>
	<link rel="stylesheet" type="text/css" href="mystyle.css">
	<TITLE>Result Page</TITLE>
</HEAD>

<BODY BGCOLOR="#FDF5E6">
	<H1 align="center">Good Results Buddy WOO!</H1><br>
	<% Customer customer = new Customer();
	customer = (Customer)request.getSession().getAttribute("customer");
	System.out.println("this email" + customer.email); %>
	<H2 align="center">User Name from Session: <%=customer.email%></H2>

</BODY>
</HTML>
