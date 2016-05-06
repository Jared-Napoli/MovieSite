
/* A servlet to display the contents of the MySQL movieDB database */

import java.io.*;
import java.net.*;
import java.sql.*;
import java.text.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;
import SQLClasses.*;

public class FabFlix extends HttpServlet {
  public String getServletInfo() {
    return "Servlet connects to MySQL database and displays result of a SELECT";
  }

  // Use http GET

  public void doGet(HttpServletRequest request, HttpServletResponse response)
  throws IOException, ServletException {
    response.setContentType("text/html");    // Response mime type
  
    // Output stream to STDOUT
    PrintWriter out = response.getWriter();

    out.println("<HTML><HEAD><TITLE>Search</TITLE></HEAD>");
    out.println("<BODY><H1>Search: </H1>");

    try
    {
    Customer myCustomer = new Customer();
    String username = request.getParameter("username");
    String password = request.getParameter("password");
    myCustomer = myCustomer.getCustomerByCredentials(username, password);

    out.println("<TABLE border>");

    out.println("<tr>" +
      "<td>" + myCustomer.id + "</td>" +
      "<td>" + myCustomer.first_name + "</td>" +
      "<td>" + myCustomer.last_name + "</td>" +
      "<td>" + myCustomer.cc_id + "</td>" +
      "</tr>");

    out.println("</TABLE>");
    }
    catch (java.lang.Exception ex) {
      out.println("<HTML>" +
        "<HEAD><TITLE>" +
        "MovieDB: Error" +
        "</TITLE></HEAD>\n<BODY>" +
        "<P>SQL error in doGet: " +
        ex.getMessage() + "</P></BODY></HTML>");
      return;
    }
    out.close();
  }

  public void doPost(HttpServletRequest request, HttpServletResponse response)
  throws IOException, ServletException {
    doGet(request, response);
  }
}
