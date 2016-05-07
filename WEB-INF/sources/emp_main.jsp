<%@page import="java.sql.*,
 javax.sql.*,
 java.io.IOException,
 javax.servlet.http.*,
 javax.servlet.*,
 java.util.*,
 SQLClasses.*"
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<HTML>
	<HEAD>
  		<link rel="stylesheet" type="text/css" href="mystyle.css">
  		<TITLE>Employee Main Page</TITLE>
	</HEAD>
	<td>
	<CENTER>
	<BODY>
		<H1 align="center">Welcome Loyal Employee!</H1>
    <br>
    <h2>Insert a Star:</h2>
        <FORM ACTION="/fabflix/employee/insert_star" METHOD="get">
    Star's Name: <INPUT TYPE="TEXT" NAME="star_name"><br>
        <INPUT TYPE="SUBMIT" VALUE="Insert Star"><br>
        </FORM>
    <h2>Get Metadata:<h2>
        <FORM ACTION="/fabflix/employee/meta_data" METHOD="get">
        <INPUT TYPE="SUBMIT" VALUE="Get Metadata">
        </FORM>
    <h2>Add Movie Using Stored Procedure:</h2>
        <FORM ACTION="/fabflix/employee/add_movie" METHOD="get">
            Movie's Title: <INPUT TYPE="TEXT" NAME="title"><br>
            Release Year: <INPUT TYPE="TEXT" NAME="year"><br>
            Director: <INPUT TYPE="TEXT" NAME="director"><br>
            Banner URL: <INPUT TYPE="TEXT" NAME="banner_url"><br>
            Trailer URL: <INPUT TYPE="TEXT" NAME="trailer_url"><br>
            Star's First Name: <INPUT TYPE="TEXT" NAME="first_name"><br>
            Star's Last Name: <INPUT TYPE="TEXT" NAME="last_name"><br>
            Star's DOB: <INPUT TYPE="TEXT" NAME="dob"><br>
            Star's Phot URL: <INPUT TYPE="TEXT" NAME="photo_url"><br>
            Genre Name: <INPUT TYPE="TEXT" NAME="name"><br>
        <INPUT TYPE="SUBMIT" VALUE="Add Movie"><br>
        </FORM>
  </td>
</BODY>
</HTML>