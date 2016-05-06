
/* A servlet to display the contents of the MySQL movieDB database */

import java.io.*;
import java.net.*;
import java.sql.*;
import java.text.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;
import SQLClasses.*;

public class Cart extends HttpServlet {
  public String getServletInfo() {
    return "Cart Servlet";
  }

  // Use http GET

  public void doGet(HttpServletRequest request, HttpServletResponse response)
  throws IOException, ServletException {
    response.setContentType("text/html");    // Response mime type
  
    // Output stream to STDOUT
    PrintWriter out = response.getWriter();
    String id =request.getPathInfo().substring(1);
    System.out.println(id);
    String prev_url = request.getHeader("referer");
    ((ArrayList<Movie>)request.getSession().getAttribute("cart")).add(Movie.getMovie(id));
    ArrayList<Movie> cart = ((ArrayList<Movie>)request.getSession().getAttribute("cart"));
    out.println("<HTML><HEAD><HEAD><link rel=\"stylesheet\" type=\"text/css\" href=\"../mystyle.css\"><TITLE>Cart</TITLE></HEAD>");
    out.println("<BODY><CENTER><H1>This is your cart:</H1>");
    for(Movie movie : cart)
    {
        out.println("<H2>" + movie.title + "</H2>");
    }
    out.println("<FORM action=" + prev_url + " method=GET align=center><INPUT style=\"height: 2em; width: 25em\" TYPE=\"submit\" VALUE=\"Return to Previous Page\"></FORM>");
    out.println("</BODY></CENTER></HTML>");

    try
    {
    }
    catch (java.lang.Exception ex) {
      out.println("<HTML>" +
        "<HEAD><TITLE>" +
        "MovieDB: Error" +
        "</TITLE></HEAD>\n<BODY>" +
        "<P>SQL error in doGet: " +
        ex.getMessage() + "</P></BODY></HTML>");
      return;
    }
    //out.close();
  }

  public void doPost(HttpServletRequest request, HttpServletResponse response)
  throws IOException, ServletException {
    doGet(request, response);
  }
}
