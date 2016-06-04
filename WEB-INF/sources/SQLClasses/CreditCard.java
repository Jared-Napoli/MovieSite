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

public class CreditCard {
	public Integer id = 0;
	public String first_name = "";
	public String last_name = "";
	public String expiration = "" ;



	public CreditCard() {

	}

	public CreditCard(Integer new_id, String new_fn, String new_ln, String new_exp) {
		id = new_id;
		first_name = new_fn;
		last_name = new_ln;
		expiration = new_exp;
	}



	public static CreditCard getCreditCardByCredentials(String f_name, String l_name, String cc_num) {
		CreditCard cc = new CreditCard();
		try {
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			Context context = new InitialContext();
			//Context context = new InitialContext();
			DataSource dataSource = (DataSource) context.lookup("java:comp/env/jdbc/moviedb");
			//Connection dbcon = DriverManager.getConnection("jdbc:mysql://localhost:3306/moviedb", "root", "root");
			Connection dbcon = dataSource.getConnection();
			// Declare our statement
			Statement statement = dbcon.createStatement();
			String query = "SELECT * from creditcards where first_name='" + f_name + "'" + " and last_name='" + l_name + "' and id='" + cc_num +"'";

			// Perform the query
			ResultSet rs = statement.executeQuery(query);

			// Iterate through each row of rs
			if (rs.next()) {
				cc = new CreditCard(
				    rs.getInt("id"),
				    rs.getString("first_name"),
				    rs.getString("last_name"),
				    rs.getString("expiration"));
				rs.close();
				statement.close();
				dbcon.close();
				return cc;
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
