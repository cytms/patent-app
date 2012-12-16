/* inventorBarChart.js */
$(document).ready(function(){
	$.ajax({
		type : "GET", 
		url  : "/statistics/inventorBarChart",
		dataType : 'html',
		data : { 'assigneeName': $('#assigneeName').attr('value'),
				 'beginTime': $('#beginTime').attr('value'),
				 'endTime': $('#endTime').attr('value') },
		success : function(inventorBarChartHtml){
			//alert("hello");
			console.log(inventorBarChartHtml);
			$('#inventorBarChart').html(inventorBarChartHtml);

		},
		error : function(){
			console.log('something wrong happened');
		}
	}).done(function(){
		console.log("ending");
	});
});