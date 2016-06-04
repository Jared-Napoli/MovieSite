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
		<script type="text/javascript">
        function callServlet(id) {
        	var idd = id;
            document.location.href="/fabflix/TestServlet/" + id + "";
        }
    	</script>
  		<link rel="stylesheet" type="text/css" href="../mystyle.css">
  		<TITLE>Single Star Page</TITLE>
	</HEAD>
	<div align="right"><%@include file="quickSearch.jsp"%></div>
	<CENTER>
	<BODY BGCOLOR="CCCCCC">
	<%
		Star star = (Star) request.getAttribute("star");
		List<Movie> stars_in = (List<Movie>) request.getAttribute("stars_in");
	%>
	<div style="color:black; font-family: Verdana; font-size: 22px; padding:10px;">
	<H1 align=center><%=star.first_name%> <%=star.last_name%>
	</div>
	</H1>
	<div style="font-family: Verdana; font-weight: bold; font-size: 14px; padding:10px;">
	<FORM action="/fabflix/customer/main" method=GET>
		<INPUT style="color: #FFFFFF; font-family: Verdana; font-weight: bold; font-size: 14px; background-color: #808080" TYPE="submit" VALUE="Return To Main Page">
	</FORM>
	<FORM ACTION="/fabflix/customer/checkout" METHOD="get">
    <INPUT style="color: #FFFFFF; font-family: Verdana; font-weight: bold; font-size: 14px; background-color: #808080" ID = "checkOut" TYPE="SUBMIT" VALUE="Checkout"></INPUT>
	</FORM>
	<img src=<%=star.photo_url%> alt="Picture failed to load." align="middle" height="140" width="100">
	<H2 align="center">Price: $15.99<br>Birthdate: <%=star.dob%><br></H2>
	<H3 align="center">Stars In: </H3>
	<table align="center" style"border: solid" border="1"/>
	<%
		for(Movie movie: stars_in) {
	%>
		<tr>
		<%@ include file="movierowview.jsp" %>
	</tr>
<%
	}
%>
</BODY>
</div>
</CENTER>
</HTML>
