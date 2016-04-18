<%@page import="java.sql.*,
 javax.sql.*,
 java.io.IOException,
 javax.servlet.http.*,
 javax.servlet.*"
%>

<%@page import="SQLClasses.Customer"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<%
	//try
	 //   {
	    Customer myCustomer = new Customer();
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
	    }
	    else
	    {
			System.out.println("Getting customer from session");
	    	myCustomer = (Customer)request.getSession().getAttribute("customer");
	    	//System.out.println(myCustomer.first_name);
	    }
	    String url = (String)request.getRequestURL().toString();
	    request.getSession().setAttribute("url", (Object)url);
	    if(myCustomer == null)
	    {
		  //request.getSession().setAttribute("url", (Object)url);
	      System.out.println("null customer");
	      response.sendRedirect("/fabflix");
	    }
	    else
	    {
	      System.out.println("good customer");
	      request.getSession().setAttribute("customer", (Object)myCustomer);
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
