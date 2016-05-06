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

public class CartServlet extends HttpServlet {
  public String getServletInfo() {
    return "Cart Servlet";
  }

  // Use http GET

  public void doGet(HttpServletRequest request, HttpServletResponse response)
  throws IOException, ServletException {
    response.setContentType("text/html");    // Response mime type
    System.out.println("got to CartServlet");

    String id =request.getPathInfo().substring(1);
    String prev_url = request.getHeader("referer");
    Movie movie = Movie.getMovie(id);
    //ArrayList<Move> cart = (ArrayList<Movie>)request.getSession().getAttribute("cart");
    //cart.add(movie);
    ((ArrayList<Movie>)request.getSession().getAttribute("cart")).add(movie);
    request.setAttribute("prev_url", (Object) prev_url);
    request.getRequestDispatcher("/WEB-INF/sources/cart.jsp").forward(request, response);
  }

  public void doPost(HttpServletRequest request, HttpServletResponse response)
  throws IOException, ServletException {
    doGet(request, response);
  }
}
