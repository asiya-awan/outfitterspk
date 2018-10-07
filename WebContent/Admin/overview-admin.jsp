<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ page
	import="java.util.*, com.outfitterspk.jdbc.*,com.outfitterspk.models.*"%>
<!DOCTYPE html>
<html class="no-js" lang="en">

<head>
<meta http-equiv="x-ua-compatible" content="ie=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet" href="../resources/css/font-awesome.min.css">
<link rel="stylesheet" href="../resources/css/bootstrap.css">
<link rel="stylesheet" href="../resources/css/style.css">
<title>Outfitters</title>
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
					src="../resources/img/logo.png" width="200" class="img-fluid"
					alt="">
				</a>
			</div>
			<div class="collapse navbar-collapse text-uppercase" id="navbar02">
				<ul class="navbar-nav mr-auto mt-2 mt-md-0">
					<li class="nav-item"><a class="nav-link"
						href="prodcts-admin.jsp">Products <span class="sr-only">(current)</span>
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

	<div class="container-fluid">
		<div class="row my-md-4 mt-5 justify-content-center">
			<div class="col-12 col-md-10">
				<div class="card-deck">

					<div class="card text-white bg-primary" style="width: 18rem;">
						<div class="card-body">
							<h3 class="card-title my-md-4 text-center">All Products</h3>
							<div class="align-middle text-center">
								<span>Total Products: </span> <a href="#"
									class="card-link text-white">Another link</a>
							</div>
						</div>
					</div>
					<div class="card bg-info" style="width: 18rem;">
						<div class="card-body text-center align-center">
							<h3 class="card-title my-md-4 text-center">Women</h3>
							<div class="align-middle text-center">
								<span>Total Products: </span> <a href="#" class="card-link">Another
									link</a>
							</div>
						</div>
					</div>

				</div>
			</div>
		</div>
		<div class="row my-md-4 justify-content-center">
			<div class="col-12 col-md-10">
				<div class="card-deck my-md-10">

					<div class="card bg-success text-white" style="width: 18rem;">
						<div class="card-body  text-center align-center">
							<h3 class="card-title my-md-4 text-center">Men</h3>
							<div class="align-middle text-center">
								<span>Total Products: </span> <a href="#"
									class="card-link text-white">Another link</a>
							</div>
						</div>
					</div>
					<div class="card bg-warning" style="width: 18rem;">
						<div class="card-body  text-center align-center">
							<h3 class="card-title my-md-4 text-center">Orders</h3>
							<div class="align-middle text-center">
								<span>Total Products: </span> <a href="#" class="card-link">Another
									link</a>
							</div>
						</div>
					</div>


				</div>

			</div>

		</div>

	</div>