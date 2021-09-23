<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
   <h3>You can Search your flights here.</h3>
   <form action = "flightpage.jsp" method = "post">
   
     Date of Travel(YYYY-MM-DD) : <input type  = "date" name = "dot">
     Origin City : <input type ="text" name = "ocity"><br></br>
     Destination City : <input type ="text" name = "dcity">
     Total Travellers : <input type ="number" name = "pcount">
     <input type = "submit" name = "click" value = "Search">
     </form>
    
     
</body>
</html>