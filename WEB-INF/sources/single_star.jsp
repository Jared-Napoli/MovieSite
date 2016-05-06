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

	<BODY BGCOLOR="CCCCCC">
	<%
		Star star = (Star) request.getAttribute("star");
		List<Movie> stars_in = (List<Movie>) request.getAttribute("stars_in");
	%>
	<H1 align=center><%=star.first_name%> <%=star.last_name%>
	</H1>
	<FORM action="/fabflix/customer/main" method=GET align=right>
		<INPUT style="height: 2em; width: 25em" TYPE="submit" VALUE="Return To Main Page">
	</FORM>
	<FORM align=right ACTION="/fabflix/customer/checkout" METHOD="get">
    <INPUT style="height: 2em; width: 25em" ID = "checkOut" TYPE="SUBMIT" VALUE="Checkout"></INPUT>
	</FORM>
	<CENTER>
	<img src=<%=star.photo_url%> alt="Picture failed to load." align="middle" height="140" width="100">
	<H2 align="center">Price: $15.99<br>Birthdate: <%=star.dob%><br></H2>
	<H3 align="center">Stars In: </H3>
	<table align="center" style"border: solid" border="1"/>
	<%
		for(Movie curr_movie: stars_in) {
	%>
		<tr>
		<td><img src=<%=curr_movie.banner_url%> alt="Picture failed to load." height="140" width="100"></td>
		<td>
			<a href=/fabflix/customer/movie/<%=curr_movie.id%>><%=curr_movie.title%></a></H4>
		</td>
	</tr>
<%
	}
%>
</BODY>
</CENTER>
</HTML>
