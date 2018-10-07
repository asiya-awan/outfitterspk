package com.outfitterspk.admin.servlets;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import com.outfitterspk.jdbc.CustomerDBUtil;
import com.outfitterspk.jdbc.LoginService;
import com.outfitterspk.jdbc.OrderDBUtil;
import com.outfitterspk.models.Order;
import com.outfitterspk.models.Product;

/**
 * Servlet implementation class OrderAdminControllerServlet
 */
@WebServlet("/OrderAdminControllerServlet")
public class OrderAdminControllerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	
	private OrderDBUtil orderDbUtil;
	
    public OrderAdminControllerServlet() {
        super();
      
    }
    @Resource(name="jdbc/store")
	private DataSource dataSource;
	
	
    @Override
	public void init() throws ServletException {
		super.init();
		
		//create our product db util....and pass in connection pool/data source
		try {
			
			orderDbUtil=new OrderDBUtil(dataSource);
		}
		catch(Exception exc) {
			throw new ServletException(exc);
		}
		
	}
	
	
protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			
			//read the command
			String theCommand=request.getParameter("command");
			
			//if the command is missing, then default to listing
			if(theCommand == null) {
				theCommand = "LIST";
			}
			//route to appropriate method
			switch(theCommand) {
			
			case "LIST":
				listOrders(request, response);
				break;
			
			
			
				
			case "LOAD":
				loadOrder(request, response);
				break;
			
			case "LOADORDERDETAILS":
				//loadOrderDetails(request,response);
				break;
			
			case "EDIT":
				editOrder(request, response);
				break;
			case "DELETE":
				//deleteOrder(request, response);
				//deleteOrderDetails
				break;
			default:
				listOrders(request, response);
			}	
			
		}
		catch(Exception exc) {
			throw new ServletException(exc);
		}
		
		
	}


private void loadOrder(HttpServletRequest request, HttpServletResponse response) throws Exception{
	//read product id from Form data
		int theOrderId=Integer.parseInt(request.getParameter("orderId"));
		
	//get product from database (db util)
		Order theOrder = orderDbUtil.getOrderById(theOrderId);
		
	//place product in the request attribute
		request.setAttribute("THE_ORDER", theOrder);
		
	
	//send to the JSP page: edit-product-form.jsp
		RequestDispatcher dispatcher= request.getRequestDispatcher("/edit-order-form.jsp");
		dispatcher.forward(request, response);
		
}

	
private void editOrder(HttpServletRequest request, HttpServletResponse response) throws Exception {
	
//	//read product info from form data
	int oId = Integer.parseInt(request.getParameter("orderId"));
	int cId = Integer.parseInt(request.getParameter("customerId"));
	
//	
//	String orderDateString = request.getParameter("orderDate");
//	java.text.DateFormat df = new java.text.SimpleDateFormat("MM/dd/yyyy");
//	java.util.Date oOrderDate = df.parse(orderDateString);
//	
//	String requiredDateString = request.getParameter("requiredDate");
//	java.text.DateFormat df1 = new java.text.SimpleDateFormat("MM/dd/yyyy");
//	java.util.Date oRequiredDate = df.parse(requiredDateString);
	
	String shippedDateString = request.getParameter("requiredDate");
	java.text.DateFormat df2 = new java.text.SimpleDateFormat("yyyy-MM-dd");
	java.util.Date oShippedDate = df2.parse(shippedDateString);
	
	//Date oOrderDate = new SimpleDateFormat("yyyy-dd-MM").parse(request.getParameter("orderDate"));
	//Date oRequiredDate = new SimpleDateFormat("yyyy-dd-MM").parse(request.getParameter("requiredDate"));
	//Date oShippedDate = new SimpleDateFormat("yyyy-dd-MM").parse(request.getParameter("shippedDate"));
	String oShipVia=request.getParameter("shipVia");
	String oOrderStatus=request.getParameter("orderStatus");
	
	
	Order theOrder=new Order(oId,oShippedDate,oOrderStatus);
	
	System.out.println("Order going to edit: "+theOrder);
	
	orderDbUtil.editOrder(theOrder);
	
	//send back to list order page
	listOrders(request, response);
	
}


	private void listOrders(HttpServletRequest request, HttpServletResponse response) 
			throws Exception{
		//get products from db util
		
		List<Order> orders= orderDbUtil.getAllOrders();
		
		//add products to the request
		request.setAttribute("ORDERS_ALL", orders);
		
		//send to JSP page(view)
		RequestDispatcher dispatcher= request.getRequestDispatcher("orders-list-admin.jsp");
		
		dispatcher.forward(request,response);
	}

}
