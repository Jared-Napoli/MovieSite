package SQLClasses;

import java.io.*;
import java.net.*;
import java.sql.*;
import java.text.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class Genre {
	public Integer id = 0;
	public String name = "";

	public Genre() {

	}

	public Genre(Integer new_id, String new_name) {
		id = new_id;
		name = new_name;
	}

	public static List<Genre> getGenreList(String query)
	{
		Genre genre = new Genre();
		List<Genre> genreList = new ArrayList<Genre>();

		try {
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			Connection dbcon = DriverManager.getConnection("jdbc:mysql://localhost:3306/moviedb", "root", "root");
			Statement statement = dbcon.createStatement();
			//String query = "select * from movies where id in (select movie_id from stars_in_movies where star_id in (select id from stars where first_name= '" + first_name + "' and last_name= '" + last_name + "'))";

			// Perform the query
			ResultSet rs = statement.executeQuery(query);

			// Iterate through each row of rs
			while (rs.next()) {
				genre = new Genre(
				    rs.getInt("id"),
				    rs.getString("name"),
				genreList.add(genre);
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
		return genreList;
	}

	public static List<Genre> getFullGenreList() {
		Genre genre = new Genre();
		List<Genre> genreList = new ArrayList<Genre>();
		try {
			Class.forName("com.mysql.jdbc.Driver").newInstance();

			Connection dbcon = DriverManager.getConnection("jdbc:mysql://localhost:3306/moviedb", "root", "root");
			// Declare our statement
			Statement statement = dbcon.createStatement();
			String query = "SELECT * from genres order by name";

			// Perform the query
			ResultSet rs = statement.executeQuery(query);
			System.out.println("After query");

			// Iterate through each row of rs
			while (rs.next()) {
				genre = new Genre(
					rs.getInt("id"),
					genre.name = rs.getString("name"));
				genreList.add(genre);
			}
			System.out.println("After initialization");
			rs.close();
			statement.close();
			dbcon.close();

		} catch (Exception ex) {
			while (ex != null) {
				System.out.println ("SQL Exception 1:  " + ex.getMessage ());
			}  // end while
			return null;
		}  // end catch SQLException
		return genreList;
	}
}
