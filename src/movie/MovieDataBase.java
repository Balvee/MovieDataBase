package movie;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class MovieDataBase {
	private static Connection conn;
	private static Statement stmt;
	private static PreparedStatement pst;
	private static ResultSet rs;
	
	private String curMovie;
	private float curAvg, curNumRating, curTotalRating;

	public MovieDataBase() throws SQLException, ClassNotFoundException {
		Class.forName("org.mariadb.jdbc.Driver");
		openConnection();
	}// constructor
	
	public void openConnection() throws SQLException {
		conn = DriverManager.getConnection("jdbc:mariadb://localhost:3306/moviedb?user=root&password=root");
	}

	public void addMovie(String movieName) throws SQLException {
		if(searchMovie(movieName) == false){
			stmt = conn.createStatement();
			String query = "insert into movieChart " + "(movieName, numRating, avgRating) " + "values ('"+movieName+"',0,0)";
			stmt.executeUpdate(query);
		} 
	}// addMovie
	
	public void removeMovie(String movieName) throws SQLException {
		if(searchMovie(movieName) == true){
			pst = conn.prepareStatement("DELETE FROM movieChart where movieName='" + movieName +"'");
			rs = pst.executeQuery();
		}//if
	}// addMovie
 
	// Searches for movie. Returns true if it already exists, false if not.
	public boolean searchMovie(String movieName) throws SQLException{
		boolean exists = false;
	
		pst = conn.prepareStatement("SELECT * FROM movieChart");
		rs = pst.executeQuery();
	
		while(rs.next()){
			String movie = rs.getString(1);
			if(movieName.equalsIgnoreCase(movie)){
				exists = true;
				break;
			}//if
		}//while
		return exists;
	}//searchMovie

	// Retrieves a given row of information from table
	public void retrieveRateRow(int row) throws SQLException{
		pst = conn.prepareStatement("Select movieName, cast(numRating as decimal(10,0)), cast(avgRating as decimal(2,1)) from movieChart order by avgRating desc");
		rs = pst.executeQuery();
		rs.absolute(row);
		curMovie = rs.getString(1);
		curNumRating = rs.getFloat(2);
		curAvg = rs.getFloat(3);
	}//retrieveRow
	
	public void retrieveIndexRow(int row) throws SQLException{
		pst = conn.prepareStatement("Select * from movieChart");
		rs = pst.executeQuery();
		rs.absolute(row);
		curMovie = rs.getString(1);
		curNumRating = rs.getFloat(2);
		curAvg = rs.getFloat(3);
	}//retrieveRow

	// Returns the selected row's movie name
	public String getMovieName(){
	  return curMovie;
	}//getMovieName
	
	public void updateRatings(String movieName, String rating) throws SQLException {
		if(Float.valueOf(rating) != 0) {
			pst = conn.prepareStatement("Select totalRating, numRating from movieChart where movieName='" +movieName+ "'");
			rs = pst.executeQuery();
			rs.next();
			curNumRating = rs.getFloat(2) + 1;
			curTotalRating = rs.getFloat(1) + Float.valueOf(rating);
			curAvg = (curTotalRating) / curNumRating;
			pst = conn.prepareStatement("update movieChart set avgRating='" +curAvg+ "', numRating='" +curNumRating+ "', totalRating='" +curTotalRating+ "' where movieName='" + movieName +"'");
			rs = pst.executeQuery();
		}
	}
	
	// Returns the selected row's avg rating
	public float getAvgRating(){
	  return curAvg;
	}//getAvgRating

	// Returns the selected row's rating count
	public float getRatingCount(){
	  return curNumRating;
  }//getRatingCount
  
	public int getSize() throws SQLException{
		pst = conn.prepareStatement("SELECT COUNT(movieName) FROM movieChart");
		rs = pst.executeQuery();
		rs.next();
		return rs.getInt(1);
	}//getSize  
}// MovieDB