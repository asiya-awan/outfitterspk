
<jsp:include page="header.jsp" />
<!-- Index page -->



<!-- SHOWCASE IMAGE-->
<section id="showcase p-0 m-0">
	<div id="myCarousel" class="container-fluid p-0 m-0">
		<div class="col img1">
			<a href=""><img src="resources/img/top-banner.jpg" width="100%"
				class="img-fluid" alt=""></a>
		</div>
	</div>
</section>

<!-- Collection 1-->
<div class="container-fluid">
	<div class="row">
		<div class="col-md-10 offset-md-2 p-0 m-0 mx-auto">
			<section id="collection1" class="text-center my-3 collection">
				<div class="container-fluid">
					<div class="row p-0 m-0">
						<div class="col-md-4 p-2 m-0">
							<div class="card">
								<a href="MenProductsServlet"><img src="resources/img/1Men.jpg"
									class="card-img-top img-fluid" alt="Shop Men"></a>
								<div class="card-footer text-uppercase">
									<h5>Men</h5>
									<p class="text-muted">first choice</p>
									<a href="MenProductsServlet" class="btn bg-white btn-shop text-muted text-uppercase">
										shop now <i class="fa fa-caret-right" aria-hidden="true"></i>
									</a> 
								</div>
							</div>
						</div>
						<div class="col-md-4 p-2 m-0">
							<div class="card">
								<a href="WomenProductsServlet"><img src="resources/img/2Women.jpg"
									class="card-img-top img-fluid" alt="Shop Women"> </a>
								<div class="card-footer text-uppercase">
									<h5>women</h5>
									<p class="text-muted">Be Brave, Be Bold!</p>
									<a href="WomenProductsServlet" class="btn bg-white btn-shop text-muted text-uppercase">
										shop now <i class="fa fa-caret-right" aria-hidden="true"></i>
									</a>
								</div>
							</div>
						</div>
						<div class="col-md-4 p-2 m-0">
							<div class="card">
								<a href="JuniorsProductsServlet"> <img src="resources/img/3Juniors.jpg"
									class="card-img-top img-fluid" alt="Shop Juniors"></a>
								<div class="card-footer text-uppercase">
									<h5>Juniors</h5>
									<p class="text-muted">Double the fun</p>
									<a href="JuniorProductsServlet" class="btn bg-white text-muted btn-shop text-uppercase">
										shop now <i class="fa fa-caret-right" aria-hidden="true"></i>
									</a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</section>
		</div>
	</div>
</div>

<!-- BANNERS 2 -->
<div class="container-fluid">
	<div class="row">
		<div class="col-md-10 offset-md-2 mx-auto">
			<a href="ProductCustomerServlet"><img src="resources/img/banner-links.jpg"
				width="100%" alt="" class="img-fluid"> </a>
		</div>
	</div>
	<div class="row mt-4">
		<div class="col-md-10 offset-md-2 mx-auto">
			<a href="ProductCustomerServlet"> <img src="resources/img/middle-banner.jpg"
				width="100%" alt="" class="img-fluid"></a>
		</div>
	</div>
</div>

<!-- COLLECTION 2 -->

<!-- NEWSLETTER SECTION-->

<section id="newsletter" class="text-center bg-outfitter mt-4 text-white p-5">
	<div class="container">
		<div class="row">
			<div class="col">
				<h1>Signup For Our Newsletter</h1>
				<p>Lorem ipsum dolor sit amet consectetur adipisicing elit.
					Dolores natus ut pariatur eius vero quas voluptas ducimus nam
					placeat blanditiis ratione modi illum, maxime adipisci, corporis
					iste quis excepturi? Animi!</p>
				<form action="" class="form-inline justify-content-center">
					<label for="name" class="sr-only">Name</label> <input type="text"
						name="name" id="name" class="form-control mb-2 mr-sm-2 mb-sm-0"
						placeholder="Enter Name"> <label for="email"
						class="sr-only">Email</label> <input type="email" name="email"
						id="email" class="form-control mb-2 mr-sm-2 mb-sm-0"
						placeholder="Enter Email">
					<button type="submit" class="btn btn-shop-inverse">Submit</button>
				</form>
			</div>
		</div>
	</div>
</section>



<jsp:include page="footer.jsp" />

