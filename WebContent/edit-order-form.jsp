<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page
	import="java.util.*, com.outfitterspk.jdbc.*,com.outfitterspk.models.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html class="no-js" lang="en">

<head>
<meta http-equiv="x-ua-compatible" content="ie=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="shortcut icon"
	href="//cdn.shopify.com/s/files/1/2290/7887/t/16/assets/favicon.png?3022115847986725518"
	type="image/x-icon" />

<link rel="stylesheet" href="resources/css/font-awesome.min.css">
<link rel="stylesheet" href="resources/css/bootstrap.min.css">
<link rel="stylesheet" href="resources/css/style.css">
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
				<a class="navbar-brand" href="overview-admin.jsp"> <img
					src="resources/img/logo.png" width="200" class="img-fluid" alt="">
				</a>
			</div>
			<div class="collapse navbar-collapse text-uppercase" id="navbar02">
				
				 	<ul class="navbar-nav mr-auto mt-2 mt-md-0">
					<li class="nav-item"><a class="nav-link"
						href="/outfitterspk/ProductAdminControllerServlet">Products 
					</a></li>
					<li class="nav-item"><a class="nav-link disabled"
						href="overview-admin.jsp">Overview</a></li>
					
					<li class="nav-item"><a class="nav-link disabled"
						href="OrderAdminControllerServlet">Orders <span
							class="sr-only">(current)</span></a></li>

				</ul>
				
				<!--  <form class="form-inline my-2 my-lg-0">
					<input class="form-control mr-sm-2" type="text"
						placeholder="Search">
					<button class="btn btn-shop my-2 my-sm-0" type="submit">Search</button>
				</form> -->
			</div>
		</div>

	</nav>


	<div class="container-fluid">
		<div class="row  justify-content-center my-5">
			<div class="col-12 col-md-10">

				<!--Form -->
				
				<h5 class="text-info mb-4">Edit Order # ${THE_ORDER.id} of CustomerId # ${THE_ORDER.customerId}</h5>
				 </span> 
				<form action="/outfitterspk/OrderAdminControllerServlet"
					method="get">
					<input type="hidden" name="command" value="EDIT" /> <input
						type="hidden" name="orderId" value="${THE_ORDER.id}" />
						<input type="hidden" name="customerId" value="${THE_ORDER.customerId}" />
						
					
					<div class="form-group row">
						<label for="inputTitle3" class="col-sm-2 col-form-label">Order Date *
							</label>
						<div class="col-sm-10">
							<input type="date" class="form-control" id="inputTitle3"
								name="oOrderDate" value="${THE_ORDER.orderDate}"
								placeholder="OrderDate" required>
						</div>
					</div>

					<div class="form-group row">
						<label for="inputSKU3" class="col-sm-2 col-form-label">Required Date *
							</label>
						<div class="col-sm-10">
							<input type="date" class="form-control" id="inputSKU3"
								name="requiredDate" value="${THE_ORDER.requiredDate}" placeholder="Required Date"
								required>
						</div>
					</div>

					<div class="form-group row">
						<label for="inputDescription3" class="col-sm-2 col-form-label">Shipped Date *</label>
						<div class="col-sm-10">
							<input type="date" class="form-control" id="shippedDateId"
								name="shippedDate" placeholder="Shipped Date" value="${THE_ORDER.shippedDate}"></input>
						</div>
					</div>
					<div class="form-group row">
						<label for="inputSpecs3" class="col-sm-2 col-form-label">Ship Via *</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="inputSpecs3"
								name="shipVia" value="${THE_ORDER.shipVia}"
								placeholder="Ship Via">
						</div>
					</div>
	
					<div class="form-group row">

						<label for="inputCategory" class="col-sm-2 col-form-label">Order Status *
							</label>
						<div class="col-sm-4">

							<select id="inputCategory" class="form-control" name="orderStatus"
								required>

								<c:if test="${THE_ORDER.orderStatus=='Building'}">
									<option value="Building" selected>Building</option>
									<option value="Shipped">Shipped</option>
									<option value="Completed">Completed</option>
								</c:if>
								<c:if test="${THE_ORDER.orderStatus=='Shipped'}">
									<option value="Building">Building</option>
									<option value="Shipped" selected>Shipped</option>
									<option value="Completed">Completed</option>
								</c:if>
								<c:if test="${THE_ORDER.orderStatus=='Completed'}">
									<option value="Building">Building</option>
									<option value="Shipped">Shipped</option>
									<option value="Completed"  selected>Completed</option>
								</c:if>

							</select>
						</div>

						</div>
						
					<div class="form-group row ">
						<div class="col-sm-2"></div>
						<div class="col-sm-10">
							<input type="submit" class="btn btn-primary px-5 " value="Save">
							<button type="reset" class="btn btn-secondary px-5 ">
								Cancel</button>
					</div>

					</div>

					<div class="my-4">
						<a href="/outfitterspk/OrderAdminControllerServlet"> Back to
							List </a>
					</div>

				</form>

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

</body>
</html>