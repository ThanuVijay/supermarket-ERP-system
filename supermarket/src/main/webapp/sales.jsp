<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.math.BigDecimal"%>
<%@ page import="supermarket.sales.service.Service"%>
<%@ page import="supermarket.sales.model.Invoice"%>
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

<title>Sales</title>

<!-- Bootstrap CSS CDN -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css"
	integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4"
	crossorigin="anonymous">
<!-- Our Custom CSS -->
<link rel="stylesheet" href="style.css">

<script defer
	src="https://use.fontawesome.com/releases/v5.0.13/js/solid.js"
	integrity="sha384-tzzSw1/Vo+0N5UhStP3bvwWPq+uvzCMfrN1fEFe+xBmv1C/AtVX5K0uZtmcHitFZ"
	crossorigin="anonymous"></script>
<script defer
	src="https://use.fontawesome.com/releases/v5.0.13/js/fontawesome.js"
	integrity="sha384-6OIrr52G08NpOFSZdxxz1xdNSndlD4vdcf/q2myIUVO0VsqaGHJsB0RaBE01VTOY"
	crossorigin="anonymous"></script>

<!-- Font Awesome JS -->
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
					<form method="POST" action="SearchInvoiceByID" class="form-inline">
						<div class="form-group mx-sm-3">
							<input type="text" class="form-control" id="inputPassword2"
								placeholder="Invoice ID" name="invoiceid" required>
						</div>
						<button type="submit" class="btn btn-primary">Search</button>
					</form>
				</div>
			</nav>
			<div class="container">
				<div class="row">
					<div class="col-sm">
						<form method="POST" action="SearchInvoiceByDate"
							class="form-inline mb-2">
							<div class="form-group mr-2">
								<input type="date" class="form-control" id="salesdate"
									name="date" value="" required>
							</div>
							<button type="submit" class="btn btn-primary">Search
								invoice</button>
						</form>
					</div>
					<div class="col-sm">
						<button id="datebutton" class="btn btn-primary">Generate
							chart</button>
					</div>
				</div>
			</div>
			<div class="container">
				<div class="row">
					<div class="col-sm">
						<canvas id="salesLastSevenDays"
							style="width: 100%; max-width: 600px"></canvas>
					</div>
					<div class="col-lg">
						<canvas id="myChart" style="width: 100%; max-width: 1200px"></canvas>
					</div>
				</div>
			</div>

			<div class="card text-white bg-info mb-3" style="max-width: 18rem;">
				<div class="card-header">Total sales</div>
				<div class="card-body">
					<%
					if (request.getAttribute("totalSalesByDate") != null) {
						BigDecimal total = (BigDecimal) request.getAttribute("totalSalesByDate");
					%>
					<h5 class="card-title"><%=total%></h5>
					<%
					} else {
					BigDecimal total = Service.totalSales();
					%>
					<h5 class="card-title"><%=total%></h5>
					<%
					}
					%>

				</div>
			</div>
			<table class="table table-striped">
				<thead>
					<tr>
						<th scope="col">Invoice</th>
					</tr>
				</thead>
				<thead>
					<tr>
						<th scope="col">#</th>
						<th scope="col">Invoice ID</th>
						<th scope="col">Total</th>
						<th scope="col">Date</th>
						<th scope="col">Time</th>
						<th scope="col"></th>
					</tr>
				</thead>
				<tbody>
					<%
					if (request.getAttribute("searchInvoiceByIDresults") != null) {
						Invoice i = (Invoice) request.getAttribute("searchInvoiceByIDresults");
					%>
					<tr>
						<th scope="row">1</th>
						<td><%=i.getInvoiceId()%></td>
						<td><%=i.getTotal()%></td>
						<td><%=i.getDateTime()%></td>
						<td><form method="POST" action="">
								<button type="submit" class="btn btn-primary">Delete</button>
								<input type="hidden" value=<%=i.getInvoiceId()%>
									name="invoiceID">
							</form></td>
					</tr>
					<%
					} else if (request.getAttribute("searchInvoiceByDateresults") != null) {
					ArrayList<Invoice> result = (ArrayList<Invoice>) request.getAttribute("searchInvoiceByDateresults");
					int count = 1;
					for (Invoice i : result) {
					%>
					<tr>
						<th scope="row"><%=count%></th>
						<td><%=i.getInvoiceId()%></td>
						<td><%=i.getTotal()%></td>
						<td><%=i.getDateTime()%></td>
						<td><form method="POST" action="DeleteInvoiceFromSales">
								<button type="submit" class="btn btn-primary">Delete</button>
								<input type="hidden" value=<%=i.getInvoiceId()%>
									name="invoiceID">
							</form></td>
					</tr>
					<%
					count++;
					}
					} else {
					ArrayList<Invoice> stocks = Service.getInvoices();
					int count = 1;
					for (Invoice i : stocks) {
					%>
					<tr>
						<th scope="row"><%=count%></th>
						<td><%=i.getInvoiceId()%></td>
						<td><%=i.getTotal()%></td>
						<td><%=i.getDateTime()%></td>
						<td><form method="POST" action="DeleteInvoiceFromSales">
								<button type="submit" class="btn btn-primary">Delete</button>
								<input type="hidden" value=<%=i.getInvoiceId()%>
									name="invoiceID">
							</form></td>
					</tr>
					<%
					count++;
					}
					}
					%>
				</tbody>
			</table>
		</div>
	</div>

	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.js"></script>
	<!-- jQuery CDN - Slim version (=without AJAX) -->
	<script type="text/javascript"
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script type="text/javascript" src="js/salesChart.js"></script>
	<script type="text/javascript" src="js/salesLastSevenDays.js"></script>

	<script type="text/javascript">​
    $(document).ready(function() {
      $('#sidebarCollapse').on('click', function() {
        $('#sidebar').toggleClass('active');
      });
    });
  </script>
</body>

</html>