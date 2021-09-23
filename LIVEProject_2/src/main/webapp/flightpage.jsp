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
      
      <!-- fetching search parameters -->
          <%
        String Dot = request.getParameter("dot");
        String Ocity = request.getParameter("ocity");
        String Dcity = request.getParameter("dcity");
        String PERSON =request.getParameter("pcount");
        
        %>
        <% int persons = Integer.parseInt(PERSON);%>
         
       	 <table border="1" width="100%">  
	 	 <tr>  
	  	 <th>Flight Name</th>  
	     <th>Flight No</th>  
	 	 <th>Origin City</th>  
	 	 <th>Destination City</th>
	   	 <th>Departure Time</th>
	 	 <th>Arrival Time</th>
	     <th>Date of Travel</th>
	 	 <th>Class</th>
		 <th>Price</th>  
		 </tr>
       
     
      
    
      <%
         
         final String url = "jdbc:mysql://localhost:3306/flight";
         final String user = "root";
         final String password = "root";

         Connection con=null;
         Statement stmt=null;
         ResultSet rs;
         PreparedStatement prSt =null;
         
     	String query= "SELECT * from flightdetails where Origin_city=? and Destination_city=? and Available_seats >= ? and Date_of_Travel = ?";
     	
    	
     	try {     	
         	try {
 				Class.forName("com.mysql.jdbc.Driver");
 			} catch (ClassNotFoundException e) {
 				e.printStackTrace();
 			}  	
             // opening database connection to MySQL server
             con = DriverManager.getConnection(url, user, password);
      
             
             prSt = con.prepareStatement(query);
             
     	     
     	     
     	     prSt.setString(1,Ocity);
     	     prSt.setString(2,Dcity);
     	     prSt.setInt(3,persons);
     	     prSt.setString(4,Dot);
             
	         
	         
	         
	       
	         
	          rs = prSt.executeQuery();
	          %>
	          <%if(!rs.next()){%> <!-- if result set is null that means no result found and forwarded to noresult.jsp -->
	          
	        	 <jsp:forward page="noresult.jsp"/>
	        	 
	          <%}else%>
	          <%{
	        	  
	             rs=prSt.executeQuery();
	             
	         		while(rs.next())
	        		 {
                       
	         		%>
	         		    
	         		   
	             		<tr>
	             		<td><%=rs.getString(1) %></td>
	             		<td><a href="registerpage.jsp?link=<%=rs.getString(3) %>"><%=rs.getString(3) %></a></td> <!-- passing parameters in url -->
	             		<td><%=rs.getString(4) %></td>
	             		<td><%=rs.getString(5) %></td>
	             		<td><%=rs.getString(6) %></td>
	             		<td><%=rs.getString(7) %></td>
	             
	             		<td><%=rs.getString(11) %></td>
	             		<td><%=rs.getString(12) %></td>
	             		<td><%=rs.getFloat(2) %></td>
	             
	             		</tr>
	             		

	         
	        	    
	         		<%}%>
	         		</table>
	          <% }%>
	             
	         
	         
	        
	      
     	
  
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
      
      

</body>
</html>