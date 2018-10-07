<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page
	import="java.util.*, com.outfitterspk.jdbc.*,com.outfitterspk.models.*, com.outfitterspk.servlets.*"%>
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


<title>OutfittersPK - Cart</title>


<style>
.shopping-cart-table_product-name a {
	color: #1fc0a0;
}

.shopping-cart-table a {
	color: #1fc0a0;
}

.shopping-cart-table {
	width: 100%;
}
</style>

<script src="resources\js\jquery.min.js"></script>
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
                HttpSession session13 = request.getSession(false);

               		 if(session13.getAttribute("email")!=null){
                
                %>

					<li class="nav-item dropdown mr-2"><a href="#"
						class="nav-link dropdown-toggle text-capitalize" data-toggle="dropdown" ><%= session13.getAttribute("firstName") %>
							<%= session13.getAttribute("lastName") %></a>
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

	<div id="pageContent">
		<div class="container">
			<!-- title -->
			<div class="title-box">
				<h3 class="text-center text-uppercase mt-4 mb-3">Shopping Cart</h3>
			</div>

			<div id="cartUpdateStatus"></div>

			<c:choose>
				<c:when test="${ CartServlet.isCartEmpty() }">

					<div
						class="row d-flex justify-content-center align-items-center mt-5">
						<img
							src="http://cdn.shopify.com/s/files/1/2290/7887/t/16/assets/empty-cart-icon.png?11685302520531135709"
							alt="empty cart icon" class="img-responsive-inline">
					</div>
					<div class="row d-flex justify-content-center align-items-center">
						<p class="text-info my-5 ">
							<strong>Your cart is empty!</strong>
						</p>
					</div>

					<div class="row d-flex justify-content-center">
						<a href="ProductCustomerServlet" class="btn btn-dark text-white">
							> Continue Shopping </a>
					</div>
				</c:when>

				<c:otherwise>

					<!-- /title -->



					<!-- Shopping cart table -->
					<div>
						<table class="table shopping-cart-table">
							<thead class="thead-dark">
								<tr>
									<th>Product</th>

									<th>&nbsp;</th>
									<th>Price</th>
									<th>Quantity</th>
									<th>Total</th>
									<th>&nbsp;</th>
									<th>&nbsp;</th>

								</tr>
							</thead>
							<tbody>

								<c:forEach var="cartItem" items="${CARTS_ALL}">
					

									<tr>

									
										<form action="CartServlet" method="get">
											<!-- set up a product link -->
											<c:url var="productLink" value="ProductCustomerServlet">
												<c:param name="command" value="LOAD" />
												<c:param name="productId" value="${cartItem.productId}" />
											</c:url>

											<!-- set up a Customer Info link -->
											<c:url var="customerInfoLink" value="CustomerAccountServlet">
												<c:param name="command" value="LOAD_INFO" />

											</c:url>


											<!-- set up a delete link for each Product -->
											<c:url var="deleteLink" value="CartServlet">
												<c:param name="command" value="DELETE" />
												<c:param name="cartItemId" value="${cartItem.cartItemId}" />
											</c:url>

											<!-- set up a clear cart link-->
											<c:url var="clearCartLink" value="CartServlet">
												<c:param name="command" value="CLEARALL" />

											</c:url>



											<!-- set up a link for update cart-->
											<c:url var="udpateCartItemLink" value="CartServlet">
												<c:param name="command" value="UPDATE" />
												<c:param name="cartItemId" value="${cartItem.cartItemId}" />
											</c:url>


											<input type="hidden" name="command" value="UPDATE" /> 
											<input type="hidden" name="cartItemId" value="${cartItem.cartItemId}" />


											<td>
												<div class="shopping-cart-table__product-image">
													<a href="${productLink}"> <img class="img-responsive"
														weight="90" height="110" src="${cartItem.picturesUrl}"
														alt="">
													</a>
												</div>
											</td>
											<td>
												<h5
													class="shopping-cart-table__product-name text-left text-uppercase">
													<a href="${productLink}">${cartItem.size} -
														${cartItem.color}</a>
												</h5>

											</td>

											<td>
												<div>$ ${cartItem.price}</div>
											</td>
											<td>
												<div>
													<input type="number" class="quantity" name="quantity"
														id="quantity${cartItem.cartItemId}"
														value="${cartItem.quantity}" class="form-control" />
												</div>
											</td>
											<td colspan="2">

												${cartItem.subtotal}
											</td>
											
											<td>
												

												<button type="submit" class="btn btn-sm btn-success"><i class="fa fa-check"></i> </button>
												
												<a href="${deleteLink}"
												class="btn btn-danger btn-sm text-white"> <i
													class="fa  fa-times-circle"></i> </a>


											</td>

										
									</form>
									</tr>
								</c:forEach>


							</tbody>
						</table>
					</div>
					<!-- /Shopping cart table -->

					<hr />
					<div class="my-3">
						<a href="ProductCustomerServlet" class="btn  btn-info mx-2"><i
							class="fa fa-chevron-left"></i> Continue Shopping</a> <a
							href="${clearCartLink}" class="btn  btn-danger mx-2"><i
							class="fa fa-trash"></i> Clear Cart</a>

						<!-- <a href="${udpateCartItemLink}" class="btn  btn-warning mr-5"> <i class="fa fa-refresh"></i>  Update Cart</a>  -->
					</div>

					<div class="my-3"></div>
					<div class="row">

						<div class="col-md-8">
							
						</div>

						<div class="my-3"></div>
						<div class="col-md-6 col-sm-12">
							<div class="card p-3">
								<table class="table-total">
									<tbody>
										<tr id="subtotal">
											<th class="text-left text-uppercase">Subtotal</th>
											<td class="text-right">${cartItem.subtotal}</td>

										</tr>

										<tr id="tax" class="my-2" style="display: none">
											<th class="text-left">Shipping &amp; Handling</th>
											<td class="text-right">PKR.0.00</td>
										</tr>
									</tbody>

									<tfoot>
										<tr id="grandtotal" class="my-3">
											<th class="text-left font-weight-bold">GRAND TOTAL</th>
											<td class="text-right font-weight-bold">${GRAND_TOTAL}</td>
										</tr>
									</tfoot>
								</table>

								<a href="${customerInfoLink}" class="btn btn-dark btn-xl mt-4">
									PROCEED TO CHECKOUT <i class="fa fa-chevron-right"></i>
								</a>

							</div>
						</div>
					</div>


					</form>

				</c:otherwise>
			</c:choose>
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
	

	<script src="resources\js\jquery.min.js"></script>
	<script type="text/javascript">
     /*$(document).ready(function(){
 		
 		var quantity=0;
 		$(".quantity").change(function(){
 		    alert("The text has been changed.");
 		   quantity=$(this).val();
 		   
 		}); */
 		
 	
 		
 		/* $('.updateCartItem').click(function(){
 			var cartItemId=$(this).attr('id');
 			//var cartItemId= $('.hiddenCartItemId').val();
 			 //var cartItemId="${cartItem.cartItemId}";
 			 console.log("Cart item Id AJAX: "+cartItemId);
 			 var quantityN='quantity'+cartItemId;
 			 
 			 console.log("QuantityN: "+quantityN);
 			 var quantity=$('#'+quantityN).val();
 			 console.log("QUANTITY: "+quantity);
 			 $.ajax({
 				 type:'GET',
 				 data:{
 					 cartItemId:cartItemId,
 					 quantity:quantity,
 					 command:'UPDATE'
 				 },
 				 url:'CartServlet',
 				 success:function(result){
 					 $('#cartUpdateStatus').text("Your cart is updated!");
 				 }
 			 });
 			});
 		
 		
 	}); */
 	</script>

	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="resources\js\jquery.min.js"></script>
	<!--<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>  -->
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