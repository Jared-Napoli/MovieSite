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
  	<TITLE>Browse Page</TITLE>
</HEAD>
<center>
<BODY BGCOLOR="cccccc">
	<H1 align="center">Good Browse Buddy WOO!</H1><br>
	<%@include file="verify.jsp"%>
	<FORM ACTION="/fabflix/Cart" METHOD="get">
    	<INPUT style="height: 2em; width: 25em" ID = "checkOut" TYPE="SUBMIT" VALUE="Checkout"></INPUT>
	</FORM>
	<% Customer customer = new Customer();
	customer = (Customer)request.getSession().getAttribute("customer");
	// System.out.println("this email" + customer.email); 
	%>
	<H2 align="center">User Name from Session: <%=customer.email%></H2>
	<H3>Search By Genre:</H3><br>
	<table style="display:inline; background-color: transparent">
		<td>
		<H3>Search by Genre:</H3>
		<table style"border: solid" border="2">
		<%
			//Genre genre = new Genre();
			List<Genre> genres = Genre.getFullGenreList();
			for(Genre genre: genres) {
		%>
			<tr>
				<td style="border: solid;"><a href=/fabflix/browse/genre/<%=genre.name%>><%=genre.name%></a></td>
			</tr>
		<%
			}	
		%>	
		</table>
		</td>
		<td style="color: transparent">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
		<td valign="top" style="background-color: transparent;">
		<H3>Search By Name:</H3>
		<table align=center style="border: solid;" border="1">
		<%
			//Genre genre = new Genre();
			List<String> letters = Movie.getFirstLetterList();
			for(String letter: letters) {
		%>
			<tr>
				<td style="border: solid;"><a href=/fabflix/browse/letter/<%=letter%>><%=letter%></a></td>
			</tr>
		<%
			}	
		%>	
		</table>
		</td>
	</table>
</BODY>
</center>

</HTML>
