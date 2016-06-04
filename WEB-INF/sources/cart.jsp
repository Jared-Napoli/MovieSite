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
		<TITLE>Cart</TITLE>
	</HEAD>
	<div align="right"><%@include file="quickSearch.jsp"%></div>
<BODY>
	<CENTER>
		<div style="color:black; font-family: Verdana; font-size: 22px; padding:10px;">
		<H1>This is your cart:</H1>
	</div>
	<div style="color:black; font-family: Verdana; font-size: 16px; padding:10px;">
	<table align="center" style"border: solid" border="1"/>
	<%
		List<Movie> cart = (List<Movie>)request.getSession().getAttribute("cart");
		for(Movie movie: cart) {
	%>
		<tr>
		<td><img src=<%=movie.banner_url%> alt="Picture failed to load." height="140" width="100"></td>
		<td>
			<H3><a href=/fabflix/customer/movie/<%=movie.id%>><%=movie.title%></a></H3>
		</td>
	</tr>
<%
	}
%>	
	<H3>Total: $<%=cart.size() * 15.99%></H3>
</div>
	<FORM action="/fabflix/customer/main" method=GET align=center>
		<INPUT style="color: #FFFFFF; font-family: Verdana; font-weight: bold; font-size: 14px; background-color: #808080" TYPE="submit" VALUE="Return To Main Page">
	</FORM><BR><BR>
	<FORM action="/fabflix/customer/checkout/info" method=GET align=center>
		<INPUT style="color: #FFFFFF; font-family: Verdana; font-weight: bold; font-size: 14px; background-color: #808080" TYPE="submit" VALUE="Proceed to Checkout">
	</FORM><BR><BR>
	<button onclick="goBack()" style="color: #FFFFFF; font-family: Verdana; font-weight: bold; font-size: 14px; background-color: #808080">Return to Previous Page</button><BR><BR>

<script>
function goBack() {
    window.history.back();
}
</script>
</BODY>
</CENTER>
</HTML>