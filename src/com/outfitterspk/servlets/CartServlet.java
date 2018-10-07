package com.outfitterspk.servlets;

import java.io.IOException;
import java.io.PrintWriter;
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
import com.outfitterspk.models.Product;
import com.outfitterspk.models.ProductCartItems;


@WebServlet("/CartServlet")
public class CartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private ProductDBUtil productDBUtil;
	int cartItemId=0;
	
	static List<ProductCartItems> cartItems=new ArrayList<ProductCartItems>();
	

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
    

	public static List<ProductCartItems> getCartItems(){
		//cartItems2=cartItems;
		return cartItems;
	}
	
	public static float getSubTotal() {
	float subTotal=0;
		for(ProductCartItems cartItem:cartItems){
			subTotal+=cartItem.getPrice();
		}
		return subTotal;
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
				listCartItems(request, response);
				break;
			
			
			case "ADDTOCART":
				System.out.println("Before calling AddToCart method");
				addItemInCart(request, response);
				System.out.println("After calling AddToCart method");
				break;
		
			case "CLEARALL":
				clearCart(request, response);
				break;
				
			case "UPDATE":
				System.out.println("Before calling update cart method");
				editCart(request, response);
				System.out.println("After calling udate cart method");
				break;
				
			case "DELETE":
				deleteCartItem(request, response);
				break;
				
			
				
			default:
				listCartItems(request, response);
			}	
			
		}
		catch(Exception exc) {
			throw new ServletException(exc);
		}	
		
	}

	private void editCart(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		//read product info from form data
				int theCartItemId=Integer.parseInt(request.getParameter("cartItemId"));
				int quantity=Integer.parseInt(request.getParameter("quantity"));
				System.out.println(theCartItemId+" : "+"quantity: "+quantity);
				
				for(ProductCartItems items:cartItems) {
					if(items.getCartItemId()==theCartItemId) {
						items.setQuantity(quantity);
						
						items.setSubtotal(quantity*items.getPrice());
					}
				}
					
					//send back to main page (the product list)
			listCartItems(request,response);
			//System.out
	}

	private void clearCart(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		cartItems.clear();
		
		//send back to main page (the product list)
		listCartItems(request,response);
		
	}

	public static boolean isCartEmpty() {
		
		return cartItems.isEmpty();
			
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/plain");
		PrintWriter out=response.getWriter();
		String action=request.getParameter("action");
		if(action.equals("demo1")) {
			String fullname=request.getParameter("fullname");
			out.print("Hello "+fullname);
		}else if(action.equals("demo2")) {
			int number1=Integer.parseInt(request.getParameter("number1"));
			int number2=Integer.parseInt(request.getParameter("number2"));
			out.print("Result:"+(number1+number2));
		}
		
	}
	
	
	private void addItemInCart(HttpServletRequest request, HttpServletResponse response) throws Exception {
		//read product info from the form data
		
		cartItemId++;
		int productId=Integer.parseInt(request.getParameter("productId"));
		
		String productName=request.getParameter("productName");
		String picturesUrl=request.getParameter("picturesUrl");
		String size=request.getParameter("size");
		if(size==null||size=="") {
			size="-";
		}
		
		String color=request.getParameter("color");
		if(color==null||color=="") {
			color="-";
		}
		Float price=Float.parseFloat(request.getParameter("price"));
		int quantity=Integer.parseInt(request.getParameter("quantity"));
		float subtotal=(price*quantity);
		
		System.out.println(productName+ "  "+subtotal);
		int productVariantId=productDBUtil.getProductVariantId(productId,color,size);
		System.out.println("ProductVarinatId: "+productVariantId);
		
		//create a new product object
		ProductCartItems theCartItem=new ProductCartItems(cartItemId, productId,productVariantId,productName,picturesUrl,size,color,price,quantity,subtotal);
		
		cartItems.add(theCartItem);
		
		System.out.println("Cart Items");
		for(ProductCartItems item:cartItems) {
			System.out.println(item);
		}
		
		request.setAttribute("CARTS_ALL", cartItems);
		
		
		//send back to main page (the product list)
		listCartItems(request,response);
		
	}

	private void listCartItems(HttpServletRequest request, HttpServletResponse response) 
			throws Exception{
	
		//List<ProductCartItems> cartItems=(List<ProductCartItems>)request.getAttribute("CARTS_ALL");
		
		request.setAttribute("CARTS_ALL", cartItems);
		System.out.println("Cart size: "+cartItems.size());
		
		if(cartItems.size()==0) {
			request.setAttribute("CARTMSG","your cart is empty!");
		}
		else {
			
			request.getAttribute("CARTS_ALL");
			float grandTotal=0;
			for(ProductCartItems item:cartItems) {
				grandTotal+=item.getSubtotal();
			}
			
			request.setAttribute("GRAND_TOTAL", grandTotal);
		}
		//send to JSP page(view)
		RequestDispatcher dispatcher= request.getRequestDispatcher("cart.jsp");
	
		dispatcher.forward(request,response);
		
		
	}
	
	
	private void deleteCartItem(HttpServletRequest request, HttpServletResponse response) throws Exception {
		//read product id from form data (list)
		int theCartItemId=Integer.parseInt(request.getParameter("cartItemId"));
		
		//remove product from cart
		if(cartItems.size()!=0) {

			cartItems.removeIf((ProductCartItems items) -> items.getCartItemId() == theCartItemId);
		
		}
		
		System.out.println("After removing cart item: "+(theCartItemId));
		for(ProductCartItems cart: cartItems) {
			System.out.println(cart);
		}
		
		
		//send them back to "list products" page
		listCartItems(request,response);
	
	}

}
