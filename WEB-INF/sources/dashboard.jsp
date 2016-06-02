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
  <TITLE>FabFlix</TITLE>
</HEAD>
<CENTER>
<BODY>
  <div style="color:black; font-family: Verdana; font-size: 22px; padding:10px;">
<H1 ALIGN="CENTER">Welcome Loyal Employee!</H1>
</div>
<%@include file="error.jsp" %>
<%
    //String url = "/project4/employee/main";
    //if(request.getSession().getAttribute("url")!= null)
    //  url = (String)request.getSession().getAttribute("url");
    boolean error = false;
    request.getSession().setAttribute("error", (Object) error);
%>

<div style="font-family: Verdana; font-weight: bold; font-size: 14px; padding:10px;">
<FORM ACTION="/project4/employee/main"
      METHOD="POST">
  Email: <INPUT TYPE="TEXT" NAME="email" autofocus="autofocus"><BR>
  Password: <INPUT TYPE="PASSWORD" NAME="password"><BR><BR>
  <CENTER>
    <INPUT TYPE="SUBMIT" style="color: #FFFFFF; font-family: Verdana; font-weight: bold; font-size: 14px; background-color: #808080" VALUE="Submit Order">
  </CENTER>
</FORM>
</div>
</CENTER>
</BODY>
</HTML>

</body>
</html>
