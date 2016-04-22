<%@page import="java.sql.*,
 javax.sql.*,
 java.io.IOException,
 javax.servlet.http.*,
 javax.servlet.*,
 java.util.*,
 SQLClasses.*"
%>

<%@page import="SQLClasses.Customer"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<%
	//try
	 //   {
	    Customer myCustomer = new Customer();
	    ArrayList<Movie> cart = new ArrayList<Movie>();
	    String username;
	    String password;
	    if(request.getParameter("username") != null)
	    {
			System.out.println("Username from getparam");
	    	username = (String)request.getParameter("username");
	    	password = (String)request.getParameter("password");
	    	System.out.println(username);
	    	System.out.println(password);
	    	myCustomer = myCustomer.getCustomerByCredentials(username, password);
	    	request.getSession().setAttribute("customer", (Object)myCustomer);
	    	request.getSession().setAttribute("cart", (Object) cart);
	    }
	    else
	    {
			System.out.println("Getting customer from session");
	    	myCustomer = (Customer)request.getSession().getAttribute("customer");
	    	//System.out.println(myCustomer.first_name);
	    }
	    String url = (String)request.getRequestURL().toString();
	    if(myCustomer == null)
	    {
		  //request.getSession().setAttribute("url", (Object)url);
	      System.out.println("null customer");
	      request.getSession().setAttribute("url", (Object)url);
	      response.sendRedirect("/fabflix");
	    }
	    else
	    {
	      System.out.println("good customer");
	      request.getSession().setAttribute("customer", (Object)myCustomer);
	      request.getSession().setAttribute("url", null);
	      //response.sendRedirect(url);
	    }
	/*    }
	    catch (java.lang.Exception ex) {
	      return;
	    }
	  }	*/
%>
<HTML>
<td>
<CENTER>
<BODY BGCOLOR="#FDF5E6">
	<H1 align="center">Verified</H1>
</CENTER>
</TD>
</BODY>
</HTML>
