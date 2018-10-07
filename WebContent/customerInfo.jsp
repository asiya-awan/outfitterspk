<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page
	import="java.util.*, com.outfitterspk.jdbc.*,com.outfitterspk.models.*, com.outfitterspk.servlets.*, java.net.URLDecoder"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html class="no-js" lang="en">

<head>
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<link rel="shortcut icon"
	href="http://cdn.shopify.com/s/files/1/2290/7887/t/16/assets/favicon.png?3022115847986725518"
	type="image/x-icon" />
<link
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
	rel="stylesheet" />
<link rel="stylesheet" href="resources/css/font-awesome.min.css">
<link rel="stylesheet" href="resources/css/bootstrap.min.css">
<link rel="stylesheet" href="resources/css/style.css">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="resources\js\jquery.min.js"></script>

<script>
 $(document).ready(function() {
	 $('#logout').click(function(){
		 console.log("LOGOUT");
		 CustomerLoginServlet.logout();
	 });
 });
 </script>
<title>outfitterspk - Customer Information</title>
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<div class="container-fluid">
			<button class="navbar-toggler navbar-toggler-right" type="button"
				data-toggle="collapse" data-target="#navbar02"
				aria-controls="navbarTogglerDemo02" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div id="logo">
				<a class="navbar-brand" href="/outfitterspk"> <img
					src="resources/img/logo.png" width="150" class="img-fluid"
					alt="Outfitters Logo">
				</a>
			</div>
			<div class="collapse navbar-collapse" id="navbar02">
				<ul class="navbar-nav text-uppercase">
					<li class="nav-item"><a class="nav-link" href="/outfitterspk">Home

					</a></li>
					<li class="nav-item"><a class="nav-link"
						href="ProductCustomerServlet">Products</a></li>

					<li class="nav-item"><a class="nav-link"
						href="MenProductsServlet">Men</a></li>
					<li class="nav-item"><a class="nav-link"
						href="WomenProductsServlet">Women</a></li>
					<li class="nav-item"><a class="nav-link" href="JuniorsProductsServlet">Juniors</a>
					</li>

				</ul>
				<ul class="navbar-nav ml-auto">
					<%
                HttpSession session4 = request.getSession(false);

               		 if(session4.getAttribute("email")!=null){
                
                %>

<li class="nav-item dropdown mr-2"><a href="#"
						class="nav-link dropdown-toggle text-capitalize" data-toggle="dropdown" ><%= session4.getAttribute("firstName") %>
							<%= session4.getAttribute("lastName") %></a>
						<div class="dropdown-menu">
							<a href="CustomerAccountServlet?command=LOAD_ACCOUNT"
								class="dropdown-item"><i class="fa fa-building"></i>  My Account</a> 
							<a href="CustomerAccountServlet?command=VIEW_CUSTOMER_ORDERS"
								class="dropdown-item"><i class="fa fa-tachometer"></i>  My Orders</a> 
							<a href="CustomerLogoutServlet" class="dropdown-item"><i
							class="fa fa-user-times"></i> Logout</a>
						</div>
					</li>




					<%
                
               		 }
                else {  %>

					<li class="nav-item"><a href="CustomerLoginServlet"
						class="nav-link"> <i class="fa fa-user"> </i> Login
					</a></li>


					<% } %>

					<li class="nav-item"><a class="nav-link"
						href="CartServlet?command=LIST"> <i
							class="fa fa-shopping-cart"> Cart</i>
					</a></li>
				</ul>
			</div>
		</div>

	</nav>

	<!-- end of header -->

	<!-- start of page body -->

	<div class="container-fluid">
		<div class="row">


			<div class="container-fluid">
				<div class="row  justify-content-center my-5">
					<div class="col-12 col-md-10 pr-5">

						<section id="customer" class="my-2 collection">
							<div class="container-fluid">
								<div class="row ">

									<!-- Customer Information -->
									<div class="col-lg-9 col-md-9 pr-5">
										<!-- Breadcrumbs -->
										<div id="breadcrumb-shopping">
											<nav aria-label="breadcrumb">
												<ol class="breadcrumb bg-white">
													<li class="breadcrumb-item"><a href="CartServlet">Cart</a></li>
													<li class="breadcrumb-item active">Customer
														Information</li>
													<li class="breadcrumb-item">Shipping Method</li>
													<li class="breadcrumb-item" aria-current="page">
														Payment Method</li>
												</ol>
											</nav>
										</div>


										<!-- title -->
										<div class="row d-flex flex-row">
											<div class="col justify-content-start">
												<h5>Customer Information</h5>
											</div>

											<div class="col justify-content-end">
												<!-- show this if user is new customer -->
												<div class="d-flex justify-content-end">
													<%
                                       String email;
                                       HttpSession session1 = request.getSession(false);
                                       Cookie[] theCookies=request.getCookies();
                                       if(theCookies!=null){
                                      	 for(Cookie theCookie:theCookies){
                                      		 if("email".equals(theCookie.getName())){
                                      			email=URLDecoder.decode(theCookie.getValue(),"UTF-8") ;
                                      			//out.println("Cookie: " +email);
                                      			break;
                                      		 }
                                      	 }
                                       }
                                       
                                       if(session1.getAttribute("email")==null){
                                      	out.println("<p>Already have an account? <a href='CustomerLoginServlet' class='text-danger'>Login</a></p>");
                                   	
                                       }
                                       %>

												</div>
											</div>

										</div>

										<div class="row">
											<div class="col-md-12">


												<div class="row">
													<div class="col-md-12">
														<div class="mb-2 p-0">
															<%
                                    			HttpSession session2 = request.getSession(false);
                                     			if(session2.getAttribute("email")!=null){
                                     				out.print(session2.getAttribute("email"));
                                        	out.print("<form action='CustomerLogoutServlet' method='post' class='d-inline-block ml-3'><input type='submit' value='Logout' id='inputButtonLink' class='text-danger mt-1 p-0' style='cursor:pointer;' ></form>");
	                                    	
	                                    	//System.out.println("JSP page: "+session1.getAttribute("email"));
                                         }
                                       	 %>

														</div>
													</div>
												</div>


												<!-- show this only if user is new Customer -->
												<form method='get' action='CustomerAccountServlet'>
													<input type='hidden' name='command' value='ADD_USER' />

													<div id="customerInfo">

														<div class="row">
															<div class="col-md-12">
																<div class="form-group">
																	<%
	                                    			HttpSession session3 = request.getSession(false);
	                                     			if(session3.getAttribute("email")!=null){ %>
																	<input id='email' name='email' type='email'
																		value="${THE_CUSTOMER.email}" class='form-control'
																		placeholder='Email' />
																	<% }
                                       			
	                                     			if(session3.getAttribute("email")==null){ %>
																	<input id='email' name='email' type='email'
																		value="${THE_CUSTOMER.email}" class='form-control'
																		placeholder='Email' />
																	<% 	}
                                       			 %>

																</div>
															</div>
														</div>
													</div>


													<h5 class="my-3">Shipping Address</h5>
													<div class="row">
														<div class="col-md-6">
															<div class="form-group">
																<input id="firstName" name="firstName" type="text"
																	value="${THE_CUSTOMER.firstName}" class="form-control"
																	placeholder="First Name *" required />
															</div>
														</div>
														<div class="col-md-6">
															<div class="form-group">
																<input id="lastName" name="lastName" type="text"
																	value="${THE_CUSTOMER.lastName}" class="form-control"
																	placeholder="Last Name *" required />
															</div>
														</div>

													</div>
													<div class="row">
														<div class="col-md-12">
															<div class="form-group">
																<input id="address" name="address" type="text"
																	value="${THE_CUSTOMER.address}" class="form-control"
																	placeholder="Address" required />
															</div>
														</div>
													</div>

													<div class="row">
														<div class="col-md-12">
															<div class="form-group">

																<input id="city" name="city" type="text"
																	value="${THE_CUSTOMER.city}" class="form-control"
																	placeholder="City " required />
															</div>
														</div>
													</div>
													<div class="row">
														<div class="col-md-12">
															<div class="form-group">
																<input id="region" name="region" type="text"
																	value="${THE_CUSTOMER.region}" class="form-control"
																	placeholder="Region" />
															</div>
														</div>
													</div>
													<div class="row">

														<div class="col-md-6">
															<div class="form-group">

																<input id="country" name="country" type="text"
																	value="${THE_CUSTOMER.country}" class="form-control"
																	placeholder="Country " required />
															</div>
														</div>
														<div class="col-md-6">
															<div class="form-group">

																<input id="postalcode" name="postalCode" type="text"
																	value="${THE_CUSTOMER.postalCode}" class="form-control"
																	placeholder="Postal Code " required />
															</div>
														</div>

													</div>
													<div class="row">
														<div class="col-md-12">
															<div class="form-group">

																<input id="phone" name="phone" type="text"
																	value="${THE_CUSTOMER.phone}" class="form-control"
																	placeholder="Phone " required />
															</div>
														</div>
													</div>
													<!--    <div class="row my-2">
                                        <div class="col-md-12">

                                            <div class="form-check">
                                                    <label class="form-check-label">
                                                <input id="saveInfo" name="saveInfo" type="checkbox" class="form-check-input"/> Save this information for next time
                                            </label>
                                            </div>
                                        </div>
                                    </div> -->
													<div class="row d-flex flex-row my-4">

														<div class="col-md-12 d-flex justify-content-between">
															<div>
																<a href="CartServlet" class="text-danger"> < Return
																	to Cart </a>
															</div>
															<div>
																<button type="submit"
																	class="btn btn-info text-white p-2">Continue
																	to Shipping Method</button>
															</div>
														</div>

													</div>
												</form>

											</div>
										</div>
									</div>
									<!--Cart Information -->
									<div id="w-carts"
										class="col-lg-3 col-md-3 hide-sm my-2 border-left">
										<div>
											<!-- set up a product link -->

											<table>
												<!--foreach loop-->

												<c:set var="total" value="${0}" />

												<c:forEach var="cartItem"
													items="${CartServlet.getCartItems()}">
													<c:set var="itemTotal"
														value="${cartItem.quantity * cartItem.price}" />
													<c:set var="allTotal" value="${allTotal+itemTotal}" />
													<tr class="border-bottom ">
														<c:url var="productLink" value="WomenProductsServlet">
															<c:param name="command" value="LOAD" />
															<c:param name="productId" value="${cartItem.productId}" />
														</c:url>
														<td class="py-2"><img src="${cartItem.picturesUrl}"
															class="rounded" width="70" height="80" /></td>
														<td class="px-3"><a class="text-info"
															href="${productLink}">${cartItem.size} -
																${cartItem.color} - ${cartItem.quantity}</a></td>
														<td class="pl-4">${cartItem.price}</td>
													</tr>
												</c:forEach>
												<!--end of foreach loop-->

												<tr>

													<td class="py-2">SubTotal:</td>
													<td></td>
													<td class="float-right">$ ${allTotal}</td>
												</tr>
												<tr>
													<td class="pb-2">Shipping:</td>
													<td></td>
													<td class="float-right">Free</td>
												</tr>
												<tr>
													<td></td>
												</tr>
												<tr class="border-top">

													<td class="py-2">Total</td>
													<td></td>
													<td class="float-right py-2"><strong>$
															${allTotal}</strong></td>
													<!--   <td class="float-right py-2"><strong>$ ${CartServlet.getSubTotal()}</strong></td> -->
												</tr>
											</table>

										</div>
									</div>
									<!--end of cart information-->

								</div>
						</section>
					</div>

				</div>
			</div>

		</div>
	</div>
<!--MAIN FOOTER -->


	<footer id="main-footer" class="text-center text-white bg-dark py-4 my-3">
		<div class="container-fluid">
			<div class="row">
				<div class="col">Copyright &copy; 2018 Outfitters</div>
			</div>
		</div>

	</footer>

	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
		integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
		integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
		crossorigin="anonymous"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
		integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
		crossorigin="anonymous"></script>



</body>
</html>