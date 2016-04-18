package SQLClasses;

import java.io.*;
import java.net.*;
import java.sql.*;
import java.text.*;
import java.util.*;
//import javax.servlet.*;
//import javax.servlet.http.*;

public class SingleStar
{
	public Integer id = 0;
	public String first_name = "";
	public String last_name = "";
	public String dob = "";
	public String photo_url = "";


	public SingleStar()
	{}

	public SingleStar(Integer new_id, String new_fn, String new_ln, String new_dob, String photo_url)
	{
		id = new_id;
		first_name = new_fn;
		last_name = new_ln;
		dob = new_dob;
		photo_url = photo_url;
	}

	public static SingleStar getSingleStarAttributes(Integer star_id)
	{
		SingleStar singleStar = new SingleStar();
		try
		{
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			Connection dbcon = DriverManager.getConnection("jdbc:mysql://localhost:3306/moviedb", "root", "root");
			Statement statement = dbcon.createStatement();

			String query = "SELECT * from stars where id = " + star_id;

			// Perform the query
			ResultSet rs = statement.executeQuery(query);

			// Iterate through each row of rs
			if (rs.next())
			{
				singleStar = new SingleStar(
					rs.getInt("id"),
					rs.getString("first_name"),
				    rs.getString("last_name"),
				    rs.getString("dob"),
				    rs.getString("photo_url"));
				return singleStar;
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
}