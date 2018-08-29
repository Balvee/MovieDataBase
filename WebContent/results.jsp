<%@ page language="java" import="movie.*" %>

<html>
<head></head>
<body onload="returnHome()">
	<div><!-- Add new item-->
		<jsp:useBean id="movieDB" class="movie.MovieDataBase" scope="session" />

		<% for (int i = 1;i <= movieDB.getSize(); i++) {
			String rating = "rate" + i;
			movieDB.retrieveIndexRow(i);
			movieDB.updateRatings(movieDB.getMovieName(), request.getParameter(rating));
		}
		%>

			<div>
		<script>
			function returnHome(){
					location.replace("http://localhost:8080/MovieDataBase/index.jsp");
			}
		</script>
	</div>
	</div>
</body>
</html>
