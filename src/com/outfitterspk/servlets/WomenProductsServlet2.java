package com.outfitterspk.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.annotation.Resource;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

/**
 * Servlet implementation class WomenProductsServlet
 */
@WebServlet("/WomenProductsServlet2")
public class WomenProductsServlet2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   //Define dataResource/connection pool for Resource injection
	@Resource(name="jdbc/store")
	private DataSource dataSource;
	
    public WomenProductsServlet2() {
       
    }

	
    @Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
 //step 1: setup Print Writer
    	PrintWriter out=response.getWriter();
    	response.setContentType("text/html");
    	//step 2: get connection to the database
    	
    	
    	
    	Connection myConn=null;
    	Statement myStmt=null;
    	ResultSet myRs=null;
    	
    	
    	try {
    		myConn=dataSource.getConnection();
    		
    		//3: create a sql statement
    		String sql="select * from product where id=1";
    		myStmt=myConn.createStatement();
    		
    		//4: execute sql statement
    		myRs=myStmt.executeQuery(sql);
    		
    		//5: Process Result Set
    		while(myRs.next()) {
    			String title=myRs.getString("productname");
    			String pictures=myRs.getString("picturesUrl");
    			String price=myRs.getString("price");
    			
//    			String[] picture=pictures.split(";");
//    			out.println(picture[0]);
    		}
    		
    	}catch(Exception exc) {
    		exc.printStackTrace();
    	}
    	
    

	}

}
