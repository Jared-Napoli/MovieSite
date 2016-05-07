package SQLClasses;

import java.io.*;
import java.net.*;
import java.sql.*;
import java.text.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class Sale {
	public Integer id = 0;
	public Integer customer_id = 0;
	public Integer movie_id = 0;
	public String sale_date = "" ;



	public Sale() {

	}

	public Sale(Integer new_id, Integer new_cid, Integer new_mid, String new_sdate) {
		id = new_id;
		customer_id = new_cid;
		movie_id = new_mid;
		sale_date = new_sdate;
	}



	public static void insertSale(Customer customer, List<Movie> cart)
	{
		try
		{
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			Connection dbcon = DriverManager.getConnection("jdbc:mysql://localhost:3306/moviedb", "root", "root");
			Statement statement = dbcon.createStatement();
			Statement insert;
			StringBuilder insert_query = new StringBuilder("insert into sales (customer_id, movie_id, sale_date) values");
			Boolean comma = false;

			for(Movie movie : cart)
				insert_query.append("('" + customer.id + "','" + movie.id + "', CURDATE()),");
			insert_query.setLength(insert_query.length() - 1);
			insert_query.append(";");
			System.out.println(insert_query.toString());
			insert = dbcon.createStatement();
			insert.executeUpdate(insert_query.toString());
			insert.close();
	        dbcon.close();
	    }
	    catch(Exception ex)
		{
				System.out.println ("SQL Exception:  " + ex.getMessage ());
		}
	}
}
