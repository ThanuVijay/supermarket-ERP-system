<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="supermarket.product.service.Service"%>
<%@ page import="supermarket.product.model.Product"%>
<%@ page import="java.util.*"%>
<%
	HttpSession sess = request.getSession(false);
	if (sess.getAttribute("name") == null) {
		response.sendRedirect("login.jsp");
	}
	%>
<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="IE=edge">

<title>Select Product</title>

<!-- Bootstrap CSS CDN -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css"
	integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4"
	crossorigin="anonymous">
<!-- Our Custom CSS -->
<link rel="stylesheet" href="style.css">

<!-- Font Awesome JS -->
<script defer
	src="https://use.fontawesome.com/releases/v5.0.13/js/solid.js"
	integrity="sha384-tzzSw1/Vo+0N5UhStP3bvwWPq+uvzCMfrN1fEFe+xBmv1C/AtVX5K0uZtmcHitFZ"
	crossorigin="anonymous"></script>
<script defer
	src="https://use.fontawesome.com/releases/v5.0.13/js/fontawesome.js"
	integrity="sha384-6OIrr52G08NpOFSZdxxz1xdNSndlD4vdcf/q2myIUVO0VsqaGHJsB0RaBE01VTOY"
	crossorigin="anonymous"></script>
</head>

