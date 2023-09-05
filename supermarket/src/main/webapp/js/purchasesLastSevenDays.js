$(document).ready(function() {
	$.ajax({

		// The URL for the request
		url: "PurchasesLastSevenDays",

		// The data to send (will be converted to a query string)

		// Whether this is a POST or GET request
		type: "POST",

		// The type of data we expect back
		dataType: "json",
		success: function(result) {
			var xValues = [];
			var yValues = [];
			var barColors = [];
			for (const item in result) {
				xValues.push(item);
				yValues.push(result[item]);
				barColors.push("red");
			}
			new Chart("purchasesLastSevenDays", {
				type: "bar",
				data: {
					labels: xValues,
					datasets: [{
						backgroundColor: barColors,
						data: yValues
					}]
				}, options: {
					legend: { display: false },
					title: {
						display: true,
						text: "Purchases last seven days"
					}
				}
			});
		},
		error: function(data) {
			alert("Failed");
		}
	})
});
