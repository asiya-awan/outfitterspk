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
						href="/outfitterspk/ProductAdminControllerServlet">Products <span
							class="sr-only">(current)</span>
					</a></li>
					<li class="nav-item"><a class="nav-link disabled"
						href="overview-admin.jsp">Overview</a></li>
					
					<li class="nav-item"><a class="nav-link disabled"
						href="OrderAdminControllerServlet">Orders</a></li>

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

				<form action="/outfitterspk/ProductAdminControllerServlet"
					method="get">
					<input type="hidden" name="command" value="EDIT" /> <input
						type="hidden" name="productId" value="${THE_PRODUCT.id}" />
					<div class="form-group row">
						<label for="inputTitle3" class="col-sm-2 col-form-label">Title
							*</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="inputTitle3"
								name="pName" value="${THE_PRODUCT.productName}"
								placeholder="Title" required>
						</div>
					</div>

					<div class="form-group row">
						<label for="inputSKU3" class="col-sm-2 col-form-label">SKU
							*</label>
						<div class="col-sm-10">
							<input type="number" class="form-control" id="inputSKU3"
								name="pSKU" value="${THE_PRODUCT.SKU}" placeholder="SKU"
								required>
						</div>
					</div>

					<div class="form-group row">
						<label for="inputDescription3" class="col-sm-2 col-form-label">Description</label>
						<div class="col-sm-10">
							<textarea rows="4" class="form-control" id="textareaDescription3"
								name="pDescription" placeholder="Description">${fn:trim(THE_PRODUCT.description)}</textarea>
						</div>
					</div>
					<div class="form-group row">
						<label for="inputSpecs3" class="col-sm-2 col-form-label">Specification</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="inputSpecs3"
								name="pSpecs" value="${THE_PRODUCT.specs}"
								placeholder="Specificaiton">
						</div>
					</div>


					<div class="form-group row">

						<label for="inputCategory" class="col-sm-2 col-form-label">Category
							*</label>
						<div class="col-sm-4">

							<select id="inputCategory" class="form-control" name="pCategory"
								required>

								<c:if test="${THE_PRODUCT.category_id==1}">
									<option value="Women">Women</option>
									<option value="Men" selected>Men</option>
									<option value="Junior">Junior</option>
								</c:if>
								<c:if test="${THE_PRODUCT.category_id==2}">
									<option value="Men">Men</option>
									<option value="Women" selected>Women</option>
									<option value="Junior">Junior</option>
								</c:if>
								<c:if test="${THE_PRODUCT.category_id==3}">
									<option value="Women">Women</option>
									<option value="Men">Men</option>
									<option value="Junior" selected>Junior</option>
								</c:if>

							</select>
						</div>

						<label for="inputSubCategory" class="col-sm-2 col-form-label">SubCategory
							*</label>
						<div class="col-sm-4">

							<select id="inputSubCategory" class="form-control"
								name="pSubcategory" required>
								<c:if test="${THE_PRODUCT.subcategory_id==1}">
									<option value="Shirts" selected>Shirts</option>
									<option value="T-Shirts">T-Shirts</option>
									<option value="Denim">Denim</option>
									<option value="Non-Denim">Non-Denim</option>
								</c:if>
								<c:if test="${THE_PRODUCT.subcategory_id==2}">
									<option value="Shirts">Shirts</option>
									<option value="T-Shirts" selected>T-Shirts</option>
									<option value="Denim">Denim</option>
									<option value="Non-Denim">Non-Denim</option>
								</c:if>
								<c:if test="${THE_PRODUCT.subcategory_id==3}">
									<option value="Shirts">Shirts</option>
									<option value="T-Shirts">T-Shirts</option>
									<option value="Denim" selected>Denim</option>
									<option value="Non-Denim">Non-Denim</option>
								</c:if>
								<c:if test="${THE_PRODUCT.subcategory_id==4}">
									<option value="Shirts">Shirts</option>
									<option value="T-Shirts">T-Shirts</option>
									<option value="Denim">Denim</option>
									<option value="Non-Denim" selected>Non-Denim</option>
								</c:if>

							</select>

						</div>
					</div>

					<div class="form-group row">
						<label for="inputPicturesUrl3" class="col-sm-2 col-form-label">Pictures
							Url *</label>
						<div class="col-sm-10">
							<textarea rows="4" class="form-control" id="textareaPicturesUrl3"
								name="pPicturesUrl" }
       						placeholder="PicturesUrl"
								required>${fn:trim(THE_PRODUCT.picturesUrl)}</textarea>

							<p>
								<small id="passwordHelpBlock" class="form-text text-muted">
									Separate URLs using semicolon ( ; ) </small>
							</p>
						</div>
					</div>

					<div class="form-group row">
						<label for="inputPrice3" class="col-sm-2 col-form-label">Price
							*</label>
						<div class="col-sm-10">
							<input type="number" class="form-control" id="inputPrice3"
								name="pPrice" value="${THE_PRODUCT.price}" placeholder="Price"
								required>
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
						<a href="/outfitterspk/ProductAdminControllerServlet"> Back to
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