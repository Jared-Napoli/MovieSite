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
	System.out.println("gets to result.jsp");
	String orderBy = request.getParameter("orderBy");
	String direction = request.getParameter("direction");
	String title = request.getParameter("title");
	String director = request.getParameter("director");
	String a_first_name = request.getParameter("a_first_name");
	String a_last_name = request.getParameter("a_last_name");
	String year = request.getParameter("year");
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
				document.location.href="/fabflix/customer/search/result?title=" + '<%=title%>' + "&year=" + '<%=year%>' + "&director=" + '<%=director%>' + "&a_first_name=" + '<%=a_first_name%>' + "&a_last_name=" + '<%=a_last_name%>' + "&orderBy=title&direction=ASC&numResults=" + '<%=numResults%>' + "&currResult=0";
			} else {
				document.location.href="/fabflix/customer/search/result?title=" + '<%=title%>' + "&year=" + '<%=year%>' + "&director=" + '<%=director%>' + "&a_first_name=" + '<%=a_first_name%>' + "&a_last_name=" + '<%=a_last_name%>' + "&orderBy=title&direction=DESC&numResults=" + '<%=numResults%>' + "&currResult=0";
			}
		} else {
				document.location.href="/fabflix/customer/search/result?title=" + '<%=title%>' + "&year=" + '<%=year%>' + "&director=" + '<%=director%>' + "&a_first_name=" + '<%=a_first_name%>' + "&a_last_name=" + '<%=a_last_name%>' + "&orderBy=title&direction=ASC&numResults=" + '<%=numResults%>' + "&currResult=0";
		}
	}

	function sortByYear() {
		if ('<%=orderBy%>' === "year") {
			if ('<%=direction%>' === "ASC") {
				document.location.href="/fabflix/customer/search/result?title=" + '<%=title%>' + "&year=" + '<%=year%>' + "&director=" + '<%=director%>' + "&a_first_name=" + '<%=a_first_name%>' + "&a_last_name=" + '<%=a_last_name%>' + "&orderBy=year&direction=DESC&numResults=" + '<%=numResults%>' + "&currResult=0";
			} else {
				document.location.href="/fabflix/customer/search/result?title=" + '<%=title%>' + "&year=" + '<%=year%>' + "&director=" + '<%=director%>' + "&a_first_name=" + '<%=a_first_name%>' + "&a_last_name=" + '<%=a_last_name%>' + "&orderBy=year&direction=ASC&numResults=" + '<%=numResults%>' + "&currResult=0";
			}
		} else {
			document.location.href="/fabflix/customer/search/result?title=" + '<%=title%>' + "&year=" + '<%=year%>' + "&director=" + '<%=director%>' + "&a_first_name=" + '<%=a_first_name%>' + "&a_last_name=" + '<%=a_last_name%>' + "&orderBy=year&direction=ASC&numResults=" + '<%=numResults%>' + "&currResult=0";
		}
	}

	function updateResults(arg) {
		if(arg === "next") {
			document.location.href="/fabflix/customer/search/result?title=" + '<%=title%>' + "&year=" + '<%=year%>' + "&director=" + '<%=director%>' + "&a_first_name=" + '<%=a_first_name%>' + "&a_last_name=" + '<%=a_last_name%>' + "&orderBy=" + '<%=orderBy%>' + "&direction=" + '<%=direction%>' + "&numResults=" + '<%=numResults%>' + "&currResult=" + '<%=numResults + currResult%>';
		} else {
			document.location.href="/fabflix/customer/search/result?title=" + '<%=title%>' + "&year=" + '<%=year%>' + "&director=" + '<%=director%>' + "&a_first_name=" + '<%=a_first_name%>' + "&a_last_name=" + '<%=a_last_name%>' + "&orderBy=" + '<%=orderBy%>' + "&direction=" + '<%=direction%>' + "&numResults=" + '<%=numResults%>' + "&currResult=" + '<%=currResult - numResults%>';
		}
	}

	function changeNumResults() {
		var selectBox = document.getElementById("selectBox");
    	var selectedValue = selectBox.options[selectBox.selectedIndex].value;
    	document.location.href="/fabflix/customer/search/result?title=" + '<%=title%>' + "&year=" + '<%=year%>' + "&director=" + '<%=director%>' + "&a_first_name=" + '<%=a_first_name%>' + "&a_last_name=" + '<%=a_last_name%>' + "&orderBy=" + '<%=orderBy%>'+ "&direction=" + '<%=direction%>' + "&numResults=" + selectedValue + "&currResult=" + '<%=currResult%>';
	}
