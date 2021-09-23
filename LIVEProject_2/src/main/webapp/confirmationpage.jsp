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
       
       
       <%String book = request.getParameter("bookid"); %>
       <%String NAME = request.getParameter("name"); %>
       
       <%String usermail = request.getParameter("uname"); %>
       <%String pprice = request.getParameter("newfprice"); %>
    
       
       
       
      <% String flno = request.getParameter("flight"); %>
      
      
     <h3>Payment Received Rs. <%=pprice %>/-!!</h3>
     <img src="payment.gif" alt="PAYMENT"><br>
     
     
     
       <%
         
         final String url = "jdbc:mysql://localhost:3306/flight";
         final String user = "root";
         final String password = "root";

         Connection con=null;
         Statement stmt=null;
         ResultSet rs;
         PreparedStatement prSt =null;
         // updating booked seats and vacant seats in database
     	String query= "Update flightdetails set Booked_seats = Booked_seats+1 , Available_seats = Total_seats-Booked_seats where Flight_no = ?";
     	// inserting into booking table booking table
         String query2 = "Insert into booking values(?,?,?)";
    	
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
     	     
     	     
     	     
     	     prSt.executeUpdate();
     	     
     	     
     	     Connection conn =null; 
     	     conn = DriverManager.getConnection(url, user, password);
	          
	         PreparedStatement prSt2 = conn.prepareStatement(query2);
	         
	         prSt2.setString(1,usermail);
	         prSt2.setString(2,book);
	         prSt2.setString(3,flno);
	         
	         prSt2.executeUpdate();
     	     
     	     
     	}catch (SQLException sqlEx) {
            sqlEx.printStackTrace();
        }finally {
            //close connection ,stmt and resultset here
            try { 
           	   con.close(); 
           	 } catch(SQLException se){}

            try { 
           	    prSt.close();
           	 } catch(SQLException se){}
          
                    
        }    %>
     
       <a href="done.jsp?user=<%=usermail%>&bookin=<%=book%>&cname=<%=NAME %>">
      <button>Done</button>
      </a>
</body>
</html>