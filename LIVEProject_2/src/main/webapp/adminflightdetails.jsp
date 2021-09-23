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
     
        <table border="1" width="100%">  
	 	<tr>  
	 	<th>Flight Name</th>   
		<th>Origin City</th>  
	 	<th>Destination City</th>
	 	<th>Price</th>  
	 	</tr>
        
     
        <%
         
         final String url = "jdbc:mysql://localhost:3306/flight";
         final String user = "root";
         final String password = "root";

         Connection con=null;
         Statement stmt=null;
         ResultSet rs=null;
       
         
     	String query= "SELECT Flight_name,Origin_city,Destination_city,Price from flightdetails ";
     	
    	
     	try {     	
         	try {
 				Class.forName("com.mysql.jdbc.Driver");
 			} catch (ClassNotFoundException e) {
 				e.printStackTrace();
 			}  	
             // opening database connection to MySQL server
             con = DriverManager.getConnection(url, user, password);
      
             stmt = con.createStatement();
             
            
             
             rs = stmt.executeQuery(query);
            %>
             <%while(rs.next())
	        		 {
                       
              %>	 					
	             		<tr>
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
            	    stmt.close();
            	 } catch(SQLException se){} 
             try { 
         	    rs.close();
         	 } catch(SQLException se){} 
        
                     
         }    
         %>
            
     
</body>
</html>