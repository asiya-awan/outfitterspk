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
						href="overview-admin.jsp">Overview </a></li>
					
					<li class="nav-item"><a class="nav-link disabled"
						href="OrderAdminControllerServlet">Orders  <span
							class="sr-only">(current)</span></a></li>

				</ul>
			<!--  <form class="form-inline my-2 my-lg-0">
					<input class="form-control mr-sm-2" type="text"
						placeholder="Search">
					<button class="btn btn-shop my-2 my-sm-0" type="submit">Search</button>
				</form>-->	
			</div>
		</div>

	</nav>


	<div class="container-fluid">
		<div class="row  justify-content-center my-5">
			<div class="col-12 col-md-10">
				
				<div class="table-responsive">
					<table class="table table-striped">
						<thead class="thead-dark">
							<tr>
								<th scope="col">Order #</th>
								<th scope="col">Order Date</th>
								<th scope="col">Order Status</th>
								<th scope="col">Shipped Date</th>
								<th scope="col">Action</th>
							</tr>
						</thead>
						<tbody>


							<c:forEach var="tempOrder" items="${ORDERS_ALL}">


								<!-- set up a link for each Product for edit -->
								<c:url var="viewLink" value="OrderAdminControllerServlet">
									<c:param name="command" value="LOAD" />
									<c:param name="orderId" value="${tempOrder.id}" />
								</c:url>
								<c:url var="editLink" value="OrderAdminControllerServlet">
									<c:param name="command" value="LOAD" />
									<c:param name="orderId" value="${tempOrder.id}" />
								</c:url>

								<!-- set up a delete link for each Product -->
								<c:url var="deleteLink" value="OrderAdminControllerServlet">
									<c:param name="command" value="DELETE" />
									<c:param name="orderId" value="${tempOrder.id}" />
								</c:url>

								<tr>
									<th scope="row">${tempOrder.id}</th>
									<td>${tempOrder.orderDate}</td>
									<td>${tempOrder.orderStatus}</td>
									<td>${tempOrder.shippedDate}</td>
									
									<td class="mr-2">
									<a href="${viewLink}" class="btn btn-success mr-1">
											Details </a>
											<a href="${editLink}" class="btn btn-primary mr-1">
											Edit </a> <a href="${deleteLink}" class="btn btn-danger"
										onclick="if (!(confirm('Are you sure you want to delete this product?'))) return false">
											Delete </a></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
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