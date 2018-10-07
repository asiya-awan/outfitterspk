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
<link rel="stylesheet" href="resources/css/font-awesome.min.css">
<link href="resources/css/bootstrap.min.css" rel="stylesheet"
	type="text/css" />
<link
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
	rel="stylesheet" />
<link rel="stylesheet" href="resources/css/style.css">
<link rel="stylesheet" href="resources/css/xzoom.css" />
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">


<title>OutfittersPK</title>
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
                HttpSession session9 = request.getSession(false);

               		 if(session9.getAttribute("email")!=null){
                
                %>

					<li class="nav-item dropdown mr-2"><a href="#"
						class="nav-link dropdown-toggle text-capitalize" data-toggle="dropdown" ><%= session9.getAttribute("firstName") %>
							<%= session9.getAttribute("lastName") %></a>
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

	<div class="container-fluid">
		<div class="row">
			<div class="col-lg-10 offset-lg-2 p-0 m-0 mx-auto">
				<section id="women" class="my-3 collection">
					<div class="container-fluid">
						<div class="row ">

							<!-- side Menu -->
							<div class="col-lg-2 col-md-0 hide-sm wrapper bg-light p-2 m-0">
								<div class="py-2 text-center bg-outfitter text-uppercase">Categories</div>
								<ul id="category" class="nav  d-flex flex-column">
									<li class="nav-item"><a href="#" data-toggle="collapse"
										data-target="#Men-submenu" class="nav-link smenu">Men <i
											class="fa fa-plus-circle float-right"></i></a>
										<div class="collapse" id="Men-submenu">
											<ul class="nav pl-3 flex-column innermenu">
												<li class="nav-item"><a href="" class="nav-link">Tees</a>
												</li>
												<li class="nav-item"><a href="" class="nav-link">Polos</a>
												</li>
												<li class="nav-item"><a href="" class="nav-link">Shirts</a>
												</li>
												<li class="nav-item"><a href="" class="nav-link">Jackets</a>
												</li>

												<li class="nav-item"><a href="" class="nav-link">Bottoms</a>
												</li>
												<li class="nav-item"><a href="" class="nav-link">Shoes</a>
												</li>
											</ul>
										</div></li>
									<!-- Women -->
									<li class="nav-item"><a href="#" data-toggle="collapse"
										data-target="#women-submenu" class="nav-link smenu">Women
											<i class="fa fa-plus-circle float-right"></i>
									</a>
										<div class="collapse" id="women-submenu">
											<ul class="nav pl-3 flex-column innermenu">
												<li class="nav-item"><a href="" class="nav-link">Tees</a>
												</li>
												<li class="nav-item"><a href="" class="nav-link">Polos</a>
												</li>
												<li class="nav-item"><a href="" class="nav-link">Shirts</a>
												</li>
												<li class="nav-item"><a href="" class="nav-link">Jackets</a>
												</li>

												<li class="nav-item"><a href="" class="nav-link">Bottoms</a>
												</li>
												<li class="nav-item"><a href="" class="nav-link">Shoes</a>
												</li>
											</ul>
										</div></li>
									<!-- Juniors -->
									<li class="nav-item"><a href="#" data-toggle="collapse"
										data-target="#juniors-submenu" class="nav-link smenu">Juniors
											<i class="fa fa-plus-circle float-right"></i>
									</a>
										<div class="collapse" id="juniors-submenu">
											<ul class="nav pl-3 innermenu flex-column">
												<li class="nav-item"><a href="" class="nav-link">Clothing</a>
												</li>
												<li class="nav-item"><a href="" class="nav-link">Shoes</a>
												</li>
											</ul>
										</div></li>
									<li class="nav-item"><a href="#" class="nav-link smenu">Accessories</a>
									</li>
								</ul>

								<div class="range-slider mt-3">
									<!-- <span class="range-slider__value">1090</span> -->
									<input class="range-slider__range" type="range" value="1090"
										min="1090" max="2490"> <span
										class="range-slider__value">2090</span>
								</div>

							</div>



							<!-- PRODUCTS -->
							<div id="w-products"
								class="col-lg-10 col-md-12 bg-light text-center m-0">
								<!-- 3rd row -->
								<div class="row my-4">

									<c:forEach var="tempProduct" items="${WOMEN_PRODUCTS_ALL}">

										<!-- set up a link for each Product for edit -->
										<c:url var="tempLink" value="WomenProductsServlet">
											<c:param name="command" value="LOAD" />
											<c:param name="productId" value="${tempProduct.id}" />
										</c:url>
										<div class="col-lg-3 col-md-6 col-sm-6 mb-md-2">
											<div class="card">
												<a href="${tempLink}" class="card-link"> <img
													class="card-img-top" class="img-fluid"
													src="${tempProduct.picturesUrl}" alt="Card image cap">
												</a>
												<div class="card-block">
													<p class="card-title">${tempProduct.productName}</p>
													<p class="card-text">

														<small class="priceSale">$.${tempProduct.price}</small>
													</p>
												</div>
											</div>
										</div>
									</c:forEach>

								</div>
								<!--3rd row end -->
							</div>
							<!--Product div end -->

						</div>
					</div>

				</section>
			</div>
		</div>
	</div>

	<!--MAIN FOOTER -->


	<footer id="main-footer" class="text-center text-white bg-dark py-4">
		<div class="container-fluid">
			<div class="row">
				<div class="col">Copyright &copy; 2018 Outfitters</div>
			</div>
		</div>
	</footer>


	<script src="resources/js/jquery.min.js"></script>

	<script src="resoureces/js/popper.min.js"></script>
	<script src="resources/js/bootstrap.min.js"></script>
	<script src="resources/js/rangeslider.js"></script>
</body>

</html>
