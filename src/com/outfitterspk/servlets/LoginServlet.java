package com.outfitterspk.servlets;

import java.io.IOException;

import javax.annotation.Resource;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import com.outfitterspk.jdbc.ProductDBUtil;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
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
    

    public LoginServlet() {
        super();
       
    }
    

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email= request.getParameter("email");
		String password=request.getParameter("password");
		
		
		request.setAttribute("email",email);
		request.setAttribute("password", password);
		
		//step 3: get request dispatcher
    	RequestDispatcher dispatcher=request.getRequestDispatcher("overview-admin.jsp");

    	
    	//step4: now forward to JSP
    	dispatcher.forward(request, response);
		
	}

}
