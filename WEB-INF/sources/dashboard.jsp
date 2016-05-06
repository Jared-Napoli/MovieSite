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
<H1 ALIGN="CENTER">Welcome Loyal Employee!</H1>
<%@include file="error.jsp" %>
<%
    //String url = "/fabflix/employee/main";
    //if(request.getSession().getAttribute("url")!= null)
    //  url = (String)request.getSession().getAttribute("url");
    System.out.println("the fuck?");
    boolean error = false;
    request.getSession().setAttribute("error", (Object) error);
%>


<FORM ACTION="/fabflix/employee/main"
      METHOD="POST">
  Email: <INPUT TYPE="TEXT" NAME="email" autofocus="autofocus"><BR>

  Password: <INPUT TYPE="PASSWORD" NAME="password"><BR>
  <CENTER>
    <INPUT TYPE="SUBMIT" VALUE="Submit Order">
  </CENTER>
</FORM>
</CENTER>
</BODY>
</HTML>

</body>
</html>
