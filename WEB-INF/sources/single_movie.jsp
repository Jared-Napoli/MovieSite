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
  		<TITLE>Single Movie Page</TITLE>
	</HEAD>
	<CENTER>
	<BODY BGCOLOR="CCCCCC">
	<%
		Movie movie = (Movie) request.getAttribute("movie");
		List<Star> stars_in = (List<Star>) request.getAttribute("stars_in");
		//String cart_url = (String) request.getAttribute("cart_url");
		String cart_url = "/fabflix/customer/cart/" + movie.id;
	%>
	<div style="color:black; font-family: Verdana; font-size: 22px; padding:10px;">
	<H1 align=center><%=movie.title%>
	</div>
	<div style="font-family: Verdana; font-weight: bold; font-size: 14px; padding:10px;">
	<FORM action="/fabflix/customer/main" method=GET>
		<INPUT style="color: #FFFFFF; font-family: Verdana; font-weight: bold; font-size: 14px; background-color: #808080" TYPE="submit" VALUE="Return To Main Page">
	</FORM>
		<FORM action=<%=cart_url%> method="GET">
			<INPUT style="color: #FFFFFF; font-family: Verdana; font-weight: bold; font-size: 14px; background-color: #808080" TYPE="submit" VALUE="Add to Cart">
		</FORM>
	</H1>
	<FORM ACTION="/fabflix/customer/checkout" METHOD="get">
    <INPUT style="color: #FFFFFF; font-family: Verdana; font-weight: bold; font-size: 14px; background-color: #808080" ID = "checkOut" TYPE="SUBMIT" VALUE="Checkout"></INPUT>
	</FORM>
	<img src=<%=movie.banner_url%> alt="Picture failed to load." align="middle" height="140" width="100">
	<H2 align="center">Price: $15.99<br>Released: <%=movie.year%><br>Directed By: <%=movie.director%><br><a href=<%=movie.trailer_url%>>Trailer Link</a><br></H2>
	<H3 align="center">Starring: </H3>
	<table align="center" style"border: solid" border="1"/>
	<%
		for(Star curr_star: stars_in) {
	%>
		<tr>
		<td><img src=<%=curr_star.photo_url%> alt="Picture failed to load." height="140" width="100"></td>
		<td>
			<a href=/fabflix/customer/star/<%=curr_star.id%>><%=curr_star.first_name%> <%=curr_star.last_name%></a></H4>
		</td>
	</tr>
<%
	}
%>
</div>
</BODY>
</CENTER>
</HTML>
