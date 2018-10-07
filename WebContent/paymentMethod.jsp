<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page
	import="java.util.*, com.outfitterspk.jdbc.*,com.outfitterspk.models.*, com.outfitterspk.servlets.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html class="no-js" lang="en">

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
	$(document)
			.ready(
					function() {
						$('input[name=billingAddress]')
								.click(
										function() {
											//var value = $( 'input[name=billingAddress]:checked').val();
											//alert(value);
											//console.log("Entered");
											if ($(this).attr('value') == 0) {

												$('#billingAddressMainDiv')
														.html(
																'<div id="billingAddressForm" class="row  py-3"><div class="col-md-12"><div class="row"><div class="col-md-6"><div class="form-group"><input id="firstName" name="firstName" type="text" class="form-control" placeholder="First Name *" required/></div></div><div class="col-md-6"><div class="form-group"><input id="lastName" name="lastName" type="text" class="form-control" placeholder="Last Name *" required/></div></div></div><div class="row"><div class="col-md-12"><div class="form-group"><input id="address" name="address" type="text" class="form-control"placeholder="Address" required/></div> </div> </div><div class="row"><div class="col-md-12"><div class="form-group"><input id="city" name="city" type="text" class="form-control" placeholder="City " required/></div> </div></div><div class="row"><div class="col-md-12"><div class="form-group"><input id="region" name="region" type="text" class="form-control" placeholder="Region" /></div></div></div><div class="row"><div class="col-md-6"><div class="form-group"><input id="country" name="country" type="text" class="form-control" placeholder="Country " required/></div></div><div class="col-md-6"><div class="form-group"><input id="postalcode" name="postalCode" type="text" class="form-control" placeholder="Postal Code" pattern=".{6,}"  title="6 characters minimum" maxlength="6" required/></div></div></div><div class="row"><div class="col-md-12"><div class="form-group"><input id="phone" name="phone" type="text" class="form-control" placeholder="Phone" required/></div></div></div></div></div>');

											}

											if ($(this).attr('value') == 1) {
												$('#billingAddressForm')
														.remove();
											}
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
						HttpSession session6 = request.getSession(false);

						if (session6.getAttribute("email") != null) {
					%>

					<li class="nav-item dropdown mr-2"><a href="#"
						class="nav-link dropdown-toggle text-capitalize" data-toggle="dropdown" ><%= session6.getAttribute("firstName") %>
							<%= session6.getAttribute("lastName") %></a>
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
						} else {
					%>

					<li class="nav-item"><a href="CustomerLoginServlet"
						class="nav-link"> <i class="fa fa-user"> </i> Login
					</a></li>


					<%
						}
					%>

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
														<li class="breadcrumb-item"><a href="CartServlet">Cart</a></li>
														<li class="breadcrumb-item "><a
															href="CustomerAccountServlet?command=LOAD_INFO">Customer
																Information</a></li>
														<li class="breadcrumb-item"><a href="#">Shipping
																Method</a></li>
														<li class="breadcrumb-item active" aria-current="page">Payment
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
													<h5 class="my-3">Payment Method</h5>
													<p>All transaction are secure and encrypted.</p>
													<div class="my-4 p-3 border">Cash on Delivery (COD)</div>
												</div>
											</div>

											<!--end Payment Method-->

											<!--Billing Address-->
											<div class="row">
												<div class="col-md-12">
													<h5 class="my-3">Billing Address</h5>

													<form method="get" action="CustomerAccountServlet">
														<input type="hidden" name="command" value="COMPLETE_ORDER" />
														<input type="hidden" name="customer_id"
															value="${THE_CUSTOMER.id}" />

														<div class=" p-3 border rounded-top">
															<div class="form-check">
																<label class="form-check-label"> <input
																	class="form-check-input" type="radio"
																	name="billingAddress" id="billingAdress1" value="1">
																	Same as shipping address
																</label>
															</div>
														</div>
														<div class="p-3 border rounded-bottom">
															<div class="form-check">
																<label class="form-check-label"> <input
																	class="form-check-input" type="radio"
																	name="billingAddress" id="billingAddress2" value="0">
																	Use a different billing address
																</label>
															</div>
														</div>

														<div id="billingAddressMainDiv"></div>


														<div class="row d-flex flex-row my-4" id="sameAsShipping">

															<div class="col-md-12 d-flex justify-content-between">
																<div>
																	<a href="CartServelt?command=LOAD_INFO"
																		class="text-danger"> < Return to Shipping Method </a>
																</div>
																<div>
																	<button type="submit"
																		class="btn btn-info text-white p-2">Complete
																		Order</button>
																</div>
															</div>

														</div>





													</form>

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


</body>


</html>