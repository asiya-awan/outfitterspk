package com.outfitterspk.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/CustomerLogoutServlet")
public class CustomerLogoutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public CustomerLogoutServlet() {
        super();

    }
    
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	
    	 HttpSession session = request.getSession(false);
         System.out.println("GettingFromLogout"+session.getAttribute("email"));
 	        if(session != null){
 	            session.invalidate();
 	            
 	           response.setHeader("Cache-Control", "no-cache"); 
 	          response.setHeader("Pragma", "no-cache"); 
 	          response.setDateHeader("Expires", 0); 
 	        }

         response.sendRedirect(request.getContextPath() + "/index.jsp");

    }


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        //invalidate the session if exists
        HttpSession session = request.getSession(false);
        System.out.println("GettingFromLogout"+session.getAttribute("email"));
	        if(session != null){
	            session.invalidate();
	            
	            response.setHeader("Cache-Control", "no-cache"); 
	            response.setHeader("Pragma", "no-cache"); 
	            response.setDateHeader("Expires", 0); 
	        }
//	        if(cookie!=null) {
//	        	Cookie
//	        }
        response.sendRedirect(request.getContextPath() + "/customerInfo.jsp");
    }

}
