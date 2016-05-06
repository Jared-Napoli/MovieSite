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

public class GenreResultServlet extends HttpServlet {
  public String getServletInfo() {
    return "Browse Page Servlet";
  }

  // Use http GET

  public void doGet(HttpServletRequest request, HttpServletResponse response)
  throws IOException, ServletException {
    System.out.println("Browse Servlet iss isisisi");
    String genre_name = request.getPathInfo().substring(1);
    String query = "select * from movies where id in(select movie_id from genres_in_movies where genre_id=(select id from genres where name='" + genre_name + "'));";
    List<Movie> movies = Movie.getMovieList(query);
    request.setAttribute("movies", (Object) movies);
    request.getRequestDispatcher("/WEB-INF/sources/genre_result.jsp").forward(request, response);
  }

  public void doPost(HttpServletRequest request, HttpServletResponse response)
  throws IOException, ServletException {
    doGet(request, response);
  }
}