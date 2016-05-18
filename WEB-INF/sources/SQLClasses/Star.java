package SQLClasses;

import java.io.*;
import java.net.*;
import java.sql.*;
import java.text.*;
import java.util.*;
//import javax.servlet.*;
//import javax.servlet.http.*;

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

	public static Star getStar(String id)
	{
		Star Star = new Star();
		try
		{
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			Connection dbcon = DriverManager.getConnection("jdbc:mysql://localhost:3306/moviedb", "root", "root");
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
			while (ex != null)
			{
				System.out.println ("SQL Exception:  " + ex.getMessage ());
			}
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
			Connection dbcon = DriverManager.getConnection("jdbc:mysql://localhost:3306/moviedb", "root", "root");
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
			while (ex != null) {
				System.out.println ("SQL Exception 1:  " + ex.getMessage ());
			}  // end while
			return null;
		}  // end catch SQLException
		return starList;
	}
}