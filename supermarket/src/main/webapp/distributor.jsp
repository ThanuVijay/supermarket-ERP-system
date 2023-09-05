<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="supermarket.distributor.service.Service"%>
<%@ page import="supermarket.distributor.model.Distributor"%>
<%@ page
	import="supermarket.distributor.model.DistributorWithOrderCount"%>
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

<title>Distributor</title>

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
				<form method="POST" action="NewDistributor">
					<div class="modal-body">

						<div class="form-group">
							<label for="formGroupExampleInput">Name</label> <input
								type="text" class="form-control" id="formGroupExampleInput"
								placeholder="Name" name="name" required>
						</div>
						<div class="form-group">
							<label for="formGroupExampleInput2">Address</label> <input
								type="text" class="form-control" id="formGroupExampleInput2"
								placeholder="Address" name="address" required>
						</div>
						<div class="form-group">
							<label for="formGroupExampleInput2">Phone number</label> <input
								type="tel" class="form-control" id="formGroupExampleInput2"
								placeholder="Phone number" name="phoneNumber" required>
						</div>
						<div class="form-group">
							<label for="formGroupExampleInput2">Email</label> <input
								type="text" class="form-control" id="formGroupExampleInput2"
								placeholder="Email" name="email" required>
						</div>

					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-dismiss="modal">Close</button>
						<button type="submit" class="btn btn-primary">Save
							changes</button>
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
					<h5 class="modal-title" id="exampleModalLongTitle">Update
						details</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<form method="POST" action="UpdateDistributor">
					<div class="modal-body">

						<div class="form-group">
							<label for="formGroupExampleInput">Name</label> <input
								type="text" class="form-control" id="formGroupExampleInput"
								placeholder="Name" name="name">
						</div>
						<div class="form-group">
							<label for="formGroupExampleInput2">Address</label> <input
								type="text" class="form-control" id="formGroupExampleInput2"
								placeholder="Address" name="address">
						</div>
						<div class="form-group">
							<label for="formGroupExampleInput2">Phone number</label> <input
								type="tel" class="form-control" id="formGroupExampleInput2"
								placeholder="Phone number" name="phoneNumber">
						</div>
						<div class="form-group">
							<label for="formGroupExampleInput2">Email</label> <input
								type="text" class="form-control" id="formGroupExampleInput2"
								placeholder="Email" name="email">
						</div>

					</div>
					<div class="modal-footer">
						<input type="hidden" value="" name="distID">
						<button type="button" class="btn btn-secondary"
							data-dismiss="modal">Close</button>
						<button type="submit" class="btn btn-primary">Save
							changes</button>
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
				</div>
			</nav>
			<div class="container">
				<div class="row">
					<div class="col-sm">
						<form method="POST" action="SearchDistributor" class="mb-5">
							<div class="form-row">
								<div class="col-6">
									<input type="text" class="form-control"
										placeholder="Distributor name" name="search" required>
								</div>
								<div class="col-2">
									<button type="submit" class="btn btn-primary">Search</button>
								</div>
							</div>
						</form>
					</div>
					<div class="col-sm">
						<button type="submit" class="btn btn-success" data-toggle="modal"
							data-target="#exampleModalCenterForAdd">+ Add
							distributor</button>
					</div>
				</div>
			</div>
			<div class="container">
				<div class="row">

					<%
					ArrayList<DistributorWithOrderCount> list = Service.getDistributorWithOrderCount();
				    String[] colors = {"warning","success","danger","primary"};
				    int i = 0;
					for (DistributorWithOrderCount d : list) {
					%>
					<div class="col-sm">
						<div class="card text-black bg-<%=colors[i]%> mb-3 font-weight-bold"
							style="max-width: 10rem;">
							<div class="card-header"><%=d.getName()%></div>
							<div class="card-body">
								<h2 class="card-title"><%=d.getOrderCount()%> Orders</h2>
							</div>
						</div>
					</div>
					<%
					i++;
					}
					%>


				</div>
			</div>
			<table class="table table-striped">
				<thead>
					<tr>
						<th scope="col">#</th>
						<th scope="col">Name</th>
						<th scope="col">Address</th>
						<th scope="col">Phone number</th>
						<th scope="col">Email</th>
						<th scope="col"></th>
					</tr>
				</thead>
				<tbody>
					<%
					if (request.getAttribute("searchDistributor") != null) {
						ArrayList<Distributor> result = (ArrayList<Distributor>) request.getAttribute("searchDistributor");
						int count = 1;
						for (Distributor d : result) {
					%>
					<tr>
						<th scope="row"><%=count%></th>
						<td><a href="#exampleModalCenter" data-toggle="modal"
							data-target="#exampleModalCenter"
							data-dist-id=<%=d.getDistributorID()%>
							data-dist-name=<%=d.getDistributorName()%>
							data-dist-address=<%=d.getAddress()%>
							data-dist-phonenumber=<%=d.getPhoneNumber()%>
							data-dist-email=<%=d.getEmail()%> class="text-dark"><%=d.getDistributorName()%></a></td>
						<td><%=d.getAddress()%></td>
						<td><%=d.getPhoneNumber()%></td>
						<td><%=d.getEmail()%></td>
						<td><form method="POST" action="DeleteDistributor">
								<button type="submit" class="btn btn-primary">Delete</button>
								<input type="hidden" value=<%=d.getDistributorID()%>
									name="distID">
							</form></td>
					</tr>
					<%
					count++;
					}
					} else {
					ArrayList<Distributor> orders = Service.getDistributors();
					int count = 1;
					for (Distributor d : orders) {
					%>
					<tr>
						<th scope="row"><%=count%></th>
						<td><a href="#exampleModalCenter" data-toggle="modal"
							data-target="#exampleModalCenter"
							data-dist-id=<%=d.getDistributorID()%>
							data-dist-name=<%=d.getDistributorName()%>
							data-dist-address=<%=d.getAddress()%>
							data-dist-phonenumber=<%=d.getPhoneNumber()%>
							data-dist-email=<%=d.getEmail()%> class="text-dark"><%=d.getDistributorName()%></a></td>
						<td><%=d.getAddress()%></td>
						<td><%=d.getPhoneNumber()%></td>
						<td><%=d.getEmail()%></td>
						<td><form method="POST" action="DeleteDistributor">
								<button type="submit" class="btn btn-primary">Delete</button>
								<input type="hidden" value=<%=d.getDistributorID()%>
									name="distID">
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
		$('#exampleModalCenter')
				.on(
						'show.bs.modal',
						function(e) {

							//get data-id attribute of the clicked element
							var distID = $(e.relatedTarget).data('dist-id');
							var name = $(e.relatedTarget).data('dist-name');
							var address = $(e.relatedTarget).data(
									'dist-address');
							var phonenumber = $(e.relatedTarget).data(
									'dist-phonenumber');
							var email = $(e.relatedTarget).data('dist-email');
							//populate the textbox
							$(e.currentTarget).find('input[name="distID"]')
									.val(distID);
							$(e.currentTarget).find('input[name="name"]').val(
									name);
							$(e.currentTarget).find('input[name="address"]')
									.val(address);
							$(e.currentTarget)
									.find('input[name="phoneNumber"]').val(
											phonenumber);
							$(e.currentTarget).find('input[name="email"]').val(
									email);

						});
	</script>
</body>

</html>