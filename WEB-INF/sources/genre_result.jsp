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
	<TITLE>Genre Result Page</TITLE>
</HEAD>
<div align="right"><%@include file="quickSearch.jsp"%></div>
<BODY BGCOLOR="cccccc">
	<div style="color:black; font-family: Verdana; font-size: 22px; padding:10px;">
	<H1 align="center">Browse Results</H1>
</div>
	<center>
	<FORM action="/project4/customer/main" method=GET align=center>
		<INPUT style="color: #FFFFFF; font-family: Verdana; font-weight: bold; font-size: 14px; background-color: #808080" TYPE="submit" VALUE="Return To Main Page">
	</FORM>
	<FORM ACTION="/project4/customer/checkout" METHOD="get">
    	<INPUT style="color: #FFFFFF; font-family: Verdana; font-weight: bold; font-size: 14px; background-color: #808080" ID = "checkOut" TYPE="SUBMIT" VALUE="Checkout"></INPUT>
	</FORM>
</center>
	<table align="center"style"border: solid" border="1"/>
	<%
		System.out.println("Genre results page");
		List<Movie> movies = (List<Movie>) request.getAttribute("movies");
		if(movies.size() == 0) {
	%>
		No movies found.
	<%	
		} else {
		for(Movie movie: movies) {
	%>
		<tr>
			<%@ include file="movierowview.jsp" %>
		</tr>
	<%
		}
	}
	%>
</BODY>
</HTML>