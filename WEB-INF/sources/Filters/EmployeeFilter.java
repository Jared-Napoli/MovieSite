  package Filters;
/* A servlet to display the contents of the MySQL movieDB database */

import java.io.*;
import java.util.*;
import SQLClasses.*;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
//import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class EmployeeFilter implements Filter
{
  
    @Override
    public void init(FilterConfig config) throws ServletException 
    {

    }

    @Override
    public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest) req;
        HttpServletResponse response = (HttpServletResponse) res;
        System.out.println("Doing employee filter");
        Employee employee = new Employee();
        ArrayList<Movie> cart = new ArrayList<Movie>();
        String email;
        String password;

        String path = ((HttpServletRequest) request).getRequestURI();
        if (path.equals("/fabflix/_dashboard")) 
        {
            System.out.println("already going to dashboard");
            //chain.doFilter(request, response);
        } 
        else 
        {
            // have a usernam
            if(request.getParameter("email") != null)
            {
                System.out.println("employee filter email from getparam");
                email = (String)request.getParameter("email");
                password = (String)request.getParameter("password");
                //System.out.println(username);
                //System.out.println(password);
                employee = Employee.getEmployeeByCredentials(email, password);
                if(employee == null)
                {
                    System.out.println("Incorrect employee filter");
                    boolean error = true;
                    request.getSession().setAttribute("error", (Object) error);
                    response.sendRedirect("/fabflix/_dashboard");
                }
                else
                {
                    request.getSession().setAttribute("employee", (Object)employee);
                    //request.getSession().setAttribute("cart", (Object) cart);
                }
            }
            else
            {
                System.out.println("filter Getting customer from session");
                employee = (Employee)request.getSession().getAttribute("employee");
                //System.out.println(myCustomer.first_name);
            
                String url = (String)request.getRequestURL().toString();
                if(employee == null)
                {
                  //request.getSession().setAttribute("url", (Object)url);
                    System.out.println("filter null customer");
                    request.getSession().setAttribute("url", (Object)url);
                    response.sendRedirect("/fabflix/_dashboard");
                }
                else
                {
                    System.out.println("filter good customer");
                    request.getSession().setAttribute("employee", (Object)employee);
                    request.getSession().setAttribute("url", null);
                    //response.sendRedirect(url);
                }
            }
            if(req == null || res == null)
                System.out.println("Why the fuck are these null?");
            System.out.println("This is it nigga!!!");
            chain.doFilter(req, res);
      }
  }
  
  @Override
  public void destroy() 
  {
        // If you have assigned any expensive resources as field of
        // this Filter class, then you could clean/close them here.
  }

}
