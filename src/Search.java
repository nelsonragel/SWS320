

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mysql.jdbc.PreparedStatement;

/**
 * Servlet implementation class Search
 */
@WebServlet("/Search")
public class Search extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Search() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String SearchTerm = request.getParameter("SearchTerm");
		if (SearchTerm.equalsIgnoreCase("")){
			SearchTerm="None";
		}
		Cookie c = new Cookie("un", SearchTerm);
		c.setMaxAge(60*60*24); ;
		response.addCookie(c);
		HttpSession session = request.getSession();
		String sid = (String)session.getAttribute("id");
		try {
		    Class.forName("com.mysql.jdbc.Driver").newInstance(); 
		    System.out.println("MySQL JDBC Driver Connection Established");
		}catch(Exception ex){
		   System.out.println("Unable to connect to database"+ex);
		} 
  	  Connection con;
	try {
		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/courses","root","nelly123");
	    System.out.println("Database Connection Established");
	    if(!con.isClosed())
	         System.out.println("Successfully connected to " + "MySQL server using TCP/IP...");
		String queryString = "INSERT INTO history(SearchDate,SearchString,Sid) VALUES (?,?,?)";
        java.sql.Timestamp  sqlDate = new java.sql.Timestamp(new java.util.Date().getTime());
			PreparedStatement ps = (PreparedStatement) con.prepareStatement(queryString);
			ps.setTimestamp(1, sqlDate);
			ps.setString(2, SearchTerm);
			ps.setString(3, sid);
			ps.executeUpdate();
			System.out.println("Inserterd in to history");
			ps.close();
			response.sendRedirect("Search.jsp?SearchTerm="+SearchTerm); 
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
