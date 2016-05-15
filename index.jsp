<%@page import="java.sql.*,
 javax.sql.*,
 java.io.IOException,
 javax.servlet.http.*,
 javax.servlet.*,
 java.util.*,
 SQLClasses.*"
%>

<%/*
	test comment.  
    Class.forName("com.mysql.jdbc.Driver").newInstance();
    Connection connection =
      DriverManager.getConnection("jdbc:mysql://localhost:3306/moviedb", "root", "root");
    Statement select = connection.createStatement();
    ResultSet result = select.executeQuery("Select * from creditcards where ID LIKE '87%'");
    out.println("The results of the query");

    ResultSetMetaData  metadata;
    metadata = result.getMetaData();
    out.println("There are "+metadata.getColumnCount()+" columns <br>");
    for (int i=1; i<=metadata.getColumnCount(); i++){
      out.println("Type of column "+i+" is " + 
      metadata.getColumnTypeName(i) + "<br>");
    }
    while (result.next()){
      out.print("First_name  = "+result.getString(2));
      out.print("  Last_name = "+result.getString(3));
      out.println("<br>");
    } */
%> 

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
  <link rel="stylesheet" type="text/css" href="mystyle.css">
  <TITLE>FabFlix</TITLE>
  <script src='https://www.google.com/recaptcha/api.js'></script>
</HEAD>
<CENTER>
<BODY>
  <div style="color:black; padding:8px; font-family: Verdana; font-weight: bold; font-size: 22px;">
<H1 ALIGN="CENTER">Welcome to FabFlix!</H1>
</div>
<%
    String url = "/fabflix/customer/main";
    if(request.getSession().getAttribute("url")!= null)
        url = (String)request.getSession().getAttribute("url");
%>
<div style="font-family: Verdana; font-weight: bold; font-size: 14px; padding:10px;">
  <FORM ACTION=<%=url%> METHOD="POST">
    Username: <INPUT TYPE="TEXT" style="font-family: Verdana; font-size: 14px;" NAME="username" autofocus="autofocus"><BR>
    Password: <INPUT TYPE="PASSWORD" style="font-family: Verdana; font-size: 14px;" NAME="password"><BR><BR>
  <CENTER>
    <INPUT TYPE="SUBMIT" style="color: #FFFFFF; font-family: Verdana; font-weight: bold; font-size: 14px; background-color: #808080" VALUE="Submit Order">
  </CENTER>
  <BR><div class="g-recaptcha" data-sitekey="6LeHnx4TAAAAAOaTFUEthWLEml-3BxUYMPWMZOUC"></div>
</FORM>
</div>
</CENTER>
</BODY>
</HTML>

</body>
</html>
