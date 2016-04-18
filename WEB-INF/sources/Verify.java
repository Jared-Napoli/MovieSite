
/* A servlet to display the contents of the MySQL movieDB database */

import java.io.*;
import java.net.*;
import java.sql.*;
import java.text.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;
import SQLClasses.*;

public class Verify extends HttpServlet {
  public String getServletInfo() {
    return "Servlet connects to MySQL database and displays result of a SELECT";
  }

  // Use http GET

  public void doGet(HttpServletRequest request, HttpServletResponse response)
  throws IOException, ServletException {
    response.setContentType("text/html");    // Response mime type

    try
    {
    Customer myCustomer = new Customer();
    String username = request.getParameter("username");
    String password = request.getParameter("password");
    myCustomer = myCustomer.getCustomerByCredentials(username, password);
    if(myCustomer == null)
    {
      System.out.println("null customer");
      response.sendRedirect("/fabflix");
    }
    else
    {
      System.out.println("good customer");
      request.getSession().setAttribute("customer", (Object)myCustomer);
      response.sendRedirect("/fabflix/main");
    }
    }
    catch (java.lang.Exception ex) {
      return;
    }
  }

  public void doPost(HttpServletRequest request, HttpServletResponse response)
  throws IOException, ServletException {
    doGet(request, response);
  }
}
