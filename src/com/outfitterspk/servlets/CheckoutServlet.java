package com.outfitterspk.servlets;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import com.outfitterspk.jdbc.ProductDBUtil;
import com.outfitterspk.models.Customer;
import com.outfitterspk.models.ProductCartItems;


@WebServlet("/CheckoutServlet")
public class CheckoutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public CheckoutServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    
    private ProductDBUtil productDBUtil;
	int cartItemId=0;
	
	static Customer theCustomer=null;
	

	@Resource(name="jdbc/store")
	private DataSource dataSource;
	
	
    @Override
	public void init() throws ServletException {
		super.init();
		
		//create our product db util....and pass in connection pool/data source
		try {
			productDBUtil=new ProductDBUtil(dataSource);
		}
		catch(Exception exc) {
			throw new ServletException(exc);
		}
		
	}
    

	public static Customer getCustomer(){
		
		return theCustomer;
	}
    
    
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
try {
			
			//read the command
			String theCommand=request.getParameter("command");
			
			//if the command is missing, then default to listing
			if(theCommand == null) {
				theCommand = "SHOW";
			}
			//route to appropriate method
			switch(theCommand) {
			
			case "SHOW":
				showCustomer(request, response);
				break;
				
			case "UPDATE":
				System.out.println("Before calling update customer method");
				editCustomer(request, response);
				System.out.println("After calling udate customer method");
				break;
			
				
			default:
				showCustomer(request, response);
			}	
			
		}
		catch(Exception exc) {
			throw new ServletException(exc);
		}	
	}

	
	private void showCustomer(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//send to JSP page(view)
			RequestDispatcher dispatcher= request.getRequestDispatcher("customerInfo.jsp");
		
			dispatcher.forward(request,response);
		
	}


	
private void editCustomer(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		//read product info from form data
		int theCustomerId=Integer.parseInt(request.getParameter("customerId"));
		String firstName=request.getParameter("firstName");
		String lastName=request.getParameter("lastName");
		String email=request.getParameter("email");
		//String cpassword=request.getParameter("cpassword");
		String city=request.getParameter("city");
		String region=request.getParameter("region");
		String country=request.getParameter("country");
		String postalCode=request.getParameter("postalCode");
		String phone=request.getParameter("phone");
		
		
		
					
		//send back to main page (the product list)
			
		//send to JSP page(view)
				RequestDispatcher dispatcher= request.getRequestDispatcher("customerInfo.jsp");
			
				dispatcher.forward(request,response);
			
	}



protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	// TODO Auto-generated method stub
	doGet(request, response);
}

}
