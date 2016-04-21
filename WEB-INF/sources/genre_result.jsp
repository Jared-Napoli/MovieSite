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
	<link rel="stylesheet" type="text/css" href="../../mystyle.css">
	<TITLE>Result Page</TITLE>
</HEAD>
<BODY BGCOLOR="cccccc">
	<H1 align="center">Good Browse Results Buddy WOO!</H1><br>
	<%@include file="verify.jsp"%>
	<H2 align="center">Browse Results:</H2><br>
	<table align="center"style"border: solid" border="1"/>
	<%
		String genre_name = request.getPathInfo().substring(1);
		String query = "select * from movies where id in(select movie_id from genres_in_movies where genre_id=(select id from genres where name='" + genre_name + "'));";
		List<Movie> movies = Movie.getMovieList(query);
		if(movies.size() == 0) {
	%>
		No movies found.
	<%	
		} else {
		for(Movie movie: movies) {
	%>
		<tr>
			<td><img src=<%=movie.banner_url%> alt="Picture failed to load." height="140" width="100"></td>
			<td style="border-right: solid;"><a href=/fabflix/movie/<%=movie.id%>><%=movie.title%></a></td>
		</tr>
	<%
		}
	}
	%>
</BODY>
</HTML>