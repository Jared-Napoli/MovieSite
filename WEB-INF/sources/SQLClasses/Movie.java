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
	public String banner_url = "";
	public String trailer_url = "";


	public Movie() {

	}

	public Movie(Integer new_id, String new_title, Integer new_year, String new_director,
	             String new_banner_url, String new_trailer_url) {
		id = new_id;
		title = new_title;
		year = new_year;
		director = new_director;
		banner_url = new_banner_url;
		trailer_url = new_trailer_url;
	}



	public static List<Movie> searchMovie(String m_title, Integer m_year, String m_director,
	                                String f_name, String l_name) {
		Movie movie = new Movie();
		List<Movie> movieList = new ArrayList<Movie>();
		try {
			Class.forName("com.mysql.jdbc.Driver").newInstance();

			Connection dbcon = DriverManager.getConnection("jdbc:mysql://localhost:3306/moviedb", "root", "root");
			// D2eclare our statement
			Statement statement = dbcon.createStatement();
			String query = "";
			String star_query = "";
			Boolean firstFound = false;

			if(f_name != "") {
				query = query.concat("SELECT * from movies where id in (select movie_id from stars_in_movies where star_id in"
				+ " (select id from stars where first_name like \"" + f_name + "%\"");
				firstFound = true;
			}

			if(l_name != "") {
				if (firstFound) 
					query = query.concat(" AND last_name like \"" + l_name + "%\"))");
				else {
					query = query.concat("select * from movies where id in (select movie_id from stars_in_movies where star_id in" 
					+ " (select id from stars where last_name like \"" + l_name + "%\"))");
					firstFound = true;
				}	 
			} else if (firstFound) {
				query = query.concat("))");
			}

			if(m_title != "") {
				if (firstFound)
					query = query.concat(" and title like \"" + m_title + "%\"");
				else {
					query = query.concat("SELECT * from movies where title like \"" + m_title + "%\"");
					firstFound = true;
				}
			}

			if(m_year != 0) {
				if (firstFound)
					query = query.concat(" AND year=\"" + m_year + "\"");
				else
					query = query.concat("SELECT * from movies where year=\"" + m_year + "\"");
				firstFound = true;
			}

			if(m_director != "") {
				if (firstFound)
					query = query.concat(" AND director like \"" + m_director + "%\"");
				else
					query = query.concat("SELECT * from movies where director like \"" + m_director + "%\"");
				firstFound = true;
			}

			if(!firstFound) {
				query = query.concat("SELECT * from movies");
			}

			// Perform the query
			ResultSet rs = statement.executeQuery(query);
			System.out.println("After query");

			// Iterate through each row of rs
			while (rs.next()) {
				movie = new Movie(
				    rs.getInt("id"),
				    rs.getString("title"),
				    rs.getInt("year"),
				    rs.getString("director"),
				    rs.getString("banner_url"),
				    rs.getString("trailer_url"));
				movieList.add(movie);
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
		return movieList;
	}

	public static List<Movie> listOfMoviesGivenID(Integer id)
	{
		Movie movie = new Movie();
		List<Movie> movieList = new ArrayList<Movie>();
		
		try {
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			Connection dbcon = DriverManager.getConnection("jdbc:mysql://localhost:3306/moviedb", "root", "root");
			Statement statement = dbcon.createStatement();
			String query = "select * from movies where id in (select movie_id from stars_in_movies where star_id = '" + id + "')";

			// Perform the query
			ResultSet rs = statement.executeQuery(query);

			// Iterate through each row of rs
			while (rs.next()) {
				movie = new Movie(
				    rs.getInt("id"),
				    rs.getString("title"),
				    rs.getInt("year"),
				    rs.getString("director"),
				    rs.getString("banner_url"),
				    rs.getString("trailer_url"));
				movieList.add(movie);
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
		return movieList;
	}

	public static List<Movie> listOfMoviesGivenFirstAndLastName(String first_name, String last_name)
	{
		Movie movie = new Movie();
		List<Movie> movieList = new ArrayList<Movie>();

		try {
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			Connection dbcon = DriverManager.getConnection("jdbc:mysql://localhost:3306/moviedb", "root", "root");
			Statement statement = dbcon.createStatement();
			String query = "select * from movies where id in (select movie_id from stars_in_movies where star_id in (select id from stars where first_name= '" + first_name + "' and last_name= '" + last_name + "'))";

			// Perform the query
			ResultSet rs = statement.executeQuery(query);

			// Iterate through each row of rs
			while (rs.next()) {
				movie = new Movie(
				    rs.getInt("id"),
				    rs.getString("title"),
				    rs.getInt("year"),
				    rs.getString("director"),
				    rs.getString("banner_url"),
				    rs.getString("trailer_url"));
				movieList.add(movie);
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
		return movieList;
	}

	public static Movie getMovie(String id)
	{
		Movie movie = new Movie();
		List<Movie> movieList = new ArrayList<Movie>();

		try {
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			Connection dbcon = DriverManager.getConnection("jdbc:mysql://localhost:3306/moviedb", "root", "root");
			Statement statement = dbcon.createStatement();
			String query = "select * from movies where id='" + id + "'";

			// Perform the query
			ResultSet rs = statement.executeQuery(query);

			// Iterate through each row of rs
			while (rs.next()) {
				movie = new Movie(
				    rs.getInt("id"),
				    rs.getString("title"),
				    rs.getInt("year"),
				    rs.getString("director"),
				    rs.getString("banner_url"),
				    rs.getString("trailer_url"));
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
		return movie;
	}

	public static List<Movie> getMovieList(String query)
	{
		Movie movie = new Movie();
		List<Movie> movieList = new ArrayList<Movie>();

		try {
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			Connection dbcon = DriverManager.getConnection("jdbc:mysql://localhost:3306/moviedb", "root", "root");
			Statement statement = dbcon.createStatement();
			//String query = "select * from movies where id in (select movie_id from stars_in_movies where star_id in (select id from stars where first_name= '" + first_name + "' and last_name= '" + last_name + "'))";

			// Perform the query
			ResultSet rs = statement.executeQuery(query);

			// Iterate through each row of rs
			while (rs.next()) {
				movie = new Movie(
				    rs.getInt("id"),
				    rs.getString("title"),
				    rs.getInt("year"),
				    rs.getString("director"),
				    rs.getString("banner_url"),
				    rs.getString("trailer_url"));
				movieList.add(movie);
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
		return movieList;
	}
}




























