package SQLClasses;

import java.io.*;
import java.net.*;
import java.sql.*;
import java.text.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class Employee {
	public String email = "";
	public String password = "";
	public String fullname = "";

	public Employee() {

	}

	public Employee(String new_email, String new_pw, String new_fn) {
		email = new_email;
		password = new_pw;
		fullname = new_fn;
	}



	public static Employee getEmployeeByCredentials(String e_email, String pw) {
		Employee employee = new Employee();
		try {
			Class.forName("com.mysql.jdbc.Driver").newInstance();

			Connection dbcon = DriverManager.getConnection("jdbc:mysql://localhost:3306/moviedb", "root", "root");
			// Declare our statement
			Statement statement = dbcon.createStatement();
			String query = "SELECT * from employees where email='" + e_email + "'" + " and password='" + pw + "'";

			// Perform the query
			ResultSet rs = statement.executeQuery(query);

			// Iterate through each row of rs
			if (rs.next()) {
				employee = new Employee(
				    rs.getString("email"),
				    rs.getString("password"),
				    rs.getString("fullname"));
				System.out.println("rs.next()");
				return employee;
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
