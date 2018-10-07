package com.outfitterspk.jdbc;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import com.outfitterspk.models.Product;

public class ProductDBUtil {
	
	private DataSource dataSource;
	
	public ProductDBUtil(DataSource theDataSource) {
		this.dataSource=theDataSource;
	}
	
	public List<Product> getProducts() throws Exception{
		List<Product> products=new ArrayList<Product>();
			
		Connection myConn=null;
		Statement myStmt=null;
		ResultSet myRs=null;
		
		try {
			
		//get a connection
		myConn = dataSource.getConnection();
		
		//create sql statement
		String sql="select * from product";
		myStmt=myConn.createStatement();
		
		//execute a query
		myRs=myStmt.executeQuery(sql);
		
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
			
			return products;
		}
		finally {
			close(myConn,myStmt,myRs);
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

	public void addProduct(Product theProduct) throws Exception {
		
		Connection myConn=null;
		PreparedStatement myStmt=null;
		
		try {
			//get db connection
			myConn=dataSource.getConnection();
			
			//create sql for insert
			String sql="insert into product "
					+ "(productname, description, specs, category_id, subcategory_id, SKU, picturesUrl, price)"
					+ "values (?, ?, ?, ?, ?, ?, ?, ?)";
			
			myStmt=myConn.prepareStatement(sql);
			System.out.println(sql);
			
			//set the param values for the product
			myStmt.setString(1, theProduct.getProductName());
			myStmt.setString(2, theProduct.getDescription());
			myStmt.setString(3, theProduct.getSpecs());
			myStmt.setInt(4, theProduct.getCategory_id());
			myStmt.setInt(5, theProduct.getSubcategory_id());
			myStmt.setInt(6, theProduct.getSKU());
			myStmt.setString(7, theProduct.getPicturesUrl());
			myStmt.setFloat(8, theProduct.getPrice());
			
					
			//execute sql insert
			System.out.println(myStmt.toString());
			myStmt.execute();
			
		}
		finally {
		
		//clean up JDBC Object
		close(myConn, myStmt, null);
		}	
	}

	public Product getProduct(String theProductId) throws Exception {
		
		Product theProduct = null;
		
		Connection myConn=null;
		PreparedStatement myStmt =null;
		ResultSet myRs = null;
		int productId;
		
		try {
			//convert product id to int
			productId=Integer.parseInt(theProductId);
			
			//get connection to database
			myConn=dataSource.getConnection();
			
			//create sql to get selected product
			String sql="select * from product where id=?";
			
			//create prepared statment
			myStmt=myConn.prepareStatement(sql);
			
			//set params
			myStmt.setInt(1, productId);
			
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
				throw new Exception("Could not find product id: " +productId);
			}
			
			return theProduct;
			
		}finally {
			//clean up JDBC Object
			close(myConn,myStmt, myRs);
			
		}
		
	}
	
	public int getProductVariantId(int theProductId, String color, String size) throws Exception {
		int theProductVariantId;
		
		Connection myConn=null;
		PreparedStatement myStmt =null;
		ResultSet myRs = null;
		
		
		try {
			//convert product id to int
			int productId=theProductId;
			
			//get connection to database
			myConn=dataSource.getConnection();
			
			//create sql to get selected product
			String sql="(select id from productvariant where product_id=? and color=? and size=? )";
			
			//create prepared statment
			myStmt=myConn.prepareStatement(sql);
			
			//set params
			myStmt.setInt(1, productId);
			myStmt.setString(2, color);
			myStmt.setString(3, size);
			
			System.out.println(myStmt);
			//execute statement
			myRs = myStmt.executeQuery();
			
			System.out.println("Product Variant id: "+myRs);
			
			//retrieve data from result set row
			if(myRs.next()) {
				theProductVariantId=myRs.getInt("id");
				System.out.println("Product Variant id: "+theProductVariantId);
	
			}else {
				throw new Exception("Could not find product variant id: ");
			}
			
			return theProductVariantId;
			
		}finally {
			//clean up JDBC Object
			close(myConn,myStmt, myRs);
			
		}
		
		
	
		
		
	}

	public void editProduct(Product theProduct)throws Exception {
		
		Connection myConn=null;
		PreparedStatement myStmt =null;
		
		try {
			//get connection to database
			myConn=dataSource.getConnection();
			
			//create sql update statement
			String sql="update product "
						+"set productname=?, description=?, specs=?, category_id=?, subcategory_id=?, SKU=?, picturesUrl=?, price=? "
						+"where id=?";
			
			//create prepared statment
			myStmt=myConn.prepareStatement(sql);
			
			//set params
			
			myStmt.setString(1, theProduct.getProductName());
			myStmt.setString(2, theProduct.getDescription());
			myStmt.setString(3, theProduct.getSpecs());
			myStmt.setInt(4, theProduct.getCategory_id());
			myStmt.setInt(5, theProduct.getSubcategory_id());
			myStmt.setInt(6, theProduct.getSKU());
			myStmt.setString(7, theProduct.getPicturesUrl());
			myStmt.setFloat(8, theProduct.getPrice());
			
			myStmt.setInt(9, theProduct.getId());
			
			System.out.println("Edit Product Statement");
			myStmt.execute();	
			
		}
		finally {
			//clean up JDBC Object
			close(myConn,myStmt, null);
			
		}
		
	}

	public void deleteProduct(String theProductId) throws Exception {
		
		
		Connection myConn=null;
		PreparedStatement myStmt =null;
		
		try {
			//convert product id to int
			int productId=Integer.parseInt(theProductId);
			
			//get connection to database
			myConn=dataSource.getConnection();
			
			//create sql to delete product
			String sql="delete from product "
						+"where id=?";
			
			//create prepared statment
			myStmt=myConn.prepareStatement(sql);
			
			//set params
			myStmt.setInt(1, productId);
			
			myStmt.execute();
			
		}finally {
			//clean up JDBC Object
			close(myConn,myStmt, null);
		}
		
	}

}
