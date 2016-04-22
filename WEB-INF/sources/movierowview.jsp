<%@page import="java.sql.*,
 javax.sql.*,
 java.io.IOException,
 javax.servlet.http.*,
 javax.servlet.*"
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<td style="border-right: solid;"><%=movie.id%></td>
<td><img src=<%=movie.banner_url%> alt="Picture failed to load." height="140" width="100"></td>
<td style="border-right: solid;"><a href=/fabflix/movie/<%=movie.id%>><%=movie.title%></a></td>
<td style="border-right: solid;"><%=movie.year%></td>
<td style="border-right: solid;"><%=movie.director%></td>
<!-- <td><a href="<%=movie.banner_url%>">Banner url</a></td>  -->