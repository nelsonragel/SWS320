<%@page import="com.sun.org.apache.xerces.internal.impl.dv.xs.DateTimeDV"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page session="true" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.Calendar"%>
<%@ page import="java.text.SimpleDateFormat,java.util.Locale"%>
<%
try {
    Class.forName("com.mysql.jdbc.Driver").newInstance(); 
    System.out.println("MySQL JDBC Driver Connection Established");
}catch(Exception ex){
    out.println("Unable to connect to database"+ex);
}   
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="Css/Style.css" rel="Stylesheet" type="text/css"/>
<title>Search</title>
</head>
<body>
<% 
Locale locale = Locale.CANADA;
java.util.Calendar calendar = java.util.Calendar.getInstance( locale );

//2) get a java.util.Date from the calendar instance.
// this date will represent the current instant, or "now".
java.util.Date now = calendar.getTime();
String b = request.getParameter("SearchTerm");

%>	<div class="Logo">
		<img class="logo" src="Images/logo.png" alt="Logo"/>
	</div>
	<center>
	You Have Searched For:<label><span style="color:Red;"><%= b %></span></label>
	<table border="1">
	<tr >
	<th>COURSE CODE
	</th>
	<th>COURSE NAME
	</th>
	<th>PROFESSOR</th>
	<th>DESCRIPTION</th>
	<th>TERM</th>
	<th>ROOM</th>
	<th>TIME</th>
	<th>DAY</th>
	<th>PREREQUISITES</th>
	<th>CAPACITY</th>
	<th>SELECT</th>
	</tr>
	<%
       
	String sql="";
          if (!b.equals("None"))
          {
            sql = "SELECT CourseCode, CourseName, Professor, Description , Term, Room, TimeSlot, DaySlot, Prerequisites, Capacity FROM Course WHERE Description LIKE'%"+b+"%' OR CourseCode LIKE'%"+b+"%' OR CourseName LIKE '%"+b+"%'";
          }
          else if(b.equalsIgnoreCase("")||b.equals("None")||sql.equals(""))
          {
            sql = "SELECT * from Course";
          }
          try {
        	  Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/courses","root","nelly123");
        	    System.out.println("Database Connection Established");
        	    if(!con.isClosed())
        	         System.out.println("Successfully connected to " + "MySQL server using TCP/IP...");
              Statement s = con.createStatement();
              ResultSet rs = s.executeQuery(sql);
              System.out.println("query executed");
              while (rs.next()) {
              String cd=rs.getString(1);
                        out.println("<tr>");
                        out.println("<td>" + cd + "</td>");
                        out.println("<td>" + rs.getString(2) + "</td>");
                        out.println("<td>" + rs.getString(3) + "</td>");
                        out.println("<td>" + rs.getString(4) + "</td>");
                        out.println("<td>" + rs.getString(5) + "</td>");
                        out.println("<td>" + rs.getString(6) + "</td>");
                        out.println("<td>" + rs.getString(7) + "</td>");
                        out.println("<td>" + rs.getString(8) + "</td>");
                        out.println("<td>" + rs.getString(9) + "</td>");
                        out.println("<td>" + rs.getInt(10) + "</td>");
            			out.println("<td><A href=CourseDetails.jsp?CourseCode="+cd+"&SearchTerm="+b+">Details</a></td>");
                        out.println("</tr>");
              }
              rs.close();
              s.close();
              con.close();
          }
          catch (SQLException e) {
          }
       catch (Exception e) {
       }
     %>
	</table>
	<a href="index.jsp">Search Again</a>
	</center>
</body>
</html>