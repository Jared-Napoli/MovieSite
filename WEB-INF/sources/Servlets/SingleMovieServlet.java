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

public class SingleMovieServlet extends HttpServlet {
  public String getServletInfo() {
    return "Browse Letter Page Servlet";
  }

  // Use http GET

  public void doGet(HttpServletRequest request, HttpServletResponse response)
  throws IOException, ServletException {
    Movie movie = new Movie();
    String id =request.getPathInfo().substring(1);
    movie = Movie.getMovie(id); 
    String starring_query = "select * from stars where id in(select star_id from stars_in_movies where movie_id ='" + movie.id + "')";
    List<Star> stars_in = Star.getStarList(starring_query);
    String cart_url = "/customer/fabflix/customer/checkout/" + id;
    request.setAttribute("movie", (Object) movie);
    request.setAttribute("stars_in", (Object) stars_in);
    request.setAttribute("cart_url", (Object) cart_url);
    request.getRequestDispatcher("/WEB-INF/sources/single_movie.jsp").forward(request, response);
  }

  public void doPost(HttpServletRequest request, HttpServletResponse response)
  throws IOException, ServletException {
    doGet(request, response);
  }
}