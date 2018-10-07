package com.outfitterspk.jdbc;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Types;

import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

import com.outfitterspk.models.BillingAddress;
import com.outfitterspk.models.Customer;
import com.outfitterspk.models.Product;

public class CustomerDBUtil {

private  DataSource dataSource;
 
	private static int insertedBillingId;
	public CustomerDBUtil(DataSource theDataSource) {
		this.dataSource=theDataSource;
	}
	
	
	public void createCustomer() {
		
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


public Customer getCustomer(String theEmail) throws Exception {
	
	Customer theCustomer = null;
	
	Connection myConn=null;
	PreparedStatement myStmt =null;
	ResultSet myRs = null;
	
	
	try {
		
		//get connection to database
		myConn=dataSource.getConnection();
		
		//create sql to get selected product
		String sql="select * from customer where email=?";
		
		//create prepared statment
		myStmt=myConn.prepareStatement(sql);
		
		//set params
		myStmt.setString(1, theEmail);
		
		//execute statement
		myRs = myStmt.executeQuery();
		
		//retrieve data from result set row
		if(myRs.next()) {
			int cId=myRs.getInt("id");
			String cFirstName=myRs.getString("firstName");
			String cLastName=myRs.getString("lastName");
			//email
			String cEmail=theEmail;
			String cPassword=myRs.getString("cpassword");
			String cAddress=myRs.getString("address");
			String cCity=myRs.getString("city");
			String cRegion=myRs.getString("region");
			String cCountry=myRs.getString("country");
			String cPostalCode=myRs.getString("postalCode");
			String cPhone=myRs.getString("phone");
			
			
			boolean cUseAddressAsBillingAddress=myRs.getBoolean("useAddressAsBillingAddress");
			boolean cIsCustomer=myRs.getBoolean("isCustomer");
			
			theCustomer=new Customer(cId, cFirstName, cLastName, cEmail, cPassword,cAddress,cCity,cRegion,cCountry, cPostalCode, cPhone, cUseAddressAsBillingAddress, cIsCustomer);
		
			System.out.println("GetCustomer" + theCustomer.toString());
		}else {
			throw new Exception("Could not find email: " + theEmail);
		}
		
		return theCustomer;
		
	}finally {
		//clean up JDBC Object
		close(myConn,myStmt, myRs);
		
	}
}


	public void addCustomer(Customer theCustomer) throws SQLException {
		
		Connection myConn=null;
		PreparedStatement myStmt=null;
		
		try {
			//get db connection
			myConn=dataSource.getConnection();
			
			//create sql for insert
			String sql="insert into customer "
					+ "(firstName, lastName, email, cpassword, address,city,region,country,postalCode,phone,useAddressAsBillingAddress, isCustomer)"
					+ "values (?, ?, ?, MD5(?), ?, ?, ?, ?,?,?,?,?)";
			
			myStmt=myConn.prepareStatement(sql);
			System.out.println(sql);
			
			//set the param values for the product
			myStmt.setString(1, theCustomer.getFirstName());
			myStmt.setString(2, theCustomer.getLastName());
			myStmt.setString(3, theCustomer.getEmail());
			myStmt.setString(4, theCustomer.getCpassword());
			
			myStmt.setNull(5, Types.VARCHAR);
			myStmt.setNull(6, Types.VARCHAR);
			myStmt.setNull(7, Types.VARCHAR);
			myStmt.setNull(8, Types.VARCHAR);
			myStmt.setNull(9, Types.VARCHAR);
			myStmt.setNull(10, Types.VARCHAR);
			myStmt.setNull(11, Types.BOOLEAN);
			myStmt.setBoolean(12, theCustomer.isCustomer());
			
					
			//execute sql insert
			System.out.println("create Customer : "+myStmt.toString());
			myStmt.execute();
			
		}
		finally {
		
		//clean up JDBC Object
		close(myConn, myStmt, null);
		}	
	}
	


	public void addCustomerAddress(Customer theCustomer) throws SQLException {

		Connection myConn=null;
		PreparedStatement myStmt=null;
		
		try {
			//get db connection
			myConn=dataSource.getConnection();
			
			
			String sql="UPDATE customer SET address = ?,city=?, region=?,country=?,postalCode=?, phone=?,useAddressAsBillingAddress=?,isCustomer=?  WHERE email = ?";
			
			myStmt=myConn.prepareStatement(sql);
			//System.out.println(sql);
			
			//set the param values for the product
			myStmt.setString(1, theCustomer.getAddress());
			myStmt.setString(2, theCustomer.getCity());
			myStmt.setString(3, theCustomer.getRegion());
			myStmt.setString(4, theCustomer.getCountry());
			myStmt.setString(5, theCustomer.getPostalCode());
			myStmt.setString(6, theCustomer.getPhone());
			myStmt.setBoolean(7, theCustomer.isUseSameBillingAddress());
			myStmt.setBoolean(8, theCustomer.isCustomer());
			myStmt.setString(9, theCustomer.getEmail());
					
			//execute sql insert
			System.out.println(myStmt.toString());
			myStmt.execute();
			
		}
		finally {
		
		//clean up JDBC Object
		close(myConn, myStmt, null);
		}	
	}


	public void addUser(Customer theCustomer) throws Exception {
		Connection myConn=null;
		PreparedStatement myStmt=null;
		
		try {
			//get db connection
			myConn=dataSource.getConnection();
			
			//create sql for insert
			String sql="insert into customer "
					+ "(firstName, lastName, email,cpassword, address,city,region,country,postalCode,phone,useAddressAsBillingAddress, isCustomer)"
					+ "values (?, ?, ?, ?, ?, ?, ?, ?,?,?,?,?)";
			
			myStmt=myConn.prepareStatement(sql);
			System.out.println(sql);
			
			//set the param values for the product
			myStmt.setString(1, theCustomer.getFirstName());
			myStmt.setString(2, theCustomer.getLastName());
			myStmt.setString(3, theCustomer.getEmail());
			myStmt.setNull(4, Types.VARCHAR);
			
			myStmt.setString(5, theCustomer.getAddress());
			myStmt.setString(6, theCustomer.getCity());
			myStmt.setString(7, theCustomer.getRegion());
			myStmt.setString(8, theCustomer.getCountry());
			myStmt.setString(9, theCustomer.getPostalCode());
			myStmt.setString(10, theCustomer.getPhone());
			myStmt.setBoolean(11, theCustomer.isUseSameBillingAddress());
			myStmt.setBoolean(12, theCustomer.isCustomer());
		
			
					
			//execute sql insert
			System.out.println("create user : "+myStmt.toString());
			myStmt.execute();
			
		}
		finally {
		
		//clean up JDBC Object
		close(myConn, myStmt, null);
		}	
		
	}
	
	public void updateCustomer(Customer theCustomer) throws Exception {
		Connection myConn=null;
		PreparedStatement myStmt=null;
		
		try {
			//get db connection
			myConn=dataSource.getConnection();

			
			//create sql update statement
			String sql="update customer "
						+"set firstName=?, lastName=?, email=?, address=?, city=?, region=?, country=?, postalCode=?, phone=? "
						+"where email=?";
			
			//create prepared statment
			myStmt=myConn.prepareStatement(sql);

			System.out.println(sql);
			
			//set the param values for the product
			myStmt.setString(1, theCustomer.getFirstName());
			myStmt.setString(2, theCustomer.getLastName());
			
			myStmt.setString(3, theCustomer.getEmail());
			myStmt.setString(4, theCustomer.getAddress());
			myStmt.setString(5, theCustomer.getCity());
			myStmt.setString(6, theCustomer.getRegion());
			myStmt.setString(7, theCustomer.getCountry());
			myStmt.setString(8, theCustomer.getPostalCode());
			myStmt.setString(9, theCustomer.getPhone());
			myStmt.setString(10, theCustomer.getEmail());
				
			//execute sql insert
			System.out.println("create user : "+myStmt.toString());
			myStmt.execute();
			
		}
		finally {
		
			//clean up JDBC Object
			close(myConn, myStmt, null);
		}	
		
	}


	public void updateCustomerBillingAddFlag(boolean isSameAsShippingAddress, String theEmail) throws Exception {
		Connection myConn=null;
		PreparedStatement myStmt=null;
		
		try {
			//get db connection
			myConn=dataSource.getConnection();

			
			//create sql update statement
			String sql="update customer "
						+"set useAddressAsBillingAddress=? "
						+"where email=?";
			
			//create prepared statment
			myStmt=myConn.prepareStatement(sql);

			System.out.println(sql);
			
			//set the param values for the product
			myStmt.setBoolean(1, isSameAsShippingAddress);
	
			myStmt.setString(2, theEmail);
				
			//execute sql insert
			System.out.println("update Billing Address Flag : "+myStmt.toString());
			myStmt.execute();
			
		}
		finally {
		
			//clean up JDBC Object
			close(myConn, myStmt, null);
		}	
		
		
	}


	public int addBillingAddress(BillingAddress billingAddress) throws Exception {
		
		Connection myConn=null;
		PreparedStatement myStmt=null;
		int insertedBillingId = 0;
		try {
			//get db connection
			myConn=dataSource.getConnection();
			
			//create sql for insert
			String sql="insert into billingaddress "
					+ "(firstName, lastName, address,city,region,country,postalCode,phone,customer_id)"
					+ "values (?, ?, ?, ?, ?, ?, ?, ?,?)";
			
			myStmt=myConn.prepareStatement(sql,Statement.RETURN_GENERATED_KEYS);
			System.out.println(sql);
			
			//set the param values for the product
			myStmt.setString(1, billingAddress.getFirstName());
			myStmt.setString(2, billingAddress.getLastName());
		
			
			myStmt.setString(3, billingAddress.getAddress());
			myStmt.setString(4, billingAddress.getCity());
			myStmt.setString(5, billingAddress.getRegion());
			myStmt.setString(6, billingAddress.getCountry());
			myStmt.setString(7, billingAddress.getPostalCode());
			myStmt.setString(8, billingAddress.getPhone());
			myStmt.setInt(9, billingAddress.getCustomer_id());
		
					
			//execute sql insert
			System.out.println("create user : "+myStmt.toString());
			myStmt.execute();
			
			ResultSet rs = myStmt.getGeneratedKeys();

			if (rs.next()) {
				insertedBillingId = rs.getInt(1);
			    System.out.println("Inserted ID -" + insertedBillingId); // display inserted record
			}
			
			return insertedBillingId;
			
		}
		finally {
		
		//clean up JDBC Object
		close(myConn, myStmt, null);
		}	
		
		
	}


	public Customer getCustomerById(int oCustomerId) throws Exception {
		Customer theCustomer = null;
		
		Connection myConn=null;
		PreparedStatement myStmt =null;
		ResultSet myRs = null;
		
		
		try {
			
			//get connection to database
			myConn=dataSource.getConnection();
			
			//create sql to get selected product
			String sql="select * from customer where id=?";
			
			//create prepared statment
			myStmt=myConn.prepareStatement(sql);
			
			//set params
			myStmt.setInt(1, oCustomerId);
			
			//execute statement
			myRs = myStmt.executeQuery();
			
			//retrieve data from result set row
			if(myRs.next()) {
				//int cId=myRs.getInt("id");
				String cFirstName=myRs.getString("firstName");
				String cLastName=myRs.getString("lastName");
				//email
				String cEmail=myRs.getString("email");
				String cPassword=myRs.getString("cpassword");
				String cAddress=myRs.getString("address");
				String cCity=myRs.getString("city");
				String cRegion=myRs.getString("region");
				String cCountry=myRs.getString("country");
				String cPostalCode=myRs.getString("postalCode");
				String cPhone=myRs.getString("phone");
				
				
				boolean cUseAddressAsBillingAddress=myRs.getBoolean("useAddressAsBillingAddress");
				boolean cIsCustomer=myRs.getBoolean("isCustomer");
				
				theCustomer=new Customer(oCustomerId, cFirstName, cLastName, cEmail, cPassword,cAddress,cCity,cRegion,cCountry, cPostalCode, cPhone, cUseAddressAsBillingAddress, cIsCustomer);
			
				System.out.println("GetCustomer" + theCustomer.toString());
			}else {
				throw new Exception("Could not find this Customer Id: " + oCustomerId);
			}
			
			return theCustomer;
			
		}finally {
			//clean up JDBC Object
			close(myConn,myStmt, myRs);
			
		}
		
	}


	
}
