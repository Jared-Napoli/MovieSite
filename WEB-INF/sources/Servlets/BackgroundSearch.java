package Servlets;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.net.*;
import java.sql.*;
import java.text.*;
import java.util.*;
import javax.servlet.*;
import javax.sql.*;
//import javax.ejb.*;
import javax.naming.*;

import SQLClasses.*;

public class BackgroundSearch extends HttpServlet
{

  public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException
  {
  	System.out.println("GOT HERE!!!!!");
    res.setContentType("text/html");
    PrintWriter out = res.getWriter();

    String stringForQuery = req.getPathInfo().substring(1);
    //System.out.println(stringForQuery);
    StringBuilder movieTitles = new StringBuilder("");
    
    String keyWordsForQuery[] = stringForQuery.split(" ");
    /*System.out.println(keyWordsForQuery.length);
    for (String str : keyWordsForQuery)
    {
    	System.out.println(str);
    }*/

    try {
			Class.forName("com.mysql.jdbc.Driver").newInstance();

			Context context = new InitialContext();
			DataSource dataSource = (DataSource) context.lookup("java:comp/env/jdbc/moviedb");
			//Connection dbcon = DriverManager.getConnection("jdbc:mysql://localhost:3306/moviedb", "root", "root");
			Connection dbcon = dataSource.getConnection();
			// Declare our statement
			Statement statement = dbcon.createStatement();
			//System.out.println(keyWordsForQuery[0]);
			StringBuilder query = new StringBuilder("select title from movies where MATCH(title) AGAINST('");
      		if (keyWordsForQuery.length == 1)
      		{
        		query.append(keyWordsForQuery[0] + "*' IN BOOLEAN MODE)");
      		}
      		else
      		{
        		for (int i = 0; i < keyWordsForQuery.length - 1; i++)
        		{
          			query.append("+*" + keyWordsForQuery[i] + "* ");
        		}
        		query.append("+" + keyWordsForQuery[keyWordsForQuery.length - 1] + "*' IN BOOLEAN MODE)");
      		}
			/*StringBuilder query = new StringBuilder("select title from movies where ");
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
			}*/

			// Perform the query
			ResultSet rs = statement.executeQuery(query.toString());
			for (int i = 0; i < 8 && rs.next(); i++)
			{
				movieTitles.append(rs.getString("title") + "$%");
			}
			
			rs.close();
			statement.close();
			dbcon.close();
		} 
		catch (Exception ex)
		{
			System.out.println ("SQL Exception:  " + ex.getMessage ());
		}  // end catch SQLException

	System.out.println(movieTitles.toString());
	out.println(movieTitles.toString());
  }
}
