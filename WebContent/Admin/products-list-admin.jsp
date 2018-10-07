<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page
	import="java.util.*, com.outfitterspk.jdbc.*,com.outfitterspk.models.*"%>
<!DOCTYPE html>
<html class="no-js" lang="en">

<head>
<meta http-equiv="x-ua-compatible" content="ie=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="shortcut icon"
	href="//cdn.shopify.com/s/files/1/2290/7887/t/16/assets/favicon.png?3022115847986725518"
	type="image/x-icon" />

<link rel="stylesheet" href="../resources/css/font-awesome.min.css">
<link rel="stylesheet" href="../resources/css/bootstrap.min.css">
<link rel="stylesheet" href="../resources/css/style.css">
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
				<a class="navbar-brand" href="index.html"> <img
					src="img/logo.png" width="200" class="img-fluid" alt="">
				</a>
			</div>
			<div class="collapse navbar-collapse text-uppercase" id="navbar02">
				<ul class="navbar-nav mr-auto mt-2 mt-md-0">
					<li class="nav-item"><a class="nav-link"
						href="prodcts-list-admin.jsp">Products <span class="sr-only">(current)</span>
					</a></li>
					<li class="nav-item"><a class="nav-link disabled"
						href="adminIndex.html">Overview</a></li>
					<li class="nav-item"><a class="nav-link" href="sale.html">Sale
							<span class="sr-only">(current)</span>
					</a></li>
					<li class="nav-item"><a class="nav-link" href="men-admin.html">Men</a>
					</li>
					<li class="nav-item"><a class="nav-link disabled"
						href="women-admin.jsp">Women</a></li>
					<li class="nav-item"><a class="nav-link disabled"
						href="orders.html">Orders</a></li>

				</ul>
				<form class="form-inline my-2 my-lg-0">
					<input class="form-control mr-sm-2" type="text"
						placeholder="Search">
					<button class="btn btn-shop my-2 my-sm-0" type="submit">Search</button>
				</form>
			</div>
		</div>

	</nav>

	<%
	//get the products from the request
	List<Product> theProducts=
				(List<Product>)request.getAttribute("PRODUCTS_ALL");
	%>

	<div class="container-fluid">
		<div class="row  justify-content-center my-5">
			<div class="col-12 col-md-10">

				<table class="table table-striped">
					<thead class="thead-dark">
						<tr>
							<th scope="col">SKU</th>
							<th scope="col">Title</th>
							<th scope="col">Category</th>
							<th scope="col">Price</th>
							<th></th>
						</tr>
					</thead>
					<tbody>
						<% for(Product tempProduct:theProducts) { %>
						<tr>
							<th scope="row"><%=tempProduct.getSKU() %></th>
							<td><%=tempProduct.getProductName() %></td>
							<td><%=tempProduct.getCategory_id() %></td>
							<td><%=tempProduct.getPrice() %></td>
							<td>
								<button type="button" class="btn btn-primary">Edit</button>
								<button type="button" class="btn btn-danger">Delete</button>
							</td>
						</tr>
						<% } %>
					</tbody>
				</table>




			</div>