<body>
	<!--Modal-->
	<div class="modal fade" id="exampleModalCenter" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalLongTitle"
		aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered modal-sm"
			role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLongTitle">Add</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<form method="POST" action="NewDiscount">
				<div class="modal-body">
					<div class="container">
						<div class="row align-items-center">
							<div class="col-sm">
								<img
									src="https://bootstrapious.com/i/snippets/sn-gallery/img-2.jpg"
									alt="" class="modalimg">
							</div>
							<div class="col-5">
								<label for="formGroupExampleInput">Quantity</label> <input
									type="number" class="form-control" name="quantity" required> <label
									for="formGroupExampleInput">Discount</label> <input
									type="number" class="form-control" name="discount" required>
							</div>
						</div>
					</div>
				</div>
				<div class="modal-footer">
				    <input type="hidden" value="" name="prodID">
				    <input type="hidden" value="" name="prodName">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>
					<button type="submit" class="btn btn-primary">Save changes</button>
				</div>
				</form>
			</div>
		</div>
	</div>
	<!--Modal-->
	<div class="wrapper">
		<!-- Sidebar  -->
		<nav id="sidebar">
			<ul class="list-unstyled components">
				<a href="home.jsp"><p><%= session.getAttribute("name") %></p></a>
				<li><a href="dashboard.jsp"><i class="fas fa-chart-line"></i> Dashboard</a></li>
				<li><a href="billing.jsp"><i class="fas fa-calculator"></i> Billing</a></li>
				<li><a href="distributor.jsp"> <i class="fas fa-address-card"></i> Distributors</a></li>
				<li><a href="employee.jsp"><i class="fas fa-user-tie"></i> Employee</a></li>
				<li><a href="discount.jsp"><i class="fas fa-percent"></i> Discounts</a></li>
				<li><a href="purchase.jsp"><i class="fas fa-money-bill"></i> Purchase</a></li>
				<li><a href="order.jsp"><i class="fas fa-truck"></i> Orders</a></li>
				<li><a href="stock.jsp"><i class="fas fa-boxes"></i> Stock</a></li>
				<li><a href="sales.jsp"><i class="fas fa-balance-scale"></i> Sales</a></li>
				<li><a href="product.jsp"><i class="fas fa-archive"></i> Products</a></li>
				<li><a href="store.jsp"><i class="fas fa-building"></i> Store</a></li>
				<li><a href="payments.jsp"><i class="fas fa-money-bill"></i> Payments</a></li>
				<li><a href="endOfDay.jsp"><i class="fas fa-clock"></i> End of day</a></li>
			</ul>
		</nav>
		<!-- Page Content  -->
		<div id="content">
			<nav class="navbar navbar-expand-lg navbar-light bg-light">
				<div class="container-fluid">

					<button type="button" id="sidebarCollapse" class="btn btn-info">
						<i class="fas fa-align-left"></i> <span>Toggle Sidebar</span>
					</button>
					<button class="btn btn-dark d-inline-block d-lg-none ml-auto"
						type="button" data-toggle="collapse"
						data-target="#navbarSupportedContent"
						aria-controls="navbarSupportedContent" aria-expanded="false"
						aria-label="Toggle navigation">
						<i class="fas fa-align-justify"></i>
					</button>
					<form method="POST" action="SearchProductForDiscount" class="form-inline">
						<div class="form-group mx-sm-3">
							<input type="text" class="form-control" id="inputPassword2"
								placeholder="Product name" name="search" required>
						</div>
						<button type="submit" class="btn btn-primary">Search</button>
					</form>
				</div>
			</nav>
			<div class="container-fluid">
				<div class="px-lg-5">

					<!-- For demo purpose -->

					<!-- End -->

					<div class="row">
						<%
						if (request.getAttribute("searchResultDiscount") != null) {
							ArrayList<Product> result = (ArrayList<Product>) request.getAttribute("searchResultDiscount");
							for (Product p : result) {
								String b64img = p.getImage();
						%>
						<!-- Gallery item -->
						<div class="col-xl-3 col-lg-4 col-md-6 mb-4">
							<div class="bg-white rounded shadow-sm">
								<img src="data:image/jpg;base64,<%=b64img%>" alt=""
									class="img-fluid card-img-top">
								<div class="p-4">
									<h5>
										<a href="#exampleModalCenter" data-toggle="modal"
											data-target="#exampleModalCenter"
											data-product-id=<%=p.getProductID()%>
											data-product-name=<%=p.getName()%>
											data-product-img=<%="data:image/jpg;base64," + b64img%>
											class="text-dark"><%=p.getName()%></a>
									</h5>
									<p class="small text-muted mb-0"><%=p.getPrice()%></p>
									<p class="small text-muted mb-0"><%=p.getDescription()%></p>
									<div class="d-flex align-items-center justify-content-between">
									</div>
								</div>
							</div>
						</div>
						<!-- End -->
						<%
						}
						} else {
						ArrayList<Product> products = Service.selectProducts();
						for (Product p : products) {
						String b64img = p.getImage();
						%>
						<!-- Gallery item -->
						<div class="col-xl-3 col-lg-4 col-md-6 mb-4">
							<div class="bg-white rounded shadow-sm">
								<img src="data:image/jpg;base64,<%=b64img%>" alt=""
									class="img-fluid card-img-top">
								<div class="p-4">
									<h5>
										<a href="#exampleModalCenter" data-toggle="modal"
											data-target="#exampleModalCenter"
											data-product-id=<%=p.getProductID()%>
											data-product-name=<%=p.getName()%>
											data-product-img=<%="data:image/jpg;base64," + b64img%>
											class="text-dark"><%=p.getName()%></a>
									</h5>
									<p class="small text-muted mb-0"><%=p.getPrice()%></p>
									<p class="small text-muted mb-0"><%=p.getDescription()%></p>
									<div class="d-flex align-items-center justify-content-between">
									</div>
								</div>
							</div>
						</div>
						<!-- End -->
						<%
						}
						}
						%>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- jQuery CDN - Slim version (=without AJAX) -->
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
		integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
		crossorigin="anonymous"></script>
	<!-- Popper.JS -->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"
		integrity="sha384-cs/chFZiN24E4KMATLdqdvsezGxaGsi4hLGOzlXwp5UZB1LY//20VyM2taTB4QvJ"
		crossorigin="anonymous"></script>
	<!-- Bootstrap JS -->
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"
		integrity="sha384-uefMccjFJAIv6A+rW+L4AHf99KvxDjWSu1z9VI8SKNVmz4sk7buKt/6v9KI65qnm"
		crossorigin="anonymous"></script>

	<script type="text/javascript">
		$(document).ready(function() {
			$('#sidebarCollapse').on('click', function() {
				$('#sidebar').toggleClass('active');
			});
		});
		$('#exampleModalCenter').on('show.bs.modal', function(e) {

			//get data-id attribute of the clicked element
			var prodID = $(e.relatedTarget).data('product-id');
			var prodName = $(e.relatedTarget).data('product-name');
			var prodImg = $(e.relatedTarget).data('product-img');
			//populate the textbox
			$(e.currentTarget).find('input[name="prodID"]').val(prodID);
			$(e.currentTarget).find('input[name="prodName"]').val(prodName);
			$(e.currentTarget).find('img').attr('src',
					prodImg);

		});
	</script>
</body>

</html>