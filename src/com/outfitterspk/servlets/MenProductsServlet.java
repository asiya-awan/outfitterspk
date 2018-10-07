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

import com.outfitterspk.jdbc.MenProductDBUtil;
import com.outfitterspk.models.Product;
import com.outfitterspk.models.ProductVariant;


@WebServlet("/MenProductsServlet")
public class MenProductsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private MenProductDBUtil menProductDBUtil;

	@Resource(name="jdbc/store")
	private DataSource dataSource;
	
	
    @Override
	public void init() throws ServletException {
		super.init();
		
		//create our product db util....and pass in connection pool/data source
		try {
			menProductDBUtil=new MenProductDBUtil(dataSource);
		}
		catch(Exception exc) {
			throw new ServletException(exc);
		}
		
	}

	
    public MenProductsServlet() {
        super();
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
				//loadProduct(request, response);
				listProducts(request, response);
				break;
			
				
			case "LOAD":
				loadProduct(request, response);
				break;
				
			default:
				listProducts(request, response);
				break;
						
			}
			
		}
		catch(Exception exc) {
			throw new ServletException(exc);
		}
		
	
	}
    
    private void listProducts(HttpServletRequest request, HttpServletResponse response) 
			throws Exception{
		//get products from db util
		
		List<Product> products= menProductDBUtil.getMenProducts();
		
		//add products to the request
		request.setAttribute("MEN_PRODUCTS_ALL", products);
		
		//send to JSP page(view)
		RequestDispatcher dispatcher= request.getRequestDispatcher("view-men.jsp");
		
		dispatcher.forward(request,response);
	}

    private void loadProduct(HttpServletRequest request, HttpServletResponse response) throws Exception{
		//read product id from Form data
			int theProductId=Integer.parseInt(request.getParameter("productId"));
			
		//get product from database (db util)
			Product theProduct = menProductDBUtil.getMenProduct(theProductId);
			
		//get product from database (db util)
			List<ProductVariant> theProductVariant = menProductDBUtil.getMenProductVariant(theProductId);
			
		
			//retrieve variant sizes and colors in String
		
			List<String> theProductSizes=new ArrayList<String>();
			List<String> theProductColors=new ArrayList<String>();
			
	
		for(ProductVariant v: theProductVariant){
			
			if(!(theProductSizes.contains(v.getSize()))) {
				theProductSizes.add(v.getSize());
			}
			
			if(!(theProductColors.contains(v.getColor()))) {
				theProductColors.add(v.getColor());
			}
		}
		
		System.out.println("Product Sizes:  "+theProductSizes);
		System.out.println("Product Colors:  "+theProductColors);
		
		//place product in the request attribute
			request.setAttribute("THE_PRODUCT", theProduct);
			
			request.setAttribute("THE_PRODUCT_SIZES", theProductSizes);
			
			request.setAttribute("THE_PRODUCT_COLORS", theProductColors);
			
		//send to the JSP page: edit-product-form.jsp
			RequestDispatcher dispatcher= request.getRequestDispatcher("/single-product-page.jsp");
			dispatcher.forward(request, response);		
			
	}

}
