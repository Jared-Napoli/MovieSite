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

public class SingleStarServlet extends HttpServlet {
  public String getServletInfo() {
    return "Single Star Servlet";
  }

  // Use http GET

  public void doGet(HttpServletRequest request, HttpServletResponse response)
  throws IOException, ServletException {
    Star star = new Star();
    String id =request.getPathInfo().substring(1);
    star = Star.getStar(id); 
    String movies_starred_in_query = "select * from movies where id in (select movie_id from stars_in_movies where star_id='" + id + "')";
    List<Movie> stars_in = Movie.getMovieList(movies_starred_in_query);
    request.setAttribute("star", (Object) star);
    request.setAttribute("stars_in", (Object) stars_in);
    request.getRequestDispatcher("/WEB-INF/sources/single_star.jsp").forward(request, response);
  }

  public void doPost(HttpServletRequest request, HttpServletResponse response)
  throws IOException, ServletException {
    doGet(request, response);
  }
}