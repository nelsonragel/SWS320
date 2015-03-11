<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page session="true" %>
<%@ page import="java.sql.*" %>
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
<title>Course Details</title>
</head>
<body>
<div class="Logo">
		<img class="logo" src="Images/logo.png" alt="Logo"/>
	</div>
<%
        String b = request.getParameter("CourseCode");
		String c= request.getParameter("SearchTerm");

            String sql = "SELECT  CourseCode, Description FROM Course WHERE CourseCode='"+b+"'";
          try {
        	  Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/courses","root","nelly123");
        	    System.out.println("Database Connection Established");
        	    if(!con.isClosed())
        	        System.out.println("Successfully connected to " + "MySQL server using TCP/IP...");
              Statement s = con.createStatement();
              ResultSet rs = s.executeQuery(sql);
             System.out.println("query executed");
              while (rs.next()) {
						out.println("<center><span style=\"color:Blue; font-size:2em;\">"+rs.getString(1)+"</span>");
                        out.println( "</br>" + rs.getString(2)+"<br/>");
                
            			out.println("<a href=Search.jsp?SearchTerm="+c+">Back</a></center>");
   
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
</body>
</html>