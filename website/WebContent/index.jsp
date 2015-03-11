<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
<script language="javascript">
  function writeFlash(title, w, h) {
    document.write('<object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=9.0.0.0" width="' + w + '" height="' + h + '" ID="sf" VIEWASTEXT>')
    document.write('  <param name="movie" value="' + title + '.swf" />')
    document.write('  <param name="quality" value="high" />')
    document.write('  <param name="wmode" value="window" />')
    document.write('  <param name="allowScriptAccess" value="always" />')
    document.write('  <param name="allowFullScreen" value="true" />')
    document.write('  <embed src="' + title + '.swf" quality="high" name="sf" allowScriptAccess="always" allowFullScreen="true" pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash" width="' + w + '" height="' + h + '"></embed>')
    document.write('</object>')
  }
</script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="Css/Style.css" rel="Stylesheet" type="text/css"/>
<title>Welcome</title>
</head>
<body onLoad="javascript: sf.focus()">

	<div class="Logo">
		<img class="logo" src="Images/logo.png" alt="Logo"/>
	</div>
	<div class="logoOne">
	<center>
		View Time Table|Program Options|View Waiting List|Important Dates
		</center>
	</div>
	<div class="logo">
	<center>
	<form action="Search" Method="GET">
		Search For A Course<input type="text" name="SearchTerm" width="100%" />
		<input type="Submit" value="Search"/>
		</form>
		
		<br/>
		<%
		HttpSession sessionInitial = request.getSession();
		session.setAttribute("id",sessionInitial.getId());
		session.setMaxInactiveInterval(20*60);
		HttpSession session1 = request.getSession();
		String sid = (String)session1.getAttribute("id");
          try {
        	  	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/courses","root","nelly123");
        	    System.out.println("Database Connection Established");
        	    if(!con.isClosed())
   				System.out.println("Successfully connected to " + "MySQL server using TCP/IP...");
        	    String sql = "SELECT * FROM history WHERE Sid = '"+sid+"'";
        	    Statement s = con.createStatement();
        	    ResultSet rs = s.executeQuery(sql);
        	    System.out.println("query executed");
        	    	while (rs.next()) {
        	    		System.out.println("query executed");
               		out.println("You Previously Searched For <a href=\"Search.jsp?SearchTerm=" + rs.getString(2) + "\">"+rs.getString(2)+"</a> on " + rs.getDate(1) +"<br/>");
               System.out.println("output extracted");
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

		</center>
	</div><div>
  <table width="100%" height="80%">
    <tr>
      <td>
        <center>
          <script language="javascript">
            writeFlash("logo", 1024, 540)
          </script>
        </center>
      </td>
    </tr>
  </table>
	</div>
	<div class="logoOne">
	<center>
		View Time Table|Program Options|View Waiting List|Important Dates
		</center>	</div>
</body>
</html>