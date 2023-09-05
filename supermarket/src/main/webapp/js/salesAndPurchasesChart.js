
$(document).ready(function() {
	$.ajax({

		// The URL for the request
		url: "SalesAndPurchasesChart",

		// The data to send (will be converted to a query string)

		// Whether this is a POST or GET request
		type: "POST",

		// The type of data we expect back
		dataType: "json",
		success: function(result) {
			var xValues = [];
			var sales = [];
			var purchases = [];
			for (const item in result) {
				xValues.push(item);
				sales.push(result[item][0]);
				purchases.push(result[item][1]);
			}
			new Chart("myChart", {
				type: "line",
				data: {
					labels: xValues,
					datasets: [{
						data: sales,
						borderColor: "red",
						fill: false
					}, {
						data: purchases,
						borderColor: "green",
						fill: false
					},]
				},
				options: {
					legend: { display: false },
					title: {
						display: true,
						text: "Sales and purchases last seven days"
					}
				}
			});
		},
		error: function(data) {
			alert("Failed");
		}
	})
});

