package Servlets;

import java.io.*;
import java.net.*;
import java.sql.*;
import java.text.*;
import java.util.*;
import javax.servlet.*;
import javax.sql.*;
//import javax.ejb.*;
import javax.naming.*;
import javax.servlet.http.*;
import SQLClasses.*;

public class TooltipServlet extends HttpServlet {

    public void doGet(HttpServletRequest req, HttpServletResponse res)
                                 throws ServletException, IOException {

        System.out.println("calls this shit in TooltipServet");
        res.setContentType("text/html");
        Movie movie = new Movie();
        String id =req.getPathInfo().substring(5); //remove "/hidden=" from the uri
        System.out.println(id);
        movie = Movie.getMovie(id);
        String starring_query = "select * from stars where id in(select star_id from stars_in_movies where movie_id ='" + movie.id + "')";
        List<Star> stars_in = Star.getStarList(starring_query);

        PrintWriter out = res.getWriter();
        out.println("Released: " + movie.year + "<br>");
        out.println("Directed by:<br>&emsp;" + movie.director + "<br>");
        out.println("<a href=" + movie.trailer_url + ">Trailer URL</a><br>");
        out.println("Starring:<br>");
        for(Star star: stars_in)
            out.println("&emsp;<a href=/fabflix/customer/star/" + star.id + ">" + star.first_name + " " + star.last_name + "</a><br>");
    }
}