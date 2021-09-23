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
      
      <!-- dataSource tag -->
	<sql:setDataSource var="db" driver="com.mysql.jdbc.Driver"  
	     url="jdbc:mysql://localhost:3306/flight"  
	     user="root"  password="root"/> 
	    
	   <%String Oldpass = request.getParameter("oldpass");%>
       <%String Newpass = request.getParameter("newpass");%>
       
       <%out.print(Oldpass); %>>
       
        
   				
		
       
    	<!--<sql:update dataSource="${db}" var="change"> 

    	 Update login set Password = ${Newpass}  where Password =${Oldpass} ;
    	
   
      	</sql:update>-->
</body>
</html>