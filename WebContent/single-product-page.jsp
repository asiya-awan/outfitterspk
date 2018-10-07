
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
<style>
#exampleModalLong {
	font-size: 11px;
}
</style>
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

	<!-- //Single Product Page -->
	<div class="container-fluid">
		<div class="row">
			<div class="col-lg-10 offset-lg-2 p-0 m-0 mx-auto">
				<section id="sale" class="my-3 collection">
					<div class="container-fluid">

						<div class="row ">
							<!-- Product image-->
							<div
								class="col-lg-4 col-md-12 col-sm-12 text-md-center slef-align-center m-0 bg-light">

								<!-- <img class="xzoom img-fluid col-md-12 col-sm-12" src="resources/img/gallery/preview/01_b_car.jpg" xoriginal="resources/img/gallery/original/01_b_car.jpgg"
                                />  -->
								<img class="xzoom img-fluid col-md-12 col-sm-12"
									src="${THE_PRODUCT.picturesUrl}"
									xoriginal="${THE_PRODUCT.picturesUrl}" />

								<div class="xzoom-thumbs mt-3" style="display: none;">
									<a href="resources/img/gallery/original/01_b_car.jpg"> <img
										class="xzoom-gallery" width="80"
										src="resources/img/gallery/thumbs/01_b_car.jpg"
										xpreview="resources/img/gallery/preview/01_b_car.jpg">
									</a> <a href="resources/img/gallery/original/02_o_car.jpg"> <img
										class="xzoom-gallery" width="80"
										src="resources/img/gallery/thumbs/02_o_car.jpg"
										xpreview="resources/img/gallery/preview/02_o_car.jpg">
									</a> <a href="resources/img/gallery/original/03_r_car.jpg"> <img
										class="xzoom-gallery" width="80"
										src="resources/img/gallery/thumbs/03_r_car.jpg"
										xpreview="resources/img/gallery/preview/03_r_car.jpg">
									</a> <a href="resources/img/gallery/original/04_g_car.jpg"> <img
										class="xzoom-gallery" width="80"
										src="resources/img/gallery/thumbs/04_g_car.jpg"
										xpreview="resources/img/gallery/preview/04_g_car.jpg">
									</a>
								</div>
							</div>
							<!-- Product detail -->
							<div class="col-lg-8 my-4">
								<div class="product-detail">
									<div class="short-produt-info px-4">
										<div class="product-name">
											<h5>${THE_PRODUCT.productName}</h5>
										</div>
										<div class="sku">
											<span class="sku-label">SKU:</span> <span class="sku-value">${THE_PRODUCT.SKU}
											</span>
										</div>

										<div class="current-price">
											<span class="current-price-label">Price: </span> <span
												class="current-price-value">${THE_PRODUCT.price} </span>
										</div>
									</div>

									<div class="more-detail pl-4">

										<form action="/outfitterspk//CartServlet" method="get">

											<input type="hidden" name="command" value="ADDTOCART" /> <input
												type="hidden" name="productId" value="${THE_PRODUCT.id}" />
											<input type="hidden" name="productName"
												value="${THE_PRODUCT.productName}" /> <input type="hidden"
												name="picturesUrl" value="${THE_PRODUCT.picturesUrl}" /> <input
												type="hidden" name="price" value="${THE_PRODUCT.price}" />


											<div class="form-group row">
												<label for="inputEmail3" class="col-sm-2 col-form-label">Size</label>
												<div class="col-sm-3">
													<select class="custom-select form-control" name="size"
														required>

														<c:forEach var="size" items="${THE_PRODUCT_SIZES}">

															<option value="${size}">${size}</option>

														</c:forEach>
													</select>
												</div>
											</div>
											<div class="form-group row">
												<label for="color" class="col-sm-2 col-form-label">Color</label>
												<div class="col-sm-3">
													<select class="custom-select" class="form-control"
														name="color" required>

														<c:forEach var="color" items="${THE_PRODUCT_COLORS}">

															<option value="${color}">${color}</option>
														</c:forEach>
													</select>
												</div>
											</div>
											<div class="form-group row">
												<label for="inputPassword3" class="col-sm-2 col-form-label">Quantity</label>
												<div class="col-sm-3">
													<input type="number" class="form-control" name="quantity"
														required>
												</div>
											</div>


											<!-- 
	                                       	<span class="btn btn-dark text-white mx-2">   
	                                           		<i class="fa fa-shopping-bag" aria-hidden="true"></i> <input type="submit" class="text-white btn btn-dark btn-outline-dark p-0 m-0" value="Add to Cart" />
	                                           </span> 
	                                       
	                                        -->
											<div id="btns">
												<input type="submit" class="text-white btn btn-dark mx-2"
													value="Add to cart" />

												<!-- Button trigger modal -->
												<button type="button" class="btn btn-dark text-white mx-2"
													data-toggle="modal" data-target="#exampleModalLong">
													Size Chart</button>
											</div>
										</form>
										<!-- Modal -->
										<div class="modal fade" id="exampleModalLong" tabindex="-1"
											role="dialog" aria-labelledby="exampleModalLongTitle"
											aria-hidden="true">


											<div class="modal-dialog modal-lg" role="document">
												<div class="modal-content">
													<div class="modal-header">
														<h5 class="modal-title" id="exampleModalLongTitle">Size
															Chart</h5>
														<button type="button" class="close" data-dismiss="modal"
															aria-label="Close">
															<span aria-hidden="true">&times;</span>
														</button>
													</div>
													<div class="modal-body">
														<div class="row">
															<div class="col-xs-12 col-sm-8">
																<div class="table-responsive">
																	<table class="table table-bordered">
																		<thead>
																			<tr bgcolor="#000">
																				<th style="color: #fff">Tops</th>
																				<th style="color: #fff">X-Small</th>
																				<th style="color: #fff">Small</th>
																				<th style="color: #fff">Medium</th>
																				<th style="color: #fff">Large</th>
																				<th style="color: #fff">X-Large</th>
																			</tr>
																		</thead>
																		<tbody>
																			<tr>
																				<td>Shoulder</td>
																				<td>14 - 14 �</td>
																				<td>14 � - 15 �</td>
																				<td>15 � - 16 �</td>
																				<td>16 � - 17</td>
																				<td></td>
																			</tr>
																			<tr>
																				<td>Chest</td>
																				<td>32 - 34</td>
																				<td>34 - 36</td>
																				<td>36 - 38</td>
																				<td>38 - 40</td>
																				<td></td>
																			</tr>
																			<tr>
																				<td>Hips</td>
																				<td>35 - 37</td>
																				<td>37 - 39</td>
																				<td>39 - 41</td>
																				<td>41 - 43</td>
																				<td></td>
																			</tr>
																			<tr bgcolor="#000" style="color: #fff">
																				<td>Bottoms</td>
																				<td>26</td>
																				<td>28</td>
																				<td>30</td>
																				<td>32</td>
																				<td>34</td>
																			</tr>
																			<tr>
																				<td>Waist</td>
																				<td>26 - 28</td>
																				<td>28 - 30</td>
																				<td>30 - 31 �</td>
																				<td>31 � - 33</td>
																				<td>33 - 34 �</td>
																			</tr>
																			<tr>
																				<td>Hips</td>
																				<td>32 � -34</td>
																				<td>34- 35 �</td>
																				<td>35 � - 37</td>
																				<td>37 - 38 �</td>
																				<td>38 � - 40</td>
																			</tr>
																			<tr>
																				<td>Inseam</td>
																				<td>28 �</td>
																				<td>28 �</td>
																				<td>28 �</td>
																				<td>28 �</td>
																				<td>28 �</td>
																			</tr>
																			<tr bgcolor="#000" style="color: #fff">
																				<td>Belts</td>
																				<td></td>
																				<td>32</td>
																				<td>34</td>
																				<td>36</td>
																				<td></td>
																			</tr>
																			<tr>
																				<td colspan="6">* The length is measured from
																					the buckle to the 3rd belt hole</td>
																			</tr>
																			<tr bgcolor="#000" style="color: #fff">
																				<td colspan="6">Footwear - European Size</td>

																			</tr>
																			<tr>
																				<td>36</td>
																				<td>37</td>
																				<td>38</td>
																				<td>39</td>
																				<td>40</td>
																				<td>41</td>
																			</tr>
																			<tr bgcolor="#000" style="color: #fff">
																				<td colspan="6">Footwear - Pakistan Sizes</td>

																			</tr>
																			<tr>
																				<td>6.5</td>
																				<td>7</td>
																				<td>8</td>
																				<td>9</td>
																				<td>10</td>
																				<td>11</td>
																			</tr>
																		</tbody>
																	</table>
																</div>
															</div>
															<div class="col-xs-12 col-sm-4">
																<img
																	src="http://cdn.shopify.com/s/files/1/2290/7887/t/16/assets/women-size.jpg?6303297498494211770"
																	alt="">

															</div>
														</div>

													</div>
													<!-- modal body -->
													<div class="modal-footer">
														<button type="button" class="btn btn-dark text-white"
															data-dismiss="modal">Close</button>
													</div>
												</div>
												<!-- end of modal content -->
											</div>
										</div>
										<!-- end of Modal -->



										<div class="description p-3">
											<p>${THE_PRODUCT.specs}</p>
										</div>

										<div class="table policy table-hover table-responsive">
											<table>
												<tr>
													<th class="bg-outfitter text-white text-center">
														Delivery & Returns</th>
													<td>All orders would take maximum 5-7 working days for
														delivery.</td>
												</tr>
												<tr>
													<th class="bg-outfitter text-white text-center">Care
														Instructions</th>
													<td>Warm gentle machine wash with like colors. Using
														mild detergent. Turn inside out. Do not bleach, rub or
														wring. Tumble dry low. Warm iron on reverse. Dry
														cleanable.</td>
												</tr>
											</table>
										</div>

										<div
											class="share d-flex flex-row justify-content-between mt-md-3 py-4">
											<div class="facebook">
												<i class="fa fa-facebook" aria-hidden="true"></i> <span
													class="shareTitle"> Share on Facebook</span>
											</div>
											<div class="pinterest">
												<i class="fa fa-pinterest-p" aria-hidden="true"></i> <span
													class="shareTitle"> Pin this Item</span>
											</div>
											<div class="twitter">
												<i class="fa fa-twitter" aria-hidden="true"></i> <span
													class="shareTitle"> Twitt this Item</span>
											</div>
										</div>


									</div>
									<!-- end of more detail -->

								</div>
							</div>

						</div>
					</div>


				</section>
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


	<script src="resources/js/jquery.min.js"></script>

	<script src="resoureces/js/popper.min.js"></script>
	<script src="resources/js/bootstrap.min.js"></script>
	<script src="resources/js/rangeslider.js"></script>


	<!-- XZOOM JQUERY PLUGIN  -->
	<script type="text/javascript" src="resources/js/xzoom.min.js"></script>

	<script>
        /* calling script */
        $(".xzoom, .xzoom-gallery").xzoom({
            tint: '#333',
            Xoffset: 15
        });

        /*   */
        $('.port-item').click(function () {
            $('.collapse').collapse('hide');
        });
    </script>

</body>

</html>