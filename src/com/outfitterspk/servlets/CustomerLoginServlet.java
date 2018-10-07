package com.outfitterspk.servlets;

import java.io.IOException;
import java.net.URLEncoder;

import javax.annotation.Resource;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

import com.outfitterspk.jdbc.CustomerDBUtil;
import com.outfitterspk.jdbc.LoginService;
import com.outfitterspk.jdbc.ProductDBUtil;
import com.outfitterspk.models.Customer;


@WebServlet("/CustomerLoginServlet")
public class CustomerLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	//static HttpSession oldSession;
	// static HttpSession newSession;
	
    
    public CustomerLoginServlet() {
        super();
       
    }
	private LoginService loginService;
  
   	
   	static Customer theCustomer=null;
   	public static String loginEmail;
   	

   	@Resource(name="jdbc/store")
   	private DataSource dataSource;
   	
   	private CustomerDBUtil customerDBUtil;
   	
       @Override
   	public void init() throws ServletException {
   		super.init();
   		
   		//create our product db util....and pass in connection pool/data source
   		try {
   			loginService = new LoginService(dataSource);
   			customerDBUtil=new CustomerDBUtil(dataSource);
   		}
   		catch(Exception exc) {
   			throw new ServletException(exc);
   		}
   		
   	}
       
       @Override
       protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
    	  
	    		   request.getRequestDispatcher(
	                   "loginCustomer.jsp")
	                   .forward(request, response);	   
    	
       }
       
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String email=request.getParameter("email");
		String password=request.getParameter("password");
		
		System.out.println(email);
		System.out.println(password);
		
		
		
		if(loginService.login(email, password)) {
			loginEmail= email;
			
			
 
            
			//get the old session and invalidate
			HttpSession oldSession = request.getSession(false);
            if (oldSession != null) {
                oldSession.invalidate();
            }
            //generate a new session
           HttpSession newSession = request.getSession(true);

            //setting session to expiry in 5 mins
            newSession.setMaxInactiveInterval(5*60);
            newSession.setAttribute("email",email);
            
            System.out.println("NewSession Email: " +newSession.getAttribute("email"));
            
           loginEmail=URLEncoder.encode(email,"UTF-8");

           Cookie cEmail = new Cookie("email",loginEmail);
           Cookie[] theCookies=request.getCookies();
           if(theCookies!=null) {
        	   for(Cookie theCookie:theCookies) {
        		   if("email".equals(theCookie.getName())) {
        			   break;
        		   }
        	   }
           }else {
        	   response.addCookie(cEmail); 
           }
            
           try {
				Customer theCustomer=customerDBUtil.getCustomer(email);
				
				if(theCustomer!=null) {
		          newSession.setAttribute("firstName",theCustomer.getFirstName());
		          newSession.setAttribute("lastName",theCustomer.getLastName());
				}
				
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
            
            //cookie.setSecure(true);
           // cookie.setHttpOnly(true);
            //https://medium.com/@kasunpdh/session-management-in-java-using-servlet-filters-and-cookies-7c536b40448f
            
            //response.sendRedirect("customerInfo.jsp");
           response.sendRedirect("index.jsp");

            
            /*request.getRequestDispatcher(
                    "customerInfo.jsp")
                    .forward(request, response); */
        } else {
            request.setAttribute("errorMessage", "Invalid Credentials! Please try login again.");
            request.getRequestDispatcher("loginCustomer.jsp")
                    .forward(request, response);
        }
	}
	
//	public static boolean isUserLogin() {
//		if(newSession!=null || newSession.getAttribute("email")!=null) {
//			return true;
//		}else {
//			return false;
//		}
//	}
//
//	public static boolean isUserNotLogin() {
//		if(newSession==null ||newSession.getAttribute("email")==null) {
//			return true;
//		}else {
//			return false;
//		}
//	}
	
	
}
