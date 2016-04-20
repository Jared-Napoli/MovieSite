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
  	<TITLE>Browse Page</TITLE>
</HEAD>
<center>
<BODY BGCOLOR="cccccc">
	<H1 align="center">Good Browse Buddy WOO!</H1><br>
	<%@include file="verify.jsp"%>
	<% Customer customer = new Customer();
	customer = (Customer)request.getSession().getAttribute("customer");
	// System.out.println("this email" + customer.email); 
	%>
	<H2 align="center">User Name from Session: <%=customer.email%></H2>

	<H3>Search By Genre:</H3><br>
	<table align="center" style"border: solid" border="1"/>
<%
		//Genre genre = new Genre();
		List<Genre> genres = Genre.getFullGenreList();
		for(Genre genre: genres) {
%>
		<tr>
			<td style="border-right: solid;"><a href=/fabflix/browse/result/<%=genre.name%>><%=genre.name%></a></td>
		</tr>
<%
	}	
%>
</BODY>
</center>
</HTML>
