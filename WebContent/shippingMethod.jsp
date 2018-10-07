<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page
	import="java.util.*, com.outfitterspk.jdbc.*,com.outfitterspk.models.*, com.outfitterspk.servlets.*"%>
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

<title>outfitterspk - Shipping Method</title>
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
                HttpSession session5 = request.getSession(false);

               		 if(session5.getAttribute("email")!=null){
                
                %>

<li class="nav-item dropdown mr-2"><a href="#"
						class="nav-link dropdown-toggle text-capitalize" data-toggle="dropdown" ><%= session5.getAttribute("firstName") %>
							<%= session5.getAttribute("lastName") %></a>
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

			<c:if test="${errorMessage != null}">
				<div class="col-md-10 text-center mx-auto">
					<div class='text-info text-center mt-5 lead mx-auto'>
						<strong>${errorMessage}</strong>
					</div>

					<div class='text-center mt-3 mx-auto'>
						<a href='CustomerLoginServlet' class='text-danger'>Login</a>
					</div>


				</div>
			</c:if>


			<c:if test="${errorMessage == null}">
				<div class="container-fluid">
					<div class="row  justify-content-center my-5">
						<div class="col-12 col-md-10 pr-5">

							<section id="customer" class="my-2 collection">
								<div class="container-fluid">
									<div class="row ">

										<div class="col-lg-9 col-md-9">

											<!-- Breadcrumbs -->
											<div id="breadcrumb-shopping">
												<nav aria-label="breadcrumb">
													<ol class="breadcrumb bg-white">
														<li class="breadcrumb-item "><a href="CartServlet">Cart</a></li>
														<li class="breadcrumb-item "><a
															href="CustomerAccountServlet?command=LOAD_INFO">Customer
																Information</a></li>
														<li class="breadcrumb-item active">Shipping Method</li>
														<li class="breadcrumb-item" aria-current="page">Payment
															Method</li>
													</ol>
												</nav>
											</div>

											<!-- Customer Information -->
											<div class="row my-3">
												<div class="col-md-12">
													<table class="table">
														<tbody>
															<tr>
																<th scope="row">Contact</th>
																<td>${THE_CUSTOMER.email}</td>
																<td></td>

															</tr>


															<tr>
																<th scope="row">Ship to</th>
																<td>${THE_CUSTOMER.address}</td>
																<td><a
																	href="CustomerAccountServlet?command=LOAD_INFO"
																	class="text-danger text-left">Change</a></td>
															</tr>
															<tr>
																<th scope="row">Method</th>
																<td class="text-uppercase">Courier Services - Free</td>
																<td></td>
															</tr>
														</tbody>
													</table>
												</div>

											</div>
											<!--end of Customer Information-->
											<!--Payment method-->
											<div class="row">
												<div class="col-md-12">
													<h5 class="my-3">Shipping Method</h5>

													<div class="my-4 p-3 border">
														<span class="text-uppercase"> Courier Services </span> <span
															class="float-right text-uppercase"> free</span>
													</div>
												</div>
											</div>

											<!--Payment Method-->

											<div class="row d-flex flex-row my-4">

												<div class="col-md-12 d-flex justify-content-between">
													<div>
														<a href="CustomerAccountServlet?command=LOAD_INFO"
															class="text-danger"> < Return to Customer Information
														</a>
													</div>
													<div>
														<a href="CustomerAccountServlet?command=LOAD_PAYMENT"
															class="btn btn-info text-white p-2">Continue to
															Payment Method</a>
													</div>
												</div>

											</div>


										</div>
										<!--end of col-md-9-->

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
								</div>
							</section>
						</div>

					</div>
				</div>
			</c:if>
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
	<script src="text/javascript">
 
 </script>

</body>
</html>