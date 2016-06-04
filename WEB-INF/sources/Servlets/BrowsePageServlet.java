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


public class BrowsePageServlet extends HttpServlet {
  public String getServletInfo() {
    return "Browse Page Servlet";
  }

  // Use http GET

  public void doGet(HttpServletRequest request, HttpServletResponse response)
  throws IOException, ServletException {
    System.out.println("Browse Servlet");
    //request.setAttribute("status", "fail");
    //request.setAttribute("msg", "It appears that you don't have a session.");
    List<Genre> genres = Genre.getFullGenreList();
    request.setAttribute("genres", (Object) genres);
    List<String> letters = Movie.getFirstLetterList();
    request.setAttribute("letters", (Object)letters);

    request.getRequestDispatcher("/WEB-INF/sources/browse.jsp").forward(request, response);
  }

  public void doPost(HttpServletRequest request, HttpServletResponse response)
  throws IOException, ServletException {
    doGet(request, response);
  }
}