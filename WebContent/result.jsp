<%@ page language="java" import="movie.*" %>

<html>
<head></head>
<body onload="returnHome()">
	<div><!-- Add new item-->
		<jsp:useBean id="movieDB" class="movie.MovieDataBase" scope="session" />

		<%	if (request.getParameter("newMovie") != null && request.getParameter("newMovie") != "")	{
				movieDB.addMovie(request.getParameter("newMovie"));
			} else if (request.getParameter("oldMovie") != null && request.getParameter("newMovie") != "") {
	     		movieDB.removeMovie(request.getParameter("oldMovie"));
	   		}
		%>

			<div>
		<script>
			function returnHome(){
					location.replace("http://localhost:8080/MovieDataBase/admin.jsp");
			}
		</script>
	</div>
	</div>
</body>
</html>
