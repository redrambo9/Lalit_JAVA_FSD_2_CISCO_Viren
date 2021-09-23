<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>  
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
         
         <%String Newpass = request.getParameter("newpass");%>
         <%String Cpass = request.getParameter("confpass");%>
         <%!String mail = "admin@yahoo.com"; %>
         
         <!-- to check whether NewPassword and confirm pass are same or not  -->
         <%if(!Newpass.equals(Cpass)) {%>
         
            <%out.print("NewPassword And Confirm Password Do Not Match, Go Back and Correct it.");%>
          <%}else{ %>
         
         <%
         
         final String url = "jdbc:mysql://localhost:3306/flight";
         final String user = "root";
         final String password = "root";

         Connection con=null;
         Statement stmt=null;
         ResultSet rs=null;
         PreparedStatement prSt =null;
         
     	String query= "UPDATE login SET Password = ? WHERE Email = ? ";
    	
     	try {     	
         	try {
 				Class.forName("com.mysql.jdbc.Driver");
 			} catch (ClassNotFoundException e) {
 				e.printStackTrace();
 			}  	
             // opening database connection to MySQL server
             con = DriverManager.getConnection(url, user, password);
      
             
             prSt = con.prepareStatement(query);
             
     	     //System.out.println(mail+"  "+Changepass);
             prSt.setString(1,Newpass);
	         prSt.setString(2,mail);
	         
	         prSt.executeUpdate();
	         
	         
	       out.println("Password Changed");
	      
     	
  
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
             
                     
         }    
         
       }%>
     
</body>
</html>