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

public class LetterResultServlet extends HttpServlet {
  public String getServletInfo() {
    return "Browse Letter Page Servlet";
  }

  // Use http GET

  public void doGet(HttpServletRequest request, HttpServletResponse response)
  throws IOException, ServletException {
    System.out.println("Letter Servlet");
    String first_letter = request.getPathInfo().substring(1);
    System.out.println("Letter: " + first_letter);
    String query = "select * from movies where title like '" + first_letter + "%'";
    List<Movie> movies = Movie.getMovieList(query);
    System.out.println("First Movie: " + movies.get(0).title);
    request.setAttribute("movies", (Object) movies);
    request.getRequestDispatcher("/WEB-INF/sources/letter_result.jsp").forward(request, response);
  }

  public void doPost(HttpServletRequest request, HttpServletResponse response)
  throws IOException, ServletException {
    doGet(request, response);
  }
}