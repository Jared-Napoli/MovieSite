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


public class AuthenticationFilter implements Filter
{
  
  @Override
  public void init(FilterConfig config) throws ServletException 
  {

  }

  @Override
  public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain) throws IOException, ServletException {
      HttpServletRequest request = (HttpServletRequest) req;
      HttpServletResponse response = (HttpServletResponse) res;
      System.out.println("Doing customer filter");
      Customer myCustomer = new Customer();
      ArrayList<Movie> cart = new ArrayList<Movie>();
      String username;
      String password;

      if((Customer)request.getSession().getAttribute("customer") != null)
          chain.doFilter(req,res);
      else
      {
          // Output stream to STDOUT
          PrintWriter out = response.getWriter();

          //Request Captcha
          String gRecaptchaResponse = request.getParameter("g-recaptcha-response");
          System.out.println("gRecaptchaResponse=" + gRecaptchaResponse);
      
          // Verify CAPTCHA.
          boolean valid = VerifyUtils.verify(gRecaptchaResponse);
          if (!valid) // bad recaptcha
          {
              response.sendRedirect("/project4");
              chain.doFilter(req, res);
          }
          else //good recaptcha
          {
              String path = ((HttpServletRequest) request).getRequestURI();
              if (path.equals("/project4/"))
              {
                  System.out.println("already going to login");
                  //chain.doFilter(request, response);
              } 
              else 
              {
                  // have a usernam
                  if(request.getParameter("username") != null)//can use getParam
                  {
                      System.out.println("filter Username from getparam");
                      username = (String)request.getParameter("username");
                      password = (String)request.getParameter("password");
                      System.out.println(username);
                      System.out.println(password);
                      myCustomer = myCustomer.getCustomerByCredentials(username, password);
                      if(myCustomer == null)
                      {
                          System.out.println("incorrect user");
                          response.sendRedirect("/project4");
                          chain.doFilter(req,res);
                      }
                      System.out.println("good customer from param");
                      request.getSession().setAttribute("customer", (Object)myCustomer);
                      request.getSession().setAttribute("cart", (Object) cart);
                      //chain.doFilter(req, res);
                      System.out.println("doesnt pop out");
                  }
                  else //can't use getParam, use sessions
                  {
                      System.out.println("filter Getting customer from session");
                      myCustomer = (Customer)request.getSession().getAttribute("customer");
                    //System.out.println(myCustomer.first_name);
                  
                      String url = (String)request.getRequestURL().toString();
                      if(myCustomer == null)
                      {
                        //request.getSession().setAttribute("url", (Object)url);
                          System.out.println("filter null customer");
                          request.getSession().setAttribute("url", (Object)url);
                          response.sendRedirect("/project4");
                          chain.doFilter(req,res);
                      }
                      else
                      {
                          System.out.println("filter good customer");
                          request.getSession().setAttribute("customer", (Object)myCustomer);
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
      }
  }
  
  @Override
    public void destroy() 
    {
        // If you have assigned any expensive resources as field of
        // this Filter class, then you could clean/close them here.
    }

}
