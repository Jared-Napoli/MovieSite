package SQLClasses;

import java.io.*;
import java.net.*;
import java.sql.*;
import java.text.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class Movie {
	public Integer id = 0;
	public String title = "";
	public Integer year = 0;
	public String director = "";
	public String banned_url = "";
	public String trailer_url = "";


	public Movie() {

	}

	public Movie(Integer new_id, String new_title, Integer new_year, String new_director,
	             String new_banned_url, String new_trailer_url) {
		id = new_id;
		title = new_title;
		year = new_year;
		director = new_director;
		banned_url = new_banned_url;
		trailer_url = new_trailer_url;
	}



	public static movie searchMovie(String m_title, Integer m_year, String m_director,
	                                String f_name, String l_name) {
		Movie movie = new movie();
		try {
			Class.forName("com.mysql.jdbc.Driver").newInstance();

			Connection dbcon = DriverManager.getConnection("jdbc:mysql://localhost:3306/moviedb", "root", "root");
			// Declare our statement
			Statement statement = dbcon.createStatement();
			String query = "SELECT * from movies";

			// Perform the query
			ResultSet rs = statement.executeQuery(query);

			// Iterate through each row of rs
			if (rs.next()) {
				movie = new movie(
				    rs.getInt("id"),
				    rs.getString("title"),
				    rs.getInt("year"),
				    rs.getString("director"),
				    rs.getString("banned_url"),
				    rs.getString("trailer_url");
			}

			rs.close();
			statement.close();
			dbcon.close();

		} catch (Exception ex) {
			while (ex != null) {
				System.out.println ("SQL Exception:  " + ex.getMessage ());
			}  // end while
			return null;
		}  // end catch SQLException
		return movie;
	}
}