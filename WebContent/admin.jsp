<%@ page language="java" import="movie.*" %>

<html>
<head>
  <style>

    table {
    font-family: arial, sans-serif;
    border-collapse: collapse;
    margin-left: auto;
    margin-right: auto;
    border: 1px solid black
	}

	th {
	    border: 1px solid #dddddd;
	    text-align: center;
	    padding: 8px;
	    font-weight: normal;
	}

	th.top{
		font-weight: bolder;
	}

	th:nth-child(3n+3){
		text-align: center;
	}

	tr:nth-child(even) {
	    background-color: #dddddd;
	}
	h1 {
		display: block;
		overflow: hidden;
		background-color: transparent;
		width: auto;
		height: auto;
		padding: 5px;
		font-family: "Courier", monospace;
		text-align: center;
		border-bottom: 2px solid black;
		margin: 5% 10% 0 10%;
    }

    body {
    		display: block;
    		overflow: hidden;
        height: 200px;
   background: -webkit-linear-gradient(left, rgba(255,0,0,0), rgba(255,0,0,1));
   background: -o-linear-gradient(right, rgba(255,0,0,0), rgba(255,0,0,1));
   background: -moz-linear-gradient(right, rgba(255,0,0,0), rgba(255,0,0,1));
   background: linear-gradient(to right, rgba(255,0,0,0), rgba(255,0,0,1));
    		width: auto;
    		height: auto;
    		text-align: center;
    }
    .input {
      padding: 15px 25px;
      font-size: 24px;
      text-align: center;
      cursor: pointer;
      outline: none;
      color: #fff;
      background-color: #0c0100;
      border: none;
      border-radius: 15px;
      box-shadow: 0 9px #999;
    }

    .input:hover {background-color: #0c0100}

    .input:active {
      background-color: #3e8e41;
      box-shadow: 0 5px #666;
      transform: translateY(4px);
    }
    #admin.scroll {
      height: 25%;
    overflow: scroll;
}
#ranking.scroll{
  height: 50%;
  overflow: scroll;
}
  </style>
</head>

<body>
	<h1>Movie Data Base!</h1>
	<jsp:useBean id="movieDB" class="movie.MovieDataBase" scope="session" />

	<!-- Movie Database Display -->
	<div>
		<h3>Display of the Movie List</h3>
			<!-- Ranking Table -->

		<div id="ranking" class="scroll">
		<table>
			<col width="50">
			<col width="75">
			<tr>
				<th class="top">Movie Name</th>
		   		<th class="top"># of Votes</th>
		   		<th class="top">Average Rating</th>
			 </tr>

		 <%  for (int i = 1; i <= movieDB.getSize(); i++) {
			 movieDB.retrieveRateRow(i);	%>
			 <tr>
			 	<th><%= movieDB.getMovieName() %></th>
			 	<th><%= movieDB.getRatingCount() %></th>
			 	<th><%= movieDB.getAvgRating() %></th>
			 </tr>
		<% 	} 	%>
		</table>
		</div>
	</div>
	<!-- Return to home page -->
	<div id="admin" class="scroll">
		<form action="http://localhost:8080/MovieDataBase/index.jsp">
			<input class="input" type="submit" value="Back to home page">
		</form>


	<!-- Add new movie to database -->

		<form method="POST" action="http://localhost:8080/MovieDataBase/result.jsp">
		<table>
			<tr>
				<td style="margin-left:auto; margin-right:auto;"><input type="text" id="newMovie" name="newMovie" placeholder="Movie Name"></td>
			</tr>
		</table>
		<input class="input" type="submit" onclick="updateDB()" value="Add Movie"/>
		</form>

	<!-- Delete movie from database -->

		<!-- Delete movie -->
		<form method="POST" action="http://localhost:8080/MovieDataBase/result.jsp">
		<table>
			<tr>
				<td><input type="text" id="oldMovie" name="oldMovie" placeholder="Movie Name"></td>
			</tr>
		</table>
		<input class="input" type="submit" onclick="updateDB()" value="Delete Movie"/>
		</form>


	<script type="text/javascript">
		function updateDB() {
			if(document.getElementById("newMovie").value == "" && document.getElementById("oldMovie").value == "") {
				alert("You forgot to type a movie!");
			}
		}
	</script>
</div>
</body>
</html>
