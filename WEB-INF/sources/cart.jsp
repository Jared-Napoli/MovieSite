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
  		<TITLE>Your Cart</TITLE>
	</HEAD>

	<BODY BGCOLOR="CCCCCC">
	<%@include file="verify.jsp"%>
	<%
	Movie movie = new Movie();
	String id =request.getPathInfo().substring(1);
	movie = Movie.getMovie(id); 
	%>
	<CENTER>
	<H3 align="center">Cart: </H3>
	<table align="center" style"border: solid" border="1"/>
	<%
		for(Movie movie: cart) {
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
	<FORM action=<%=prev_url%> method=GET align=center>
		<INPUT style=\"height: 2em; width: 25em\" TYPE=\"submit\" VALUE=\"Return to Previous Page\">
	</FORM>
</BODY>
</CENTER>
</HTML>