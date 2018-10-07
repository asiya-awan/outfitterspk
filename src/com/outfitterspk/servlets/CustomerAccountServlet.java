package com.outfitterspk.servlets;

import java.io.IOException;
import java.time.LocalDate;
import java.time.temporal.ChronoUnit;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import com.outfitterspk.jdbc.LoginService;
import com.outfitterspk.jdbc.OrderDBUtil;
import com.outfitterspk.jdbc.ProductDBUtil;
import com.outfitterspk.models.BillingAddress;
import com.outfitterspk.models.Customer;
import com.outfitterspk.models.Order;
import com.outfitterspk.models.OrderDetails;
import com.outfitterspk.models.OrderSummary;
import com.outfitterspk.models.Product;
import com.outfitterspk.models.ProductCartItems;


@WebServlet("/CustomerAccountServlet")
public class CustomerAccountServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private CustomerDBUtil customerDBUtil;
	//private static HttpSession  session ;
	
	private static Customer theUser;
	
	private LoginService loginService;
	
	private OrderDBUtil orderDbUtil;
	
	public static String loginEmail;

	@Resource(name="jdbc/store")
	private DataSource dataSource;
	
	
    @Override
	public void init() throws ServletException {
		super.init();
		
		//create our product db util....and pass in connection pool/data source
		try {
			customerDBUtil=new CustomerDBUtil(dataSource);
			loginService = new LoginService(dataSource);
			orderDbUtil=new OrderDBUtil(dataSource);
		}
		catch(Exception exc) {
			throw new ServletException(exc);
		}
		
	}
    public CustomerAccountServlet() {
     
        
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
			
		
			case "ADD_CUSTOMER":
				addCustomer(request, response);
				break;
			
			case "ADD_USER":
				addUser(request, response);
				break;
				
			case "ADD_ADDRESS":      //ADD  Edit > update
				addCustomerAddress(request,response);
				break;
				
			case "LOAD_ACCOUNT":
				loadCustomerAccount(request, response);
				break;
				
			case "LOAD_INFO":
				loadCustomer(request,response);
				break;
				
			case "LOAD_PAYMENT":
				loadCustomerOnPaymentPage(request,response);
				break;
				
			case "ADD_ORDER":          //User
				//editCustomer(request, response);
				break;
				
			case "ADD_ORDER_DETAILS":          //User
				//(request, response);
				break;
				
			case "ADD_BILLING_ADDRESS":
				//addBillingAddress(request,response);
				break;
			
			case "COMPLETE_ORDER":
				completeOrder(request,response);
				break;
				
			case "VIEW_CUSTOMER_ORDERS":
				viewCustomerOrders(request,response);
				break;

			default:
				loadCustomer(request, response);
			}	
			
			//LOAD_INFO_EDIT     //paymentMethod.jsp   Change button 
			
		}
		catch(Exception exc) {
			throw new ServletException(exc);
		}

	}
	
	
	

	private void completeOrder(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		int oID=0;
		int oDetailsID=0;
		int customer_Id=0;
		int bID=0;
		Order order;
		Customer userCustomer;
	
		
		List<ProductCartItems> items=CartServlet.getCartItems();
		
		
		
		if(items==null) {
			request.setAttribute("errorMessage", "Cart is empty! Please add items in your cart .... ");
			
			//send to JSP page(view)
			RequestDispatcher dispatcher= request.getRequestDispatcher("orderSummary.jsp");
			
			dispatcher.forward(request,response);
		}
		//System.out.println("TheUserEmail from completeOrder method : " +theUser.getEmail());
		
		if(request.getParameter("billingAddress")==null) {
			request.setAttribute("errorMessage", " Inaccessible Page .... ");
			//send to JSP page(view)
			RequestDispatcher dispatcher= request.getRequestDispatcher("orderSummary.jsp");
			
			dispatcher.forward(request,response);
		}
		
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
			int customerId=Integer.parseInt(request.getParameter("customer_id"));
			
				if(IsSameAsShippingAddress==true) {
					//do nothing as it  is default to true
					customer_Id=customerId;
				}
				else {
					
				
				//update billing flag	
				customerDBUtil.updateCustomerBillingAddFlag(IsSameAsShippingAddress, theEmail);
	
				//get customer from database (db util)
				Customer theCustomer = customerDBUtil.getCustomer(theEmail);
				
				customer_Id=theCustomer.getId();
				
				//add customer billing address
				BillingAddress billingAddress=new BillingAddress(bFirstName, bLastName, bAddress,bCity, bRegion, bCountry, bPostalCode, bPhone, customer_Id);
				
				bID=customerDBUtil.addBillingAddress(billingAddress);
			
				System.out.println("Billing Address ID: "+bID);
				
				
					
				}
		}
		
		else if(theUser.getEmail()!=null || customer_Id==0){
			theEmail=theUser.getEmail();
			
			
			session.setAttribute("NewUserEmail",theEmail);
			
			System.out.println("NEW USER EMAIL FROM Session ON COMPLETE ORDER before adding user in DB"+session.getAttribute("NewUserEmail"));
			
			//update current user 
			//theUser.setUseSameBillingAddress(IsSameAsShippingAddress);
			
			
			//add the user to the database when user completes an order
			customerDBUtil.addUser(theUser);
			
			System.out.println("theUser locally :"+theUser.toString());
			
			userCustomer=customerDBUtil.getCustomer(theUser.getEmail());
			
			//place user in the request attribute
			request.setAttribute("THE_CUSTOMER", userCustomer);
			
			//System.out.println("theUser from DB before adding billing info :"+userCustomer.toString());
			
			//customer_Id=userCustomer.getId();
			
			//billing address
				if(theEmail!=null && IsSameAsShippingAddress==true) {
					//do nothing as it  is default to true
					customer_Id=userCustomer.getId();
				}
				else {
					
					//update customer flag for SameAddressAsShippingAddress
					customerDBUtil.updateCustomerBillingAddFlag(IsSameAsShippingAddress,theEmail);
					
					
					//get customer from database (db util)
					userCustomer=customerDBUtil.getCustomer(theUser.getEmail());
					customer_Id=userCustomer.getId();
					System.out.println("theUser from DB after udating billing flag:"+userCustomer.toString());
					
					//add customer billing address
					BillingAddress billingAddress=new BillingAddress(bFirstName, bLastName, bAddress,bCity, bRegion, bCountry, bPostalCode, bPhone, customer_Id);
					
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
				
				//update billing address table to add order_Id after creation of Order and Order Details
				
//			if(bID!=0) {
//				
//				order=new Order(customer_Id,orderDate,requiredDate,shippedDate,shipVia,bID,orderStatus);
//			}
			
				order=new Order(customer_Id,orderDate,requiredDate,shippedDate,shipVia,orderStatus);
			
				System.out.println("ORDER  "+order.toString());
				
				//2b: add order in DB
				oID=orderDbUtil.addOrder(order);
				
				System.out.println("OrederID Created: "+oID);
				
				System.out.println("ORDER  "+order.toString());
				
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
					
					
					oDetailsID=orderDbUtil.addOrderDetails(orderDetails);
					System.out.println("OrederDetailsID Created: "+oDetailsID);
				}
				
				//add Order_ID in billingAddress table
				
				//update BillingAddress table in db to add orderID relationship set null as default
				//update Order table to remvoe billingId relationship
				
				if(bID!=0) {
				orderDbUtil.addOrderIdInBillingAddress(orderId,bID);
				
				}
				
				
				viewCustomerLastOrder(request,response);
		
		}
		
	private void viewCustomerLastOrder(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String theEmail;
		

		int customerId=0;
		System.out.println("HELLO VIEW CUSTOMER");
		
		//System.out.println(session.getAttribute("NewUserEmail"));
		
		//get the existing session
		HttpSession	session = request.getSession(false);
		
		//System.out.println(session.getAttribute("NewUserEmail"));
		System.out.println("New User Email from session on ViewCustomerLast Order: "+session.getAttribute("NewUserEmail"));
		
		if(session.getAttribute("email")!=null) {
		
			theEmail=(String) session.getAttribute("email");
			
			Customer theCustomer=customerDBUtil.getCustomer(theEmail);
			customerId=theCustomer.getId();
			request.setAttribute("THE_CUSTOMER", theCustomer);

			System.out.println(session.getAttribute("NewUserEmail"));
		}else if(session.getAttribute("NewUserEmail")!=null) {
			theEmail=(String) session.getAttribute("NewUserEmail");
			System.out.println("New User Email from session on ViewCustomerLast Order: "+theEmail);
			
			Customer theUser=customerDBUtil.getCustomer(theEmail);
			customerId=theUser.getId();
			request.setAttribute("THE_CUSTOMER", theUser);
		}
		
		else {
			
			request.setAttribute("errorMessage", "No User logged in! Please login .... ");
		}
		//get order from db util
		
		
		
		int orderId=orderDbUtil.getLastOrderIdOfCustomer(customerId);
	
		
		
		System.out.println("ORDER ID from getLastOrderIdOfCustomer : "+orderId);
		
		Order order=orderDbUtil.getOrderById(orderId);
		
		System.out.println("Order from ViewCustomerLastOrder : " +order.toString());
		
		/*request.setAttribute("THE_ORDER", order);
	
		List<OrderDetails> orderDetails=orderDbUtil.getOrderDetails(orderId);
		
		//add products to the request
		request.setAttribute("ORDER_DETAILS", orderDetails);*/
		
		List<OrderSummary> orderSummary = orderDbUtil.getOrderSummary(orderId);
		if(orderSummary==null) {
			request.setAttribute("errorMessage", "You have no orders .... ");
		}
		else {
		
		System.out.println("OrderSummary from ViewCustomerLastOrder : " +orderSummary.toString());
		
		request.setAttribute("ORDER_ID", orderId);
		
		request.setAttribute("ORDER_ITEMS", orderSummary);
		
		
		}
		
		BillingAddress billingAddress=orderDbUtil.getBillingAddress(orderId);
		
		request.setAttribute("BILLING_ADDRESS",billingAddress);
		//send to JSP page(view)
		RequestDispatcher dispatcher= request.getRequestDispatcher("orderSummary.jsp");
		
		dispatcher.forward(request,response);
	}
	

	private void loadCustomerOnPaymentPage(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		//get the existing session
		HttpSession	session = request.getSession(false);
		
		if(session.getAttribute("email")!=null) {
		
			String theEmail=(String) session.getAttribute("email");
				
			//get customer from database (db util)
				Customer theCustomer = customerDBUtil.getCustomer(theEmail);
				
				System.out.println("THE CUSTOMER on loadCustomerOnPaymentPage: "+theCustomer.toString());
				
			//place customer in the request attribute
				request.setAttribute("THE_CUSTOMER", theCustomer);

			
		}
		else if(theUser!=null) {
			//place new user in the request attribute
			request.setAttribute("THE_CUSTOMER", theUser);
			System.out.println("THE USER on loadCustomerOnPaymentPage: "+theUser.toString());
			
		}
	
		else {
			request.setAttribute("errorMessage", "No User logged in! Please login .... ");
		}
		
		//send to the JSP page: edit-product-form.jsp
		RequestDispatcher dispatcher= request.getRequestDispatcher("paymentMethod.jsp");
		dispatcher.forward(request, response);
		
	}
	
