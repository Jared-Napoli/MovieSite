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
	<TITLE>Result Page</TITLE>
</HEAD>
<BODY BGCOLOR="cccccc">
	<H1 align="center">Good Results Buddy WOO!</H1><br>
	<%@include file="verify.jsp"%>
	<H2 align="center">List of Movies </H2><br>
	<table align="center" style"border: solid" border="1"/>
<%
		Movie sampleMovie = new Movie(10, "string", 10, "string", "string", "string");
		String m_title = request.getParameter("title");
		String m_director = request.getParameter("director");
		String f_name = request.getParameter("a_first_name");
		String l_name = request.getParameter("a_last_name");
		int m_year = 0;


		if(request.getParameter("year") != "")
			m_year = Integer.parseInt(request.getParameter("year"));

		List<Movie> movies = sampleMovie.searchMovie(m_title, m_year, m_director, f_name, l_name);
		for(Movie movie: movies) {
%>
		<tr>
			<%@ include file="movierowview.jsp" %>
		</tr>
<%
	}
%>
</BODY>
</HTML>
