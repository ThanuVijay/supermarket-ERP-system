

$(document).ready(function() {
	$.ajax({

		// The URL for the request
		url: "SalesChart",

		// The data to send (will be converted to a query string)

		// Whether this is a POST or GET request
		type: "POST",

		// The type of data we expect back
		dataType: "json",
		success: function(result) {
			var xValues = [];
			var yValues = [];
			var barColors = ["#b91d47", "#00aba9", "#2b5797"];
			for (const item in result) {
				xValues.push(item);
				yValues.push(result[item]);
			}
			new Chart("myChart", {
				type: "pie",
				data: {
					labels: xValues,
					datasets: [{
						backgroundColor: barColors,
						data: yValues
					}]
				},
				options: {
					title: {
						display: true,
						text: ""
					}
				}
			});
		},
		error: function(data) {
			alert("Failed");
		}
	})
});
$(document).ready(function() {
	$("#datebutton").click(function() {

		var date = $("#salesdate").val();

		if (date === "") {
			alert("Date is empty");
			
		} else {
			$.ajax({

				// The URL for the request
				url: "SalesChartByDate",

				// The data to send (will be converted to a query string)
				data: {
					date: date
				},

				// Whether this is a POST or GET request
				type: "POST",

				// The type of data we expect back
				dataType: "json",

				success: function(result) {
					var xValues = [];
					var yValues = [];
					var barColors = ["#b91d47", "#00aba9", "#2b5797"];
					for (const item in result) {
						xValues.push(item);
						yValues.push(result[item]);
					}
					new Chart("myChart", {
						type: "pie",
						data: {
							labels: xValues,
							datasets: [{
								backgroundColor: barColors,
								data: yValues
							}]
						},
						options: {
							title: {
								display: true,
								text: "World Wide Wine Production 2018"
							}
						}
					});
				},
				error: function(data) {
					alert("Failed");
				}
			})
		}
	});
});