private void viewCustomerOrders(HttpServletRequest request, HttpServletResponse response) throws Exception{
	String theEmail;
	int customerId=0;
	System.out.println("HELLO VIEW CUSTOMER ORDERS");
	
	//System.out.println(session.getAttribute("NewUserEmail"));
	
	//get the existing session
	HttpSession	session = request.getSession(false);
	
	
	if(session.getAttribute("email")!=null) {
	
		theEmail=(String) session.getAttribute("email");
		
		Customer theCustomer=customerDBUtil.getCustomer(theEmail);
		customerId=theCustomer.getId();
		request.setAttribute("THE_CUSTOMER", theCustomer);

	}
	
	else {
		
		request.setAttribute("errorMessage", "No User logged in! Please login .... ");
	}
	//get order from db util
	
	
	List<Order> customerOrders=orderDbUtil.getOrdersbyCustomerId(customerId);
	//System.out.println(customerOrders.toString());
	List<Integer> customerOrderIds=new ArrayList<Integer>();
	
	Map<Integer, List<OrderSummary>> maps= new HashMap<>();
	
	for(Order cOrder:customerOrders) {
		int orderId=cOrder.getId();
		customerOrderIds.add(orderId);
		
		request.setAttribute("ORDER_IDS", customerOrderIds);
		
		//Order order=orderDbUtil.getOrderById(orderId);
		List<OrderSummary> orderSummary = orderDbUtil.getOrderSummary(orderId);
		
	    maps.put(orderId, orderSummary);
	
	}
	
	request.setAttribute("ORDER_MAPS", maps);
System.out.print(" ++++++++++++++++++++++++++++++++++ MAPS +++++++++++++++++++++++++++++++++++++++++++++++ ");
List<OrderSummary> summary;
	for(Integer n:customerOrderIds) {
		//System.out.println(maps.get(n));
				
		
		summary=(List<OrderSummary>)maps.get(n);
		
		System.out.println("Summary Casted: "+summary.toString());
		for(OrderSummary os:summary) {
			System.out.println("Product: "+os.getProduct()+" Price: "+os.getPrice());
		}
	}

	//System.out.println("OrderSummary from ViewCustomerLastOrder : " +orderSummary.toString());
	
	//request.setAttribute("ORDER_ID", orderId);
	
	//request.setAttribute("ORDER_ITEMS", orderSummary);

	
	
	//send to JSP page(view)
	RequestDispatcher dispatcher= request.getRequestDispatcher("customerOrders.jsp");
	
	dispatcher.forward(request,response);
		
	}
	
	private void addUser(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		HttpSession session = request.getSession(false);
		String sessionEmail=(String)session.getAttribute("email");
		
		
		String cFirstName=request.getParameter("firstName");
		String cLastName=request.getParameter("lastName");
		String cEmail=request.getParameter("email");
		
		String cAddress=request.getParameter("address");
		String cCity=request.getParameter("city");
		String cRegion=request.getParameter("region");
		String cCountry=request.getParameter("country");
		String cPostalCode=request.getParameter("postalCode");
		String cPhone=request.getParameter("phone");
		boolean cUseAddressAsBillingAddress=true;
		boolean cIsCustomer=false;
		
		if(sessionEmail==null && cEmail !=null) {
		
			theUser=new Customer(cFirstName,cLastName,cEmail,cAddress, cCity, cRegion, cCountry, cPostalCode,cPhone, cUseAddressAsBillingAddress,cIsCustomer);
			
			//add the user to the database when user completes an order
			//customerDBUtil.addUser(theCustomer);
			
			//place user in the request attribute
			request.setAttribute("THE_CUSTOMER", theUser);
			
			//send to the JSP page:
			RequestDispatcher dispatcher= request.getRequestDispatcher("/shippingMethod.jsp");
			dispatcher.forward(request, response);

		}
		
		else if(sessionEmail == null && cEmail == null) {
			
			request.setAttribute("errorMessage", "No User logged in! Please login .... ");
		}
		
		else {
			/*if(sessionEmail!=null)  */

			 Customer theCustomer=new Customer(cFirstName,cLastName,cEmail,cAddress, cCity, cRegion, cCountry, cPostalCode,cPhone, cUseAddressAsBillingAddress,cIsCustomer);

		
			//get info of logged in user from database (db util)
				customerDBUtil.updateCustomer(theCustomer);
				
				System.out.println("UPDATE CUSTOMER: "+theCustomer.toString());
				
			//place customer in the request attribute
				request.setAttribute("THE_CUSTOMER", theCustomer);

			
		}

		//send to the JSP page:
		RequestDispatcher dispatcher= request.getRequestDispatcher("/shippingMethod.jsp");
		dispatcher.forward(request, response); 
	
	}
	
	

	private void loadCustomer(HttpServletRequest request, HttpServletResponse response) throws Exception {
			
	
			//get the existing session
			HttpSession	session = request.getSession(false);
			
			if(session.getAttribute("email")!=null) {
			
				String theEmail=(String) session.getAttribute("email");
					
				//get customer from database (db util)
					Customer theCustomer = customerDBUtil.getCustomer(theEmail);
					
					System.out.println(theCustomer.toString());
					
				//place customer in the request attribute
					request.setAttribute("THE_CUSTOMER", theCustomer);

				
			}
			else if(theUser!=null) {
				//place new user in the request attribute
				request.setAttribute("THE_CUSTOMER", theUser);
				
			}
			
			else {
				request.setAttribute("errorMessage", "No User logged in! Please login .... ");
			}
			
			//send to the JSP page: edit-product-form.jsp
			RequestDispatcher dispatcher= request.getRequestDispatcher("customerInfo.jsp");
			dispatcher.forward(request, response);
		
	}

	
	private void addCustomerAddress(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		HttpSession session = request.getSession(false);
		String cEmail=(String)session.getAttribute("email");
		String cAddress=request.getParameter("address");
		String cCity=request.getParameter("city");
		String cRegion=request.getParameter("region");
		String cCountry=request.getParameter("country");
		String cPostalCode=request.getParameter("postalCode");
		String cPhone=request.getParameter("phone");
		boolean cUseAddressAsBillingAddress=true;
		boolean cIsCustomer=true;
		
		if(cEmail!=null) {
		//create a new customer object
				Customer theCustomer=new Customer(cEmail,cAddress,cCity, cRegion,cCountry,cPostalCode,cPhone,cUseAddressAsBillingAddress,cIsCustomer);
				
				//add the customer address to the database
				customerDBUtil.addCustomerAddress(theCustomer);
				
				//get product from database (db util)
				Customer theCustomerGet = customerDBUtil.getCustomer(cEmail);
				
				//place customer in the request attribute
				request.setAttribute("THE_CUSTOMER", theCustomerGet);
				
			
		}
		else {

			request.setAttribute("errorMessage", "No User logged in! Please login .... ");
			
		}
		

		//send to the JSP page: edit-product-form.jsp
			RequestDispatcher dispatcher= request.getRequestDispatcher("/customerAccount.jsp");
			dispatcher.forward(request, response);
		
	}
	
	
	private void addCustomer(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String cFirstName=request.getParameter("firstName");
		String cLastName=request.getParameter("lastName");
		String cEmail=request.getParameter("email");
		String cPassword=request.getParameter("password");
		boolean cIsCustomer=true;
		
		if(cEmail!=null) {
	
		Customer theCustomer=new Customer(cFirstName,cLastName,cEmail,cPassword,cIsCustomer);
		
		//add the customer to the database
		customerDBUtil.addCustomer(theCustomer);
		
		
		loginCustomer(request,response);
		}
		
		else {
			//request.setAttribute("errorMessage", "No User logged in! Please login or register .... ");
			response.sendRedirect("loginCustomer.jsp");
			
		}
	}
	
	private void loginCustomer(HttpServletRequest request, HttpServletResponse response) throws Exception{
		String email=request.getParameter("email");
		String password=request.getParameter("password");
		
		System.out.println("LOGIN NEW CUSTOMER");
		System.out.println(email);
		System.out.println(password);
		
		if(loginService.login(email, password)) {
			loginEmail= email;
            
			System.out.println("LOGIN NEW CUSTOMER after loginService");
			System.out.println(email);
			System.out.println(password);
			
			//get the old session and invalidate
			HttpSession  oldSession = request.getSession(false);
            if (oldSession != null) {
            	System.out.println("OLD Session Data going to be removed");
                oldSession.invalidate();
            }
            //generate a new session
            HttpSession newSession = request.getSession(true);

            //setting session to expiry in 5 mins
            newSession.setMaxInactiveInterval(5*60);
            newSession.setAttribute("email",email);
            
            
            loadCustomerAccount(request, response);
            
            //response.sendRedirect("CustomerAccountServlet");
			}
		
	}
	
	private void loadCustomerAccount(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("ASIA");
		//get the existing session
	HttpSession	session = request.getSession(false);
		
		if(session.getAttribute("email")!=null) {
		
			String theEmail=(String) session.getAttribute("email");
				
			//get customer from database (db util)
				Customer theCustomer = customerDBUtil.getCustomer(theEmail);
				
				System.out.println("LOAD _INFO" + theCustomer);
				
			//place customer in the request attribute
				request.setAttribute("THE_CUSTOMER", theCustomer);
				
			
			//send to the JSP page: edit-product-form.jsp
				RequestDispatcher dispatcher= request.getRequestDispatcher("/customerAccount.jsp");
				dispatcher.forward(request, response);
		}else {
			request.setAttribute("errorMessage", "No User logged in! Please login .... ");
			RequestDispatcher dispatcher= request.getRequestDispatcher("/customerAccount.jsp");
			dispatcher.forward(request, response);
		}
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
