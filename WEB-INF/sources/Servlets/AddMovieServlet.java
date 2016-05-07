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

public class AddMovieServlet extends HttpServlet {
  public String getServletInfo() {
    return "Add Movie Servlet";
  }

  // Use http GET

  public void doGet(HttpServletRequest request, HttpServletResponse response)
  throws IOException, ServletException {
      System.out.println("Add Movie Servlet");
      //request.setAttribute("status", "fail");
      //request.setAttribute("msg", "It appears that you don't have a session.");
      try
      {
          Class.forName("com.mysql.jdbc.Driver").newInstance();
          Connection dbcon = DriverManager.getConnection("jdbc:mysql://localhost:3306/moviedb", "root", "root");
          // D2eclare our statement
          Statement statement = dbcon.createStatement();

          String title = (String) request.getParameter("title");
          String year  = (String) request.getParameter("year");
          String director = (String) request.getParameter("director");
          String banner_url = (String) request.getParameter("banner_url");
          String trailer_url = (String) request.getParameter("trailer_url");
          String first_name = (String) request.getParameter("first_name");
          String last_name = (String) request.getParameter("last_name");
          String dob = (String) request.getParameter("dob");
          String phot_url = (String) request.getParameter("phot_url");
          String name = (String) request.getParameter("name");

          CallableStatement cs = null;
          cs = dbcon.prepareCall("{call add_movie(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)}");
          cs.setString(1, title);
          cs.setString(2, year);
          cs.setString(3, director);
          cs.setString(4, banner_url);
          cs.setString(5, trailer_url);
          cs.setString(6, first_name);
          cs.setString(7, last_name);
          cs.setString(8, dob);
          cs.setString(9, phot_url);
          cs.setString(10, name);
          cs.registerOutParameter(11, java.sql.Types.INTEGER);
          cs.registerOutParameter(12, java.sql.Types.INTEGER);
          cs.registerOutParameter(13, java.sql.Types.INTEGER);
          cs.registerOutParameter(14, java.sql.Types.INTEGER);
          cs.registerOutParameter(15, java.sql.Types.INTEGER);

          cs.execute();

          ArrayList<String> message_list = new ArrayList<String>();

          if(cs.getInt(15) == -1)
              message_list.add("SQL Error, nothing happened");
          else
          {
              if(cs.getInt(11) == 1)
                  message_list.add(title + " added to database");
              else
                  message_list.add(title + " not a new Movie, not added");
              if(cs.getInt(12) == 1)
                  message_list.add(first_name + " " + last_name + " added to database");
              else
                  message_list.add(first_name + " " + last_name + " not a new Star, not added");
              if(cs.getInt(13) == 1)
                  message_list.add(name + " added to database");
              else
                  message_list.add(name + " not a new Genre, not added");
              if(cs.getInt(14) == 1)
                  message_list.add("New star in movie added to database");
              else
                  message_list.add("Not a new star in movie, not added");
              if(cs.getInt(15) == 1)
                  message_list.add("New star in movie added to database");
              else
                  message_list.add("Not a new star in movie, not added");
          }

          request.setAttribute("message_list", (Object)message_list);
          request.getRequestDispatcher("/WEB-INF/sources/add_movie.jsp").forward(request, response);
      }
      catch (Exception ex) {
        System.out.println ("SQL Exception 1:  " + ex.getMessage ());  // end while
    }  // end catch SQLException

  }

  public void doPost(HttpServletRequest request, HttpServletResponse response)
  throws IOException, ServletException {
    doGet(request, response);
  }
}