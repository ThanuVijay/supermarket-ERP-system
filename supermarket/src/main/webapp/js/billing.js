var count = 0;
var total = 0;
var items = [];
var tempInvoice = [];
var recentID = -1;
$(document).ready(function() {
	$("#add").click(function() {
		var productID = $("#productID").val();
		var quantity = $("#quantity").val();

		if (productID === "" || quantity === "" || isNaN(quantity)) {
			alert("invalid input");
		} else {
			$.ajax({

				// The URL for the request
				url: "GetProductToInvoice",

				// The data to send (will be converted to a query string)
				data: {
					productID: productID,
					quantity: quantity
				},

				// Whether this is a POST or GET request
				type: "POST",

				// The type of data we expect back
				dataType: "json",
				success: function(prod) {
					if (jQuery.isEmptyObject(prod)) {
						alert("wrong id");
					} else {
						if (tempInvoice.includes(productID)) {
							var find = items.find(function(element) {
								return element["productID"] === recentID;
							});
							var q = Number(find["quantity"]);
							find["quantity"] = Number(quantity) + q;
							var priceForItems = Number(prod["price"]) * Number(quantity);
							var priceAfterDiscount = ((100 - Number(prod["discount"])) / 100) * priceForItems;
							find["price"] = Number(find["price"]) + priceAfterDiscount;
							var qcell = document.getElementById(productID);
							var pcell = document.getElementById(productID + "price");
							qcell.innerHTML = Number(quantity) + q;
							pcell.innerHTML = Number(find["price"]);
							total += priceAfterDiscount;

						} else {
							var item = {};
							recentID = productID;
							tempInvoice.push(productID);
							var table = document.getElementById("invoice");
							var row = table.insertRow(1 + count);
							var rowcount = row.insertCell(0);
							var product = row.insertCell(1);
							var productQuantity = row.insertCell(2);
							productQuantity.id = productID;
							var price = row.insertCell(3);
							price.id = productID + "price";
							var discount = row.insertCell(4);
							var priceForItems = Number(prod["price"]) * Number(quantity);
							var priceAfterDiscount = ((100 - Number(prod["discount"])) / 100) * priceForItems;
							total += priceAfterDiscount;
							rowcount.innerHTML = count++;
							product.innerHTML = prod["name"];
							productQuantity.innerHTML = quantity;
							price.innerHTML = priceAfterDiscount;
							discount.innerHTML = prod["discount"];
							item["productID"] = productID;
							item["name"] = prod["name"];
							item["quantity"] = Number(quantity);
							item["price"] = priceAfterDiscount;
							items.push(item);
						}
						var t = document.getElementById("total");
						t.innerHTML = total;
					}

				},
				error: function(data) {
					alert("Failed");
				}
			})
		}


	});
});
$(document).ready(function() {
	$("#checkout").click(function() {

		if (items.length === 0) {
			alert("Invoice is empty");
		} else {
			$.ajax({

				// The URL for the request
				url: "CreateInvoice",

				// The data to send (will be converted to a query string)
				data: {
					items: JSON.stringify(items),
					total: total
				},

				// Whether this is a POST or GET request
				type: "POST",

				// The type of data we expect back
				success: function(result) {
					if (result) {
						location.reload();
					}
				},
				error: function(data) {
					alert("Failed");
				}
			})
		}


	});
});
