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


public class AndroidMovieServlet extends HttpServlet {
  public String getServletInfo() {
    return "Android Authentication Servlet";
  }

  // Use http GET

  public void doGet(HttpServletRequest req, HttpServletResponse res)
  throws IOException, ServletException {
      System.out.println("Android movie servlet");
      res.setContentType("text/plain");
      PrintWriter out = res.getWriter();

      String stringForQuery = req.getPathInfo().substring(1);
      //System.out.println(stringForQuery);
      StringBuilder movieTitles = new StringBuilder("");


      String keyWordsForQuery[] = stringForQuery.split("@@@");

      System.out.println("keywords size" + keyWordsForQuery.length);
      try {
          Class.forName("com.mysql.jdbc.Driver").newInstance();

          Context context = new InitialContext();
			DataSource dataSource = (DataSource) context.lookup("java:comp/env/jdbc/moviedb");
			//Connection dbcon = DriverManager.getConnection("jdbc:mysql://localhost:3306/moviedb", "root", "root");
			Connection dbcon = dataSource.getConnection();
          // Declare our statement
          Statement statement = dbcon.createStatement();
          System.out.println(keyWordsForQuery[0]);
          StringBuilder query = new StringBuilder("select title from movies where ");
          if (keyWordsForQuery.length == 1)
          {
              query.append("title like '" + keyWordsForQuery[0] + "%' or title like '% " + keyWordsForQuery[0] + "%'");
          }
          else
          {
              for (int i = 0; i < keyWordsForQuery.length - 1; i++)
              {
                query.append("title like '%" + keyWordsForQuery[i] + "%' and ");
              }
              query.append("(title like '" + keyWordsForQuery[keyWordsForQuery.length - 1] + "%' or title like '% " + keyWordsForQuery[keyWordsForQuery.length - 1] + "%')");
          }

          // Perform the query
          ResultSet rs = statement.executeQuery(query.toString());
          while(rs.next())
          {
              movieTitles.append(rs.getString("title") + "@@@");
          }
          
          rs.close();
          statement.close();
          dbcon.close();
      } 
      catch (Exception ex)
      {
        System.out.println ("SQL Exception:  " + ex.getMessage ());
      }  // end catch SQLException

      
      //PrintWriter out = res.getWriter();
    //System.out.println(movieTitles.toString());
    out.print(movieTitles.toString());
    //out.println("Hello World!");
  }

  public void doPost(HttpServletRequest request, HttpServletResponse response)
  throws IOException, ServletException {
    doGet(request, response);
  }
}