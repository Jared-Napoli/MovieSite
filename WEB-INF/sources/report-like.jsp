<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<HTML>
<Center>
	<HEAD>
		<link rel="stylesheet" type="text/css" href="../../mystyle.css">
  		<H1 align = "center">How We Implemented the 'Like' Predicate</H1><BR>
	</HEAD>
</Center>
	<body>
		<p>
			When implementing the LIKE predicate, we used branching statements with multiple queires such as the following: <br><br>
			
			
				if(l_name != "")<br>
				{<br>
					if (firstFound)<br>
						query = query.concat(" AND last_name like \"" + l_name + "%\"))");<br>
					else<br>
					{<br>
						query = query.concat("select * from movies where id in (select movie_id from stars_in_movies where star_id in"<br>
						+ " (select id from stars where last_name like \"" + l_name + "%\"))");<br>
						firstFound = true;<br>
					}<br>
				}<br><br>
			
			
			This allowed us to pick up movies and stars even when the user fails to spell a name correctly or accidentally left off trailing characters of an actor's or movie's name. This method proved to be effective as our 'Search Page' is able to efectively find movies that are similar to the user's input.
		</p>
	</body>
