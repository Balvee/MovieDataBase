<%@ page language="java" import="movie.*" %>

<html>
<head>
  <style>
    table,tr {
    		margin-left: auto;
    		margin-right: auto;
      	border: 1px solid black
    }

  a {
    color:black;
    text-decoration: none;
  }

	#title {
		display: block;
		overflow: hidden;
		background-color: transparent;
		width: auto;
		height: auto;
		padding: 5px;
		font-family: "Helvetica", monospace;
		text-align: center;
		border-bottom: 2px solid black;
		margin: 2% 10% 0 10%;
    }

    p {
    		display: block;
    		text-align: center;
    		font-size: 18px;
    		font-weight: bold;
    }

    body {
    		display: block;
    		overflow: hidden;
    	/*background-color: #abafb2;*/
    		width: auto;
    		height: auto;
    		text-align: center;
        height: 200px;
   background: -webkit-linear-gradient(left, rgba(255,0,0,0), rgba(255,0,0,1));
   background: -o-linear-gradient(right, rgba(255,0,0,0), rgba(255,0,0,1));
   background: -moz-linear-gradient(right, rgba(255,0,0,0), rgba(255,0,0,1));
   background: linear-gradient(to right, rgba(255,0,0,0), rgba(255,0,0,1));
}
    }

    table {
    font-family: arial, sans-serif;
    border-collapse: collapse;

	}

	th {
	    border: 1px solid #dddddd;
	    text-align: center;
	    padding: 8px;
	    font-weight: normal;
      width: auto;
	}

	th.top{
		font-weight: bolder;
	}

	th:nth-child(3n+3){
		text-align: left;
	}

	tr:nth-child(even) {
	    background-color: #dddddd;
	}
.button {
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

.button:hover {background-color: #0c0100}

.button:active {
  background-color: #3e8e41;
  box-shadow: 0 5px #666;
  transform: translateY(4px);
}
#index.scroll {
    overflow: scroll;
}
  </style>
</head>

<jsp:useBean id="movieDB" class="movie.MovieDataBase" scope="session">
<jsp:setProperty name="movieDB" property="*" />
</jsp:useBean>

<body>

	<h1 id="title">Our Top 10 Favorite Movies!</h1>

	<!-- Ranking Table -->
	<div id="ranking">
		<p style="text-align:center;">Movie Rankings</p>

		<table>
			<col width="50">
			<col width="75">
			<tr>
		   		<th class="top">Top #</th>
		   		<th class="top">Rating</th>
		   		<th class="top">Movie Name</th>
			 </tr>

		 <%  for (int i = 1; i <= movieDB.getSize(); i++) {
		 		movieDB.retrieveRateRow(i);	%>
			 <tr>
			 	<th><%= i %></th>
			 	<th><%= movieDB.getAvgRating() %></th>
			 	<th><%=movieDB.getMovieName()%></th>
			 </tr>
		<% 	} 	%>
		</table>
	</div>

  <div id="index" class="scroll">
    <button class="button" onclick="rateMovies()">Rate Movies</button>
    <script>
    		function rateMovies(){
          location.replace("http://localhost:8080/MovieDataBase/moviePage.jsp");
        }
    </script>

	<!-- Admin Login -->

    <button class="button" onclick="checkPassword()">admin</button>
    <script>
    		function checkPassword(){
                var confirmPasswd = "hello";
                var passwd = prompt("Please enter the password:");
                if (passwd == confirmPasswd) {
                	location.replace("http://localhost:8080/MovieDataBase/admin.jsp");
                } else { alert('Wrong Password!'); }
    		 }// checkPassword
    </script>
	</div>
</div>
</body>
