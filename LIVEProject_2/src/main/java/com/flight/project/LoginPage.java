package com.flight.project;

import java.io.IOException;

import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.sql.*;
import java.sql.Driver;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Types;
import java.util.Scanner;

public class LoginPage extends HttpServlet {
	
	static final String JDBC_DRIVER = "com.mysql.jdbc.Driver";
	static  String url = "jdbc:mysql://localhost:3306/flight";
    static String user = "root";
    static  String password = "root";
    
    
	 Connection conn=null;
     Statement stmt=null;
     ResultSet rs=null;
     PreparedStatement prSt=null;
	
  
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		PrintWriter out = resp.getWriter();
		
		
		String email = req.getParameter("email");
		String pass = req.getParameter("pass");
		
	
		String query= "select Email,Password from login where Email = ? and Password = ?";
		
		try {
			
			try {
				Class.forName("com.mysql.jdbc.Driver");
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			}
			
			conn = DriverManager.getConnection(url, user, password);
			
			prSt = conn.prepareStatement(query);
			
			prSt.setString(1, email);
			prSt.setString(2, pass);
		    
		    rs = prSt.executeQuery();
		    	    
		    if(!rs.next()) {
		    	response(resp, "Invalid login or New User");
		    }
		     else{
		    	 
		    	// if the entered mail belong to admin then will be directed to adminpage
		    	 if("admin@yahoo.com".equals(email)){
		    		 
		    		 resp.sendRedirect("adminpage.jsp");
		    	 }
		    	 else {
			   
		    	 out.println("<html>");
		 		 out.println("<body>");
		 		 out.println("<t1>" + "Welcome "+email+ "</t1>");
		 		 out.println("</body>");
		 		 out.println("</html>");
		 		 
		 		
		          resp.sendRedirect("searchflight.jsp");
		    	 }
			  
		    }
		    
		}catch(SQLException se){
		      // JDBC
		      se.printStackTrace();
		   }catch(Exception e){
		      // Class.forName
		      e.printStackTrace();
		   }finally{
			   
		     
			  try{
			     if(rs!=null)
			        rs.close();
			      }catch(SQLException se1){
			    	  se1.printStackTrace();
			      }
		      try{
		         if(stmt!=null)
		            stmt.close();
		      }catch(SQLException se2){
		    	  se2.printStackTrace();
		      }
		      try{
		         if(conn!=null)
		            conn.close();
		      }catch(SQLException se){
		         se.printStackTrace();
		      }
		      try{
			         if(prSt!=null)
			            prSt.close();
			      }catch(SQLException se4){
			         se4.printStackTrace();
			      }
		   }
	     
		}
		
		
		
		
		
  private void response(HttpServletResponse resp, String msg) throws IOException {
		
	  PrintWriter out = resp.getWriter();
		out.println("<html>");
		out.println("<body>");
		out.println("<t1>" + msg + "</t1>");
		out.println("</body>");
		out.println("</html>");
	}
}
		

	
