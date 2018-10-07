<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page
	import="java.util.*, com.outfitterspk.jdbc.*,com.outfitterspk.models.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html class="no-js" lang="en">

<head>
<meta http-equiv="x-ua-compatible" content="ie=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="shortcut icon"
	href="//cdn.shopify.com/s/files/1/2290/7887/t/16/assets/favicon.png?3022115847986725518"
	type="image/x-icon" />

<link
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
	rel="stylesheet" />

<link rel="stylesheet" href="resources/css/font-awesome.min.css">
<link rel="stylesheet" href="resources/css/bootstrap.min.css">
<link rel="stylesheet" href="resources/css/style.css">
<title>OutfittersPK - Login</title>
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
                HttpSession session3 = request.getSession(false);

               		 if(session3.getAttribute("email")!=null){
                
                %>

<li class="nav-item dropdown mr-2"><a href="#"
						class="nav-link dropdown-toggle text-capitalize" data-toggle="dropdown" ><%= session3.getAttribute("firstName") %>
							<%= session3.getAttribute("lastName") %></a>
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

		<div class="row d-flex mt-3">
			<div class="col-md-11 justify-content-center mx-auto">

				<h4 class="text-uppercase mb-5 text-center">Already Registered?</h4>

				<c:if test="${errorMessage != null}">
					<div class="col-md-10 text-center my-4 mx-auto">
						<div
							class='text-danger text-center mt-5 bg-warning p-3 mx-auto rounded'>
							<strong>${errorMessage}</strong>
						</div>



					</div>
				</c:if>

				<div class="row ">
					<div class="col-md-6 border p-4 mx-auto">
						<form method="post" action="CustomerLoginServlet">
							<div class="row">
								<div class="col-md-12">
									<h5 class="text-uppercase text-info mb-4">Returning
										Customer</h5>
									<p>If you have an account with us, please log in.</p>
								</div>
							</div>

							<div class="row">
								<div class="col-md-12">
									<div class="form-group">
										<input id="email" name="email" type="text"
											class="form-control" placeholder="Email *" required />
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-md-12">
									<div class="form-group">
										<input id="password" name="password" type="password"
											class="form-control" placeholder="Password *" required />
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-md-6">
									<div class="form-group">
										<button type="submit"
											class="btn btn-dark text-white text-uppercase p-2 mb-1 px-4">
											<i class="fa fa-key"></i> Login
										</button>
										<div>
											<a href="#" class="text-info">Forgot Password </a>
										</div>
									</div>
								</div>
								<div class="col-md-6  float-right">
									<p class="text-danger text-right">* Required Fields</p>

								</div>
							</div>
						</form>
					</div>
					<div class="col-md-5 border ml-5 p-4 mx-auto">
						<div class="row">
							<div class="col-md-12">
								<h5 class="text-uppercase text-info mb-4">New Customer</h5>
								<p>By creating an account with our store, you will be able
									to move through the checkout process faster, store multiple
									shipping addresses, view and track your orders in your account
									and more.</p>
								<a href="customerCreateAccount.jsp"
									class="btn btn-dark text-white text-uppercase p-2 mb-1 px-4">
									Create an Account </a>

							</div>
						</div>

					</div>
				</div>

				<div class="text-danger p-3 my-2">${errorMessage}</div>



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
	<script src="text/javascript">
 
 </script>

</body>
</html>