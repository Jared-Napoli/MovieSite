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
	<TITLE>Result Page</TITLE>
</HEAD>

<BODY BGCOLOR="#FDF5E6">
	<H1 align="center">Good Results Buddy WOO!</H1><br>
	<% Customer customer = new Customer();
	customer = (Customer)request.getSession().getAttribute("customer");
	System.out.println("this email" + customer.email); %>
	<H2 align="center">User Name from Session: <%=customer.email%></H2>

	<H3>List of Movies </H3><br>
	<table style"border: solid"/>
<%
		Movie movie = new Movie(10, "string", 10, "string", "string", "string");
		List<movie> movies = movie.searchMovie("string", 10, "string", "string", "string");

%>
		<%=movies.size()%>
		<tr>
			<%@ include file="movierowview.jsp" %>
		</tr>
<%
	
%>
</BODY>
</HTML>
