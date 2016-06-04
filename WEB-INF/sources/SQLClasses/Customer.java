package SQLClasses;

import java.io.*;
import java.net.*;
import java.sql.*;
import java.text.*;
import java.util.*;
import javax.sql.*;
//import javax.ejb.*;
import javax.naming.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class Customer {
	public Integer id = 0;
	public String first_name = "";
	public String last_name = "";
	public String cc_id = "" ;
	public String address = "";
	public String email = "";
	public String password = "";


	public Customer() {

	}

	public Customer(Integer new_id, String new_fn, String new_ln, String new_ccid,
	                String new_address, String new_email, String new_pw) {
		id = new_id;
		first_name = new_fn;
		last_name = new_ln;
		cc_id = new_ccid;
		address = new_address;
		email = new_email;
		password = new_pw;
	}



	public static Customer getCustomerByCredentials(String u_name, String pw) {
		Customer customer = new Customer();
		try {
			Class.forName("com.mysql.jdbc.Driver").newInstance();

			//Context initialContext = new InitialContext();
			//Context environmentContext = (Context) initialContext.lookup("java:comp/env");
			//String dataResourceName = "jdbc/moviedb";
			//Class.forName("com.mysql.jdbc.Driver");
			Context context = new InitialContext();
			//Context context = new InitialContext();
			DataSource dataSource = (DataSource) context.lookup("java:comp/env/jdbc/moviedb");
			//Connection dbcon = DriverManager.getConnection("jdbc:mysql://localhost:3306/moviedb", "root", "root");
			Connection dbcon = dataSource.getConnection();
			// Declare our statement
			Statement statement = dbcon.createStatement();
			String query = "SELECT * from customers where email='" + u_name + "'" + " and password='" + pw + "'";

			// Perform the query
			ResultSet rs = statement.executeQuery(query);

			// Iterate through each row of rs
			if (rs.next()) {
				customer = new Customer(
				    rs.getInt("id"),
				    rs.getString("first_name"),
				    rs.getString("last_name"),
				    rs.getString("cc_id"),
				    rs.getString("address"),
				    rs.getString("email"),
				    rs.getString("password"));
				System.out.println("rs.next()");
				return customer;
			}

			rs.close();
			statement.close();
			dbcon.close();

		} catch (Exception ex) {
				System.out.println ("SQL Exception:  " + ex.getMessage ());
			return null;
		}  // end catch SQLException
		return null;
	}
}
