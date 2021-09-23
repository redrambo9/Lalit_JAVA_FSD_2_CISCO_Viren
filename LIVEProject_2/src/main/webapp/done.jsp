<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.Date,java.util.*,java.sql.*"%>  
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

    <%String usermail = request.getParameter("user"); %>
    <%String book = request.getParameter("bookin"); %>
    
    <%String flno=book.substring(0, 4); %>
    
    <%String displayname = request.getParameter("cname"); %>
    
    
   <h3>Thank You <%= usermail%> for booking with us !!</h3>
   <h3>Your Booking Details </h3>
            <table border="1" width="100%">  
	 	<tr>  
	 	<th>Booking ID</th>
	 	<th>Name</th>    
		<th>Flight No</th> 
		<th>Origin City</th> 
	 	<th>Destination City</th>
	 	<th>Departure Time</th>
	 	<th>Arrival Time</th>
	 	  
	 	</tr>
        
     
        <%
         
         final String url = "jdbc:mysql://localhost:3306/flight";
         final String user = "root";
         final String password = "root";

         Connection con=null;
         Statement stmt=null;
         ResultSet rs=null;
         PreparedStatement prSt=null;
       
         
     	String query= "SELECT Origin_city,Destination_city,Departure_time,Arrival_time from flightdetails where Flight_no=?";
     	
    	
     	try {     	
         	try {
 				Class.forName("com.mysql.jdbc.Driver");
 			} catch (ClassNotFoundException e) {
 				e.printStackTrace();
 			}  	
             // opening database connection to MySQL server
             con = DriverManager.getConnection(url, user, password);
      
             prSt = con.prepareStatement(query);
             
             prSt.setString(1,flno);
             
             rs = prSt.executeQuery();
            %>
             <%while(rs.next())
	        		 {
                       
              %>	 					
	             		<tr>
	             		
	             		<td><%=book%></td>
	             		<td><%=displayname %></td>
	             		<td><%=flno%></td>
	             		<td><%=rs.getString(1) %></td>
	             		<td><%=rs.getString(2) %></td>
	             		<td><%=rs.getString(3) %></td>
	             		<td><%=rs.getString(4) %></td>
	             
	             		</tr>
	             		

	         
	        	    
	         		<%}%>
	         		</table>	             

  
        <%}catch (SQLException sqlEx) {
             sqlEx.printStackTrace();
         }finally {
             //close connection ,stmt and resultset here
             try { 
            	   con.close(); 
            	 } catch(SQLException se){}

             try { 
            	    prSt.close();
            	 } catch(SQLException se){} 
              
        
                     
         }    
         %>
    
   
   <h3>Have a Nice Journey!!</h3>
</body>
</html>