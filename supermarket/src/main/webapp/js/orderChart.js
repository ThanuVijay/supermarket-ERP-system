$(document).ready(function() {
	$.ajax({

		// The URL for the request
		url: "OrderChart",

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
			new Chart("orderChart", {
				type: "bar",
				data: {
					labels: xValues,
					datasets: [{
						backgroundColor: barColors,
						data: yValues
					}]
				},options: {
					legend: { display: false },
					title: {
						display: true,
						text: "Pending orders"
					}
				}
			});
		},
		error: function(data) {
			alert("Failed");
		}
	})
});
