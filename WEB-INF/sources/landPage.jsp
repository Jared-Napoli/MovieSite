<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<HTML>
	<HEAD>
  		<link rel="stylesheet" type="text/css" href="mystyle.css">
  		<TITLE>Home Page</TITLE>
	</HEAD>
	<%
		//request.getSession().setAttribute("username", request.getParameter("username"));
		//request.getSession().setAttribute("password", request.getParameter("password"));
	%>
	<td>
	<CENTER>
	<BODY BGCOLOR="#FDF5E6">
		<img src="http://ia.imdb.com/media/imdb/01/I/34/50/70m.jpg" alt="Missing Picture">
		<H1 align="center">Welcome USER!</H1>
	<FORM ACTION="/fabflix/search"
      METHOD="get">
    <INPUT TYPE="SUBMIT" VALUE="Search"></INPUT></FORM>OR<FORM ACTION="/fabflix/browse"
      METHOD="get">
    <INPUT TYPE="SUBMIT" VALUE="Browse"></INPUT>
</FORM>
</CENTER>
</td>
</BODY>
</HTML>
