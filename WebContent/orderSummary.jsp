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

 <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.22/pdfmake.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/0.4.1/html2canvas.min.js"></script>


<title>outfitterspk - Order Summary</title>
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
						HttpSession session7 = request.getSession(false);

						if (session7.getAttribute("email") != null) {
					%>

<li class="nav-item dropdown mr-2"><a href="#"
						class="nav-link dropdown-toggle text-capitalize" data-toggle="dropdown" ><%= session7.getAttribute("firstName") %>
							<%= session7.getAttribute("lastName") %></a>
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
			<div class="col-md-9 justify-content-center mx-auto mt-2">

				<c:if test="${errorMessage != null}">
					<div class="col-md-10 text-center my-4 mx-auto">
						<div
							class='text-danger text-center mt-5 bg-warning p-3 mx-auto rounded'>
							<strong>${errorMessage}</strong>
						</div>



					</div>
				</c:if>


				<c:if test="${errorMessage == null}">
					<div class="p-4 bg-info text-white">
						<h5 class="text-center">Your Order is complete!</h5>
					</div>

					<div class="row">
						<div class="col-md-12 my-4">
							<h5 class="text-uppercase text-info mb-4">Order: #
								${ORDER_ID}</h5>
								
							<div class="float-right">	<input type="button" class="btn btn-info mb-2" id="btnExport" value="Download" onclick="Export()" /></div>
							<div>

								<table class="table" id="tblOrders">
									<thead>
										<tr>
											<th scope="col">SKU</th>
											<th scope="col">Product</th>
											<th scope="col">Color - Size</th>
											<th scope="col">Quantity</th>
											<th scope="col">Price</th>
										</tr>
									</thead>
									<tbody>

										<c:set var="total" value="${0}" />
										<c:forEach var="order" items="${ORDER_ITEMS}">
											<c:set var="itemTotal"
												value="${order.quantity * order.price}" />

											<c:set var="allTotal" value="${allTotal+itemTotal}" />



											<tr>
												<th scope="row">${order.SKU}</th>
												<td>${order.product}</td>
												<td>${order.color}-${order.size}</td>
												<td>${order.quantity}</td>
												<td>${order.price}</td>

											</tr>
										</c:forEach>

										<tr>
											<th scope="row" colspan="4">Cart Subtotal:</th>
											<td><strong>$ ${allTotal}</strong></td>
										</tr>
										<tr>
											<th scope="row" colspan="4">Shipping:</th>
											<td>FREE</td>
										</tr>
										<tr>
											<th scope="row" colspan="4">Order Total:</th>
											<td><strong>$ ${allTotal}</strong></td>
										</tr>
									</tbody>
								</table>
							</div>

						</div>
					</div>
					<div class="row">
						<div class="col-md-12">
							<h5 class="text-uppercase text-info pb-2">Customer Details</h5>
							<div>
								<table class="table">
									<tr>
										<th>Name:</th>
										<td>${THE_CUSTOMER.firstName}${THE_CUSTOMER.lastName}</td>
									</tr>
									<tr>
										<th>E-mail:</th>
										<td>${THE_CUSTOMER.email}</td>
									</tr>
								</table>
							</div>

							<div id="addresses" class="row">
								<div class="col-md-6">
									<h5 class="text-info">Billing Address</h5>

									<c:if test="${BILLING_ADDRESS!=null}">
										<address>
											${BILLING_ADDRESS.firstName} ${BILLING_ADDRESS.lastName}<br />
											${BILLING_ADDRESS.address} <br /> ${BILLING_ADDRESS.city},
											${BILLING_ADDRESS.region}<br /> ${BILLING_ADDRESS.country}, ${BILLING_ADDRESS.postalCode}<br />
										</address>
									</c:if>
									<c:if test="${BILLING_ADDRESS==null}">
										<p>Your billing address is same as shipping address.</p>
									</c:if>

								</div>
								<div class="col-md-6">
									<h5 class="text-info">Shipping Address</h5>
									<address>
										${THE_CUSTOMER.firstName} ${THE_CUSTOMER.lastName}<br />
										${THE_CUSTOMER.address} <br /> ${THE_CUSTOMER.city},
										${THE_CUSTOMER.region}<br /> ${THE_CUSTOMER.country}, ${THE_CUSTOMER.postalCode}<br />
									</address>

								</div>

							</div>

						</div>
					</div>

				</c:if>
			</div>

		</div>
	</div>

<!--MAIN FOOTER -->


    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.22/pdfmake.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/0.4.1/html2canvas.min.js"></script>
    <script type="text/javascript">
        function Export() {
            html2canvas(document.getElementById('tblOrders'), {
                onrendered: function (canvas) {
                    var data = canvas.toDataURL();
                    var docDefinition = {
                        content: [{
                            image: data,
                            width: 500
                        }]
                    };
                    pdfMake.createPdf(docDefinition).download("Order.pdf");
                }
            });
        }
    </script>

	<footer id="main-footer" class="text-center text-white bg-dark py-4 mt-3 my-3">
		<div class="container-fluid">
			<div class="row">
				<div class="col">Copyright &copy; 2018 Outfitters</div>
			</div>
		</div>

	</footer>



	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->


	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="resources\js\jquery.min.js"></script>
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