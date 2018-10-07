package com.outfitterspk.servlets;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

import com.outfitterspk.jdbc.CustomerDBUtil;

import com.outfitterspk.jdbc.OrderDBUtil;
import com.outfitterspk.models.BillingAddress;
import com.outfitterspk.models.Customer;
import com.outfitterspk.models.Order;
import com.outfitterspk.models.OrderDetails;
import com.outfitterspk.models.OrderSummary;
import com.outfitterspk.models.Product;
import com.outfitterspk.models.ProductCartItems;


@WebServlet("/CompleteOrderServlet")
public class CompleteOrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	
	private CustomerDBUtil customerDBUtil;

	private OrderDBUtil orderDbUtil;
	//private static HttpSession  session ;
	
	private static Customer theUser;
	
	List<ProductCartItems> items=new ArrayList<ProductCartItems>();
	
	//public static String loginEmail;

	@Resource(name="jdbc/store")
	private DataSource dataSource;
	
	
    @Override
	public void init() throws ServletException {
		super.init();
		
		//create our product db util....and pass in connection pool/data source
		try {
			customerDBUtil=new CustomerDBUtil(dataSource);
			
			orderDbUtil=new OrderDBUtil(dataSource);
			items=CartServlet.getCartItems();
			
		}
		catch(Exception exc) {
			throw new ServletException(exc);
		}
		
	}
	
    public CompleteOrderServlet() {
       
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			
			//read the command
			String theCommand=request.getParameter("command");
			
			//if the command is missing, then default to listing
			if(theCommand == null) {
				theCommand = "LOAD";
			}
			//route to appropriate method
			switch(theCommand) {
			
		
			case "ADD_ORDER":
				addOrder(request, response);
				break;
				
			case "COMPLETE_ORDER":
				//completeOrder(request, response);
				break;
			
			case "VIEW_CUSTOMER_LAST_ORDER":
				viewCustomerLastOrder(request, response);
				break;
				
			case "VIEW_CUSTOMER_ORDERS":
				viewCustomerOrders(request, response);
				break;
				
			case "VIEW_ALL_ORDERS":
				viewAllOrders(request, response);
				break;
				
			case "EDIT_ORDER":
				break;


			default:
				//viewOrder(request, response);
			}	

		}
		catch(Exception exc) {
			throw new ServletException(exc);
		}

	}

	/*My ORDERS page */
	private void viewCustomerOrders(HttpServletRequest request, HttpServletResponse response) {
		
		
	}
	
	/* ADMIN Page */
	private void viewAllOrders(HttpServletRequest request, HttpServletResponse response) {
		
		
	}

	/* View Recent placed Order */
	private void viewCustomerLastOrder(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String theEmail=null;
		
		Customer theCustomer = null;
		//get the existing session
		HttpSession	session = request.getSession(false);
		
		if(session.getAttribute("email")!=null) {
		
			theEmail=(String) session.getAttribute("email");
			
			theCustomer=customerDBUtil.getCustomer(theEmail);
			request.setAttribute("THE_CUSTOMER", theCustomer);

		}else if(session.getAttribute("NewUserEmail")!=null) {
			theEmail=(String) session.getAttribute("NewUserEmail");
			System.out.println("New User Email from session: "+theEmail);
			
			theCustomer=customerDBUtil.getCustomer(theEmail);
			request.setAttribute("THE_CUSTOMER", theCustomer);
		}
		
		else {
			request.setAttribute("errorMessage", "No User logged in! Please login .... ");
		}
		//get order from db util
		
		int orderId=orderDbUtil.getLastOrderIdOfCustomer(theCustomer.getId());
		
		
		System.out.println("ORDER ID from getLastOrderIdOfCustomer : "+orderId);
		
		Order order=orderDbUtil.getOrderById(orderId);
		
		System.out.println("Order from ViewCustomerLastOrder : " +order.toString());
		
		/*request.setAttribute("THE_ORDER", order);
	
		List<OrderDetails> orderDetails=orderDbUtil.getOrderDetails(orderId);
		
		//add products to the request
		request.setAttribute("ORDER_DETAILS", orderDetails);*/
		
		List<OrderSummary> orderSummary = orderDbUtil.getOrderSummary(orderId);
		
		System.out.println("OrderSummary from ViewCustomerLastOrder : " +orderSummary.toString());
		
		request.setAttribute("ORDER_ID", orderId);
		
		request.setAttribute("ORDER_ITEMS", orderSummary);
		
		//send to JSP page(view)
		RequestDispatcher dispatcher= request.getRequestDispatcher("orderSummary.jsp");
		
		dispatcher.forward(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	
	private boolean IsUsingSameBillingAddress(HttpServletRequest request, HttpServletResponse response) throws Exception{
		
		int bIsSameAsShipping=Integer.parseInt(request.getParameter("billingAddress"));
		
		//cast to boolean
			boolean IsSameAsShippingAddress=true;
			
			if(bIsSameAsShipping==0) {
				IsSameAsShippingAddress=false;
			}else {
				IsSameAsShippingAddress=true;
			}
			
			System.out.println("SameAsBillingAddress Attribute: "+bIsSameAsShipping);
			return IsSameAsShippingAddress;
	}
	
	
	private void addOrder(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		int oID=0;
		int oDetailsID=0;
		int customer_Id=0;
		int bID=0;
		Order order;
	
		int customerId=Integer.parseInt(request.getParameter("customer_id"));
		List<ProductCartItems> items=CartServlet.getCartItems();
		
		System.out.println("TheUSerEmail : " +theUser.getEmail());
		
		System.out.println("============== Complete Order ====================");
		int bIsSameAsShipping=Integer.parseInt(request.getParameter("billingAddress"));
		
	//cast to boolean
		boolean IsSameAsShippingAddress=true;
		
		if(bIsSameAsShipping==0) {
			IsSameAsShippingAddress=false;
		}else {
			IsSameAsShippingAddress=true;
		}
		
		System.out.println("SameAsBillingAddress Attribute: "+bIsSameAsShipping);
		
		String theEmail;
		
		//get billing form parameters
		String bFirstName=request.getParameter("firstName");
		String bLastName=request.getParameter("lastName");
		String bAddress=request.getParameter("address");
		String bCity=request.getParameter("city");
		String bRegion=request.getParameter("region");
		String bCountry=request.getParameter("country");
		String bPostalCode=request.getParameter("postalCode");
		String bPhone=request.getParameter("phone");
		
		
		//get the existing session
		HttpSession	session = request.getSession(false);
		
		String sessionEmail=(String) session.getAttribute("email");
			
		
		if(session.getAttribute("email")!=null) {
			theEmail=sessionEmail;	
			
				if(IsSameAsShippingAddress==true) {
					//do nothing as it  is default to true
				}
				else {
					
				
				//update billing flag	
				customerDBUtil.updateCustomerBillingAddFlag(IsSameAsShippingAddress, theEmail);
	
				//get customer from database (db util)
				Customer theCustomer = customerDBUtil.getCustomer(theEmail);
				
				customer_Id=theCustomer.getId();
				
				//add customer billing address
				BillingAddress billingAddress=new BillingAddress(bFirstName, bLastName, bAddress,bCity, bRegion, bCountry, bPostalCode, bPhone, theCustomer.getId());
				
				bID=customerDBUtil.addBillingAddress(billingAddress);
			
				System.out.println("Billing Address ID: "+bID);
				
				
					
				}
		}
		
		else if(theUser.getEmail()!=null){
			theEmail=theUser.getEmail();
			
			
			session.setAttribute("NewUserEmail",theEmail);
			
			//update current user 
			//theUser.setUseSameBillingAddress(IsSameAsShippingAddress);
			
			
			//add the user to the database when user completes an order
			customerDBUtil.addUser(theUser);
			
			//place user in the request attribute
			request.setAttribute("THE_CUSTOMER", theUser);
			
			customer_Id=theUser.getId();
			
			//billing address
				if(theEmail!=null && IsSameAsShippingAddress==true) {
					//do nothing as it  is default to true
				}
				else {
					
					//update customer flag for SameAddressAsShippingAddress
					customerDBUtil.updateCustomerBillingAddFlag(IsSameAsShippingAddress,theEmail);
					
					
					//get customer from database (db util)
					Customer theCustomer = customerDBUtil.getCustomer(theEmail);
					
					//add customer billing address
					BillingAddress billingAddress=new BillingAddress(bFirstName, bLastName, bAddress,bCity, bRegion, bCountry, bPostalCode, bPhone, theCustomer.getId());
					
					bID=customerDBUtil.addBillingAddress(billingAddress);
				}
		}
		
		else {
			
			request.setAttribute("errorMessage", "No User logged in! Please login .... ");
		}
		
		
		System.out.println("Add  ORDER BILLING ID AFTER ADD: "+bID);
		
		//step 2: Create Order Constructor 
		/***************************************** O R D E R S *******************************************/	
			
				//2a: set Order parameters			
				Date orderDate=new Date();
 
		        Date requiredDate = new Date();
		        Calendar c = Calendar.getInstance(); 
		        c.setTime(requiredDate); 
		        c.add(Calendar.DATE, 7);
		        requiredDate = c.getTime();
		        
		        
		        Date shippedDate=null;
				
				String shipVia="Courier";
				String orderStatus="Building";
				
				//int billingId=bID;
				
			if(bID!=0) {
				
				order=new Order(customer_Id,orderDate,requiredDate,shippedDate,shipVia,bID,orderStatus);
			}
			else {
				order=new Order(customer_Id,orderDate,requiredDate,shippedDate,shipVia,orderStatus);
			}
				System.out.println("ORDER  "+order.toString());
				
				//2b: add order in DB
				oID=orderDbUtil.addOrder(order);
				
				System.out.println("OrederID Created: "+oID);
				
				//Step 3: create Order Details
				/***************************************** O R D E R   D E T A I L S *******************************************/
				//orderDetials variables
				int orderId = oID;
				int productId;
				int productVariantId;
				float price;
				int quantity;
				
				
				for(ProductCartItems item:items) {
					
					productId=item.getProductId();
					productVariantId=item.getProductVariantId();
					price=item.getPrice();
					quantity=item.getQuantity();
					
					OrderDetails orderDetails=new OrderDetails(orderId,productId,productVariantId, price, quantity);
					
					System.out.println("ORDER  "+order.toString());
					
					oDetailsID=orderDbUtil.addOrderDetails(orderDetails);
					System.out.println("OrederDetailsID Created: "+oDetailsID);
				}
				
				
				viewCustomerLastOrder(request,response);
		}
	
	
	private void getOrderSummary(HttpServletRequest request, HttpServletResponse response) throws Exception {
	
	}



}
