package com.outfitterspk.jdbc;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.sql.DataSource;

import com.outfitterspk.models.BillingAddress;
import com.outfitterspk.models.Customer;
import com.outfitterspk.models.Order;
import com.outfitterspk.models.OrderDetails;
import com.outfitterspk.models.OrderSummary;
import com.outfitterspk.models.Product;

public class OrderDBUtil {

	
private DataSource dataSource;
private CustomerDBUtil customerDbUtil;
Customer customer;
	
	public OrderDBUtil(DataSource theDataSource,CustomerDBUtil theCustomerDBUtil) {
		this.dataSource=theDataSource;
		this.customerDbUtil=theCustomerDBUtil;
	}
	
	public OrderDBUtil(DataSource theDataSource) {
		this.dataSource=theDataSource;
	
	}
	
	

public int addOrder(Order order) throws Exception {
	Connection myConn=null;
	PreparedStatement myStmt=null;
	ResultSet myRs=null;
	int insertedOrderId = 0;
	
	try {
		//get db connection
		myConn=dataSource.getConnection();
		
		//create sql for insert
		String sql="insert into orders "
				+ "(customer_id, orderDate,requiredDate,shippedDate,ShipVia,orderStatus)"
				+ "values (?, ?, ?, ?, ?, ?)";
		
		myStmt=myConn.prepareStatement(sql,Statement.RETURN_GENERATED_KEYS);
		System.out.println(sql);
		
		
		//get customer ID
		//customerDbUtil.getCustomer("");
		
		//get billing ID
		
		
		//set the param values for the product
		myStmt.setInt(1, order.getCustomerId());
		myStmt.setDate(2, new java.sql.Date(order.getOrderDate().getTime()));

		myStmt.setDate(3, new java.sql.Date(order.getRequiredDate().getTime()));
		myStmt.setDate(4, null);
		myStmt.setString(5, order.getShipVia());
		
		myStmt.setString(6, "Building");
				
		//execute sql insert
		System.out.println("create order : "+myStmt.toString());
		myStmt.execute();
		
		myRs = myStmt.getGeneratedKeys();

		if (myRs.next()) {
			insertedOrderId = myRs.getInt(1);
		    System.out.println("Inserted Order ID -" + insertedOrderId); // display inserted record
		}
		
		return insertedOrderId;
		
	}
	finally {
	
	//clean up JDBC Object
	close(myConn, myStmt, myRs);
	}	
	
}

public int addOrderDetails(OrderDetails orderDetails) throws Exception {
	Connection myConn=null;
	PreparedStatement myStmt=null;
	ResultSet myRs=null;
	int insertedOrderDetailsId = 0;
	
	try {
		//get db connection
		myConn=dataSource.getConnection();
		
		//create sql for insert
		String sql="insert into orderdetails "
				+ "(order_id, product_id,productVariant_id,price,quantity)"
				+ "values (?, ?, ?, ?, ?)";
		
		myStmt=myConn.prepareStatement(sql,Statement.RETURN_GENERATED_KEYS);
		System.out.println(sql);
		
		//set the param values for the product
		myStmt.setInt(1,orderDetails.getOrderId());
		myStmt.setInt(2,orderDetails.getProductId());

		myStmt.setInt(3,orderDetails.getProductVariantId());
		myStmt.setFloat(4, orderDetails.getPrice());
		myStmt.setInt(5, orderDetails.getQuantity());
	
				
		//execute sql insert
		System.out.println("create order Details: "+myStmt.toString());
		myStmt.execute();
		
		myRs = myStmt.getGeneratedKeys();

		if (myRs.next()) {
			insertedOrderDetailsId = myRs.getInt(1);
		    System.out.println("Inserted Order details ID -" + insertedOrderDetailsId); // display inserted record
		}
		
		return insertedOrderDetailsId;
		
	}
	finally {
	
	//clean up JDBC Object
	close(myConn, myStmt, myRs);
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

	
	
	public List<OrderSummary> getOrderSummary(int theOrderId) throws Exception{
		
		List<OrderSummary> listOrderSummary = new ArrayList<OrderSummary>();
		
		Connection myConn=null;
		PreparedStatement myStmt =null;
		ResultSet myRs = null;
	
		
		try {
			
			
			//get connection to database
			myConn=dataSource.getConnection();
			
			//create sql to get selected product
			String sql="SELECT p.SKU, p.productname,p.price, pv.color, pv.size, od.quantity, o.orderDate, o.shippedDate, o.orderStatus FROM (((product p\r\n" + 
					"INNER JOIN productvariant pv ON p.id = pv.product_id)\r\n" + 
					"INNER JOIN orderdetails od ON pv.id=od.productVariant_id)\r\n" + 
					"INNER JOIN orders o ON od.order_id=o.id)\r\n" + 
					"where od.order_id=? ";
			
			//create prepared statment
			myStmt=myConn.prepareStatement(sql);
			
			//set params
			myStmt.setInt(1, theOrderId);
			
			System.out.println(myStmt.toString());
			//execute statement
			myRs = myStmt.executeQuery();
			
			System.out.println(myRs.toString());
			OrderSummary theOrderSummary;
			
			//retrieve data from result set row
			while(myRs.next()) {
				String sSKU=myRs.getString("SKU");
				String sProductName=myRs.getString("productname");
				float sPrice=myRs.getFloat("price");
				String sColor=myRs.getString("color");
				String sSize=myRs.getString("size");
				int sQuantity=myRs.getInt("quantity");
				Date sOrderDate=myRs.getDate("orderDate");
				Date sShippedDate=myRs.getDate("shippedDate");
				String sOrderStatus=myRs.getString("orderStatus");
				
				
			theOrderSummary=new OrderSummary(sSKU,sProductName,sPrice,sColor,sSize,sQuantity,sOrderDate,sShippedDate,sOrderStatus);
			
				listOrderSummary.add(theOrderSummary);
			
			}
			System.out.println(listOrderSummary.toString());
			return listOrderSummary;
			
		}finally {
			//clean up JDBC Object
			close(myConn,myStmt, myRs);
			
		}

	}
	
	

/*  Retrieve order details of only single order   */
	public List<OrderDetails> getOrderDetails(int theOrderId) throws Exception {
		List<OrderDetails> listOrdersDetails = new ArrayList<OrderDetails>();
		
		Connection myConn=null;
		PreparedStatement myStmt =null;
		ResultSet myRs = null;
		//int customerId;
		
		try {
			//convert product id to int
			//customerId=Integer.parseInt(theCustomerId);
			
			//get connection to database
			myConn=dataSource.getConnection();
			
			//create sql to get selected product
			String sql="select * from ordersdetails where order_id=? ";
			
			//create prepared statment
			myStmt=myConn.prepareStatement(sql);
			
			//set params
			myStmt.setInt(1, theOrderId);
			
			//execute statement
			myRs = myStmt.executeQuery();
			
			//retrieve data from result set row
			while(myRs.next()) {
				int oDetailId=myRs.getInt("id");
				int oOrderId=theOrderId;
				int oProductId=myRs.getInt("product_id");
				int oProductVariantId=myRs.getInt("productVariant_id");
				float oPrice=myRs.getFloat("price");
				int oQuantity=myRs.getInt("quantity");

					
				//use the productId during construction
			OrderDetails theOrderDetail=new OrderDetails(oDetailId,oOrderId,oProductId,oProductVariantId,oPrice,oQuantity);
			
				listOrdersDetails.add(theOrderDetail);
			
			}
			
			return listOrdersDetails;
			
		}finally {
			//clean up JDBC Object
			close(myConn,myStmt, myRs);
			
		}

	}
	
	
	public int getLastOrderIdOfCustomer(int theCustomerId)throws Exception {
		
		int orderId=0;
		
		Connection myConn=null;
		PreparedStatement myStmt =null;
		ResultSet myRs = null;
		//int customerId;
		
		try {
			//convert product id to int
			//customerId=Integer.parseInt(theCustomerId);
			
			//get connection to database
			myConn=dataSource.getConnection();
			
			//create sql to get selected product
			String sql="select id from orders where id = (select max(id) from orders where customer_id = ?)";
			
			//create prepared statment
			myStmt=myConn.prepareStatement(sql);
			
			//set params
			myStmt.setInt(1, theCustomerId);
			
			//execute statement
			myRs = myStmt.executeQuery();
			
			//retrieve data from result set row
			while(myRs.next()) {
				orderId=myRs.getInt("id");
			
			}
			
			return orderId;
			
		}finally {
			//clean up JDBC Object
			close(myConn,myStmt, myRs);
			
		}
		
	}

	
	/*  get order by order Id */
	public Order getOrderById(int theOrderId) throws Exception,SQLException {

		Order theOrder = null;
		
		Connection myConn=null;
		PreparedStatement myStmt =null;
		ResultSet myRs = null;
		//int customerId;
		
		try {
			//convert product id to int
			//customerId=Integer.parseInt(theCustomerId);
			
			//get connection to database
			myConn=dataSource.getConnection();
			
			//create sql to get selected product
			String sql="select * from orders where id = ?";
			
			//create prepared statment
			myStmt=myConn.prepareStatement(sql);
			
			//set params
			myStmt.setInt(1, theOrderId);
			
			//execute statement
			myRs = myStmt.executeQuery();
			
			//retrieve data from result set row
			while(myRs.next()) {
				int oId=myRs.getInt("id");
				int oCustomerId=myRs.getInt("customer_id");
				
				Date oOrderDate=(Date) myRs.getDate("orderDate");
				Date oRequiredDate=(Date) myRs.getDate("requiredDate");
				Date oShippedDate=(Date) myRs.getDate("shippedDate");
				
				String oShipVia=myRs.getString("ShipVia");
				
				String oOrderStatus=myRs.getString("orderStatus");
		
				 
				 theOrder=new Order(oId,oCustomerId,oOrderDate,oRequiredDate,oShippedDate,oShipVia,oOrderStatus);
				 
			}
			
			return theOrder;
		
		}finally {
			//clean up JDBC Object
			close(myConn,myStmt, myRs);
			
		}

	}

	
	/****  GET ALL ORDERS OF CUSTOMER  NOT IN COMPLETED state          ***/
	public List<Order> getOrdersbyCustomerId(int theCustomerId) throws Exception,SQLException {

		List<Order> theOrders = new ArrayList<Order>();
		
		Connection myConn=null;
		PreparedStatement myStmt =null;
		ResultSet myRs = null;
		//int customerId;
		
		try {
			//convert product id to int
			//customerId=Integer.parseInt(theCustomerId);
			
			//get connection to database
			myConn=dataSource.getConnection();
			
			//create sql to get selected product
			String sql="select * from store.orders where (customer_id=?) and orderStatus IN ('Building', 'Shipped')";
			
			//create prepared statment
			myStmt=myConn.prepareStatement(sql);
			
			//set params
			myStmt.setInt(1, theCustomerId);
			
			//execute statement
			myRs = myStmt.executeQuery();
			Order theOrder;
			
			//retrieve data from result set row
			while(myRs.next()) {
				int oId=myRs.getInt("id");
				int oCustomerId=theCustomerId;
				
				Date oOrderDate=myRs.getDate("orderDate");
				Date oRequiredDate=myRs.getDate("requiredDate");
				Date oShippedDate=myRs.getDate("shippedDate");
				
				String oShipVia=myRs.getString("ShipVia");
				
				String oOrderStatus=myRs.getString("orderStatus");
		
				
				//use the productId during construction
			theOrder=new Order(oId,oCustomerId,oOrderDate,oRequiredDate,oShippedDate,oShipVia, oOrderStatus);
			
				theOrders.add(theOrder);
			
			}
			
			return theOrders;
			
		}finally {
			//clean up JDBC Object
			close(myConn,myStmt, myRs);
			
		}

	}


	public void addOrderIdInBillingAddress(int orderId, int billingId) throws Exception {
		
		Connection myConn=null;
		PreparedStatement myStmt=null;
		
		try {
			//get db connection
			myConn=dataSource.getConnection();

			
			//create sql update statement
			String sql="update billingaddress "
						+"set order_id=? "
						+"where id=?";
			
			//create prepared statment
			myStmt=myConn.prepareStatement(sql);

			System.out.println(sql);
			
			//set the param values for the product
			myStmt.setInt(1, orderId);
	
			myStmt.setInt(2, billingId);
				
			//execute sql insert
			System.out.println("add Order_id in billingAddress : "+myStmt.toString());
			myStmt.execute();
			
		}
		finally {
		
			//clean up JDBC Object
			close(myConn, myStmt, null);
		}	
	}
	
	public BillingAddress getBillingAddress(int theOrderId)throws Exception {
		Connection myConn=null;
		PreparedStatement myStmt =null;
		ResultSet myRs = null;


		BillingAddress billingAddress=null;
		
		try {
			
			
			//get connection to database
			myConn=dataSource.getConnection();
			
			//create sql to get selected product
			String sql="select * from billingaddress where order_id=?";
			
			//create prepared statment
			myStmt=myConn.prepareStatement(sql);
			
			//set params
			myStmt.setInt(1, theOrderId);
			
			//execute statement
			myRs = myStmt.executeQuery();
			
			
			//retrieve data from result set row
			while(myRs.next()) {
				
				String bFirstName=myRs.getString("firstName");
				String bLastName =myRs.getString("firstName");
				String bAddress= myRs.getString("address");
				String bCity=myRs.getString("city");
				String bRegion= myRs.getString("region");
				String bCountry=myRs.getString("country");
				String bPostalCode =myRs.getString("postalCode");
				String bPhone =myRs.getString("phone");
				int bCustomerId =myRs.getInt("customer_id");
					
				//use the productId during construction
				 billingAddress=new BillingAddress(bFirstName,bLastName,bAddress,bCity,bRegion,bCountry,bPostalCode,bPhone,bCustomerId);
			
			}
			
			return billingAddress;
			
		}finally {
			//clean up JDBC Object
			close(myConn,myStmt, myRs);
			
		}
		
	}

	public List<Order> getAllOrders()throws Exception {
		List<Order> theOrders=new ArrayList<Order>();
		
		Connection myConn=null;
		Statement myStmt=null;
		ResultSet myRs=null;
		
		try {
			
		//get a connection
		myConn = dataSource.getConnection();
		
		//create sql statement
		String sql="select * from orders where orderStatus!='Completed' ";
		myStmt=myConn.createStatement();
		
		//execute a query
		myRs=myStmt.executeQuery(sql);
		
		//process result set
		while(myRs.next()) {
			//retrieve data from res
			int oId=myRs.getInt("id");
			int oCustomerId=myRs.getInt("customer_id");
			
			Date oOrderDate=myRs.getDate("orderDate");
			Date oRequiredDate=myRs.getDate("requiredDate");
			Date oShippedDate=myRs.getDate("shippedDate");
			
			String oShipVia=myRs.getString("ShipVia");
			
			String oOrderStatus=myRs.getString("orderStatus");
	
			
			//use the productId during construction
		Order theOrder = new Order(oId,oCustomerId,oOrderDate,oRequiredDate,oShippedDate,oShipVia, oOrderStatus);
		
			theOrders.add(theOrder);
		

		}
		
		//close JDBC object
			
			return theOrders;
		}
		finally {
			close(myConn,myStmt,myRs);
		}
		
	}

	public void editOrder(Order theOrder)throws Exception {
		Connection myConn=null;
		PreparedStatement myStmt =null;
		
		try {
			//get connection to database
			myConn=dataSource.getConnection();
			
			//create sql update statement
			String sql="update orders set "
						+" shippedDate=?, orderStatus=? "
						+"where id=?";
			
			//create prepared statment
			myStmt=myConn.prepareStatement(sql);
			
			//set params

			//myStmt.setDate(1, new java.sql.Date(theOrder.getOrderDate().getTime()));

			//myStmt.setDate(2, new java.sql.Date(theOrder.getRequiredDate().getTime()));
			myStmt.setDate(1, new java.sql.Date(theOrder.getShippedDate().getTime()));
			//myStmt.setString(4, theOrder.getShipVia());
			myStmt.setString(2, theOrder.getOrderStatus());
			myStmt.setInt(3, theOrder.getId());

			
			System.out.println("Edit Order Statement In dB");
			myStmt.execute();	
			
		}
		finally {
			//clean up JDBC Object
			close(myConn,myStmt, null);
			
		}
		
		
	}
	

}
