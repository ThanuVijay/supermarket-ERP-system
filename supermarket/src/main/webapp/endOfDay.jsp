<%@page import="supermarket.Constants"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="supermarket.store.service.Service"%>
<%@ page import="supermarket.store.model.Expense"%>
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

<title>End of Day</title>

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
				</div>
			</nav>
			<div class="container p-3" style="border: 1px solid #cecece;">
				<div class="row mb-4">
					<div class="col-sm">
						<img src="images/currencies_and_coins/20rupee.jpg"
							class="img-fluid" alt="20rs Currency">
					</div>
					<div class="col-sm">
						<input class="form-control" type="number" placeholder="" value=0
							id=20>
					</div>
					<div class="col-sm">
						<img src="images/currencies_and_coins/50rupee.jpg"
							class="img-fluid" alt="20rs Currency">
					</div>
					<div class="col-sm">
						<input class="form-control" type="number" placeholder="" value=0
							id=50>
					</div>
					<div class="col-sm">
						<img src="images/currencies_and_coins/100rupee.jpg"
							class="img-fluid" alt="20rs Currency">
					</div>
					<div class="col-sm">
						<input class="form-control" type="number" placeholder="" value=0
							id=100>
					</div>
				</div>
				<div class="row mb-4">
					<div class="col-sm">
						<img src="images/currencies_and_coins/500rupee.jpg"
							class="img-fluid" alt="20rs Currency">
					</div>
					<div class="col-sm">
						<input class="form-control" type="number" placeholder="" value=0
							id=500>
					</div>
					<div class="col-sm">
						<img src="images/currencies_and_coins/1000rupee.jpg"
							class="img-fluid" alt="20rs Currency">
					</div>
					<div class="col-sm">
						<input class="form-control" type="number" placeholder="" value=0
							id=1000>
					</div>
					<div class="col-sm">
						<img src="images/currencies_and_coins/5000rupee.jpg"
							class="img-fluid" alt="20rs Currency">
					</div>
					<div class="col-sm">
						<input class="form-control" type="number" placeholder="" value=0
							id=5000>
					</div>
				</div>
				<div class="row">
					<div class="col-sm-1">
						<img src="images/currencies_and_coins/1rupee.jpg"
							class="img-fluid" alt="20rs Currency">
					</div>
					<div class="col-sm">
						<input class="form-control" type="number" placeholder="" value=0
							id=1>
					</div>
					<div class="col-sm-1">
						<img src="images/currencies_and_coins/2rupee.jpg"
							class="img-fluid" alt="20rs Currency">
					</div>
					<div class="col-sm">
						<input class="form-control" type="number" placeholder="" value=0
							id=2>
					</div>
					<div class="col-sm-1">
						<img src="images/currencies_and_coins/5rupee.jpg"
							class="img-fluid" alt="20rs Currency">
					</div>
					<div class="col-sm">
						<input class="form-control" type="number" placeholder="" value=0
							id=5>
					</div>
					<div class="col-sm-1">
						<img src="images/currencies_and_coins/10rupee.jpg"
							class="img-fluid" alt="20rs Currency">
					</div>
					<div class="col-sm">
						<input class="form-control" type="number" placeholder="" value=0
							id=10>
					</div>
				</div>
			</div>
			<div class="container" id="balanceCard">
				<div class="row">
					<div class="col-sm">
						<button type="button" class="btn btn-success mb-5"
							onclick="calculateBalance()">Submit</button>
					</div>
				</div>
				<div class="row">
					<div class="col-sm">
						<div class="card text-white bg-primary mb-3"
							style="max-width: 18rem;">
							<div class="card-header">Total Sales</div>
							<div class="card-body">
								<h5 class="card-title" id="total"></h5>
							</div>
						</div>
					</div>
					<div class="col-sm">
						<div class="card text-white bg-primary mb-3"
							style="max-width: 18rem;">
							<div class="card-header">Calculated</div>
							<div class="card-body">
								<h5 class="card-title" id="calculated"></h5>
							</div>
						</div>
					</div>
					<div class="col-sm">
						<div class="card text-white bg-primary mb-3"
							style="max-width: 18rem;">
							<div class="card-header">Balance</div>
							<div class="card-body">
								<h5 class="card-title" id="balance"></h5>
							</div>
						</div>
					</div>
				</div>
			</div>


		</div>
	</div>
	<script type="text/javascript"
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
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
		function calculateBalance() {
			var totalSales = <%=supermarket.sales.service.Service.totalSales()%>
			if(totalSales === null){
				totalSales = 0;
			}
		var one = parseInt(document.getElementById("1").value);
			var two = parseInt(document.getElementById("2").value * 2);
			var five = parseInt(document.getElementById("5").value * 5);
			var ten = parseInt(document.getElementById("10").value * 10);
			var twenty = parseInt(document.getElementById("20").value * 20);
			var fifty = parseInt(document.getElementById("50").value * 50);
			var hundred = parseInt(document.getElementById("100").value * 100);
			var fivehundred = parseInt(document.getElementById("500").value * 500);
			var onethousand = parseInt(document.getElementById("1000").value * 1000);
			var fivethousand = parseInt(document.getElementById("5000").value * 5000);
			var calculatedSales = one + two + five + ten + twenty + fifty
					+ hundred + fivehundred + onethousand + fivethousand;
			document.getElementById("total").innerHTML = totalSales;
			document.getElementById("calculated").innerHTML = calculatedSales;
			document.getElementById("balance").innerHTML = calculatedSales
					- totalSales;
		}
	</script>
</body>

</html>