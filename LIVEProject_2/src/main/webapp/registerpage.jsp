<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

     <!-- fetching those url parameter -->
    <% String olink = request.getParameter("link"); %>
   
   


  <h3>Enter you personal details here.</h3>
     <form action="reviewdetails.jsp" method = "Post">
     
     Full Name: <input type  = "text" name = "fname">
     Address : <input type ="text" name = "address"><br></br>
     Age : <input type ="number" name = "age">
     CellPhone No : <input type ="text" name = "mobno"><br></br>
     Email/Username : <input type ="text" name = "username">
                    <input type ="hidden" name = "flightnumber"  value = <%=request.getParameter("link")%>>
     <label for="id">Choose ID:</label>

     <select name="id" id="id">
     <option value="Aadhaar Card">Aadhaar Card</option>
     <option value="Passport">Passport</option>
     <option value="Voter ID">Voter ID</option>
     <option value="Driving License">Driving License</option>
     <option value="SSN">SSN</option>
     </select>
     <input type="text" name="textID" id="id" /> 
     Country : <input type ="text" name = "country"><br></br>
     <input type = "submit" name = "click" value = "Review">
     </form>
     
     
     
     
</body>
</html>