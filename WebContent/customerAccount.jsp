<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page
	import="java.util.*, com.outfitterspk.jdbc.*,com.outfitterspk.models.*, com.outfitterspk.servlets.*, java.net.URLDecoder"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<link rel="shortcut icon"
	href="http://cdn.shopify.com/s/files/1/2290/7887/t/16/assets/favicon.png?3022115847986725518"
	type="image/x-icon" />

<!-- Bootstrap and custom style -->
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
$(document).ready(function(){
	$( '.AddressBtn').click(function() {
		
	        $('#billingAddressForm').show();
	    
	});
});
</script>

<title>outfitterspk - My Account</title>
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
                HttpSession session12 = request.getSession(false);

               		 if(session12.getAttribute("email")!=null){
                
                %>

<li class="nav-item dropdown mr-2"><a href="#"
						class="nav-link dropdown-toggle text-capitalize" data-toggle="dropdown" ><%= session12.getAttribute("firstName") %>
							<%= session12.getAttribute("lastName") %></a>
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


		<div class="row d-flex mt-5">
			<div class="col-md-8 justify-content-center mx-auto">
				<h4 class="text-uppercase mb-2 text-center">Account</h4>
				<%
                //System.out.println("HELLO");
                HttpSession session1 = request.getSession(false);
                if(session1.getAttribute("email")==null){
                	//out.println("<div class='text-info text-center p-3 lead'>No user logged in !</div><div class='text-center'><a href='CustomerLoginServlet' class='text-danger'>Login</a></div>");
                };
                
                %>
				<div class='text-info text-center p-3 lead'>
					<strong>${errorMessage}</strong>
				</div>
				<c:if test="${errorMessage != null}">
					<div class='text-center'>
						<a href='CustomerLoginServlet' class='text-danger'>Login</a>
					</div>
				</c:if>
				<div>
					<c:if test="${errorMessage == null}">
						
						<!-- Account Details -->

						<div class='row'>
							<div class='col-md-12'>
								<h5 class='text-uppercase text-info pb-2'>Account Details</h5>
								<div>
									<table class="table">
										<tr>
											<th>Name:</th>
											<td class="text-capitalize">${THE_CUSTOMER.lastName},${THE_CUSTOMER.firstName}</td>
										</tr>
										<tr>
											<th>E-mail:</th>
											<td>${THE_CUSTOMER.email}</td>
										</tr>
									</table>
									<div class='row'>
										<div class='col-md-12'>
											<div id='accordion' role='tablist'>
												<div class='card'>
													<div class='card-header   bg-dull' role='tab'>
														<p class='mb-0 text-uppercase text-center'>
															<a href='#collapseOne' data-toggle='collapse'
																class='text-info text-uppercase text-center'
																data-parent='accordion'>View Address</a>
														</p>
													</div>
													<div class='collapse' id='collapseOne'>
														<div class='card-body'>
															<div id='viewAddressDiv'>
																<c:if test="${THE_CUSTOMER.address==null}">
																	<div id='hasNoAddress'>
																		<p>You have no address added yet!</p>
																		<a class='AddressBtn btn btn-dark text-white'>Add
																			Address</a>
																	</div>
																</c:if>
																<c:if test='${THE_CUSTOMER.address!=null}'>
																	<div id='hasAddress'>
																		<address>${THE_CUSTOMER.address}<br />${THE_CUSTOMER.city},
																			${THE_CUSTOMER.region}<br />${THE_CUSTOMER.country},
																			${THE_CUSTOMER.postalCode} <br />${THE_CUSTOMER.phone}<br />Email:
																			<a href="mailto:${THE_CUSTOMER.email}">
																				${THE_CUSTOMER.email}</a><br />
																		</address>
																		<a class='btn btn-danger text-white AddressBtn'
																			id='changeAddressBtn'>Change</a>
																	</div>
																</c:if>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
									<!-- end of view addresss -->
									<!-- start of add address -->


									<!-- billing address start -->
									<!-- billing address start -->
									<div id='billingAddressForm' class='row' style='display: none;'>



										<div class='col-md-12'>
											<form method='get' action='CustomerAccountServlet'>
												<input type='hidden' name='command' value='ADD_ADDRESS' />

												<div class='row mt-3'>
													<div class='col-md-12'>
														<div class='form-group'>
															<input id='address' name='address' type='text'
																class='form-control' value='${THE_CUSTOMER.address}'
																placeholder='Address' required />
														</div>
													</div>
												</div>

												<div class='row'>
													<div class='col-md-12'>
														<div class='form-group'>

															<input id='city' name='city' type='text'
																class='form-control' value='${THE_CUSTOMER.city}'
																placeholder='City' required />
														</div>
													</div>
												</div>
												<div class='row'>
													<div class='col-md-12'>
														<div class='form-group'>
															<input id='region' name='region' type='text'
																class='form-control' value='${THE_CUSTOMER.region}'
																placeholder='Region' />
														</div>
													</div>
												</div>
												<div class='row'>

													<div class='col-md-6'>
														<div class='form-group'>

															<input id='country' name='country' type='text'
																class='form-control' placeholder='Country'
																value='${THE_CUSTOMER.country}' required />
														</div>
													</div>
													<div class='col-md-6'>
														<div class='form-group'>

															<input id='postalcode' name='postalCode' type='text'
																class='form-control' placeholder='Postal Code'
																value='${THE_CUSTOMER.postalCode}' required />
														</div>
													</div>

												</div>
												<div class='row'>
													<div class='col-md-12'>
														<div class='form-group'>

															<input id='phone' name='phone' type='text'
																class='form-control' placeholder='Phone'
																value='${THE_CUSTOMER.phone}' required />
														</div>
													</div>
												</div>

												<div class='row d-flex flex-row my-4'>

													<div class='col-md-12 d-flex justify-content-end'>

														<div>
															<button type='submit'
																class='btn btn-dark d-block text-white px-5 '>Save</button>
														</div>
													</div>

												</div>

											</form>
										</div>
									</div>
									<!-- Billing address end -->

								</div>

							</div>
						</div>
						<!-- end of account Details -->
					</c:if>
				</div>


				<!-- end of if user login -->
			</div>
		</div>
	</div>





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