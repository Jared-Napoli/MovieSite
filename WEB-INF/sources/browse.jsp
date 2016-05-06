<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%@page import="javax.servlet.*"%>
<%@page import="javax.servlet.http.*"%>
<%@page import="java.io.IOException"%>
<%@page import="SQLClasses.*"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">


<HTML>
<HEAD>
	<link rel="stylesheet" type="text/css" href="mystyle.css">
  	<TITLE>Browse Page</TITLE>
</HEAD>
<center>
<BODY BGCOLOR="cccccc">
	<H1 align="center">Good Browse Buddy WOO!</H1><br>
	<FORM action="/fabflix/customer/main" method=GET align=center>
		<INPUT style="height: 2em; width: 25em" TYPE="submit" VALUE="Return To Main Page">
	</FORM>
	<FORM ACTION="/fabflix/customer/checkout" METHOD="get">
    	<INPUT style="height: 2em; width: 25em" ID = "checkOut" TYPE="SUBMIT" VALUE="Checkout"></INPUT>
	</FORM>
	<H3>Search By Genre:</H3><br>
	<table style="display:inline; background-color: transparent">
		<td>
		<H3>Search by Genre:</H3>
		<table style"border: solid" border="2">
		<%
			for(Genre genre: (List<Genre>) request.getAttribute("genres")) {
		%>
			<tr>
				<td style="border: solid;"><a href=/fabflix/customer/browse/genre/<%=genre.name%>><%=genre.name%></a></td>
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
			for(String letter: (List<String>) request.getAttribute("letters")) {
		%>
			<tr>
				<td style="border: solid;"><a href=/fabflix/customer/browse/letter/<%=letter%>><%=letter%></a></td>
			</tr>
		<%
			}	
		%>	
		</table>
		</td>
	</table>
	<BR><BR><FORM action="/fabflix/customer/main" method=GET align=center>
		<INPUT style="height: 2em; width: 25em" TYPE="submit" VALUE="Return To Main Page">
	</FORM>
</BODY>
</center>

</HTML>
