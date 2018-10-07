package com.outfitterspk.jdbc;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.sql.DataSource;

public class LoginService {
	

	private DataSource dataSource;
	
	public LoginService(DataSource theDataSource) {
		this.dataSource=theDataSource;
	}

    public boolean login(String email, String password) {
        boolean loginSuccessful = false;
       
        System.out.println("email from Login method: "+email+" ,password: "+password);
        
        //emailMD5=MD5(email);
        Connection myConn=null;
        PreparedStatement myStmt=null;
		ResultSet myRs=null;
		
		try {
			
		//get a connection
		myConn = dataSource.getConnection();

        String sql = "SELECT * FROM customer WHERE email = ? AND cpassword = MD5(?)";

            myStmt = myConn.prepareStatement(sql);

            
            myStmt.setString(1, email);
            myStmt.setString(2, password);

            System.out.println(myStmt.toString());
           myRs = myStmt.executeQuery();

            while(myRs.next()) {
                loginSuccessful = true;
                
            }
        } catch (SQLException e) {
     
            e.printStackTrace();
        }

        return loginSuccessful;
        
       
    }
    
private void close(Connection myConn, Statement myStmt, ResultSet myRs) {
		
		try {
			
			if(myRs != null) {
				myRs.close();
			}
			
			if(myStmt != null) {
				myStmt.close();//doesn't really close it, just put back in connection pool
			}
			if(myConn != null) {
				myConn.close();
			}
			
		}catch(Exception exc) {
			exc.printStackTrace();
		}
		
	}
    
}