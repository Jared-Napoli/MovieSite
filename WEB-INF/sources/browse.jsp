<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%@page import="javax.servlet.*"%>
<%@page import="javax.servlet.http.*"%>
<%@page import="java.io.IOException"%>
<%@page import="SQLClasses.*"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">


<HTML>
<HEAD>
	<link rel="stylesheet" type="text/css" href="../mystyle.css">
  	<TITLE>Browse Page</TITLE>
</HEAD>
<div align="right"><%@include file="quickSearch.jsp"%></div>
<center>
<BODY>
	 <div style="color:black; font-family: Verdana; font-size: 22px; padding:20px;">
	<H1 align="center">Browse Fabflix</H1>
	</div>
	<FORM action="/fabflix/customer/main" method=GET align=center>
		<INPUT style="color: #FFFFFF; font-family: Verdana; font-weight: bold; font-size: 14px; background-color: #808080" TYPE="submit" VALUE="Return To Main Page">
	</FORM>
	<FORM ACTION="/fabflix/customer/checkout" METHOD="get">
    	<INPUT style="color: #FFFFFF; font-family: Verdana; font-weight: bold; font-size: 14px; background-color: #808080" ID = "checkOut" TYPE="SUBMIT" VALUE="Checkout"></INPUT>
	</FORM>
	<div style="font-family: Verdana; font-weight: bold; font-size: 14px; padding:10px;">
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
		</td>
		</table>
		</div>
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
		<INPUT style="color: #FFFFFF; font-family: Verdana; font-weight: bold; font-size: 14px; background-color: #808080" TYPE="submit" VALUE="Return To Main Page">
	</FORM>
</BODY>
</center>

</HTML>
