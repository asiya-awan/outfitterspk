package com.outfitterspk.jdbc;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import com.outfitterspk.models.Product;
import com.outfitterspk.models.ProductVariant;

public class WomenProductDBUtil {
	
	private DataSource dataSource;
	
	public WomenProductDBUtil(DataSource theDataSource) {
		this.dataSource=theDataSource;
	}
	
	public List<Product> getWomenProducts() throws Exception{
		List<Product> products=new ArrayList<Product>();
			
		Connection myConn=null;
		Statement myStmt=null;
		ResultSet myRs=null;
		
		try {
			
		
		//get a connection
		myConn = dataSource.getConnection();
		
		//create sql statement
		String sql="select * from product where category_id=2";
		
		myStmt=myConn.createStatement();
		
		//execute a query
		myRs=myStmt.executeQuery(sql);
		System.out.println(myRs);
		
		//process result set
		while(myRs.next()) {
			//retrieve data from res
			int pId=myRs.getInt("id");
			String pName=myRs.getString("productname");
			String pDescription=myRs.getString("description");
			String pSpecs=myRs.getString("specs");
			int pCategoryId=myRs.getInt("category_id");
			int pSubCategoryId=myRs.getInt("subcategory_id");
			int pSKU=myRs.getInt("SKU");
			String pPicturesUrl=myRs.getString("picturesUrl");
			float pPrice=myRs.getFloat("price");
			
		//create new Product object
			Product tempProduct=new Product(pId,pName, pDescription,
					pSpecs,pCategoryId, pSubCategoryId,pSKU,pPicturesUrl,pPrice);
		
			//add it ot the list of products
			products.add(tempProduct);
		
		}
		
		//close JDBC object
			System.out.println("Women Products: "+products);
			return products;
		}
		finally {
			close(myConn,myStmt,myRs);
		}
		
	}
	
	
public Product getWomenProduct(int theProductId) throws Exception {
		
		Product theProduct = null;
		
		Connection myConn=null;
		PreparedStatement myStmt =null;
		ResultSet myRs = null;
		int productId;
		
		try {
			//convert product id to int
			//productId=Integer.parseInt(theProductId);
			
			//get connection to database
			myConn=dataSource.getConnection();
			
			//create sql to get selected product
			String sql="select * from product where id=?";
			
			
			//create prepared statment
			myStmt=myConn.prepareStatement(sql);
			
			//set params
			myStmt.setInt(1, theProductId);
			
			//execute statement
			myRs = myStmt.executeQuery();
			
			//retrieve data from result set row
			if(myRs.next()) {
				int pId=myRs.getInt("id");
				String pName=myRs.getString("productname");
				String pDescription=myRs.getString("description");
				String pSpecs=myRs.getString("specs");
				int pCategoryId=myRs.getInt("category_id");
				int pSubCategoryId=myRs.getInt("subcategory_id");
				int pSKU=myRs.getInt("SKU");
				String pPicturesUrl=myRs.getString("picturesUrl");
				float pPrice=myRs.getFloat("price");
				
				//use the productId during construction
				theProduct=new Product(pId,pName, pDescription,
						pSpecs,pCategoryId, pSubCategoryId,pSKU,pPicturesUrl,pPrice);
			}else {
				throw new Exception("Could not find product id: " +theProductId);
			}
			
			return theProduct;
			
		}finally {
			//clean up JDBC Object
			close(myConn,myStmt, myRs);
			
		}
		
	}


public List<ProductVariant> getWomenProductVariant(int theProductId) throws Exception {
	
	List<ProductVariant> productVariants=new ArrayList<ProductVariant>();
	ProductVariant theProductVariant= null;
	
	Connection myConn=null;
	PreparedStatement myStmt =null;
	ResultSet myRs = null;
	
	
	try {
		//convert product id to int
		//productId=Integer.parseInt(theProductId);
		
		//get connection to database
		myConn=dataSource.getConnection();
		
		//create sql to get selected product
		
		String sql="select pv.id, pv.size, pv.color, pv.quantity, pv.product_id from product p" + 
				"	join productvariant pv" + 
				"    on pv.product_id=p.id where p.id=?";
		
		//create prepared statement
		myStmt=myConn.prepareStatement(sql);
		
		//set params
		myStmt.setInt(1, theProductId);
		
		//execute statement
		myRs = myStmt.executeQuery();
		
		System.out.println(myRs);
		
		//retrieve data from result set row
		while(myRs.next()) {
			int pId=myRs.getInt("id");
			String size=myRs.getString("size");
			String color=myRs.getString("color");
			int quantity=myRs.getInt("quantity");
			int product_id=myRs.getInt("product_id");
			
			//use the productId during construction
			theProductVariant=new ProductVariant(pId,size,color,quantity, product_id);
			
			//add it ot the list of products
			productVariants.add(theProductVariant);
			System.out.println(theProductVariant);
		}
		
		
		System.out.println(theProductVariant);
		
		return productVariants;
		
	}finally {
		//clean up JDBC Object
		close(myConn,myStmt, myRs);
		
	}
	
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
