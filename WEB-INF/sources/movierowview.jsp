<%@page import="java.sql.*,
 javax.sql.*,
 java.io.IOException,
 javax.servlet.http.*,
 javax.servlet.*"
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<td style="boreder-right: solid;"><%=movie.id%></td>
<td style="boreder-right: solid;"><%=movie.title%></td>
<td style="boreder-right: solid;"><%=movie.year%></td>
<td style="boreder-right: solid;"><%=movie.director%></td>
<td><a href="<%=movie.banner_url%>">Banner url</a></td>