/* inventorBarChart.js */
$(document).ready(function(){
	$.ajax({
		type : "GET", 
		url  : "/statistics/inventorBarChart",
		dataType : 'html',
		success : function(inventorBarChartHtml){
			//alert("hello");
			$('#inventorBarChart').html(inventorBarChartHtml);

		},
		error : function(){
			console.log('something wrong happened');
		}
	}).done(function(){
		console.log("ending");
	});
});