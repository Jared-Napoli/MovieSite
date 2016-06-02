package Servlets;
/* A servlet to display the contents of the MySQL movieDB database */

import java.io.*;
import java.net.*;
import java.sql.*;
import java.text.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;
import SQLClasses.*;


public class AndroidAuthServlet extends HttpServlet {
  public String getServletInfo() {
    return "Android Authentication Servlet";
  }

  // Use http GET

  public void doGet(HttpServletRequest request, HttpServletResponse response)
  throws IOException, ServletException {
      System.out.println("Android has connected!!!!!@@!");
      response.setContentType("text/plain");
      PrintWriter out = response.getWriter();
      String path = request.getPathInfo().substring(1); //strips the / off of the path
      //out.println(path);
      String[] credentials = path.split("@@@");
      System.out.println(credentials.length);
      if(credentials.length == 2)
      {
          Customer customer = Customer.getCustomerByCredentials(credentials[0], credentials[1]);
          if(customer != null)
          {
              out.println("true");
          }
          else
          {
              out.println("false");
          }
      }
      else
          out.println("false");
      out.close();
  }

  public void doPost(HttpServletRequest request, HttpServletResponse response)
  throws IOException, ServletException {
    doGet(request, response);
  }
}