</script>

<BODY bgcolor = "cccccc">
	<div style="color:black; padding:8px; font-family: Verdana; font-weight: bold; font-size: 22px;">
		<H1 align="center">Search Results</H1>
	</div>
	<div style="color:black; padding:8px; font-family: Verdana; font-weight: bold; font-size: 18px;">
		<H2 align="center">List of Movies </H2>
	</div>
	<FORM action="/fabflix/customer/main" method=GET align=center>
		<INPUT style="color: #FFFFFF; font-family: Verdana; font-weight: bold; font-size: 14px; background-color: #808080" TYPE="submit" VALUE="Return To Main Page">
	</FORM>
	<center>
			<FORM ACTION="/fabflix/customer/checkout" METHOD="get">
    		<INPUT ID = "checkOut" style="color: #FFFFFF; font-family: Verdana; font-weight: bold; font-size: 14px; background-color: #808080" TYPE="SUBMIT" VALUE="Checkout"></INPUT>
			</FORM>
		<% if(currResult > 0) { %>
			<button onClick="updateResults('prev')" style="color: #FFFFFF; font-family: Verdana; font-weight: bold; font-size: 14px; background-color: #808080">Prev</button>
		<% } %>
		<select id="selectBox" onChange="changeNumResults()">
			<option selected disabled><%=numResults%></option>
	  		<option value="10">10</option>
	  		<option value="25">25</option>
	  		<option value="50">50</option>
		  	<option value="100">100</option>
		</select> 
		<button onClick="updateResults('next')" style="color: #FFFFFF; font-family: Verdana; font-weight: bold; font-size: 14px; background-color: #808080">Next</button>
	</center>
	<table align="center" style"border: solid" border="1"/>
	<tr>
			<th>Movie ID</th>
			<th></th>
			<th><button onClick="sortByTitle()" style="color: #FFFFFF; font-family: Verdana; font-weight: bold; font-size: 14px; background-color: #808080"/>Title</th>
			<th><button onClick="sortByYear()" style="color: #FFFFFF; font-family: Verdana; font-weight: bold; font-size: 14px; background-color: #808080"/>Year</th>
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
		int results = 0;

		List<Movie> movies = sampleMovie.searchMovie(m_title, year, m_director, f_name, l_name, orderBy, direction);
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
						
						<a href=/fabflix/customer/star/<%=star.id%>><%=star.first_name%> <%=star.last_name%><br> </a></H4>
						
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
			if(results == movies.size()) {
				numResults = 0;
				break;
			} 


			if(results == currResult + numResults) {
				if(results == movies.size()) {
				numResults = 0;
				} 
				break;
			}
			System.out.println("Dubugging shit");
		}
%>
	</table>
	<center>
		<% if(currResult > 0) { %>
			<button onClick="updateResults('prev')" style="color: #FFFFFF; font-family: Verdana; font-weight: bold; font-size: 14px; background-color: #808080">Prev</button>
		<% } %>	
		<select id="selectBox" onChange="changeNumResults()">
			<option selected disabled><%=numResults%></option>
	  		<option value="10">10</option>
	  		<option value="25">25</option>
	  		<option value="50">50</option>
		  	<option value="100">100</option>
		</select> 
	<button onClick="updateResults('next')" style="color: #FFFFFF; font-family: Verdana; font-weight: bold; font-size: 14px; background-color: #808080">Next</button>
	<BR><BR><FORM action="/fabflix/customer/main" method=GET align=center>
		<INPUT style="color: #FFFFFF; font-family: Verdana; font-weight: bold; font-size: 14px; background-color: #808080" TYPE="submit" VALUE="Return To Main Page">
	</FORM>
	</center>
</BODY>
</HTML>