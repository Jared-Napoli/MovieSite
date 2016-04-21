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
  		<TITLE>Single Star Page</TITLE>
	</HEAD>

	<BODY BGCOLOR="CCCCCC">
	<%@include file="verify.jsp"%>
	<%
	Star star = new Star();
	String id =request.getPathInfo().substring(1);
	star = Star.getStar(id); 
	String movies_starred_in_query = "select * from movies where id in (select movie_id from stars_in_movies where star_id='" + id + "')";
	List<Movie> movies = Movie.getMovieList(movies_starred_in_query);
	%>
	<H1 align="center"><%=star.first_name%> <%=star.last_name%><br></H1>
	<CENTER>
		<img src=<%=star.photo_url%> alt="Picture failed to load." align="middle" height="140" width="100">
	<H3 align="center">Database ID: <%=star.id%><br>Date of Birth: <%=star.dob%><br><br></H3>
	<table align="center" style"border: solid" border="1"/>
	<%
		for(Movie movie: movies) {
%>
		<tr>
		<td><img src=<%=movie.banner_url%> alt="Picture failed to load." height="140" width="100"></td>
		<td>
			<H3><a href=/fabflix/movie/<%=movie.id%>><%=movie.title%></a></H3>
		</td>
	</tr>
<%
	}
%>
	
</BODY>
</CENTER>
</HTML>