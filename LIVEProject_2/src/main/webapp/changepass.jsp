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
   
     <form action = "updatepass.jsp" method = "post">
   
     Old Password : <input type  = "text" name = "oldpass"><br></br>
     New Password : <input type ="text" name = "newpass"><br></br>
     Confirm Password : <input type ="text" name = "confpass">
     <input type = "submit" name = "click" value = "Submit">
     </form>   
      
     
	
      

</body>
</html>