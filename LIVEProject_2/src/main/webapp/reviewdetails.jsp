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
        <!-- fetching that hidden form parameter -->
        
        <%String flightno = request.getParameter("flightnumber"); %>
        
        
       <%String ffprice = null;%>
 
       <% String Name = request.getParameter("fname"); %>
       <% String Address = request.getParameter("address"); %>
       <% String Age =  request.getParameter("age"); %>
       <% int iage = Integer.parseInt(Age);%>
       <% String Mobno = request.getParameter("mobno"); %>
       <% String UName = request.getParameter("username"); %>
       <% String IDtype = request.getParameter("id"); %>
       <% String IDNo= request.getParameter("textID"); %>
       <% String Country = request.getParameter("country"); %>
       
       <!-- to generate booking id from flightno and first 4 digit of Mobileno -->
       <%String bid = (flightno+Mobno.substring(0, 4)).toString(); %>
       

      
      <!-- Hidden filed to pass generated id (not working & not used here) -->
       <form action="/" method = "get">
         <input type ="hidden" name = "bookid"  value = <%=bid%>>
       </form>
       
       <%
         
         final String url = "jdbc:mysql://localhost:3306/flight";
         final String user = "root";
         final String password = "root";

         Connection con=null;
         Statement stmt=null;
         ResultSet rs=null;
         PreparedStatement prSt =null;
         
         
     	String query= "INSERT into registerdetails values(?,?,?,?,?,?,?,?)";
     	String query2 = "Select * from flightdetails where Flight_no = ?";
    	
     	try {     	
         	try {
 				Class.forName("com.mysql.jdbc.Driver");
 			} catch (ClassNotFoundException e) {
 				e.printStackTrace();
 			}  	
             // opening database connection to MySQL server
             con = DriverManager.getConnection(url, user, password);
      
             
             prSt = con.prepareStatement(query);
             
             
             
     	     
     	     
     	     prSt.setString(1,Name);
     	     prSt.setString(2,Address);
     	     prSt.setInt(3,iage);
     	  	 prSt.setString(4,Mobno);
     	  	 prSt.setString(5,UName);
     	 	 prSt.setString(6,IDtype);
     		 prSt.setString(7,IDNo);
     		 prSt.setString(8,Country);
     	     
     	    
     		 prSt.executeUpdate();
	          
	         Connection conn =null; 
	         conn = DriverManager.getConnection(url, user, password);
	          
	         PreparedStatement prSt2 = con.prepareStatement(query2);
	         
	         prSt2.setString(1,flightno);
	         
	         rs = prSt2.executeQuery();
	         
	         %>
	         <%out.print("Flight Details"); %>
	        <table border="1" width="100%">  
	     	<tr> 
	     	<th>Flight No</th> 
	     	<th>Origin City</th>
	     	<th>Destination City</th> 
	     	<th>Departure Time</th> 
	     	<th>Arrival Time</th>
	     	<th>Date of Travel</th> 
	     	<th>Price</th> 
	     	</tr>   
	     	  
	     	 
	     	 <%while(rs.next())
	     	 { 
	     	 %>
	     	  <tr>
	     	  <td><%=rs.getString(3) %></td>
	     	  <td><%=rs.getString(4) %></td>
	     	  <td><%=rs.getString(5) %></td>
	     	  <td><%=rs.getString(6) %></td>
	     	  <td><%=rs.getString(7) %></td>
	     	  <td><%=rs.getString(11) %></td>
	     	  <td><%=rs.getFloat(2) %></td>
	     	  <%float fprice=rs.getFloat(2); %>
	     	  <%ffprice = Float.toString(fprice);%>
	     	  
	     	  
	     	  
	     	 </tr>
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
     <%out.print("Personal Details"); %>  
    <table border="1" width="100%">  
	<tr> 
	
	<th>Full Name</th> 
	<th>Age</th>
	<th>Mobile No</th> 
	<th>ID Type</th> 
	<th>ID No.</th>
	<th>Email</th> 
	<th>Address</th> 
	</tr>   
	<tr>  
	 
	
	<td><%=Name %></td> 
	<td><%=Age %></td> 
	<td><%=Mobno %></td> 
	<td><%=IDtype %></td> 
	<td><%=IDNo %></td> 
	<td><%=UName %></td> 
	<td><%=Address %></td> 
	  
	</tr>  
	 
</table>     
       
       <!-- passing parameters in the url and fetching these on next jsp -->
       <a href="confirmationpage.jsp?flight=<%=request.getParameter("flightnumber")%>&bookid=<%=bid%>&uname=<%=UName%>&newfprice=<%=ffprice%>&name=<%=Name%>">
      <button>Payment</button>
      </a>
       
</body>
</html>