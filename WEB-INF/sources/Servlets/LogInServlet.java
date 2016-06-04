package Servlets;
/* A servlet to display the contents of the MySQL movieDB database */

import java.io.*;
import java.net.*;
import java.sql.*;
import java.text.*;
import java.util.*;
import javax.servlet.*;
import javax.sql.*;
//import javax.ejb.*;
import javax.naming.*;
import javax.servlet.http.*;
import SQLClasses.*;

public class LogInServlet extends HttpServlet {
  public String getServletInfo() {
    return "LogIn Servlet";
  }

  // Use http GET

  public void doGet(HttpServletRequest request, HttpServletResponse response)
  throws IOException, ServletException {
    System.out.println("LogIn Servlet!");
    //request.setAttribute("status", "fail");
    //request.setAttribute("msg", "It appears that you don't have a session.");
    String url = "/fabflix/customer/main";
    String order = "title";
    String direction = "ASC";
    ArrayList<Movie> cart = new ArrayList<Movie>();
    request.getSession().setAttribute("orderBy", (Object) order);
    request.getSession().setAttribute("direction", (Object) direction);
    request.getSession().setAttribute("cart", (Object) cart);
    if(request.getSession().getAttribute("url") == null)
    {
        System.out.println("url = null");
    }
    else
      {
        System.out.println("url != null");
        url = (String)request.getSession().getAttribute("url");
        request.getSession().setAttribute("url", (Object) null);
      }
      System.out.println("gets here");
    request.getRequestDispatcher("/index.jsp").forward(request, response);
  }

  public void doPost(HttpServletRequest request, HttpServletResponse response)
  throws IOException, ServletException {
    doGet(request, response);
  }
}