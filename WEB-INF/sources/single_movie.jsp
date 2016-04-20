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
  		<TITLE>Single Movie Page</TITLE>
	</HEAD>

	<BODY BGCOLOR="CCCCCC">
	<%@include file="verify.jsp"%>
	<%
	Movie movie = new Movie();
	String id =request.getPathInfo().substring(1);
	movie = Movie.getMovie(id); 
	String starring_query = "select * from stars where id in(select star_id from stars_in_movies where movie_id ='" + movie.id + "')";
	List<Star> stars_in = Star.getStarList(starring_query);
	%>
	<H1 align=center><%=movie.title%><FORM align=right><INPUT style="height: 2em; width: 25em" TYPE="button" VALUE="Add to Cart" onclick=<%System.out.println("I clicked a fucking button");%>/></FORM></H1>
	<button style="align:right;" type="button">Add to Cart
	<%System.out.println("clicked a button!");%></button>
	<CENTER>
	<img src=<%=movie.banner_url%> alt="Picture failed to load." align="middle" height="140" width="100">
	<H2 align="center">Released: <%=movie.year%><br>Directed By: <%=movie.director%><br><a href=<%=movie.trailer_url%>>Trailer Link</a><br></H2>
	<H3 align="center">Starring: </H3>
	<table align="center" style"border: solid" border="1"/>
	<%
		for(Star curr_star: stars_in) {
%>
		<tr>
		<td><img src=<%=curr_star.photo_url%> alt="Picture failed to load." height="140" width="100"></td>
		<td>
			<a href=/fabflix/star/<%=curr_star.id%>><%=curr_star.first_name%> <%=curr_star.last_name%></a></H4>
		</td>
	</tr>
<%
	}
%>	
</BODY>
</CENTER>
</HTML>