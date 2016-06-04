package SQLClasses;

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

public class Star
{
	public Integer id = 0;
	public String first_name = "";
	public String last_name = "";
	public String dob = "";
	public String photo_url = "";


	public Star()
	{}

	public Star(Integer new_id, String new_fn, String new_ln, String new_dob, String new_photo_url)
	{
		id = new_id;
		first_name = new_fn;
		last_name = new_ln;
		dob = new_dob;
		photo_url = new_photo_url;
	}

	public static void insertStar(String name)
	{
		try
		{
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			Context context = new InitialContext();
			DataSource dataSource = (DataSource) context.lookup("java:comp/env/jdbc/moviedb");
			//Connection dbcon = DriverManager.getConnection("jdbc:mysql://localhost:3306/moviedb", "root", "root");
			Connection dbcon = dataSource.getConnection();
			Statement statement = dbcon.createStatement();
			Statement insert;

			String [] names = name.split(" ");
	        if(names.length == 1)//inserted as last name, "" is first name
	        {
	              insert = dbcon.createStatement();
	              insert.executeUpdate("insert into stars (first_name, last_name) values ('', '" + names[0] + "')");
	              System.out.println("Inserted " + names[0] + " into the database");
	              insert.close();
	        }
	        else
	        {
	            insert = dbcon.createStatement();
	            insert.executeUpdate("insert into stars (first_name, last_name) values ('" + names[0] + "', '" + names[1] + "')");
	            System.out.println("Inserted " + names[0] + " " + names[1] +  " into the database");
	            insert.close();
	        }
	        statement.close();
	        dbcon.close();
	    }
	    catch(Exception ex)
		{
				System.out.println ("SQL Exception:  " + ex.getMessage ());
		}
	}

	public static Star getStar(String id)
	{
		Star Star = new Star();
		try
		{
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			Context context = new InitialContext();
			DataSource dataSource = (DataSource) context.lookup("java:comp/env/jdbc/moviedb");
			//Connection dbcon = DriverManager.getConnection("jdbc:mysql://localhost:3306/moviedb", "root", "root");
			Connection dbcon = dataSource.getConnection();
			Statement statement = dbcon.createStatement();

			String query = "SELECT * from stars where id = '" + id + "'";

			// Perform the query
			ResultSet rs = statement.executeQuery(query);

			// Iterate through each row of rs
			if (rs.next())
			{
				Star = new Star(
					rs.getInt("id"),
					rs.getString("first_name"),
				    rs.getString("last_name"),
				    rs.getString("dob"),
				    rs.getString("photo_url"));
				return Star;
			}
			rs.close();
			statement.close();
			dbcon.close();
		}
		catch (Exception ex)
		{
				System.out.println ("SQL Exception:  " + ex.getMessage ());

			return null;
		}
		return null;
	}

	public static List<Star> getStarList(String query)
	{
		Star star = new Star();
		List<Star> starList = new ArrayList<Star>();

		try {
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			Context context = new InitialContext();
			DataSource dataSource = (DataSource) context.lookup("java:comp/env/jdbc/moviedb");
			//Connection dbcon = DriverManager.getConnection("jdbc:mysql://localhost:3306/moviedb", "root", "root");
			Connection dbcon = dataSource.getConnection();
			Statement statement = dbcon.createStatement();

			// Perform the query
			ResultSet rs = statement.executeQuery(query);

			// Iterate through each row of rs
			while (rs.next()) {
				star = new Star(
				    rs.getInt("id"),
					rs.getString("first_name"),
				    rs.getString("last_name"),
				    rs.getString("dob"),
				    rs.getString("photo_url"));
				starList.add(star);
			}
			rs.close();
			statement.close();
			dbcon.close();

		} catch (Exception ex) {
				System.out.println ("SQL Exception 1:  " + ex.getMessage ());
			return null;
		}  // end catch SQLException
		return starList;
	}
}