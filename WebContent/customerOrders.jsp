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


<title>outfitterspk - My Orders</title>
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
					<li class="nav-item"><a class="nav-link"
						href="JuniorsProductsServlet">Juniors</a></li>

				</ul>
				<ul class="navbar-nav ml-auto">
					<%
						HttpSession session11 = request.getSession(false);

						if (session11.getAttribute("email") != null) {
					%>

					<li class="nav-item"><a href="CustomerLogoutServlet" class="nav-link">
					<i class="fa fa-user-times"></i> Logout</a></li>

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


		<div class="row d-flex mt-3">
			<div class="col-md-8 justify-content-center mx-auto">
				<h4 class="text-uppercase mt-2 text-center">ORDERS</h4>				

				<div class='text-info text-center p-3 lead'>
					<strong>${errorMessage}</strong>
				</div>
				<c:if test="${errorMessage != null}">
					<div class='text-center'>
						<a href='CustomerLoginServlet' class='text-danger'>Login</a>
					</div>
				</c:if>
				<div>
					<c:if test="${errorMessage == null}">
						<div class="row">
							<div class="col-md-12">

								<%
									List<Integer> customerOrderIds = new ArrayList<Integer>();
										customerOrderIds = (List<Integer>) request.getAttribute("ORDER_IDS");
										List<OrderSummary> summary;
										for (Integer n : customerOrderIds) {
											//System.out.println(maps.get(n));

								
												Map<Integer, List<OrderSummary>> maps = new HashMap<>();

												maps = (Map<Integer, List<OrderSummary>>) request.getAttribute("ORDER_MAPS");
												if(maps!=null){
												summary = (List<OrderSummary>) maps.get(n);
												
												//out.println("summary.get(id)");

												System.out.println("Summary Casted JSP PAGE: " + summary.toString());
								%>

<%

if (customerOrderIds == null ||maps==null) {
	%>
	
		<p>You have not placed any orders yet.</p>
	

	<%
		} else {

%>

								<div class="my-3">
								<p class="text-uppercase lead text-info">
										<strong>Order: # <%=n%></strong>
									
										<input type="button" class="btn btn-sm btn-info text-capitalize float-right" id="btnExport" value="Download" onclick="Export()" />
									<p>
									<table class="table" id="tblCustomerOrders">
									
										<thead>
											<tr>
												<th scope="col">Product</th>
												<th scope="col">Color-Size-Quantity</th>
												<th scope="col">Price</th>
												<th scope="col">Order Date</th>
												<th scope="col">Order Status</th>
												<th scope="col">Shipped Date</th>
											</tr>
										</thead>
										<tbody>

											<%
												int total = 0;
															float allTotal = 0;
															for (OrderSummary os : summary) {
																float itemTotal = os.getQuantity() * os.getPrice();
																allTotal += itemTotal;
											%>

											<tr>

												<td><%=os.getProduct()%></td>
												<td><%=os.getColor()%> - <%=os.getSize()%> - <%=os.getQuantity()%></td>
												<td><%=os.getPrice()%></td>
												<td><%=os.getOrderDate()%></td>
												<td><%=os.getOrderStatus()%></td>
												<%
													if (os.getShippedDate() == null) {
												%>
												<td class="text-danger">Not shipped</td>
												<%
													} else {
												%>
												<td><%=os.getShippedDate()%></td>
												<%
													}
												%>



											</tr>
											<%
												}
											%>


											<tr>
												<th scope="row" colspan="5">Shipping:</th>
												<td>FREE</td>
											</tr>
											<tr>
												<th scope="row" colspan="5">Order Total:</th>
												<td><strong>$<%=allTotal%></strong></td>
											</tr>
										</tbody>
									</table>
								</div>
								<hr />
								<%
		} }
										}
								%>

							</div>
						</div>
						<!-- end of order details -->


					</c:if>
				</div>
				<!-- Account Details -->

			</div>
		</div>
	</div>

	<!--MAIN FOOTER -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.22/pdfmake.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/0.4.1/html2canvas.min.js"></script>
    <script type="text/javascript">
        function Export() {
            html2canvas(document.getElementById("tblCustomerOrders"), {
                onrendered: function (canvas) {
                    var data = canvas.toDataURL();
                    var docDefinition = {
                        content: [{
                            image: data,
                            width: 500
                        }]
                    };
                    pdfMake.createPdf(docDefinition).download("AllOrders.pdf");
                }
            });
        }
    </script>


	<footer id="main-footer"
		class="text-center text-white bg-dark py-4 my-3">
		<div class="container-fluid">
			<div class="row">
				<div class="col">Copyright &copy; 2018 Outfitters</div>
			</div>
		</div>

	</footer>


</body>
</html>