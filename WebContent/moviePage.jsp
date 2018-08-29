<%@ page language="java" import="movie.*" %>

<html>
<head>
  <style>
  /*Source http://cssnewbie.com/10-beautiful-css-text-effects/#.WinNyFfXGf4*/
  p {
  font-family: "Avant Garde", Avantgarde, "Century Gothic", CenturyGothic, "AppleGothic", sans-serif;
  font-size: 20px;
  text-align: center;
  text-transform: uppercase;
  text-rendering: optimizeLegibility;

  &.elegantshadow {
    color: #131313;
    background-color: #e7e5e4;
    letter-spacing: .15em;
    text-shadow:
      1px -1px 0 #767676,
      -1px 2px 1px #737272,
      -2px 4px 1px #767474,
      -3px 6px 1px #787777,
      -4px 8px 1px #7b7a7a,
      -5px 10px 1px #7f7d7d,
      -6px 12px 1px #828181,
      -7px 14px 1px #868585,
      -8px 16px 1px #8b8a89,
      -9px 18px 1px #8f8e8d,
      -10px 20px 1px #949392,
      -11px 22px 1px #999897,
      -12px 24px 1px #9e9c9c,
      -13px 26px 1px #a3a1a1,
      -14px 28px 1px #a8a6a6,
      -15px 30px 1px #adabab,
      -16px 32px 1px #b2b1b0,
      -17px 34px 1px #b7b6b5,
      -18px 36px 1px #bcbbba,
      -19px 38px 1px #c1bfbf,
      -20px 40px 1px #c6c4c4,
      -21px 42px 1px #cbc9c8,
      -22px 44px 1px #cfcdcd,
      -23px 46px 1px #d4d2d1,
      -24px 48px 1px #d8d6d5,
      -25px 50px 1px #dbdad9,
      -26px 52px 1px #dfdddc,
      -27px 54px 1px #e2e0df,
      -28px 56px 1px #e4e3e2;
  }
  &.deepshadow {
    color: #e0dfdc;
    background-color: #333;
    letter-spacing: .1em;
    text-shadow:
      0 -1px 0 #fff,
      0 1px 0 #2e2e2e,
      0 2px 0 #2c2c2c,
      0 3px 0 #2a2a2a,
      0 4px 0 #282828,
      0 5px 0 #262626,
      0 6px 0 #242424,
      0 7px 0 #222,
      0 8px 0 #202020,
      0 9px 0 #1e1e1e,
      0 10px 0 #1c1c1c,
      0 11px 0 #1a1a1a,
      0 12px 0 #181818,
      0 13px 0 #161616,
      0 14px 0 #141414,
      0 15px 0 #121212,
      0 22px 30px rgba(0, 0, 0, 0.9);
  }
  &.insetshadow {
    color: #202020;
    background-color: #2d2d2d;
    letter-spacing: .1em;
    text-shadow:
      -1px -1px 1px #111,
      2px 2px 1px #363636;
  }
  &.retroshadow {
    color: #2c2c2c;
    background-color: #d5d5d5;
    letter-spacing: .05em;
    text-shadow:
      4px 4px 0px #d5d5d5,
      7px 7px 0px rgba(0, 0, 0, 0.2);
  }
}
    table,tr {
    		margin-left: auto;
    		margin-right: auto;
      	border: 1px solid black
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
  </style>
</head>

<jsp:useBean id="movieDB" class="movie.MovieDataBase" scope="session" >
<jsp:setProperty name="movieDB" property="*" />
</jsp:useBean>

<body>
		<h1>Rate Movies</h1>
		<form method="POST" action="http://localhost:8080/MovieDataBase/results.jsp">
		<table>
			<col width="50">
			<col width="75">
			<tr>
		   		<th class="top">Movie Name</th>
		   		<th class="top">Ratings</th>
			 </tr>

		 <%  for (int i = 1; i <= movieDB.getSize(); i++) {
		 		movieDB.retrieveIndexRow(i);%>
				 <tr>
				 	<th><%= movieDB.getMovieName() %></th>
				 	<th><select name="rate<%=i%>"><option>0</option><option>1</option><option>2</option>
          <option>3</option><option>4</option> <option>5</option></select></th>
				 </tr>
		 	<% 	} %>
		</table>
		<input class="input" type="submit" value="Submit Rating">
      <p>Rank from 1-5</p>
      <p>5 being the best</p>
  	</form>
	<!-- Return Home -->
	<div>
		<form action="http://localhost:8080/MovieDataBase/index.jsp">
			<input class="input" type="submit" value="Back to Movie List">

		</form>
	</div>
</body>
</html>
