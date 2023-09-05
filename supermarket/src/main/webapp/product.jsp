<%@page import="supermarket.Constants"%>
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

<title>Product</title>

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
	<div class="modal fade" id="exampleModalCenterForAdd" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalLongTitle"
		aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered modal-lg"
			role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLongTitle">Add</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<form method="POST" action="NewProduct"
					enctype='multipart/form-data'>
					<div class="modal-body">
						<div class="container">
							<div class="row">
								<div class="col-sm">
									<div class="mb-3">
										<img id="blah" src="images/thumbnail.jpg" alt="your image"
											class="img-fluid" /> <input type='file' name="image"
											onchange="readURL(this);" />
									</div>
								</div>
								<div class="col-sm">
									<div class="form-group">
										<label for="formGroupExampleInput">Product name</label> <input
											type="text" name="name" class="form-control"
											id="formGroupExampleInput" placeholder="Product name"
											required>
									</div>
									<div class="form-group">
										<label for="formGroupExampleInput2">Price</label> <input
											type="number" name="price" class="form-control"
											id="formGroupExampleInput2" placeholder="Price" required>
									</div>
									<div class="form-group">
										<label for="formGroupExampleInput2">Description</label> <input
											type="text" name="description" class="form-control"
											id="formGroupExampleInput2" placeholder="Description"
											required>
									</div>
									<div class="form-group">
										<label for="exampleFormControlSelect1">Category</label> <select
											class="form-control" name="category"
											id="exampleFormControlSelect1">
											<option><%=Constants.BEVERAGES%></option>
											<option><%=Constants.VEGETABLES%></option>
											<option><%=Constants.FRUITS%></option>
											<option><%=Constants.MEATS%></option>
											<option><%=Constants.FISH%></option>
											<option><%=Constants.GROCERY%></option>
										</select>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-dismiss="modal">Close</button>
						<input type="submit" value="Save" class="btn btn-primary">
					</div>
				</form>
			</div>
		</div>
	</div>
	<!--Modal-->
	<!--Modal-->
	<div class="modal fade" id="exampleModalCenter" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalLongTitle"
		aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered modal-lg"
			role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLongTitle">Update</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<form method="POST" action="UpdateProduct"
					enctype='multipart/form-data'>
					<div class="modal-body">
						<div class="container">
							<div class="row">
								<div class="col-sm">
									<img alt="" class="modalimg mb-3" id="blahUpdate"
										src="images/thumbnail.jpg"> <input type='file'
										name="image" onchange="readURLupdate(this);" />
								</div>
								<div class="col-sm">
									<div class="form-group">
										<label for="formGroupExampleInput">Product name</label> <input
											type="text" class="form-control" id="formGroupExampleInput"
											placeholder="Product name" value="" name="name">
									</div>
									<div class="form-group">
										<label for="formGroupExampleInput2">Price</label> <input
											type="number" class="form-control"
											id="formGroupExampleInput2" placeholder="Price" value=""
											name="price">
									</div>
									<div class="form-group">
										<label for="formGroupExampleInput2">Description</label> <input
											type="text" class="form-control" id="formGroupExampleInput2"
											placeholder="Description" value="" name="description">
									</div>
									<div class="form-group">
										<label for="exampleFormControlSelect1">Category</label> <select
											class="form-control" id="selectCategory" name="category">
											<option><%=Constants.BEVERAGES%></option>
											<option><%=Constants.VEGETABLES%></option>
											<option><%=Constants.FRUITS%></option>
											<option><%=Constants.MEATS%></option>
											<option><%=Constants.FISH%></option>
											<option><%=Constants.GROCERY%></option>
										</select>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="modal-footer">
						<input type="hidden" value="" name="productID">
						<button type="button" class="btn btn-secondary"
							data-dismiss="modal">Close</button>
						<input type="submit" value="Save" class="btn btn-primary">
					</div>
				</form>
			</div>
		</div>
	</div>
	<!--Modal-->
	<!--Modal-->
	<div class="modal" tabindex="-1" role="dialog" id=barcodemodal>
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">Barcode</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<img alt="" class="modalimg" src="images/thumbnail.jpg">
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
	<!--Modal-->
	<div class="wrapper">
		<!-- Sidebar  -->
		<nav id="sidebar">
			<ul class="list-unstyled components">
				<a href="home.jsp"><p><%=session.getAttribute("name")%></p></a>
				<li><a href="dashboard.jsp"><i class="fas fa-chart-line"></i>
						Dashboard</a></li>
				<li><a href="billing.jsp"><i class="fas fa-calculator"></i>
						Billing</a></li>
				<li><a href="distributor.jsp"> <i
						class="fas fa-address-card"></i> Distributors
				</a></li>
				<li><a href="employee.jsp"><i class="fas fa-user-tie"></i>
						Employee</a></li>
				<li><a href="discount.jsp"><i class="fas fa-percent"></i>
						Discounts</a></li>
				<li><a href="purchase.jsp"><i class="fas fa-money-bill"></i>
						Purchase</a></li>
				<li><a href="order.jsp"><i class="fas fa-truck"></i> Orders</a></li>
				<li><a href="stock.jsp"><i class="fas fa-boxes"></i> Stock</a></li>
				<li><a href="sales.jsp"><i class="fas fa-balance-scale"></i>
						Sales</a></li>
				<li><a href="product.jsp"><i class="fas fa-archive"></i>
						Products</a></li>
				<li><a href="store.jsp"><i class="fas fa-building"></i>
						Store</a></li>
				<li><a href="payments.jsp"><i class="fas fa-money-bill"></i>
						Payments</a></li>
				<li><a href="endOfDay.jsp"><i class="fas fa-clock"></i> End
						of day</a></li>
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
					<form class="form-inline" action="Search">
						<div class="form-group mx-sm-3">
							<input type="text" class="form-control" id="inputPassword2"
								placeholder="Product name" name="search" required>
						</div>
						<button type="submit" class="btn btn-primary">Search</button>
					</form>
					<button type="submit" class="btn btn-success" data-toggle="modal"
						data-target="#exampleModalCenterForAdd">+ New product</button>
				</div>
			</nav>
			<div class="container-fluid">
				<div class="px-lg-5">

					<!-- For demo purpose -->

					<!-- End -->

					<div class="row">
						<%
						if (request.getAttribute("searchResult") != null) {
							ArrayList<Product> result = (ArrayList<Product>) request.getAttribute("searchResult");
							for (Product p : result) {
								String img = p.getImage().isEmpty() ? "images/thumbnail.jpg" : "data:image/jpg;base64," + p.getImage();
								String barcode = "data:image/jpg;base64," + p.getBarcode();
						%>
						<!-- Gallery item -->
							<div class="col-xl-3 col-lg-4 col-md-6 mb-4">
							<div class="bg-white rounded shadow-sm">
								<img src=<%=img%> alt="" class="img-fluid card-img-top">
								<div class="p-2">
									<h5>
										<a href="#exampleModalCenter" data-toggle="modal"
											data-target="#exampleModalCenter"
											data-product-id=<%=p.getProductID()%>
											data-product-img=<%=img%>
											data-product-name=<%=p.getName().replaceAll("\\s", "")%>
											data-product-barcode=<%=barcode%>
											data-product-price=<%=p.getPrice()%>
											data-product-desc=<%=p.getDescription()%>
											data-product-category=<%=p.getCategory()%> class="text-dark"><%=p.getName()%></a>
									</h5>
									<p class="mb-2"><%=p.getPrice()%></p>
									<p class="mb-2"><%=p.getDescription()%></p>
									<p class="mb-2"><%=p.getProductID()%></p>
									<div class="container">
										<div class="row">
											<div class="col-sm">
												<form method="POST" action="DeleteProduct">
													<button type="submit" class="btn btn-primary">Delete</button>
													<input type="hidden" value=<%=p.getProductID()%>
														name="productID">
												</form>
											</div>
											<div class="col-sm">
												<a href="#barcodemodal" data-toggle="modal"
													data-product-barcode=<%=barcode%>><button type="button"
														class="btn btn-dark">Barcode</button></a>
											</div>
										</div>
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
						String img = p.getImage().isEmpty() ? "images/thumbnail.jpg" : "data:image/jpg;base64," + p.getImage();
						String barcode = "data:image/jpg;base64," + p.getBarcode();
						%>
						<!-- Gallery item -->
						<div class="col-xl-3 col-lg-4 col-md-6 mb-4">
							<div class="bg-white rounded shadow-sm">
								<img src=<%=img%> alt="" class="img-fluid card-img-top">
								<div class="p-2">
									<h5>
										<a href="#exampleModalCenter" data-toggle="modal"
											data-target="#exampleModalCenter"
											data-product-id=<%=p.getProductID()%>
											data-product-img=<%=img%>
											data-product-name=<%=p.getName().replaceAll("\\s", "")%>
											data-product-barcode=<%=barcode%>
											data-product-price=<%=p.getPrice()%>
											data-product-desc=<%=p.getDescription()%>
											data-product-category=<%=p.getCategory()%> class="text-dark"><%=p.getName()%></a>
									</h5>
									<p class="mb-2"><%=p.getPrice()%></p>
									<p class="mb-2"><%=p.getDescription()%></p>
									<p class="mb-2"><%=p.getProductID()%></p>
									<div class="container">
										<div class="row">
											<div class="col-sm">
												<form method="POST" action="DeleteProduct">
													<button type="submit" class="btn btn-primary">Delete</button>
													<input type="hidden" value=<%=p.getProductID()%>
														name="productID">
												</form>
											</div>
											<div class="col-sm">
												<a href="#barcodemodal" data-toggle="modal"
													data-product-barcode=<%=barcode%>><button type="button"
														class="btn btn-dark">Barcode</button></a>
											</div>
										</div>
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

		function readURL(input) {
			if (input.files && input.files[0]) {
				var reader = new FileReader();

				reader.onload = function(e) {
					$('#blah').attr('src', e.target.result);
				};

				reader.readAsDataURL(input.files[0]);
			}
		}
		function readURLupdate(input) {
			if (input.files && input.files[0]) {
				var reader = new FileReader();

				reader.onload = function(e) {
					$('#blahUpdate').attr('src', e.target.result);
				};

				reader.readAsDataURL(input.files[0]);
			}
		}
		$('#exampleModalCenter')
				.on(
						'show.bs.modal',
						function(e) {

							//get data-id attribute of the clicked element
							var productID = $(e.relatedTarget).data(
									'product-id');
							var productImg = $(e.relatedTarget).data(
									'product-img');
							var productPrice = $(e.relatedTarget).data(
									'product-price');
							var productDesc = $(e.relatedTarget).data(
									'product-desc');
							var productCategory = $(e.relatedTarget).data(
									'product-category');
							var productName = $(e.relatedTarget).data(
									'product-name');
							//populate the textbox
							console.log(productName);
							$(e.currentTarget).find('input[name="productID"]')
									.val(productID);
							$(e.currentTarget).find('img').attr('src',
									productImg);
							$(e.currentTarget).find('input[name="name"]').val(
									productName);
							$(e.currentTarget).find('input[name="price"]').val(
									productPrice);
							$(e.currentTarget)
									.find('input[name="description"]').val(
											productDesc);
							$(e.currentTarget).find('select[name="category"]')
									.val(productCategory);
						});
		$('#barcodemodal').on('show.bs.modal', function(e) {

			//get data-id attribute of the clicked element
			var barcode = $(e.relatedTarget).data('product-barcode');

			//populate the textbox

			$(e.currentTarget).find('img').attr('src', barcode);

		});
	</script>
</body>

</html>