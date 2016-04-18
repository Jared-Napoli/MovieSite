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
	<%
	SingleStar star = new SingleStar();

	Integer id = 907000;
	star = SingleStar.getSingleStarAttributes(id); 
	%>
	<H1 align="center"><%=star.first_name%> <%=star.last_name%><br></H1>
	<CENTER>
		<img src="photo_url" alt="											Picture failed to load." align="middle" width="256" height="256">
	<H3 align="center"><%=star.id%><br> <%=star.dob%><br> <%=star.photo_url%><br></H3>
	<table align="center" style"border: solid" border="1"/>
	<%
		List<Movie> movies = Movie.listOfMoviesGivenFirstAndLastName("Samuel", "Jackson");
		for(Movie movie: movies) {
%>
		<tr>
		<td>
			<H3><%=movie.title%></H3>
		</td>
	</tr>
<%
	}
%>
	
</BODY>
</CENTER>
</HTML>