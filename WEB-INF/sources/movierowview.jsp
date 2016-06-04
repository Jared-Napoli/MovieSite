<%@page import="java.sql.*,
 javax.sql.*,
 java.io.IOException,
 javax.servlet.http.*,
 javax.servlet.*"
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">




<form class="hiddenID">
	<input type="hidden" name="hID" value=<%=movie.id%>>
</form>
<td style="border-right: solid;"><%=movie.id%></td>
<td><img src=<%=movie.banner_url%> alt="Picture failed to load." height="140" width="100"></td>
<td style="border-right: solid;"><a class="movie_link" href=/fabflix/customer/movie/<%=movie.id%>><%=movie.title%></a></td>
<td style="border-right: solid;"><%=movie.year%></td>
<td style="border-right: solid;"><%=movie.director%></td>
<!-- <td><a href="<%=movie.banner_url%>">Banner url</a></td>  -->

<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
<script>
$('.movie_link').ready(function() {
    $(".movie_link").tooltip({
    	items: "a",
    	position: { my: "left+15 top", at: "right center" },
    	content:function(callback) {
        	$.get('/fabflix/customer/tooltip/' + $(this).parent().parent().find(".hiddenID").serialize() , {}, function(data) {
            callback(data); //**call the callback function to return the value**
        });
    	},
    	hide: {delay:1500},
});
});
</script>