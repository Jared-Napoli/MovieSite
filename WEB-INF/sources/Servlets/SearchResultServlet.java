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

public class SearchResultServlet extends HttpServlet {
  public String getServletInfo() {
    return "Search Result Servlet";
  }

  // Use http GET

  public void doGet(HttpServletRequest request, HttpServletResponse response)
  throws IOException, ServletException {
    response.setContentType("text/html");    // Response mime type
    System.out.println("got to Search Result Servlet");
    Movie sampleMovie = new Movie(10, "string", 10, "string", "string", "string");
    String m_title = request.getParameter("title");
    String m_director = request.getParameter("director");
    String f_name = request.getParameter("a_first_name");
    String l_name = request.getParameter("a_last_name");
    int results = 0;


    List<Movie> movies = sampleMovie.searchMovie(m_title, year, m_director, f_name, l_name, orderBy, direction);
    for(Movie movie: movies) {
      results++;
    if(results <= currResult) continue;

    String starring_query = "select * from stars where id in(select star_id from stars_in_movies where movie_id ='" + movie.id + "')";
    List<Star> stars_in = Star.getStarList(starring_query);

    String genres_query = "select * from genres where id in(select genre_id from genres_in_movies where movie_id ='" + movie.id + "')"; 
    List<Genre> genres_in = Genre.getGenreList(genres_query);
    request.setAttribute("movies", (Object) movies);
    request.setAttribute("stars_in", (Object) stars_in);
    request.setAttribute("genres_in", (Object) genres_in);
    request.setAttribute("results", (Object) results);
    request.getRequestDispatcher("/WEB-INF/sources/result.jsp").forward(request, response);
  }

  public void doPost(HttpServletRequest request, HttpServletResponse response)
  throws IOException, ServletException {
    doGet(request, response);
  }
}