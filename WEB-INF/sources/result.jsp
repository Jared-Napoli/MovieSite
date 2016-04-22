<%@page import="java.sql.*,
 javax.sql.*,
 java.io.IOException,
 javax.servlet.http.*,
 javax.servlet.*,
 java.util.*"
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<%@page import="SQLClasses.*"%>

<HTML>

<%
	String orderBy = (String)request.getParameter("orderBy");
	String direction = (String)request.getParameter("direction");
	Integer numResults = Integer.parseInt(request.getParameter("numResults"));
	Integer currResult = Integer.parseInt(request.getParameter("currResult"));
%>

<HEAD>
	<link rel="stylesheet" type="text/css" href="../mystyle.css">
	<TITLE>Result Page</TITLE>
</HEAD>

<script>
	function sortByTitle() {
		if ('<%=orderBy%>' === "title") {
			if ('<%=direction%>' === "DESC") {
				document.location.href="/fabflix/search/result?title=&year=&director=&a_first_name=&a_last_name=&orderBy=title&direction=ASC&numResults=" + '<%=numResults%>' + "&currResult=0";
			} else {
				document.location.href="/fabflix/search/result?title=&year=&director=&a_first_name=&a_last_name=&orderBy=title&direction=DESC&numResults=" + '<%=numResults%>' + "&currResult=0";
			}
		} else {
				document.location.href="/fabflix/search/result?title=&year=&director=&a_first_name=&a_last_name=&orderBy=title&direction=ASC&numResults=" + '<%=numResults%>' + "&currResult=0";
		}
	}

	function sortByYear() {
		if ('<%=orderBy%>' === "year") {
			if ('<%=direction%>' === "ASC") {
				document.location.href="/fabflix/search/result?title=&year=&director=&a_first_name=&a_last_name=&orderBy=year&direction=DESC&numResults=" + '<%=numResults%>' + "&currResult=0";
			} else {
				document.location.href="/fabflix/search/result?title=&year=&director=&a_first_name=&a_last_name=&orderBy=year&direction=ASC&numResults=" + '<%=numResults%>' + "&currResult=0";
			}
		} else {
			document.location.href="/fabflix/search/result?title=&year=&director=&a_first_name=&a_last_name=&orderBy=year&direction=ASC&numResults=" + '<%=numResults%>' + "&currResult=0";
		}
	}

	function updateResults(arg) {
		if(arg === "next") {
			document.location.href="/fabflix/search/result?title=&year=&director=&a_first_name=&a_last_name=&orderBy=" + '<%=orderBy%>'+ "&direction=" + '<%=direction%>' + "&numResults=" + '<%=numResults%>' + "&currResult=" + '<%=numResults + currResult%>';
		} else {
			document.location.href="/fabflix/search/result?title=&year=&director=&a_first_name=&a_last_name=&orderBy=" + '<%=orderBy%>'+ "&direction=" + '<%=direction%>' + "&numResults=" + '<%=numResults%>' + "&currResult=" + '<%=currResult - numResults%>';
		}
	}

	function changeNumResults() {
		var selectBox = document.getElementById("selectBox");
    	var selectedValue = selectBox.options[selectBox.selectedIndex].value;
    	document.location.href="/fabflix/search/result?title=&year=&director=&a_first_name=&a_last_name=&orderBy=" + '<%=orderBy%>'+ "&direction=" + '<%=direction%>' + "&numResults=" + selectedValue + "&currResult=" + '<%=currResult%>';
	}
</script>

<BODY BGCOLOR="cccccc">
	<H1 align="center">Good Results Buddy WOO!</H1><br>
	<%@include file="verify.jsp"%>
	<H2 align="center">List of Movies </H2><br>
	<center>
		<% if(currResult > 0) { %>
			<button onClick="updateResults('prev')">Prev</button>
		<% } %>
		<select id="selectBox" onChange="changeNumResults()">
			<option selected disabled><%=numResults%></option>
	  		<option value="10">10</option>
	  		<option value="25">25</option>
	  		<option value="50">50</option>
		  	<option value="100">100</option>
		</select> 
		<button onClick="updateResults('next')">Next</button>
	</center>
	<table align="center" style"border: solid" border="1"/>
	<tr>
			<th>Movie ID</th>
			<th></th>
			<th><button onClick="sortByTitle()"/>Title</th>
			<th><button onClick="sortByYear()"/>Year</th>
			<th>Director</th>
			<th>Actors</th>
			<th>Genres</th>
	</tr>
<%
		Movie sampleMovie = new Movie(10, "string", 10, "string", "string", "string");
		String m_title = request.getParameter("title");
		String m_director = request.getParameter("director");
		String f_name = request.getParameter("a_first_name");
		String l_name = request.getParameter("a_last_name");
		int m_year = 0;
		int results = 0;

		if(request.getParameter("year") != "")
			m_year = Integer.parseInt(request.getParameter("year"));

		List<Movie> movies = sampleMovie.searchMovie(m_title, m_year, m_director, f_name, l_name, orderBy, direction);
		for(Movie movie: movies) {
		results++;
		if(results <= currResult) continue;

		String starring_query = "select * from stars where id in(select star_id from stars_in_movies where movie_id ='" + movie.id + "')";
		List<Star> stars_in = Star.getStarList(starring_query);

		String genres_query = "select * from genres where id in(select genre_id from genres_in_movies where movie_id ='" + movie.id + "')"; 
		List<Genre> genres_in = Genre.getGenreList(genres_query);

%>
		<tr>
			<%@ include file="movierowview.jsp" %>
			<td>
				<% 
				for(Star star: stars_in) {  
				%>
				
				<a href=/fabflix/star/<%=star.id%>><%=star.first_name%> <%=star.last_name%><br> </a></H4>
				
				<% 
					} 
				%>
			</td>
			<td>
				<% for(Genre genre: genres_in) { %>
				
				<%=genre.name%></br>
				
				<%
					}
				%>
			</td>
		</tr>
<%
		if(results == currResult + numResults) break;
	}
%>
	</table>
	<center>
		<% if(currResult > 0) { %>
			<button onClick="updateResults('prev')">Prev</button>
		<% } %>	
		<select id="selectBox" onChange="changeNumResults()">
			<option selected disabled><%=numResults%></option>
	  		<option value="10">10</option>
	  		<option value="25">25</option>
	  		<option value="50">50</option>
		  	<option value="100">100</option>
		</select> 
	<button onClick="updateResults('next')">Next</button>
	</center>
</BODY>


</HTML>
