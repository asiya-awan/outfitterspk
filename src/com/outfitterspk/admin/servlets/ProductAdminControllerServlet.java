package com.outfitterspk.admin.servlets;

import java.io.IOException;
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

/**
 * Servlet implementation class ProductAdminControllerServlet
 */
@WebServlet("/ProductAdminControllerServlet")
public class ProductAdminControllerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    private ProductDBUtil productDBUtil;

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

	public ProductAdminControllerServlet() {
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
				listProducts(request, response);
				break;
			
			
			case "ADD":
				addProduct(request, response);
				break;
				
			case "LOAD":
				loadProduct(request, response);
				break;
				
			case "EDIT":
				editProduct(request, response);
				break;
			case "DELETE":
				deleteProduct(request, response);
				break;
			default:
				listProducts(request, response);
			}	
			
		}
		catch(Exception exc) {
			throw new ServletException(exc);
		}
		
		
	}

	
	private void deleteProduct(HttpServletRequest request, HttpServletResponse response) throws Exception {
		//read product id from form data (list)
		String theProductId=request.getParameter("productId");
		
		//delete product from database
		productDBUtil.deleteProduct(theProductId);
		
		//send them back to "list products" page
		listProducts(request,response);
	}

	private void editProduct(HttpServletRequest request, HttpServletResponse response) throws Exception {
		//read product info from form data
		int id = Integer.parseInt(request.getParameter("productId"));
		String pName=request.getParameter("pName");
		String pDescription=request.getParameter("pDescription");
		String pSpecs=request.getParameter("pSpecs");
		String pCategory=request.getParameter("pCategory");
		String pSubcategory=request.getParameter("pSubcategory");
		int pSKU=Integer.parseInt(request.getParameter("pSKU"));
		String pPicturesUrl=request.getParameter("pPicturesUrl");
		float pPrice=Float.parseFloat(request.getParameter("pPrice"));
		
		int categoryId = 0, subCategoryId=0;
		switch(pCategory) {
		case "Men":
			categoryId=1;
			break;
		case "Women":
			categoryId=2;
			break;
			
		case "Junior":
			categoryId=3;
			break;
			
		}
		
		switch(pSubcategory) {
		case "Shirts":
			subCategoryId=1;
			break;
		case "T-Shirts":
			subCategoryId=2;
			break;
		case "Denim":
			subCategoryId=3;
			break;
		case "Non-Denim":
			subCategoryId=4;
			break;
		}
		
		//create a new product object
		Product theProduct=new Product(id,pName,pDescription,pSpecs, categoryId,subCategoryId,pSKU,pPicturesUrl,pPrice);
		System.out.println("Product going to edit: "+theProduct);
		//perform update on database
		productDBUtil.editProduct(theProduct);
		
		//send them back to the "list product" page
		listProducts(request,response);
	}

	private void loadProduct(HttpServletRequest request, HttpServletResponse response) throws Exception{
		//read product id from Form data
			String theProductId=request.getParameter("productId");
			
		//get product from database (db util)
			Product theProduct = productDBUtil.getProduct(theProductId);
			
		//place product in the request attribute
			request.setAttribute("THE_PRODUCT", theProduct);
			
		
		//send to the JSP page: edit-product-form.jsp
			RequestDispatcher dispatcher= request.getRequestDispatcher("/edit-product-form.jsp");
			dispatcher.forward(request, response);
			
	}

	private void addProduct(HttpServletRequest request, HttpServletResponse response) throws Exception {
		//read product info from the form data
		String pName=request.getParameter("pName");
		String pDescription=request.getParameter("pDescription");
		String pSpecs=request.getParameter("pSpecs");
		String pCategory=request.getParameter("pCategory");
		String pSubcategory=request.getParameter("pSubcategory");
		int pSKU=Integer.parseInt(request.getParameter("pSKU"));
		String pPicturesUrl=request.getParameter("pPicturesUrl");
		float pPrice=Float.parseFloat(request.getParameter("pPrice"));
		
		
		int categoryId=0, subCategoryId=0;
		
		switch(pCategory) {
		case "Men":
			categoryId=1;
			break;
		case "Women":
			categoryId=2;
			break;
			
		case "Junior":
			categoryId=3;
			break;
			
		}
		
		switch(pSubcategory) {
		case "Shirts":
			subCategoryId=1;
			break;
		case "T-Shirts":
			subCategoryId=2;
			break;
		case "Denim":
			subCategoryId=3;
			break;
		case "Non-Denim":
			subCategoryId=4;
			break;
			
		}
		
		//create a new product object
		Product theProduct=new Product(pName,pDescription,pSpecs, categoryId,subCategoryId,pSKU,pPicturesUrl,pPrice);
		
		//add the product to the database
		productDBUtil.addProduct(theProduct);
		
		//send back to main page (the product list)
		listProducts(request,response);
		
	}

	private void listProducts(HttpServletRequest request, HttpServletResponse response) 
			throws Exception{
		//get products from db util
		
		List<Product> products= productDBUtil.getProducts();
		
		//add products to the request
		request.setAttribute("PRODUCTS_ALL", products);
		
		//send to JSP page(view)
		RequestDispatcher dispatcher= request.getRequestDispatcher("products-list-admin.jsp");
		
		dispatcher.forward(request,response);
	}

}
