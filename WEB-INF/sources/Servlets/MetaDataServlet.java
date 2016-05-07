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

public class MetaDataServlet extends HttpServlet {
  public String getServletInfo() {
    return "Meta Data Servlet Servlet";
  }

  // Use http GET

  public void doGet(HttpServletRequest request, HttpServletResponse response)
  throws IOException, ServletException {
    try
    {
        Class.forName("com.mysql.jdbc.Driver").newInstance();
        Connection dbcon = DriverManager.getConnection("jdbc:mysql://localhost:3306/moviedb", "root", "root");
        Statement statement = dbcon.createStatement();
        Statement insert;

        DatabaseMetaData md = dbcon.getMetaData();
        Statement select;
        ResultSet tables = md.getTables(null, null, "%", null);
        ResultSet result;
        ResultSetMetaData result_md;
        ArrayList<String> metadata = new ArrayList<String>();
        
        System.out.println("Print metadata selected");
        while(tables.next())
        {
            select = dbcon.createStatement();
            result = select.executeQuery("select * from " + tables.getString(3));
            result_md = result.getMetaData();
            System.out.println(tables.getString(3) + " table attributes:");
            metadata.add(tables.getString(3) + " table attributes:");
            for(int i = 1; i <= result_md.getColumnCount(); i++)
                metadata.add("\t" + result_md.getColumnName(i) + ": " + result_md.getColumnTypeName(i));
            metadata.add("\n");
            //System.out.println("\t" + result_md.getColumnName(i) + ": " + result_md.getColumnTypeName(i));
        }
        statement.close();
        dbcon.close();
        request.setAttribute("meta_data", (Object) metadata);
        request.getRequestDispatcher("/WEB-INF/sources/meta_data.jsp").forward(request, response);
    }
    catch(Exception ex)
    {
        while (ex != null)
        {
          System.out.println ("SQL Exception:  " + ex.getMessage ());
        }
    }
  }

  public void doPost(HttpServletRequest request, HttpServletResponse response)
  throws IOException, ServletException {
    doGet(request, response);
  }
}